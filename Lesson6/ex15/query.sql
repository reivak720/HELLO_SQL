USE ap;
go

-- A sumary query with a final summary row

SELECT vendor_id, COUNT(*) AS invoice_count,
	SUM(invoice_total) AS invoice_total
FROM invoices
GROUP BY vendor_id WITH ROLLUP;