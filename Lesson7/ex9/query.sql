USE ap;
go
-- A SUBQUERY IN THE SELECT CLAUSE

SELECT vendor_name, 
	(SELECT MAX(invoice_date) FROM invoices
	WHERE vendor_id = vendors.vendor_id) AS latest_inv
FROM vendors
ORDER BY latest_inv DESC;

-- SAME QUERY WITH A JOIN
/*
SELECT vendor_name, MAX(invoice_date) AS latest_inv
FROM vendors v
	LEFT JOIN invoices i ON v.vendor_id = i.vendor_id
GROUP BY vendor_name
ORDER BY latest_inv DESC
*/;