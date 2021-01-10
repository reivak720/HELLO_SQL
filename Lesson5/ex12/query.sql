USE ap;
go
-- Updte the terms for all invoices for vendors in three states
UPDATE invoices
SET terms_id = 1
WHERE vendor_id IN 
	(SELECT vendor_id
	FROM vendors
	WHERE vendor_state
	IN ('CA', 'AZ', 'NV'));
