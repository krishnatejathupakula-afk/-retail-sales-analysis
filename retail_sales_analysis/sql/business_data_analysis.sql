-- RETAIL SALES DATA ANALYSIS -- 

use retail_sales_analysis;
show tables;

-- 1. Total data in the limit of 10 --

select * from cleaned_sales_data
limit 10;

-- 2. Total sales and Profit --

select sum(sales) as total_sales,
sum(profit) as total_profit
from cleaned_sales_data;

-- 3. Counting number of records -- 

select count(*) from cleaned_sales_data;

-- 4. region wise sales and profit --

select region, sum(sales) as total_sales,
sum(profit) as total_profit 
from cleaned_sales_data
group by region;

-- 5. City wise Sales on Profit from highest  --

select city, sum(sales) as total_sales,
sum(profit) as total_profit
from cleaned_sales_data
group by city
order by total_profit desc, total_sales desc;

-- 6. Total sales and Profit in sub_category wisev --

select sub_category, sum(sales) as total_sales,
sum(profit) as total_profit
from cleaned_sales_data
group by sub_category;

-- 7. Segment wise Total sales and profit -- 

select segment, sum(sales) as total_sales,
sum(profit) as total_profit
from cleaned_sales_data
group by segment;

-- 8. State wise Sales from highest --

select state, sum(sales) as total_sales 
from cleaned_sales_data
group by state 
order by total_sales desc;

-- 9. Total sales and profit in the year 2016 --

select sum(sales) as total_sales,
sum(profit) as total_profit
from cleaned_sales_data
where order_year = 2016;

-- 10.Category wise discount impact on profitability --

 select category, avg(discount) as average_discount,
sum(profit) as total_profit 
from cleaned_sales_data
group by category
order by average_discount desc;

-- 11. Top profitable cities with high sales volume --

select city, sum(profit) as total_profit,
sum(sales) as total_sales
from cleaned_sales_data
group by city
having total_sales > 50000
order by total_profit desc
limit 5;

-- 12.Regions with high average shipping delay --

select region, avg(ship_days) as avg_shipping_days
from cleaned_sales_data
group by region
having avg(ship_days) > 5;

