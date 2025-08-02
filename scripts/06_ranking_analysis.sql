/*==============================================================================
06_ranking_analysis.sql
===============================================================================
Purpose:
    - To identify top and bottom performers across products and customers.
    - To rank entities using total revenue, total orders, and quantity sold.
    - To demonstrate the use of window functions for flexible ranking.

Key Analyses:
    - Top 5 products by highest revenue (simple & window function).
    - Bottom 5 products by lowest revenue.
    - Top 5 products by total quantity sold.
    - Top 10 customers by highest revenue.
    - Top 5 customers with the fewest orders.

SQL Concepts Used:
    - Aggregations: SUM(), COUNT()
    - Sorting: ORDER BY
    - Limiting: LIMIT
    - Window Functions: ROW_NUMBER() OVER()
    - Subqueries for ranking and filtering

Notes:
    - Window functions enable more flexible ranking (e.g., per category/region).
    - Aggregation is performed first before ranking in MySQL.
===============================================================================*/


-- Which 5 products generate the highest revenue?
SELECT
	p.product_name,
    SUM(f.sales_amount) AS total_revenue
FROM gold_fact_sales f
LEFT JOIN gold_dim_products p
	ON f.product_key = p.product_key 
GROUP BY p.product_name 
ORDER BY total_revenue DESC
LIMIT 5;


-- Using Window Function
SELECT * 
FROM (
    SELECT
        product_name, 
        total_revenue,
        ROW_NUMBER() OVER (ORDER BY total_revenue DESC) AS rank_products
    FROM (
        SELECT
            p.product_name,
            SUM(f.sales_amount) AS total_revenue
        FROM gold_fact_sales f
        LEFT JOIN gold_dim_products p
            ON f.product_key = p.product_key 
        GROUP BY p.product_name
    ) AS revenue_summary
) AS ranked_products
WHERE rank_products <= 5;




-- Which are the wrost performing products in terms of sales?
SELECT
	p.product_name,
    SUM(f.sales_amount) AS total_revenue
FROM gold_fact_sales f
LEFT JOIN gold_dim_products p
	ON f.product_key = p.product_key 
GROUP BY p.product_name 
ORDER BY total_revenue ASC
LIMIT 5;



-- Top 5 products by quantity sold
SELECT
    p.product_name,
    SUM(f.quantity) AS total_quantity_sold
FROM gold_fact_sales f
LEFT JOIN gold_dim_products p
    ON f.product_key = p.product_key
GROUP BY p.product_name
ORDER BY total_quantity_sold DESC
LIMIT 5;



-- Find the top 10 customers who have generated the higest revenue
SELECT *
FROM (
    SELECT
        c.customer_key,
        CONCAT(c.first_name, ' ', c.last_name) AS customer_name,
        SUM(f.sales_amount) AS total_revenue,
        ROW_NUMBER() OVER (ORDER BY SUM(f.sales_amount) DESC) AS rank_customers
    FROM gold_fact_sales f
    JOIN gold_dim_customers c
        ON f.customer_key = c.customer_key
    GROUP BY c.customer_key, c.first_name, c.last_name
) ranked_customers
WHERE rank_customers <= 10;



-- Top 5 customers with the fewest orders
SELECT *
FROM (
    SELECT 
        c.customer_key,
        CONCAT(c.first_name, ' ', c.last_name) AS customer_name,
        COUNT(DISTINCT f.order_number) AS total_orders,
        ROW_NUMBER() OVER (ORDER BY COUNT(DISTINCT f.order_number) ASC) AS rank_customers
    FROM gold_fact_sales f
    JOIN gold_dim_customers c
        ON f.customer_key = c.customer_key
    GROUP BY c.customer_key, c.first_name, c.last_name
) ranked_customers
WHERE rank_customers <= 5;

SELECT 
    c.customer_key,
    CONCAT(c.first_name, ' ', c.last_name) AS customer_name,
    COUNT(DISTINCT f.order_number) AS total_orders
FROM gold_fact_sales f
JOIN gold_dim_customers c
    ON f.customer_key = c.customer_key
GROUP BY c.customer_key, c.first_name, c.last_name
ORDER BY total_orders ASC
LIMIT 5;

