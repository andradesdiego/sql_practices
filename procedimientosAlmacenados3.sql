/*
	What:			Procedimientos almacenados
	Why:			WHILE y CURSOR
	Who:			Diego Andrades
	Creation Date:	12-Mar-2018
	Comment:		. 
*/

USE AdventureWorks2017;
GO

DECLARE @contador INT
SET @contador = 0;

-- Bucle while básico
WHILE (@contador < 10)
BEGIN
	PRINT @contador;
	SET @contador = @contador + 1;
END

-- Bucle while para recorrer un 'cursor'
DECLARE @nombre VARCHAR(50);

--Creamos el cursor para recorrer fila a fila el resultado de una consulta
DECLARE vend_cursor CURSOR
	FOR SELECT name FROM Purchasing.Vendor
--Abrimos el cursor
OPEN vend_cursor
--Leemos el primer valor recogido por el cursor
FETCH NEXT FROM vend_cursor INTO @nombre;
--Iteramos hasta que no haya nada más que leer (hasta la última fila recuperada en el cursor)
WHILE @@FETCH_STATUS = 0
BEGIN
	PRINT @nombre;
	--Ir a la siguiente fila del cursor
	FETCH NEXT FROM vend_cursor INTO @nombre
END
--Limpiar el cursor de la memoria
CLOSE vend_cursor;
DEALLOCATE vend_cursor;





