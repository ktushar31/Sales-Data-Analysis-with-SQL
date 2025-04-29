CREATE TABLE IF NOT EXISTS sales(
	invoice_id VARCHAR(30) NOT NULL PRIMARY KEY,
    branch VARCHAR(5) NOT NULL,
    city VARCHAR(30) NOT NULL,
    customer_type VARCHAR(30) NOT NULL,
    gender VARCHAR(30) NOT NULL,
    product_line VARCHAR(100) NOT NULL,
    unit_price DECIMAL(10,2) NOT NULL,
    quantity INT NOT NULL,
    tax_pct FLOAT(6,4) NOT NULL,
    total DECIMAL(12, 4) NOT NULL,
    dateT DATETIME NOT NULL,
    time TIME NOT NULL,
    payment VARCHAR(15) NOT NULL,
    cogs DECIMAL(10,2) NOT NULL,
    gross_margin_pct FLOAT(11,9),
    gross_income DECIMAL(12, 4),
    rating FLOAT(2, 1)
);

SELECT * FROM sales;


SELECT 
	MONTHNAME(dateT)
FROM sales;

ALTER TABLE sales ADD COLUMN month VARCHAR(20);
UPDATE sales
SET month=MONTHNAME(dateT);

SELECT
	DAYNAME(dateT)
FROM sales;

ALTER TABLE sales ADD COLUMN day_name VARCHAR(20);
UPDATE sales
SET day_name=DAYNAME(dateT);


--  How many unique cities does the data have?

SELECT 
	city
FROM sales
group by city;



-- In which city is each branch?

SELECT
	city, branch
FROM sales
group by city, branch;



--  How many unique product lines does the data have?

SELECT
	product_line
FROM sales
group by product_line;



-- What is the most common payment method?

SELECT
	payment,
    sum(quantity) as qt
FROM sales
GROUP BY payment
ORDER BY qt DESC;


-- What is the most selling product line?

SELECT
	product_line,
    sum(quantity) AS qt
FROM sales
group by product_line
order by qt desc;


-- What is the total revenue by month?


SELECT
sum(total)as total_rev,
month
FROM sales
group by month
order by total_rev;


-- What month had the largest COGS?

SELECT
month,
sum(cogs)as cogs
FROM sales
group by month
order by cogs desc;



-- What product line had the largest revenue?


SELECT
product_line,
sum(total) as total_rev
FROM sales
group by product_line
order by total_rev desc;


-- What is the city with the largest revenue?

SELECT
city,
sum(total)as total_rev
FROM sales
group by city
order by total_rev desc;


--  Fetch each product line and add a column to those product line showing "Good", "Bad". Good if its greater than average sales


SELECT 
AVG(quantity) as avg_qty
FROM sales;

SELECT
product_line,
CASE
		WHEN AVG(quantity) > 5.5 THEN "Good"
        ELSE "Bad"
    END AS remark
FROM sales
group by product_line;



-- What is the most common product line by gender

SELECT
gender,
product_line,
count(gender) as total
FROM sales
group by gender, product_line
order by total desc;


--  What is the average rating of each product line

SELECT
product_line,
AVG(rating) as rating
FROM sales
group by product_line
order by rating;


-- Which of the customer types brings the most revenue?

SELECT
customer_type,
SUM(total) as total_rev
FROM sales
group by customer_type
order by total_rev;


-- Which city has the largest tax/VAT percent?

SELECT
city,
round(AVG(tax_pct),2) as tax_pct
FROM sales
group by city
order by tax_pct desc;


-- Which customer type pays the most in VAT?

SELECT
customer_type,
AVG(tax_pct) as vat
FROM sales
group by customer_type
order by vat desc;


-- How many unique customer types does the data have?

SELECT
DISTINCT(customer_type)
 FROM sales;


-- How many unique payment methods does the data have?

SELECT
DISTINCT(payment)
 FROM sales;
 
 --  What is the most common customer type?
 
SELECT
customer_type,
count(*)as count
FROM sales
group by customer_type
order by count desc;

--  What is the gender of most of the customers?

SELECT
gender,
count(*)as count
FROM sales
group by gender
order by count desc;


-- What is the gender distribution per branch?

SELECT
branch ,gender,
count(gender) as count
FROM sales
group by branch ,gender
order by count;



