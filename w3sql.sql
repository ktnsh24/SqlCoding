
--1. From the following tables, write a SQL query to find all the orders issued by the salesman 'Paul Adam'. 
--Return ord_no, purch_amt, ord_date, customer_id and salesman_id.
select ord_no, purch_amt,ord_date,customer_id, salesman_id
from orders
where salesman_id in (select salesman_id from salesman where name = 'Paul Adam')

--2. From the following tables write a SQL query to find all orders generated by London-based salespeople. 
-- Return ord_no, purch_amt, ord_date, customer_id, salesman_id.
select ord_no, purch_amt, ord_date,customer_id, salesman_id
from orders 
where salesman_id in (select salesman_id from salesman where city= 'London')


--3. From the following tables write a SQL query to find all orders generated by the salespeople who may work for customers whose id is 3007. 
-- Return ord_no, purch_amt, ord_date, customer_id, salesman_id.
select ord_no, purch_amt, ord_date,customer_id, salesman_id
from orders 
where salesman_id in (select distinct salesman_id from orders where customer_id = 3007)


--4. From the following tables write a SQL query to find the order values greater than the average order value of 10th October 2012. 
-- Return ord_no, purch_amt, ord_date, customer_id, salesman_id.
select ord_no, purch_amt, ord_date, customer_id, salesman_id
from orders
where purch_amt > (select avg(purch_amt) from orders where ord_date = '2012-10-10' )


--5. From the following tables, write a SQL query to find all the orders generated in New York city. 
-- Return ord_no, purch_amt, ord_date, customer_id and salesman_id.
select ord_no, purch-amt, ord_date,customer_id, salesman_id
from orders 
where salesman_id in (select salesman_id from salesman where city = 'New York')


--6. From the following tables write a SQL query to determine the commission of the salespeople in Paris. Return commission.
select commission from salesman 
where salesman_id = (select salesman_id from customer where city= 'paris')


--7. Write a query to display all the customers whose ID is 2001 below the salesperson ID of Mc Lyon.
select * from customers 
where customer_id < (select salesman_id-2001 from salesman where name = 'Mc Lyon')


--8. From the following tables write a SQL query to count the number of customers with grades above the average in New York City. 
-- Return grade and count.  
select grade, count(*) from customer 
group by grade
having grades > (select avg(grade) from customer where city = 'New York' )


--9. From the following tables, write a SQL query to find those salespeople who earned the maximum commission. 
-- Return ord_no, purch_amt, ord_date, and salesman_id. 
select ord_no, purch_amt, ord_date, salesman_id from order 
where salesman_id in (select salesman_id from salesman where commission = (select max(commission) from salesman ))

--10. From the following tables write SQL query to find the customers who placed orders on 17th August 2012. 
-- Return ord_no, purch_amt, ord_date, customer_id, salesman_id and cust_name.