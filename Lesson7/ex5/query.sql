USE ap;
go
-- a query that uses ALL
-- gets all invoices and vendors
-- that have invoice_totals greater than all
-- invoice totals of vendor with id = 34
-- can be written with max

SELECT vendor_name, invoice_number, invoice_total
FROM invoices i JOIN vendors v ON i.vendor_id = v.vendor_id
WHERE invoice_total > ALL
	(SELECT invoice_total
	FROM invoices
	WHERE vendor_id = 34)
ORDER BY vendor_name;