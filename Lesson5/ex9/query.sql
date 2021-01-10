USE ap;
go
-- update one column for multiple rows
UPDATE invoices
SET terms_id = 1 
WHERE vendor_id = 95;