USE ap;
go
-- a summary query with a search condition in 
-- the WHERE clause
-- if an invoice total is < 500 it will no
-- be included in the table

SELECT vendor_name,
	COUNT(*) AS invoice_qty,
	ROUND(AVG(invoice_total), 2) AS invoice_avg
FROM vendors JOIN invoices
	ON vendors.vendor_id = invoices.vendor_id
WHERE invoice_total > 500
GROUP BY vendor_name
ORDER BY invoice_qty DESC;