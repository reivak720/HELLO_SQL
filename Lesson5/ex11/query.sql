USE ap;
go
-- Update all invoices for a vendor
UPDATE invoices
SET terms_id = 1
WHERE vendor_id =
	(SELECT vendor_id
	FROM vendors
	WHERE vendor_name = 'Pacific Bell');