USE my_guitar_shop;
go

-- havin fun on ex4

DROP FUNCTION IF EXISTS myFun1;
go
CREATE FUNCTION myFun1 (
    @customer_id INT
)
RETURNS TABLE
AS
RETURN
    SELECT 
        o.order_id,
         COUNT(customer_id) OVER(PARTITION BY customer_id) AS order_count,
         SUM( (oi.Item_Price - oi.discount_amount) * oi.quantity) AS order_total,
         SUM(COUNT(oi.quantity)) OVER (PARTITION BY oi.order_id) AS items_quantity
    FROM
        orders o
    JOIN order_items oi
        ON o.order_id = oi.order_id

    WHERE
        customer_id = @customer_id
        GROUP BY customer_id, o.order_id, oi.quantity, oi.order_id
;
go

SELECT  email_address, order_total, order_count
FROM customers c
CROSS APPLY myFun1(c.customer_id)
WHERE order_count > 1
ORDER BY items_quantity DESC, order_total DESC;
go