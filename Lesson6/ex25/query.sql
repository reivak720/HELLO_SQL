USE ap;
go

-- NAMING A WINDOW
-- a select statement with four functions that use
-- the same window

SELECT vendor_id, invoice_date, invoice_total,
	SUM(invoice_total) OVER(PARTITION BY vendor_id)
		AS vendor_total,
	ROUND(AVG(invoice_total) OVER(PARTITION BY vendor_id),2)
		AS vendor_avg,
	MAX(invoice_total) OVER(PARTITION BY vendor_id)
		AS vendor_max,
	MIN(invoice_total) OVER(PARTITION BY vendor_id)
		AS vendor_min
FROM invoices
WHERE invoice_total > 5000;


-- a select statement with a named window
-- ONLY FOR MYSQL
/*
SELECT vendor_id, invoice_date, invoice_total,
	SUM(invoice_total) OVER vendor_window
		AS vendor_total,
	ROUND(AVG(invoice_total) OVER vendor_window, 2)
		AS vendor_avg,
	MAX(invoice_total) OVER vendor_window AS venor_max,
	MIN(invoice_total) OVER vendor_window AS vendor_min
FROM invoices
WHERE invoice_total > 5000
WINDOW vendor_window AS (PARTITION BY vendor_id);
*/