/*===============================================================================
 Date Range Exploration
===============================================================================

Purpose:
    - To determine the temporal boundaries of key data points.
    - To understand the range of historical data.

SQL Functions Used:
    - MIN(), MAX(), TIMESTAMPDIFF()

===============================================================================*/


-- Find the date of the first and last order
-- How many years of sales are available

SELECT order_date
FROM gold_fact_sales;

SELECT 
	MIN(order_date) AS first_order_date,
	MAX(order_date) AS  last_order_date,
    TIMESTAMPDIFF(YEAR, MIN(order_date), MAX(order_date)) AS order_range_years
FROM gold_fact_sales;


-- Find the Youngest & the Oldest customer
SELECT 
    MIN(birthdate) AS oldest_birthdate,
    TIMESTAMPDIFF(YEAR, MIN(birthdate), CURDATE()) AS oldest_age,
    MAX(birthdate) AS youngest_birthdate,
    TIMESTAMPDIFF(YEAR, MAX(birthdate), CURDATE()) AS youngest_age
FROM gold_dim_customers;
