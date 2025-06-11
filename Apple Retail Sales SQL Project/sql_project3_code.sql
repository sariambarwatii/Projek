DROP TABLE IF EXISTS products;
CREATE TABLE products(
	product_id VARCHAR(10) PRIMARY KEY,	
	product_name VARCHAR(35),
	category_id VARCHAR(10),
	launch_date DATE,	
	price DOUBLE PRECISION
);

DROP TABLE IF EXISTS stores;
CREATE TABLE stores(
	store_id VARCHAR(5) PRIMARY KEY,
	store_name VARCHAR(30),	
	city VARCHAR(25),
	country VARCHAR(25)
);

DROP TABLE IF EXISTS sales;
CREATE TABLE sales(
	sale_id	VARCHAR(15) PRIMARY KEY,
	sale_date DATE,
	store_id VARCHAR(10),
	product_id VARCHAR(10),
	quantity INT
);

DROP TABLE IF EXISTS warranty;
CREATE TABLE warranty(
	claim_id VARCHAR(10) PRIMARY KEY,
	claim_date DATE,	
	sale_id	VARCHAR(15),
	repair_status VARCHAR(15)
);

DROP TABLE IF EXISTS category;
CREATE TABLE category(
	category_id	VARCHAR(10) PRIMARY KEY,
	category_name VARCHAR(20)
);

SELECT*FROM category
SELECT*FROM products
SELECT*FROM sales
SELECT*FROM stores
SELECT*FROM warranty

ALTER TABLE products
ADD CONSTRAINT pk_category
FOREIGN KEY(category_id)
REFERENCES category(category_id);

ALTER TABLE sales
ADD CONSTRAINT pk_products
FOREIGN KEY(product_id)
REFERENCES products(product_id);

ALTER TABLE sales
ADD CONSTRAINT pk_stores
FOREIGN KEY(store_id)
REFERENCES stores(store_id);

ALTER TABLE warranty
ADD CONSTRAINT pk_sales
FOREIGN KEY(sale_id)
REFERENCES sales(sale_id);




