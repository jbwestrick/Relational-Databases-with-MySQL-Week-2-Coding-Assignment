-- #1 I want to know how many employees with each title were born after 1965-01-01.
select 
distinct t.title,
count(e.emp_no) as "number of employees"
from
titles t
inner join employees e
on t.emp_no = e.emp_no
where
e.birth_date >= '1965-01-01'
group BY  t.title;

-- #2 I want to know the average salary per title.

SELECT 
t.title, AVG(s.salary) as "Average Salary"
from titles t 
inner join employees e on t.emp_no = e.emp_no
inner join salaries s on s.emp_no = e.emp_no
GROUP BY t.title;

-- #3 How much money was spent on salary for the marketing department between the years 1990 and 1992?

select 
d.dept_name, sum(s.salary) as "Gross Spent on Salary" 
from  
departments d 
inner join dept_emp de on d.dept_no = de.dept_no 
inner join employees e on e.emp_no = de.emp_no 
inner join salaries s on e.emp_no = e.emp_no 
where d.dept_name = 'Marketing' 
and s.from_date >= '1990-01-01' and s.to_date <= '1992-01-01';
