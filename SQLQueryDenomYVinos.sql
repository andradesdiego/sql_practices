/*
	What:			Creación de tablas y valores predefinidos
	Why:			Lanzamiento proyecto Vinos y Denominaciones
	Who:			Diego Andrades
	Creation Date:	7-Feb-2018
	Comment:		Por normalización creamos 4 tablas no solicitadas
					por el cliente. 
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
-- Creamos tabla para tipos de vinos.
CREATE TABLE Tipos_Edad (
	id TINYINT
	, [Tipo_Edad] VARCHAR(20)
);
-- Insertamos los registros de los tipos de vino predefinidos.
USE VinosDenominaciones;
GO
INSERT INTO dbo.Tipos_Edad ([id],[Tipo_Edad])
VALUES (1 , 'joven'), (2 , 'crianza'), (3 , 'reserva'), (4 , 'gran reserva');
GO
-- Creamos tabla para cantidades de azúcar en los vinos.
CREATE TABLE Tipos_Azucar (
	id TINYINT
	, [Tipo_Azucar] VARCHAR(20)
);
-- Insertamos los registros de las variaciones según azúcar predefinidas.
USE VinosDenominaciones;
GO
INSERT INTO dbo.Tipos_Azucar ([id],[Tipo_Azucar])
VALUES (1 , 'seco'), (2 , 'semiseco'), (3 , 'semidulce'), (4 , 'dulce');
GO
-- Creamos tabla para colores de vinos.
CREATE TABLE Color_Vino (
	id TINYINT
	, [Color] VARCHAR(20)
);
-- Insertamos los registros de los colores de los vinos predefinidos.
USE VinosDenominaciones;
GO
INSERT INTO dbo.Color_Vino ([id],[Color])
VALUES (1 , 'tinto'), (2 , 'blanco'), (3 , 'rosado');
GO