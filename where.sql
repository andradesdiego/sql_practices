/*
	What:			Ejemplos de consultas con WHERE
	Why:			Practicar la sentencia
	Who:			Diego Andrades
	Creation Date:	16-Feb-2018
	Comment:		 
*/

USE VinosDenominaciones;
GO

-- A.Buscar una fila utilizando una igualdad simple 
SELECT id, Nombre
	FROM dbo.VinosGeneral
	WHERE Nombre = 'Izadi';
GO

-- B.Buscar las filas que contienen un valor como una parte de una cadena
SELECT id, Nombre, Cosecha
	FROM dbo.VinosGeneral
	WHERE id LIKE (3);
GO

-- C.Buscar filas utilizando un operador de comparación
SELECT id, Nombre, Cosecha, TipoEdadID
	FROM dbo.VinosGeneral
	WHERE id <= 5;
GO

-- D.Buscar las filas que cumplen alguna de tres condiciones
SELECT id, Nombre, Cosecha
	FROM dbo.VinosGeneral
	WHERE id = 2
		OR Nombre = ('Izadi') 
		OR Cosecha = 2012;
GO

-- E.Buscar las filas que deben cumplir varias condiciones
SELECT id, Nombre, Cosecha, ColorID
	FROM dbo.VinosGeneral
	WHERE id LIKE (2)
		AND Nombre LIKE ('Castillo Peñalver')
		AND Cosecha = 2010;
GO

-- F.Buscar las filas que están en una lista de valores
SELECT id, Nombre, ColorID
	FROM dbo.VinosGeneral
	WHERE Nombre IN ('Muga', 'Izadi');
GO

-- G.Buscar las filas que tienen un valor comprendido entre dos valores
SELECT id, Nombre, Cosecha
	FROM dbo.VinosGeneral
	WHERE id BETWEEN 3 AND 6;
GO