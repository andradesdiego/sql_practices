/*
	What:			Creación de FOREIGN KEYS 
	Why:			Establecer relaciones entre tablas
	Who:			Diego Andrades
	Creation Date:	16-Feb-2018
	Comment:		
*/

USE VinosDenominaciones;
GO

-- Las tablas maestras de la bbdd contienen columnas que son referenciadas por otras tablas.
-- Suelen ser de tipo numérico y coincidir con las PRIMARYS de otras tablas.
-- La columnas que son PRIMARY en una tabla, suelen ser FOREIGN en otra.
-- Las FOREIGN sirve para mantener integridad entre los datos de distintas tablas.

-- dbo.VinosGeneral tiene 4 referencias a otras tablas ("dependencia lógica").
ALTER TABLE dbo.VinosGeneral
	ADD CONSTRAINT FK_VinosGeneral_TipoEdadID FOREIGN KEY(TipoEdadID)
	REFERENCES dbo.Tipos_Edad (id);

ALTER TABLE dbo.VinosGeneral
	ADD CONSTRAINT FK_VinosGeneral_TipoAzucarID FOREIGN KEY (TipoAzucarID)
	REFERENCES dbo.Tipos_Azucar (id);

ALTER TABLE dbo.VinosGeneral
	ADD CONSTRAINT FK_VinosGeneral_ColorVino FOREIGN KEY (ColorID)
	REFERENCES dbo.Color_Vino (id);

ALTER TABLE dbo.VinosGeneral
	ADD CONSTRAINT FK_VinosGeneral_DenominID FOREIGN KEY (DenominID)
	REFERENCES dbo.Denominaciones (id);

-- dbo.Denominaciones tiene 1 "dependencia lógica" a la tabla dbo.Paises
ALTER TABLE dbo.Denominaciones
	ADD CONSTRAINT FK_Denominaciones_PaisID FOREIGN KEY (PaisID)
	REFERENCES dbo.Paises (id);

	
	 