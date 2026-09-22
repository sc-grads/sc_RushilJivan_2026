import os
import logging
from flask import (Blueprint, render_template, request, jsonify, flash, send_from_directory, redirect, url_for, current_app)
from flask_login import login_required, current_user
from werkzeug.utils import secure_filename
from .forms import ShopItemsForm
from .models import Product, Cart
from . import db

logger = logging.getLogger(__name__)

admin = Blueprint("admin", __name__)


def get_media_path(filename=""):
    media_dir = os.path.join(current_app.root_path, "media")
    if not os.path.exists(media_dir):
        os.makedirs(media_dir, exist_ok=True)
    return os.path.join(media_dir, filename)


def delete_media_file(db_file_path):
    if not db_file_path or db_file_path == "media/default.jpg":
        return

    filename = os.path.basename(db_file_path)
    file_path = get_media_path(filename)

    if os.path.exists(file_path):
        try:
            os.remove(file_path)
        except OSError as e:
            logger.error(
                "Error removing media file from disk",
                extra={"file_path": file_path, "error": str(e)},
            )


@admin.route("/media/<path:filename>")
def get_image(filename):
    media_folder = os.path.join(current_app.root_path, "media")
    return send_from_directory(media_folder, filename)


@admin.route("/add-shop-items", methods=["GET", "POST"])
@login_required
def add_shop_items():
    if current_user.id == 1:
        form = ShopItemsForm()

        if form.validate_on_submit():
            product_name = form.product_name.data
            current_price = form.current_price.data
            previous_price = form.previous_price.data
            category = form.category.data

            if previous_price is not None and previous_price > 0:
                flash_sale = True
            else:
                flash_sale = False
                previous_price = None

            in_stock = form.in_stock.data
            file = form.product_picture.data

            is_flagship = bool(form.is_flagship.data)

            if file and file.filename:
                file_name = secure_filename(file.filename)
                save_path = get_media_path(file_name)
                file.save(save_path)
                db_file_path = f"media/{file_name}"
            else:
                db_file_path = "media/default.jpg"

            if is_flagship:
                Product.query.update({Product.is_flagship: False})

            new_shop_item = Product()
            new_shop_item.product_name = product_name
            new_shop_item.current_price = current_price
            new_shop_item.previous_price = previous_price
            new_shop_item.in_stock = in_stock
            new_shop_item.flash_sale = flash_sale
            new_shop_item.product_picture = db_file_path
            new_shop_item.category = category
            new_shop_item.is_flagship = is_flagship

            try:
                db.session.add(new_shop_item)
                db.session.commit()
                logger.info(
                    "Admin added new shop item successfully",
                    extra={
                        "admin_id": current_user.id,
                        "product_name": product_name,
                        "product_id": new_shop_item.id,
                    },
                )
                flash(f"{product_name} added successfully!", category="success")
                return redirect(url_for("admin.add_shop_items"))
            except Exception as e:
                db.session.rollback()
                logger.error(
                    "Error adding shop item to database",
                    extra={
                        "admin_id": current_user.id,
                        "product_name": product_name,
                        "error": str(e),
                    },
                )
                flash(f"Item was not added! Details: {e}", category="error")

        return render_template("add-shop-items.html", form=form)

    logger.warning(
        "Unauthorized access attempt to add shop items",
        extra={"user_id": current_user.id},
    )
    return render_template("404.html")


@admin.route("/shop-items", methods=["GET"])
@login_required
def shop_items():
    if current_user.id == 1:
        items = Product.query.order_by(Product.date_added.desc()).all()
        return render_template("shop_items.html", items=items)

    logger.warning(
        "Unauthorized access attempt to view shop items management page",
        extra={"user_id": current_user.id},
    )
    return render_template("404.html")


@admin.route("/update-item/<int:item_id>", methods=["GET", "POST"])
@login_required
def update_item(item_id):
    if current_user.id == 1:
        item_to_update = Product.query.get_or_404(item_id)
        form = ShopItemsForm()

        if request.method == "GET":
            form.product_name.data = item_to_update.product_name
            form.previous_price.data = item_to_update.previous_price
            form.current_price.data = item_to_update.current_price
            form.in_stock.data = item_to_update.in_stock
            form.flash_sale.data = item_to_update.flash_sale
            form.category.data = item_to_update.category
            form.is_flagship.data = item_to_update.is_flagship

        if form.validate_on_submit():
            item_to_update.product_name = form.product_name.data
            item_to_update.current_price = form.current_price.data
            item_to_update.category = form.category.data

            previous_price = form.previous_price.data
            if previous_price is not None and previous_price > 0:
                item_to_update.flash_sale = True
                item_to_update.previous_price = previous_price
            else:
                item_to_update.flash_sale = False
                item_to_update.previous_price = None

            item_to_update.in_stock = form.in_stock.data

            is_flagship = bool(form.is_flagship.data)
            if is_flagship:
                Product.query.filter(Product.id != item_to_update.id).update(
                    {Product.is_flagship: False}
                )
            item_to_update.is_flagship = is_flagship

            file = form.product_picture.data
            if file and file.filename:
                delete_media_file(item_to_update.product_picture)

                file_name = secure_filename(file.filename)
                save_path = get_media_path(file_name)
                file.save(save_path)
                item_to_update.product_picture = f"media/{file_name}"

            try:
                db.session.commit()
                logger.info(
                    "Admin updated shop item successfully",
                    extra={
                        "admin_id": current_user.id,
                        "product_id": item_to_update.id,
                    },
                )
                flash(
                    f"{item_to_update.product_name} updated successfully!",
                    category="success",
                )
                return redirect(url_for("admin.shop_items"))
            except Exception as e:
                db.session.rollback()
                logger.error(
                    "Error updating shop item",
                    extra={
                        "admin_id": current_user.id,
                        "product_id": item_to_update.id,
                        "error": str(e),
                    },
                )
                flash(f"Item Not Updated! Details: {e}", category="error")

        return render_template("update_item.html", form=form, item=item_to_update)

    logger.warning(
        "Unauthorized access attempt to update item",
        extra={"user_id": current_user.id, "item_id": item_id},
    )
    return render_template("404.html")


@admin.route("/soft-delete-item/<int:item_id>", methods=["GET", "POST"])
@login_required
def soft_delete_item(item_id):
    if current_user.id == 1:
        item = Product.query.get_or_404(item_id)

        try:
            Cart.query.filter_by(product_link=item.id).delete()
            item.is_active = False
            db.session.commit()
            logger.info(
                "Admin archived (soft deleted) shop item",
                extra={"admin_id": current_user.id, "product_id": item.id},
            )
            flash(
                f"'{item.product_name}' has been archived successfully.",
                category="success",
            )
        except Exception as e:
            db.session.rollback()
            logger.error(
                "Error archiving shop item",
                extra={
                    "admin_id": current_user.id,
                    "product_id": item_id,
                    "error": str(e),
                },
            )
            flash(f"Could not archive item. Error: {str(e)}", "error")

        return redirect(url_for("admin.shop_items"))

    logger.warning(
        "Unauthorized access attempt to archive item",
        extra={"user_id": current_user.id, "item_id": item_id},
    )
    return render_template("404.html")


@admin.route("/delete-item/<int:item_id>", methods=["GET", "POST"])
@login_required
def delete_item(item_id):
    if current_user.id == 1:
        item_to_delete = Product.query.get_or_404(item_id)
        picture_path = item_to_delete.product_picture

        try:
            Cart.query.filter_by(product_link=item_to_delete.id).delete()
            db.session.delete(item_to_delete)
            db.session.commit()
            delete_media_file(picture_path)
            logger.info(
                "Admin deleted shop item permanently",
                extra={"admin_id": current_user.id, "product_id": item_id},
            )
            flash("Item deleted permanently!", category="success")
        except Exception as e:
            db.session.rollback()
            logger.error(
                "Error permanently deleting shop item",
                extra={
                    "admin_id": current_user.id,
                    "product_id": item_id,
                    "error": str(e),
                },
            )
            flash(
                f"Item not deleted (it may be linked to past orders)! Error: {str(e)}",
                "error",
            )

        return redirect(url_for("admin.shop_items"))

    logger.warning(
        "Unauthorized access attempt to permanently delete item",
        extra={"user_id": current_user.id, "item_id": item_id},
    )
    return render_template("404.html")


## API TESTING
@admin.route("/api/shop-items", methods=["GET"])
@login_required
def api_shop_items():
    if current_user.id != 1:
        logger.warning(
            "API unauthorized access attempt to view shop items",
            extra={"user_id": current_user.id},
        )
        return jsonify({"error": "Unauthorized admin access"}), 403

    items = Product.query.order_by(Product.date_added.desc()).all()
    items_list = [
        {
            "id": item.id,
            "product_name": item.product_name,
            "current_price": item.current_price,
            "previous_price": item.previous_price,
            "in_stock": item.in_stock,
            "flash_sale": item.flash_sale,
            "category": item.category,
            "product_picture": item.product_picture,
            "is_flagship": item.is_flagship,
            "date_added": (
                item.date_added.strftime("%Y-%m-%d") if item.date_added else None
            ),
        }
        for item in items
    ]

    return jsonify({"items": items_list}), 200


@admin.route(
    "/api/add-shop-items", methods=["POST"], endpoint="unique_api_add_shop_items"
)
@login_required
def api_add_shop_items():
    if current_user.id != 1:
        logger.warning(
            "API unauthorized access attempt to add shop item",
            extra={"user_id": current_user.id},
        )
        return jsonify({"error": "Unauthorized admin access"}), 403

    data = request.get_json() or {}
    product_name = data.get("product_name")
    current_price = data.get("current_price")
    previous_price = data.get("previous_price")
    in_stock = data.get("in_stock", 0)
    category = data.get("category", "mountain-bikes")
    product_picture = data.get("product_picture", "media/default.jpg")
    is_flagship = bool(data.get("is_flagship", False))

    if previous_price is not None and float(previous_price) > 0:
        flash_sale = True
        previous_price = float(previous_price)
    else:
        flash_sale = False
        previous_price = None

    if not product_name or current_price is None:
        return jsonify({"error": "product_name and current_price are required"}), 400

    if is_flagship:
        Product.query.update({Product.is_flagship: False})

    new_shop_item = Product()
    new_shop_item.product_name = product_name
    new_shop_item.current_price = float(current_price)
    new_shop_item.previous_price = previous_price
    new_shop_item.in_stock = int(in_stock)
    new_shop_item.flash_sale = flash_sale
    new_shop_item.category = category
    new_shop_item.product_picture = product_picture
    new_shop_item.is_flagship = is_flagship

    try:
        db.session.add(new_shop_item)
        db.session.commit()
        logger.info(
            "API admin added shop item successfully",
            extra={"admin_id": current_user.id, "product_id": new_shop_item.id},
        )
        return (
            jsonify(
                {
                    "message": "Product added successfully!",
                    "product": {
                        "id": new_shop_item.id,
                        "product_name": new_shop_item.product_name,
                        "current_price": new_shop_item.current_price,
                        "previous_price": new_shop_item.previous_price,
                        "in_stock": new_shop_item.in_stock,
                        "flash_sale": new_shop_item.flash_sale,
                        "category": new_shop_item.category,
                        "product_picture": new_shop_item.product_picture,
                        "is_flagship": new_shop_item.is_flagship,
                    },
                }
            ),
            201,
        )
    except Exception as e:
        db.session.rollback()
        logger.error(
            "API error adding shop item",
            extra={"admin_id": current_user.id, "error": str(e)},
        )
        return jsonify({"error": "Failed to add product", "details": str(e)}), 500


@admin.route("/api/update-item/<int:item_id>", methods=["PUT", "POST"])
@login_required
def api_update_item(item_id):
    if current_user.id != 1:
        logger.warning(
            "API unauthorized access attempt to update item",
            extra={"user_id": current_user.id, "item_id": item_id},
        )
        return jsonify({"error": "Unauthorized admin access"}), 403

    item = Product.query.get_or_404(item_id)
    data = request.get_json() or {}

    if "product_name" in data:
        item.product_name = data["product_name"]
    if "current_price" in data:
        item.current_price = float(data["current_price"])
    if "previous_price" in data:
        prev = data["previous_price"]
        if prev is not None and float(prev) > 0:
            item.previous_price = float(prev)
            item.flash_sale = True
        else:
            item.previous_price = None
            item.flash_sale = False
    if "in_stock" in data:
        item.in_stock = int(data["in_stock"])
    if "category" in data:
        item.category = data["category"]
    if "is_flagship" in data:
        is_flag = bool(data["is_flagship"])
        if is_flag:
            Product.query.filter(Product.id != item.id).update(
                {Product.is_flagship: False}
            )
        item.is_flagship = is_flag
    if "product_picture" in data:
        item.product_picture = data["product_picture"]

    try:
        db.session.commit()
        logger.info(
            "API admin updated shop item successfully",
            extra={"admin_id": current_user.id, "product_id": item.id},
        )
        return (
            jsonify({"message": "Product updated successfully", "product_id": item.id}),
            200,
        )
    except Exception as e:
        db.session.rollback()
        logger.error(
            "API error updating shop item",
            extra={"admin_id": current_user.id, "product_id": item_id, "error": str(e)},
        )
        return jsonify({"error": str(e)}), 500


@admin.route("/api/soft-delete-item/<int:item_id>", methods=["POST"])
@login_required
def api_soft_delete_item(item_id):
    if current_user.id != 1:
        logger.warning(
            "API unauthorized access attempt to archive item",
            extra={"user_id": current_user.id, "item_id": item_id},
        )
        return jsonify({"error": "Unauthorized admin access"}), 403

    item = Product.query.get_or_404(item_id)
    try:
        Cart.query.filter_by(product_link=item.id).delete()
        item.is_active = False
        db.session.commit()
        logger.info(
            "API admin archived shop item",
            extra={"admin_id": current_user.id, "product_id": item.id},
        )
        return (
            jsonify(
                {"message": f"'{item.product_name}' has been archived successfully."}
            ),
            200,
        )
    except Exception as e:
        db.session.rollback()
        logger.error(
            "API error archiving shop item",
            extra={"admin_id": current_user.id, "product_id": item_id, "error": str(e)},
        )
        return jsonify({"error": str(e)}), 500


@admin.route("/api/delete-item/<int:item_id>", methods=["POST", "DELETE"])
@login_required
def api_delete_item(item_id):
    if current_user.id != 1:
        logger.warning(
            "API unauthorized access attempt to permanently delete item",
            extra={"user_id": current_user.id, "item_id": item_id},
        )
        return jsonify({"error": "Unauthorized admin access"}), 403

    item = Product.query.get_or_404(item_id)
    picture_path = item.product_picture
    try:
        Cart.query.filter_by(product_link=item.id).delete()
        db.session.delete(item)
        db.session.commit()
        delete_media_file(picture_path)
        logger.info(
            "API admin permanently deleted shop item",
            extra={"admin_id": current_user.id, "product_id": item_id},
        )
        return jsonify({"message": "Item deleted permanently!"}), 200
    except Exception as e:
        db.session.rollback()
        logger.error(
            "API error permanently deleting shop item",
            extra={"admin_id": current_user.id, "product_id": item_id, "error": str(e)},
        )
        return jsonify({"error": f"Item not deleted: {str(e)}"}), 500
