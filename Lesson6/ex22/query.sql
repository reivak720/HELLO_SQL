USE ap;
go

-- using frame start and end
-- a select statement that defines a frame

SELECT vendor_id, invoice_date, invoice_total,
	SUM(invoice_total) OVER() AS total_invoices,
	SUM(invoice_total) OVER(PARTITION BY vendor_id
		ORDER BY invoice_date
		ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW)
		AS vendor_total
FROM invoices
WHERE invoice_date BETWEEN '2018-04-01' AND '2018-04-30'
;