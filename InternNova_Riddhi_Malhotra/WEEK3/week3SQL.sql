
--DATABASE:
--A database is an organized collection of data that can be easily accessed,managed, and updated. 
--It is designed to store information in a structured way so that users and applications can retrieve and manipulate it efficiently.

--TERMS OF DATABASE:
--Tables: Data is stored in tables, which are made up of rows (records) and columns (fields).
--Records (Rows): Each row represents a single entry in the table.
--Fields (Columns): Each column represents a specific attribute of the data.

--IMPORTANCE OF DATABASE:
   --structured
   --consistent
   --integrity
   --scalability

Create database InternNova_Riddhi_Malhotra
--In SQL, you use the CREATE DATABASE command to make a new database.

use [InternNova_Riddhi_Malhotra]
--After creating it, you need to tell SQL which database you’re working with.

CREATE TABLE Employees (
    EmpID INT PRIMARY KEY,             -- Unique employee ID
    Name VARCHAR(50),                  -- Employee name
    Department VARCHAR(30),            -- Department name
    Salary DECIMAL(10,2)               -- Salary with 2 decimal places
);

--Insert sample records
INSERT INTO Employees (EmpID, Name, Department, Salary)
VALUES
(101, 'Niklaus', 'HR', 50000),
(102, 'Elijah', 'IT', 60000),
(103, 'Rebekah', 'Finance', 55000),
(104, 'Hayley', 'IT', 58000);

------------------------------------------TASK 1-----------------------------------------------------

--1 SQL query to display all the records
select * from Employees

--2 select specific column
select EmpID from Employees
select Name from Employees
select Department from Employees
select Salary from Employees

--3 use allias where required
SELECT Name AS EmployeeName, Salary AS MonthlySalary 
FROM Employees;


---Task 1 introduces the foundation of databases and demonstrates how the SELECT statement is used to query data. 
--It shows how to retrieve all records, specific columns, and how to make results more readable with aliases.

---------------------------------------TASK 2----------------------------------------------------------
--1 using the where clause
SELECT * 
FROM Employees
WHERE Department = 'IT';

--2using comparison operator
SELECT * 
FROM Employees
WHERE Salary > 55000;


--3 using the order by clause
select * from Employees order by salary

--4 aggregate functions:
--count():to find the total number of records
SELECT COUNT(*) AS TotalEmployees 
FROM Employees;

--sum():to calculate the total salary.
SELECT SUM(Salary) AS TotalSalary 
FROM Employees;

--avg():to calculate the average salary.
SELECT AVG(Salary) AS AverageSalary 
FROM Employees;

--min():to determine the minimum salary.
select min(salary)  as MINSALARY from Employees

--MAX():to determine the maximum salary.
select MAX(salary)  as MAXSALARY from Employees

--In Task 2, we explored how to refine and analyze data using SQL.
--The WHERE clause was used to filter records based on specific conditions, such as selecting employees from a particular department or those earning above a certain salary. 
--Comparison operators (>, <, =, !=) allowed precise filtering. 
--The ORDER BY clause helped sort records in ascending or descending order, making the data easier to interprete.

-----------------------------------------TASK 3-------------------------------------------------------------------------

--1 group the records
SELECT Department, AVG(Salary) AS AvgSalary
FROM Employees
GROUP BY Department;

--2 calculate aggregate values for each group
SELECT Department, SUM(Salary) AS TotalSalary
FROM Employees
GROUP BY Department;

--3 use the having clause
SELECT Department, AVG(Salary) AS AvgSalary
FROM Employees
GROUP BY Department
HAVING AVG(Salary) > 55000;

--task 3 shows how grouping and aggregation provide summarized insights,
--while the HAVING clause allows filtering of grouped results based on aggregate conditions.

------------------------------------------------------TASK 4------------------------------------------------------------------------------
--SQL JOINs are used to combine rows from two or more tables based on a related column. 
--They allow us to query across multiple tables and see connected information.

--CREATING THE TWO TABLES FOR JOINING
CREATE TABLE Table1 (
    EmpID INT PRIMARY KEY,
    Name VARCHAR(50),
    Department VARCHAR(30)
);

INSERT INTO Table1 (EmpID, Name, Department)
VALUES
(101, 'Niklaus', 'HR'),
(102, 'Elijah', 'IT'),
(103, 'Rebekah', 'Finance'),
(104, 'Hayley', 'IT');


CREATE TABLE Table2 (
    EmpID INT PRIMARY KEY,
    Salary DECIMAL(10,2),
    Bonus DECIMAL(10,2)
);

INSERT INTO Table2 (EmpID, Salary, Bonus)
VALUES
(102, 60000, 7000),
(103, 55000, 6000),
(104, 58000, 5000),
(105, 45000, 4000);

SELECT * FROM Table1
SELECT * FROM TABLE2

--1 INNER JOIN → you can use inner join if you want to combine rows from two or more tables based on related columns between them
SELECT T1.Empid,T1.name,T1.department,T2.salary,T2.bonus
from 
TABLE1 T1 INNER JOIN TABLE2 T2 on T1.EmpID=T2.EmpID

--2 LEFT JOIN → Returns all rows from the left table (Table1), and the matched rows from the right table (Table2). If no match exists, NULL values are shown for right table columns.
SELECT T1.Empid,T1.name,T1.department,T2.salary,T2.bonus 
from  TABLE1 T1 LEFT JOIN TABLE2 T2 on T1.EmpID=T2.EmpID

--3 RIGHT JOIN → Returns all rows from the right table (Table2), and the matched rows from the left table (Table1). If no match exists, NULL values are shown for left table columns.
SELECT T1.Empid,T1.name,T1.department,T2.salary,T2.bonus 
from  TABLE1 T1 RIGHT JOIN TABLE2 T2 on T1.EmpID=T2.EmpID


----------------------------------------------------------------TASK 5--------------------------------------------------------------------------

--A subquery is a query nested inside another SQL query. It is often used in the WHERE, FROM, or SELECT clauses to perform intermediate calculations or filtering. 
--Subqueries allow us to compare values against aggregated results or dynamically generated sets.

--1 Find employees earning more than the average salary.
SELECT Name, Salary
FROM Employees
WHERE Salary > (SELECT AVG(Salary) FROM Employees);

--2 Find employees whose salary equals the maximum salary
SELECT Name, Salary
FROM Employees
WHERE Salary = (SELECT MAX(Salary) FROM Employees);





