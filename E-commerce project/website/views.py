import uuid
import os
import logging
from flask import (Blueprint, render_template, flash, redirect, request, jsonify, url_for, current_app, abort)
from flask_login import login_required, current_user
from .models import Product, Cart, Order, User, CATEGORY_CHOICES
from . import db

logger = logging.getLogger(__name__)

views = Blueprint("views", __name__)

PAYFAST_MERCHANT_ID = os.environ.get("PAYFAST_MERCHANT_ID", "10000100")
PAYFAST_MERCHANT_KEY = os.environ.get("PAYFAST_MERCHANT_KEY", "46f0cd694581a")
PAYFAST_URL = "https://sandbox.payfast.co.za/eng/process"


@views.route("/")
def home():
    items = (
        Product.query.filter_by(is_active=True, is_flagship=False)
        .order_by(Product.date_added.desc())
        .all()
    )

    flagship = Product.query.filter_by(is_flagship=True, is_active=True).first()

    if current_user.is_authenticated and current_user.customer_profile:
        cart = Cart.query.filter_by(
            customer_link=current_user.customer_profile.id
        ).all()
    else:
        cart = []

    return render_template("home.html", items=items, flagship=flagship, cart=cart)


@views.route("/add-to-cart/<int:item_id>")
@login_required
def add_to_cart(item_id):
    if not current_user.customer_profile:
        logger.warning(
            "Unauthorized non-customer tried adding item to cart",
            extra={"user_id": current_user.id},
        )
        flash("Only customer accounts can add items to the cart.", category="error")
        return redirect(request.referrer or "/")

    customer_id = current_user.customer_profile.id
    item_to_add = Product.query.get_or_404(item_id)

    if not item_to_add.is_active:
        flash("This item is no longer available.", category="error")
        return redirect(request.referrer or "/")

    item_exists = Cart.query.filter_by(
        product_link=item_id, customer_link=customer_id
    ).first()

    if item_exists:
        try:
            item_exists.quantity += 1
            db.session.commit()
            logger.info(
                "Updated item quantity in cart",
                extra={
                    "customer_id": customer_id,
                    "item_id": item_id,
                    "new_quantity": item_exists.quantity,
                },
            )
            flash(
                f"Quantity of {item_exists.product.product_name} updated.",
                category="success",
            )
        except Exception as e:
            db.session.rollback()
            logger.error(
                "Failed to update product quantity",
                extra={"customer_id": customer_id, "item_id": item_id, "error": str(e)},
            )
            flash("Failed to update product quantity.", category="error")
        return redirect(request.referrer or "/")

    new_cart_item = Cart(
        quantity=1, product_link=item_to_add.id, customer_link=customer_id
    )

    try:
        db.session.add(new_cart_item)
        db.session.commit()
        logger.info(
            "Added new item to cart",
            extra={"customer_id": customer_id, "item_id": item_id},
        )
        flash(f"{item_to_add.product_name} added to cart!", category="success")
    except Exception as e:
        db.session.rollback()
        logger.error(
            "Failed to add item to cart",
            extra={"customer_id": customer_id, "item_id": item_id, "error": str(e)},
        )
        flash("Failed to add item to cart.", category="error")

    return redirect(request.referrer or "/")


@views.route("/cart", methods=["GET", "POST"])
@login_required
def show_cart():
    if not current_user.customer_profile:
        flash("Only customer accounts have a shopping cart.", category="error")
        return redirect("/")

    customer = current_user.customer_profile
    cart = Cart.query.filter_by(customer_link=customer.id).all()
    amount = sum(item.product.current_price * item.quantity for item in cart)
    shipping_fee = 200.0 if cart else 0.0
    total = amount + shipping_fee

    if request.method == "POST":
        if not cart:
            flash("Your cart is empty!", category="error")
            return redirect("/cart")

        address = request.form.get("address", "").strip()
        city = request.form.get("city", "").strip()
        postal_code = request.form.get("postal_code", "").strip()

        try:
            customer.address = address
            customer.city = city
            customer.postal_code = postal_code

            db.session.add(customer)
            db.session.commit()
        except Exception as e:
            db.session.rollback()
            logger.error(
                "Could not update customer address profile",
                extra={"customer_id": customer.id, "error": str(e)},
            )
            flash("Could not update address details in your profile.", category="error")

        payment_id = f"ORDER-{uuid.uuid4().hex[:10].upper()}"

        user_display_name = (
            getattr(current_user, "username", None)
            or getattr(current_user, "name", None)
            or getattr(current_user, "first_name", None)
            or "Customer"
        )

        payfast_data = {
            "merchant_id": PAYFAST_MERCHANT_ID,
            "merchant_key": PAYFAST_MERCHANT_KEY,
            "return_url": url_for("views.payment_success", _external=True),
            "cancel_url": url_for("views.payment_cancel", _external=True),
            "notify_url": url_for("views.payfast_notify", _external=True),
            "m_payment_id": payment_id,
            "amount": f"{total:.2f}",
            "item_name": f"Order for {user_display_name}",
            "email_address": getattr(current_user, "email", ""),
        }

        logger.info(
            "Initiating PayFast checkout redirect",
            extra={
                "customer_id": customer.id,
                "payment_id": payment_id,
                "total_amount": total,
            },
        )

        return render_template(
            "payfast_redirect.html", payfast_url=PAYFAST_URL, payfast_data=payfast_data
        )

    return render_template(
        "cart.html", cart=cart, amount=amount, total=total, customer=customer
    )


@views.route("/payment-success")
@login_required
def payment_success():
    customer = current_user.customer_profile
    customer_id = customer.id
    cart = Cart.query.filter_by(customer_link=customer_id).all()

    if cart:
        payment_id = f"PAYFAST-{uuid.uuid4().hex[:8].upper()}"

        for item in cart:
            new_order = Order(
                quantity=item.quantity,
                price=item.product.current_price,
                status="Paid",
                payment_id=payment_id,
                address=customer.address,
                city=customer.city,
                postal_code=customer.postal_code,
                product_link=item.product_link,
                customer_link=customer_id,
            )
            db.session.add(new_order)

            if item.product and item.product.in_stock >= item.quantity:
                item.product.in_stock -= item.quantity

        Cart.query.filter_by(customer_link=customer_id).delete()
        db.session.commit()

        logger.info(
            "Payment successful, order created and cart cleared",
            extra={"customer_id": customer_id, "payment_id": payment_id},
        )

    flash("Payment successful! Your order has been placed.", category="success")
    return redirect(url_for("views.order"))


@views.route("/payment-cancel")
@login_required
def payment_cancel():
    logger.warning(
        "Payment cancelled by customer",
        extra={
            "customer_id": (
                current_user.customer_profile.id
                if current_user.customer_profile
                else None
            )
        },
    )
    flash("Payment was cancelled. Your cart items are still saved.", category="error")
    return redirect("/cart")


@views.route("/payfast-notify", methods=["POST"])
def payfast_notify():
    logger.info("Received background PayFast ITN notification webhook")
    return "", 200


@views.route("/pluscart")
@login_required
def plus_cart():
    if not current_user.customer_profile:
        return jsonify({"error": "Unauthorized profile type"}), 403

    customer_id = current_user.customer_profile.id
    cart_id = request.args.get("cart_id")
    cart_item = Cart.query.get(cart_id)

    if not cart_item or cart_item.customer_link != customer_id:
        return jsonify({"error": "Cart item not found"}), 404

    cart_item.quantity += 1
    db.session.commit()

    cart = Cart.query.filter_by(customer_link=customer_id).all()
    amount = sum(item.product.current_price * item.quantity for item in cart)

    return jsonify(
        {
            "quantity": cart_item.quantity,
            "amount": amount,
            "total": amount + 200 if cart else 0,
        }
    )


@views.route("/minuscart")
@login_required
def minus_cart():
    if not current_user.customer_profile:
        return jsonify({"error": "Unauthorized profile type"}), 403

    customer_id = current_user.customer_profile.id
    cart_id = request.args.get("cart_id")
    cart_item = Cart.query.get(cart_id)

    if not cart_item or cart_item.customer_link != customer_id:
        return jsonify({"error": "Cart item not found"}), 404

    if cart_item.quantity <= 1:
        db.session.delete(cart_item)
        cart_item_quantity = 0
    else:
        cart_item.quantity -= 1
        cart_item_quantity = cart_item.quantity

    db.session.commit()

    cart = Cart.query.filter_by(customer_link=customer_id).all()
    amount = sum(item.product.current_price * item.quantity for item in cart)

    return jsonify(
        {
            "quantity": cart_item_quantity,
            "amount": amount,
            "total": amount + 200 if cart else 0,
        }
    )


@views.route("/removecart")
@login_required
def remove_cart():
    if not current_user.customer_profile:
        return jsonify({"error": "Unauthorized profile type"}), 403

    customer_id = current_user.customer_profile.id
    cart_id = request.args.get("cart_id")
    cart_item = Cart.query.get(cart_id)

    if not cart_item or cart_item.customer_link != customer_id:
        return jsonify({"error": "Cart item not found"}), 404

    db.session.delete(cart_item)
    db.session.commit()

    cart = Cart.query.filter_by(customer_link=customer_id).all()
    amount = sum(item.product.current_price * item.quantity for item in cart)

    return jsonify({"amount": amount, "total": amount + 200 if cart else 0})


@views.route("/orders")
@login_required
def order():
    if not current_user.customer_profile:
        flash("Only customer accounts have order records.", category="error")
        return redirect("/")

    customer_id = current_user.customer_profile.id
    orders = (
        Order.query.filter_by(customer_link=customer_id).order_by(Order.id.desc()).all()
    )
    return render_template("orders.html", orders=orders)


@views.route("/search", methods=["GET", "POST"])
def search():
    cart = []
    if current_user.is_authenticated and current_user.customer_profile:
        cart = Cart.query.filter_by(
            customer_link=current_user.customer_profile.id
        ).all()

    if request.method == "POST":
        search_query = request.form.get("search")
        logger.info("Product search executed", extra={"query": search_query})
        items = Product.query.filter(
            Product.is_active == True, Product.product_name.ilike(f"%{search_query}%")
        ).all()
        return render_template("search.html", items=items, cart=cart)

    return render_template("search.html", items=[], cart=cart)


@views.route("/about")
def about():
    return render_template("about.html")


@views.route("/shop/<string:category_key>")
def category_view(category_key):
    valid_keys = [choice[0] for choice in CATEGORY_CHOICES]
    if category_key not in valid_keys:
        logger.warning(
            "Invalid product category requested", extra={"category_key": category_key}
        )
        abort(404)

    category_label = dict(CATEGORY_CHOICES).get(
        category_key, category_key.replace("-", " ").title()
    )

    products = Product.query.filter_by(category=category_key, is_active=True).all()

    return render_template(
        "category_products.html",
        category_title=category_label,
        products=products,
        category_key=category_key,
    )


##API TESTING
@views.route("/api/home", methods=["GET"])
def api_home():
    items = (
        Product.query.filter_by(is_active=True, is_flagship=False)
        .order_by(Product.date_added.desc())
        .all()
    )
    flagship = Product.query.filter_by(is_flagship=True, is_active=True).first()

    items_list = [
        {
            "id": p.id,
            "product_name": p.product_name,
            "current_price": p.current_price,
            "previous_price": p.previous_price,
            "in_stock": p.in_stock,
            "flash_sale": p.flash_sale,
            "category": p.category,
            "product_picture": p.product_picture,
            "is_flagship": p.is_flagship,
        }
        for p in items
    ]

    flagship_data = None
    if flagship:
        flagship_data = {
            "id": flagship.id,
            "product_name": flagship.product_name,
            "current_price": flagship.current_price,
            "product_picture": flagship.product_picture,
        }

    return jsonify({"items": items_list, "flagship": flagship_data}), 200


@views.route("/api/add-to-cart/<int:item_id>", methods=["POST"])
@login_required
def api_add_to_cart(item_id):
    if not current_user.customer_profile:
        return (
            jsonify({"error": "Only customer accounts can add items to the cart."}),
            403,
        )

    customer_id = current_user.customer_profile.id
    item_to_add = Product.query.get_or_404(item_id)

    if not item_to_add.is_active:
        return jsonify({"error": "This item is no longer available."}), 400

    item_exists = Cart.query.filter_by(
        product_link=item_id, customer_link=customer_id
    ).first()

    if item_exists:
        try:
            item_exists.quantity += 1
            db.session.commit()
            logger.info(
                "API updated item quantity in cart",
                extra={"customer_id": customer_id, "item_id": item_id},
            )
            return (
                jsonify(
                    {
                        "message": f"Quantity of {item_exists.product.product_name} updated.",
                        "quantity": item_exists.quantity,
                    }
                ),
                200,
            )
        except Exception as e:
            db.session.rollback()
            logger.error(
                "API failed to update item quantity",
                extra={"customer_id": customer_id, "item_id": item_id, "error": str(e)},
            )
            return jsonify({"error": str(e)}), 500

    new_cart_item = Cart(
        quantity=1, product_link=item_to_add.id, customer_link=customer_id
    )
    try:
        db.session.add(new_cart_item)
        db.session.commit()
        logger.info(
            "API added item to cart",
            extra={"customer_id": customer_id, "item_id": item_id},
        )
        return jsonify({"message": f"{item_to_add.product_name} added to cart!"}), 201
    except Exception as e:
        db.session.rollback()
        logger.error(
            "API failed to add item to cart",
            extra={"customer_id": customer_id, "item_id": item_id, "error": str(e)},
        )
        return jsonify({"error": str(e)}), 500


@views.route("/api/cart", methods=["GET"])
@login_required
def api_show_cart():
    if not current_user.customer_profile:
        return jsonify({"error": "Only customer accounts have a shopping cart."}), 403

    customer = current_user.customer_profile
    cart = Cart.query.filter_by(customer_link=customer.id).all()
    amount = sum(item.product.current_price * item.quantity for item in cart)
    shipping_fee = 200.0 if cart else 0.0
    total = amount + shipping_fee

    cart_list = [
        {
            "cart_id": item.id,
            "product_id": item.product.id,
            "product_name": item.product.product_name,
            "current_price": item.product.current_price,
            "quantity": item.quantity,
            "subtotal": item.product.current_price * item.quantity,
            "product_picture": item.product.product_picture,
        }
        for item in cart
    ]

    return (
        jsonify(
            {
                "cart": cart_list,
                "amount": amount,
                "shipping_fee": shipping_fee,
                "total": total,
                "customer": {
                    "address": customer.address,
                    "city": customer.city,
                    "postal_code": customer.postal_code,
                },
            }
        ),
        200,
    )


@views.route("/api/pluscart", methods=["POST"])
@login_required
def api_plus_cart():
    if not current_user.customer_profile:
        return jsonify({"error": "Unauthorized profile type"}), 403

    customer_id = current_user.customer_profile.id
    data = request.get_json() or {}
    cart_id = data.get("cart_id") or request.args.get("cart_id")

    cart_item = Cart.query.get(cart_id)
    if not cart_item or cart_item.customer_link != customer_id:
        return jsonify({"error": "Cart item not found"}), 404

    cart_item.quantity += 1
    db.session.commit()

    cart = Cart.query.filter_by(customer_link=customer_id).all()
    amount = sum(item.product.current_price * item.quantity for item in cart)

    return (
        jsonify(
            {
                "quantity": cart_item.quantity,
                "amount": amount,
                "total": amount + 200 if cart else 0,
            }
        ),
        200,
    )


@views.route("/api/minuscart", methods=["POST"])
@login_required
def api_minus_cart():
    if not current_user.customer_profile:
        return jsonify({"error": "Unauthorized profile type"}), 403

    customer_id = current_user.customer_profile.id
    data = request.get_json() or {}
    cart_id = data.get("cart_id") or request.args.get("cart_id")

    cart_item = Cart.query.get(cart_id)
    if not cart_item or cart_item.customer_link != customer_id:
        return jsonify({"error": "Cart item not found"}), 404

    if cart_item.quantity <= 1:
        db.session.delete(cart_item)
        cart_item_quantity = 0
    else:
        cart_item.quantity -= 1
        cart_item_quantity = cart_item.quantity

    db.session.commit()

    cart = Cart.query.filter_by(customer_link=customer_id).all()
    amount = sum(item.product.current_price * item.quantity for item in cart)

    return (
        jsonify(
            {
                "quantity": cart_item_quantity,
                "amount": amount,
                "total": amount + 200 if cart else 0,
            }
        ),
        200,
    )


@views.route("/api/removecart", methods=["POST"])
@login_required
def api_remove_cart():
    if not current_user.customer_profile:
        return jsonify({"error": "Unauthorized profile type"}), 403

    customer_id = current_user.customer_profile.id
    data = request.get_json() or {}
    cart_id = data.get("cart_id") or request.args.get("cart_id")

    cart_item = Cart.query.get(cart_id)
    if not cart_item or cart_item.customer_link != customer_id:
        return jsonify({"error": "Cart item not found"}), 404

    db.session.delete(cart_item)
    db.session.commit()

    cart = Cart.query.filter_by(customer_link=customer_id).all()
    amount = sum(item.product.current_price * item.quantity for item in cart)

    return (
        jsonify(
            {
                "message": "Item removed from cart",
                "amount": amount,
                "total": amount + 200 if cart else 0,
            }
        ),
        200,
    )


@views.route("/api/orders", methods=["GET"])
@login_required
def api_orders():
    if not current_user.customer_profile:
        return jsonify({"error": "Only customer accounts have order records."}), 403

    customer_id = current_user.customer_profile.id
    orders = (
        Order.query.filter_by(customer_link=customer_id).order_by(Order.id.desc()).all()
    )

    orders_list = [
        {
            "order_id": o.id,
            "product_name": o.product.product_name if o.product else "Unknown",
            "quantity": o.quantity,
            "price": o.price,
            "status": o.status,
            "payment_id": o.payment_id,
            "address": o.address,
            "city": o.city,
            "postal_code": o.postal_code,
        }
        for o in orders
    ]

    return jsonify({"orders": orders_list}), 200


@views.route("/api/search", methods=["POST"])
def api_search():
    data = request.get_json() or {}
    search_query = data.get("search", "")

    items = Product.query.filter(
        Product.is_active == True, Product.product_name.ilike(f"%{search_query}%")
    ).all()

    items_list = [
        {
            "id": p.id,
            "product_name": p.product_name,
            "current_price": p.current_price,
            "category": p.category,
            "product_picture": p.product_picture,
        }
        for p in items
    ]

    return jsonify({"query": search_query, "items": items_list}), 200


@views.route("/api/shop/<string:category_key>", methods=["GET"])
def api_category_view(category_key):
    valid_keys = [choice[0] for choice in CATEGORY_CHOICES]
    if category_key not in valid_keys:
        return jsonify({"error": "Category not found"}), 404

    category_label = dict(CATEGORY_CHOICES).get(
        category_key, category_key.replace("-", " ").title()
    )
    products = Product.query.filter_by(category=category_key, is_active=True).all()

    products_list = [
        {
            "id": p.id,
            "product_name": p.product_name,
            "current_price": p.current_price,
            "previous_price": p.previous_price,
            "in_stock": p.in_stock,
            "product_picture": p.product_picture,
        }
        for p in products
    ]

    return (
        jsonify(
            {
                "category_key": category_key,
                "category_title": category_label,
                "products": products_list,
            }
        ),
        200,
    )
