/*
	What:			Consultas varias
	Why:			Práctica de consultas con Where, Join y Order
	Who:			Diego Andrades
	Creation Date:	02-Mar-2018
	Comment:		. 
*/


USE AdventureWorks2017;
GO

-- 1. Listar todas las columnas y todas las filas de la tabla Product. Ordernar por nombre.
SELECT *
	FROM Production.Product
	ORDER BY [Name];

-- 2. Listar solo las columnas Name, ProductNumber y ListPrice (alias Price) de la tabla Product. Ordenar por nombre.
SELECT [Name], ProductNumber, ListPrice AS Price
	FROM Production.Product
	ORDER BY [Name];

-- 3. Listar las filas de Product que tienen un Product Line “R” y que tengan menos de 4 días de manufactura.
SELECT *
	FROM Production.Product
	WHERE ProductLine = 'R' AND DaysToManufacture < 4;

-- 4. Listar las ventas totales (OrderQty x UnitPrice) y los descuentos 
-- (OrderQty x UnitPrice x UnitPriceDiscount) de cada producto. Dar un alias a cada columna.  
SELECT pr.Name AS Nombre
	, (OrderQty * UnitPrice) AS VentasTotales
	, (OrderQty * UnitPrice * UnitPriceDiscount) AS DescuentosTotales
	FROM Sales.SalesOrderDetail AS sls
	INNER JOIN [Production].[Product] AS pr ON sls.ProductID = pr.ProductID ;
-- Eliminar los descuentos 0 y ordenar los resultados en base al descuento (ascendente).
SELECT pr.Name AS Nombre
	, (OrderQty * UnitPrice) AS VentasTotales
	, (OrderQty * UnitPrice * UnitPriceDiscount) AS DescuentosTotales
	FROM Sales.SalesOrderDetail AS sls
	INNER JOIN [Production].[Product] AS pr ON sls.ProductID = pr.ProductID 
	WHERE (OrderQty * UnitPrice * UnitPriceDiscount) > 0
	ORDER BY DescuentosTotales; -- (OrderQty * UnitPrice * UnitPriceDiscount)

-- 5. Listar los diferentes títulos de la tabla Employee. Ordernar por nombre del título.
SELECT * 
	FROM HumanResources.Employee
	ORDER BY JobTitle;

-- 6. Recuperar productos cuyo modelo comience por “Long-Sleeve Logo Jersey”, 
-- y cuyo ProductModelID se encuentre en las tablas Product y ProductModel.
SELECT *
	FROM Production.Product AS pr
	INNER JOIN Production.ProductModel AS prM ON pr.ProductModelID = prM.ProductModelID 
	WHERE pr.[Name] like 'Long-Sleeve Logo Jersey%';



	

