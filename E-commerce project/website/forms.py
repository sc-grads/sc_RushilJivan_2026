from flask_wtf import FlaskForm
from wtforms import StringField, IntegerField, FloatField, PasswordField, EmailField, BooleanField, SubmitField, SelectField
from wtforms.validators import DataRequired, EqualTo, Length, NumberRange, Optional, Email, Regexp
from flask_wtf.file import FileAllowed, FileField
from .models import CATEGORY_CHOICES


class SignUpForm(FlaskForm):
    email = EmailField('Email', validators=[DataRequired()])
    first_name = StringField('First Name', validators=[DataRequired(), Length(min=2, max=150)])
    last_name = StringField('Last Name', validators=[DataRequired(), Length(min=2, max=150)])
    password1 = PasswordField('Enter Your Password', validators=[DataRequired(), Length(min=6)])
    password2 = PasswordField(
        'Confirm Your Password',
        validators=[DataRequired(), EqualTo('password1', message='Passwords must match.')])
    phone_number = StringField('Phone Number', validators=[Optional()]) 
    id_number = StringField('ID Number', validators=[Optional(), Length(min=13, max=13)]) 
    submit = SubmitField('Sign Up')


class LoginForm(FlaskForm):
    email = EmailField('Email', validators=[DataRequired()])
    password = PasswordField('Enter Your Password', validators=[DataRequired()])
    submit = SubmitField('Login')


class PasswordChangeForm(FlaskForm):
    current_password = PasswordField('Current Password', validators=[DataRequired(), Length(min=6)])
    new_password = PasswordField('New Password', validators=[DataRequired(), Length(min=6)])
    confirm_new_password = PasswordField(
        'Confirm New Password',
        validators=[DataRequired(), EqualTo('new_password', message='Passwords must match.')]
    )
    change_password = SubmitField('Change Password')


class ShopItemsForm(FlaskForm):
    product_name = StringField('Name of Product', validators=[DataRequired()])
    current_price = FloatField('Current Price', validators=[DataRequired()])
 
    previous_price = FloatField(
        'Previous Price',
        validators=[Optional()],
        filters=[lambda x: x if x is not None else None]
    )
    in_stock = IntegerField('In Stock', validators=[DataRequired(), NumberRange(min=0)])
    
    category = SelectField('Category', choices=CATEGORY_CHOICES, validators=[DataRequired()])
    
    product_picture = FileField('Product Picture', validators=[FileAllowed(['jpg', 'jpeg', 'png'], 'Images only!')])
    flash_sale = BooleanField('Flash Sale')
    is_flagship = BooleanField('Flagship')  
    add_product = SubmitField('Add Product')
    update_product = SubmitField('Update')


class ResetPasswordForm(FlaskForm):
    email = StringField('Email Address', validators=[DataRequired(), Email()])
    phone_number = StringField('Phone Number', validators=[DataRequired()])
    id_number = StringField('ID Number', validators=[DataRequired(), Length(min=13, max=13, message='ID number must be exactly 13 digits.'), Regexp('^[0-9]*$', message='ID number must contain only numbers.')])
    password1 = PasswordField('New Password', validators=[DataRequired()])
    password2 = PasswordField('Confirm New Password', validators=[DataRequired(), EqualTo('password1', message='Passwords must match')])
    
    submit = SubmitField('Update Password')