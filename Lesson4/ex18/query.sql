USE ex;
go

--Full outer join rock on sql server
SELECT d.department_name AS dept_name,
	d.department_number AS d_dept_no,
	e.department_number AS e_dept_no,
	e.last_name
FROM departments d 
FULL OUTER JOIN 
	employees e ON
	d.department_number= e.department_number
ORDER BY dept_name



-- A union that simulates a full outer join
/*
SELECT department_name AS dept_name,
	d.department_number AS d_dept_no,
	e.department_number AS e_dept_no,
	last_name
FROM departments d
LEFT JOIN employees e ON 
	d.department_number = e.department_number
UNION
SELECT department_name AS dept_name,
	d.department_number AS d_dept_no,
	e.department_number AS e_dept_no,
	last_name
FROM departments d
RIGHT JOIN employees e ON 
	d.department_number = e.department_number
ORDER BY dept_name
*/
