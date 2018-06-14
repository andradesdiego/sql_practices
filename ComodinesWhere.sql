/*
	What:			Where con caracteres especiales
	Why:			Filtrado de caracteres en un campo
	Who:			Diego Andrades
	Creation Date:	16-Feb-2018
	Comment:		
*/

USE master;
GO

-- B�squeda de cadenas de caracteres en una columna. 
-- El % es comod�n y sustituye por cualquier valor. 
SELECT *
	FROM sys.tables
	WHERE name LIKE 'spt%_d%';

-- El % es comod�n; Consultar prefijos. 
SELECT *
	FROM sys.tables
	WHERE name LIKE 'spt%';

-- El % es comod�n; Consultar sujifos. 
SELECT *
	FROM sys.tables
	WHERE name LIKE '%dev';

-- Consultar �ltimo car�cter "cualquiera" con "_". 
SELECT *
	FROM sys.tables
	WHERE name LIKE 'spt_';