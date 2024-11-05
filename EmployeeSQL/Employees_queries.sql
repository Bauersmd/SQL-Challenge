-- List employee nummber, last_name, first_name, sex, and salary of each employee
select e.emp_no, e.last_name, e.first_name, e.sex, s.salary
from salaries as s
inner join employees as e on
e.emp_no = s.emp_no;

-- List the first_name, last_name, and hire_date for the employees who were hired in 1986
select first_name, last_name, hire_date
from employees
where extract(year from hire_date) = 1986;

-- List the manager of each department along with their department number, department name, employee number, last_name, and first_name
select e.last_name, e.first_name, dm.emp_no, d.dept_name, d.dept_no
from employees as e
inner join dept_manager as dm on dm.emp_no = e.emp_no
inner join departments as d on d.dept_no = dm.dept_no;

-- List the department number for each employee along with that employee’s employee number, last_name, first_name, and department name
select de.dept_no, e.emp_no, e.last_name, e.first_name, d.dept_name
from employees as e
inner join dept_emp as de on de.emp_no = e.emp_no
inner join departments as d on d.dept_no = de.dept_no;

-- List first_name, last_name, and sex of each employee whose first_name is Hercules and whose last_name begins with the letter B
select first_name, last_name, sex
from employees
where first_name = 'Hercules'
and left(last_name, 1) = 'B';

-- List each employee in the Sales department, including their employee number, last name, and first name
select distinct e.emp_no, e.last_name, e.first_name, de.dept_no
from employees as e
inner join dept_emp as de on de.emp_no = e.emp_no
inner join departments as d on d.dept_no = de.dept_no
where d.dept_name = 'Sales'
order by e.emp_no;

--List each employee in the Sales and Development departments, including their employee number, last_name, first_name, and department name
select distinct e.emp_no, e.last_name, e.first_name, d.dept_name
from employees as e
inner join dept_emp as de ON de.emp_no = e.emp_no
inner join departments as d on d.dept_no = de.dept_no
where d.dept_name = 'Sales' or d.dept_name = 'Development'
order by e.emp_no;

--List the frequency counts, in descending order, of all the employee last_names (that is, how many employees share each last_name)
select e.last_name, count(last_name)
from employees as e
group by e.last_name
order by count(last_name) desc;

