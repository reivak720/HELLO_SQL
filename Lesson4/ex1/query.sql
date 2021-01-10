USE ap;
go
SELECT invoice_number, vendor_name
FROM vendors v INNER JOIN invoices i
on v.vendor_id= i.vendor_id;

SELECT D.NAME, AVG(ISNULL(E.DEPT_ID, 0)) as COUNTS
FROM DEPARTMENT D
LEFT JOIN EMPLOYEE E ON E.DEPT_ID = D.ID
GROUP BY  D.NAME
ORDER BY COUNTS DESC, D.NAME ;
