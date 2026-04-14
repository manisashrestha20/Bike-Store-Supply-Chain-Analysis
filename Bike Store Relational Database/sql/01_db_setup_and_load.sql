-- PROJECT: BIKE STORE SALES ANALYSIS
-- DATABASE INITIALIZATION
-- Purpose: Create the environment for the bike store data
-- CUSTOMER DATA SETUP
Drop table customers;
Create Table customers(customer_id INT PRIMARY KEY,
	first_name VARCHAR(50), 
    last_name VARCHAR(50),
    phone VARCHAR(20),
    email VARCHAR(100),
    city VARCHAR(50),
    state CHAR(2),
    zip_code VARCHAR(10)
    );
    
SHOW VARIABLES LIKE "secure_file_priv";

ALTER TABLE customers
MODIFY state VARCHAR(50);

ALTER TABLE customers
ADD COLUMN street VARCHAR(50) AFTER email;
    
LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/customers.csv'
INTO TABLE customers
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

DESCRIBE customers;

Select*from customers;
SELECT COUNT(*) FROM customers;

-- PRODUCTS DATA SETUP
CREATE TABLE products(product_id INT PRIMARY KEY,
product_name VARCHAR(300),
brand_id INT,
category_id INT,
model_year INT,
list_price DECIMAL(10,2)
);

LOAD DATA INFILE "C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\products.csv"
INTO TABLE products
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

SELECT * FROM products;

-- ORDER DATA SETUP
CREATE TABLE orders(
order_id INT PRIMARY KEY,
customer_id INT,
order_status INT,
required_date DATE,
shipped_date DATE,
store_id INT,
staff_id INT
);

Alter TABLE orders
ADD COLUMN order_date DATE after order_status;

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/orders.csv'
INTO TABLE orders
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(order_id, customer_id, order_status, order_date, required_date, shipped_date, store_id, staff_id);

SELECT * FROM orders;

-- order_items
CREATE TABLE order_items(
order_id INT,
item_id INT,
product_id INT,
quantity INT,
list_price DECIMAL(10,2),
discount DECIMAL(4,2),
PRIMARY KEY (order_id, item_id)
);

LOAD DATA INFILE "C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\order_items.csv"
INTO TABLE order_items
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(order_id, item_id, product_id, quantity, list_price, discount);

select * from order_items;

-- categories
CREATE TABLE categories(
category_id INT PRIMARY KEY,
category_name VARCHAR(30)
);

LOAD DATA INFILE "C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\categories.csv"
INTO TABLE categories
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(category_id, category_name)
SELECT * FROM categories;

-- brands 
CREATE TABLE brands(
brand_id INT PRIMARY KEY,
brand_name VARCHAR(30)
);
LOAD DATA INFILE "C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\brands.csv"
INTO TABLE brands
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(brand_id, brand_name)
SELECT * FROM brands;

-- STAFFS
CREATE TABLE staffs(
staff_id INT PRIMARY KEY,
first_name VARCHAR(50),
last_name VARCHAR(50),
email VARCHAR(100),
phone VARCHAR(20),
active INT,
store_id INT,
manager_id INT
);
ALTER TABLE staffs
MODIFY manager_id INT NULL;
LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/staffs.csv'
INTO TABLE staffs
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS
(staff_id, first_name, last_name, email, phone, active, store_id, @manager_id)
SET manager_id = NULLIF(TRIM(@manager_id), 'NULL');
SELECT * FROM staffs;

-- stocks 
CREATE TABLE stocks(
store_id INT PRIMARY KEY,
product_id INT,
quantity INT
);

ALTER TABLE stocks
DROP PRIMARY KEY;

SELECT * FROM stocks;

LOAD DATA INFILE "C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\stocks.csv"
INTO TABLE stocks
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(store_id, product_id, quantity);

CREATE TABLE stores(store_id INT,
store_name VARCHAR(100),
phone VARCHAR(20),
email VARCHAR(100),
street VARCHAR(50),
city VARCHAR(50),	
state CHAR(2),	
zip_code VARCHAR(10)
);

LOAD DATA INFILE "C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\stores.csv"
INTO TABLE stores 
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(store_id, store_name, phone, email, street, city, state, zip_code);

select * from stores;



