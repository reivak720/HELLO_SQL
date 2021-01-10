USE ap;
go

-- the syntax of the DELETE statement
/*
DELETE FROM table_name
[WHERE condition]
*/
-- Delete one row
DELETE FROM	general_ledger_accounts
WHERE account_number = 306;
