
--Enitity integrity--
Use Generals
Go

If OBJECT_ID('Employees') Is Not Null
   Drop table Employees
Go

Create table Employees
(
 Id int  Not Null Identity  Constraint PK_Employees_ID Primary Key,
 FirstName Nvarchar(20) Not Null,
 LastName Nvarchar(20) Not Null,
 Phone char(20) Constraint UQ_Employees_Phone Unique,   --(Phone Like '([0][0-9][0-9])-[0-9][0-9]-[0-9][0-9]-[0-9][0-9]'),
 Constraint UQ_Employees_FName_LName Unique(FirstName,LastName)
)


--if i have Identity for field 
Set IDENTITY_INSERT Employees On
Insert Into  Employees(Id,FirstName,LastName,Phone)
 Values
(1,'Evander','Holyfield','(025)-45-48-78')
Set IDENTITY_INSERT Employees OFF
Go

Insert Into  Employees
 Values
('Evander','Holyfield','(025)-45-48-78')
Go

Insert Employees Values
('Jeremy','Bates','(025)-85-48-78')
Go

--PK cannot be disabled or enabled
Alter Table Employees
NoCheck Constraint PK_Employees_ID
Go

--PK cann be drop
Alter Table Employees
Drop Constraint PK_Employees_ID
Go

--Add Constraint for two column
Alter Table Employees
Add Constraint PK_Employees_FName_LName 
Primary Key(FirstName,LastName)
Go

Alter Table Employees
Drop Constraint PK_Employees_FName_LName


Alter Table Employees
Add Constraint PK_Employees_ID 
Primary Key(id)
Go

--UNIQUE--
Insert Employees Values 
('Myke','Tyson','(025)-85-56-78')
Go

Insert Employees Values 
('Pol','Tyson','(025)-85-20-58')
Go