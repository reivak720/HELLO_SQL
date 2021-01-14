USE ap;
go

-- where clause with in
-- a query that gets vendors without invoices

SELECT vendor_id, vendor_name, vendor_state
FROM vendors
WHERE vendor_id NOT IN 
	(SELECT DISTINCT vendor_id
	FROM invoices)
ORDER BY vendor_id;

-- without a subquery:
/* 
SELECT v.vendor_id, vendor_name, vendor_state
FROM vendors v LEFT JOIN invoices i
	ON v.vendor_id = i.vendor_id
WHERE i.vendor_id IS NULL
ORDER BY v.vendor_id
;*/