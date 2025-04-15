/* -----------------------------------------------------------------------------
📦 DIMENSIONS EXPLORATION SCRIPT
-------------------------------------------------------------------------------
Purpose:
    - Explore the structure and distinct values in dimension tables.
    - Gain insights into country distribution and product hierarchy.

SQL Concepts Used:
    - DISTINCT
    - ORDER BY

Target Tables:
    - gold.dim_customers
    - gold.dim_products

Author: Nitin Rawat (@nitinrawat05)
Last Updated: 2025-04-15
----------------------------------------------------------------------------- */

-- 🔹 Retrieve a list of unique countries from the customer dimension
SELECT DISTINCT 
    country 
FROM gold.dim_customers
ORDER BY country;

-- 🔹 Retrieve distinct categories, subcategories, and product names
SELECT DISTINCT 
    category, 
    subcategory, 
    product_name 
FROM gold.dim_products
ORDER BY category, subcategory, product_name;
