# Sales Data Analysis with SQL

This project demonstrates how SQL can be used to clean, analyze, and derive insights from sales data. It is designed as a practical exercise in data analysis using real-world techniques.

## 📊 Project Overview

- **Objective:** Perform data cleaning and analysis on a sales dataset to uncover trends and insights.
- **Tools Used:** MySQL, Excel
- **Skills Demonstrated:** Data cleaning, SQL querying, business analysis, report generation

## 📁 Dataset

The dataset contains historical sales transactions, including:
- Order ID
- Date of purchase
- Product name and category
- Sales amount
- Quantity sold
- Customer and region information


## 🧹 Data Cleaning

Performed the following cleaning steps:
- Removed duplicate rows
- Handled missing values
- Standardized date formats
- Ensured consistency in product names and categories

## 📈 Key Analysis Performed

- Total revenue and profit by region
- Monthly and yearly sales trends
- Best-selling products and categories
- Top customers by revenue
- Regional performance comparison

## 📌 Sample SQL Queries

```sql
-- Total sales by region
SELECT region, SUM(sales) AS total_sales
FROM sales_data
GROUP BY region;

-- Monthly sales trend
SELECT MONTH(order_date) AS month, SUM(sales) AS monthly_sales
FROM sales_data
GROUP BY month
ORDER BY month;


## 📊 Visualizations

The file [Sales_Analysis_Charts.xlsx](Sales_Analysis_Charts.xlsx) contains Excel PivotCharts built from SQL-cleaned sales data.  
It includes:
- Total Sales by Month
- Sales by Product Line
- Payment Method Distribution
- Sales by City

