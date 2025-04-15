/* -----------------------------------------------------------------------------
📊 CUMULATIVE ANALYSIS SCRIPT
-------------------------------------------------------------------------------
Purpose:
    - Calculate running totals or moving averages for key metrics.
    - Track performance over time cumulatively.
    - Identify long-term trends and growth patterns.

SQL Concepts Used:
    - Window Functions: SUM() OVER(), AVG() OVER()

Target Tables:
    - gold.fact_sales

Author: Nitin Rawat (@nitinrawat05)
Last Updated: 2025-04-15
----------------------------------------------------------------------------- */

-- 🔹 Calculate the Total Sales per Month and the Running Total of Sales Over Time
SELECT
    order_date,
    total_sales,
    SUM(total_sales) OVER (ORDER BY order_date) AS running_total_sales,
    AVG(avg_price) OVER (ORDER BY order_date) AS moving_average_price
FROM
(
    -- Subquery: Calculate Total Sales and Average Price Per Year
    SELECT 
        DATETRUNC(year, order_date) AS order_date,
        SUM(sales_amount) AS total_sales,
        AVG(price) AS avg_price
    FROM gold.fact_sales
    WHERE order_date IS NOT NULL
    GROUP BY DATETRUNC(year, order_date)
) t;
