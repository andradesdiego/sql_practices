/*
	What:			Creación de BBDD, Tablas, Constraints, Inserts y Consultas 
	Why:			PETS
	Who:			Diego Andrades
	Creation Date:	14-Mar-2018
	Comment:		 
*/

--CREATE DATABASE Pets;

USE Pets
GO

CREATE TABLE Perros
	(ID INT IDENTITY NOT NULL CONSTRAINT PK_Perros_ID PRIMARY KEY (ID)
	, Nombre VARCHAR(30) NULL 
	, FechaNac DATE NULL 
	, TallaID TINYINT NOT NULL
	, RazaID TINYINT NOT NULL
	, FechaAlta DATE NOT NULL
	, FechaBaja DATE NULL);

CREATE TABLE Vacunas
	(ID SMALLINT IDENTITY NOT NULL CONSTRAINT PK_Vacunas_ID PRIMARY KEY (ID)
	, Nombre VARCHAR(30) NULL
	, Stock SMALLINT NULL
	, ProveedorID SMALLINT NOT NULL);

CREATE TABLE PerrosVacunados
	(ID INT IDENTITY NOT NULL CONSTRAINT PK_PerrosVacunados_ID PRIMARY KEY (ID)
	, PerroID INT NOT NULL
	, VacunaID SMALLINT NOT NULL
	, Fecha DATE NOT NULL);

CREATE TABLE Voluntarios
	(ID SMALLINT IDENTITY NOT NULL CONSTRAINT PK_Voluntarios_ID PRIMARY KEY (ID)
	, Nombre VARCHAR (50)
	, FechaAlta DATE NOT NULL
	, FechaBaja DATE NULL);

CREATE TABLE Turnos
	(ID SMALLINT IDENTITY NOT NULL CONSTRAINT PK_Turnos_ID PRIMARY KEY (ID)
	, Fecha DATE NOT NULL
	, Turno VARCHAR(30) NULL
	, VoluntarioID SMALLINT NOT NULL);

CREATE TABLE Adoptantes
	(ID SMALLINT IDENTITY NOT NULL CONSTRAINT PK_Adoptantes_ID PRIMARY KEY (ID)
	, Nombre VARCHAR(50) NULL
	, NIF_NIE VARCHAR (9) NULL
	, Email VARCHAR (30) NULL);

CREATE TABLE Proveedores
	(ID SMALLINT IDENTITY NOT NULL CONSTRAINT PK_Proveedores_ID PRIMARY KEY (ID)
	, Nombre VARCHAR(50) NULL);

CREATE TABLE Tallas
	(ID TINYINT IDENTITY NOT NULL CONSTRAINT PK_Tallas_ID PRIMARY KEY (ID)
	, Talla VARCHAR (20) NULL);

CREATE TABLE Razas
	(ID TINYINT IDENTITY NOT NULL CONSTRAINT PK_Razas_ID PRIMARY KEY (ID)
	, Raza VARCHAR (30) NULL);

CREATE TABLE Adopciones
	(ID INT IDENTITY NOT NULL CONSTRAINT PK_Adopciones_ID PRIMARY KEY (ID)
	, PerroID INT NOT NULL
	, AdoptanteID SMALLINT NOT NULL
	, Fecha DATE NOT NULL);

--FOREIGN KEYS
--------------
ALTER TABLE Perros
	ADD CONSTRAINT FK_Perros_Tallas_TallaID FOREIGN KEY (TallaID)
	REFERENCES Tallas (ID);

ALTER TABLE Perros
	ADD CONSTRAINT FK_Perros_Razas_RazaID FOREIGN KEY (RazaID)
	REFERENCES Razas (ID);

ALTER TABLE Vacunas
	ADD CONSTRAINT FK_Vacunas_Proveedores_ProveedorID FOREIGN KEY (ProveedorID)
	REFERENCES Proveedores (ID);

ALTER TABLE PerrosVacunados
	ADD CONSTRAINT FK_PerrosVacunados_Perros_PerroID FOREIGN KEY (PerroID)
	REFERENCES Perros (ID);

ALTER TABLE PerrosVacunados
	ADD CONSTRAINT FK_PerrosVacunados_Vacuna_VacunaID FOREIGN KEY (VacunaID)
	REFERENCES Vacunas (ID);

ALTER TABLE Turnos
	ADD CONSTRAINT FK_Turnos_Voluntarios_VoluntarioID FOREIGN KEY (VoluntarioID)
	REFERENCES Voluntarios (ID);

ALTER TABLE Adopciones 
	ADD CONSTRAINT FK_Adopciones_Perros_PerroID FOREIGN KEY (PerroID)
	REFERENCES Perros (ID);

ALTER TABLE Adopciones
	ADD CONSTRAINT FK_Adopciones_Adoptantes_AdoptanteID FOREIGN KEY (AdoptanteID)
	REFERENCES Adoptantes (ID);

-- SOME INSERTS...
------------------
INSERT INTO Perros (Nombre, TallaID, RazaID, FechaAlta, FechaBaja)
	VALUES 
	('Txiqui', 1, 3, '21071221', null)
	,('Joe', 2, 4, '21060830', null)
	,('Akira', 1, 2, '20170624', '20171223')
	,('Amorosa', 2, 1, '20161125', null)
	,('Blanquita', 3, 4, '20160721', '20170514');

INSERT INTO Vacunas (Nombre, Stock, ProveedorID)
	VALUES
	('Moquillo', 12, 1)
	,('Rabia', 24, 2)
	,('Adenovirus', 6, 3)
	,('Hepatitis', 18, 2)
	,('Leptospirosis',3, 1);

INSERT INTO Adoptantes (Nombre, NIF_NIE, Email)
	VALUES
	('José Huertas', '45565678F', 'huertas@gmail.com')
	,('Antonia Heredia', '76345466Y', 'herean@hotmail.com')
	,('Felipe Neri', '98452743O', 'elchuli@alsalirdeclase.com')
	,('Hussain Almuñecar', 'X3453567T', 'ojala@mohammedali.ma')

INSERT INTO Voluntarios (Nombre, FechaAlta, FechaBaja)
	VALUES
	('Antonio Gutiérrez', '20171031', null)
	,('Pepe Castro', '20160321', null)
	,('Luis Sarabia', '20170129', '20170418')
	,('José Estévez', '20180121', null);

INSERT INTO Proveedores (Nombre)
	VALUES
	('LabCan')
	,('Astroperro')
	,('SaludAnimal')

INSERT INTO PerrosVacunados (PerroID, VacunaID, Fecha)
	VALUES
	(1,2, '20170115')
	,(1,4, '20160419')
	,(2,3, '20151203')
	,(4,1, '20170327')
	,(4,2, '20161111')
	,(4,3, '20170130')
	,(5,2, '20170421')
	,(5,3, '20161004');

INSERT INTO Turnos (Fecha, Turno, VoluntarioID)
	VALUES 
	('20180120', 'Mañana', 2)
	,('20180121', 'Tarde', 3)
	,('20180122', 'Mañana', 1)
	,('20180123', 'Tarde', 4);

INSERT INTO Adopciones (PerroID, AdoptanteID, Fecha)
	VALUES
	(1, 3, '20170523')
	,(3, 1, '20171223')
	,(5, 2, '20170514');

INSERT INTO Tallas (Talla)
	VALUES
	('Toy')
	,('Pequeño')
	,('Mediano')
	,('Grande');

INSERT INTO Razas (Raza)
	VALUES
	('Caniche')
	,('Labrador')
	,('Jack Russell')
	,('Bodeguero Andaluz');

--CONSULTAS---
--------------
--Consulta que indica el número de adopciones cada mes
SELECT  
	COUNT(Adopciones.Fecha) AS AdopcionesRealizadas
	, MONTH(Adopciones.Fecha) AS Mes
	FROM Adopciones
	GROUP BY MONTH(Adopciones.Fecha);

--Consulta para mostrar las adopciones realizadas por los adoptantes
SELECT 
	Adoptantes.Nombre AS Adoptante
	, Perros.Nombre AS PerroAdoptado
	, Adopciones.Fecha AS FechaAdopcion
	FROM Adopciones
	INNER JOIN Adoptantes ON Adopciones.AdoptanteID = Adoptantes.ID
	INNER JOIN Perros ON Perros.ID = Adopciones.PerroID;
	
		

