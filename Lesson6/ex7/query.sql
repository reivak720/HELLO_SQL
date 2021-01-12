USE ap;
go

-- A summary query that includes a 
-- a funcionally dependent column

SELECT vendor_name, vendor_state,
	ROUND(AVG(invoice_total), 2) AS average_invoice_amount
FROM vendors v JOIN invoices i
	ON v.vendor_id = i.vendor_id
GROUP BY vendor_name, vendor_state
HAVING AVG(invoice_total) > 2000
ORDER BY average_invoice_amount DESC;