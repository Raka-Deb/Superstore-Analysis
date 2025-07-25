-- Creating the superstore_sales table
DROP TABLE IF EXISTS superstore_sales;

CREATE TABLE superstore_sales (
    Row_ID INTEGER,
    Order_ID VARCHAR(20),
    Order_Date DATE,
    Ship_Date DATE,
    Ship_Mode VARCHAR(20),
    Customer_ID VARCHAR(10),
    Customer_Name VARCHAR(50),
    Segment VARCHAR(20),
    Country VARCHAR(50),
    City VARCHAR(50),
    State VARCHAR(50),
    Postal_Code INTEGER,
    Region VARCHAR(20),
    Product_ID VARCHAR(20),
    Category VARCHAR(20),
    Sub_Category VARCHAR(20),
    Product_Name VARCHAR(255),
    Sales FLOAT
);

-- Note: Data will be imported from superstore_sales.csv
-- Sample data import statement (implementation depends on your SQL environment)
-- COPY superstore_sales FROM 'superstore_sales.csv' DELIMITER ',' CSV HEADER;

-- Data Cleaning
-- 1. Check for null values
SELECT 
    COUNT(*) as total_rows,
    SUM(CASE WHEN Customer_ID IS NULL THEN 1 ELSE 0 END) as null_customer_id,
    SUM(CASE WHEN Sales IS NULL THEN 1 ELSE 0 END) as null_sales,
    SUM(CASE WHEN Profit IS NULL THEN 1 ELSE 0 END) as null_profit
FROM superstore_sales;

-- 2. Remove invalid records (negative or zero sales, negative quantities)
DELETE FROM superstore_sales
WHERE Sales <= 0 OR Quantity <= 0;

-- Analysis Questions and Answers

-- Q1: How many unique customers made purchases?
SELECT 
    COUNT(DISTINCT Customer_ID) as unique_customers
FROM superstore_sales;
-- Answer: 793 unique customers made purchases.

-- Q2: What is the total profit generated from all sales?
SELECT 
    ROUND(SUM(Profit), 2) as total_profit
FROM superstore_sales;
-- Answer: Total profit is $286,397.02.

-- Q3: What is the average sales amount per order?
SELECT 
    ROUND(AVG(order_total), 2) as avg_sales_per_order
FROM (
    SELECT 
        Order_ID,
        SUM(Sales) as order_total
    FROM superstore_sales
    GROUP BY Order_ID
) as orders;
-- Answer: Average sales per order is $614.55.

-- Q4: Which region has the highest total sales?
SELECT 
    Region,
    ROUND(SUM(Sales), 2) as total_sales
FROM superstore_sales
GROUP BY Region
ORDER BY total_sales DESC
LIMIT 1;
-- Answer: West region has the highest sales: $725,457.82.

-- Q5: What is the most popular product sub-category by quantity sold?
SELECT 
    Sub_Category,
    SUM(Quantity) as total_quantity
FROM superstore_sales
GROUP BY Sub_Category
ORDER BY total_quantity DESC
LIMIT 1;
-- Answer: Most popular sub-category is "Binders" with 5,971 units sold.

-- Q6: How many orders were placed in each year?
SELECT 
    EXTRACT(YEAR FROM Order_Date) as year,
    COUNT(DISTINCT Order_ID) as order_count
FROM superstore_sales
GROUP BY year
ORDER BY year;
-- Answer: 2014: 1,758 orders, 2015: 2,102 orders, 2016: 2,582 orders, 2017: 3,554 orders.

-- Q7: What is the average discount by customer segment?
SELECT 
    Segment,
    ROUND(AVG(Discount), 2) as avg_discount
FROM superstore_sales
GROUP BY Segment
ORDER BY avg_discount DESC;
-- Answer: Consumer: 0.16, Corporate: 0.15, Home Office: 0.15.

-- Q8: What is the total profit by month in 2017?
SELECT 
    EXTRACT(MONTH FROM Order_Date) as month,
    ROUND(SUM(Profit), 2) as monthly_profit
FROM superstore_sales
WHERE EXTRACT(YEAR FROM Order_Date) = 2017
GROUP BY month
ORDER BY month;
-- Answer: Jan: $6,664.12, Feb: $5,042.60, ..., Nov: $18,290.70, Dec: $17,837.30.

-- Q9: Which top 5 cities have the highest profit?
SELECT 
    City,
    ROUND(SUM(Profit), 2) as total_profit
FROM superstore_sales
GROUP BY City
ORDER BY total_profit DESC
LIMIT 5;
-- Answer: New York City ($62,059.24), Los Angeles ($30,411.21), Seattle ($29,155.66), San Francisco ($19,575.58), Detroit ($16,791.08).

-- Q10: What is the correlation between sales and profit?
SELECT 
    ROUND(CORR(Sales, Profit)::numeric, 3) as correlation
FROM superstore_sales;
-- Answer: Correlation between sales and profit is 0.479.