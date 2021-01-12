USE ap;
go

-- A SELECT statement that adds to the specification
-- for a named window

SELECT vendor_id, invoice_date,
invoice_total,
	SUM(invoice_total)
		OVER(PARTITION BY vendor_id
			ORDER BY invoice_date ASC)
		AS invoice_date_asc,
	SUM(invoice_total)
		OVER(PARTITION BY vendor_id
			ORDER BY invoice_date DESC)
		AS invoice_date_desc
FROM invoices
WHERE invoice_total > 5000
;