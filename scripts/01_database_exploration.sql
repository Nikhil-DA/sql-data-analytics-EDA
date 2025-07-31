/*
===============================================================================
Project: Business Retail (BR) Data - EDA (Database Exploration)
Author: Nilhil Chauhan
Date: 2003-02-16
===============================================================================
Purpose:
    - To explore the structure of the 'dwh' database (Business Retail Data).
    - To retrieve all table names, schemas, and metadata.
    - To inspect column-level details for specific tables.
    
Tables/Views Used:
    - INFORMATION_SCHEMA.TABLES
    - INFORMATION_SCHEMA.COLUMNS

Notes:
    - Replace 'dwh' with the correct database name if required.
    - This script is used for data profiling and validation as part of EDA.
===============================================================================
*/
-- Explore All Objects in the Database
SELECT *
FROM INFORMATION_SCHEMA.TABLES
WHERE TABLE_SCHEMA = 'dwh';

-- Explore All Columns in the Database
SELECT *
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_SCHEMA = 'dwh';

-- Explore Columns of a Specific Table
SELECT *
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_SCHEMA = 'dwh'
  AND TABLE_NAME = 'gold_dim_customers';
