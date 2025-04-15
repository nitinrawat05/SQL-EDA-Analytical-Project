/* -----------------------------------------------------------------------------
📊 CHANGE OVER TIME ANALYSIS SCRIPT
-------------------------------------------------------------------------------
Purpose:
    - Track trends, growth, and changes in key metrics over time.
    - Conduct time-series analysis and identify seasonality.
    - Measure growth or decline over specific periods.

SQL Concepts Used:
    - Date Functions: DATEPART(), DATETRUNC(), FORMAT()
    - Aggregate Functions: SUM(), COUNT(), AVG()

Target Tables:
    - gold.fact_sales

Author: Nitin Rawat (@nitinrawat05)
Last Updated: 2025-04-15
----------------------------------------------------------------------------- */

-- 🔹 Analyze Sales Performance Over Time (By Year and Month)
SELECT
    YEAR(order_date) AS order_year,
    MONTH(order_date) AS order_month,
    SUM(sales_amount) AS total_sales,
    COUNT(DISTINCT customer_key) AS total_customers,
    SUM(quantity) AS total_quantity
FROM gold.fact_sales
WHERE order_date IS NOT NULL
GROUP BY YEAR(order_date), MONTH(order_date)
ORDER BY YEAR(order_date), MONTH(order_date);

-- 🔹 Analyze Sales Performance Using DATETRUNC() (Monthly)
SELECT
    DATETRUNC(month, order_date) AS order_date,
    SUM(sales_amount) AS total_sales,
    COUNT(DISTINCT customer_key) AS total_customers,
    SUM(quantity) AS total_quantity
FROM gold.fact_sales
WHERE order_date IS NOT NULL
GROUP BY DATETRUNC(month, order_date)
ORDER BY DATETRUNC(month, order_date);

-- 🔹 Analyze Sales Performance Using FORMAT() (Year-Month)
SELECT
    FORMAT(order_date, 'yyyy-MMM') AS order_date,
    SUM(sales_amount) AS total_sales,
    COUNT(DISTINCT customer_key) AS total_customers,
    SUM(quantity) AS total_quantity
FROM gold.fact_sales
WHERE order_date IS NOT NULL
GROUP BY FORMAT(order_date, 'yyyy-MMM')
ORDER BY FORMAT(order_date, 'yyyy-MMM');
