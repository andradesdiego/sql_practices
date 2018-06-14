/*
	What:			Relacionando tablas con JOIN
	Why:			Mostrar tabla relacionada por id's
	Who:			Diego Andrades
	Creation Date:	26-Feb-2018
	Comment:		 
*/

USE VinosDenominaciones
GO
-- Selecciona el nombre desde VinosGeneral
SELECT v.Nombre
	-- Selecciona la cosecha desde VinosGeneral
	, v.Cosecha
	-- Selecciona el color de Color_Vino
	, co.Color
	-- Selecciona el tipo de azucar desde Tipos_Azucar
	, az.Tipo_Azucar
	-- Selecciona la edad desde Tipos_Edad
	, ed.Tipo_Edad
	-- Selecciona el nombre del pais desde Denominaciones
	, de.Nombre
	-- Selecciona el nombre del pais desde Paises
	, pa.Pais
	-- Desde VinosGeneral, alias v
	FROM dbo.VinosGeneral AS v
		-- Relacionando ID en Color_Vino con el id en VinosGeneral 
		JOIN dbo.Color_Vino AS co ON v.ColorID = co.id  
		-- Relacionando ID en Tipos_Azucar con el id en VinosGeneral
		JOIN dbo.Tipos_Azucar AS az ON v.TipoAzucarID = az.id
		-- Relacionando ID en Tipos_Edad con el id en VinosGeneral
		JOIN dbo.Tipos_Edad AS ed ON v.TipoEdadID = ed.id
		-- Relacionando id en Denominaciones con el id en VinosGeneral 
		JOIN dbo.Denominaciones AS de ON v.DenominID = de.id
		-- Relacionando id en Denominaciones con el id en Países 
		JOIN dbo.Paises AS pa ON de.PaisID = pa.id;
		
