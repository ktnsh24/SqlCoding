-- Ques.1. Write an SQL query to fetch the employee_id and FullName of all the employees working under manager_id – 108.
select employee_id, concat(first_name, ' ', last_name) as FullName from employees
where manager_id =108

-- Ques.4. Write an SQL query to find the maximum, minimum, and average salary of the employees.
select max(salary), min(salary), AVG(salary) from employees 

-- return employee record with max salary
select * from employees where salary = (select max(salary) from employees)

-- select second highest salary in employees table
select max(salary) from employees where salary <> (select max(salary) from employees)

-- select Nth highest salary in employees table
select * from (select employee_id, concat(first_name, ' ', last_name) as FullName, salary, dense_rank() over(order by salary desc) as rank_no from employees) r where rank_no=5; 

-- Write an SQL query to fetch only even rows from the table.
select * from (select employee_id, concat(first_name, ' ', last_name) as FullName, salary, row_number() over(order by employee_id asc) as rank_no from employees) r where rank_no%2=0; 

-- Write an SQL query to fetch only odd rows from the table.
select * from (select employee_id, concat(first_name, ' ', last_name) as FullName, salary, row_number() over(order by employee_id asc) as rank_no from employees) r where rank_no%2=1; 


-- return employeename, highest salary and department
select concat(first_name, ' ', last_name) as FullName, salary, department_name from employees e 
 join departments d on d.department_id = e.department_id where  salary = (select max(salary) from employees)

-- return employeename, highest salary and department name  for  each department
select concat(first_name, ' ', last_name) as FullName, salary, department_name from employees e 
 join departments d on d.department_id = e.department_id where  salary in (select max(salary) from employees group by department_id ) order by salary

--Ques.5. Write an SQL query to find the employee id whose salary lies in the range of 9000 and 15000.
select employee_id  from employees
where salary between 9000 and 15000

--Ques.6. Write an SQL query to fetch those employees who live in Toronto and work under manager with ManagerId – 321.
select *  from employees
where salary = 17000 and manager_id =100

--From the following table, write a SQL query to retrieve the details of the salespeople whose names begin with any letter between 'A' and 'L' (not inclusive). 
--Return salesman_id, name, city, commission.
select * from salesman where name between 'A' AND 'L'

--From the following table, write a SQL query to select orders between 500 and 4000 (begin and end values are included). 
--Exclude orders amount 948.50 and 1983.43. Return ord_no, purch_amt, ord_date, customer_id, and salesman_id.
select * from orders where (purch_amt between 500 and 4000) AND purch_amt NOT IN(948.50, 1983.43)

--Ques.24. Write an SQL query to fetch employee_id, FullName, salary having a location_id greater than or equal to 1600 and less than or equal to 2500.
select  employee_id, concat(first_name, ' ', last_name) as FullName, salary from employees e
where e.department_id in(select department_id from departments where location_id >= 1600 and location_id <= 2500  )

--Ques.26. Write an SQL query to fetch all the Employees details from EmployeeDetails table who joined in the Year 1996.
select  employee_id, concat(first_name, ' ', last_name) as FullName, salary,hire_date from employees e where hire_date between '1996-01-01' and '1996-12-31'

select  employee_id, concat(first_name, ' ', last_name) as FullName, salary,hire_date from employees e where extract(year from hire_date) = '1996'

--Write a SQL Query to get the Quarter from date.
select  employee_id, concat(first_name, ' ', last_name) as FullName, salary,hire_date from employees e where extract(QUARTER from hire_date) = 1

-- Write Query to find employees with duplicate salary.
select * from employees where salary IN ( select salary from employees group by salary having count(salary)>1)

-- How can we get a random number between 1 and 100 in PGSQL?
SELECT floor(random() * 10 + 1)::int;

--Ques.36. Write an SQL query to create a new table with data and structure copied from another table.
CREATE TABLE NewTable 
SELECT * FROM employees;
--How can you copy the structure of a table into another table without copying the data?
CREATE TABLE NewTable AS(
SELECT * FROM employees where 1=0)

--Write an SQL query to fetch duplicate records from Employees (without considering the primary key – EmpId).
SELECT first_name, last_name, salary, hire_date, COUNT(*)
FROM employees
GROUP BY first_name, last_name, salary, hire_date
HAVING COUNT(*) > 1;

