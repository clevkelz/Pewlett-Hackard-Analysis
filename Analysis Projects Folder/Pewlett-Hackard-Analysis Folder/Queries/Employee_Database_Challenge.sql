
SELECT e.emp_no, 
	e.first_name,
	e.last_name,
	t.title,
	t.from_date,
	t.to_date
INTO retirement_titles 
FROM employees AS e 
INNER JOIN titles AS t
ON (e.emp_no = t.emp_no)
WHERE (e.birth_date between '1952-01-01' and '1955-12-31')
ORDER BY e.emp_no

select * from retirement_titles;

SELECT DISTINCT ON (emp_no) emp_no,
	first_name,
	last_name,
	title
INTO unique_titles
FROM retirement_titles
WHERE to_date = '9999-01-01'
ORDER by emp_no;

select * from unique_titles;

SELECT COUNT(emp_no), title
INTO retiring_titles
FROM unique_titles 
GROUP BY title
ORDER BY COUNT desc;

select * from retiring_titles;

SELECT DISTINCT ON (e.emp_no) e.emp_no, 
	e.first_name,
	e.last_name,
	e.birth_date,
	de.from_date,
	de.to_date,
	t.title
INTO membership_eligibility
FROM employees AS e
INNER JOIN dept_emp AS de
ON e.emp_no = de.emp_no
INNER JOIN titles AS t
ON e.emp_no = t.emp_no
WHERE (e.birth_date between '1965-01-01' and '1965-12-31')
AND t.to_date = '9999-01-01'
ORDER BY e.emp_no;


SELECT COUNT(emp_no), title
INTO mentorship_titles
FROM mentorship_eligibility
GROUP BY title
ORDER BY COUNT desc;

SELECT e.emp_no,
	e.first_name,
	e.last_name,
	t.title,
	t.from_date,
	t.to_date
INTO non_retiring_employees
FROM employees AS e 
INNER JOIN titles AS t
ON (e.emp_no = t.emp_no)
WHERE (e.birth_date >='01-01-1956')
AND t.to_date = '9999-01-01'
ORDER BY e.emp_no

SELECT DISTINCT ON (emp_no) emp_no,
	first_name,
	last_name,
	title
INTO unique_nonretiree_titles
FROM non_retiring_employees
ORDER by emp_no;

SELECT COUNT(emp_no), title
INTO nonretiring_titles
FROM unique_nonretiree_titles 
GROUP BY title
ORDER BY COUNT desc;

Select *
FROM mentorship_titles

Select count(emp_no)
INTO Total_Current_Employee_Count
FROM titles
where to_date = '9999-01-01'