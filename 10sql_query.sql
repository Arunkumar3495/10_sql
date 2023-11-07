use demo;
CREATE TABLE customers (
  customer_id INT PRIMARY KEY,
  customer_name VARCHAR(100)
);

CREATE TABLE orders (
  order_id INT PRIMARY KEY,
  customer_id INT,
  order_date DATE,
  total_amount DECIMAL(10, 2),
  FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);
INSERT INTO customers(customer_id, customer_name)
VALUES (1, 'Rohan'), (2, 'Viraj'), (3, 'Kartik'), (4, 'Navin');

INSERT INTO orders (order_id, customer_id, order_date, total_amount)
VALUES (101, 1, '2022-12-15', 100.00), (102, 2, '2023-01-05', 75.50),
       (103, 3, '2023-01-20', 250.00), (104, 2, '2023-02-01', 50.00),
       (105, 4, '2023-02-08', 120.00), (106, 1, '2023-02-10', 80.00);
       

select c.customer_id,c.customer_name, sum(o.total_amount ) as total_revenue
from customers c
join orders o on c.customer_id = o.customer_id
where o.order_date >='2023-02-01' and o.order_date < '2023-03-01'
group by c.customer_id,c.customer_name

-- write a query retrive a first two character in customer name from the customers table --
select * from customers;
select substr(customer_name,1,2),customer_name from customers;

-- write a query to create a new table copied from another table --
create table temp as select * from customers; 
select * from temp;

-- write a query to create table a new table structure to copy another table --
create table temp2 as select * from orders where 1=0
select * from temp2

-- write a query first 5 records--
select * from orders limit 5

-- write a query first_name and last_name in a single column
-- f_name,l_name with space --
-- F_name ,l_name with out space --
use employees
select* from employee
select concat(f_name,' ',l_name) from employee 

select concat(f_name, l_name) from employee

-- write a query to fetch of all employees last name end with 'e'

select * from employee where l_name
like '%e'

-- write a query all the employees excluding the emplyee l_name 'gee' from employee table --
select * from employee where l_name not in ('gee')


-- write a query all the employees excluding the emplyee salary below 210000 from employee table --
select * from employee where salary > 210000

-- write a query to fetch the manager_id count -
select count(manager_id)
from employee

