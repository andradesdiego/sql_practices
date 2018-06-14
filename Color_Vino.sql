/*
	What:			Creación de tabla para colores de vino e inserción de registros
	Why:			Lanzamiento proyecto Vinos y Denominaciones
	Who:			Diego Andrades
	Creation Date:	9-Feb-2018
	Comment:		 
*/

USE VinosDenominaciones;
GO

-- Creamos tabla para colores de vinos.
CREATE TABLE Color_Vino (
	id TINYINT
	, [Color] VARCHAR(20)
);
-- Insertamos los registros de los colores de los vinos predefinidos.
USE VinosDenominaciones;
GO
INSERT INTO dbo.Color_Vino ([id],[Color])
VALUES (1 , 'tinto'), (2 , 'blanco'), (3 , 'rosado');
GO

SELECT*FROM VinosDenominaciones.dbo.Color_Vino;