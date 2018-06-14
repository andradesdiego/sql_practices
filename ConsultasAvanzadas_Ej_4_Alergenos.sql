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
    • Alergenos
    • Comidas
    • ComidasAlergenos
    • Pacientes
    • PacientesAlergias
    • TiposAlergenos
*/

USE DietasClinicas;
GO

-- Procedimiento Almacenado para insertar datos en la tabla Alergenos

CREATE PROCEDURE usp_Alergenos_AltaAlergeno

(			@Nombre VARCHAR(50)
			, @Descripcion VARCHAR(200)
			, @Apelllido2 VARCHAR(50)
			, @TipoAlergenoID SMALLINT
)
as
BEGIN
	DECLARE @IDAlergeno BIGINT;

	--Inicio para manejo o captura de posibles errores.
	BEGIN TRY;
		-- iniciar transaccion
		BEGIN TRANSACTION;	
			SET @IDAlergeno = SCOPE_IDENTITY()
			 
				INSERT INTO  dbo.Alergenos
					(	Nombre
						, Descripcion
						, TipoAlergenoID
					)
				 
				 VALUES
					(
						@Nombre
						, @Descripcion
						, @TipoAlergenoID
					);

COMMIT TRANSACTION;  
	END TRY
	BEGIN CATCH
		-- Compruebo si hay transaccion activa
		IF @@TRANCOUNT > 0
		BEGIN
			-- Si la hay, la deshacemos
			ROLLBACK TRANSACTION;
			PRINT 'Error capturado. Operacion cancelada';
		END
	END CATCH

END;

-- Procedimiento almacenado para modificar datos en la tabla Alergenos

CREATE PROCEDURE usp_Alergenos_ModificarAlergeno

(			@Nombre VARCHAR(50)
			, @Descripcion VARCHAR(200)
			, @Apelllido2 VARCHAR(50)
			, @TipoAlergenoID SMALLINT
)
as
BEGIN
	DECLARE @IDAlergeno SMALLINT;

	--Inicio para manejo o captura de posibles errores.
	BEGIN TRY;
		-- iniciar transaccion
		BEGIN TRANSACTION;	
			
			UPDATE dbo.Alergenos
			SET	  Nombre = @Nombre
			, Descripcion = @Descripcion
			, TipoAlergenoID = @TipoAlergenoID
		
COMMIT TRANSACTION;  
	END TRY
	BEGIN CATCH
		-- Compruebo si hay transaccion activa
		IF @@TRANCOUNT > 0
		BEGIN
			-- Si la hay, la deshacemos
			ROLLBACK TRANSACTION;
			PRINT 'Error capturado. Operacion cancelada';
		END
	END CATCH

END


-- Procedimiento almacenado para eliminar registros en la tabla Alergenos

CREATE PROCEDURE usp_Alergenos_BorrarAlergeno

(		
		 @IDAlergenos SMALLINT
)
AS
BEGIN
	
	--Inicio para manejo o captura de posibles errores.
	BEGIN TRY;
		-- iniciar transaccion
		BEGIN TRANSACTION;	-- Tambien se podria usar BEGIN TRAN;
					 
				DELETE FROM dbo.Alergenos
					
				WHERE ID = @IDAlergenos
				 
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
