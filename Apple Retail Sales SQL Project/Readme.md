## **Project Overview** 
The dataset includes information about products, stores, sales transactions, and warranty claims across various Apple retail locations globally. 

## **Entity Relationship Diagram (ERD)**
.

## **Project Task**
--Projek Task
--Task 1. Find the number of stores in each country
```sql
SELECT country, COUNT(*) AS number_of_stores
FROM stores
GROUP BY country
```
--Task 2. Calculate the total number of units sold by each store
```sql
SELECT a.store_id, b.store_name,SUM(a.quantity) AS number_sold
FROM sales a
LEFT JOIN stores b
ON a.store_id = b.store_id
GROUP BY 1,2
```
--Task 3. Identify how many sales occured in Decmber 2023
```sql
WITH sales_december AS (
SELECT*FROM sales
WHERE sale_date BETWEEN '11-30-2023' AND '1-1-2024')
SELECT COUNT(sale_id)
FROM sales_december
```
--Task 4. Determine how many stores have never had a warranty claim field.
```sql
SELECT a.store_id, COUNT(b.claim_id) AS count_warranty
FROM sales a
LEFT JOIN warranty b
ON a.sale_id=b.sale_id
GROUP BY 1
```

--Task 5. Calculate the percentage of warranty claims marked as "Warranty Void"
--Task 6. Identify which store had the highest total units sold in the last year. max(date)==11 november 2024
```sql
SELECT store_id, SUM(quantity) AS total_units
FROM sales
WHERE EXTRACT(YEAR FROM sale_date) = '2024'
GROUP BY store_id
ORDER BY 2 DESC
LIMIT 1
```
--Task 7. Count the number of unique products sold in the last year.
```sql
SELECT COUNT(DISTINCT product_id)
FROM sales
WHERE EXTRACT(YEAR FROM sale_date) = '2021'
```
--Task 8.Find the average price of products in each category.
```sql
SELECT category_id, AVG(price) AS avg_pirce
FROM products 
GROUP BY category_id
```

--Task 9.How many warranty claims were filed in 2020?
```sql
SELECT COUNT(*) FROM warranty
WHERE EXTRACT(YEAR FROM claim_date) = '2020'
```

--Task 10.For each store, identify the best-selling day based on highest quantity sold.
```sql
WITH best_selling_day AS(
SELECT store_id, TO_CHAR(sale_date,'Day') AS day, SUM(quantity) AS total_quantity,
RANK() OVER(PARTITION BY store_id ORDER BY sum(quantity) DESC) AS ranking
FROM sales
GROUP BY 1,2)

SELECT*FROM best_selling_day
WHERE ranking = 1
```
--Task 11.Identify the least selling product in each country for each year based on total units sold.
```sql
WITH rank_product AS (
SELECT a.country,EXTRACT(YEAR FROM b.sale_date), b.product_id,c.product_name, SUM(b.quantity),
RANK() OVER(PARTITION BY a.country,EXTRACT(YEAR FROM b.sale_date) ORDER BY SUM(b.quantity)) AS ranking
FROM stores a
LEFT JOIN sales b
ON a.store_id=b.store_id
JOIN products c
ON b.product_id=c.product_id
GROUP BY 1,2,3,4
)

SELECT*FROM rank_product
WHERE ranking = 1
```
--Task 12. Calculate how many warranty claims were filed within 180 days of a product sale.
```sql
SELECT COUNT(*) 
FROM(
SELECT a.claim_id, a.sale_id, a.repair_status
FROM warranty a
LEFT JOIN sales b
ON a.sale_id=b.sale_id
WHERE a.claim_date-b.sale_date = 180
)
```
--Task 13.Determine how many warranty claims were filed for products launched in the last two years.
```sql
SELECT COUNT(*) FROM (
SELECT a.claim_id,b.sale_date, b.product_id,c.launch_date
FROM warranty a
LEFT JOIN sales b
ON a.sale_id=b.sale_id
LEFT JOIN products c
ON b.product_id=c.product_id
WHERE EXTRACT(YEAR FROM launch_date) IN ('2023','2024')
)
```
--Task 14.List the months in the last three years where sales exceeded 5,000 units in the USA.
```sql
SELECT TO_CHAR(b.sale_date,'Month') AS  month, a.country, SUM(b.quantity)
FROM stores a
LEFT JOIN sales b
ON a.store_id = b.store_id
WHERE EXTRACT(YEAR FROM sale_date) IN ('2022','2023','2024') AND a.country='United States'
GROUP BY 1,2
HAVING SUM(b.quantity)>5000
```
--Task 15.Identify the product category with the most warranty claims filed in the last two years.
```sql
SELECT a.category_id, COUNT(c.claim_id)
FROM sales b
LEFT JOIN products a
ON b.product_id=a.product_id
LEFT JOIN warranty c
ON b.sale_id=c.sale_id
WHERE EXTRACT(YEAR FROM c.claim_date) IN ('2023','2024')
GROUP BY 1
ORDER BY 2 DESC
```
--Task 16.Determine the percentage chance of receiving warranty claims after each purchase for each country.
```sql
WITH tabel AS(
SELECT a.country, COUNT(b.sale_id) AS total_purchase, COUNT(c.claim_id) AS total_claim
FROM stores a
LEFT JOIN sales b
ON a.store_id=b.store_id
LEFT JOIN warranty c
ON b.sale_id=c.sale_id
WHERE EXTRACT(YEAR FROM b.sale_date) = '2024'
GROUP BY 1
)
SELECT country,ROUND(100*total_claim/total_purchase,2)
FROM tabel
```
--Task 17.Analyze the year-by-year growth ratio for each store. 
```sql
WITH yearly_sales AS(
SELECT a.store_id,EXTRACT(YEAR FROM a.sale_date) AS year, SUM(a.quantity*b.price) AS total_sales
FROM sales a
LEFT JOIN products b
ON a.product_id=b.product_id
GROUP BY 1,2),

growth_funct AS(
SELECT store_id,year,total_sales,
LAG(total_sales) OVER(PARTITION BY store_id ORDER BY year) AS prev_sales
FROM yearly_sales )

SELECT store_id, year, total_sales, 100*(total_sales-prev_sales)/NULLIF(prev_sales,0) AS growth_ratio
FROM growth_funct
WHERE prev_sales IS NOT NULL
ORDER BY store_id, year
```

--Task 18.Calculate the correlation between product price and warranty claims for products sold in the last five years, segmented by price range.
```sql
SElECT DISTINCT b.claim_id,c.price
FROM sales a
LEFT JOIN warranty b
ON a.sale_id=b.sale_id
LEFT JOIN products c
ON a.product_id=c.product_id
WHERE c.price BETWEEN 100 AND 700

SElECT DISTINCT b.claim_id,c.price
FROM sales a
LEFT JOIN warranty b
ON a.sale_id=b.sale_id
LEFT JOIN products c
ON a.product_id=c.product_id
WHERE c.price BETWEEN 701 AND 1300

SElECT DISTINCT b.claim_id,c.price
FROM sales a
LEFT JOIN warranty b
ON a.sale_id=b.sale_id
LEFT JOIN products c
ON a.product_id=c.product_id
WHERE c.price BETWEEN 1301 AND 2000
```

--Task 10.Identify the store with the highest percentage of "Paid Repaired" claims relative to total claims filed.
```sql
WITH tabel AS (
SELECT a.store_id, COUNT(b.claim_id) AS all_claims,
COUNT(CASE WHEN b.repair_status = 'Completed' THEN claim_id END) AS completed_claims
FROM sales a
LEFT JOIN warranty b
ON a.sale_id=b.sale_id
GROUP BY 1
)
SELECT store_id, 100*completed_claims/all_claims AS percentage_claims
FROM tabel
ORDER BY 2 DESC
LIMIT 2
```

--Task 11. Write a query to calculate the monthly running total of sales for each store over 
the past four years and compare trends during this period.
```sql
WITH tabel AS(
SELECT store_id, TO_CHAR(sale_date, 'YYYY-MM') AS year_month,
EXTRACT(YEAR FROM sale_date) AS year, EXTRACT(MONTH FROM sale_date) AS month, COUNT(*) AS monthly_sales
FROM sales
GROUP BY store_id, year_month, year, month
ORDER BY store_id, year, month
)
SELECT store_id, year, month, monthly_sales,
CASE WHEN year=2024 THEN
SUM(monthly_sales) OVER (PARTITION BY store_id ORDER BY year,month) ELSE 0 END AS running_total_now,
CASE WHEN year between 2020 and 2023 THEN
SUM(monthly_sales) OVER (PARTITION BY store_id ORDER BY year,month) ELSE 0 END AS running_total_past
FROM tabel
GROUP BY 1,2,3,4
ORDER BY 1,2,3
```

--Task 12.Analyze product sales trends over time, segmented into key periods: from launch to 6 months, 6-12 months, 12-18 months, and beyond 18 months.
```sql
WITH tabel AS(
SELECT product_id,launch_date, EXTRACT(YEAR FROM AGE(DATE '2024-12-31',launch_date))*12 +
EXTRACT(MONTH FROM AGE( DATE '2024-12-31',launch_date)) AS month_launch
FROM products)

SELECT a.product_id, 
CASE 
	WHEN a.month_launch BETWEEN 0 AND 6 THEN '0-6 month'
	WHEN a.month_launch BETWEEN 7 AND 12 THEN '7-12 month'
	WHEN a.month_launch BETWEEN 13 AND 18 THEN '13-18 month'
	ELSE 'beyond 18 month'
END AS period, SUM(b.quantity)
FROM tabel a
LEFT JOIN sales b
ON a.product_id=b.product_id
GROUP BY 1,2
```

