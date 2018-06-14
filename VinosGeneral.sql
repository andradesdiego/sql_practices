/*
	What:			Creación de tabla general de los vinos
	Why:			Lanzamiento proyecto Vinos y Denominaciones
	Who:			Diego Andrades
	Creation Date:	9-Feb-2018
	Comment:		
*/

USE VinosDenominaciones;
GO

-- Creamos tabla para info general de vinos.
CREATE TABLE VinosGeneral (
	id INT
	, [Nombre] VARCHAR(50)
	, [Cosecha] SMALLINT
	, [TipoEdadID] TINYINT
	, [TipoAzucarID] TINYINT
	, [ColorID] TINYINT
	, [Espumoso] BIT
	, [Varietal] BIT
	, [DenominID] SMALLINT 
);


SELECT*FROM VinosDenominaciones.dbo.VinosGeneral;
