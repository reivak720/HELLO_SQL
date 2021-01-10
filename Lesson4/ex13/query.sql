USE ex;
go



SELECT department_name AS dept_name, last_name,
project_number
FROM departments d
	JOIN employees e
		ON d.department_number = e.department_number
	LEFT JOIN projects p
		ON p.employee_id = e.employee_id
ORDER BY department_name