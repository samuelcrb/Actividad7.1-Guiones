DELIMITER $$
DROP PROCEDURE if EXISTS numeroPedidos $$
CREATE PROCEDURE numeroPedidos(IN nombre VARCHAR(20))
BEGIN 		
	SELECT COUNT(productos.IdProducto) FROM productos 
						JOIN proveedores ON productos.IdProveedor = proveedores.IdProveedor
						WHERE proveedores.NombreCompañia = nombre GROUP BY proveedores.IdProveedor;
END
$$
DELIMITER ;
CALL numeroPedidos('Tokyo Traders');
