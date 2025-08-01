/*===============================================================================
 02- Dimension Analysis
===============================================================================
Purpose:
    - To explore key dimension tables in the 'dwh' database (Business Retail Data).
    - To analyze categorical variables for understanding data hierarchies and uniqueness.
    - To identify major divisions in products and geographical distribution of customers.
    
Tables Used:
    - gold_dim_customers
    - gold_dim_products

Queries:
    - List distinct countries of customers.
    - List distinct product categories, subcategories, and product names.

Notes:
    - Useful for defining dimensions in reporting and analytics.
    - Helps in detecting data quality issues and cardinality of dimension attributes.
===============================================================================
*/

-- Explore all Countries our Customers come from
SELECT DISTINCT country
FROM gold_dim_customers;

-- Explore All Categories "The Major Divisions"
SELECT DISTINCT 
    category,
	category,
    subcategory,
    product_name
FROM gold_dim_products
ORDER BY 1,2,3;
