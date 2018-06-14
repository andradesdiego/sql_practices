/*
	What:			Creación de tabla para Países
	Why:			Lanzamiento proyecto Vinos y Denominaciones
	Who:			Diego Andrades
	Creation Date:	9-Feb-2018
	Comment:		
*/

USE VinosDenominaciones;
GO

-- Creamos tabla para los paises. (Tabla Maestra)
CREATE TABLE Paises (
	id INT
	, [Pais] VARCHAR(100)
);
-- Insertamos los registros de los países más representativos.
USE VinosDenominaciones;
GO
INSERT INTO dbo.Paises ([id],[Pais])
VALUES (1 , 'España'), (2 , 'Francia'), (3 , 'Italia'), (4 , 'Estados Unidos'), (5 , 'Chile');
GO
-- Modificamos la tabla Pais añadiendo la columna UE de tipo boolean
ALTER TABLE dbo.Paises
	ADD [UE] BIT;