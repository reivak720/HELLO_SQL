USE my_guitar_shop;
GO
/*
Write a SELECT statement that returns three columns from the Customers table named first_name, last_name and full_name that combines the last_name and first_name columns.


Format this column with the last name, a comma, a space, and the first name like this:
Doe, John

Sort the result set by the last_name column in ascending sequence.
Return only the customers whose last name begins with letters from M to Z.
NOTE: When comparing strings of characters, ‘M’ comes before any string of characters that begins with ‘M’. For example, ‘M’ comes before ‘Murach’.
*/


SELECT first_name, last_name, CONCAT (last_name, ' ,', first_name) AS full_name
FROM customers
WHERE last_name LIKE '[M-Z]%'
ORDER BY last_name;