USE ap;
go

-- USING THE OVER CLAUSE
-- a select statement with two aggregated window functions
SELECT vendor_id, invoice_date, invoice_total,
	SUM(invoice_total) OVER() AS total_invoices,
	SUM(invoice_total) OVER(PARTITION BY vendor_id) AS vendor_total
FROM invoices
WHERE invoice_total > 5000;