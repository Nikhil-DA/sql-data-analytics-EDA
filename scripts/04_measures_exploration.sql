/*===============================================================================
 04 - Measures Exploration
===============================================================================

Purpose:
    - To calculate and report key business metrics across Sales, Orders, Products,
      and Customers.
    - Generate a consolidated KPI snapshot to support analysis and dashboarding.

Metrics Calculated:
    - Total Sales (Revenue)
    - Total Quantity Sold
    - Average Selling Price (ASP)
    - Total Orders
    - Total Products
    - Total Customers
    - Customers Who Placed Orders

SQL Functions Used:
    - SUM(), AVG(), COUNT(DISTINCT), ROUND()

===============================================================================*/



-- Find the Total Sales
SELECT SUM(sales_amount) AS total_sales 
FROM gold_fact_sales;



-- Find how many items are sold 
SELECT SUM(quantity) AS total_quantity
FROM gold_fact_sales;



-- Find the average selling price
SELECT AVG(price) AS avg_price
FROM gold_fact_sales;



-- Find the TOTAL number of Orders 
SELECT COUNT(DISTINCT order_number) AS total_orders
FROM gold_fact_sales;



-- Find the TOTAL number of Products 
SELECT COUNT(DISTINCT product_number) AS total_products
FROM gold_dim_products;



-- Find the total number of Customers
SELECT COUNT(DISTINCT customer_key) AS total_customers
FROM gold_dim_customers;



-- Find the total number of customers that has placed an order
SELECT COUNT(DISTINCT customer_key) AS total_customers
FROM gold_fact_sales;






-- Generate a Report that shows all key metrices of the business

SELECT 
	'Total Sales' AS measure_name,
     SUM(sales_amount) AS measure_value
FROM gold_fact_sales
UNION ALL 
SELECT 
	'Total Quantity' AS measure_name,
     SUM(quantity) AS measure_value
FROM gold_fact_sales
UNION ALL 
SELECT 
	'AVG price' AS measure_name,
     AVG(price) AS measure_value
FROM gold_fact_sales
UNION ALL
SELECT 
	 'Total Orders' AS measure_name,
	 COUNT(DISTINCT order_number) AS measure_value
FROM gold_fact_sales
UNION ALL
SELECT 
	 'Total products' AS measure_name,
	 COUNT(DISTINCT product_number) AS measure_value
FROM gold_dim_products
UNION ALL
SELECT 
	 'Total customers' AS measure_name,
	 COUNT(DISTINCT customer_key) AS measure_value
FROM gold_dim_customers;



SELECT 
    'Total Sales' AS measure_name,
    ROUND(SUM(sales_amount), 2) AS measure_value
FROM gold_fact_sales

UNION ALL 

SELECT 
    'Total Quantity' AS measure_name,
    ROUND(SUM(quantity), 2) AS measure_value
FROM gold_fact_sales

UNION ALL 

SELECT 
    'AVG price' AS measure_name,
    ROUND(AVG(price), 2) AS measure_value
FROM gold_fact_sales

UNION ALL

SELECT 
    'Total Orders' AS measure_name,
    ROUND(COUNT(DISTINCT order_number), 0) AS measure_value
FROM gold_fact_sales

UNION ALL

SELECT 
    'Total Products' AS measure_name,
    ROUND(COUNT(DISTINCT product_number), 0) AS measure_value
FROM gold_dim_products

UNION ALL

SELECT 
    'Total Customers' AS measure_name,
    ROUND(COUNT(DISTINCT customer_key), 0) AS measure_value
FROM gold_dim_customers;
