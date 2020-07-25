--  1

select * from employees
where hire_date =(select max(hire_date) from employees);


--  2

select * from employees
where hire_date = (select hire_date from employees order by hire_date desc limit 2,1);


-- 3

select s.*,d.dept_no 
from salaries s 
inner join dept_manager d 
on s.emp_no = d.emp_no
where s.to_date='9999-01-01' 
and d.to_date='9999-01-01' ;

-- 4

select last_name,first_name,dept_no
from employees e
inner join dept_emp d
on e.emp_no = d.emp_no

-- 5

select s.emp_no,count(*) t
from salaries s
group by s.emp_no
having count(*) > 15

-- 6

select distinct salary
from salaries s
where s.to_date="9999-01-01"
order by salary desc

-- 7

select d.dept_no, d.emp_no,s.salary
from dept_manager d
inner join salaries s
on d.emp_no = s.emp_no
where d.to_date="9999-01-01"
and s.to_date="9999-01-01"

-- 8 

select emp_no
from employees
where emp_no not in(
    select e.emp_no
    from employees e
    inner join dept_manager d
    on e.emp_no = d.emp_no
)

-- 9

select d.dept_no, d.emp_no,s.salary
from dept_manager d
inner join salaries s
on d.emp_no = s.emp_no
where d.to_date="9999-01-01"
and s.to_date="9999-01-01"

-- 10

select d.dept_no, d.emp_no,s.salary
from dept_manager d
inner join salaries s
on d.emp_no = s.emp_no
where d.to_date="9999-01-01"
and s.to_date="9999-01-01"