USE ap;
go

-- A union that combines result sets from
-- the same two tables three times

SELECT invoice_number, vendor_name,
		'33% Payment'AS payment_type,
		invoice_total AS total,
		invoice_total * 0.333 AS payment
FROM invoices JOIN vendors
	ON invoices.vendor_id = vendors.vendor_id
WHERE invoice_total > 10000
UNION
SELECT invoice_number, vendor_name,
		'50% Payment' AS payment_type,
		invoice_total AS total,
		invoice_total * 0.5 AS payment
FROM invoices JOIN vendors
	on invoices.vendor_id = vendors.vendor_id
WHERE invoice_total BETWEEN 500 AND 10000
UNION
SELECT invoice_number, vendor_name,
	'Full Amount'AS payment_type,
	invoice_total AS total,
	invoice_total AS payment
FROM invoices JOIN vendors
	ON invoices.vendor_id = vendors.vendor_id
WHERE invoice_total < 500
ORDER BY payment_type, vendor_name, invoice_number;