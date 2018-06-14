USE VinosDenominaciones;

--Selecciona el último valor de la columna id de la tabla Paises
SELECT MAX(id) FROM dbo.Paises;

--Modifica la tabla paises; elimina la columna "id"
ALTER TABLE dbo.Paises
	DROP COLUMN id;

--Modifica la tabla paises; crea una columna "id" autoincremental. 
--Sólo puede haber una columna autoincremental en una tabla
ALTER TABLE dbo.Paises
	ADD id INT IDENTITY(1,1);

--Inserta en la tabla paises, en la comumna pais, los siguientes valores
INSERT INTO dbo.Paises(Pais)
	VALUES 
	('Alemania')
	,('Suiza')
	,('Polonia')
	,('Reino Unido')
	,('Croacia')
	,('Holanda')
	,('Suecia');

--Añadimos una registro en la tabla Paises explicitando un valor en la columna "id"
INSERT INTO dbo.Paises(id, Pais)
	VALUES (13, 'Sudafrica');
-- Error!! Cannot insert explicit value for identity column in table 'Paises' when IDENTITY_INSERT is set to OFF.
-- Insertamos sin tener en cuenta la columna id, ya que es autoincremental y se asigna por defecto el siguiente (13)
INSERT INTO dbo.Paises(Pais)
	VALUES ('Sudafrica');

--Selecciona (muestra por consola) de la bbdd VinosDenominaciones, la tabla Paises.
SELECT * FROM VinosDenominaciones.dbo.Paises;

--Modificamos los valores de la columna UE con los reales
UPDATE dbo.Paises
	SET UE = 1
	WHERE id IN (1,2,3,6,7,8,10,11,12);

UPDATE dbo.Paises
	SET UE = 0
	WHERE id IN (4,5,9,13);

SELECT * FROM VinosDenominaciones.dbo.Paises
	WHERE Pais = 'Alemania';

--Modificamos varios valores de una tabla
UPDATE dbo.Paises
	SET Pais = 'Chile', UE = 0
	WHERE id = 10;

--Actualizamos valores para Francia y Sudáfrica
--Primero los mostramos por consola para verificar que solo afecta a los correctos
SELECT * 
	FROM dbo.Paises
		WHERE Pais = 'Francia' OR Pais = 'Sudafrica';
		 
UPDATE dbo.Paises
	SET UE = NULL
	WHERE Pais = 'Francia' OR Pais = 'Sudafrica';

--Creamos duplicados de los registros para, a continuación, eliminarlos
INSERT INTO dbo.Paises(Pais, UE)
	VALUES ('Italia', 1)
		, ('Suiza', 1)
		, ('Chile', 0);

--Me los cargo...
DELETE FROM dbo.Paises
	WHERE id IN (14, 15, 16);

--Los vuelvo a crear...
INSERT INTO dbo.Paises(Pais, UE)
	VALUES ('Italia', 1)
		, ('Suiza', 1)
		, ('Chile', 0);

--Me los cargo con más condiciones en el SELECT
SELECT *
	FROM dbo.Paises 
	WHERE Pais = 'Italia'
		AND id = 17
		AND UE = 1;

DELETE FROM dbo.Paises 
	WHERE Pais = 'Italia'
		AND id = 17
		AND UE = 1;

SELECT *
	FROM dbo.Paises 
	WHERE Pais IN ('Suiza', 'Chile')
		AND id IN (18, 19)
		AND UE IN  (1, 0);

DELETE FROM dbo.Paises 
	WHERE Pais IN ('Suiza', 'Chile')
		AND id IN (18, 19)
		AND UE IN  (1, 0);

--Comprobamos la tabla
SELECT * FROM VinosDenominaciones.dbo.Paises

--Para seleccionar con NULL no podemos usar el =, hay que usar el IS
SELECT *
	FROM dbo.Paises
	WHERE UE = NULL; --Esto no devuelve nada

SELECT *
	FROM dbo.Paises
	WHERE UE IS NULL; --Esto devuelve los registros con ese valor en la columna
 



