/*===============================================================================
08_cumulative_analysis
===============================================================================
Purpose:
    - Calculate the total sales per month.
    - Calculate the running (cumulative) total of sales over time.
    - Calculate the moving average of the average price.

SQL Functions Used:
    - DATE_FORMAT() to group data by month (1st day of each month).
    - SUM() with OVER(ORDER BY ...) to get the cumulative total.
    - AVG() with OVER(ORDER BY ...) for moving average.
    - ROUND() to round the moving average to 2 decimal places.

===============================================================================*/

-- Calculate the total sales per month 
-- and the running total of sales over time 

SELECT
    order_date,
    total_sales,
    SUM(total_sales) OVER(ORDER BY order_date) AS running_total_sales,
    ROUND(AVG(avg_price) OVER(ORDER BY order_date), 2) AS moving_average_price
FROM (
    SELECT 
        DATE_FORMAT(order_date, '%Y-%m-01') AS order_date,
        SUM(sales_amount) AS total_sales,
        AVG(price) AS avg_price
    FROM gold_fact_sales
    WHERE order_date IS NOT NULL
    GROUP BY order_date
) t
ORDER BY order_date;
