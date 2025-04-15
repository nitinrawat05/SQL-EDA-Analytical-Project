/* -----------------------------------------------------------------------------
📊 DATABASE EXPLORATION SCRIPT
-------------------------------------------------------------------------------
Purpose:
    - Explore the structure of the database.
    - List all available tables and their types.
    - Retrieve column-level metadata for a specific table.

System Views Used:
    - INFORMATION_SCHEMA.TABLES
    - INFORMATION_SCHEMA.COLUMNS

Target Table for Column Metadata:
    - dim_customers

Author: Nitin Rawat (@nitinrawat05)
Last Updated: 2025-04-15
----------------------------------------------------------------------------- */

-- 🔹 Retrieve a list of all tables in the current database
SELECT 
    TABLE_CATALOG, 
    TABLE_SCHEMA, 
    TABLE_NAME, 
    TABLE_TYPE
FROM INFORMATION_SCHEMA.TABLES;

-- 🔹 Retrieve column metadata for a specific table: dim_customers
SELECT 
    COLUMN_NAME, 
    DATA_TYPE, 
    IS_NULLABLE, 
    CHARACTER_MAXIMUM_LENGTH
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'dim_customers';
