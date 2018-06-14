/*
	What:			Creación de tablas, columnas, datos y consultas
	Why:			BBDD: Dietas Clínicas
	Who:			Diego Andrades
	Creation Date:	7-Mar-2018
	Comment:		 
*/

/*
CREATE DATABASE DietasClinicas;
*/

USE DietasClinicas;
GO

-- Tablas y columnas
--------------------
/*
CREATE TABLE Pacientes (
	idPaciente BIGINT IDENTITY NOT NULL
	, Nombre VARCHAR(50) NOT NULL
	, Apellido1 VARCHAR(50) NOT NULL
	, Apellido2 VARCHAR(50) NOT NULL
	, NIFNIE VARCHAR(9) NOT NULL
	, FechaNacimiento DATE NOT NULL
	);
ALTER TABLE dbo.Pacientes
	ADD CONSTRAINT PK_Pacientes_ID PRIMARY KEY(idPaciente);
*/

CREATE TABLE Comidas (
	ID SMALLINT IDENTITY NOT NULL
	, Nombre VARCHAR(50) NOT NULL
	, Descripcion VARCHAR(300) NULL
	);

CREATE TABLE Alergenos (
	ID SMALLINT IDENTITY NOT NULL
	, Nombre VARCHAR(50)
	, Descripcion VARCHAR(200)
	, TipoAlergenoID SMALLINT NOT NULL
	);

CREATE TABLE TiposAlergenos (
	ID SMALLINT NOT NULL
	, Nombre VARCHAR(50)
	);

CREATE TABLE AlergenosComida (
	ID SMALLINT NOT NULL
	, ComidaID SMALLINT
	, AlergenosID SMALLINT NOT NULL
	);

CREATE TABLE AlergiasPacientes (
	ID SMALLINT NOT NULL
	, PacienteID BIGINT NOT NULL
	, TipoAlergenoID SMALLINT NOT NULL
	);

-- Primary Keys
---------------
ALTER TABLE dbo.Comidas
	ADD CONSTRAINT PK_Comidas_ID PRIMARY KEY(ID);
ALTER TABLE dbo.Alergenos
	ADD CONSTRAINT PK_Alergenos_ID PRIMARY KEY(ID);
ALTER TABLE dbo.TiposAlergenos
	ADD CONSTRAINT PK_TiposAlergenos_ID PRIMARY KEY(ID);
ALTER TABLE dbo.AlergenosComida
	ADD CONSTRAINT PK_AlergenosComida_ID PRIMARY KEY(ID);
ALTER TABLE dbo.AlergiasPacientes
	ADD CONSTRAINT PK_AlergiasPacientes_ID PRIMARY KEY(ID);

-- Foreign Keys
---------------
ALTER TABLE dbo.AlergenosComida
	ADD CONSTRAINT FK_AlergenosComida_Comidas_ID FOREIGN KEY (ComidaID)
	REFERENCES dbo.Comidas(ID);
ALTER TABLE dbo.AlergenosComida
	ADD CONSTRAINT FK_AlergenosComida_Alergenos_ID FOREIGN KEY (AlergenosID)
	REFERENCES dbo.Alergenos(ID);
ALTER TABLE dbo.AlergiasPacientes
	ADD CONSTRAINT FK_AlergiasPacientes_Paciente_ID FOREIGN KEY (PacienteID)
	REFERENCES dbo.Pacientes(idPaciente);
ALTER TABLE dbo.AlergiasPacientes
	ADD CONSTRAINT FK_AlergiasPacientes_TiposAlergenos_ID FOREIGN KEY (TipoAlergenoID)
	REFERENCES dbo.TiposAlergenos(ID);

-- Unique Constraints
---------------------
ALTER TABLE dbo.Pacientes
	ADD CONSTRAINT UC_Pacientes_NIFNIE UNIQUE (NIFNIE);
ALTER TABLE dbo.Comidas
	ADD CONSTRAINT UC_ComidasNombre_Nombre UNIQUE (Nombre);
ALTER TABLE dbo.Alergenos
	ADD CONSTRAINT UC_AlergenosNombre_Nombre UNIQUE (Nombre);
ALTER TABLE dbo.TiposAlergenos
	ADD CONSTRAINT UC_TipoAlergenosNombre_Nombre UNIQUE (Nombre);

-- Insertar datos
-----------------
INSERT INTO dbo.Comidas (Nombre, Descripcion)
	VALUES	('Cazuela de marisco', 'Cazuela con almejas, vino blanco, aceite,...'),
			('Atún encebollado', 'Atún con ajo, cebolla, pimienta negra, almendras,...');

INSERT INTO dbo.Alergenos (Nombre, Descripcion, TipoAlergenoID)
	VALUES	('Nuez', 'Alergia a la nuez', 1),
			('Almendra', 'Alergia a la almendra y similares', 1),
			('Mejillón', 'Alergia a los mejillones y otros alimentos similares con concha', 2);

INSERT INTO dbo.TiposAlergenos (ID, Nombre)
	VALUES	(1,'Frutos Secos'),
			(2, 'Moluscos'),
			(3, 'Mostaza'),
			(4, 'Pescado');

INSERT INTO dbo.AlergenosComida (ID, ComidaID, AlergenosID)
	VALUES	(1, 2, 3),
			(2, 2, 1),
			(3, 1, 2);

INSERT INTO dbo.AlergiasPacientes (ID, PacienteID, TipoAlergenoID)
	VALUES	(1, 1, 4),
			(2, 2, 1);

-- Insert data into dbo.Pacientes.
INSERT INTO Pacientes (Nombre, Apellido1, Apellido2, NIFNIE, FechaNacimiento)
    VALUES ('Juan Manuel', 'Perez','Rodriguez', '98567463h', '19780803')
            , ('Victor', 'Amor','Calatrava', '74934357g', '19850107')
            , ('Rosario', 'Gomez','Charques', '23578622l', '19820501')
            , ('Carlos', 'Garcia','Ramirez', '47898725t', '19800905')
            , ('Virginia', 'Rivas','Souza', '81235532f', '19790304')
            , ('Isabel', 'Rojas','de Haro', '69878799t', '19680818')
            , ('Nora', 'Silva','Reverte', '77676789b', '19881113')
            ;


-- Consulta para mostrar las comidas compatibles con los pacientes.
SELECT 
	(p.Nombre + ' ' + p.Apellido1) AS Paciente
	, t.Nombre AS TipoAlergeno
	FROM Pacientes AS p
	INNER JOIN AlergiasPacientes AS ap ON p.idPaciente = ap.PacienteID
	--FROM AlergiasPacientes AS ap
	--INNER JOIN Pacientes AS p ON ap.PacienteID = p.idPaciente 
	INNER JOIN TiposAlergenos AS t ON t.ID = ap.TipoAlergenoID
	INNER JOIN Alergenos AS a ON t.ID = a.TipoAlergenoID
	INNER JOIN AlergenosComida AS ac ON ac.AlergenosID = a.ID
	INNER JOIN Comidas AS c ON c.ID = ac.ComidaID
	WHERE ap.PacienteID != p.idPaciente 
	;

