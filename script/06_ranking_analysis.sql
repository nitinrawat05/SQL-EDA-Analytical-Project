/* -----------------------------------------------------------------------------
📈 RANKING ANALYSIS SCRIPT
-------------------------------------------------------------------------------
Purpose:
    - Rank products and customers based on key business metrics.
    - Identify top-performing and underperforming entities.

SQL Concepts Used:
    - Ranking Functions: RANK(), DENSE_RANK(), ROW_NUMBER()
    - Clauses: TOP, GROUP BY, ORDER BY
    - Joins between fact and dimension tables

Target Tables:
    - gold.fact_sales
    - gold.dim_products
    - gold.dim_customers

Author: Nitin Rawat (@nitinrawat05)
Last Updated: 2025-04-15
----------------------------------------------------------------------------- */

-- 🔹 Top 5 Products by Total Revenue (Simple Ranking)
SELECT TOP 5
    p.product_name,
    SUM(f.sales_amount) AS total_revenue
FROM gold.fact_sales f
LEFT JOIN gold.dim_products p
    ON p.product_key = f.product_key
GROUP BY p.product_name
ORDER BY total_revenue DESC;

-- 🔹 Top 5 Products by Revenue using RANK() Window Function
SELECT *
FROM (
    SELECT
        p.product_name,
        SUM(f.sales_amount) AS total_revenue,
        RANK() OVER (ORDER BY SUM(f.sales_amount) DESC) AS rank_products
    FROM gold.fact_sales f
    LEFT JOIN gold.dim_products p
        ON p.product_key = f.product_key
    GROUP BY p.product_name
) AS ranked_products
WHERE rank_products <= 5;

-- 🔹 Bottom 5 Products by Revenue (Underperformers)
SELECT TOP 5
    p.product_name,
    SUM(f.sales_amount) AS total_revenue
FROM gold.fact_sales f
LEFT JOIN gold.dim_products p
    ON p.product_key = f.product_key
GROUP BY p.product_name
ORDER BY total_revenue ASC;

-- 🔹 Top 10 Customers by Revenue
SELECT TOP 10
    c.customer_key,
    c.first_name,
    c.last_name,
    SUM(f.sales_amount) AS total_revenue
FROM gold.fact_sales f
LEFT JOIN gold.dim_customers c
    ON c.customer_key = f.customer_key
GROUP BY 
    c.customer_key,
    c.first_name,
    c.last_name
ORDER BY total_revenue DESC;

-- 🔹 Bottom 3 Customers by Number of Orders
SELECT TOP 3
    c.customer_key,
    c.first_name,
    c.last_name,
    COUNT(DISTINCT f.order_number) AS total_orders
FROM gold.fact_sales f
LEFT JOIN gold.dim_customers c
    ON c.customer_key = f.customer_key
GROUP BY 
    c.customer_key,
    c.first_name,
    c.last_name
ORDER BY total_orders ASC;
