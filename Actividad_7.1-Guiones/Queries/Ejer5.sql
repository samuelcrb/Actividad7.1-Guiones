DELIMITER $$
DROP PROCEDURE if EXISTS ventaProductos $$
CREATE PROCEDURE ventaProductos(
IN nombreProducto VARCHAR(20),
IN cantidadUnidades SMALLINT,
OUT beneficio DECIMAL
)
BEGIN

	UPDATE productos 
		SET productos.UnidadesEnExistencia =  productos.UnidadesEnExistencia - cantidadUnidades
		WHERE productos.NombreProducto = nombreProducto; 

	SET beneficio = (SELECT productos.PrecioUnidad 
							FROM productos WHERE productos.NombreProducto = nombreProducto) * cantidadUnidades;
		
	
END
$$
DELIMITER ;
CALL ventaProductos('Pez espada',2,@beneficiosVentas);
SELECT @beneficiosVentas;