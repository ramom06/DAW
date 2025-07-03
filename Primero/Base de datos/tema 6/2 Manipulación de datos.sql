USE empleados;

#Ejercicio 1
CREATE OR REPLACE TABLE nempleado SELECT * FROM empleado;

#Ejercicio 2
CREATE OR REPLACE TABLE noficina SELECT * FROM oficina;

#Ejercicio 3
CREATE OR REPLACE TABLE nproducto SELECT * FROM producto;

#Ejercicio 4
CREATE OR REPLACE TABLE npedido SELECT * FROM pedido;

#Ejercicio 5
UPDATE nproducto SET precio = precio*1.05 WHERE id_fab LIKE 'aci';

#Ejercicio 6
INSERT INTO noficina VALUES(30,"Madrid", "Centro", NULL,100000,0);  

#Ejercicio 7
UPDATE nempleado SET oficina = 30 WHERE  oficina = 21;

#Ejercicio 8
DELETE FROM npedido WHERE rep = 105;

#Ejercicio 9
DELETE FROM noficina WHERE oficina NOT IN (SELECT ifnull(oficina,0) FROM empleado);

#Ejercicio 10
UPDATE nproducto SET precio = (SELECT precio 
											FROM producto 
											WHERE nproducto.id_fab =id_fab 
												AND nproducto.id_producto=id_producto);

#Ejercicio 11
INSERT INTO noficina SELECT * 
							FROM oficina 
							WHERE oficina.oficina NOT IN (SELECT noficina.oficina 
																	FROM noficina);

#Ejercicio 12
INSERT INTO npedido SELECT *
							FROM pedido
							WHERE pedido.codigo NOT IN (SELECT npedido.codigo
																	FROM npedido);
																	
#Ejercicio 13 
UPDATE nempleado SET oficina = 30 WHERE  oficina = 21;