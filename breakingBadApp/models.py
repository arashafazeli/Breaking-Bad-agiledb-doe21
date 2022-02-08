from numpy import integer
from sqlalchemy.orm import relationship
from database import Base
from sqlalchemy import VARCHAR, Column, Date, Integer
from sqlalchemy.sql.schema import ForeignKey


class Admin_user(Base):
    __tablename__ = "user_table"
    id = Column(Integer, primary_key=True, nullable=False, autoincrement=True)
    role_id = Column(Integer, ForeignKey(
        "role_table.id", ondelete='SET NULL'), nullable=False)
    username = Column(VARCHAR(50), unique=True, nullable=False)
    email = Column(VARCHAR(50), unique=True, nullable=False)
    password = Column(VARCHAR(100), nullable=False, unique=True)
    adress = Column(VARCHAR(50), nullable=False)

    owner = relationship("Admin_role")


class Admin_role(Base):
    __tablename__ = "role_table"
    id = Column(Integer, primary_key=True, nullable=False)
    permission_id = Column(Integer, ForeignKey(
        "permission.id", ondelete='SET NULL'), nullable=False)
    customer_id = Column(Integer, ForeignKey(
        "customer.id", ondelete='SET NULL'), nullable=False)
    employee = Column(VARCHAR(50), unique=True, nullable=False)
    b2c = Column(VARCHAR(50), unique=True, nullable=False)

    owner = relationship("Admin_role")


class Admin_permission(Base):
    __tablename__ = "permission"
    id = Column(Integer, primary_key=True, nullable=False, autoincrement=True)
    permission_status = Column(VARCHAR(50), nullable=False)
    auth = Column(VARCHAR(50), nullable=False)


class Customer_customer(Base):
    __tablename__ = "customer"
    id = Column(Integer, primary_key=True, nullable=False)
    user_id = Column(Integer, ForeignKey(
        "user_table.id", ondelete='CASCADE'), nullable=False)
    category_id = Column(Integer, ForeignKey(
        "category_table.id", ondelete='SET NULL'), nullable=False)
    receipt = Column(VARCHAR(50), nullable=True)
    history = Column(VARCHAR(100), nullable=True)
    chatt = Column(VARCHAR(100), nullable=True)
    member_lvl = Column(VARCHAR(50), nullable=True)

    owner_role = relationship("Admin_role")
    owner_category = relationship("Customer_category")


class Customer_community(Base):
    __tablename__ = "community"
    id = Column(Integer, primary_key=True, nullable=False, autoincrement=True)
    user_id = Column(Integer, ForeignKey(
        "user_table.id", ondelete='CASCADE'), nullable=False)
    category_id = Column(Integer, ForeignKey(
        "category_table.id", ondelete='SET NULL'), nullable=False)
    post = Column(VARCHAR(50), nullable=True)
    chatt = Column(VARCHAR(50), nullable=True)

    owner_user = relationship("Admin_user")
    owner_category = relationship("Customer_category")


class Customer_category(Base):
    __tablename__ = "category_table"
    id = Column(Integer, primary_key=True, nullable=False)
    customer_id = Column(Integer, ForeignKey(
        "customer.id", ondelete='SET NULL'), nullable=False)
    category_name = Column(VARCHAR(50), unique=True, nullable=False)

    Owner = relationship("Customer_customer")


class customer_join(Base):
    __tablename__ = "join_table"
    id = Column(Integer, primary_key=True, nullable=False)
    customer_id = Column(Integer, ForeignKey(
        "customer.id", ondelete='CASCADE'), nullable=False)
    customer_service_id = Column(Integer, ForeignKey(
        "customer_service_table.id", ondelete='CASCADE'))

    owner_customer = relationship("Customer_customer")
    owner_customerService = relationship("Customer_customerService")


class Customer_customerService(Base):
    __tablename__ = "customer_service_table"
    id = Column(Integer, primary_key=True, nullable=False)
    user_id = Column(Integer, ForeignKey(
        "user_table.id", ondelete='CASCADE'), nullable=False)
    message = Column(VARCHAR(250), nullable=False)

    owner = relationship("Admin_user")


class Customer_memberBenefits(Base):
    __tablename__ = "memberBenefits_table"
    id = Column(Integer, primary_key=True, nullable=False)
    event_id = Column(Integer, ForeignKey(
        "event.id", ondelete='SET NULL'), nullable=False)
    customer_id = Column(Integer, ForeignKey(
        "customer.id", ondelete='CASCADE'), nullable=False)
    bonusladder = Column(Integer, nullable=False)
    offers = Column(VARCHAR(50), nullable=False)

    owner_customer = relationship("Customer_customer")
    owner_event = relationship("Customer_event")


class Customer_event(Base):
    __tablename__ = "event"
    id = Column(Integer, primary_key=True, nullable=False)
    customer_id = Column(Integer, ForeignKey(
        "customer.id", ondelete='SET NULL'), nullable=False)
    category_id = Column(Integer, ForeignKey(
        "category_table.id", ondelete='SET NULL'), nullable=False)
    event_name = Column(VARCHAR(50), nullable=False)

    owner_customer = relationship("Customer_customer")
    owner_category = relationship("Customer_category")


class Product_order(Base):
    __tablename__ = "order"
    id = Column(Integer, primary_key=True, nullable=False)
    order_status_id = Column(Integer, ForeignKey(
        "order_status.id", ondelete='CASCADE'), nullable=True)
    product_id = Column(Integer, ForeignKey(
        "product.id", ondelete='SET NULL'), nullable=False)
    user_id = Column(Integer, ForeignKey(
        "user_table.id", ondelete='CASCADE'), nullable=False)
    supplier_id = Column(Integer, ForeignKey(
        "supplier_table.id", ondelete='SET NULL'), nullable=False)
    date = Column(Date, nullable=False)
    total_price = Column(Integer, nullable=False)

    owner_orderStatus = relationship("Product_orderStatus")
    owner_product = relationship("Product_product")
    owner_user = relationship("Admin_user")
    owner_supplier = relationship("Product_supplier")


class Product_csTicket(Base):
    __tablename__ = "cs_ticket"
    id = Column(Integer, primary_key=True, nullable=False)
    order_id = Column(Integer, ForeignKey(
        "order.id", ondelete='CASCADE'), nullable=False)
    customer_service_id = Column(Integer, ForeignKey(
        "customer_service_table.id", ondelete='SET NULL'), nullable=False)

    owner_order = relationship("Product_order")
    owner_customerService = relationship("Customer_customerService")


class Product_orderStatus(Base):
    __tablename__ = "order_status"
    id = Column(Integer, primary_key=True, nullable=False)
    order_id = Column(Integer, ForeignKey(
        "order.id", ondelete='CASCADE'), nullable=False)

    owner = relationship("Product_order")


class Product_supplier(Base):
    __tablename__ = "supplier_table"
    id = Column(Integer, primary_key=True, nullable=False)
    product_id = Column(Integer, ForeignKey(
        "product.id", ondelete='SET NULL'), nullable=False)
    adress = Column(VARCHAR(50), nullable=False)
    org_nummer = Column(VARCHAR(10), nullable=False)
    contact = Column(VARCHAR(50), nullable=False)

    owner = relationship("Product_product")


class Product_recommendations(Base):
    __tablename__ = "recommendations_table"
    id = Column(Integer, primary_key=True, nullable=False)
    product_id = Column(Integer, ForeignKey(
        "product.id", ondelete='SET NULL'), nullable=False)
    user_id = Column(Integer, ForeignKey(
        "user_table.id", ondelete='CASCADE'), nullable=False)
    review = Column(VARCHAR(250), nullable=False)

    owner_product = relationship("Product_product")
    owner_user = relationship("Admin_user")


class Product_product(Base):
    __tablename__ = "product"
    id = Column(Integer, primary_key=True, nullable=False)
    supplier_id = Column(Integer, ForeignKey(
        "supplier_table.id", ondelete='SET NULL'), nullable=False)
    category_id = Column(Integer, ForeignKey(
        "category_table.id", ondelete='SET NULL'), nullable=False)
    description = Column(VARCHAR(100), nullable=False)
    product_name = Column(VARCHAR(50), nullable=False)
    quantity = Column(Integer, nullable=False)
    price = Column(Integer, nullable=False)

    owner_supplier = relationship("Product_supplier")
    owner_category = relationship("Customer_category")
