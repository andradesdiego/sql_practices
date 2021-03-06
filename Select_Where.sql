/****** Script for SelectTopNRows command from SSMS  ******/


-- DISTINCT, COUNT(), GROUP BY, AS
-- Aggregate Functions, AVG(), COUNT(), MAX(), MIN(), SUM()

SELECT TOP (1000) [BusinessEntityID]
      ,[NationalIDNumber]
      ,[LoginID]
      ,[OrganizationNode]
      ,[OrganizationLevel]
      ,[JobTitle]
      ,[BirthDate]
      ,[MaritalStatus]
      ,[Gender]
      ,[HireDate]
      ,[SalariedFlag]
      ,[VacationHours]
      ,[SickLeaveHours]
      ,[CurrentFlag]
      ,[rowguid]
      ,[ModifiedDate]
  FROM [HumanResources].[Employee]

SELECT DISTINCT [JobTitle]
	FROM [HumanResources].[Employee];

SELECT COUNT(1)
	FROM [HumanResources].[Employee]
	WHERE Gender = 'F';

SELECT DISTINCT [JobTitle]
	FROM [HumanResources].[Employee];

SELECT Gender, COUNT(1)
	FROM [HumanResources].[Employee]
	GROUP BY Gender;

SELECT MaritalStatus, COUNT(1)
	FROM [HumanResources].[Employee]
	GROUP BY MaritalStatus;

SELECT JobTitle, COUNT(1)
	FROM [HumanResources].[Employee]
	GROUP BY JobTitle;

SELECT COUNT(1)
	FROM [HumanResources].[Employee]
	WHERE Gender = 'F' AND MaritalStatus = 'S';

SELECT COUNT(*)
	FROM [HumanResources].Employee
	WHERE Gender = 'F' 
		AND (MaritalStatus = 'S' 
		OR BirthDate > '19760101');

SELECT COUNT(*)
	FROM HumanResources.Employee
	WHERE Gender = 'F' 
		AND MaritalStatus = 'S' 
		AND (BirthDate > '19761226' AND BirthDate < '19771231');

SELECT FirstName, MaritalStatus 
	FROM [Person].[Person], [HumanResources].[Employee] 
	WHERE [HumanResources].[Employee].Gender = 'F' 
		AND [HumanResources].[Employee].MaritalStatus = 'S' 
		AND ([HumanResources].[Employee].BirthDate > '19761226' AND [HumanResources].[Employee].BirthDate < '19771231');
	-- GROUP BY [Person].[Person].FirstName;

SELECT Gender, COUNT(*), MIN(BirthDate), MAX(BirthDate)
	FROM HumanResources.Employee
	WHERE BirthDate > '19710101' 
	GROUP BY Gender;

SELECT Gender, SUM(SickLeaveHours), AVG(SickLeaveHours)
	FROM HumanResources.Employee
	GROUP BY Gender;

SELECT Gender AS Genero, SUM(SickLeaveHours) AS TotalHorasBajaEnfermedad, AVG(SickLeaveHours) AS MediaBajaEnfermedadPorGenero
	FROM HumanResources.Employee AS EmpleadosRecursosHumanos
	GROUP BY Gender;

SELECT Gender, COUNT(*), MIN(BirthDate), MAX(BirthDate)
	FROM HumanResources.Employee
	WHERE BirthDate > '19710101' 
	GROUP BY Gender
	HAVING COUNT(*) > 170;

--1.- media, total, min, max de VacationHours por [JobTitle]
--2.- solo hombre
--3.- donde la media sea mayor o igual a 25


SELECT [JobTitle]
	, COUNT(*) AS NumEmpleados
	, MIN([VacationHours]) AS MinVacHours
	, MAX([VacationHours]) AS MaxVacHours
	, AVG([VacationHOurs]) AS AverageHours
	FROM HumanResources.Employee
	GROUP BY JobTitle;

SELECT [JobTitle]
	, COUNT(*) AS NumEmpleados
	, MIN([VacationHours]) AS MinVacHours
	, MAX([VacationHours]) AS MaxVacHours
	, AVG([VacationHOurs]) AS AverageHours
	FROM HumanResources.Employee
	WHERE Gender = 'M' 
	GROUP BY JobTitle;

SELECT [JobTitle]
	, COUNT(*) AS NumEmpleados
	, MIN([VacationHours]) AS MinVacHours
	, MAX([VacationHours]) AS MaxVacHours
	, AVG([VacationHOurs]) AS AverageHours
	FROM HumanResources.Employee
	GROUP BY JobTitle
	HAVING AVG([VacationHours]) >= 25;
