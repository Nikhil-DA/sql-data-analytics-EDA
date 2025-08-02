===============================================================================
07_change_over_time_analysis.sql
===============================================================================
Purpose:
    Analyze sales performance and customer activity trends over different time periods:
    - By Year
    - By Month
    - By Year and Month
    - Using DATE_FORMAT for monthly granularity with formatted date labels

Key Concepts:
    - Aggregation of sales, customers, and quantities over time
    - Using YEAR(), MONTH(), and DATE_FORMAT() functions to group and order data
    - Understanding temporal trends in business metrics

Notes:
    - Filters out NULL order dates
    - Uses COUNT(DISTINCT customer_key) to count unique customers per period
    - Orders results chronologically for easy time series analysis
===============================================================================

  
  -- Analyse sales performance over time
-- by YEAR
SELECT
	YEAR(order_date) AS order_year,
    SUM(sales_amount) AS total_sales,
    COUNT(DISTINCT customer_key) AS total_customers,
    SUM(quantity) AS total_quantity
FROM gold_fact_sales
WHERE order_date IS NOT NULL
GROUP BY YEAR(order_date)
ORDER BY order_year ASC;

-- by MONTH
SELECT
	MONTH(order_date) AS order_month,
    SUM(sales_amount) AS total_sales,
    COUNT(DISTINCT customer_key) AS total_customers,
    SUM(quantity) AS total_quantity
FROM gold_fact_sales
WHERE order_date IS NOT NULL
GROUP BY MONTH(order_date)
ORDER BY (order_month) ASC;

-- both 
SELECT
	YEAR(order_date) AS order_year,
	MONTH(order_date) AS order_month,
    SUM(sales_amount) AS total_sales,
    COUNT(DISTINCT customer_key) AS total_customers,
    SUM(quantity) AS total_quantity
FROM gold_fact_sales
WHERE order_date IS NOT NULL
GROUP BY YEAR(order_date), MONTH(order_date)
ORDER BY order_year, order_month ASC;



-- DATE FORMAT
SELECT
    DATE_FORMAT(order_date, '%Y-%m-01') AS order_month,
    SUM(sales_amount) AS total_sales,
    COUNT(DISTINCT customer_key) AS total_customers,
    SUM(quantity) AS total_quantity
FROM gold_fact_sales
WHERE order_date IS NOT NULL
GROUP BY order_month
ORDER BY order_month;


SELECT
    DATE_FORMAT(order_date, '%Y-%b') AS order_date,
    SUM(sales_amount) AS total_sales,
    COUNT(DISTINCT customer_key) AS total_customers,
    SUM(quantity) AS total_quantity
FROM gold_fact_sales
WHERE order_date IS NOT NULL
GROUP BY order_date
ORDER BY order_date;
