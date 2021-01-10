USE my_guitar_shop;
go

/*
Write a SELECT statement that returns these column names and data from the Products table:
product_name The product_name column
list_price The list_price column
discount_percent The discount_percent column
discount_amount A column that’s calculated from the previous two columns
discount_price A column that’s calculated from the previous three columns
Round the discount_amount and discount_price columns to 2 decimal places.
Sort the result set by the discount_price column in descending sequence.
Use the LIMIT clause so the result set contains only the first 5 rows.
*/
SELECT TOP (5) product_name, list_price, discount_percent,
ROUND (discount_percent * list_price * .01, 2) AS discount_amount,
ROUND(list_price - (discount_percent * list_price * .01), 2) AS discount_price
FROM products
ORDER BY discount_price DESC;