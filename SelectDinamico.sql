/*
	What:			Consultas dinámicas
	Why:			Lanzamiento proyecto 
	Who:			Diego Andrades
	Creation Date:	xx-xxx-2018
	Comment:		xxxxxxxxxxxxxxxxxxxxxxx. 
*/

USE AdventureWorks2017;
GO

-- SELECT * FROM Person.Person WHERE FirstName = 'Ken';
DECLARE @sql VARCHAR(1000);
DECLARE @nombre VARCHAR(100);
DECLARE @commandSQL NVARCHAR(100);

SET @sql = 'SELECT * FROM Person.Person WHERE FirstName = ';
SET @nombre = '''Ken'''; -- las comillas tambien se envuelven en comillas ;(
SET @commandSQL = @sql + @nombre; -- concatenamos ambas variables
-- SET @commandSQL = CONCAT(@sql, @nombre);
PRINT @commandSQL;

EXECUTE sp_executesql @commandSQL; -- ejecutamos la variable

