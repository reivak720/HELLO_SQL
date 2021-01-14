USE ap;
go
-- a query that uses a corralated subquery
-- to get all invoices and vendors where 
-- the invoice total is greater than 
-- the average total of himself

SELECT vendor_id, invoice_number, invoice_total
FROM invoices i
WHERE invoice_total > 
	(SELECT AVG(invoice_total)
	FROM invoices
	WHERE vendor_id = i.vendor_id)
ORDER BY vendor_id, invoice_total;
