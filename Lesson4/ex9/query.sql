USE ex;
go

--left outer join
SELECT department_name, d.department_number, last_name
FROM departments d
	LEFT JOIN employees e
	ON d.department_number = e.department_number
ORDER BY department_name;