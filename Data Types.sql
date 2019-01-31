
--Data Types
----Bit

Declare @oneBit bit=0
Print @oneBit

Set @oneBit=200
Print @oneBit

---Ineteger
Declare @someInt int = 500
Print @someInt

Set @someInt=2147483647+2
Print @someInt

---Decimal-(Numeric)
Declare @someDecimal decimal(9,4) =26578.5645 --26578.5645
Print @someDecimal

Declare  @someDecimal2 decimal =265.60--266
Print @someDecimal2

Declare @someDecimal3 decimal(8,5)=256. --256.56100
Print @someDecimal3

---Date
Declare @someDate date ='01-26-1991'--1991-01-26
Print @someDate

Set @someDate = '20190126'
Print @someDate

--DateTime
Declare @someDateTime DateTime='01-26-1991 01:15:25'
Print @someDateTime

--Time
Declare @someTime Time='11:25:58:123'
Print @someTime

Declare  @someTime2 Time ='11:25:58.123'
Print @someTime2

---Nchar
Declare @someNchar nchar ='Hello'
Print @someNchar

Declare @someNchar2 nchar(10)='Hello World'--Hello Worl
Print @someNchar2

set @someNchar2= N'Բարև'
Print @someNchar2

set @someNchar2= N'Привет'
Print @someNchar2


--Nvarchar
Declare @someNvarchar Nvarchar(15) =N'Բարև'  --'Բարև'4char
Print @someNvarchar

Declare @someNchar3 nchar(10)= N'Բարև'  --'Բարև      '4char+6space
Print @someNchar3

--Arithmetic Operators

--(+)
Declare @One int=890,@Two int=125
Select @One+@Two

--(-)
Declare @A int=100,@B int=125
Select @A-@B+@One

Declare @Date datetime='19910126'--1991-01-27 06:00:00.000
Select @Date+1.25

--(/)

Select 10*3.5--decimal
	   ,20/4.5--decimal
	   ,20/5--int
--(%)
Select 8%6 --2