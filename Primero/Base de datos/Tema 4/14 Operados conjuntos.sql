#Ejercicio 1
SELECT nombre_cliente, 'S' Pedidos
FROM cliente 
WHERE codigo_cliente IN (SELECT codigo_cliente
									FROM pedido)
UNION
SELECT nombre_cliente, 'N' Pedidos
FROM cliente
WHERE codigo_cliente NOT IN (SELECT codigo_cliente
									FROM pedido)
ORDER BY nombre_cliente;

#Ejercicio 2
SELECT codigo_cliente
FROM cliente C JOIN pedido P USING(codigo_cliente)
WHERE C.ciudad LIKE 'Madrid'
GROUP BY codigo_cliente
ORDER BY codigo_cliente;

-- INTERSECT solo muestra los resultados comúnes
SELECT codigo_cliente
FROM cliente
WHERE ciudad LIKE 'Madrid'

intersect

SELECT codigo_cliente
FROM pedido
ORDER BY 1;

#Ejercicio 3

SELECT E.nombre,J.nombre, 'Jefe' Jefe
FROM empleado E JOIN empleado J ON E.codigo_jefe = J.codigo_empleado
   
UNION

SELECT E.nombre,J1.nombre, 'Jefe del Jefe' Jefe
FROM empleado E JOIN empleado J ON E.codigo_jefe = J.codigo_empleado
   JOIN empleado J1 ON J.codigo_jefe = J1.codigo_empleado

UNION 

SELECT E.nombre,J2.nombre, 'Jefe del Jefe del Jefe' Jefe
FROM empleado E JOIN empleado J ON E.codigo_jefe = J.codigo_empleado
   JOIN empleado J1 ON J.codigo_jefe = J1.codigo_empleado
   JOIN empleado J2 ON J1.codigo_jefe = J2.codigo_empleado
ORDER BY 1,3;
   

#Ejercicio 4
CREATE VIEW nivel_jefe AS
	SELECT codigo_empleado, '1' Nivel
	FROM empleado 
	WHERE codigo_jefe IS NULL
	
	UNION
	
	SELECT E.codigo_empleado, '2' 
	FROM empleado E JOIN empleado J ON E.codigo_jefe = J.codigo_empleado
	WHERE J.codigo_jefe IS NULL
	
	UNION
	
	SELECT E.codigo_empleado, '3'
	FROM empleado E JOIN empleado J ON E.codigo_jefe = J.codigo_empleado
	JOIN empleado J1 ON J.codigo_jefe = J1.codigo_empleado
	WHERE J1.codigo_jefe IS NULL
	
	UNION 
	
	SELECT E.codigo_empleado, '>3'
	FROM empleado E JOIN empleado J ON E.codigo_jefe = J.codigo_empleado
		JOIN empleado J1 ON J.codigo_jefe = J1.codigo_empleado
		JOIN empleado J2 ON J1.codigo_jefe = J2.codigo_empleado;
	

SELECT E.nombre,J.nombre, 'Jefe' Jefe, (SELECT Nivel
														FROM nivel_jefe
														WHERE codigo_empleado = J.codigo_jefe)
FROM empleado E JOIN empleado J ON E.codigo_jefe = J.codigo_empleado
   
UNION

SELECT E.nombre,J1.nombre, 'Jefe del Jefe' Jefe, (SELECT Nivel
																	FROM nivel_jefe
																	WHERE codigo_empleado = J.codigo_jefe)
FROM empleado E JOIN empleado J ON E.codigo_jefe = J.codigo_empleado
   JOIN empleado J1 ON J.codigo_jefe = J1.codigo_empleado
   
UNION 


SELECT E.nombre,J2.nombre, 'Jefe del Jefe del Jefe' Jefe,(SELECT Nivel
																				FROM nivel_jefe
																				WHERE codigo_empleado = J.codigo_jefe)
FROM empleado E JOIN empleado J ON E.codigo_jefe = J.codigo_empleado
	JOIN empleado J1 ON J.codigo_jefe = J1.codigo_empleado
	JOIN empleado J2 ON J1.codigo_jefe = J2.codigo_empleado;


#Ejercicio 5
SELECT DISTINCT C.nombre_cliente
FROM cliente C JOIN (SELECT *
							FROM cliente
							WHERE ciudad LIKE 'Madrid') AS C2 ON C.codigo_cliente = C2.codigo_cliente
WHERE C.codigo_cliente NOT IN (SELECT codigo_cliente
										FROM pedido);

SELECT nombre_cliente
FROM cliente
WHERE ciudad LIKE 'Madrid'

INTERSECT 

SELECT nombre_cliente
FROM cliente
WHERE codigo_cliente NOT IN (SELECT codigo_cliente
										FROM pedido);
	
-- Los que viven en madrid, excepto los que hayan hecho pedidos									
SELECT nombre_cliente, 'No' pedidos
FROM cliente
WHERE ciudad LIKE 'Madrid'

except 

SELECT distinct nombre_cliente, 'No' pedidos
FROM cliente JOIN pedido USING (codigo_cliente);


	
#Ejercicio 6
SELECT nombre_cliente, 'Si' Pedidos
FROM cliente
WHERE codigo_cliente IN (SELECT codigo_cliente
										FROM pedido)
	AND ciudad LIKE 'Madrid'
UNION
SELECT  nombre_cliente, 'No' Pedidos
FROM cliente
WHERE codigo_cliente NOT IN (SELECT codigo_cliente
										FROM pedido)
	AND ciudad LIKE 'Madrid'
ORDER BY nombre_cliente;




