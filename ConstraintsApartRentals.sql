/*
	What:			Creación de CONSTRAINTS en Alquileres de Apartamentos
	Why:			Ejercicio 4
	Who:			Diego Andrades
	Creation Date:	28-Feb-2018
	Comment:		
*/

USE ApartRentals;
GO

---------------------------
-- PRIMARY KEY CONSTRAINTS
---------------------------

-- Aquí establecemos la columna "id" como PRIMARY KEY de esta tabla.
ALTER TABLE dbo.Clientes
	ALTER COLUMN ID INT NOT NULL;
ALTER TABLE dbo.Clientes
	ADD CONSTRAINT PK_Clientes_ID PRIMARY KEY(ID);

-- Aquí establecemos la columna "id" como PRIMARY KEY de esta tabla.
ALTER TABLE dbo.Apartamentos
	ALTER COLUMN ID INT NOT NULL;
ALTER TABLE dbo.Apartamentos
	ADD CONSTRAINT PK_Apartamentos_ID PRIMARY KEY(ID);

-- Aquí establecemos la columna "id" como PRIMARY KEY de esta tabla.
ALTER TABLE dbo.Reservas
	ALTER COLUMN ID INT NOT NULL;
ALTER TABLE dbo.Reservas
	ADD CONSTRAINT PK_Reservas_ID PRIMARY KEY(ID);

-- Aquí establecemos la columna "id" como PRIMARY KEY de esta tabla.
ALTER TABLE dbo.Comisiones
	ALTER COLUMN TipoID SMALLINT NOT NULL;
ALTER TABLE dbo.Comisiones
	ADD CONSTRAINT PK_Comisiones_ID PRIMARY KEY(ID);

-- Aquí establecemos la columna "id" como PRIMARY KEY de esta tabla.
ALTER TABLE dbo.TipoComision
	ALTER COLUMN ID SMALLINT NOT NULL;
ALTER TABLE dbo.TipoComision
	ADD CONSTRAINT PK_TipoComision_ID PRIMARY KEY(ID);

-- Aquí establecemos la columna "id" como PRIMARY KEY de esta tabla.
ALTER TABLE dbo.Citas
	ALTER COLUMN ID INT NOT NULL;
ALTER TABLE dbo.Citas
	ADD CONSTRAINT PK_Citas_ID PRIMARY KEY(ID);

-- Aquí establecemos la columna "id" como PRIMARY KEY de esta tabla.
ALTER TABLE dbo.EstadoComision
	ALTER COLUMN ID TINYINT NOT NULL;
ALTER TABLE dbo.EstadoComision
	ADD CONSTRAINT PK_EstadoComision_ID PRIMARY KEY(ID);

-- Aquí establecemos la columna "id" como PRIMARY KEY de esta tabla.
ALTER TABLE dbo.FuenteReserva
	ALTER COLUMN ID TINYINT NOT NULL;
ALTER TABLE dbo.FuenteReserva
	ADD CONSTRAINT PK_FuenteReserva_ID PRIMARY KEY(ID);

-- Aquí establecemos la columna "id" como PRIMARY KEY de esta tabla.
ALTER TABLE dbo.Facturas
	ALTER COLUMN ID INT NOT NULL;
ALTER TABLE dbo.Facturas
	ADD CONSTRAINT PK_Facturas_ID PRIMARY KEY(ID);

-- Aquí establecemos la columna "id" como PRIMARY KEY de esta tabla.
ALTER TABLE dbo.Nacionalidad
	ALTER COLUMN ID SMALLINT NOT NULL;
ALTER TABLE dbo.Nacionalidad
	ADD CONSTRAINT PK_Nacionalidad_ID PRIMARY KEY(ID);

-- Aquí establecemos la columna "id" como PRIMARY KEY de esta tabla.
ALTER TABLE dbo.TipoDocumentacion
	ALTER COLUMN ID TINYINT NOT NULL;
ALTER TABLE dbo.TipoDocumentacion
	ADD CONSTRAINT PK_TipoDocumentacion_ID PRIMARY KEY(ID);

-- Aquí establecemos la columna "id" como PRIMARY KEY de esta tabla.
ALTER TABLE dbo.Impuestos
	ALTER COLUMN ID TINYINT NOT NULL;
ALTER TABLE dbo.Impuestos
	ADD CONSTRAINT PK_Impuestos_ID PRIMARY KEY(ID);

---------------------------
-- FOREIGN KEY CONSTRAINTS
---------------------------

-- dbo.Clientes tiene 2 referencias a otras tablas ("dependencia lógica").
ALTER TABLE dbo.Clientes
	ADD CONSTRAINT FK_Clientes_NacionalidadID FOREIGN KEY(NacionID)
	REFERENCES dbo.Nacionalidad (ID);
ALTER TABLE dbo.Clientes
	ADD CONSTRAINT FK_Clientes_TipoDocumentacion FOREIGN KEY(TipoDocID)
	REFERENCES dbo.TipoDocumentacion (ID);

-- dbo.Reservas tiene 3 referencias a otras tablas ("dependencia lógica").
ALTER TABLE dbo.Reservas
	ADD CONSTRAINT FK_Reservas_ClienteID FOREIGN KEY(ClienteID)
	REFERENCES dbo.Clientes (ID);
ALTER TABLE dbo.Reservas
	ADD CONSTRAINT FK_Reservas_ApartID FOREIGN KEY(ApartID)
	REFERENCES dbo.Apartamentos (ID);
ALTER TABLE dbo.Reservas
	ADD CONSTRAINT FK_Reservas_FuenteReservaID FOREIGN KEY(FuenteReservaID)
	REFERENCES dbo.FuenteReserva (ID);

-- dbo.Comisiones tiene 3 referencias a otras tablas ("dependencia lógica").
ALTER TABLE dbo.Comisiones
	ADD CONSTRAINT FK_Comisiones_ReservaID FOREIGN KEY(ReservaID)
	REFERENCES dbo.Reservas (ID);
ALTER TABLE dbo.Comisiones
	ADD CONSTRAINT FK_Comisiones_TipoID FOREIGN KEY(TipoID)
	REFERENCES dbo.TipoComision (ID);
ALTER TABLE dbo.Comisiones
	ADD CONSTRAINT FK_Comisiones_EstadoComisionID FOREIGN KEY(EstadoID)
	REFERENCES dbo.EstadoComision (ID);

-- dbo.TipoComision tiene 1 referencia a otra tabla ("dependencia lógica").
ALTER TABLE dbo.TipoComision
	ADD CONSTRAINT FK_TipoComision_FuenteReservaID FOREIGN KEY(FuenteID)
	REFERENCES dbo.FuenteReserva (ID);

-- dbo.Citas tiene 2 referencias a otras tablas ("dependencia lógica").
ALTER TABLE dbo.Citas
	ADD CONSTRAINT FK_Citas_ClienteID FOREIGN KEY(ClienteID)
	REFERENCES dbo.Clientes (ID);
ALTER TABLE dbo.Citas
	ADD CONSTRAINT FK_Citas_ApartID FOREIGN KEY(ApartID)
	REFERENCES dbo.Apartamentos (ID);

-- dbo.Facturas tiene 4 referencias a otras tablas ("dependencia lógica").
ALTER TABLE dbo.Facturas
	ADD CONSTRAINT FK_Facturas_ReservaID FOREIGN KEY(ReservaID)
	REFERENCES dbo.Reservas (ID);
ALTER TABLE dbo.Facturas
	ADD CONSTRAINT FK_Facturas_ClienteID FOREIGN KEY(ClienteID)
	REFERENCES dbo.Clientes (ID);
ALTER TABLE dbo.Facturas
	ADD CONSTRAINT FK_Facturas_ImpuestosID FOREIGN KEY(ImpuestoID)
	REFERENCES dbo.Impuestos (ID);
ALTER TABLE dbo.Facturas
	ADD CONSTRAINT FK_Facturas_ComisionID FOREIGN KEY(ComisionID)
	REFERENCES dbo.Comisiones (ID);

-----------------------
-- UNIQUE CONSTRAINTS
-----------------------

ALTER TABLE dbo.Clientes
	ADD CONSTRAINT UC_NumDoc UNIQUE (NumDoc);

ALTER TABLE dbo.TipoComision
	ADD CONSTRAINT UC_NombreComision UNIQUE (Nombre);

ALTER TABLE dbo.FuenteReserva
	ADD CONSTRAINT UC_FuenteReservaNombre UNIQUE (NombreFuente);

ALTER TABLE dbo.EstadoComision
	ADD CONSTRAINT UC_EstadoComisionTipoEstado UNIQUE (TipoEstado);

ALTER TABLE dbo.Impuestos
	ADD CONSTRAINT UC_ImpuestosTipoImpuesto UNIQUE (TipoImpuesto);

ALTER TABLE dbo.Nacionalidad
	ADD CONSTRAINT UC_Nacionalidad UNIQUE (Nacionalidad, NombrePais);

ALTER TABLE dbo.TipoDocumentacion
	ADD CONSTRAINT UC_TipoDocTipo UNIQUE (TipoDocumento);