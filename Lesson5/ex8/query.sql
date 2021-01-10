USE ap;
go

-- Update two columns for a single row
UPDATE invoices
SET payment_date ='2018-09-21',
	payment_total = 19351.18
WHERE invoice_number = '97/522';