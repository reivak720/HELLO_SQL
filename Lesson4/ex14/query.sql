USE ex;
go
--cross join using explicit syntax.
SELECT d.department_number, d.department_name,
	employee_id, last_name
FROM departments d CROSS JOIN employees
ORDER BY d.department_number;