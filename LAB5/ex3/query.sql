USE my_guitar_shop;
go
/*
Write a SELECT statement that returns the name, 
list_price and discount percent of each product that has a unique discount percent. 
In other words, don’t include products that have the same discount percent as another product.
Sort the result set by the product_name column.
*/

-- with subquery
SELECT product_name, list_price, discount_percent

FROM products
WHERE discount_percent NOT IN (SELECT discount_percent
								FROM products 
								GROUP BY discount_percent
								 HAVING COUNT(discount_percent) > 1)
ORDER BY product_name;
								 

-- with cte:

WITH cte AS (
	SELECT discount_percent
								FROM products 
								GROUP BY discount_percent
								 HAVING COUNT(discount_percent) = 1
								 )
SELECT product_name, list_price, cte.discount_percent
FROM cte join products on cte.discount_percent = products.discount_percent
ORDER BY product_name;
