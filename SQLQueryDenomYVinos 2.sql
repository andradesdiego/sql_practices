/*
	What:			Creación de tablas y valores predefinidos
	Why:			Lanzamiento proyecto Vinos y Denominaciones
	Who:			Diego Andrades
	Creation Date:	7-Feb-2018
	Comment:		Por normalización creamos 3 tablas no solicitadas
					por el cliente. 
*/

-- Creamos tabla para denominaciones.
CREATE TABLE Denominaciones (
	id INT
	, [denom_nombre] VARCHAR(50)
	, [denom_desc] VARCHAR(1000)
	, [denom_creac]  DATE
	, [denom_proteg] BIT
	, [denom_pais] VARCHAR
);
-- Creamos tabla para info general de vinos.
CREATE TABLE VinosGeneral (
	id INT
	, [nombre] VARCHAR(50)
	, [cosecha] SMALLINT
	, [tipo_id] INT
	, [azucar_id] INT
	, [color_id] INT
	, [espumoso] BIT
	, [varietal] BIT
	, [denom_id] INT 
);
-- Creamos tabla para tipos de vinos.
CREATE TABLE TiposDeVino (
	id INT
	, [tipo_vino] VARCHAR(50)
);
-- Insertamos los registros de los tipos de vino predefinidos.
USE vinos_y_denom;
GO
INSERT INTO dbo.TiposDeVino
VALUES ('1' , 'joven'), ('2' , 'crianza'), ('3' , 'reserva'), ('4' , 'gran reserva');
GO
-- Creamos tabla para cantidades de azúcar en los vinos.
CREATE TABLE CantidadDeAzucar (
	id INT
	, [azucar] VARCHAR(50)
);
-- Insertamos los registros de las variaciones según azúcar predefinidas.
USE vinos_y_denom;
GO
INSERT INTO dbo.CantidadDeAzucar
VALUES ('1' , 'seco'), ('2' , 'semiseco'), ('3' , 'semidulce'), ('4' , 'dulce');
GO
-- Creamos tabla para colores de vinos.
CREATE TABLE ColorDeVino (
	id INT
	, [color] VARCHAR(50)
);
-- Insertamos los registros de los colores de los vinos predefinidos.
USE vinos_y_denom;
GO
INSERT INTO dbo.ColorDeVino
VALUES ('1' , 'tinto'), ('2' , 'blanco'), ('3' , 'rosado');
GO