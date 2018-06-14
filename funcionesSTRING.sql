/*
	What:			Funciones STRING SQL
	Why:			Práctica de funciones con texto
	Who:			Diego Andrades
	Creation Date:	19-Mar-2018
	Comment:		https://docs.microsoft.com/en-us/sql/t-sql/functions/string-functions-transact-sql 
*/

USE AdventureWorks2017;
GO

SELECT FirstName, 
	LEN(FirstName) AS LongCadena
	, RIGHT (FirstName, 2) AS DEREC2 -- Selecciona caracteres por derecha
	, LEFT (FirstName, 3) AS IZQ3 -- Selecciona caracteres por izquierda
	, TRIM (FirstName) AS sinEspacios -- Quita espacios en blanco. También LTRIM y RTRIM (espacios por izqda y/o derecha)
-- LOWER Y UPPER
	, UPPER (FirstName) as UPPERCASE
	, LOWER (FirstName) as LowerCase
-- CONCAT
	, FirstName + ' ' + ISNULL(MiddleName, '') + ' ' + LastName AS oldConcat
-- CAST Transforma un tipo integer a uno varchar
	, (FirstName + ' ' + ISNULL(MiddleName, '') + ' ' + LastName + CAST(BusinessEntityID AS VARCHAR)) AS oldConcat
-- Esta es la opción más usada para concatenar
	, CONCAT (FirstName, ' ', MiddleName, ' ', LastName, ' ', BusinessEntityID) AS PerfectConcat
	FROM Person.Person
	WHERE LEN(FirstName) != 9; -- se puede usar el operador <> (significa distinto de)

-- Funciones escalares son aquellas que devuelven un único registro.
-- Ejemplos de manejo de cadenas con fx escalares.

-- Función Lógica
DECLARE @var INT = 10
	 , @result VARCHAR (20);

IF  @var < 12
BEGIN 
	SET @result = 'Buenos días';
END
ELSE
BEGIN
	SET @result = 'Buenas tardes';
END
PRINT @result;

-- Usando IIF
DECLARE @var2 INT = 10
	 , @result2 VARCHAR (20);

SET @result2 =  IIF(@var2 < 12, 'Buenos días', 'Buenas tardes');
PRINT @result2;

--DATE FUNCTIONS
-- Datepart

SELECT DATEPART(MONTH, ModifiedDate) AS Mes
	, SUM(OrderQty * UnitPrice) AS TotalVentasBruto
	, ROUND(SUM(OrderQty * UnitPrice), 0) AS TotalVentasRound
	, CAST(SUM(OrderQty * UnitPrice) AS INT) AS TotalVentasINT
	, AVG(DATEDIFF(DAY, ModifiedDate, GETDATE())) AS DiferenciaDias -- ModifiedDate es fecha de la transacción
	, AVG(DATEDIFF(YEAR, ModifiedDate, GETDATE())) AS DiferenciaAnos
	FROM Sales.SalesOrderDetail
	GROUP BY DATEPART(MONTH, ModifiedDate)
	ORDER BY TotalVentasRound DESC;

