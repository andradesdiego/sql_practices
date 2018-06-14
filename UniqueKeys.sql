/*
	What:			Creaci�n de UNIQUE columns
	Why:			Referenciar columnas "candidatas" 
	Who:			Diego Andrades
	Creation Date:	16-Feb-2018
	Comment:		
*/

USE VinosDenominaciones;
GO
-- Creamos una restricci�n de tipo UNIQUE que afecta a varias columnas de la tabla dbo.VinosGeneral
-- Con esto pretendemos que estas columnas consigan identificar un�vocamente a un vino.
ALTER TABLE dbo.VinosGeneral
	ADD CONSTRAINT UC_VinosGeneral UNIQUE (Nombre, Cosecha, TipoEdadID);

