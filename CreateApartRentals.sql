/*
	What:			Creación de bbdd y tablas Alquileres de Apartamentos
	Why:			Ejercicio 4
	Who:			Diego Andrades
	Creation Date:	28-Feb-2018
	Comment:		 
*/

--CREATE DATABASE ApartRentals;

USE ApartRentals;
GO

CREATE TABLE Clientes (
	ID INT
	, Nombre VARCHAR (50)
	, Apellido1 VARCHAR (50)
	, Apellido2 VARCHAR (50)
	, NacionID smallint 
	, TipoDocID tinyint 
	, NumDoc VARCHAR (20)
);

CREATE TABLE Nacionalidad (
	ID SMALLINT
	, NombrePais VARCHAR (20)
	, Nacionalidad VARCHAR (20)
);

CREATE TABLE TipoDocumentacion (
	ID TINYINT
	, TipoDocumento VARCHAR (20)
);

CREATE TABLE Apartamentos (
	ID INT
	, Ubicacion VARCHAR (200)
	, EstadoLimpieza BIT
);

CREATE TABLE Reservas (
	ID INT
	, ClienteID INT
	, ApartID INT
	, MotorID INT
);

CREATE TABLE Comisiones (
	ID INT
	, ReservaID INT
	, TipoID INT
	, Importe SMALLMONEY
	, EstadoID INT
);

CREATE TABLE TipoComision (
	ID SMALLINT
	, Nombre VARCHAR (50)
	, FuenteID TINYINT
	, Porcentaje TINYINT
);

CREATE TABLE EstadoComision (
	ID TINYINT
	, TipoEstado VARCHAR (20) 
);

CREATE TABLE Citas (
	ID INT
	, Fecha DATE
	, HoraInicio TIME
	, HoraFin TIME
	, Lugar VARCHAR (100)
	, ClienteID INT
	, ApartID INT
	, CheckInOut BIT
);

CREATE TABLE FuenteReserva (
	ID TINYINT
	,NombreFuente VARCHAR (20)
);

CREATE TABLE Facturas (
	ID INT
	, Fecha DATE
	, SerieNum VARCHAR (30)
	, ClienteID INT
	, ReservaID INT
	, ComisionID INT
	, ImpuestoID TINYINT
	, TotalFra SMALLMONEY
);

CREATE TABLE Impuestos (
	ID TINYINT
	, TipoImpuesto VARCHAR (20)
	, Porcentaje TINYINT
);