USE ap;
go

-- a summary query that limits the groups to 
-- those with two or more invoices

SELECT vendor_state, vendor_city, COUNT(*) AS invoice_qty,
	ROUND(AVG(invoice_total), 2) AS invoice_avg
FROM invoices JOIN vendors
	ON invoices.vendor_id = vendors.vendor_id
GROUP BY vendor_state, vendor_city
HAVING COUNT(*) >= 2
ORDER BY vendor_state, vendor_city;