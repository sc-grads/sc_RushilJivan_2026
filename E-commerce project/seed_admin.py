from main import app 
from website import db
from website.models import User, Admin

def seed():
    with app.app_context():
       
        existing_admin = User.query.filter_by(role='admin').first()
        if existing_admin:
            print(f"Admin already exists with User ID: {existing_admin.id}")
            return

        
        admin_user = User(
            email='admin@gmail.com',
            role='admin'
        )
        admin_user.password = '123456'  

        db.session.add(admin_user)
        db.session.flush()  

        admin_profile = Admin(
            user_id=admin_user.id,
            employee_code='EMP-001',
            department='Management'
        )

        db.session.add(admin_profile)
        db.session.commit()

        print(f"Admin account created successfully! User ID: {admin_user.id}")

if __name__ == '__main__':
    seed()