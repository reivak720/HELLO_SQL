USE ap;
go
-- Insert paid invoices into the Invoice_Archive table
INSERT INTO invoice_archive
SELECT *
FROM invoices
WHERE invoice_total - payment_total - credit_total = 0;

-- we can also list the column names after before select and after select without *
-- this would be better for long term statement since table columns could change.
-- specialy when you play with your snake for other people.
