/*
	What:			Procedimientos almacenados
	Why:			Declaraci�n y asignaci�n de variables
	Who:			Diego Andrades
	Creation Date:	12-Mar-2018
	Comment:		. 
*/

USE AdventureWorks2017;
GO

DECLARE @nombre VARCHAR(50);

-- Asignar un valor DIRECTAMENTE
SET @nombre = 'Linda';

-- Asignaci�n opci�n 2 CONSULTA
SELECT @nombre = 'Linda';

SELECT TOP(1) @nombre = FirstName
	FROM Person.Person
	ORDER BY ModifiedDate DESC;
PRINT @nombre;

-- Asignaci�n opci�n 3 SET + SUBCONSULTA
SET @nombre = (SELECT TOP(1) FirstName
	FROM Person.Person
	ORDER BY ModifiedDate ASC);
PRINT @nombre;


