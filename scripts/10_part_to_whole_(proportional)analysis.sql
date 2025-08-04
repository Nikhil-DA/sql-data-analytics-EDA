/*===============================================================================
 10 - Part to Whole (Proportional) Analysis
===============================================================================

Purpose:
    - To identify the contribution of each product category to overall sales.
    - Helps in understanding how different categories proportionally drive revenue.

Key Analyses:
    - Total sales by product category
    - Each category's percentage contribution to overall sales

SQL Functions Used:
    - SUM(), ROUND(), CONCAT()
    - GROUP BY, ORDER BY
    - Window function: SUM() OVER()

Notes:
    - Uses a Common Table Expression (CTE) to compute category-wise totals
    - Calculates overall sales using a window function for proportional comparison
    - Outputs ranked categories by total sales in descending order
*/
-- Which categories contribute the most to overall sales 

WITH category_sales AS(
SELECT
	category,
    SUM(sales_amount) total_sales
FROM gold_fact_sales f
LEFT JOIN gold_dim_products p 
	ON f.product_key = p.product_key
GROUP BY category
)
SELECT
	category,
    total_sales,
	SUM(total_sales) OVER() overall_sales,
    CONCAT(ROUND((total_sales / SUM(total_sales) OVER()) * 100,2), '%') AS percentage_of_total
FROM category_sales
ORDER BY total_sales DESC;
