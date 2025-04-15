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
The purpose of this analysis is to calculate running totals and moving averages to track performance over time. This helps in identifying trends and measuring the ongoing performance of key business metrics.

**Explanation:**  
This analysis calculates the running total of sales over time and the moving average of prices. The moving average can help smooth out fluctuations in prices, while the running total provides an accumulated view of sales performance.

---

### Performance Analysis (Year-over-Year, Month-over-Month)
This analysis compares the yearly performance of products by looking at current sales versus historical data, helping to evaluate how products or regions perform over different periods.

**Explanation:**  
This technique helps calculate Year-over-Year (YoY) and Month-over-Month (MoM) changes in sales performance, allowing for comparison of current performance against previous years or months. This provides insights into whether the sales of a product are improving or declining compared to previous years.

---

### Data Segmentation Analysis
This analysis involves categorizing data into meaningful segments based on cost ranges, customer spending habits, or other relevant metrics.

**Explanation:**  
In this analysis, products are segmented into various cost categories. This segmentation helps identify which cost ranges contribute the most to overall business performance, aiding in pricing and inventory decisions.

---

### Part-to-Whole Analysis
In part-to-whole analysis, individual data points are compared with overall totals or totals for a given time period. This is useful for analyzing contributions of specific metrics to the overall performance.

**Explanation:**  
This analysis shows the relative contribution of each product to the total sales, helping businesses understand how individual items are performing in the context of the entire product portfolio. This can guide sales strategies and inventory management.

---

### Customer Report
The customer report consolidates key customer metrics and behaviors, including recency (how recently a customer made a purchase), frequency (how often they purchase), and monetary (how much they spend).

**Explanation:**  
The customer report segments customers based on their purchasing behavior, such as how recently they purchased, how often they buy, and how much they spend on average. This analysis helps businesses identify high-value customers and tailor retention strategies.

---

### Product Report
The product report aggregates product-level metrics such as total sales, quantity sold, and average order value to track the performance of each product.

**Explanation:**  
This analysis helps businesses track the performance of individual products by measuring total sales, quantity sold, and average order value. It provides insights into which products are performing well and which need more attention or promotional efforts.

---

## Key Metrics
- **Recency**: The number of months since the last order or sale.
- **Average Order Value (AOV)**: The average sales amount per order.
- **Average Monthly Spend**: The average total spend per customer per month.
- **Total Sales**: The sum of all sales for a product or customer.
- **Total Quantity Sold**: The total quantity of products sold.

## Conclusion
The SQL-EDA-Analytical project provides a comprehensive approach to understanding and analyzing business metrics. By utilizing advanced SQL techniques such as window functions, data aggregation, and segmentation, businesses can extract valuable insights that help in decision-making and performance tracking.
