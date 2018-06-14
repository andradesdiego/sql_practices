/*
	What:			Script de ejemplo de creación de tablas
	Why:			Para ver cómo crear tablas
	Who:			Diego Andrades
	Creation Date:	5-Feb-2018
*/
-- Compruebo si la tabla existe, si existe la borro y saco mensaje. Si no existe saco mensaje.
IF EXISTS(SELECT 1 FROM sys.tables WHERE [NAME] = 'MiPrimeraTabla')
BEGIN
	DROP TABLE MiPrimeraTabla;
	PRINT 'La tabla existia, por tanto la hemos borrado';
END
ELSE
BEGIN 
	PRINT 'No existe, no hace falta borrar';
END

CREATE TABLE MiPrimeraTabla (
	id INT
	, [name] VARCHAR(30)
	, createDate DATETIME2(2)
	, valor DECIMAL (19, 4) --123456789012345.1234
);
/*
DECLARE @miVariable VARCHAR(50)  COLLATE Cyrillic_General_CI_AS_KS = 'особый день для всех' ;
DECLARE @miVariableRusa NVARCHAR(50)  COLLATE Cyrillic_General_CI_AS_KS = 'особый день для всех';

SELECT @miVariable, @miVariableRusa;

SET @miVariable = 'Hola que ase?';
SET @miVariable = 'Spasiva belgrado con Vodka';
*/


