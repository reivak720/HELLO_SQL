USE my_guitar_shop;
go

/*
Write a SELECT statement that returns three columns: email_address, order_id, and the order total for each customer.
To do this, you can group the result set by the email_address and order_id columns. 
In addition, you must calculate the order total from the columns in the Order_Items table.

Write a second SELECT statement that uses the first SELECT statement in its FROM clause. 
The main query should return three columns: 
the customer’s email address and the largest order (aliased as max_order_total) and the smallest order_id (aliased as min_order_id).
To do this, you can group the result set by the email_address.
Sort the result set by the largest order in descending sequence.
*/
-- I get for all customers, ones without orders null values are replaced with 0.

SELECT t1.email_address,
		MAX(ISNULL(t1.order_total,0)) AS max_order_total,
		MIN(ISNULL(t1.order_total,0)) AS min_order_total
FROM (
	SELECT c.email_address, o.order_id,	
			SUM((oi.item_price - oi.discount_amount) * oi.quantity) AS order_total
	FROM customers c
		LEFT JOIN orders o
		ON c.customer_id = o.customer_id
		LEFT JOIN order_items oi
		ON o.order_id = oi.order_id
	GROUP BY c.email_address, o.order_id) AS t1
GROUP BY t1.email_address
ORDER BY max_order_total DESC
;