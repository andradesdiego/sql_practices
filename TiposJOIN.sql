/*
	What:			Consultas JOIN
	Why:			Tipos de agrupaciones JOIN - Teoría de conjuntos
	Who:			Diego Andrades
	Creation Date:	5-Mar-2018
	Comment:		xxxxxxxxxxxxxxxxxxxxxxx. 
*/

USE AdventureWorks2017;
GO

SELECT COUNT(*)
	FROM Person.Person;
	-- 19972
SELECT COUNT(*)
	FROM HumanResources.Employee;
	-- 290

-----------------
-- TIPOS DE JOIN
-----------------
-- INNER JOIN (JOIN)
SELECT COUNT(*)
	FROM Person.Person AS p
		INNER JOIN HumanResources.Employee AS e
			ON p.BusinessEntityID = e.BusinessEntityID;
		-- 290
-- LEFT OUTER JOIN (LEFT JOIN)
SELECT COUNT(*)
	FROM Person.Person AS p
		LEFT OUTER JOIN HumanResources.Employee AS e
			ON p.BusinessEntityID = e.BusinessEntityID;
		-- 19972
-- RIGHT OUTER JOIN (RIGHT JOIN)
SELECT COUNT(*)
	FROM Person.Person AS p
		RIGHT OUTER JOIN HumanResources.Employee AS e
			ON p.BusinessEntityID = e.BusinessEntityID;
		-- 290
-- FULL OUTER JOIN (FULL JOIN)
SELECT COUNT(*)
	FROM Person.Person AS p
		FULL OUTER JOIN HumanResources.Employee AS e
			ON p.BusinessEntityID = e.BusinessEntityID;
		-- 19972
-- LEFT EXCLUDING JOIN ()
SELECT COUNT(*)
	FROM Person.Person AS p
		LEFT OUTER JOIN HumanResources.Employee AS e
			ON p.BusinessEntityID = e.BusinessEntityID
	WHERE e.BusinessEntityID IS NULL;
		-- 19682
-- RIGHT EXCLUDING JOIN ()
SELECT COUNT(*)
	FROM Person.Person AS p
		RIGHT OUTER JOIN HumanResources.Employee AS e
			ON p.BusinessEntityID = e.BusinessEntityID
	WHERE e.BusinessEntityID IS NULL;
		-- 0
-- FULL EXCLUDING JOIN ()
SELECT COUNT(*)
	FROM Person.Person AS p
		FULL OUTER JOIN HumanResources.Employee AS e
			ON p.BusinessEntityID = e.BusinessEntityID
	WHERE e.BusinessEntityID IS NULL
		OR e.BusinessEntityID IS NULL;
		-- 19682

