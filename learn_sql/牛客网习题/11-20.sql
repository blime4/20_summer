-- 11

select e.emp_no,m.emp_no
from dept_emp e
inner join dept_manager m
on e.dept_no = m.dept_no
where e.emp_no <> m.emp_no
and e.to_date="9999-01-01"
and m.to_date="9999-01-01"

-- 12

select d.dept_no, d.emp_no,max(salary) 
from dept_emp d
inner join salaries s
on d.emp_no = s.emp_no
where d.to_date = s.to_date
and d.to_date="9999-01-01"
group by d.dept_no

-- 13

select title,count(*) t
from titles
group by title
having count(*) >=2

-- 14

select title,count(distinct emp_no) t
from titles
group by title
having t >=2

-- 15

select * from employees e
where e.emp_no % 2 = 1
and e.last_name is not "Mary"
order by e.hire_date desc

-- 16

select t.title,avg(s.salary) avg
from titles t
inner join salaries s
on t.emp_no = s.emp_no
where t.to_date = s.to_date
and t.to_date="9999-01-01"
group by t.title


-- 17

select emp_no,salary
from salaries
where to_date="9999-01-01"
order by salary desc
limit 1,1

-- 18

select e.emp_no,max(s.salary),e.last_name,e.first_name
from employees e
inner join salaries s
on e.emp_no = s.emp_no
where s.to_date = "9999-01-01"
and s.salary not in (
    select max(salary) from salaries
    where s.to_date = '9999-01-01'
)

-- 19

select last_name,first_name,dept_name
from employees e
left join dept_emp de on e.emp_no = de.emp_no
left join departments d on d.dept_no = de.dept_no

-- 20

select (
    (select salary from salaries where emp_no = 10001 order by salary desc)
    -
    (select salary from salaries where emp_no = 10001 order by salary)
) growth;