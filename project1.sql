Create database Project1

use project1

create table retail_sales (
transactions_id INT PRIMARY KEY,
    sale_date DATE,
    sale_time TIME,
    customer_id INT,
    gender VARCHAR(10),
    age INT,
    category VARCHAR(50),
    quantity INT,
    price_per_unit DECIMAL(10,2),
    cogs DECIMAL(10,2),
    total_sale DECIMAL(10,2)
);

select * from retail_sales


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

with yearly_sales as (
select
extract(year from sale_date) as year,
sum(total_sale) as total_sales
from retail_sales
group by extract(year from sale_date)
)
select
year,
total_sales,
rank() over(order by total_sales desc) as sales_rank
from yearly_sales;





with yearly_sales as (
SELECT EXTRACT(YEAR FROM sale_date) AS year,
       SUM(total_sale) AS total_sales
FROM retail_sales
GROUP BY EXTRACT(YEAR FROM sale_date)
ORDER BY total_sales DESC)
select 
year,total_sales,
rank() over (order by total_sales desc) as sales_rank
from yearly_sales;


with gender_sales AS (
select
gender,
Sum (total_sale) as total_sales,
from retail_sales
group by gender
)




select 
gender,
 sum(total_sale) as total_sales
from retail_sales
group by gender;


select * from retail_sales

SELECT 
    gender,
    SUM(total_sale) as total_sales
FROM retail_sales
WHERE gender IN ('Male', 'Female', 'M', 'F') 
GROUP BY gender;




SELECT 
    gender,
    SUM(total_sale) AS total_sales,
    ROUND(100 * SUM(total_sale) / (SELECT SUM(total_sale) FROM retail_sales), 2) AS percentage_of_total
FROM retail_sales
GROUP BY gender
ORDER BY total_sales DESC;
































