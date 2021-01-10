USE ap;
go

-- Delete one row using a compound condition
DELETE FROM invoice_line_items
WHERE invoice_id = 76 AND
invoice_sequence = 2;