USE ex;
go


-- a recursive CTE that return hierarchical data
WITH employees_cte AS 
(
	-- Nonrecursive query
	SELECT employee_id,
		CONCAT(first_name, ' ', 
		last_name) AS employee_name,
		1 AS ranking
	FROM employees
	WHERE manager_id is NULL
UNION ALL
	-- Recursive query
	SELECT employees.employee_id,
	CONCAT(first_name, ' ', last_name),
		ranking + 1
	FROM employees
	JOIN employees_cte
	ON employees.manager_id =
	employees_cte.employee_id
)
SELECT *
FROM employees_cte
ORDER BY ranking, employee_id;