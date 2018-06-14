/*
	What:			Consultas con JOIN
	Why:			Tipos de JOIN en ejemplo básico
	Who:			Diego Andrades
	Creation Date:	05-Mar-2018
	Comment:		
*/

USE AdventureWorks2017;
GO

CREATE TABLE Spanish (id INT PRIMARY KEY);
CREATE TABLE French (id INT PRIMARY KEY);

INSERT INTO Spanish
	VALUES (1), (2), (3), (4), (5);

INSERT INTO French
	VALUES (4), (6), (7), (8), (9), (10);

SELECT *
	FROM dbo.Spanish;

SELECT COUNT(*)
	FROM dbo.Spanish AS s
	INNER JOIN dbo.French as f 
		ON s.id = f.id;
		-- 1

SELECT COUNT(*)
	FROM dbo.Spanish AS s
	LEFT JOIN dbo.French as f
		ON s.id = f.id;
		-- 5

SELECT COUNT(*)
	FROM dbo.Spanish AS s
	RIGHT JOIN dbo.French AS f
		ON s.id = f.id;
		-- 6

SELECT COUNT(*)
	FROM dbo.Spanish AS s
	FULL OUTER JOIN dbo.French AS f
		ON s.id = f.id;
		-- 10

SELECT COUNT(*)
	FROM dbo.Spanish AS s
	LEFT OUTER JOIN dbo.French AS f
		ON s.id = f.id;
		-- 5

SELECT COUNT(*)
	FROM dbo.Spanish AS s
	RIGHT OUTER JOIN dbo.French AS f
		ON s.id = f.id;
		-- 6

SELECT COUNT(*)
	FROM dbo.Spanish AS s
	FULL OUTER JOIN dbo.French AS f
		ON s.id = f.id;
		-- 10

-- INTERSECT
	-- Es equivalente a INNER JOIN
SELECT id
	FROM dbo.Spanish
INTERSECT 
SELECT id
	dbo.French;

