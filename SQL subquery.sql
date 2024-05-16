-- SQL SUBQUERY--
-- A subquery is a Select query that is enclosed inside another query.--
select * from hr_data;

/* 1. write a SQL query to find those employees who receive a higher 
salary than the employee with ID 163. Return first name, last name.*/
select first_name,last_name,salary
from hr_data where salary >
(select salary from hr_data where employee_id = 163);

select first_name,last_name,salary from hr_data where salary > 9500;


/*2.write a SQL query to find out which employees have the same designation
 as the employee whose ID is 169. Return first name, last name, department ID and job ID.*/
select first_name,last_name,department_id,job_id from hr_data where job_id =
(select job_id from hr_data where employee_id = 169);

 select first_name,last_name,department_id,job_id from hr_data where job_id = "sa_rep";
 
 
 /*4. write a SQL query to find those employees who earn more than the 
average salary. Return employee ID, first name, last name.*/
select employee_id,first_name,last_name from hr_data where salary > 
(select round(avg(salary),0) from hr_data);


/*5.write a SQL query to find those employees who report to that 
manager whose first name is ‘Payam’. Return first name, last name, employee ID and salary.*/
select first_name,last_name,employee_id,salary from hr_data where manager_id = 
(select manager_id from hr_data where first_name = "payam");


/*7. write a SQL query to find those employees who do not work in the 
departments where managers’IDs are between 100 and 200. Return all the fields of the employees.*/
select * from hr_data where department_id in 
(select department_id from hr_data where not manager_id between 100 and 200);

select * from hr_data where department_id in (90,20,110)


/*8.write a SQL query to find those employees who work in the same
 department as ‘Clara’. Exclude all those records where first name is 
‘Clara’. Return first name, last name and hire date.*/

select first_name,last_name,hire_date from hr_data where job_id =
(select job_id from hr_data where first_name = "clara") and first_name <> "clara";

 
 /*write a SQL query to find those employees who work in a department 
where the employee’s first name contains the letter 'T'. Return employee 
ID, first name and last name.*/
select employee_id,first_name,last_name from hr_data where job_id in
(select job_id from hr_data where first_name like "%T%");




-- write a SQL query to find the details of those salespeople who come from the 'Paris' City or 'Rome' City. Return salesman_id, name, city, commission.--
select * from customerj;
select salesman_id,cust_name,city from customerj where salesman_id = 
(select salesman_id from customerj where city = "paris" or "rome");


-- write a SQL query to find the details of those salespeople who live in cities other than Paris and Rome. Return salesman_id, name, city, commission.--
select salesman_id,cust_name,city from customerj where salesman_id in
(select salesman_id from customerj where city <> "paris" or "rome");


-- write a SQL query to retrieve the details of all customers whose grades are between 200 and 300.Return customer_id, cust_name, city, grade, and salesman_id.*/tomer_id, cust_name, city, grade, and salesman_id--
select * from customerj where customer_id in
(select customer_id from customerj where grade between 200 and 300);

-- write a SQL query to find salespeople who receive commissions between 0.12 and 0.14 . Return salesman_id, name, city, and commission.--
select * from salesman where salesman_id in
(select salesman_id from salesman where commission between 0.12 and 0.14);

-- write a SQL query to identify those employees whose salaries exceed 3000 after receiving a 25% salary increase. Return complete information about the employees.--
select * from emp;
select * from emp where (1.25*salary) > 3000;