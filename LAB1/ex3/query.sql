USE my_guitar_shop;
GO

/*
Write a SELECT statement that returns these columns from the Products table:
product_name The product_name column
list_price The list_price column
date_added The date_added column
Return only the rows with a list price that’s greater than 500 and less than 2000.
Sort the result set by the date_added column in descending sequence.
*/
SELECT product_name, list_price, date_added
from products
where list_price > 500 and list_price < 2000
ORDER BY date_added DESC;