/*
@What:	Ejemplo de Proc almacenado usando funciones de ventana deslizante
@Why:	Ver como funcionan las funciones deslizantes
@Who:	Pedro Bonilla
@Changes
	@Date		@Author		@Description
	16-Mar-2018	pbonilla	Creación
*/
CREATE PROCEDURE Person.usp_NavigateByPersons
(
	@PageNumber INT
	, @PageSize INT
)
AS
BEGIN
	SELECT (FirstName + ' ' + ISNULL(MiddleName, '') + ' ' + LastName) AS PersonName
		FROM Person.Person
		ORDER BY PersonName
			OFFSET ((@PageNumber-1) * @PageSize) ROWS FETCH NEXT @PageSize ROWS ONLY;
END