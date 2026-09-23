from flask_wtf import FlaskForm
from flask_wtf.file import FileAllowed, FileField
from wtforms import (BooleanField, FloatField, IntegerField, PasswordField, SelectField, StringField, SubmitField, EmailField, TextAreaField)
from wtforms.validators import (DataRequired, Email, EqualTo, Length, NumberRange, Optional, Regexp)
from .models import Category


class SignUpForm(FlaskForm):
    email = EmailField(
        "Email",
        validators=[
            DataRequired(message="Email address is required."),
            Email(
                message="Please enter a valid email address (e.g., name@domain.com)."
            ),
        ],
    )
    first_name = StringField(
        "First Name",
        validators=[
            DataRequired(message="First name is required."),
            Length(min=2, max=150),
            Regexp(
                r"^[A-Za-z\s\-]+$",
                message="First name cannot contain numbers or special characters.",
            ),
        ],
    )
    last_name = StringField(
        "Last Name",
        validators=[
            DataRequired(message="Last name is required."),
            Length(min=2, max=150),
            Regexp(
                r"^[A-Za-z\s\-]+$",
                message="Last name cannot contain numbers or special characters.",
            ),
        ],
    )
    password1 = PasswordField(
        "Enter Your Password",
        validators=[
            DataRequired(),
            Length(min=6, message="Password must be at least 6 characters long."),
        ],
    )
    password2 = PasswordField(
        "Confirm Your Password",
        validators=[
            DataRequired(),
            EqualTo("password1", message="Passwords must match."),
        ],
    )
    phone_number = StringField(
        "Phone Number",
        validators=[
            DataRequired(message="Phone number is required."),
            Regexp(
                r"^\d{3}\s\d{3}\s\d{4}$",
                message="Phone number must be in the exact format: 000 000 0000",
            ),
        ],
    )
    id_number = StringField(
        "ID Number",
        validators=[
            DataRequired(message="ID number is required."),
            Length(min=13, max=13, message="ID number must be exactly 13 digits."),
            Regexp(r"^\d{13}$", message="ID number must contain only numbers."),
        ],
    )
    submit = SubmitField("Sign Up")


class LoginForm(FlaskForm):
    email = EmailField("Email", validators=[DataRequired(), Email()])
    password = PasswordField("Enter Your Password", validators=[DataRequired()])
    submit = SubmitField("Login")


class PasswordChangeForm(FlaskForm):
    current_password = PasswordField(
        "Current Password", validators=[DataRequired(), Length(min=6)]
    )
    new_password = PasswordField(
        "New Password", validators=[DataRequired(), Length(min=6)]
    )
    confirm_new_password = PasswordField(
        "Confirm New Password",
        validators=[
            DataRequired(),
            EqualTo("new_password", message="Passwords must match."),
        ],
    )
    change_password = SubmitField("Change Password")


class ShopItemsForm(FlaskForm):
    product_name = StringField("Name of Product", validators=[DataRequired()])
    current_price = FloatField("Current Price", validators=[DataRequired()])

    previous_price = FloatField(
        "Previous Price",
        validators=[Optional()],
        filters=[lambda x: x if x is not None else None],
    )
    in_stock = IntegerField("In Stock", validators=[DataRequired(), NumberRange(min=0)])

    category = SelectField("Category", coerce=int, validators=[DataRequired()])

    product_picture = FileField(
        "Product Picture",
        validators=[FileAllowed(["jpg", "jpeg", "png"], "Images only!")],
    )
    flash_sale = BooleanField("Flash Sale")
    is_flagship = BooleanField("Flagship")
    add_product = SubmitField("Add Product")
    update_product = SubmitField("Update")

    def __init__(self, *args, **kwargs):
        super(ShopItemsForm, self).__init__(*args, **kwargs)
        self.category.choices = [(cat.id, cat.name) for cat in Category.query.all()]


class SellBikeForm(FlaskForm):
    """Form used by customers to submit their pre-owned bicycles for admin review."""

    product_name = StringField(
        "Bike Model / Name",
        validators=[
            DataRequired(message="Bike model/name is required."),
            Length(max=100),
        ],
    )
    current_price = FloatField(
        "Asking Price (R)",
        validators=[
            DataRequired(message="Price is required."),
            NumberRange(min=0, message="Price must be a positive number."),
        ],
    )
    description = TextAreaField(
        "Description", validators=[DataRequired(), Length(max=500)]
    )

    category = SelectField("Category", coerce=int, validators=[DataRequired()])
    product_picture = FileField(
        "Bike Picture",
        validators=[
            DataRequired(message="Please upload a picture of your bike."),
            FileAllowed(
                ["jpg", "jpeg", "png"], "Only jpg, jpeg, and png images are allowed!"
            ),
        ],
    )
    submit_bike = SubmitField("Submit for Approval")

    def __init__(self, *args, **kwargs):
        super(SellBikeForm, self).__init__(*args, **kwargs)
        self.category.choices = [(cat.id, cat.name) for cat in Category.query.all()]


class ResetPasswordForm(FlaskForm):
    email = StringField("Email Address", validators=[DataRequired(), Email()])
    phone_number = StringField(
        "Phone Number",
        validators=[
            DataRequired(),
            Regexp(
                r"^\d{3}\s\d{3}\s\d{4}$",
                message="Phone number must be in format: 000 000 0000",
            ),
        ],
    )
    id_number = StringField(
        "ID Number",
        validators=[
            DataRequired(),
            Length(min=13, max=13, message="ID number must be exactly 13 digits."),
            Regexp(r"^\d{13}$", message="ID number must contain only numbers."),
        ],
    )
    password1 = PasswordField(
        "New Password", validators=[DataRequired(), Length(min=6)]
    )
    password2 = PasswordField(
        "Confirm New Password",
        validators=[
            DataRequired(),
            EqualTo("password1", message="Passwords must match"),
        ],
    )

    submit = SubmitField("Update Password")


class CheckoutForm(FlaskForm):
    """Form used during the checkout and payment process to validate card details."""

    card_number = StringField(
        "Card Number",
        validators=[
            DataRequired(message="Card number is required."),
            Regexp(
                r"^\d{4}\s\d{4}\s\d{4}\s\d{4}$",
                message="Card number must be 16 digits in format: 0000 0000 0000 0000",
            ),
        ],
    )
    expiry_date = StringField(
        "Expiry Date",
        validators=[
            DataRequired(message="Expiry date is required."),
            Regexp(
                r"^(0[1-9]|1[0-2])\/\d{2}$",
                message="Expiry date must be valid in MM/YY format (e.g., 12/25).",
            ),
        ],
    )
    cvv = StringField(
        "CVV",
        validators=[
            DataRequired(message="CVV is required."),
            Regexp(r"^\d{3}$", message="CVV must be exactly 3 digits."),
        ],
    )
    submit = SubmitField("Complete Payment")
