/*
	What:			Creaci�n de tabla para tipos de vino por cantidad de az�car
	Why:			Lanzamiento proyecto Vinos y Denominaciones
	Who:			Diego Andrades
	Creation Date:	9-Feb-2018
	Comment:		
*/

USE VinosDenominaciones;
GO

-- Creamos tabla para cantidades de az�car en los vinos.
CREATE TABLE Tipos_Azucar (
	id TINYINT
	, [Tipo_Azucar] VARCHAR(20)
);
-- Insertamos los registros de las variaciones seg�n az�car predefinidas.
USE VinosDenominaciones;
GO
INSERT INTO dbo.Tipos_Azucar ([id],[Tipo_Azucar])
VALUES (1 , 'seco'), (2 , 'semiseco'), (3 , 'semidulce'), (4 , 'dulce');
GO

SELECT *FROM VinosDenominaciones.dbo.Tipos_Azucar;
