-- PROJECT: BIKE STORE ANALYSIS

-- CHAP 1: REVENUE LEADERBOARD
-- Goal:
-- Trend view: identify monthly growth patterns and seasonality 
-- Profitability view: Analyze revenue leakage by measuring impact 
-- Category mix: Determine which product departments are driving the most cash flow 


-- The Trend View(Revenue over Time)

Select
s.store_name, 
YEAR(o.order_date) as sales_year, 
MONTH(o.order_date) as sales_month,
ROUND(SUM(oi.list_price * oi.quantity*
(1-oi.discount)), 2) as monthly_revenue 
From stores s 
join orders o on s.store_id = o.store_id
join order_items oi 
on o.order_id = oi.order_id
GROUP BY s.store_name, sales_year, sales_month 
ORDER BY sales_year DESC, sales_month DESC,monthly_revenue DESC;

-- The Profitabily View(Net vs Gross)

SELECT
 s.store_name, 
 Round(sum(oi.list_price * oi.quantity), 2) as gross_revenue,
 Round(sum(oi.list_price * oi.quantity * (1-oi.discount)),2) as net_revenue,
 Round(sum(oi.list_price * oi.quantity * oi.discount), 2) as total_discount_given,
 ROUND(AVG(oi.discount)*100, 2) as avg_discount_pct
 FROM stores s join orders o on s.store_id = o.store_id 
 join order_items oi on o.order_id = oi.order_id
 GROUP BY s.store_name
 ORDER BY avg_discount_pct;
 
 -- REVENUE BY CATEGORY
 
 SELECT
 s.store_name, 
 cat.category_name, 
 ROUND(sum(oi.list_price * oi.quantity * (1 - oi.discount)),2) as category_revenue,
 sum(oi.quantity) AS units_sold 
 FROM stores s 
 join orders o on s.store_id = o.store_id
 join order_items oi on oi.order_id = o.order_id 
 join products p on oi.product_id = p.product_id
 join categories cat on p.category_id = cat.category_id
 GROUP BY s.store_name, cat.category_name 
 ORDER BY s.store_name,
 category_revenue desc;
 
 
 -- chap2: SHIPPING CRISIS REPORT
 -- Goal:Identify late orders and provide contact info for follow-up
 
 SELECT 
 o.order_id,
 concat(c.first_name, ' ', c.last_name) as customer_name,
 c.phone,
 s.store_name,
 o.order_date,
 o.required_date,
 DATEDIFF('2026-04-08', o.order_date) as days_waiting 
 from orders o 
 join customers c on o.customer_id = c.customer_id
 join stores s on o.store_id = s.store_id
 where o.shipped_date IS NULL
 order by days_waiting desc;
 
 -- CHAP 3: THE INVENTORY STAR(TOP 5 PRODUCT)
 -- Goal: Identify the best-selling bikes to optimized the stock
 
 Select 
 p.product_name,
 c.category_name,
 sum(oi.quantity) as total_units_sold,
 ROUND(SUM(oi.quantity * oi.list_price * (1 - oi.discount)),2) as total_revenue 
 from products p join order_items oi 
 on p.product_id = oi.product_id 
 join categories c 
 on p.category_id = c.category_id 
 group by p.product_name, c.category_name 
 order by total_units_sold desc
 limit 5;
 
 
 -- CHAP 4: CUSTOMER MAP (SALES BY LOCATION)
 -- GOAL: Identify high-performance regions for future expansion 
 
 SELECT 
 c.state,
 c.city,
 count(Distinct c.customer_id) as total_customers,
 count(o.order_id) as total_orders,
 round(sum(oi.quantity * oi.list_price * (1 - oi.discount)), 2) as revenue 
 from customers c join orders o on c.customer_id = o.customer_id
 join order_items oi on o.order_id = oi.order_id 
 GROUP BY c.state, c.city
 order by revenue desc;
 
 create view CUSTOMERMAP as 
 SELECT 
 c.state,
 c.city,
 count(Distinct c.customer_id) as total_customers,
 count(o.order_id) as total_orders,
 round(sum(oi.quantity * oi.list_price * (1 - oi.discount)), 2) as revenue 
 from customers c join orders o on c.customer_id = o.customer_id
 join order_items oi on o.order_id = oi.order_id 
 GROUP BY c.state, c.city
 order by revenue desc;
 
