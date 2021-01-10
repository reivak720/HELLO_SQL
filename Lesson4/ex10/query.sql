USE ex;
go

--a right outer join
SELECT department_name, e.department_number, last_name
FROM departments d
	RIGHT JOIN employees e
	ON d.department_number = e.department_number
ORDER BY department_name;