
----------Scalar Functions-----------

--Conversion Functions
Use Generals

SELECT * FROM GeneralCommanders

Select CONVERT(datetime,'20180216 13:42')--2018-02-16 13:42:00.000
SELECT CAST('20180216 13:42' as datetime)

--IF CANNT CONVERT RESULT IS NULL
SELECT TRY_CAST('01-26-1991'AS DATETIME)
SELECT TRY_CAST('26-01-1991'AS DATETIME)--NULL

SELECT TRY_CONVERT(INT,'QAZWSX')
SELECT TRY_CONVERT(NVARCHAR,'QAZWSX')

SELECT ASCII('HELLO')
SELECT UNICODE('Բարև')--63

--String Functions
SELECT LEFT('qazwsx',3)--qaz
SELECT RIGHT('qazwsx',5)--azwsx
SELECT SUBSTRING('Net Framework',2,5)--et Fr
SELECT UPPER('word')[UPPER]--WORD
SELECT REVERSE('DELEGATE')[REVERS]--ETAGELED
SELECT STUFF('????ResetEvent',1,4,'Auto')--AutoResetEvent

SELECT LTRIM('  event  ')
Select RTRIM('Mutex  ')
Select REPLICATE('ABC',3)
Select 'A'+ SPACE(6) + 'B' As [SPACE]


SELECT CHARINDEX('Two', 'One Two Three '),
	   CHARINDEX('Two', 'One Two Three Two ', 6),
	   PATINDEX('%T_o%', 'One Two Three Two Four')

SELECT REPLACE('Galaxy S8 Plus', 'S8 Plus', 'Note 8')  
SELECT REPLACE('HELLO WORLD','WORLD','SUREN') [REPLACE]