-- From the following tables, write a SQL query to find the salespeople and customers who live in the same city. 
-- Return customer name, salesperson name and salesperson city.
select s.name, c.cust_name from salesman s, customer c
where s.city = c.city

--2. From the following tables, write a SQL query to locate all the customers and the salesperson who works for them.
-- Return customer name, and salesperson name. 
select c.cust_name, s.name  from salesman s, customer c
where s.salesman_id = c.salesman_id


--3. From the following tables, write a SQL query to find those salespeople who generated orders for their customers but are not located in the same city. 
-- Return ord_no, cust_name, customer_id (orders table), salesman_id (orders table). 
select  o.ord_no, c.cust_name, o.customer_id, o.salesman_id from orders o, salesman s, customer c
where s.city != c.city AND o.salesman_id = s.salesman_id AND o.customer_id = c.customer_id


--4. From the following tables, write a SQL query to locate the orders made by customers. Return order number, customer name
select  o.ord_no, c.cust_name from orders o, customer c
where o.customer_id = c.customer_id

--5. From the following tables, write a SQL query to find those customers where each customer has a grade and is served by a salesperson who belongs to a city. 
--Return cust_name as "Customer", grade as "Grade".  
select  c.cust_name, c.grade, o.ord_no from customer c, salesman s, ord_no o
where c.grade is not null and s.city is not null and o.salesman_id = s.salesman_id and o.customer_id = c.customer_id

--6. From the following table, write a SQL query to find those customers who are served by a salesperson 
-- and the salesperson earns commission in the range of 12% to 14% (Begin and end values are included.). 
-- Return cust_name AS "Customer", city AS "City".
select c.cust_name, c.city, s.name, s.commission  from salesman s, customer c
where s.salesman_id = c.salesman_id AND s.commission between 0.12 and 0.14

--7. From the following tables, write a SQL query to find all orders executed by the salesperson and ordered by 
-- the customer whose grade is greater than or equal to 200. Compute purch_amt*commission as “Commission”. 
-- Return customer name, commission as “Commission%” and Commission. 
select  o.ord_no, c.cust_name, s.commission as 'commission%', o.purch_amt*s.commission as Commission from customer c, salesman s, ord_no o
where c.grade >=200 and o.salesman_id = s.salesman_id and o.customer_id = c.customer_id


--8. From the following table, write a SQL query to find those customers who placed orders on October 5, 2012. 
-- Return customer_id, cust_name, city, grade, salesman_id, ord_no, purch_amt, ord_date, customer_id and salesman_id. 
select  c.customer_id, c.cust_name, c.city, c.grade, c.salesman_id, o.ord_no, o.purch_amt, o.ord_date, o.customer_id, o.salesman_id
from o.customer_id = c.customer_id and o.ord_date = '2012-10-05'