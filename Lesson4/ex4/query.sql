USE ap;
go
--A join to a table in another database, no link because no zip code is equal
SELECT
    t1.vendor_name, 
    t2.customer_last_name, 
    t2.customer_first_name,
    t1.vendor_state AS states,
    t1.vendor_city AS city
FROM
    ex.[dbo].[customers] as t2 
    INNER JOIN ap.dbo.vendors as t1 on t1.vendor_zip_code = t2.customer_zip
ORDER BY states, city
;