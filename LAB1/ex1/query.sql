﻿USE my_guitar_shop;
GO

/*
Write a SELECT statement that returns four columns from the Products table: 
product_code, product_name, list_price, and discount_percent. 
Add an ORDER BY clause to this statement 
that sorts the result set by list price in descending sequence.
*/


SELECT product_code, product_name, list_price, discount_percent
FROM products
ORDER BY list_price DESC;

