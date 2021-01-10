USE ap;
go

--A self-join that returns vendors from cities in common with other vendors
SELECT DISTINCT v1.vendor_name, v1.vendor_city,
	v1.vendor_state
FROM vendors v1 INNER JOIN vendors v2
	ON v1.vendor_city = v2.vendor_city 
	AND v1.vendor_state = v2.vendor_state
	AND v1.vendor_name <> v2.vendor_name
ORDER BY v1.vendor_state, v1.vendor_city;