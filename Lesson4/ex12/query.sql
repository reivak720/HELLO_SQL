USE ex;
go

--Combine an outer and an inner join
SELECT department_name, last_name, project_number
FROM departments d
	INNER JOIN employees e
		ON d.department_number = e.department_number
	LEFT JOIN projects p
		ON e.employee_id = p.employee_id
ORDER BY department_name, last_name;