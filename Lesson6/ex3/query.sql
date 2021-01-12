USE ap;
go
-- a summary query with MIN and MAX
SELECT 'After 1/1/2018' as selection_date,
	COUNT (*) AS number_of_invoices,
	MAX(invoice_total) AS highest_invoice_total,
	MIN(invoice_total) AS lowest_invoice_total
FROM invoices
WHERE invoice_date > '2018-01-01'
