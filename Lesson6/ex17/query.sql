USE ap;
go

-- to diffence the null values from our rollup values
-- we use grouping function

-- a summary query that uses WITH ROLLUP on a table with
-- null values
/*
SELECT invoice_date, payment_date,
	SUM(invoice_total) AS invoice_total,
	SUM(invoice_total - credit_total - payment_total)
AS balace_due
FROM invoices
WHERE invoice_date BETWEEN '2018-07-24' AND '2018-07-31'
GROUP BY invoice_date, payment_date WITH ROLLUP
*/
-- HARD TO DIFERENTIATE WHO PAID AND WHAT IS ROLLUP

-- a query that substitutes literals for nulls in summary rows
/*
SELECT 
		
	   IF(GROUPING(invoice_date) = 1, 'Grand totals',
			invoice_date) AS invoice_date,
	   IF(GROUPING(payment_date) = 1, 'Invoice date totals',
			payment_date) AS payment_date,
		SUM(invoice_total) AS invoice_total,
		SUM(invoice_total - credit_total - payment_total)
			AS balance_due
FROM invoices
WHERE invoice_date BETWEEN '2018-07-24' AND '2018-07-31'
GROUP BY invoice_date, payment_date, with ROLLUP;
*/

-- Similar for sql server but add a column to differentiate
-- instead of writing in invoice_date or payment_date

SELECT invoice_date, payment_date,

	SUM(invoice_total) AS invoice_total,
	SUM(invoice_total - credit_total - payment_total) AS balace_due,
		CASE
	WHEN GROUPING_ID(invoice_date, payment_date) = 0 THEN N'invoice total'
	WHEN GROUPING_ID(invoice_date, payment_date) = 1 THEN N'Invoice date total' 
	WHEN GROUPING_ID(invoice_date, payment_date) = 3 THEN N'Grand totals'
	ELSE 'Unknown'
	END AS N'Totals'

FROM invoices
WHERE invoice_date BETWEEN '2018-07-24' AND '2018-07-31'
GROUP BY invoice_date, payment_date WITH ROLLUP;