DELIMITER $$
DROP PROCEDURE if EXISTS precioUnidades $$
CREATE PROCEDURE precioUnidades(
OUT precioMinimo DECIMAL,
OUT precioMaximo DECIMAL
)
BEGIN

	SET precioMinimo = (SELECT MIN(productos.PrecioUnidad) FROM productos);
	SET precioMaximo = (SELECT MAX(productos.PrecioUnidad) FROM productos);
			
END
$$
DELIMITER ;
CALL precioUnidades(@precioMinimo,@precioMaximo);
SELECT @precioMinimo,@precioMaximo;