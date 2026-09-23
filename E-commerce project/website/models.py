from datetime import datetime
from flask_login import UserMixin
from werkzeug.security import check_password_hash, generate_password_hash
from . import db


class Category(db.Model):
    __tablename__ = "categories"

    id = db.Column(db.Integer, primary_key=True)
    name = db.Column(db.String(100), unique=True, nullable=False)

    products = db.relationship("Product", backref="category_rel", lazy=True)

    def __str__(self):
        return f"<Category {self.name}>"


class User(db.Model, UserMixin):
    __tablename__ = "users"

    id = db.Column(db.Integer, primary_key=True)
    email = db.Column(db.String(150), unique=True, nullable=False)
    password_hash = db.Column(db.String(255), nullable=False)
    role = db.Column(db.String(20), nullable=False, default="customer")
    date_joined = db.Column(db.DateTime, default=datetime.now)

    customer_profile = db.relationship(
        "Customer", backref="user", uselist=False, cascade="all, delete-orphan"
    )
    admin_profile = db.relationship(
        "Admin", backref="user", uselist=False, cascade="all, delete-orphan"
    )

    @property
    def password(self):
        raise AttributeError("password is not a readable attribute")

    @password.setter
    def password(self, password):
        self.password_hash = generate_password_hash(password=password)

    def verify_password(self, password):
        return check_password_hash(self.password_hash, password=password)

    @property
    def is_admin(self):
        return self.role == "admin"

    def __str__(self):
        return f"<User {self.email} - {self.role}>"


class Customer(db.Model):
    __tablename__ = "customers"

    id = db.Column(db.Integer, primary_key=True)
    user_id = db.Column(
        db.Integer, db.ForeignKey("users.id"), unique=True, nullable=False
    )

    first_name = db.Column(db.String(150), nullable=False)
    last_name = db.Column(db.String(150), nullable=False)
    phone_number = db.Column(db.String(15), nullable=True)
    id_number = db.Column(db.String(13), unique=True, nullable=True)

    address = db.Column(db.String(255), nullable=True)
    city = db.Column(db.String(100), nullable=True)
    postal_code = db.Column(db.String(20), nullable=True)

    cart_items = db.relationship(
        "Cart", backref=db.backref("customer", lazy=True), cascade="all, delete-orphan"
    )
    orders = db.relationship("Order", backref=db.backref("customer", lazy=True))
    preowned_listings = db.relationship("Product", backref="seller", lazy=True)

    def __str__(self):
        return f"<Customer {self.first_name} {self.last_name}>"


class Admin(db.Model):
    __tablename__ = "admins"

    id = db.Column(db.Integer, primary_key=True)
    user_id = db.Column(
        db.Integer, db.ForeignKey("users.id"), unique=True, nullable=False
    )

    def __str__(self):
        return f"<Admin {self.user_id}>"


class Product(db.Model):
    __tablename__ = "products"

    id = db.Column(db.Integer, primary_key=True)
    product_name = db.Column(db.String(100), nullable=False)
    current_price = db.Column(db.Float, nullable=False)
    previous_price = db.Column(db.Float, nullable=True)
    description = db.Column(db.Text, nullable=True)  
    in_stock = db.Column(db.Integer, nullable=False)
    product_picture = db.Column(db.String(1000), nullable=False)
    flash_sale = db.Column(db.Boolean, default=False)
    date_added = db.Column(db.DateTime, default=datetime.now)

    category_id = db.Column(db.Integer, db.ForeignKey("categories.id"), nullable=True)

    is_active = db.Column(db.Boolean, default=True, nullable=False)
    is_flagship = db.Column(db.Boolean, default=False, nullable=False)

    is_preowned = db.Column(db.Boolean, default=False, nullable=False)
    is_approved = db.Column(
        db.Boolean, default=True, nullable=False
    )  
    seller_id = db.Column(db.Integer, db.ForeignKey("customers.id"), nullable=True)

    carts = db.relationship(
        "Cart", backref=db.backref("product", lazy=True), cascade="all, delete-orphan"
    )
    orders = db.relationship("Order", backref=db.backref("product", lazy=True))

    def __str__(self):
        return f"<Product {self.product_name}>"


class Cart(db.Model):
    __tablename__ = "carts"

    id = db.Column(db.Integer, primary_key=True)
    quantity = db.Column(db.Integer, nullable=False)

    customer_link = db.Column(db.Integer, db.ForeignKey("customers.id"), nullable=False)
    product_link = db.Column(db.Integer, db.ForeignKey("products.id"), nullable=False)

    def __str__(self):
        return f"<Cart {self.id}>"


class Order(db.Model):
    __tablename__ = "orders"

    id = db.Column(db.Integer, primary_key=True)
    quantity = db.Column(db.Integer, nullable=False)
    price = db.Column(db.Float, nullable=False)
    status = db.Column(db.String(100), nullable=False, default="Pending Payment")
    payment_id = db.Column(db.String(1000), nullable=False)
    date_ordered = db.Column(db.DateTime, default=datetime.now)

    address = db.Column(db.String(255), nullable=True)
    city = db.Column(db.String(100), nullable=True)
    postal_code = db.Column(db.String(20), nullable=True)

    card_holder = db.Column(db.String(150), nullable=True)
    card_last_four = db.Column(db.String(4), nullable=True)

    customer_link = db.Column(db.Integer, db.ForeignKey("customers.id"), nullable=False)
    product_link = db.Column(db.Integer, db.ForeignKey("products.id"), nullable=False)

    def __str__(self):
        return f"<Order {self.id}>"
