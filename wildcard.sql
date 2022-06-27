--Ques.10. Write an SQL query to fetch the employees whose name begins with any two characters, followed by a text “hn” and ending with any sequence of characters.
select *  from employees
where first_name LIKE '_e%'

--From the following table, write a SQL query to find the details of the customers whose name begins with the letter 'B'. 
--Return customer_id, cust_name, city, grade, salesman_id.
select * from customers where name LIKE 'B%'

--From the following table, write a SQL query to find the details of the customers whose names end with the letter 'n'. Return customer_id, cust_name, city, grade, salesman_id.
select * from customers where name like '%n'

--From the following table, write a SQL query to find the details of those salespeople whose name starts with ‘N’ and the fourth character is 'l'. Rests may be any character. 
--Return salesman_id, name, city, commission.

select * from salesman where name like 'N__l%'

--From the following table, write a SQL query to find those rows where col1 contains the escape character underscore ( _ ). Return col1.
SELECT * FROM testtable where col1 LIKE '%/_%' ESCAPE '/'

--From the following table, write a SQL query to identify those rows where col1 does not contain the escape character underscore ( _ ). Return col1.
SELECT * FROM testtable where col1 NOT LIKE '%/_%' ESCAPE '/'

--From the following table, write a SQL query to find rows in which col1 contains the forward slash character ( / ). Return col1. 
SELECT * FROM testtable where col1  LIKE '%//%' ESCAPE '/'

--From the following table, write a SQL query to find those rows where col1 contains the string ( _/ ). Return col1.
SELECT * FROM testtable where col1  LIKE '%/_//%' ESCAPE '/'

--From the following table, write a SQL query to find those rows where col1 contains the character percent ( % ). Return col1.
SELECT * FROM testtable where col1  LIKE '%/%%' ESCAPE '/'