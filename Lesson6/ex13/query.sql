USE ap;
go

-- a summary query with a compund condition
-- in the HAVING clause
SELECT
	invoice_date, 
	COUNT(*) AS invoice_qty,
	SUM(invoice_total) AS invoice_sum
FROM invoices
GROUP BY invoice_date
HAVING invoice_date BETWEEN '2018-05-01' AND '2018-05-31'
	AND COUNT(*) > 1
	AND SUM(invoice_total) > 100
ORDER BY invoice_date DESC;