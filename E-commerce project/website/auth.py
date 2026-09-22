import logging
from flask import Blueprint, render_template, flash, redirect, url_for, request, jsonify
from .forms import LoginForm, SignUpForm, PasswordChangeForm, ResetPasswordForm
from .models import User, Customer, db
from . import db
from flask_login import login_user, login_required, logout_user, current_user
from werkzeug.security import generate_password_hash

logger = logging.getLogger(__name__)

auth = Blueprint("auth", __name__)


@auth.route("/sign-up", methods=["GET", "POST"])
def sign_up():
    form = SignUpForm()
    if form.validate_on_submit():
        email = form.email.data
        first_name = form.first_name.data
        last_name = form.last_name.data

        phone_number = getattr(form, "phone_number", None)
        phone_number = (
            phone_number.data
            if phone_number
            else request.form.get("phone_number", "").strip()
        )

        id_number = getattr(form, "id_number", None)
        id_number = (
            id_number.data if id_number else request.form.get("id_number", "").strip()
        )

        password1 = form.password1.data
        password2 = form.password2.data

        if password1 == password2:
            existing_user = User.query.filter_by(email=email).first()
            if existing_user:
                logger.warning(
                    "Sign-up failed: Email already exists", extra={"email": email}
                )
                flash("Account not created! Email already exists.", category="error")
                return render_template("signup.html", form=form)

            if id_number:
                existing_id = Customer.query.filter_by(id_number=id_number).first()
                if existing_id:
                    logger.warning(
                        "Sign-up failed: ID number already registered",
                        extra={"id_number": id_number},
                    )
                    flash(
                        "Account not created! This ID number is already registered.",
                        category="error",
                    )
                    return render_template("signup.html", form=form)

            try:
                new_user = User(email=email, role="customer")
                new_user.password = password2
                db.session.add(new_user)
                db.session.flush()

                new_customer = Customer(
                    user_id=new_user.id,
                    first_name=first_name,
                    last_name=last_name,
                    phone_number=phone_number if phone_number else None,
                    id_number=id_number if id_number else None,
                )
                db.session.add(new_customer)
                db.session.commit()

                logger.info(
                    "New user account created successfully",
                    extra={"user_id": new_user.id, "email": email},
                )
                flash(
                    "Account Created Successfully! You can now login.",
                    category="success",
                )
                return redirect(url_for("auth.login"))
            except Exception as e:
                db.session.rollback()
                logger.error(
                    "Database error occurred during user sign-up",
                    extra={"email": email, "error": str(e)},
                )
                flash(
                    "An error occurred while creating your account.", category="error"
                )

            form.email.data = ""
            form.first_name.data = ""
            form.last_name.data = ""
            if hasattr(form, "phone_number"):
                form.phone_number.data = ""
            if hasattr(form, "id_number"):
                form.id_number.data = ""
            form.password1.data = ""
            form.password2.data = ""

    return render_template("signup.html", form=form)


@auth.route("/login", methods=["GET", "POST"])
def login():
    form = LoginForm()

    if form.validate_on_submit():
        email = form.email.data
        password = form.password.data

        user = User.query.filter_by(email=email).first()

        if user:
            if user.verify_password(password):
                login_user(user)
                logger.info(
                    "User logged in successfully",
                    extra={"user_id": user.id, "email": email},
                )
                return redirect(url_for("views.home"))
            else:
                logger.warning(
                    "Failed login attempt: Incorrect password", extra={"email": email}
                )
                flash("Incorrect Email or Password", category="error")
        else:
            logger.warning(
                "Failed login attempt: Account does not exist", extra={"email": email}
            )
            flash("Account does not exist! Please Sign Up.", category="error")

    return render_template("login.html", form=form)


@auth.route("/logout", methods=["GET", "POST"])
@login_required
def log_out():
    user_id = current_user.id
    logger.info("User logged out", extra={"user_id": user_id})
    logout_user()
    return redirect(url_for("views.home"))


@auth.route("/profile/<int:user_id>")
@login_required
def profile(user_id):
    user = User.query.get_or_404(user_id)
    return render_template("profile.html", user=user)


@auth.route("/change-password/<int:user_id>", methods=["GET", "POST"])
@login_required
def change_password(user_id):
    form = PasswordChangeForm()
    user = User.query.get_or_404(user_id)

    if form.validate_on_submit():
        current_password = form.current_password.data
        new_password = form.new_password.data
        confirm_new_password = form.confirm_new_password.data

        if user.verify_password(current_password):
            if new_password == confirm_new_password:
                user.password = new_password
                db.session.commit()
                logger.info(
                    "User password changed successfully", extra={"user_id": user.id}
                )
                flash("Password has been updated successfully!", category="success")
                return redirect(url_for("auth.profile", user_id=user.id))
            else:
                logger.warning(
                    "Password change failed: New passwords do not match",
                    extra={"user_id": user.id},
                )
                flash("New passwords do not match!", category="error")
        else:
            logger.warning(
                "Password change failed: Current password incorrect",
                extra={"user_id": user.id},
            )
            flash("Current Password is Incorrect! Please try again.", category="error")

    return render_template("change_password.html", form=form)


@auth.route("/forgot-password", methods=["GET", "POST"])
def forgot_password():
    form = ResetPasswordForm()
    if form.validate_on_submit():
        email = form.email.data
        user = User.query.filter_by(email=email).first()

        if (
            user
            and user.customer_profile
            and user.customer_profile.phone_number == form.phone_number.data
            and user.customer_profile.id_number == form.id_number.data
        ):

            user.password = form.password1.data
            db.session.commit()
            logger.info(
                "Password successfully reset via verification challenge",
                extra={"email": email, "user_id": user.id},
            )

            flash(
                "Your password has been successfully updated! You can now log in.",
                "success",
            )
            return redirect(url_for("auth.login"))
        else:
            logger.warning("Password reset verification failed", extra={"email": email})
            flash(
                "Verification failed. Please check your Email, Phone Number, and ID Number.",
                "error",
            )

    return render_template("forgot_password.html", form=form)


@auth.route("/api/sign-up", methods=["POST"])
def api_sign_up():
    data = request.get_json() or {}
    email = data.get("email")
    first_name = data.get("first_name")
    last_name = data.get("last_name")
    phone_number = data.get("phone_number")
    id_number = data.get("id_number")
    password1 = data.get("password1")
    password2 = data.get("password2")

    if not email or not first_name or not last_name or not password1 or not password2:
        return (
            jsonify(
                {
                    "error": "Email, first_name, last_name, password1, and password2 are required"
                }
            ),
            400,
        )

    if password1 != password2:
        return jsonify({"error": "Passwords do not match!"}), 400

    existing_user = User.query.filter_by(email=email).first()
    if existing_user:
        logger.warning(
            "API sign-up failed: Email already exists", extra={"email": email}
        )
        return jsonify({"error": "Account not created! Email already exists."}), 400

    try:
        new_user = User(email=email, role="customer")
        new_user.password = password2
        db.session.add(new_user)
        db.session.flush()

        new_customer = Customer(
            user_id=new_user.id,
            first_name=first_name,
            last_name=last_name,
            phone_number=phone_number,
            id_number=id_number,
        )
        db.session.add(new_customer)
        db.session.commit()

        logger.info(
            "API user account created successfully",
            extra={"user_id": new_user.id, "email": email},
        )
        return (
            jsonify(
                {
                    "message": "Account created successfully!",
                    "user": {
                        "id": new_user.id,
                        "email": new_user.email,
                        "role": new_user.role,
                        "first_name": new_customer.first_name,
                        "last_name": new_customer.last_name,
                        "phone_number": new_customer.phone_number,
                        "id_number": new_customer.id_number,
                    },
                }
            ),
            201,
        )
    except Exception as e:
        db.session.rollback()
        logger.error(
            "API database error occurred during sign-up",
            extra={"email": email, "error": str(e)},
        )
        return jsonify({"error": "Database error occurred", "details": str(e)}), 500


@auth.route("/api/login", methods=["POST"])
def api_login():
    data = request.get_json() or {}
    email = data.get("email")
    password = data.get("password")

    if not email or not password:
        return jsonify({"error": "Email and password are required"}), 400

    user = User.query.filter_by(email=email).first()

    if user and user.verify_password(password):
        login_user(user)
        logger.info(
            "API user logged in successfully",
            extra={"user_id": user.id, "email": email},
        )
        profile_data = {}
        if user.customer_profile:
            profile_data = {
                "first_name": user.customer_profile.first_name,
                "last_name": user.customer_profile.last_name,
                "phone_number": user.customer_profile.phone_number,
                "id_number": user.customer_profile.id_number,
            }

        return (
            jsonify(
                {
                    "message": "Login successful",
                    "user": {
                        "id": user.id,
                        "email": user.email,
                        "role": user.role,
                        **profile_data,
                    },
                }
            ),
            200,
        )

    logger.warning("API failed login attempt", extra={"email": email})
    return jsonify({"error": "Invalid email or password"}), 401


@auth.route("/api/profile/me", methods=["GET"])
@login_required
def api_profile_me():
    profile_data = {}
    if current_user.customer_profile:
        profile_data = {
            "first_name": current_user.customer_profile.first_name,
            "last_name": current_user.customer_profile.last_name,
            "phone_number": current_user.customer_profile.phone_number,
            "id_number": current_user.customer_profile.id_number,
        }

    return (
        jsonify(
            {
                "id": current_user.id,
                "email": current_user.email,
                "role": current_user.role,
                **profile_data,
            }
        ),
        200,
    )


@auth.route("/api/profile/<int:user_id>", methods=["GET"])
def api_profile(user_id):
    user = User.query.get_or_404(user_id)
    profile_data = {}
    if user.customer_profile:
        profile_data = {
            "first_name": user.customer_profile.first_name,
            "last_name": user.customer_profile.last_name,
            "phone_number": user.customer_profile.phone_number,
            "id_number": user.customer_profile.id_number,
        }

    return (
        jsonify(
            {"id": user.id, "email": user.email, "role": user.role, **profile_data}
        ),
        200,
    )


@auth.route("/api/logout", methods=["POST", "GET"])
@login_required
def api_logout():
    user_id = current_user.id
    logger.info("API user logged out", extra={"user_id": user_id})
    logout_user()
    return jsonify({"message": "Logged out successfully"}), 200


@auth.route("/api/change-password", methods=["POST"])
@login_required
def api_change_password():
    data = request.get_json() or {}
    current_password = data.get("current_password")
    new_password = data.get("new_password")
    confirm_new_password = data.get("confirm_new_password")

    if not current_password or not new_password or not confirm_new_password:
        return (
            jsonify(
                {
                    "error": "current_password, new_password, and confirm_new_password are required"
                }
            ),
            400,
        )

    if not current_user.verify_password(current_password):
        logger.warning(
            "API password change failed: Incorrect current password",
            extra={"user_id": current_user.id},
        )
        return jsonify({"error": "Current Password is Incorrect!"}), 400

    if new_password != confirm_new_password:
        logger.warning(
            "API password change failed: Mismatched new passwords",
            extra={"user_id": current_user.id},
        )
        return jsonify({"error": "New passwords do not match!"}), 400

    current_user.password = new_password
    db.session.commit()
    logger.info(
        "API user password changed successfully", extra={"user_id": current_user.id}
    )
    return jsonify({"message": "Password has been updated successfully!"}), 200


@auth.route("/api/forgot-password", methods=["POST"])
def api_forgot_password():
    data = request.get_json() or {}
    email = data.get("email")
    phone_number = data.get("phone_number")
    id_number = data.get("id_number")
    new_password = data.get("password1")

    if not email or not phone_number or not id_number or not new_password:
        return (
            jsonify(
                {"error": "email, phone_number, id_number, and password1 are required"}
            ),
            400,
        )

    user = User.query.filter_by(email=email).first()
    if (
        user
        and user.customer_profile
        and user.customer_profile.phone_number == phone_number
        and user.customer_profile.id_number == id_number
    ):

        user.password = new_password
        db.session.commit()
        logger.info(
            "API password successfully reset via validation challenge",
            extra={"email": email, "user_id": user.id},
        )
        return jsonify({"message": "Your password has been successfully updated!"}), 200

    logger.warning("API password reset challenge failed", extra={"email": email})
    return (
        jsonify(
            {
                "error": "Verification failed. Please check your Email, Phone Number, and ID Number."
            }
        ),
        400,
    )
