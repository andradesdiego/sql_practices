/*
	What:			Creación de consultas avanzadas
	Why:			Práctica de consultas avanzadas con TOP, ORDER BY, WHEN - ELSE,
	Who:			Diego Andrades
	Creation Date:	26-Feb-2018
	Comment:		. 
*/

USE AdventureWorks2017;
GO
-- Consulta de Ventas por territorio
SELECT TerritoryID, SUM(SalesQuota) AS TotalQuota
	FROM [Sales].[SalesPerson]
	-- Agrupado por territorio
	GROUP BY TerritoryID
	-- Ordenado descendientemente
	ORDER BY TotalQuota DESC;

-- Consulta RANKING (5 primeros) de Ventas por territorio
-- Es conveniente usar el TOP en consultas ordenadas, para no llegar a resultados DETERMINISTAS. 
SELECT TOP(5) TerritoryID, SUM(SalesQuota) AS TotalQuota
	FROM [Sales].[SalesPerson]
	-- Agrupado por territorio
	GROUP BY TerritoryID
	-- Ordenado descendientemente
	ORDER BY TotalQuota DESC;

-- Selecciona los registros cuando TerritoryID sea NUll y me devuelves 1000
SELECT CASE WHEN TerritoryID IS NULL THEN 1000
			-- Y de los que tengan ID 10 me lo cambias por 5000 
			WHEN TerritoryID = 10 THEN 5000
			-- Si no hay más, me devuelves el resto
			ELSE TerritoryID
		-- Finalizamos el CASE WHEN con nombre de columna
		END AS TerritoryID
		-- Las sumas de ventas como TotalQuota donde NULL me lo pones a 0
		, ISNULL (SUM(SalesQuota), 0) AS TotalQuota
	-- De la tabla de ventas por persona
	FROM [Sales].[SalesPerson]
	-- Agupadas por territorioID
	GROUP BY TerritoryID;

-- Selecciona los registros cuando TerritoryID sea NUll y me devuelves 'Desconocido'
SELECT CASE WHEN TerritoryID IS NULL THEN 'Desconocido'
			-- Y de los que tengan ID 10 me lo cambias por 'Andalucia'
			WHEN TerritoryID = 10 THEN 'Andalucia'
			-- Si no hay más, me devuelves el resto como 'Otras regiones'
			ELSE 'Otras regiones'
		-- Finalizamos el CASE WHEN con nombre de columna
		END AS TerritoryID
		-- Las sumas de ventas como TotalQuota donde NULL me lo pones a 0
		, ISNULL (SUM(SalesQuota), 0) AS TotalQuota
	-- De la tabla de ventas por persona
	FROM [Sales].[SalesPerson]
	-- Agupadas por territorioID
	GROUP BY TerritoryID;

SELECT AVG(SalesQuota) AS TotalQuota
		, AVG(SalesQuota) AS AvgQuota	
	FROM Sales.SalesPerson;

-- CONSULTAS ANIDADAS - SUBCONSULTAS ------
-- Consulta estática - No recomendable
SELECT *	
	FROM Sales.SalesPerson
	WHERE TerritoryID IN(7,8,10); -- Inclusión hardcodeada
	
-- Consulta dinámica
SELECT *	
	FROM Sales.SalesPerson
	WHERE TerritoryID IN(SELECT TerritoryID
							FROM [Sales].[SalesTerritory]
							WHERE [Group] = 'Europe');

-- Podemos consultar la tabla seleccionandola con el ratón y pulsando ALT + F1
-- Seleccionamos desde todos los empleados,
-- Alias a la tabla con 'e'
SELECT *
	FROM HumanResources.Employee AS e
	-- Que incluyan los registros de la tabla BusinessEntityID
	WHERE e.BusinessEntityID IN(SELECT BusinessEntityID
			-- De la tabla Person.Person
			FROM Person.Person
			-- Donde el primer nombre =
			WHERE FirstName = 'Michael'
			-- Y el segundo =
			AND LastName = 'Raheem');

-- Ejemplo de subconsulta como parte del resultado de una query
-- Seleccionamos los nombres desde los nombres de los puestos de trabajo
-- Relacionamos las tablas por la FOREIGN KEY 
-- Creamos los alia e y p para las tablas
	-- Saca puesto de trabajo
SELECT e.JobTitle
		-- Saca la fecha de nacimiento
		, e.BirthDate
		-- Subconsulta el nombre desde la tabla Personas
		, (SELECT  FirstName
				-- Alias a la tabla personas
				FROM Person.Person AS p
				-- donde las columnas relacionadas sean iguales
				WHERE p.BusinessEntityID = e.BusinessEntityID)
	-- Desde la tabla empleados, con alias e
	FROM HumanResources.Employee AS e;

-- Consultar la fecha de modificación mas reciente del puesto de trabajo
SELECT e.JobTitle
		, (SELECT  MAX(ModifiedDate)
				FROM Person.Person AS p
				WHERE p.BusinessEntityID = e.BusinessEntityID)
	FROM HumanResources.Employee AS e;

------------------------------------------------------
-- JOIN ------JOIN--------JOIN------------------------
------------------------------------------------------
-- Sirven para hacer consultas con varias tablas
SELECT e.JobTitle
		, e.BirthDate
		, p.FirstName
		, p.LastName
	FROM HumanResources.Employee AS e
		JOIN Person.Person AS p ON e.BusinessEntityID = p.BusinessEntityID;



USE VinosDenominaciones
GO
-- Selecciona el nombre desde VinosGeneral
SELECT v.Nombre
	-- Selecciona la cosecha desde VinosGeneral
	, v.Cosecha
	-- Selecciona el color de Color_Vino
	, co.Color
	-- Selecciona el tipo de azucar desde Tipos_Azucar
	, az.Tipo_Azucar
	-- Selecciona la edad desde Tipos_Edad
	, ed.Tipo_Edad
	-- Selecciona el nombre del pais desde Denominaciones
	, pa.Nombre
	-- Desde VinosGeneral, alias v
	FROM dbo.VinosGeneral AS v
		-- Relacionando ID en Color_Vino con el id en VinosGeneral 
		JOIN dbo.Color_Vino AS co ON v.ColorID = co.id  
		-- Relacionando ID en Tipos_Azucar con el id en VinosGeneral
		JOIN dbo.Tipos_Azucar AS az ON v.TipoAzucarID = az.id
		-- Relacionando ID en Tipos_Edad con el id en VinosGeneral
		JOIN dbo.Tipos_Edad AS ed ON v.TipoEdadID = ed.id
		-- Relacionando id en Denominaciones con el id en VinosGeneral 
		JOIN dbo.Denominaciones AS pa ON v.DenominID = pa.id;