#Ejercicio 1.1
SELECT oficina, ciudad, numempl, nombre
FROM oficina O JOIN empleado E USING(oficina)
WHERE region LIKE 'Este';

#Ejercicio 1.2
SELECT oficina, ciudad, numempl, nombre
FROM oficina O LEFT JOIN empleado E USING(oficina)
WHERE region LIKE 'Este';

#Ejercicio 2
SELECT num_pedido, importe, C.nombre, C.limite_credito
FROM pedido P JOIN cliente C ON P.cliente = C.numclie;

#Ejercicio 3
SELECT E.*, O.ciudad, O.region
FROM empleado E JOIN oficina O USING(oficina)
ORDER BY E.nombre;

#Ejercicio 4
SELECT O.*, E.nombre
FROM empleado E JOIN oficina O ON O.dir = E.numempl
WHERE O.objetivo > 600000;

#Ejercicio 5 
SELECT P.*, C.nombre, E.nombre
FROM pedido P JOIN empleado E ON P.rep = E.numempl
	JOIN cliente C ON P.cliente = C.numclie
WHERE P.importe > 25000;

-- Ha costado
#Ejercicio 6
SELECT E.*
FROM empleado E
WHERE E.numempl IN (SELECT rep
							FROM pedido)
	AND E.contrato IN (SELECT fecha_pedido
								FROM pedido);

-- Ha costado
#Ejercicio 7
SELECT E.*
FROM empleado E JOIN empleado J ON E.numempl = J.jefe 
WHERE E.cuota > J.cuota;

#Ejercicio 8
SELECT E.numempl
FROM empleado E JOIN pedido P ON P.rep = E.numempl
WHERE P.importe > 10000 OR E.cuota < 10000
GROUP BY E.numempl;
								