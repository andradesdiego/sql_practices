/*
	What:			Where con caracteres especiales
	Why:			Filtrado de caracteres en un campo
	Who:			Diego Andrades
	Creation Date:	16-Feb-2018
	Comment:		
*/

USE master;
GO

-- Búsqueda de cadenas de caracteres en una columna. 
-- El % es comodín y sustituye por cualquier valor. 
SELECT *
	FROM sys.tables
	WHERE name LIKE 'spt%_d%';

-- El % es comodín; Consultar prefijos. 
SELECT *
	FROM sys.tables
	WHERE name LIKE 'spt%';

-- El % es comodín; Consultar sujifos. 
SELECT *
	FROM sys.tables
	WHERE name LIKE '%dev';

-- Consultar último carácter "cualquiera" con "_". 
SELECT *
	FROM sys.tables
	WHERE name LIKE 'spt_';