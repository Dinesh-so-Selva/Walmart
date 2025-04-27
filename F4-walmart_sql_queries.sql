use walmart;

select * from walmart_customer_purchases_rawdata
limit 10;

alter table walmart_customer_purchases_rawdata
change column `Bill amount` Bill_amount int;
 
-- Total Sales by City
SELECT City, SUM(Bill_Amount) AS Total_Sales
FROM walmart_customer_purchases_rawdata
GROUP BY City
ORDER BY Total_Sales DESC;

-- Most popular products
SELECT Product_Name, COUNT(*) AS Purchase_Count
FROM walmart_customer_purchases_rawdata
GROUP BY Product_Name
ORDER BY Purchase_Count DESC
LIMIT 10;

-- Repeat customers vs new
SELECT Repeat_Customer, COUNT(*) AS Count
FROM walmart_customer_purchases_rawdata
GROUP BY Repeat_Customer;

-- Count of customers by gender
SELECT Gender, COUNT(*) AS Total_Customers
FROM walmart_customer_purchases_rawdata
GROUP BY Gender;

-- Average age of customers
SELECT AVG(Age) AS Average_Age FROM walmart_customer_purchases_rawdata;

-- Customer distribution by city
SELECT City, COUNT(DISTINCT Customer_ID) AS Total_Customers
FROM walmart_customer_purchases_rawdata
GROUP BY City;

-- Average rating by gender
SELECT Gender, AVG(Rating) AS Avg_Rating
FROM walmart_customer_purchases_rawdata
GROUP BY Gender;

-- Total and average bill amount
SELECT 
    SUM(`Bill_Amount`) AS Total_Sales,
    AVG(`Bill_Amount`) AS Average_Bill
FROM walmart_customer_purchases_rawdata;
