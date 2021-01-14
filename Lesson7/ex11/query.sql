USE ap;
go

-- a coplex query that uses three subqueries 
SELECT t1.vendor_state, vendor_name, t1.sum_of_invoices
FROM 
	(
		--invoices totals by vendor
		SELECT vendor_state, vendor_name,
			SUM(invoice_total) AS sum_of_invoices
		FROM vendors v JOIN invoices i
			ON v.vendor_id = i.vendor_id
		GROUP BY vendor_state, vendor_name) t1
JOIN 
	(
		--top invoice totals by state
		SELECT vendor_state,
				MAX(sum_of_invoices)
				AS sum_of_invoices
		FROM
		(
			--invoice totals by vendors
		SELECT vendor_state,
			vendor_name,
				SUM(invoice_total)
				AS sum_of_invoices
		FROM vendors v JOIN invoices i
			ON v.vendor_id=
			i.vendor_id
			GROUP BY vendor_state,
			vendor_name
		) t2
		GROUP BY vendor_state
		) t3
	ON t1.vendor_state = t3.vendor_state AND
		t1.sum_of_invoices =
t3.sum_of_invoices
ORDER BY vendor_state;

/*
A procedure for writing complex queries
1- State the problem to be solve by the query in English.
2- Use pseudocode to outline the query.
3- Code the subqueries and test them to be sure that they return the correct data
4- Code and thes the final query.

Pseudocode for the query
SELECT vendor_state, vendor_name, sum_of_invoices,
FROM(subquery returning vendor_state, vendor_name,
	sum_of_invoices)
JOIN (subquery returning vendor_state, 
		largest_sum_of_invoices)
	ON vendor_state AND sum_of_invoices
ORDER BY vendro_state

*/