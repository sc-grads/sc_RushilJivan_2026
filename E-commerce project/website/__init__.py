import os
import logging
from dotenv import load_dotenv
from flask import Flask, render_template
from flask_login import LoginManager
from flask_sqlalchemy import SQLAlchemy
from werkzeug.security import generate_password_hash
from logstash_async.handler import AsynchronousLogstashHandler, LogstashFormatter

load_dotenv()

db = SQLAlchemy()
DB_NAME = os.environ.get("DB_NAME", "database.sqlite3")

CATEGORY_CHOICES = [
    ("mountain-bikes", "Mountain Bikes"),
    ("road-bikes", "Road Bikes"),
    ("electric-bikes", "Electric Bikes"),
    ("helmets", "Helmets"),
    ("components", "Bike Components"),
    ("tires-and-tubes", "Tires and Tubes"),
    ("tools-and-lubricants", "Tools and Lubricants"),
]


def create_app():
    app = Flask(__name__)

    logstash_host = os.environ.get("LOGSTASH_HOST", "localhost")
    logstash_port = int(os.environ.get("LOGSTASH_PORT", 5044))

    logstash_handler = AsynchronousLogstashHandler(
        host=logstash_host,
        port=logstash_port,
        database_path="", 
    )
    logstash_handler.setLevel(logging.INFO)
    logstash_handler.setFormatter(LogstashFormatter(extra_prefix=""))

    app.logger.addHandler(logstash_handler)
    app.logger.setLevel(logging.INFO)

    werkzeug_logger = logging.getLogger("werkzeug")
    werkzeug_logger.addHandler(logstash_handler)
    werkzeug_logger.setLevel(logging.INFO)

    secret_key = os.environ.get("SECRET_KEY")
    if not secret_key:
        app.logger.critical("SECRET_KEY is missing from environment variables!")
        raise RuntimeError("SECRET_KEY is missing from environment variables!")

    app.config["SECRET_KEY"] = secret_key
    app.config["SQLALCHEMY_DATABASE_URI"] = f"sqlite:///{DB_NAME}"

    db.init_app(app)

    @app.errorhandler(404)
    def page_not_found(error):
        return render_template("404.html")

    from .models import User, Customer, Admin, Cart, Product, Order

    login_manager = LoginManager()
    login_manager.init_app(app)
    login_manager.login_view = "auth.login"

    @login_manager.user_loader
    def load_user(id):
        return db.session.get(User, int(id))

    from .admin import admin
    from .auth import auth
    from .views import views

    app.register_blueprint(views, url_prefix="/")
    app.register_blueprint(auth, url_prefix="/")
    app.register_blueprint(admin, url_prefix="/")

    @app.context_processor
    def inject_categories():
        return dict(CATEGORY_CHOICES=CATEGORY_CHOICES)

    with app.app_context():
        db.create_all()
        seed_admin_user(app)

    return app


def seed_admin_user(app):
    """Ensures an admin account and its admin profile exist using strictly .env variables."""
    from .models import User, Admin

    admin_email = os.environ.get("ADMIN_EMAIL")
    admin_password = os.environ.get("ADMIN_PASSWORD")

    if not admin_email or not admin_password:
        app.logger.warning(
            "ADMIN_EMAIL or ADMIN_PASSWORD missing from .env. Skipping admin seed."
        )
        return

    admin_user = User.query.filter_by(email=admin_email).first()

    if not admin_user:
        admin_user = User(email=admin_email, role="admin")

        if hasattr(admin_user, "password"):
            admin_user.password = admin_password
        else:
            admin_user.password_hash = generate_password_hash(admin_password)

        db.session.add(admin_user)
        db.session.commit()
        app.logger.info(
            "Default admin user created successfully",
            extra={"admin_email": admin_email},
        )

    if not admin_user.admin_profile:
        admin_profile = Admin(user_id=admin_user.id)
        db.session.add(admin_profile)
        db.session.commit()
        app.logger.info(
            "Admin profile created successfully", extra={"admin_email": admin_email}
        )
