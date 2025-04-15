\documentclass{article}
\usepackage{geometry}
\geometry{a4paper}

\title{SQL-EDA-Analytical Project}
\author{Your Name}
\date{\today}

\begin{document}

\maketitle

\section{Introduction}
This project focuses on performing SQL-based Exploratory Data Analysis (EDA) for various business intelligence tasks. The goal is to extract, analyze, and visualize key metrics from a dataset, utilizing various SQL techniques for data segmentation, performance analysis, and reporting.

\section{Project Overview}
The SQL-EDA-Analytical project leverages SQL queries to analyze and extract insights from a given database. The project covers the following analytical areas:

\begin{itemize}
    \item \textbf{Cumulative Analysis:} Calculating running totals and moving averages for key metrics.
    \item \textbf{Performance Analysis:} Year-over-Year and Month-over-Month performance measurement for products, customers, or regions.
    \item \textbf{Data Segmentation Analysis:} Grouping data into meaningful segments such as cost ranges and customer spending categories.
    \item \textbf{Part-to-Whole Analysis:} Comparing performance across dimensions or time periods to evaluate differences.
    \item \textbf{Customer Report:} Consolidating key customer metrics and behaviors, including recency and spending categories.
    \item \textbf{Product Report:} Aggregating product-level metrics such as total sales, quantity sold, and average order value.
\end{itemize}

\section{SQL Queries and Analytical Techniques}
\subsection{Cumulative Analysis}
The purpose of this analysis is to calculate running totals and moving averages to track performance over time.

\begin{verbatim}
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
\end{verbatim}

\subsection{Performance Analysis (Year-over-Year, Month-over-Month)}
This analysis compares the yearly performance of products by looking at current sales versus historical data.

\begin{verbatim}
WITH yearly_product_sales AS (
    SELECT
        YEAR(f.order_date) AS order_year,
        p.product_name,
        SUM(f.sales_amount) AS current_sales
    FROM gold.fact_sales f
    LEFT JOIN gold.dim_products p
        ON f.product_key = p.product_key
    WHERE f.order_date IS NOT NULL
    GROUP BY 
        YEAR(f.order_date),
        p.product_name
)
SELECT
    order_year,
    product_name,
    current_sales,
    AVG(current_sales) OVER (PARTITION BY product_name) AS avg_sales,
    current_sales - AVG(current_sales) OVER (PARTITION BY product_name) AS diff_avg,
    CASE 
        WHEN current_sales - AVG(current_sales) OVER (PARTITION BY product_name) > 0 THEN 'Above Avg'
        WHEN current_sales - AVG(current_sales) OVER (PARTITION BY product_name) < 0 THEN 'Below Avg'
        ELSE 'Avg'
    END AS avg_change,
    LAG(current_sales) OVER (PARTITION BY product_name ORDER BY order_year) AS py_sales,
    current_sales - LAG(current_sales) OVER (PARTITION BY product_name ORDER BY order_year) AS diff_py,
    CASE 
        WHEN current_sales - LAG(current_sales) OVER (PARTITION BY product_name ORDER BY order_year) > 0 THEN 'Increase'
        WHEN current_sales - LAG(current_sales) OVER (PARTITION BY product_name ORDER BY order_year) < 0 THEN 'Decrease'
        ELSE 'No Change'
    END AS py_change
FROM yearly_product_sales
ORDER BY product_name, order_year;
\end{verbatim}

\subsection{Data Segmentation Analysis}
This query segments products into cost ranges and customers into spending categories.

\begin{verbatim}
WITH product_segments AS (
    SELECT
        product_key,
        product_name,
        cost,
        CASE 
            WHEN cost < 100 THEN 'Below 100'
            WHEN cost BETWEEN 100 AND 500 THEN '100-500'
            WHEN cost BETWEEN 500 AND 1000 THEN '500-1000'
            ELSE 'Above 1000'
        END AS cost_range
    FROM gold.dim_products
)
SELECT 
    cost_range,
    COUNT(product_key) AS total_products
FROM product_segments
GROUP BY cost_range
ORDER BY total_products DESC;
\end{verbatim}

\section{Key Metrics}
\begin{itemize}
    \item \textbf{Recency:} The number of months since the last order or sale.
    \item \textbf{Average Order Value (AOV):} The average sales amount per order.
    \item \textbf{Average Monthly Spend:} The average total spend per customer per month.
    \item \textbf{Total Sales:} The sum of all sales for a product or customer.
    \item \textbf{Total Quantity Sold:} The total quantity of products sold.
\end{itemize}

\section{Conclusion}
The SQL-EDA-Analytical project provides a comprehensive approach to understanding and analyzing business metrics. By utilizing advanced SQL techniques such as window functions, data aggregation, and segmentation, businesses can extract valuable insights that help in decision-making and performance tracking.

\end{document}
