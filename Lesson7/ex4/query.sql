USE ap;
go
 -- WHERE with a comparison operator

 -- A query with a subquery in a WHERE condition
 -- gets all invoices where the balance due is lesser
 -- than the average balance due and greater than 0

 SELECT invoice_number, invoice_date, 
		invoice_total - payment_total -
		credit_total AS balance_due
FROM invoices
WHERE invoice_total - payment_total -
		credit_total > 0
	AND invoice_total - payment_total -
	credit_total < (
	SELECT AVG(invoice_total - payment_total - 
				credit_total)
	FROM invoices
	WHERE invoice_total - payment_total -
		credit_total > 0
	)
ORDER BY invoice_total DESC