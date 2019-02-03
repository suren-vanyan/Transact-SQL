
--Data Integrity
Use Generals

If OBJECT_ID('Employees') Is Not Null
   Drop table Employees
Go

Create table Employees
(
 Id int Identity Not Null,
 FirstName Nvarchar(20),
 LastName Nvarchar(20),
 Phone char(20) Constraint CK_Employees_Phone Check(Phone Like '([0][0-9][0-9])-[0-9][0-9]-[0-9][0-9]-[0-9][0-9]'),
 Salary decimal(10,4),
 Bonus decimal(10,4),
 Sex varchar(10) Check(Sex IN('male','female','m','f')),
 StartDate date Constraint DF_Employees_StartDate Default Getdate()
)


--CHECK--
Insert Employees
(FirstName,LastName,Phone,Salary,Bonus,Sex)
Values
('Karl','Marks','(061)-48-78-96',500,200,'male')
Go

Alter Table Employees With NOCheck
Add Constraint CK_Employees_Bonus
Check (Bonus<=Salary * 0.1)
Go

Alter Table Employees 
Drop Constraint CK_Employees_Bonus
Go

--NoCheck Constraint
Alter Table Employees
NoCheck Constraint CK_Employees_Bonus
Go

Insert Employees
(FirstName,LastName,Phone,Salary,Sex)
Values
('David','Rikardo','(065)-58-23-96',700,'male')
Go

--include Constraint
Alter table Employees
Check Constraint CK_Employees_Bonus
Go

--add new Constraint for Bonus
Alter Table Employees
Add Constraint DF_Employees_Bonus
Default 0 For Bonus
Go

--Remove Constraint DF_Employees_Bonus
Alter Table Employees
Drop Constraint DF_Employees_Bonus
Go