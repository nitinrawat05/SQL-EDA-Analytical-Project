/* -----------------------------------------------------------------------------
🗓️ DATE RANGE EXPLORATION SCRIPT
-------------------------------------------------------------------------------
Purpose:
    - Identify the earliest and latest order dates.
    - Calculate the total time span of sales data.
    - Find the youngest and oldest customers by birthdate.

SQL Functions Used:
    - MIN(), MAX()
    - DATEDIFF()

Target Tables:
    - gold.fact_sales
    - gold.dim_customers

Author: Nitin Rawat (@nitinrawat05)
Last Updated: 2025-04-15
----------------------------------------------------------------------------- */

-- 🔹 Get the first and last order date and duration between them (in months)
SELECT 
    MIN(order_date) AS first_order_date,
    MAX(order_date) AS last_order_date,
    DATEDIFF(MONTH, MIN(order_date), MAX(order_date)) AS order_range_months
FROM gold.fact_sales;

-- 🔹 Find the oldest and youngest customer based on birthdate
SELECT
    MIN(birthdate) AS oldest_birthdate,
    DATEDIFF(YEAR, MIN(birthdate), GETDATE()) AS oldest_age,
    MAX(birthdate) AS youngest_birthdate,
    DATEDIFF(YEAR, MAX(birthdate), GETDATE()) AS youngest_age
FROM gold.dim_customers;
