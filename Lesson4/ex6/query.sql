USE ap;
go

--Join four tables fast way to query
SELECT vendor_name, invoice_number, invoice_date,
	line_item_amount, account_description
FROM vendors v
	JOIN invoices i
		ON v.vendor_id = i.vendor_id
	JOIN invoice_line_items li
		ON i.invoice_id = li.invoice_id
	JOIN general_ledger_accounts gl
		ON li.account_number = gl.account_number
WHERE invoice_total - payment_total - credit_total >0
ORDER BY vendor_name, line_item_amount DESC;


--SLOW QUERY MODE WHITH IMPLICIT SINTAX:
/*
SELECT vendor_name, invoice_number, invoice_date,
	line_item_amount, account_description
FROM vendors v, invoices i , invoice_line_items li,
	general_ledger_accounts gl
WHERE v.vendor_id = i.vendor_id
	AND i.invoice_id = li.invoice_id
	AND li.account_number = gl.account_number
	AND invoice_total - payment_total - credit_total >0
ORDER BY vendor_name, line_item_amount DESC;
*/