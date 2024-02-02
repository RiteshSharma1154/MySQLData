---Create Table : Employee

CREATE Table employee(
    id int NOT NULL IDENTITY(1, 1),
    employeeName char(128),
    department char(128),
    pincode int NOT NULL

);

---ALTER Table : Change Field Pincode to ZipCode : 
---We Use : EXEC sp_rename 'TableName.FieldName','FieldName Name you want to change it to'
EXEC sp_rename 'employee.pincode', 'zipcode';

SELECT * FROM employee;


---DELETE the field : Or Removing the field from the table 
---We use : ALTER TABLE table_name DROP column_name1,column_name2...
ALTER TABLE employee DROP COLUMN zipcode;

---ADD the field : Or Adding the field to the table 
---We use : ALTER TABLE table_name ADD COLUMN new_column_name data_type [FIRST | AFTER existing_column];
ALTER TABLE employee ADD pincode int;


----ADDING Data in Table: Employee 
INSERT INTO employee(employeeName,department,pincode) VALUES ('ABC','PHY','123');
INSERT INTO employee(employeeName,department,pincode) VALUES ('XZY','CHEM','343');
INSERT INTO employee(employeeName,department,pincode) VALUES ('BVG','HIN','455');
INSERT INTO employee(employeeName,department,pincode) VALUES ('NHV','ENG','566');


---UPDATING VALUES IN Table : Employee
UPDATE employee SET employeeName = 'JKL' WHERE id = 1;

---TRY / CATCH Block to catching errors and showing error messages in SQL queries.
BEGIN TRANSACTION

BEGIN TRY 

Update Z SET z.Account.Code='' FROM dbo.AccountCodes z

COMMIT TRANSACTION
END TRY
BEGIN CATCH

PRINT ERROR_LINE()
PRINT ERROR_MESSAGE()

ROLLBACK TRANSACTION
END CATCH

---Example : TRY /CATCH 
BEGIN TRANSACTION
BEGIN TRY

UPDATE emp SET emp.employeeName = 'FCCC'
FROM dbo.employee emp

COMMIT TRANSACTION
END TRY
BEGIN CATCH

PRINT ERROR_LINE()
PRINT ERROR_MESSAGE()

ROLLBACK TRANSACTION
END CATCH



SELECT r.session_id,
        r.status,
        r.command,
        r.cpu_time,
        r.total_elapsed_time,
        r.text_size
from sys.dm_exec_requests as r 


----DELETING THE table Data : TRUNCATE TABLE table_name ( Its deletes all the data in the table )
TRUNCATE TABLE employee


----Filer / finding value that is ending with  certain value or alphabets 
--- Ending with Y -> '%Y'
--- Starting with -> 'X%'
SELECT * FROM employee WHERE employeeName LIKE '%Y';


--- Creating Table : Employee
CREATE Table employees(
    Empid int NOT NULL IDENTITY(1,1),
    FirstName CHAR(128),
    LastName CHAR(128),
    Email CHAR(128),
    PhoneNo int NOT NULL,
    Salary int NOT NULL,
    Depid int NOT NULL
);

SELECT * from employees


--- Inserting Values in Table : employees
INSERT INTO employees (FirstName, LastName, Email, PhoneNo, Salary, Depid)
VALUES 
    ('John', 'Doe', 'john.doe@example.com', 123456789, 50000, 1),
    ('Jane', 'Smith', 'jane.smith@example.com', 987643210, 60000, 2),
    ('Bob', 'Johnson', 'bob.johnson@example.com', 551234567, 75000, 1),
    ('Alice', 'Williams', 'alice.williams@example.com', 998887777, 80000, 2),
    ('Chris', 'Taylor', 'chris.taylor@example.com', 11223333, 70000, 1);



---Create Table : Department
CREATE Table Department(
    Depid int NOT NULL,
    Names CHAR(128)
   
);

SELECT * From Department

----Inserting values in Table : Department

INSERT INTO Department (Depid, Names)
VALUES 
    (1, 'HR'),
    (2, 'Finance'),
    (3, 'IT'),
    (4, 'Marketing'),
    (5, 'Operations');


---- SQL - GROUP BY Clause
SELECT * from employees
SELECT * from Department
SELECT Depid, COUNT(EmpId) as 'Number of Employees' FROM employees GROUP BY Depid;  
SELECT Depid, COUNT(*) as 'Number of Employess' FROM employees GROUP BY Depid;
SELECT dept.[Names] as 'Department', COUNT(emp.Empid) as 'No of Employees' FROM employees emp,Department dept WHERE emp.Depid = dept.Depid GROUP BY dept.[Names]



--- SQL Server - INNER JOIN Query
SELECT * FROM employees
INNER JOIN Department
ON employees.depid = Department.Depid;

--- Exercise: Lab 4
--- CREATE TABLE : employeeNew
CREATE table employeeNew(
employee_id int PRIMARY KEY,
employee_name CHAR(128),
position VARCHAR(128),
salary INT, 
[start_date] DATE,
department_id INT,
FOREIGN KEY (department_id) REFERENCES Departments(department_id)
);

SELECT * from employeeNew

--- CREATE TABLE : Departments
CREATE Table Departments(
    department_id INT PRIMARY KEY,
    department_name VARCHAR(128),
    location VARCHAR(128)
);

SELECT * from Departments
SELECT * from employeeNew

-- Inserting data into Departments table
INSERT INTO Departments (department_id, department_name, location)
VALUES
(1, 'HR', 'New York'),
(2, 'IT', 'San Francisco'),
(3, 'Marketing', 'Los Angeles'),
(4, 'Finance', 'Chicago'),
(5, 'Operations', 'Dallas'),
(6, 'Sales', 'Miami'),
(7, 'Research and Development', 'Seattle'),
(8, 'Customer Support', 'Denver'),
(9, 'Legal', 'Boston'),
(10, 'Quality Assurance', 'Austin');


--- INSERT Value in Table : employeeNew
INSERT INTO employeeNew (employee_id, employee_name, position, salary, start_date, department_id)
VALUES
(101, 'John Doe', 'Manager', 80000, '2022-01-15', 1),
(102, 'Jane Smith', 'Developer', 70000, '2022-02-28', 2),
(103, 'Bob Johnson', 'Marketing Specialist', 60000, '2022-03-10', 3),
(104, 'Alice Brown', 'Financial Analyst', 75000, '2022-04-05', 4),
(105, 'Chris Wilson', 'HR Coordinator', 55000, '2022-05-20', 1),
(106, 'Emily Davis', 'IT Support Specialist', 65000, '2022-06-12', 2),
(107, 'Mike Turner', 'Sales Representative', 70000, '2022-07-08', 6),
(108, 'Sara Miller', 'Customer Service Agent', 50000, '2022-08-25', 8),
(109, 'Tom Harris', 'Legal Counsel', 90000, '2022-09-14', 9),
(110, 'Linda Rodriguez', 'QA Engineer', 60000, '2022-10-02', 10);


----1. Add a column named "start_date" to the Employees table.
ALTER table employeeNew ADD start_date DATE