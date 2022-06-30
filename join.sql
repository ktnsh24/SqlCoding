--1. From the following tables write a SQL query to find the salesperson and customer who reside in the same city. 
--Return Salesman, cust_name and city.
select s.name, c.cust_name, c.city from salesman s, city c where c.salesman_id = s.salesman_id

--2. From the following tables write a SQL query to find those orders where the order amount exists between 500 and 2000. 
--Return ord_no, purch_amt, cust_name, city. 
select o.ord_no, o.purch_amt, o.cust_name, o.city 
from orders o, city c 
where o.customer_id = c.customer_id and  o.purch_amt between 500 and 2000

--3. From the following tables write a SQL query to find the salesperson(s) and the customer(s) he represents. 
--Return Customer Name, city, Salesman, commission.
SELECT c.cust_name AS "Customer Name", 
c.city, s.name AS "Salesman", s.commission  from salesman s, city c where  c.salesman_id = s.salesman_id

SELECT c.cust_name AS "Customer Name", 
c.city, s.name AS "Salesman", s.commission  from  city c  inner join salesman s on s.salesman_id = c.salesman_id

--4. From the following tables write a SQL query to find salespeople who received commissions of more than 12 percent from the company. 
--Return Customer Name, customer city, Salesman, commission. 
SELECT c.cust_name AS "Customer Name", 
c.city, s.name AS "Salesman", s.commission  from city c  inner join salesman s on s.salesman_id = c.salesman_id
where s.commission>0.12

--5. From the following tables write a SQL query to locate those salespeople who do not live in the same city where their customers live 
--and have received a commission of more than 12% from the company. 
--Return Customer Name, customer city, Salesman, salesman city, commission. 
SELECT c.cust_name AS "Customer Name", 
c.city, s.name AS "Salesman", s.city, s.commission from city c inner join salesman s on s.salesman_id = c.salesman_id
where c.city <>s.city and s.commission>0.12


--6. From the following tables write a SQL query to find the details of an order. 
--Return ord_no, ord_date, purch_amt, Customer Name, grade, Salesman, commission.
SELECT o.ord_no, o.ord_date, o.purch_amt,
c.cust_name AS "Customer Name", c.grade, 
s.name AS "Salesman", s.commission from order o
inner join customer c on o.customer_id = c.customer_id
inner join salesman s on s.salesman_id = o.salesman_id


--7. Write a SQL statement to join the tables salesman, customer and orders so that 
--the same column of each table appears once and only the relational rows are returned.
SELECT * FROM orders NATURAL JOIN customer NATURAL JOIN salesman;


--8. From the following tables write a SQL query to display the customer name, customer city, grade, salesman, salesman city. 
--The results should be sorted by ascending customer_id. 
SELECT a.cust_name,a.city,a.grade, 
b.name AS "Salesman",b.city 
FROM customer a 
LEFT JOIN salesman b 
ON a.salesman_id=b.salesman_id 
order by a.customer_id;


--9. From the following tables write a SQL query to find those customers with a grade less than 300. 
--Return cust_name, customer city, grade, Salesman, salesmancity. The result should be ordered by ascending customer_id.
SELECT a.cust_name,a.city,a.grade, 
b.name AS "Salesman",b.city 
FROM customer a 
LEFT JOIN salesman b 
ON a.salesman_id=b.salesman_id 
where a.grade <300
order by a.customer_id;


--10. Write a SQL statement to make a report with customer name, city, order number, order date, and order amount in ascending order 
--according to the order date to determine whether any of the existing customers have placed an order or not. 
SELECT a.cust_name,a.city, b.ord_no,
b.ord_date,b.purch_amt AS "Order Amount" 
FROM customer a 
LEFT OUTER JOIN orders b 
ON a.customer_id=b.customer_id 
order by b.ord_date;

--11. SQL statement to generate a report with customer name, city, order number, order date, order amount, salesperson name, and commission 
--to determine if any of the existing customers have not placed orders or if they have placed orders through their salesman or by themselves.
SELECT c.cust_name,c.city, b.ord_no,
b.ord_date,b.purch_amt AS "Order Amount", 
s.name,s.commission
from customer c
left outer join orders o on o.customer_id = c.customer_id
left outer join salesman s on s.salesman_id = c.salesman_id


--12. Write a SQL statement to generate a list in ascending order of salespersons who work either for one or more 
-- customers or have not yet joined any of the customers.
SELECT c.cust_name,c.city,c.grade, 
s.name AS "Salesman", s.city 
from customer c 
right outer join salesman s on s.salesman_id = c.salesman_id
order by c.salesman_id


--13. From the following tables write a SQL query to list all salespersons along with customer name, city, grade, order number, 
--date, and amount.Condition for selecting list of customer : 
--1. Salesmen who works for one or more customer or, 2. Salesmen who not yet join under any customer, 
--3. placed one or more orders, or 4. no order placed to their salesman.
SELECT c.cust_name,c.city,c.grade, 
s.name AS "Salesman", s.city 
from customer c 
right outer join salesman s on s.salesman_id = c.salesman_id
right outer join orders o on o.salesman_id = c.salesman_id

--14. Write a SQL statement to make a list for the salesmen who either work for one or more customers or yet to join any of the customer. 
--The customer may have placed, either one or more orders on or above order amount 2000 and must have a grade, 
--or he may not have placed any order to the associated supplier.
SELECT a.cust_name,a.city,a.grade, 
b.name AS "Salesman", 
c.ord_no, c.ord_date, c.purch_amt 
FROM customer a 
RIGHT OUTER JOIN salesman b 
ON b.salesman_id=a.salesman_id 
LEFT OUTER JOIN orders c 
ON c.customer_id=a.customer_id 
WHERE c.purch_amt>=2000 
AND a.grade IS NOT NULL;

--16. Write a SQL statement to generate a report with the customer name, city, order no. order date, purchase amount 
-- for only those customers on the list who must have a grade and placed one or more orders or which order(s) have been 
-- placed by the customer who neither is on the list nor has a grade.
SELECT a.cust_name,a.city, b.ord_no,
b.ord_date,b.purch_amt AS "Order Amount" 
FROM customer a 
FULL OUTER JOIN orders b 
ON a.customer_id=b.customer_id 
WHERE a.grade IS NOT NULL;

--17. Write a SQL query to combine each row of the salesman table with each row of the customer table.
SELECT * FROM salesman a CROSS JOIN customer b;

--18. Write a SQL statement to create a Cartesian product between salesperson and customer, 
--i.e. each salesperson will appear for all customers and vice versa for that salesperson who belongs to that city. 
SELECT * FROM salesman a CROSS JOIN customer b
where a.city is not null;

--19. Write a SQL statement to create a Cartesian product between salesperson and customer, i.e. each salesperson will appear for 
--every customer and vice versa for those salesmen who belong to a city and customers who require a grade.
SELECT * FROM salesman a CROSS JOIN customer b
where a.city is not null and b.grade IS NOT NULL;

--20. Write a SQL statement to make a Cartesian product between salesman and customer i.e. each salesman will appear 
--for all customers and vice versa for those salesmen who must belong to a city which is not the same as his customer 
-- and the customers should have their own grade.
SELECT * FROM salesman a CROSS JOIN customer b
WHERE a.city IS NOT NULL
and a.city <> b.city and b.grade IS NOT NULL;

--21. From the following tables write a SQL query to select all rows from both participating tables as long as there is 
-- a match between pro_com and com_id
select * from company_mast cm inner join item_mast im on im.PRO_COM= cm.COM_ID

--22. Write a SQL query to display the item name, price, and company name of all the products. 
select * from company_mast cm inner join item_mast im on im.PRO_COM= cm.COM_ID

--23. From the following tables write a SQL query to calculate the average price of items of each company. 
--Return average value and company name. 
select avg(PRO_PRICE), cm.COM_NAME from company_mast cm inner join item_mast im on im.PRO_COM= cm.COM_ID 
group  by COM_NAME

--24. From the following tables write a SQL query to calculate and find the average price of items of 
--each company higher than or equal to Rs. 350. Return average value and company name. 
select avg(PRO_PRICE), cm.COM_NAME from company_mast cm inner join item_mast im on im.PRO_COM= cm.COM_ID 
group  by COM_NAME having PRO_PRICE >= 350

```
--25. From the following tables write a SQL query to find the most expensive product of each company. 
--Return pro_name, pro_price and com_name.
select pro_price,  pro_name, cm.COM_NAME from company_mast cm inner join item_mast im on im.PRO_COM= cm.COM_ID 
where PRO_PRICE = (select max(PRO_PRICE) from company_mast group  by COM_NAME)

```

--26. From the following tables write a SQL query to display all the data of employees including their department.
SELECT emp_idno, A.emp_fname AS "First Name", emp_lname AS "Last Name",
    B.dpt_name AS "Department", emp_dept, dpt_code,  dpt_allotment
     FROM emp_details A 
      INNER JOIN emp_department B
        ON A.emp_dept = B.dpt_code;

--27. From the following tables write a SQL query to display the first and last names of each employee, 
--as well as the department name and sanction amount.
SELECT emp_details.emp_fname AS "First Name", emp_lname AS "Last Name", 
    emp_department.dpt_name AS "Department", 
     dpt_allotment AS "Amount Allotted"
       FROM emp_details 
         INNER JOIN emp_department
           ON emp_details.emp_dept = emp_department.dpt_code;


--28. From the following tables write a SQL query to find the departments with budgets more than 
--Rs. 50000 and display the first name and last name of employees.
SELECT emp_details.emp_fname AS "First Name", emp_lname AS "Last Name", 
    emp_department.dpt_name AS "Department", 
     dpt_allotment AS "Amount Allotted"
       FROM emp_details 
         INNER JOIN emp_department
           ON emp_details.emp_dept = emp_department.dpt_code
    where dpt_allotment >50000;

```
--29. From the following tables write a SQL query to find the names of departments where more than two employees are employed. 
--Return dpt_name.
select emp_department.dpt_name AS "Department"
FROM emp_details 
         INNER JOIN emp_department
           ON emp_details.emp_dept = emp_department.dpt_code
group by emp_department.dpt_name 
having count(*) >2
```