USE ap;
go
--Insert into a single row without using a column list
INSERT INTO invoices VALUES
(97, '456789', '2018-08-01',
8344.50, 0, 0, 1, '2018-08-31', NULL)
;

-- Insert a single row using a column list
INSERT INTO invoices
	(vendor_id, invoice_number,
	invoice_total, terms_id,
	invoice_date, invoice_due_date)
VALUES
	(97, '4456789', 8344.50, 1,
	'2018-08-01', '2018-08-31')
	;
