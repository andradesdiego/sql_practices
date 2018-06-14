/*
	What:			Ejercicio Consultas Avanzadas
	Why:			Bloque 3
	Who:			Diego Andrades
	Creation Date:	12-Mar-2018
	Comment:		 
*/

USE AdventureWorks2017;
GO

-- 1) Mostrar un listado completo de la tabla clientes
-- Tablas consultadas: Sales.Customer
-- Filas resultado: 19820
SELECT * 
	FROM Sales.Customer;
--SELECT COUNT(1) 
	--FROM Sales.Customer;

-- 2) Mostrar un listado de todos los clientes (Sales.Customer) que son Tiendas (StoreID tiene algún valor)
-- Tablas consultadas: Sales.Customer
-- Filas resultado: 1336
SELECT *
	FROM Sales.Customer
	WHERE StoreID IS NOT NULL;
--SELECT COUNT(*)
	--FROM Sales.Customer
	--WHERE StoreID IS NOT NULL;

-- 3) Mostrar un listado de todos los clientes (Sales.Customer) que son Personas (PersonID tiene algún valor)
-- Tablas consultadas: Sales.Customer
-- Filas resultado: 19119
SELECT *
	FROM Sales.Customer
	WHERE PersonID IS NOT NULL;
--SELECT COUNT(*)
	--FROM Sales.Customer
	--WHERE PersonID IS NOT NULL;

-- 4) Mostrar un listado de todos los clientes que son Personas y Tiendas
-- Tablas consultadas: Sales.Customer
-- Filas resultado: 635
SELECT *
	FROM Sales.Customer
	WHERE PersonID IS NOT NULL AND StoreID IS NOT NULL
--SELECT COUNT(*)
	--FROM Sales.Customer
	--WHERE PersonID IS NOT NULL AND StoreID IS NOT NULL

-- 5) Mostrar todas las tiendas
-- Tablas consultadas: Sales.Store
-- Filas resultado: 701
SELECT * 
	FROM Sales.Store
--SELECT COUNT(*) 
	--FROM Sales.Store

-- 6) Mostrar todas las tiendas distintas en la tabla de clientes
-- Tablas consultadas: Sales.Customer
-- Filas resultado: 701
SELECT DISTINCT StoreID
	FROM Sales.Customer
	WHERE StoreID IS NOT NULL;


-- 7) Mostrar los clientes que son tiendas, sacando..
-- ..el nombre de la tienda (crear alias), el AccountNumber y el TerritoryID. 
-- Ordenar resultados por nombre
-- Tablas consultadas: Sales.Customer, Sales.Store
-- Filas resultado: 1336
SELECT 
	s.Name AS Nombre
	, c.AccountNumber AS Cuenta
	, c.TerritoryID  AS Region
	FROM Sales.Customer AS c
	INNER JOIN Sales.Store AS s
	ON c.StoreID = s.BusinessEntityID
	WHERE c.StoreID IS NOT NULL
	ORDER BY s.Name;

-- 8) Igual a la anterior, pero sacando el nombre del territorio (poner alias) en lugar del TerritoryID
-- Tablas consultadas: Sales.Customer, Sales.Store, Sales.SalesTerritory
-- Filas resultado: 1336
SELECT 
	s.Name AS Nombre
	, c.AccountNumber AS Cuenta
	, t.Name AS Region
	FROM Sales.Customer AS c
	INNER JOIN Sales.Store AS s
	ON c.StoreID = s.BusinessEntityID
	INNER JOIN Sales.SalesTerritory AS t
	ON c.TerritoryID = t.TerritoryID
	WHERE c.StoreID IS NOT NULL
	ORDER BY s.Name;

-- 9) Igual a la anterior, pero sacando el nombre del vendedor también
-- Tablas consultadas: Sales.Customer, Sales.Store, Sales.SalesTerritory, Person.Person
-- Mirando FKs podemos ver: Sales.Store (SalesPersonID) > Sales.SalesPerson (BusinessEntityID) > ..
-- .. > HumanResources.Employee (BusinessEntityID) > Person.Person (BusinessEntityID)...
-- Podemos simplificar y relacionar directamente Sales.Store (SalesPersonID) con Person.Person (BusinessEntityID)
-- Ordernar por Nombre del vendedor y nombre de tienda
-- Filas resultado: 1336
SELECT 
	p.FirstName + ' ' + p.LastName AS Vendedor
	, s.Name AS Tienda
	, c.AccountNumber AS Cuenta
	, t.Name AS Region
	FROM Sales.Customer AS c
	INNER JOIN Sales.Store AS s
	ON c.StoreID = s.BusinessEntityID
	INNER JOIN Sales.SalesTerritory AS t
	ON c.TerritoryID = t.TerritoryID
	INNER JOIN Person.Person as p
	ON p.BusinessEntityID = s.SalesPersonID
	WHERE c.StoreID IS NOT NULL
	ORDER BY p.FirstName + ' ' + p.LastName, s.Name;

-- 10) Sacar el nombre del vendedor, nombre del territorio y el numero de tiendas donde trabaja
-- Ordernar por nombre del vendedor y nombre del territorio
-- Tablas consultadas: Sales.Customer, Sales.Store, Sales.SalesTerritory, Person.Person
-- Nota: La tupla StoreID, TerritoryID se repite varias veces en la tabla Sales.Customer, 1 vez por cada AccountNumber..
-- ..Hará falta quitar esos duplicados de la consulta
-- Filas resultado: 20

SELECT DISTINCT
	 p.FirstName + ' ' + p.LastName AS Vendedor
	 , t.Name AS Region
	 , COUNT(t.TerritoryID) AS TotalTiendas
	FROM Sales.Customer AS c
	INNER JOIN Sales.Store AS s 
	ON c.StoreID = s.BusinessEntityID
	INNER JOIN Sales.SalesTerritory AS t 
	ON t.TerritoryID = c.TerritoryID
	INNER JOIN Person.Person AS p 
	ON p.BusinessEntityID = s.SalesPersonID
	GROUP BY  p.FirstName + ' ' + p.LastName, t.Name
	ORDER BY TotalTiendas;

-- 11) Sobre la consulta 10
-- Sacar los vendedores con 20 tiendas o mas (>=)

SELECT  p.FirstName + ' ' + p.LastName AS Vendedor
		, COUNT (t.TerritoryID) AS TotalTiendas
		, t.Name AS Territorio
		FROM Sales.Customer AS c
		INNER JOIN Sales.Store AS s ON c.StoreID = s.BusinessEntityID
		INNER JOIN Sales.SalesTerritory AS t ON c.TerritoryID = t.TerritoryID
		INNER JOIN  Person.Person AS p ON s.SalesPersonID = p.BusinessEntityID
		GROUP BY p.FirstName + ' ' + p.LastName, t.Name
		HAVING COUNT (t.TerritoryID) > 20	
		ORDER BY TotalTiendas ASC;	
	
-- 12) Sobre la consulta 10
-- Sacar los 5 vendedores con mas tiendas

SELECT TOP (5) p.FirstName + ' ' + p.LastName AS Vendedor
		, COUNT (t.TerritoryID) AS TotalTiendas
		, t.Name AS Territorio
		FROM Sales.Customer AS c
		INNER JOIN Sales.Store AS s ON c.StoreID = s.BusinessEntityID
		INNER JOIN Sales.SalesTerritory AS t ON c.TerritoryID = t.TerritoryID
		INNER JOIN  Person.Person AS p ON s.SalesPersonID = p.BusinessEntityID
		GROUP BY p.[FirstName] + ' ' + p.LastName, t.Name
		HAVING COUNT (t.TerritoryID) > 20	
		ORDER BY TotalTiendas DESC;	