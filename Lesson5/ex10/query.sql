USE ap;
go

-- Update one column for one row
UPDATE invoices
SET credit_total = credit_total + 100
WHERE invoice_number = '97/522';