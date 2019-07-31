-- Item 1.
select distinct e.emp_no,
                e.last_name,
                e.first_name,
                e.gender,
                s.salary
from      employees as e
left join salaries  as s
on e.emp_no = s.emp_no
order by last_name, first_name;
     
-- Item 2.
select distinct last_name, first_name, hire_date
from employees
where hire_date like '1986-%'
order by hire_date, last_name, first_name;

-- Item 3.
select a.dept_no,
       a.dept_name,
       b.emp_no,
       b.last_name,
       b.first_name,
       b.from_date,
       b.to_date
from       (select distinct
            a.emp_no, a.dept_no, 
            b.dept_name
            from dept_manager as a 
            left join departments as b 
            on a.dept_no = b.dept_no) 
            as a
inner join (select distinct
            a.emp_no, a.dept_no, a.from_date, a.to_date,
            b.last_name,
            b.first_name
            from dept_manager as a 
            left join employees as b 
            on a.emp_no = b.emp_no)
            as b
on a.emp_no=b.emp_no and a.dept_no=b.dept_no
order by a.dept_name, b.last_name, b.first_name;

-- Item 4.
select a.emp_no, b.last_name, b.first_name, a.dept_name
from       (select distinct
            a.emp_no, a.dept_no, 
            b.dept_name 
            from dept_emp as a 
            left join departments as b 
            on a.dept_no = b.dept_no) 
            as a
inner join (select distinct
            a.emp_no, a.dept_no,
            b.last_name,
            b.first_name
            from dept_emp as a 
            left join employees as b 
            on a.emp_no = b.emp_no)
            as b
on a.emp_no=b.emp_no and a.dept_no=b.dept_no
order by a.dept_name, b.last_name, b.first_name;

-- Item 5.
select distinct first_name, last_name
from employees
where first_name='Hercules' and last_name like 'B%'
order by last_name;

-- Item 6.
select a.emp_no, a.last_name, a.first_name, b.dept_name 
from (
   select distinct a.emp_no, a.last_name, a.first_name, b.dept_no
   from employees as a 
   right join dept_emp as b
   on a.emp_no = b.emp_no
) as a
right join (
  select distinct dept_no, dept_name
  from departments 
  where dept_name in ('Sales')
) as b
on a.dept_no = b.dept_no
order by b.dept_name, a.last_name, a.first_name;

-- Item 7.
select a.emp_no, a.last_name, a.first_name, b.dept_name 
from (
   select distinct a.emp_no, a.last_name, a.first_name, b.dept_no
   from employees as a 
   right join dept_emp as b
   on a.emp_no = b.emp_no
) as a
right join (
  select distinct dept_no, dept_name
  from departments 
  where dept_name in ('Sales', 'Development')
) as b
on a.dept_no = b.dept_no
order by b.dept_name, a.last_name, a.first_name;

-- Item 8.
select distinct count(*) as name_ct,
                last_name
from employees
group by last_name
order by name_ct desc;
