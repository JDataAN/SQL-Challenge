-- Query 1: List the employee number, last name, first name, sex, and salary of each employee.
SELECT employees.emp_no, employees.last_name, employees.first_name, employees.gender, salaries.salary
FROM employees
JOIN salaries ON employees.emp_no = salaries.emp_no;

-- Query 2: List the First Name, Last Name, and Hire Date for Employees Hired in 1986
SELECT first_name, last_name, hire_date
FROM employees
WHERE hire_date BETWEEN '1986-01-01' AND '1986-12-31';

-- Query 3: List the Manager of Each Department Along with Their Department Number, Department Name, Employee Number, Last Name, and First Name
SELECT dept_manager.dept_no, departments.dept_name, employees.emp_no, employees.last_name, employees.first_name
FROM dept_manager
JOIN departments ON dept_manager.dept_no = departments.dept_no
JOIN employees ON dept_manager.emp_no = employees.emp_no;

-- Query 4: List the Department Number for Each Employee Along with That Employee’s Employee Number, Last Name, First Name, and Department Name
SELECT dept_emp.dept_no, employees.emp_no, employees.last_name, employees.first_name, departments.dept_name
FROM dept_emp
JOIN employees ON dept_emp.emp_no = employees.emp_no
JOIN departments ON dept_emp.dept_no = departments.dept_no;

-- Query 5: List the First Name, Last Name, and Sex of Each Employee Whose First Name is Hercules and Whose Last Name Begins with the Letter B
SELECT first_name, last_name, gender
FROM employees
WHERE first_name = 'Hercules' AND last_name LIKE 'B%';

-- Query 6: List Each Employee in the Sales Department, Including Their Employee Number, Last Name, and First Name
SELECT employees.emp_no, employees.last_name, employees.first_name
FROM employees
JOIN dept_emp ON employees.emp_no = dept_emp.emp_no
JOIN departments ON dept_emp.dept_no = departments.dept_no
WHERE departments.dept_name = 'Sales';

-- Query 7: List Each Employee in the Sales and Development Departments, Including Their Employee Number, Last Name, First Name, and Department Name
SELECT employees.emp_no, employees.last_name, employees.first_name, departments.dept_name
FROM employees
JOIN dept_emp ON employees.emp_no = dept_emp.emp_no
JOIN departments ON dept_emp.dept_no = departments.dept_no
WHERE departments.dept_name IN ('Sales', 'Development');

-- Query 8: List the Frequency Counts, in Descending Order, of All the Employee Last Names (i.e., How Many Employees Share Each Last Name)
SELECT last_name, COUNT(last_name) AS frequency
FROM employees
GROUP BY last_name
ORDER BY frequency DESC;
