/*
	What:			Procedimientos Almacenados
	Why:			IF y ELSE
	Who:			Diego Andrades
	Creation Date:	12-Mar-2018
	Comment:		!IMPORTANT - Siempre usar BEGIN y END dentro del IF. 
*/

USE AdventureWorks2017;
GO

DECLARE @edad TINYINT;

SET @edad = 35;

IF @edad <= 30
BEGIN
	PRINT 'Joven';
END

IF (@edad <= 30 OR GETDATE() > '20180312') AND ((DATEPART(DAY, GETDATE()) > 10)) -- USAMOS PARÉNTESIS PARA CONDICIONES MÚLTIPLES
BEGIN
	PRINT 'Joven';
END

-- Con una sola operación en el bloque del IF no es necesario BEGIN ni END
IF @edad <= 30
	PRINT 'Joven';
ELSE
	PRINT 'Maduro';

-- OJO! Siempre usaremos BEGIN y END dentro del IF 
DECLARE @mensaje VARCHAR(50)
IF @edad <= 35
BEGIN
	SET @mensaje = 'Joven';
	PRINT @mensaje;
END

-- En cada bloque IF y ELSE se abre y cierra con BEGIN y END
IF (SELECT MIN (DATEDIFF(YEAR, BirthDate, GETDATE()))
				FROM HumanResources.Employee
				WHERE JobTitle = 'Design Engineer') <= @edad 
BEGIN
	SET @mensaje = 'Joven';
	PRINT @mensaje;
END
ELSE
BEGIN
	SET @mensaje = 'Joven Plus';
	PRINT @mensaje;
END
