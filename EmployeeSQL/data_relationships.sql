--List the employee number, last name, first name, sex, and salary of each employee 
SELECT 
employees.emp_no, 
employees.last_name,
employees.first_name,
employees.sex,
salaries.salary
FROM employees
LEFT JOIN salaries
ON employees.emp_no = salaries.emp_no
ORDER BY emp_no

--List the first name, last name, and hire date for the employees who were hired in 1986 
SELECT 
employees.first_name, 
employees.last_name,
employees.hire_date
FROM employees
WHERE hire_date >= '1/1/1986' and hire_date < '1/1/1987'
ORDER BY hire_date;

--List the manager of each department along with their department number, department name, employee number, last name, and first name
SELECT 
managers.dept_no, 
departments.dept_name,
managers.emp_no,
employees.last_name, 
employees.first_name
FROM managers
LEFT JOIN departments
ON managers.dept_no = departments.dept_no
LEFT JOIN employees 
ON managers.emp_no = employees.emp_no
ORDER BY emp_no

--List the department number for each employee along with that employee’s employee number, last name, first name, and department name
SELECT 
dept_employees.dept_no,
employees.emp_no,
employees.last_name,
employees.first_name,
departments.dept_name
FROM employees 
INNER JOIN dept_employees ON employees.emp_no=dept_employees.emp_no
INNER JOIN departments ON departments.dept_no=dept_employees.dept_no
order by emp_no;

--List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B
SELECT 
employees.first_name,
employees.last_name,
employees.sex
FROM employees
WHERE first_name = 'Hercules' AND last_name like 'B%';

--List each employee in the Sales department, including their employee number, last name, and first name 
SELECT 
employees.emp_no, 
employees.last_name, 
employees.first_name,
dept_employees.dept_no
FROM employees 
LEFT JOIN dept_employees 
ON employees.emp_no=dept_employees.emp_no
INNER JOIN departments 
ON departments.dept_no=dept_employees.dept_no
WHERE departments.dept_name='Sales';

--List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name 
employees.emp_no, 
employees.last_name, 
employees.first_name,
dept_employees.dept_no,
departments.dept_name
FROM employees 
LEFT JOIN dept_employees 
ON employees.emp_no=dept_employees.emp_no
INNER JOIN departments 
ON departments.dept_no=dept_employees.dept_no
WHERE departments.dept_name in ('Sales','Development');

--List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name) 
SELECT last_name, COUNT(*) AS freq_count
FROM employees
GROUP BY last_name
ORDER BY freq_count DESC;

