-- Average Salary per Department
SELECT employees.department, AVG(salaries.salary)
FROM employees
JOIN salaries 
ON employees.id = salaries.emp_id
GROUP BY employees.department;

-- Highest Paid Employee
SELECT employees.name, salaries.salary
FROM employees
JOIN salaries 
ON employees.id = salaries.emp_id
ORDER BY salaries.salary DESC
LIMIT 1;

-- Employees Above Company Average Salary
SELECT employees.name, salaries.salary
FROM employees
JOIN salaries
ON employees.id = salaries.emp_id
WHERE salaries.salary > (SELECT AVG(salary) FROM salaries);

-- Salary Categorization
SELECT employees.name,
       salaries.salary,
       CASE
           WHEN salaries.salary >= 50000 THEN 'Senior Level'
           WHEN salaries.salary >= 40000 THEN 'Mid Level'
           ELSE 'Junior Level'
       END AS level_category
FROM employees
JOIN salaries
ON employees.id = salaries.emp_id;
