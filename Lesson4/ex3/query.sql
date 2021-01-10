USE ap;
go

--AN INNER JOIN WITH ALIAS FOR ONLY ONE TABLE
SELECT invoice_number, line_item_amount,
	line_item_description
FROM invoices INNER JOIN invoice_line_items line_items
	ON invoices.invoice_id = line_items.invoice_id
WHERE account_number = 540
ORDER BY invoice_date;