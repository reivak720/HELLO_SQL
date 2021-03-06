USE my_guitar_shop;

/*
Write a SELECT statement that returns one row for each customer that has orders with these columns:

The email_address column from the Customers table
A count of the number of orders aliased as order_count
The total amount for each order aliased as order_total (Hint: First, subtract the discount amount from the price. Then, multiply by the quantity.)
Return only those rows where the customer has more than 1 order.
Sort the result set in descending sequence by the sum of the line item amounts.
*/

SELECT  c.email_address, t1.customer_orders, t2.order_total
FROM customers c
JOIN
	(SELECT customer_id, order_id,
		COUNT(customer_id) OVER(PARTITION BY customer_id) AS customer_orders
		FROM orders) AS t1
	ON c.customer_id = t1.customer_id
JOIN (SELECT oi.order_id,
		COUNT(oi.quantity) OVER (PARTITION BY oi.order_id) AS items_quantity,
		SUM((oi.item_price - oi.discount_amount) * oi.quantity)  AS order_total
		FROM order_items oi
		GROUP BY order_id, oi.quantity) AS t2
	ON t2.order_id = t1.order_id
WHERE customer_orders > 1
ORDER BY items_quantity DESC
;
