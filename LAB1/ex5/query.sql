USE my_guitar_shop;
go

/*
Write a SELECT statement that returns these column names and data from the Order_Items table:



item_id 

item_price The item_price column

discount_amount The discount_amount column

quantity The quantity column

price_total A column that’s calculated by multiplying the item price by the quantity

discount_total A column that’s calculated by multiplying the discount amount by the quantity

item_total A column that’s calculated by subtracting the discount amount from the item price and then multiplying by the quantity


Only return rows where the item_total is greater than 500.
Sort the result set by the item_total column in descending sequence.
*/

SELECT item_id, item_price, discount_amount, quantity,
item_price * quantity AS price_total,
discount_amount * quantity AS discount_total,
(item_price - discount_amount) * quantity AS item_total
FROM order_items
WHERE (item_price - discount_amount) * quantity > 500
ORDER BY item_total DESC;