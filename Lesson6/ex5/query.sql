USE ap;
go
-- a summary query with the DISTINCT keyword

SELECT COUNT(DISTINCT vendor_id) AS number_of_vendors,
	COUNT(vendor_id) AS number_of_invoices,
	ROUND(AVG(invoice_total), 2) AS avg_invoice_amt,
	SUM(invoice_total) AS total_invoice_amt
FROM invoices
WHERE invoice_date > '2018-01-01';