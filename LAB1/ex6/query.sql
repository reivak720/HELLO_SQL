USE my_guitar_shop;
go
/*
Write a SELECT statement that returns these columns from the Orders table:



order_id The order_id column

order_date The order_date column

ship_date The ship_date column


Return only the rows where the ship_date column contains a null value.
Sort the result set by the order_id column in descending sequence.
*/

SELECT order_id, order_date, ship_date
FROM orders
WHERE SHIP_DATE IS NULL
ORDER BY order_id DESC;