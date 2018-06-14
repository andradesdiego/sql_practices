/*
	What:			VISTAS
	Why:			Consulta que se queda guardada en nuestra bbdd. 
	Who:			Diego Andrades
	Creation Date:	19-Mar-2018
	Comment:		 
*/

USE AdventureWorks2017;
GO

CREATE VIEW dbo.uvw_PuestosTrabajo
AS 
	-- Ejemplo de subconsulta como parte del resultado de una query
	-- Seleccionamos los nombres desde los nombres de los puestos de trabajo
	-- Relacionamos las tablas por la FOREIGN KEY 
	-- Creamos los alia e y p para las tablas
	-- Saca puesto de trabajo
	SELECT e.JobTitle AS PuestoTrabajo
		-- Saca la fecha de nacimiento
		, e.BirthDate AS FechaNacimiento
		-- Subconsulta el nombre desde la tabla Personas
		, (SELECT  FirstName
				-- Alias a la tabla personas
				FROM Person.Person AS p
				-- donde las columnas relacionadas sean iguales
				WHERE p.BusinessEntityID = e.BusinessEntityID) AS NombreCompleto
	-- Desde la tabla empleados, con alias e
	FROM HumanResources.Employee AS e;


-- Ejemplo de uso

SELECT * FROM dbo.uvw_PuestosTrabajo;

-- Otra Vista

CREATE VIEW dbo.uvw_EmpleadosDatosNoSensibles
AS 
	SELECT BusinessEntityID
		, LoginID
		, OrganizationNode
		, OrganizationLevel
		, JobTitle
		, HireDate
		, SalariedFlag
		, VacationHours
		, SickLeaveHours
		, CurrentFlag
		, rowguid
		, ModifiedDate
	FROM HumanResources.Employee AS Empleados

GO

select * from dbo.uvw_EmpleadosDatosNoSensibles;

-- Modificar Vistas

alter VIEW dbo.uvw_EmpleadosDatosNoSensibles
AS
	SELECT BusinessEntityID
			, LoginID
			, OrganizationNode
			, OrganizationLevel
			, JobTitle
			, HireDate
			, SalariedFlag
			, VacationHours
			, SickLeaveHours
			, CurrentFlag
			, rowguid
			, ModifiedDate
			, DATEDIFF(YEAR, HireDate, GETDATE()) AS Antiguedad

		FROM HumanResources.Employee;

GO

-- Ejemplo de uso:

SELECT JobTitle, AVG(Antiguedad) AS mediaAntiguedad
	FROM dbo.uvw_EmpleadosDatosNoSensibles
	GROUP BY JobTitle;
