/*
	What:			CREATE FUNCTION
	Why:			Creación de Funciones propias 
	Who:			Diego Andrades
	Creation Date:	xx-xxx-2018
	Comment:		https://docs.microsoft.com/en-us/sql/t-sql/statements/create-function-transact-sql
*/

USE AdventureWorks2017;
GO
-- Fx escalar que devuelve un valor cambiado de una palabra recibida
CREATE FUNCTION dbo.ufn_Replace
(
	@string1 VARCHAR(8000)
) RETURNS VARCHAR(50) -- Las funciones escalares siempre deben tener RETURNS...
AS 
BEGIN
	DECLARE @result VARCHAR(MAX);
	SET @result = REPLACE(@string1, 'a', 'z'); -- Podemos concatenar distintos REPLACE así REPLACE(REPLACE(@string1, 'a', 'z'), 'e', 'y')
	RETURN @result; -- Las fx escalares siempre deben devovler un resultado con RETURN
END
GO

SELECT dbo.ufn_Replace('Hola') AS result;

---------------------
-- Funciones que devuelven un conjunto de resultados como si fuesen una consulta
---------------------

CREATE FUNCTION dbo.ufn_ListaTop10
(
	@filtroFecha DATETIME2
) RETURNS TABLE -- Las funciones escalares siempre deben tener RETURNS...
AS 
	RETURN  (SELECT TOP(10) p.BusinessEntityID 
					,CONCAT(p.FirstName, ' ', p.LastName) AS NombreCompleto 
				FROM Person.Person AS p
					INNER JOIN HumanResources.Employee AS e 
						ON p.BusinessEntityID = e.BusinessEntityID
				WHERE e.BirthDate > @filtroFecha
				ORDER BY BirthDate DESC);
GO

SELECT *
	FROM dbo.ufn_ListaTop10('1981-11-26');