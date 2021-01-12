USE ap;
go

-- A SELECT statement that creates peer groups
SELECT vendor_id, invoice_date, invoice_total,
	SUM(invoice_total) OVER() AS total_invoices,
	SUM(invoice_total) OVER(PARTITION BY vendor_id
		ORDER BY invoice_date
		RANGE BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW)
		AS vendor_total
FROM invoices
WHERE invoice_date BETWEEN '2018-04-01' AND '2018-04-30'
;