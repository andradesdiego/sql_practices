/*
	What:			Creación de UNIQUE columns
	Why:			Referenciar columnas "candidatas" 
	Who:			Diego Andrades
	Creation Date:	16-Feb-2018
	Comment:		
*/

USE VinosDenominaciones;
GO
-- Creamos una restricción de tipo UNIQUE que afecta a varias columnas de la tabla dbo.VinosGeneral
-- Con esto pretendemos que estas columnas consigan identificar unívocamente a un vino.
ALTER TABLE dbo.VinosGeneral
	ADD CONSTRAINT UC_VinosGeneral UNIQUE (Nombre, Cosecha, TipoEdadID);

ALTER TABLE dbo.Paises
	ADD CONSTRAINT UC_Paises UNIQUE (Pais);

ALTER TABLE dbo.Denominaciones 
	ADD CONSTRAINT UC_Denominaciones UNIQUE (Nombre);

ALTER TABLE dbo.Color_Vino
	ADD CONSTRAINT UC_Color_Vino UNIQUE (Color);

ALTER TABLE dbo.Tipos_Azucar
	ADD CONSTRAINT UC_Tipos_Azucar UNIQUE (Tipo_Azucar);

ALTER TABLE dbo.Tipos_Edad
	ADD CONSTRAINT UC_Tipos_Edad UNIQUE (Tipo_Edad);


