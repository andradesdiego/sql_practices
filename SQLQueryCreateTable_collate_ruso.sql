CREATE DATABASE DBruso;

USE master;
GO

ALTER DATABASE DBruso
	COLLATE CYRILLIC_GENERAL_CI_AS;


DECLARE @miVariable VARCHAR(50) = 'особый день для всех' ;
DECLARE @miVariableRusa NVARCHAR(50) = 'особый день для всех';

SELECT @miVariable, @miVariableRusa;

/*
SET @miVariable = 'Hola que ase?';
SET @miVariable = 'Spasiva belgrado con Vodka';
*/

