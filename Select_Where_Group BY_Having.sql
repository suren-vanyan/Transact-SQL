-----Select----

--Distinct--
Select Distinct Department From Employees

Select Top 10 * From Employees

Select Top 30 FName,LName,Salary from Employees
Order By Salary Desc

Select Id,LName,FName,Salary 
Into EmpSalaries
From Employees

--And,OR
Select * from Employees
Where (Department='sales'OR Department='supply') And Salary>=6000

--In
Select * from Employees
Where Department In('sales','supply','law') 

--Like
Select * From Employees
Where Id Like '%_2'

Select * From Employees
Where Id Like '[2,4]2'--22,42

Select * From Employees
Where Id Like '[^2-4]2'

--Not
SELECT * FROM Employees
WHERE Salary IS NULL

SELECT * FROM Employees
WHERE Salary IS NOT NULL

SELECT * FROM Employees
WHERE Salary IN(4000,5000,8000,Null)

SELECT * FROM Employees
WHERE Salary IN(4000,7000) Or Salary is Null

-----Case Expression
Select id,LName,FName,Salary, 
Case
	When Salary>=8000 Then 'chief'
	When Salary>=5000 Then 'manager'
	When Salary Is Null Then 'Unknown'
Else 'worker'
End As Position ,

Case
	When Salary>=8000 Then 'chief'
	When Salary>=5000 Then 'manager'
	When Salary Is Null Then 'Unknown'
End As Position2 
From Employees

---
SELECT Id, LName, Department, Salary,
CASE Department										--CASE 
	WHEN 'ADMINISTRATION & SUPPORT' THEN '100%'     --    WHEN Department = 'ADMINISTRATION & SUPPORT' THEN '100%'
	WHEN 'LAW' THEN '80%'							--    ...
	WHEN 'FINANCE & ACCOUNTING' THEN '70%'
	ELSE '10%'
END AS [Bonus%],

Salary/100*
CASE Department										--CASE 
	WHEN 'ADMINISTRATION & SUPPORT' THEN 100     --    WHEN Department = 'ADMINISTRATION & SUPPORT' THEN '100%'
	WHEN 'LAW' THEN 80							--    ...
	WHEN 'FINANCE & ACCOUNTING' THEN 70
	ELSE 10
END AS Bonus,

Salary/100*
CASE Department										--CASE 
	WHEN 'ADMINISTRATION & SUPPORT' THEN 100     --    WHEN Department = 'ADMINISTRATION & SUPPORT' THEN '100%'
	WHEN 'LAW' THEN 80							--    ...
	WHEN 'FINANCE & ACCOUNTING' THEN 70
	ELSE 10
END +Salary AS [Bonus+Salary]
From Employees

---If
SELECT Id, LName, Department, Salary,
IIF(Salary>=8000,'chief','manager') As Position
From Employees

ALTER TABLE Employees
ADD Gender bit

Update Employees
Set Gender=Iif(id>50,1,0)

-- GROUP BY
SELECT Department, Gender FROM Employees
GROUP BY Department, Gender

SELECT  Department, Gender FROM Employees
SELECT DISTINCT Department, Gender FROM Employees

--Having
SELECT Department FROM Employees
GROUP BY Department
	HAVING Department LIKE 'L%'