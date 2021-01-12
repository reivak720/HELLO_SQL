USE ap;
go

-- a summary query with a search condition in the 
-- HAVING clause
-- if the avg of the invoice totals is > 500 it will be included
-- in the table.

SELECT vendor_name,
	COUNT(*) AS invoice_qty,
	ROUND(AVG(invoice_total), 2) AS invoice_avg
FROM vendors JOIN invoices
	ON vendors.vendor_id = invoices.vendor_id
GROUP BY vendor_name
HAVING AVG(invoice_total) > 500
ORDER BY invoice_qty DESC;