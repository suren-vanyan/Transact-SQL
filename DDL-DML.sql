--DDL--


--Create--
Drop database Generals
Create database Generals

Use  Generals


Create table GeneralCommanders
(
  Id int Not Null Identity,
  FirstName Nvarchar(20),
  LastName Nvarchar(20),
  Phone char(10),
  Email varchar(20),
)


--Alter--
Alter table GeneralCommanders
Alter Column LastName Nvarchar(30) Not Null

Alter table GeneralCommanders
Add MName nvarchar(20) Not Null

Alter Table GeneralCommanders
Drop Column MName

------DML-----
---Insert
Insert into GeneralCommanders
(FirstName,LastName,Phone,Email)
Values
(N'Վարդան',N'Մամիկոնյան','123456789','vardan@gmail.com'),
 (N'Դավիթ',N'Բեկ','123456789','davit@gmail.com')
	   

Set Identity_Insert GeneralCommanders On
Insert into GeneralCommanders
(Id,FirstName,LastName,Phone,Email)
Values (3,'Hannibal','Barka','456987123','hannibark@gmail.com')
      
Set Identity_Insert GeneralCommanders On
Insert into GeneralCommanders
(Id,FirstName,LastName,Phone,Email)
Values (4,'Julius','Caesar','231654897','julius@gmail.com')
Set Identity_Insert GeneralCommanders OFF

Set Identity_Insert GeneralCommanders On
Insert into GeneralCommanders
(Id,FirstName,LastName,Phone,Email)
Values (5,'Hannibal','Barka','456987123','hannibark@gmail.com')

Set Identity_Insert GeneralCommanders OFF

--Select--
Select * From GeneralCommanders

Drop table GeneralPhones
Create Table GeneralPhones
(
 Id int,
 Phone char(10),
 LastName nvarchar(20)
)

Insert GeneralPhones
Select  Id,Phone,LastName  From  GeneralCommanders

--Update--
Update GeneralCommanders
 Set Phone=Null
 

 Update GeneralCommanders
 Set Phone=gp.Phone
 From GeneralCommanders g
 Join GeneralPhones gp On g.Id=gp.Id

 --Delete--
 Delete GeneralCommanders
 Where Id=5
 Delete GeneralPhones
 Where Id=5

 Delete GeneralCommanders
 --Truncate--
 Truncate table GeneralCommanders
 Truncate table GeneralPhones

 --Output--
 Insert into GeneralCommanders
(FirstName,LastName,Phone,Email)
Output inserted.*
Values
(N'Վարդան',N'Մամիկոնյան','456','vardan@gmail.com'),
 (N'Դավիթ',N'Բեկ','123','davit@gmail.com'),
 ('Hannibal','Barka','456987123','hannibark@gmail.com'),
 ('Julius','Caesar','231654897','julius@gmail.com')

Alter Table GeneralPhones
Alter Column Phone varchar(20)

 Update GeneralPhones
 Set Phone='37498456325'
 Output inserted.Id,inserted.Phone as [new Phone],inserted.LastName ,deleted.Phone as [old Phone]
 where id=2

 delete GeneralPhones
 where id>8

 Delete GeneralCommanders
 Output deleted.Id,deleted.Phone,deleted.LastName Into GeneralPhones

 Declare @NewTable table (id int ,Phone char(20),FirstName nvarchar(20),LastName nvarchar(20))
 Delete GeneralCommanders 
 Output deleted.Id,deleted.Phone,deleted.FirstName,deleted.LastName  into @NewTable 
 Select * from @NewTable

