/*
	What:			Creación de PRIMARY KEYS
	Why:			Tener una columna que permita la selección de un registro único.
	Who:			Diego Andrades
	Creation Date:	16-Feb-2018
	Comment:		. 
*/

USE VinosDenominaciones;
GO

-- Las columnas que sean PRIMARY no pueden tener tipo de dato NULL, 
-- por eso se cambia el tipo a NOT NULL
ALTER TABLE dbo.VinosGeneral
	ALTER COLUMN id INT NOT NULL;

-- Aquí establecemos la columna "id" como PRIMARY KEY de esta tabla.
ALTER TABLE dbo.VinosGeneral
	ADD CONSTRAINT PK_VinosGeneral_ID PRIMARY KEY(id);

-- Repetimos proceso con todas las tablas que contengan id's para ser referenciados por otras.
ALTER TABLE dbo.Color_Vino
	ALTER COLUMN id TINYINT NOT NULL;

ALTER TABLE dbo.Color_Vino
	ADD CONSTRAINT PK_Color_Vino_ID PRIMARY KEY(id);

ALTER TABLE dbo.Tipos_Azucar
	ALTER COLUMN id TINYINT NOT NULL;
	
ALTER TABLE dbo.Tipos_Azucar
	ADD CONSTRAINT PK_Tipos_Azucar_ID PRIMARY KEY(id);

ALTER TABLE dbo.Tipos_Edad
	ALTER COLUMN id TINYINT NOT NULL;
	
ALTER TABLE dbo.Tipos_Edad
	ADD CONSTRAINT PK_Tipos_Edad_ID PRIMARY KEY(id);

ALTER TABLE dbo.Denominaciones
	ALTER COLUMN id SMALLINT NOT NULL;
	
ALTER TABLE dbo.Denominaciones
	ADD CONSTRAINT PK_Denominaciones_ID PRIMARY KEY(id);

ALTER TABLE dbo.Paises
	ALTER COLUMN id SMALLINT NOT NULL;
	
ALTER TABLE dbo.Paises
	ADD CONSTRAINT PK_Paises_ID PRIMARY KEY(id);
 
 