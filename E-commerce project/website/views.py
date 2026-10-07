from collections import defaultdict
from datetime import datetime, timedelta
import logging
import os
import uuid
from flask import (Blueprint,abort,current_app,flash,jsonify,redirect,render_template,request,url_for)
from flask_login import current_user, login_required, logout_user
from werkzeug.utils import secure_filename
from . import db
from .forms import CheckoutForm, SellBikeForm
from .models import Cart, Category, Order, Product, User
from sqlalchemy import or_
import resend

logger = logging.getLogger(__name__)

views = Blueprint("views", __name__)

PAYFAST_MERCHANT_ID = os.environ.get("PAYFAST_MERCHANT_ID", "10000100")
PAYFAST_MERCHANT_KEY = os.environ.get("PAYFAST_MERCHANT_KEY", "46f0cd694581a")
PAYFAST_URL = "https://sandbox.payfast.co.za/eng/process"

resend.api_key = os.environ.get("RESEND_API_KEY")


def send_order_invoice(customer_email, order_data):
    try:
        items_html = ""
        for item in order_data.get("items", []):
            product_name = item.product.product_name if item.product else "Item"
            items_html += f"""
            <tr>
                <td style="padding: 10px; border-bottom: 1px solid #eee;">{product_name}</td>
                <td style="padding: 10px; border-bottom: 1px solid #eee; text-align: center;">{item.quantity}</td>
                <td style="padding: 10px; border-bottom: 1px solid #eee; text-align: right;">R {item.price:,.2f}</td>
            </tr>
            """

        html_content = f"""
        <div style="font-family: Arial, sans-serif; color: #333; max-width: 600px; margin: auto; padding: 20px; border: 1px solid #eaeaea; border-radius: 10px;">
            <h2 style="color: #0EA5E9; text-align: center;">Ville Cycles</h2>
            <h3 style="text-align: center; margin-top: 0;">Order Confirmation & Invoice</h3>
            
            <p><strong>Customer Email:</strong> {customer_email}</p>
            <p><strong>Payment ID / Ref:</strong> {order_data.get('payment_id')}</p>
            <p><strong>Date:</strong> {order_data.get('date')}</p>
            
            <table style="width: 100%; border-collapse: collapse; margin-top: 20px;">
                <thead>
                    <tr style="background-color: #f8f9fa;">
                        <th style="padding: 10px; text-align: left; border-bottom: 2px solid #dee2e6;">Item</th>
                        <th style="padding: 10px; text-align: center; border-bottom: 2px solid #dee2e6;">Qty</th>
                        <th style="padding: 10px; text-align: right; border-bottom: 2px solid #dee2e6;">Price</th>
                    </tr>
                </thead>
                <tbody>
                    {items_html}
                </tbody>
            </table>
            
            <div style="text-align: right; margin-top: 20px;">
                <h3>Total (incl. Shipping): R {order_data.get('total_price'):,.2f}</h3>
            </div>
            
            <hr style="border: none; border-top: 1px solid #eee; margin: 30px 0;">
            <p style="font-size: 12px; color: #777; text-align: center;">Internal notification from Ville Cycles platform.</p>
        </div>
        """

        target_inbox = "rushiljivan@gmail.com"

        params = {
            "from": "Ville Cycles <onboarding@resend.dev>",
            "to": [target_inbox],
            "subject": f"New Order Invoice [{order_data.get('payment_id')}] - Ville Cycles",
            "html": html_content,
        }

        response = resend.Emails.send(params)
        return response
    except Exception as e:
        logger.error(f"Error sending invoice email via Resend: {e}")
        return None


@views.route("/")
def home():
    page = request.args.get("page", 1, type=int)
    per_page = 12

    sort_option = request.args.get("sort", "newest")

    query = Product.query.filter(
        Product.is_active == True,
        Product.is_flagship == False,
        Product.is_approved == True,
        Product.in_stock > 0,
        or_(
            Product.is_preowned == False,
            Product.consignment_status == "delivered",
        ),
    )

    if sort_option == "az":
        query = query.order_by(Product.product_name.asc())
    elif sort_option == "za":
        query = query.order_by(Product.product_name.desc())
    elif sort_option == "price_low_high":
        query = query.order_by(Product.current_price.asc())
    elif sort_option == "price_high_low":
        query = query.order_by(Product.current_price.desc())
    else:
        query = query.order_by(Product.date_added.desc())

    pagination = query.paginate(page=page, per_page=per_page, error_out=False)
    items = pagination.items

    flagship = (
        Product.query.filter_by(is_flagship=True, is_active=True, is_approved=True)
        .filter(Product.in_stock > 0)
        .first()
    )

    categories = Category.query.all()

    if current_user.is_authenticated and current_user.customer_profile:
        cart = Cart.query.filter_by(
            customer_link=current_user.customer_profile.id
        ).all()
    else:
        cart = []

    return render_template(
        "home.html",
        items=items,
        flagship=flagship,
        cart=cart,
        categories=categories,
        pagination=pagination,
        current_sort=sort_option,
    )


@views.route("/sell-bike", methods=["GET", "POST"])
@login_required
def sell_bike():
    if not current_user.customer_profile:
        flash("Only customer accounts can submit pre-owned bikes.", category="error")
        return redirect("/")

    form = SellBikeForm()
    form.category.choices = [(c.id, c.name) for c in Category.query.all()]

    if form.validate_on_submit():
        picture_file = form.product_picture.data
        if picture_file and picture_file.filename:
            filename = secure_filename(picture_file.filename)
            unique_filename = f"{uuid.uuid4().hex}_{filename}"

            upload_folder = os.path.join(current_app.root_path, "customer_media")
            os.makedirs(upload_folder, exist_ok=True)
            picture_path = os.path.join(upload_folder, unique_filename)
            picture_file.save(picture_path)
            db_picture = f"customer_media/{unique_filename}"
        else:
            db_picture = "customer_media/default.jpg"

        new_bike = Product(
            product_name=form.product_name.data,
            current_price=form.current_price.data,
            customer_asking_price=form.current_price.data,
            description=form.description.data,
            in_stock=1,
            category_id=form.category.data,
            product_picture=db_picture,
            is_preowned=True,
            is_approved=False,
            consignment_status="pending_review",
            seller_id=current_user.customer_profile.id,
            is_active=False,
        )

        try:
            db.session.add(new_bike)
            db.session.commit()
            logger.info(
                "Pre-owned bike submitted for approval and negotiation",
                extra={
                    "customer_id": current_user.customer_profile.id,
                    "product_name": form.product_name.data,
                    "asking_price": form.current_price.data,
                },
            )
            flash(
                "Your pre-owned bike has been submitted! Our team will review your details and get back to you with an offer.",
                category="success",
            )
            return redirect(url_for("views.home"))
        except Exception as e:
            db.session.rollback()
            logger.error(
                "Failed to submit pre-owned bike",
                extra={
                    "customer_id": current_user.customer_profile.id,
                    "error": str(e),
                },
            )
            flash(
                "Failed to submit your bike listing. Please try again.",
                category="error",
            )

    return render_template("sell_bike.html", form=form)


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

    if not item_to_add.is_active or not item_to_add.is_approved:
        flash("This item is no longer available.", category="error")
        return redirect(request.referrer or "/")

    item_exists = Cart.query.filter_by(
        product_link=item_id, customer_link=customer_id
    ).first()

    current_qty_in_cart = item_exists.quantity if item_exists else 0
    if current_qty_in_cart + 1 > item_to_add.in_stock:
        flash(
            f"Cannot add more. Only {item_to_add.in_stock} available in stock.",
            category="error",
        )
        return redirect(request.referrer or "/")

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

    for item in cart:
        if item.product and item.quantity > item.product.in_stock:
            flash(
                f'"{item.product.product_name}" exceeds available stock. Only {item.product.in_stock} left.',
                category="error",
            )
            return redirect("/cart")

    amount = sum(item.product.current_price * item.quantity for item in cart)
    shipping_fee = 200.0 if cart else 0.0

    use_reward = (
        request.form.get("use_reward") == "on" if request.method == "POST" else False
    )
    discount = 0.0

    if use_reward and customer.loyalty_rewards_available > 0:
        discount = amount * 0.15

    total = max(0, amount + shipping_fee - discount)

    form = CheckoutForm()

    if request.method == "POST":
        if not cart:
            flash("Your cart is empty!", category="error")
            return redirect("/cart")

        if form.validate_on_submit():
            address = request.form.get("address", "").strip()
            city = request.form.get("city", "").strip()
            postal_code = request.form.get("postal_code", "").strip()

            try:
                customer.address = address
                customer.city = city
                customer.postal_code = postal_code

                if use_reward and customer.loyalty_rewards_available > 0:
                    customer.loyalty_rewards_available -= 1

                db.session.add(customer)
                db.session.commit()
            except Exception as e:
                db.session.rollback()
                logger.error(
                    "Could not update customer address profile and rewards",
                    extra={"customer_id": customer.id, "error": str(e)},
                )
                flash(
                    "Could not update address details in your profile.",
                    category="error",
                )

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
                    "reward_used": use_reward,
                },
            )

            return render_template(
                "payfast_redirect.html",
                payfast_url=PAYFAST_URL,
                payfast_data=payfast_data,
            )
        else:
            flash(
                "Please correct the errors in your payment details.", category="error"
            )

    return render_template(
        "cart.html",
        cart=cart,
        amount=amount,
        shipping_fee=shipping_fee,
        discount=discount,
        total=total,
        customer=customer,
        form=form,
    )


@views.route("/payment-success")
@login_required
def payment_success():
    customer = current_user.customer_profile
    customer_id = customer.id
    cart = Cart.query.filter_by(customer_link=customer_id).all()

    if cart:
        for item in cart:
            if not item.product or item.quantity > item.product.in_stock:
                flash(
                    f'Order failed: "{item.product.product_name if item.product else "Item"}" stock limit exceeded.',
                    category="error",
                )
                return redirect(url_for("views.show_cart"))

        payment_id = f"PAYFAST-{uuid.uuid4().hex[:8].upper()}"
        created_orders = []
        subtotal = 0

        for item in cart:
            item_total = item.product.current_price * item.quantity
            subtotal += item_total

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
                loyalty_counted=False,
            )
            db.session.add(new_order)
            created_orders.append(new_order)

            if item.product and item.product.in_stock >= item.quantity:
                item.product.in_stock -= item.quantity

        Cart.query.filter_by(customer_link=customer_id).delete()
        db.session.commit()

        shipping_fee = 200.0 if created_orders else 0.0
        order_invoice_data = {
            "payment_id": payment_id,
            "date": datetime.now().strftime("%Y-%m-%d %H:%M"),
            "total_price": subtotal + shipping_fee,
            "items": created_orders,
        }
        send_order_invoice(
            getattr(current_user, "email", "unknown@customer.com"), order_invoice_data
        )

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

    if cart_item.product and cart_item.quantity + 1 > cart_item.product.in_stock:
        return (
            jsonify(
                {
                    "error": f"Cannot add more. Only {cart_item.product.in_stock} available in stock."
                }
            ),
            400,
        )

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
    time_filter = request.args.get("filter", "all")

    query = Order.query.filter_by(customer_link=customer_id)

    now = datetime.now()
    if time_filter == "3months":
        threshold = now - timedelta(days=90)
        query = query.filter(Order.date_ordered >= threshold)
    elif time_filter == "6months":
        threshold = now - timedelta(days=180)
        query = query.filter(Order.date_ordered >= threshold)
    elif time_filter == "year":
        threshold = now - timedelta(days=365)
        query = query.filter(Order.date_ordered >= threshold)
    elif time_filter == "older":
        threshold = now - timedelta(days=365)
        query = query.filter(Order.date_ordered < threshold)

    raw_orders = (
        query.options(db.joinedload(Order.product))
        .order_by(Order.date_ordered.desc())
        .all()
    )

    grouped_dict = defaultdict(list)
    for o in raw_orders:
        grouped_dict[o.payment_id].append(o)

    orders_list = list(grouped_dict.values())

    page = request.args.get("page", 1, type=int)
    per_page = 5
    start = (page - 1) * per_page
    end = start + per_page

    paginated_orders = orders_list[start:end]

    class SimplePagination:
        def __init__(self, page, per_page, total):
            self.page = page
            self.per_page = per_page
            self.total = total
            self.pages = (total + per_page - 1) // per_page
            self.has_prev = page > 1
            self.has_next = page < self.pages
            self.prev_num = page - 1
            self.next_num = page + 1

        def iter_pages(
            self, left_edge=2, left_current=2, right_current=5, right_edge=2
        ):
            last = 0
            for num in range(1, self.pages + 1):
                if (
                    num <= left_edge
                    or (
                        num > self.page - left_current - 1
                        and num < self.page + right_current
                    )
                    or num > self.pages - right_edge
                ):
                    if last + 1 != num:
                        yield None
                    yield num
                    last = num

    pagination = SimplePagination(page, per_page, len(orders_list))

    return render_template(
        "orders.html",
        orders=paginated_orders,
        pagination=pagination,
        current_filter=time_filter,
    )


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
            Product.is_active == True,
            Product.is_approved == True,
            Product.product_name.ilike(f"%{search_query}%"),
        ).all()
        return render_template("search.html", items=items, cart=cart)

    return render_template("search.html", items=[], cart=cart)


@views.route("/about")
def about():
    return render_template("about.html")


@views.route("/shop/<int:category_id>")
def category_view(category_id):
    category = Category.query.get_or_404(category_id)
    products = Product.query.filter_by(
        category_id=category.id, is_active=True, is_approved=True
    ).all()

    return render_template(
        "category_products.html",
        category_title=category.name,
        products=products,
        category_id=category.id,
    )


@views.route("/delete-account", methods=["POST"])
@login_required
def delete_account():
    user = current_user
    customer = user.customer_profile

    try:
        if customer:
            Cart.query.filter_by(customer_link=customer.id).delete()
            Product.query.filter_by(seller_id=customer.id).update({"seller_id": None})
            Order.query.filter_by(customer_link=customer.id).delete()
            db.session.delete(customer)

        db.session.delete(user)
        db.session.commit()

        logout_user()
        flash(
            "Your account and all associated data have been successfully deleted.",
            "success",
        )
        return redirect(url_for("views.home"))

    except Exception as e:
        db.session.rollback()
        logger.error(
            "Failed to delete user account",
            extra={"user_id": user.id, "error": str(e)},
        )
        flash(
            "An error occurred while trying to delete your account. Please try again.",
            "danger",
        )
        return redirect(request.referrer or url_for("views.home"))


@views.route("/my-submissions", methods=["GET"])
@login_required
def my_submissions():
    if not current_user.customer_profile:
        flash("Only customer accounts have bike submissions.", "error")
        return redirect(url_for("views.home"))

    customer_bikes = Product.query.filter_by(
        seller_id=current_user.customer_profile.id, is_preowned=True
    ).all()

    return render_template("my_submissions.html", bikes=customer_bikes)


@views.route("/respond-offer/<int:item_id>/<action>", methods=["POST"])
@login_required
def respond_offer(item_id, action):
    if not current_user.customer_profile:
        return redirect(url_for("views.home"))

    item = Product.query.get_or_404(item_id)

    if item.seller_id != current_user.customer_profile.id:
        flash("Unauthorized action.", "error")
        return redirect(url_for("views.my_submissions"))

    if action == "accept":
        if item.shop_counter_price:
            item.current_price = item.shop_counter_price
        item.consignment_status = "price_agreed"
        flash(
            "Offer accepted! Please check your delivery instructions to ship or drop off your bike at Ville Cycles.",
            "success",
        )
    elif action == "reject":
        item.consignment_status = "rejected_by_customer"
        flash(
            "You have declined the shop's offer. Feel free to contact our support team to discuss further.",
            "warning",
        )

    db.session.commit()
    return redirect(url_for("views.my_submissions"))


##API TESTING
@views.route("/api/home", methods=["GET"])
def api_home():
    items = (
        Product.query.filter_by(is_active=True, is_flagship=False, is_approved=True)
        .order_by(Product.date_added.desc())
        .all()
    )
    flagship = Product.query.filter_by(
        is_flagship=True, is_active=True, is_approved=True
    ).first()
    categories = Category.query.all()

    items_list = [
        {
            "id": p.id,
            "product_name": p.product_name,
            "current_price": p.current_price,
            "previous_price": p.previous_price,
            "in_stock": p.in_stock,
            "flash_sale": p.flash_sale,
            "category_id": p.category_id,
            "category_name": p.category.name if p.category else None,
            "product_picture": p.product_picture,
            "is_flagship": p.is_flagship,
        }
        for p in items
    ]

    categories_list = [{"id": c.id, "name": c.name} for c in categories]

    flagship_data = None
    if flagship:
        flagship_data = {
            "id": flagship.id,
            "product_name": flagship.product_name,
            "current_price": flagship.current_price,
            "product_picture": flagship.product_picture,
        }

    return (
        jsonify(
            {
                "items": items_list,
                "flagship": flagship_data,
                "categories": categories_list,
            }
        ),
        200,
    )


@views.route("/api/sell-bike", methods=["POST"])
@login_required
def api_sell_bike():
    if not current_user.customer_profile:
        return (
            jsonify({"error": "Only customer accounts can submit pre-owned bikes."}),
            403,
        )

    product_name = request.form.get("product_name")
    current_price = request.form.get("current_price")
    category_id = request.form.get("category")
    description = request.form.get("description")
    picture_file = request.files.get("product_picture")

    if not product_name or not current_price or not category_id or not picture_file:
        return jsonify({"error": "Missing required fields."}), 400

    try:
        current_price = float(current_price)
        category_id = int(category_id)
    except ValueError:
        return jsonify({"error": "Invalid price or category format."}), 400

    filename = secure_filename(picture_file.filename)
    unique_filename = f"{uuid.uuid4().hex}_{filename}"

    upload_folder = os.path.join(current_app.root_path, "customer_media")
    os.makedirs(upload_folder, exist_ok=True)
    picture_path = os.path.join(upload_folder, unique_filename)
    picture_file.save(picture_path)
    db_picture = f"customer_media/{unique_filename}"

    new_bike = Product(
        product_name=product_name,
        current_price=current_price,
        description=description,
        in_stock=1,
        category_id=category_id,
        product_picture=db_picture,
        is_preowned=True,
        is_approved=False,
        seller_id=current_user.customer_profile.id,
        is_active=True,
    )

    try:
        db.session.add(new_bike)
        db.session.commit()
        return (
            jsonify(
                {
                    "message": "Pre-owned bike submitted for admin approval successfully!",
                    "product_id": new_bike.id,
                }
            ),
            201,
        )
    except Exception as e:
        db.session.rollback()
        return jsonify({"error": str(e)}), 500


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

    if not item_to_add.is_active or not item_to_add.is_approved:
        return jsonify({"error": "This item is no longer available."}), 400

    item_exists = Cart.query.filter_by(
        product_link=item_id, customer_link=customer_id
    ).first()

    current_qty_in_cart = item_exists.quantity if item_exists else 0
    if current_qty_in_cart + 1 > item_to_add.in_stock:
        return (
            jsonify(
                {
                    "error": f"Cannot add more. Only {item_to_add.in_stock} available in stock."
                }
            ),
            400,
        )

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

    if cart_item.product and cart_item.quantity + 1 > cart_item.product.in_stock:
        return (
            jsonify(
                {
                    "error": f"Cannot add more. Only {cart_item.product.in_stock} available in stock."
                }
            ),
            400,
        )

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
    raw_orders = (
        Order.query.filter_by(customer_link=customer_id)
        .options(db.joinedload(Order.product))
        .order_by(Order.date_ordered.desc())
        .all()
    )

    grouped_dict = defaultdict(list)
    for o in raw_orders:
        grouped_dict[o.payment_id].append(o)

    orders_list = [
        {
            "payment_id": payment_id,
            "date_ordered": (
                items[0].date_ordered.strftime("%Y-%m-%d %H:%M:%S")
                if items[0].date_ordered
                else None
            ),
            "status": items[0].status,
            "address": items[0].address,
            "city": items[0].city,
            "postal_code": items[0].postal_code,
            "items": [
                {
                    "order_id": item.id,
                    "product_id": item.product_link,
                    "product_name": (
                        item.product.product_name if item.product else "Unknown"
                    ),
                    "quantity": item.quantity,
                    "price": item.price,
                    "subtotal": item.price * item.quantity,
                }
                for item in items
            ],
        }
        for payment_id, items in grouped_dict.items()
    ]
    return jsonify({"orders": orders_list}), 200


@views.route("/api/search", methods=["POST"])
def api_search():
    data = request.get_json() or {}
    search_query = data.get("search", "")

    items = Product.query.filter(
        Product.is_active == True,
        Product.is_approved == True,
        Product.product_name.ilike(f"%{search_query}%"),
    ).all()

    items_list = [
        {
            "id": p.id,
            "product_name": p.product_name,
            "current_price": p.current_price,
            "category_id": p.category_id,
            "category_name": p.category.name if p.category else None,
            "product_picture": p.product_picture,
        }
        for p in items
    ]
    return jsonify({"query": search_query, "items": items_list}), 200


@views.route("/api/shop/<int:category_id>", methods=["GET"])
def api_category_view(category_id):
    category = Category.query.get_or_404(category_id)
    products = Product.query.filter_by(
        category_id=category.id, is_active=True, is_approved=True
    ).all()

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
                "category_id": category.id,
                "category_title": category.name,
                "products": products_list,
            }
        ),
        200,
    )
