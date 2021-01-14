USE ap;
go

-- uses exists operator

-- a query that gets vendors without invoices
SELECT vendor_id, vendor_name, vendor_state
FROM vendors
WHERE NOT EXISTS
	(SELECT *
	FROM invoices
	WHERE vendor_id = vendors.vendor_id)