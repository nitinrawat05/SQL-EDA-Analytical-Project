/* -----------------------------------------------------------------------------
📊 MEASURES EXPLORATION SCRIPT (Key Metrics)
-------------------------------------------------------------------------------
Purpose:
    - Calculate key business metrics (totals, averages).
    - Provide a quick view of overall performance indicators.

SQL Functions Used:
    - COUNT(), SUM(), AVG()
    
Target Tables:
    - gold.fact_sales
    - gold.dim_products
    - gold.dim_customers

Author: Nitin Rawat (@nitinrawat05)
Last Updated: 2025-04-15
----------------------------------------------------------------------------- */

-- 🔹 Total Sales Amount
SELECT SUM(sales_amount) AS total_sales FROM gold.fact_sales;

-- 🔹 Total Quantity Sold
SELECT SUM(quantity) AS total_quantity FROM gold.fact_sales;

-- 🔹 Average Selling Price
SELECT AVG(price) AS avg_price FROM gold.fact_sales;

-- 🔹 Total Number of Orders
SELECT COUNT(order_number) AS total_orders FROM gold.fact_sales;
-- ✅ (Preferred for accuracy) Count unique order numbers
SELECT COUNT(DISTINCT order_number) AS total_orders FROM gold.fact_sales;

-- 🔹 Total Number of Products
SELECT COUNT(DISTINCT product_name) AS total_products FROM gold.dim_products;

-- 🔹 Total Number of Customers
SELECT COUNT(DISTINCT customer_key) AS total_customers FROM gold.dim_customers;

-- 🔹 Customers Who Placed Orders
SELECT COUNT(DISTINCT customer_key) AS active_customers FROM gold.fact_sales;

-- 🔹 Combined Metrics Summary Report
SELECT 'Total Sales' AS measure_name, SUM(sales_amount) AS measure_value FROM gold.fact_sales
UNION ALL
SELECT 'Total Quantity', SUM(quantity) FROM gold.fact_sales
UNION ALL
SELECT 'Average Price', AVG(price) FROM gold.fact_sales
UNION ALL
SELECT 'Total Orders', COUNT(DISTINCT order_number) FROM gold.fact_sales
UNION ALL
SELECT 'Total Products', COUNT(DISTINCT product_name) FROM gold.dim_products
UNION ALL
SELECT 'Total Customers', COUNT(DISTINCT customer_key) FROM gold.dim_customers;
