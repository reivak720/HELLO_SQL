USE my_guitar_shop;
go

/*
Write a SELECT statement without a FROM clause that creates a row with these columns:



price 100 (dollars)

tax_rate .07 (7 percent)

tax_amount The price multiplied by the tax

total The price plus the tax


To calculate the fourth column, add the expressions you used for the first and third columns.
*/
SELECT 100 AS price, 0.07 AS tax_rate, 
100 * 0.07 AS tax_amount,
100 + (100*0.07) AS total;