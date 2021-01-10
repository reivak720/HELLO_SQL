USE ap;
go

DROP TABLE IF EXISTS old_invoices;

--	CREATE PARTIAL TABLE OF INVOICES TABLE
SELECT *
INTO old_invoices
FROM invoices
WHERE invoice_total - payment_total
- credit_total = 0;

