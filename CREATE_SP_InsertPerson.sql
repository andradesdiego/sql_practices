USE AdventureWorks2017;
GO

/*
@What:	Procedimiento para dar de alta una Persona (en Person.Person)
@Why:	Ejemplo de Proc almacenado usando Transacciones y manejo de errores
@Who:	Pedro Bonilla
@Changes
	@Date		@Author		@Description
	16-Mar-2018	pbonilla	Creación
*/
CREATE PROCEDURE Person.usp_InsertNewPerson
(	
    @PersonType NCHAR(2)
    , @NameStyle [dbo].[NameStyle]  -- BIT
    , @Title NVARCHAR(8)
    , @FirstName [dbo].[Name]		-- NVARCHAR(50)
    , @MiddleName [dbo].[Name]
    , @LastName [dbo].[Name]
    , @Suffix NVARCHAR(10) = ''		-- Asi indicamos valores por defecto
)
AS
BEGIN
	DECLARE @businessEntityId INT;

	-- Inicio para el manejo o captura de posibles errores, similar a otros lenguajes de programación
	BEGIN TRY;

		-- Iniciar transacción
		BEGIN TRANSACTION; -- También se podría usar BEGIN TRAN; 
		
			INSERT INTO [Person].[BusinessEntity]([ModifiedDate])
				VALUES (GETDATE());

			-- SCOPE_IDENTITY se usa para obtener el id autonumerico recien creado en el INSERT anterior
			SET @businessEntityId = SCOPE_IDENTITY();

			--SELECT * FROM sys.types WHERE name = 'NameStyle' OR system_type_id = 104
SELECT 1/0;
			-- Hacemos el alta de la Persona con los campos que hemos querido
			INSERT INTO [Person].[Person] (
					[BusinessEntityID]
					, [PersonType]
					, [NameStyle]
					, [Title]
					, [FirstName]
					, [MiddleName]
					, [LastName]
					, [Suffix])
				VALUES (@businessEntityId
						, @PersonType
						, @NameStyle 
						, @Title 
						, @FirstName 
						, @MiddleName 
						, @LastName 
						, @Suffix 
						);
		
		-- Confirmación de la transacción
		COMMIT TRANSACTION;	-- También se podría usar el COMMIT;

		RETURN 0;
	END TRY
	BEGIN CATCH		
		-- Compruebo si hay transaccion activa
		IF @@TRANCOUNT > 0
		BEGIN
			-- Si la hay, la deshacemos
			ROLLBACK TRANSACTION;
			PRINT 'Error capturado. Operación cancelada...';
			
			-- Relanzar el error capturado a la aplicación para que haga el manejo oportuno
			THROW;			-- RAISERROR
		END		
			
		RETURN 1;

	END CATCH

END