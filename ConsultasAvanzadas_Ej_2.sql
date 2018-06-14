/*
	What:			Ejercicio de consultas avanzadas 
	Why:			Bloque 2
	Who:			Diego Andrades
	Creation Date:	8-Mar-2018
	Comment:		. 
*/

USE AdventureWorks2017;
GO
SELECT * 
	FROM HumanResources.EmployeeDepartmentHistory;
--SELECT COUNT(*) 
	--FROM HumanResources.EmployeeDepartmentHistory;

SELECT *
	FROM HumanResources.EmployeeDepartmentHistory
	WHERE EndDate IS null;
--SELECT COUNT(*)
	--FROM HumanResources.EmployeeDepartmentHistory
	--WHERE EndDate IS null;

SELECT COUNT(*)
	FROM HumanResources.EmployeeDepartmentHistory AS h
	INNER JOIN HumanResources.Department AS d
	ON d.Name = 'Engineering'
	WHERE EndDate IS null;

SELECT 
	p.FirstName + ' ' + p.LastName AS NombreCompleto
	, h.StartDate AS Fecha_Inicio
	FROM HumanResources.EmployeeDepartmentHistory AS h
	INNER JOIN HumanResources.Department AS d
	ON d.DepartmentID = h.DepartmentID
	INNER JOIN Person.Person AS p
	ON p.BusinessEntityID = h.BusinessEntityID
	WHERE h.EndDate IS null AND d.Name = 'Engineering';
	
SELECT 
	p.FirstName + ' ' + p.LastName AS NombreCompleto
	, h.StartDate AS Fecha_Inicio
	FROM HumanResources.EmployeeDepartmentHistory AS h
	INNER JOIN HumanResources.Department AS d
	ON d.DepartmentID = h.DepartmentID
	INNER JOIN Person.Person AS p
	ON p.BusinessEntityID = h.BusinessEntityID
	WHERE h.EndDate IS null AND (d.Name = 'Engineering' OR d.Name = 'Marketing');

-- 6) Las asignaciones actuales para el departamento 'Engineering' y 'Marketing'
-- , mostrar nombre completo del Empleado, fecha de inicio y el nombre de su Departamento
-- Ordernar por nombre del Dept y de Empleado
-- Filas resultado: 15

SELECT 
	p.FirstName + ' ' + p.LastName AS NombreCompleto
	, h.StartDate AS Fecha_Inicio
	, d.Name AS Departamento
	FROM HumanResources.EmployeeDepartmentHistory AS h
	INNER JOIN HumanResources.Department AS d
	ON d.DepartmentID = h.DepartmentID
	INNER JOIN Person.Person AS p
	ON p.BusinessEntityID = h.BusinessEntityID
	WHERE h.EndDate IS null AND (d.Name = 'Engineering' OR d.Name = 'Marketing')
	ORDER BY Departamento, p.FirstName;

-- 7) Mostrar los nombres de los 3 departamentos con mayor número de empleados
-- Fila resultado: 3

SELECT TOP(3) 
	d.Name AS Departamento
	, COUNT(*) AS NumEmpleados
	FROM HumanResources.EmployeeDepartmentHistory AS h
	INNER JOIN HumanResources.Department AS d ON h.DepartmentID = d.DepartmentID
	WHERE h.EndDate IS null
	GROUP BY d.Name
	ORDER BY NumEmpleados DESC;
