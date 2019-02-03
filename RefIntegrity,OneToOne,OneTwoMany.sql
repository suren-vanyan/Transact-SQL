
--Referential Integrity

If OBJECT_ID('Employees') Is Not Null
   Drop table Employees
Go

Create table Employees
(
 Id int  Not Null IDENTITY   Primary Key,
 FirstName Nvarchar(20) Not Null,
 LastName Nvarchar(20) Not Null,
 Phone char(20) 
)

If OBJECT_ID('Orders') is Not Null
Drop Table Orders
Go

Create Table Orders
(
 Id int Not Null Identity Primary Key,
 [Date] date Default GetDate(),
 TotalSum decimal(10,4) Default 0,
 EmployeeId int Constraint FK_Orders_Employees Foreign Key
 References Employees(id)
 --On Delete No Action
 --On Update No Action
)

Insert Employees
Values
('Herbert','Shildt','(025)-89-56-23'),
('Andrew','Troelsen','(025)-54-56-23'),
('Jeffrey','Richter','(041)-89-56-23')
Go

Insert Orders(EmployeeId)
Values
(1),(3),(2)

Alter table Orders
Check Constraint FK_Orders_Employees

Insert Orders(EmployeeId)
Values
(5),(6)

Delete From Orders
Where EmployeeId In(2,6)

------One To One------

CREATE TABLE Products (
	Id int NOT NULL IDENTITY PRIMARY KEY
	,[Name] varchar(30)	
);
GO

CREATE TABLE ProductDescr (
	Id int Not Null Identity Primary key
	,Color varchar(20)
	,[Weight] decimal(10,4)
	,ProductId Int UNIQUE Foreign Key References Products(Id)
);
GO

CREATE TABLE Stock (
	Id int NOT NULL IDENTITY PRIMARY KEY
	,QTY int 
	,ProductId int UNIQUE FOREIGN KEY REFERENCES Products(Id)
);
GO

Insert Products
Values
('Product1'),('Product2'),('Product3')
Go

Insert ProductDescr
Values
('Black',9.2,1),('White',5.4,2),('Yellow',8.6,3)
Go

Insert Stock
Values
(80,1),(50,2),(100,3)
Go

--Many to Many

Create Table OrderProducts
(
 OrderId INT Not Null,
 ProductId INT NOT NULL,
 PRIMARY KEY(OrderId,ProductId),
 FOREIGN KEY(OrderId) REFERENCES Orders(id),
 FOREIGN KEY(ProductId) REFERENCES Products(Id)
)

