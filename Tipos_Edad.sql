/*
	What:			Creación de tabla para vinos por edad
	Why:			Lanzamiento proyecto Vinos y Denominaciones
	Who:			Diego Andrades
	Creation Date:	9-Feb-2018
	Comment:		
*/

USE VinosDenominaciones;
GO

-- Creamos tabla para tipos de vinos.
CREATE TABLE Tipos_Edad (
	id TINYINT
	, [Tipo_Edad] VARCHAR(20)
);
-- Insertamos los registros de los tipos de vino predefinidos.
USE VinosDenominaciones;
GO

SELECT *FROM VinosDenominaciones.dbo.Tipos_Edad;