-- Create the database
CREATE DATABASE IF NOT EXISTS shop_zone;
USE shop_zone;

-- Table for Parent Category
CREATE TABLE parent_category (
    p_cat_id INT AUTO_INCREMENT PRIMARY KEY,
    p_cat_name VARCHAR(100) NOT NULL
);

-- Table for Sub Category
CREATE TABLE sub_category (
    sub_cat_id INT AUTO_INCREMENT PRIMARY KEY,
    sub_cat_name VARCHAR(100) NOT NULL,
    sub_cat_pic_path varchar(100) not null,
    p_cat_id INT,
    FOREIGN KEY (p_cat_id) REFERENCES parent_category(p_cat_id)
);

-- Table for Product
CREATE TABLE product (
    pro_id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    description varchar(255),
    sub_cat_id INT,
    FOREIGN KEY (sub_cat_id) REFERENCES sub_category(sub_cat_id),
    keywords varchar(255),
    show_price DECIMAL(10, 2),
    actual_price DECIMAL(10, 2),
    stock INT,
    pro_status int, 
    reorder_limit INT,
    discount DECIMAL(5, 2),
    create_date DATE,
    update_date DATE
);

-- Table for Image
CREATE TABLE image (
    img_id INT AUTO_INCREMENT PRIMARY KEY,
    path VARCHAR(255) NOT NULL,
    pro_id INT,
    FOREIGN KEY (pro_id) REFERENCES product(pro_id)
);

-- Table for Cart
CREATE TABLE cart (
    cart_id INT AUTO_INCREMENT PRIMARY KEY,
    pro_id INT,
    c_id INT,
    quantity INT,
    FOREIGN KEY (pro_id) REFERENCES product(pro_id),
    FOREIGN KEY (c_id) REFERENCES customer(c_id)
);

-- Table for Order Line Item
CREATE TABLE order_line_item (
    order_line_item_id INT AUTO_INCREMENT PRIMARY KEY,
    order_id INT,
    pro_id INT,
    quantity INT,
    FOREIGN KEY (order_id) REFERENCES orders(order_id),
    FOREIGN KEY (pro_id) REFERENCES product(pro_id)
);

-- Table for Orders
CREATE TABLE orders (
    order_id INT AUTO_INCREMENT PRIMARY KEY,
    p_id INT,
    c_id INT,
    dp_id INT,
    order_status VARCHAR(100),
    num_of_items int,
    order_date date,
    pincode varchar(6),
    delivery_date DATE,
    shipping_address VARCHAR(255),
    upi_id VARCHAR(50),
    FOREIGN KEY (p_id) REFERENCES payment(p_id),
    FOREIGN KEY (c_id) REFERENCES customer(c_id),
    FOREIGN KEY (dp_id) REFERENCES delivery_person(dp_id)
);

-- Table for Payment
CREATE TABLE payment (
    p_id INT AUTO_INCREMENT PRIMARY KEY,
    -- order_id INT,
    payment_method VARCHAR(50),
    payment_date DATE,
    amount DECIMAL(10, 2),
    payment_status VARCHAR(50),
    upi_id VARCHAR(50)
    -- FOREIGN KEY (order_id) REFERENCES orders(order_id)
);

-- Table for Delivery Person
CREATE TABLE delivery_person (
    dp_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100),
    email VARCHAR(100),
    password VARCHAR(100),
    order_area1 VARCHAR(100),
    order_area2 VARCHAR(100),
    join_date DATE,
    total_delivery int,
    salary DECIMAL(10, 2)
);

-- Table for Customer
CREATE TABLE customer (
    c_id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(100) NOT NULL,
    email VARCHAR(100),
    default_address VARCHAR(255),
    password VARCHAR(100),
    phone_number VARCHAR(15)
    -- upi_id VARCHAR(50)
);

-- Table for Wishlist
CREATE TABLE wishlist (
    w_id INT AUTO_INCREMENT PRIMARY KEY,
    c_id INT,
    pro_id INT,
    FOREIGN KEY (c_id) REFERENCES customer(c_id),
    FOREIGN KEY (pro_id) REFERENCES product(pro_id)
);

-- Table for Employee
CREATE TABLE employee (
    e_id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(100),
    email VARCHAR(100),
    password VARCHAR(100),
    role VARCHAR(50),
    hire_date DATE,
    salary DECIMAL(10, 2)
);

-- Table for Feedback
CREATE TABLE feedback (
    feedback_id INT AUTO_INCREMENT PRIMARY KEY,
    c_id INT,
    pro_id INT,
    content varchar(255),
    FOREIGN KEY (c_id) REFERENCES customer(c_id),
    FOREIGN KEY (pro_id) REFERENCES product(pro_id)
);

