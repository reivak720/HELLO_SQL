USE ap;
go

-- DISPLAY ONLY THE SUMMARY ROWS

SELECT invoice_date,
		CASE
	WHEN GROUPING_ID(invoice_date, payment_date) = 0 THEN N'invoice total'
	WHEN GROUPING_ID(invoice_date, payment_date) = 1 THEN N'Invoice date total' 
	WHEN GROUPING_ID(invoice_date, payment_date) = 3 THEN N'Grand totals'
	ELSE 'Unknown'
	END AS N'Total ID'
,
	SUM(invoice_total) AS invoice_total,
	SUM(invoice_total - credit_total - payment_total) AS balace_due

FROM invoices
WHERE invoice_date BETWEEN '2018-07-24' AND '2018-07-31'
GROUP BY invoice_date, payment_date WITH ROLLUP
HAVING GROUPING_ID(invoice_date, payment_date) IN (1, 3);