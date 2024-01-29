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