

create Table Person
(
  Id int Not Null Identity Primary Key,
  [Date] date default Getdate(),
  FirstName nvarchar(15),
  LastName nvarchar(15),

)

Create Table PersonFrinds
(
   Id int Not Null Identity Primary Key,
  FirstName nvarchar(15),
  LastName nvarchar(15),
  PersonId int Foreign Key References Person(Id),

)

Insert Person(FirstName,LastName)
Values
('Tom','Jones'),
('Brett','Pit'),
('Angelina','Joli')

Insert PersonFrinds
Values
('Karen','Vardanyan',2),
('Poxos','Poxosyan',2),
('Pargev','Avagyan',3)


Select * from Person p
Right join PersonFrinds pf
On p.Id=pf.PersonId

----System Functions----
Declare @MyInt INT
Set @MyInt='Hello'
Go

Select @@ERROR
Go

Begin Try
Declare @variable INT
SET @variable=10/0
END TRY
BEGIN CATCH
SELECT
     ERROR_NUMBER() AS ErrorNumber
    ,ERROR_SEVERITY() AS ErrorSeverity  
    ,ERROR_STATE() AS ErrorState  
    ,ERROR_PROCEDURE() AS ErrorProcedure  
    ,ERROR_LINE() AS ErrorLine  
    ,ERROR_MESSAGE() AS ErrorMessage

END CATCH

--@@IDENTITY--
Insert Products
Values
('HTC One')
Go
SELECT
@@IDENTITY
GO
--

UPDATE Orders
SET Date=GetDate()
WHERE Id=3
Go
Select @@ROWCOUNT
Go



--CREATE UNQUE VALUE uniqueidentifier
Declare @NewId uniqueidentifier
Set @NewId=NEWID()
Print @NewId

Select
ISNUMERIC(@NewId),
ISNUMERIC('abc'),
ISNUMERIC('123')

Alter table Employees
Add  Salary int

Use Generals
Select Id,FirstName,LastName,Phone,ISNULL(Salary,8) as esiminch From Employees


Select 10/3,
	   10./3,
	   Cast(10 as decimal)/7,
	   Convert(decimal,5)/4

