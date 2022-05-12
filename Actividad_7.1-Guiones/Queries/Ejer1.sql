SET @nombre = 'Exotic Liquids';
SET @existencias = 15;

SELECT * FROM productos RIGHT JOIN proveedores 
			ON productos.IdProveedor = proveedores.IdProveedor
			WHERE proveedores.NombreCompañia = @nombre AND productos.UnidadesEnExistencia > @existencias;
