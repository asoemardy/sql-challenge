-- List the following details of each employee: employee number, last name, first name, sex, and salary.
SELECT
	e.emp_no AS Employee_Number
	,last_name
	,first_name
	,sex
	,salary
FROM
	employees e JOIN salaries s ON e.emp_no = s.emp_no
; 


-- List first name, last name, and hire date for employees who were hired in 1986.
SELECT
	first_name
	,last_name
	,hire_date
FROM
	employees
WHERE 1=1
	AND hire_date BETWEEN '1986-01-01' AND '1986-12-31'
; 


-- List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name.
SELECT
	man.dept_no
	,dept_name
	,man.emp_no
	,last_name
	,first_name
FROM
	dept_manager man JOIN departments d ON man.dept_no = d.dept_no
	JOIN employees e ON man.emp_no = e.emp_no
;


-- List the department of each employee with the following information: employee number, last name, first name, and department name.
SELECT
	e.emp_no
	,last_name
	,first_name
	,dept_name
FROM
	dept_emp d JOIN employees e ON d.emp_no = e.emp_no
	JOIN departments dep ON d.dept_no = dep.dept_no
;

-- List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."
SELECT
	first_name
	,last_name
	,sex
FROM employees
WHERE 1=1
	AND first_name = 'Hercules'
	AND last_name LIKE 'B%'
;

-- List all employees in the Sales department, including their employee number, last name, first name, and department name.
SELECT
	e.emp_no
	,last_name
	,first_name
	,dept_name
FROM 
	dept_emp d JOIN employees e ON d.emp_no = e.emp_no
	JOIN departments dept ON d.dept_no = dept.dept_no
WHERE 1=1
	AND dept_name = 'Sales'
;

-- List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.
SELECT
	e.emp_no
	,last_name
	,first_name
	,dept_name
FROM 
	dept_emp d JOIN employees e ON d.emp_no = e.emp_no
	JOIN departments dept ON d.dept_no = dept.dept_no
WHERE 1=1
	AND (dept_name = 'Development' OR dept_name = 'Sales')
;

-- In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.
SELECT
	COUNT(emp_no)
	,last_name
FROM 
	employees
GROUP BY last_name
ORDER BY COUNT(emp_no) DESC
;