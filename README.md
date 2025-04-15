# SQL-EDA-Analytical Project

**Author:** Nitin
**Date:** 4/15/2025

## Introduction
This project focuses on performing SQL-based Exploratory Data Analysis (EDA) for various business intelligence tasks. The goal is to extract, analyze, and visualize key metrics from a dataset, utilizing various SQL techniques for data segmentation, performance analysis, and reporting.

## Project Overview
The SQL-EDA-Analytical project leverages SQL queries to analyze and extract insights from a given database. The project covers the following analytical areas:

- **Cumulative Analysis**: Calculating running totals and moving averages for key metrics.
- **Performance Analysis**: Year-over-Year and Month-over-Month performance measurement for products, customers, or regions.
- **Data Segmentation Analysis**: Grouping data into meaningful segments such as cost ranges and customer spending categories.
- **Part-to-Whole Analysis**: Comparing performance across dimensions or time periods to evaluate differences.
- **Customer Report**: Consolidating key customer metrics and behaviors, including recency and spending categories.
- **Product Report**: Aggregating product-level metrics such as total sales, quantity sold, and average order value.

## SQL Queries and Analytical Techniques

### Cumulative Analysis
The purpose of this analysis is to calculate running totals and moving averages to track performance over time.

```sql
-- Calculate the total sales per month and the running total of sales over time
SELECT
    order_date,
    total_sales,
    SUM(total_sales) OVER (ORDER BY order_date) AS running_total_sales,
    AVG(avg_price) OVER (ORDER BY order_date) AS moving_average_price
FROM (
    SELECT 
        DATETRUNC(year, order_date) AS order_date,
        SUM(sales_amount) AS total_sales,
        AVG(price) AS avg_price
    FROM gold.fact_sales
    WHERE order_date IS NOT NULL
    GROUP BY DATETRUNC(year, order_date)
) t;
