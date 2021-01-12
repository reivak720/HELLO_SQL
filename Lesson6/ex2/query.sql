USE ap;
go
-- A summary query with count(*), avg, and sum
SELECT 'After 1/1/2018' AS selection_date,
	COUNT(*) AS number_of_invoices,
	ROUND(AVG(invoice_total), 2) AS avg_invoice_amt,
	SUM(invoice_total) AS total_invoice_amt
FROM invoices
WHERE invoice_date > '2018-01-01'