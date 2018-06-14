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

-- Procedimiento Almacenado para insertar datos en la tabla Comidas

CREATE PROCEDURE usp_Comidas_AltaComida

(			@Nombre VARCHAR(50)
			, @Descripcion VARCHAR(300)
			
)
as
BEGIN
	DECLARE @ID SMALLINT;

	--Inicio para manejo o captura de posibles errores.
	BEGIN TRY;
		-- iniciar transaccion
		BEGIN TRANSACTION;	
			SET @ID = SCOPE_IDENTITY()
			 
				INSERT INTO  dbo.Comidas
					(	Nombre
						, Descripcion
					)
				 
				 VALUES
					(
						@Nombre
						, @Descripcion
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

-- Procedimiento almacenado para modificar datos en la tabla Comidas

CREATE PROCEDURE usp_Comidas_ModificarComida

(			@Nombre VARCHAR(50)
			, @Descripcion VARCHAR(300)
			
)
as
BEGIN
	DECLARE @ID SMALLINT;

	--Inicio para manejo o captura de posibles errores.
	BEGIN TRY;
		-- iniciar transaccion
		BEGIN TRANSACTION;	
			
			UPDATE dbo.Comidas
			SET	  Nombre = @Nombre
			, Descripcion = @Descripcion
		
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

CREATE PROCEDURE usp_Comida_BorrarComida

(		
		 @ID SMALLINT
)
AS
BEGIN
	
	--Inicio para manejo o captura de posibles errores.
	BEGIN TRY;
		-- iniciar transaccion
		BEGIN TRANSACTION;	-- Tambien se podria usar BEGIN TRAN;
					 
				DELETE FROM dbo.Comidas
					
				WHERE ID = @ID
				 
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
