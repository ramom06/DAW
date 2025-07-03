USE empleados;

#Ejercicio 1.1
SELECT O.oficina, O.ciudad, E.nombre, E.numempl
FROM oficina O JOIN empleado E ON O.oficina = E.oficina
WHERE region LIKE 'este';

#Ejercicio 1.2
SELECT O.oficina, O.ciudad, E.nombre, E.numempl
FROM oficina O LEFT JOIN empleado E ON O.oficina = E.oficina
WHERE region LIKE 'este';

#Ejercicio 2
SELECT P.num_pedido, P.importe, C.nombre, C.limite_credito
FROM pedido P JOIN cliente C ON P.cliente = C.numclie;

#Ejercicio 3
SELECT E.*, O.ciudad, O.region
FROM empleado E JOIN oficina O USING(oficina)
ORDER BY E.nombre;

#Ejercicio 4
SELECT O.*, D.nombre
FROM oficina O JOIN empleado D ON O.dir = D.numempl
WHERE O.objetivo > 600000;

#Ejercicio 5
SELECT P.*, E.nombre, C.nombre
FROM pedido P JOIN empleado E ON P.rep = E.numempl 
	JOIN cliente C ON C.repclie = E.numempl
WHERE P.importe > 25000
GROUP BY P.;

#Ejercicio 6
SELECT E.*, P.fecha_pedido 
FROM empleado E JOIN pedido P ON E.numempl = P.rep
WHERE E.contrato = P.fecha_pedido;

#Ejercicio 7
SELECT E.*, J.numempl, J.nombre, J.cuota
FROM empleado E JOIN empleado J ON E.numempl = J.jefe
WHERE E.cuota > J.cuota;

#Ejercicio 8
SELECT E.numempl, P.importe, IFNULL(E.cuota,0) cuota
FROM empleado E JOIN pedido P ON E.numempl = P.rep
WHERE P.importe > 10000 
	OR E.cuota < 10000
GROUP BY E.numempl;