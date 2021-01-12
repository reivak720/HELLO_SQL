USE my_guitar_shop;
go

-- ex5 with cross apply
WITH CTE AS 
    (SELECT c.customer_id,c.email_address, COUNT(*) order_count from customers c
    INNER JOIN orders o on o.customer_id = c.customer_id
    GROUP BY c.customer_id,c.email_address
    HAVING COUNT(*) > 1
    )    
SELECT c.email_address, c.order_Count,  t1.order_total
FROM CTE c
INNER JOIN ORders o on C.customer_id = o.Customer_ID
CROSS APPLY (SELECT  SUM( (oi.Item_Price - oi.discount_amount) * oi.quantity) as order_total ,
            COUNT(oi.quantity) OVER (PARTITION BY oi.order_id) AS items_quantity
                FROM order_items oi 
                WHERE oi.order_id = o.order_id GROUP BY oi.order_id, oi.quantity) t1 
ORDER BY items_quantity DESC 
;