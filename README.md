Retail Sales Analysis
-This project contains SQL Queries for analyzing retail sales data.The analysis is designed to help uncover insights such as sales performance,seasonal trends, and other key business metrics.

Features
 - SQL queries for sales, products, customers, and trends
- Example datasets for practice
- Well-commented scripts for learning and adaptation

Folder Structure
Retail sales Analysis
Queries
Data
-Sample data.csv

How to use
-Open MySQL WOrkbench
-Import the sample data by creating database and tables
-Open and run the queries

Requirements
-MySQL Workbench

Example
- SQL Query
-- Total monthly sales and their ranks
  WITH monthly_sales AS (
  SELECT
    EXTRACT(MONTH FROM sale_date) AS month,
    SUM(total_sale) AS total_sales
  FROM retail_sales
  GROUP BY EXTRACT(MONTH FROM sale_date)
)
SELECT
  month,
  total_sales,
  RANK() OVER (ORDER BY total_sales DESC) AS sales_rank
FROM monthly_sales;

Sample Output

| month | totalsales | rank |
| 1     | 15000      |  1   |
| 6     | 14000      |  2   |

Contributing 
Pull requests are welcome! For major changes, please open an issue first to discuss what you would like to change.

Contact
Shiva Adigoppula - [GitHub](https://github.com/ShivaAdigoppula)
Gmail:Shivaadigoppula1010@gmail.com



