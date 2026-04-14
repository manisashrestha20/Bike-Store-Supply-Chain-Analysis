-- NULL COUNT
-- orders
SELECT COUNT(*) AS total_rows,
sum(CASE WHEN order_date IS NULL THEN 1 ELSE 0 END) as null_dates,
sum(CASE WHEN customer_id IS NULL THEN 1 ELSE 0 END) AS null_customers,
sum(CASE WHEN store_id IS NULL THEN 1 ELSE 0 END) AS null_stores,
sum(CASE WHEN shipped_date IS NULL THEN 1 ELSE 0 END) AS null_shipping -- note:This is usually okay!
FROM orders; 

-- check duplicates
SELECT customer_id, order_date, store_id, COUNT(*) 
FROM orders GROUP BY customer_id, order_date, store_id
HAVING COUNT(*) >1;

-- CUSTOMERS
SELECT COUNT(*) AS total_rows,
sum(CASE WHEN email IS NULL THEN 1 ELSE 0 END) AS null_email,
sum(CASE WHEN city is NULL THEN 1 ELSE 0 END) AS null_city,
sum(CASE WHEN state is NULL THEN 1 ELSE  0 END) AS null_states 
FROM customers;

-- CHECK DUPLICATES
SELECT email, city, state, Count(*) 
From customers group by email, city, state 
having Count(*) > 1;

-- Products
SELECT COUNT(*) AS total_rows,
sum(CASE WHEN list_price IS NULL THEN 1 ELSE 0 END) AS null_list_price,
sum(CASE WHEN category_id IS NULL THEN 1 ELSE 0 END) AS null_categories 
FROM products;

-- CHECK DUPLICATES
SELECT product_name, model_year, COUNT(*) 
FROM products GROUP BY product_name, model_year
having count(*) >1;

SELECT product_id, product_name, model_year
FROM products
where product_name LIKE 'Electra Townie%';

SELECT COUNT(*) AS total_rows,
sum(CASE WHEN quantity IS NULL THEN 1 ELSE 0 END) AS null_quantity,
sum(CASE WHEN list_price IS NULL THEN 1 ELSE 0 END) AS null_list_price,
sum(CASE WHEN discount IS NULL then 1 ELSE 0 END) AS null_discount
FROM order_items;
