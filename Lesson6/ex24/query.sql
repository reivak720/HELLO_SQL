USE ap;
go

-- a select statement that calculates moving averages
-- USE PAST MONTH AND NEXT MONTH TO CALCULATE THREE MONTH AVG
SELECT MONTH(invoice_date) AS month,
	SUM(invoice_total) AS total_invoices,
	ROUND(AVG(SUM(invoice_total))
		OVER(ORDER BY MONTH(invoice_date)
		ROWS BETWEEN 1 PRECEDING AND 1 FOLLOWING), 2)
		AS three_month_avg
	FROM invoices
	GROUP BY MONTH(invoice_date);