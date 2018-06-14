/*
	What:			Creación de tabla para las D.O.
	Why:			Lanzamiento proyecto Vinos y Denominaciones
	Who:			Diego Andrades
	Creation Date:	09-Feb-2018
	Comment:		 
*/

USE VinosDenominaciones;
GO

-- Creamos tabla para denominaciones.
CREATE TABLE Denominaciones (
	id SMALLINT
	, [Nombre] VARCHAR(50) NOT NULL
	, [Descripcion] VARCHAR(1000)
	, [F_creacion]  DATE NULL
	, [D_protegida] BIT
	, [PaisID] SMALLINT
);