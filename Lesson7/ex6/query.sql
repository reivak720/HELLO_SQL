USE ap;
go

-- a query that uses ANY
SELECT vendor_name, invoice_number, invoice_total
FROM vendors JOIN invoices
	ON vendors.vendor_id = invoices.vendor_id
WHERE invoice_total < ANY 
	(SELECT invoice_total 
	FROM invoices
	WHERE vendor_id = 115)
	;