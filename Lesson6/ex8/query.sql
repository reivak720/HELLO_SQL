USE ap;
go
-- a summary query that counts 
-- the number of invoices by vendor
SELECT vendor_id, COUNT(*) AS invoie_qty
FROM invoices
GROUP BY vendor_id;