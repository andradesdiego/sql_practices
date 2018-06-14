/*
	What:			Creación de tablas
	Why:			Lanzamiento proyecto 
	Who:			Diego Andrades
	Creation Date:	09-Feb-2018
	Comment:		 
*/

USE VinosDenominaciones;
GO

UPDATE dbo.Paises
	SET Pais = 'Argentina'
	WHERE Pais = 'Chile';

	SELECT*FROM VinosDenominaciones.dbo.Paises;