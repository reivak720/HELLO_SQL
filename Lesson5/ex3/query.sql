USE ap;
go
-- Create table with summary rows from the 
--invoices table

DROP TABLE IF EXISTS vendor_balances;

SELECT vendor_id, SUM(invoice_total) AS sum_of_invoices
INTO vendor_balances
FROM invoices
WHERE (invoice_total - payment_total - credit_total) <> 0
GROUP BY vendor_id
;

SELECT * FROM vendor_balances;