USE my_guitar_shop;
go
/*
Write a SELECT statement that joins the Customers, Orders, Order_Items, and Products tables.
This statement should return these columns: 
last_name, first_name, order_date, product_name, item_price, discount_amount, and quantity.
Use aliases for the tables.
Sort the final result set by the last_name, order_date, and product_name columns.
*/

-- dicided to use left join since this gets all customers even without orders
-- and if there where any orders with no products
-- use inner join to get only customers with orders and orders with products
SELECT last_name, first_name, order_date, product_name, item_price, discount_amount, quantity
FROM customers c
	LEFT JOIN orders o
		ON c.customer_id = o.customer_id
	LEFT JOIN order_items o_i
		ON o.order_id = o_i.order_id
	LEFT JOIN products p
		ON p.product_id = o_i.product_id
ORDER BY last_name, order_date, product_name;