DELIMITER $$
DROP FUNCTION if EXISTS saludar $$
CREATE FUNCTION saludar(TipoSaludo VARCHAR(20), id INT) RETURNS VARCHAR(20)
BEGIN 

	SET @saludo = (if(TipoSaludo != 'hola' AND TipoSaludo != 'adios','Saludos',TipoSaludo));
	SET @nombreUser = (SELECT nombre FROM usuario WHERE usuario.id = id);
	SET @result = (if(ISNULL(@nombreUser),
		 (CONCAT(@saludo," ",'desconocido')),(CONCAT(@saludo," ",@nombreUser))));
	RETURN @result;
	
END
$$
DELIMITER ;

SELECT saludar('hola',1);
