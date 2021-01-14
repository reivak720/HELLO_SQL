USE my_guitar_shop;
go
/*
Use a correlated subquery to return one row per customer, 
representing the customer’s oldest order (the one with the earliest date).
Each row should include these three columns: email_address, oldest_order_id, and oldest_order_date. 
Only include customers who have placed an order.
Sort the result set by the oldest_order_date and oldest_order_id columns.
*/
SELECT email_address, 
		order_id AS oldest_order_id,
		order_date AS oldest_order_date	
FROM customers c
JOIN orders o
	ON c.customer_id = o.customer_id
WHERE o.order_date in (SELECT MIN(order_date) 
						FROM orders 
						GROUP BY (customer_id))
order by oldest_order_date, oldest_order_id;


