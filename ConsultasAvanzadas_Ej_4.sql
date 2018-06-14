/*
	What:			Ejercicio Consultas Avanzadas
	Why:			Bloque 4
	Who:			Diego Andrades
	Creation Date:	21-Mar-2018
	Comment:		. 

EJERCICIOS CONSULTAS AVANZADAS. BLOQUE 4

Crear procedimientos almacenados para realizar las siguientes operaciones:
    • Dar de alta (INSERTs)
    • Modificar (UPDATEs)
    • Borrar (DELETEs)

En cada una de las tablas de la base de datos clinicaDietas:
    • PacientesAlergias
    • TiposAlergenos
*/

USE DietasClinicas;
GO

-- Procedimiento Almacenado para insertar datos en la tabla Pacientes

CREATE PROCEDURE usp_Pacientes_AltaPaciente

(			@Nombre VARCHAR(50)
			, @Apellido1 VARCHAR(50)
			, @Apelllido2 VARCHAR(50)
			, @NIFNIE VARCHAR(9)
			, @FechaNacimiento DATE
)
as
BEGIN
	DECLARE @idPaciente BIGINT;

	--Inicio para manejo o captura de posibles errores.
	BEGIN TRY;
		-- iniciar transaccion
		BEGIN TRANSACTION;	
			SET @idPaciente = SCOPE_IDENTITY()
			 
				INSERT INTO  dbo.Pacientes
					(	idPaciente
						, Nombre
						, Apellido1
						, Apellido2
						, NIFNIE
						, FechaNacimiento
					)
				 
				 VALUES
					(
						@idPaciente
						, @Nombre
						, @Apellido1
						, @Apelllido2
						, @NIFNIE
						, @FechaNacimiento
					);

COMMIT TRANSACTION;  
	END TRY
	BEGIN CATCH
		-- Compruebo si hay transaccion activa
		IF @@TRANCOUNT > 0
		BEGIN
			-- Si la hay, la deshacemos
			ROLLBACK TRANSACTION;
			PRINT 'Error capturado. Operacion cancelada...';
		END
	END CATCH


END;

-- Store Procedure to UPDATE dbo.Pacientes

CREATE PROCEDURE usp_Pacientes_ModificarPaciente

(			@Nombre VARCHAR(50)
			, @Apellido1 VARCHAR(50)
			, @Apellido2 VARCHAR(50)
			, @NIFNIE VARCHAR(9)
			, @FechaNacimiento DATE
)
as
BEGIN
	DECLARE @idPaciente BIGINT;

	--Inicio para manejo o captura de posibles errores.
	BEGIN TRY;
		-- iniciar transaccion
		BEGIN TRANSACTION;	
			
						UPDATE dbo.Pacientes 
			SET	  Nombre = @Nombre
			, Apellido1 = @Apellido1
			, Apellido2 = @Apellido2
			, NIFNIE = @NIFNIE
			, FechaNacimiento = @FechaNacimiento

			 

COMMIT TRANSACTION;  
	END TRY
	BEGIN CATCH
		-- Compruebo si hay transaccion activa
		IF @@TRANCOUNT > 0
		BEGIN
			-- Si la hay, la deshacemos
			ROLLBACK TRANSACTION;
			PRINT 'Error capturado. Operacion cancelada...';
		END
	END CATCH


END


-- Stored Procedure to DELETE data on dbo.Pacientes

CREATE PROCEDURE usp_Pacientes_BorrarPaciente

(			
		 @idPaciente BIGINT
)
as
BEGIN
	

	--Inicio para manejo o captura de posibles errores.
	BEGIN TRY;
		-- iniciar transaccion
		BEGIN TRANSACTION;	-- Tambien se podria usar BEGIN TRAN;
					 
				DELETE FROM dbo.Pacientes
					
				WHERE idPaciente = @idPaciente
				 

COMMIT TRANSACTION;  -- Tambien se podria usar COMMIT;
	END TRY
	BEGIN CATCH
		-- Compruebo si hay transaccion activa
		IF @@TRANCOUNT > 0
		BEGIN
			-- Si la hay, la deshacemos
			ROLLBACK TRANSACTION;
			PRINT 'Error capturado. Operacion cancelada...';
		END
	END CATCH


END



