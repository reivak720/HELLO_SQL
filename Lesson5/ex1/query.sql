USE ap;

DROP TABLE  IF EXISTS invoices_copy;


-- creating a coplete copy of invoices table
SELECT *
INTO invoices_copy
FROM invoices;
