-- Please Note that the outputs are each saved in separate in separate Views to make them easier to check


-- This is to fix the date issue that SQL has in PostgreSQL has with picking the correct century related to chosing the two-digit year closest to the current year
update employees
set birth_date = birth_date - interval '100 years';

-- This is to make sure you can run the script multiple times and avoid issues from old views.
Drop View if exists question_1_output;
Drop View if exists question_2_output;
Drop View if exists question_3_output;
Drop View if exists question_4_output;
Drop View if exists question_5_output;
Drop View if exists question_6_output;
Drop View if exists question_7_output;
Drop View if exists question_8_output;
Drop View if exists question_9_output;


-- Question 1
CREATE VIEW question_1_output AS
SELECT employees.emp_no, employees.first_name, employees.last_name, employees.sex, salaries.salary
FROM employees JOIN salaries ON employees.emp_no = salaries.emp_no;

SELECT * FROM question_1_output;


-- Question 2
CREATE VIEW question_2_output AS 
SELECT first_name, last_name, hire_date FROM employees WHERE (SELECT EXTRACT(YEAR FROM hire_date) = 1986);

SELECT * FROM question_2_output;


-- Question 3
CREATE VIEW question_3_output AS 
SELECT dept_manager.dept_no, departments.dept_name, dept_manager.emp_no, employees.last_name, employees.first_name
FROM dept_manager
JOIN departments ON dept_manager.dept_no = departments.dept_no
JOIN employees ON employees.emp_no = dept_manager.emp_no;

SELECT * FROM question_3_output;


-- Question 4
CREATE VIEW question_4_output AS 
SELECT dept_emp.emp_no, employees.last_name, employees.first_name, departments.dept_name
FROM dept_emp
JOIN departments ON dept_emp.dept_no = departments.dept_no
JOIN employees ON employees.emp_no = dept_emp.emp_no;

SELECT * FROM question_4_output;


-- Question 5
CREATE VIEW question_5_output AS 
SELECT first_name, last_name, sex
FROM employees 
WHERE first_name = 'Hercules' AND last_name LIKE 'B%';

SELECT * FROM question_5_output;


-- Question 6
CREATE VIEW question_6_output AS 
SELECT dept_emp.emp_no, employees.last_name, employees.first_name, departments.dept_name
FROM dept_emp 
JOIN departments ON dept_emp.dept_no = departments.dept_no
JOIN employees ON employees.emp_no = dept_emp.emp_no
WHERE departments.dept_name = 'Sales';

SELECT * FROM question_6_output;


-- Question 7
CREATE VIEW question_7_output AS 
SELECT dept_emp.emp_no, employees.last_name, employees.first_name, departments.dept_name
FROM dept_emp 
JOIN departments ON dept_emp.dept_no = departments.dept_no
JOIN employees ON employees.emp_no = dept_emp.emp_no
WHERE departments.dept_name = 'Sales' OR departments.dept_name = 'Development';

SELECT * FROM question_7_output;


-- Question 8
CREATE VIEW question_8_output AS 
SELECT dept_emp.emp_no, employees.last_name, employees.first_name, departments.dept_name
FROM dept_emp 
JOIN departments ON dept_emp.dept_no = departments.dept_no
JOIN employees ON employees.emp_no = dept_emp.emp_no
WHERE departments.dept_name = 'Sales' OR departments.dept_name = 'Development';

SELECT * FROM question_8_output;


-- Question 9
CREATE VIEW question_9_output AS 
SELECT employees.last_name, COUNT(employees.last_name) AS count_of_each_surname
FROM employees 
GROUP BY employees.last_name;

SELECT * FROM question_9_output;