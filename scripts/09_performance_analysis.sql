/*===============================================================================
09_performance_analysis
===============================================================================
Purpose:
    - Analyze the yearly performance of each product.
    - Compare current year's sales to:
        1. The product's historical average sales.
        2. The previous year's sales (Year-over-Year analysis).

Key Insights:
    - Identify products performing above or below their average sales.
    - Track Year-over-Year (YOY) sales growth or decline.

SQL Features Used:
    - CTE (WITH clause) for yearly product sales aggregation.
    - Window functions: AVG(), LAG() with PARTITION BY and ORDER BY.
    - CASE statements for performance categorization.

===============================================================================*/


WITH yearly_product_sales AS (
    SELECT
        YEAR(f.order_date) AS order_year,
        p.product_name,
        SUM(f.sales_amount) AS current_sales
    FROM gold_fact_sales f
    LEFT JOIN gold_dim_products p
        ON f.product_key = p.product_key
    WHERE f.order_date IS NOT NULL
    GROUP BY 
        YEAR(f.order_date),
        p.product_name
)
SELECT
    order_year,
    product_name,
    current_sales,
    ROUND(AVG(current_sales) OVER (PARTITION BY product_name), 2) AS avg_sales,
    ROUND(current_sales - AVG(current_sales) OVER (PARTITION BY product_name), 2) AS diff_avg,
    CASE 
        WHEN current_sales - AVG(current_sales) OVER (PARTITION BY product_name) > 0 THEN 'Above Avg'
        WHEN current_sales - AVG(current_sales) OVER (PARTITION BY product_name) < 0 THEN 'Below Avg'
        ELSE 'Avg'
    END AS avg_change,
    
    -- Year-over-Year Analysis
    LAG(current_sales) OVER (PARTITION BY product_name ORDER BY order_year) AS py_sales,
    current_sales - LAG(current_sales) OVER (PARTITION BY product_name ORDER BY order_year) AS diff_py,
    CASE 
        WHEN current_sales - LAG(current_sales) OVER (PARTITION BY product_name ORDER BY order_year) > 0 THEN 'Increase'
        WHEN current_sales - LAG(current_sales) OVER (PARTITION BY product_name ORDER BY order_year) < 0 THEN 'Decrease'
        ELSE 'No Change'
    END AS py_change
FROM yearly_product_sales
ORDER BY product_name, order_year;
