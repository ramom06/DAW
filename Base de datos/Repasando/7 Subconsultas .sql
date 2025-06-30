USE empleados;

#Ejercicio 1
SELECT id_producto, descripcion, existencias
FROM producto
WHERE id_fab LIKE 'ACI'
	AND existencias > (SELECT existencias
								FROM producto
								WHERE id_producto = 41004);
		
#Ejercicio 2
SELECT numempl, nombre, edad
FROM empleado					
WHERE cuota > (SELECT AVG(cuota)
					FROM empleado);
					
#Ejercicio 3
SELECT COUNT(*), AVG(edad)
FROM empleado
WHERE cuota > (SELECT AVG(cuota)
					FROM empleado);
					
#Ejercicio 4
SELECT *
FROM oficina
WHERE objetivo > (SELECT SUM(cuota)
						FROM empleado
						WHERE empleado.oficina = oficina.oficina);
						
#Ejercicio 5
SELECT nombre
FROM cliente
WHERE numclie IN (SELECT cliente
							FROM pedido
							WHERE fab LIKE 'aci'
								AND producto LIKE '4100%'
								AND fecha_pedido BETWEEN '2010-01-01' AND '2010-04-15');
								
SELECT nombre
FROM cliente C JOIN pedido P ON C.numclie = P.cliente
WHERE P.fab LIKE 'aci'
	AND P.producto LIKE '4100%'
	AND P.fecha_pedido BETWEEN '2010-01-01' AND '2010-04-15';
				
#Ejercicio 6
SELECT numempl, nombre
FROM empleado
WHERE numempl IN (SELECT rep
								FROM pedido
								WHERE (cuota * 0.01) < importe);
								
SELECT distinct numempl, nombre
FROM empleado E JOIN pedido P ON E.numempl = P.rep
WHERE (E.cuota*0.01) < P.importe;
								
#Ejercicio 7
SELECT nombre, numclie
FROM cliente
WHERE repclie IN (SELECT numempl
						FROM empleado
						WHERE nombre LIKE 'Juan Rovira');
						
#Ejercicio 8
SELECT numempl, nombre, oficina
FROM empleado
WHERE oficina IN (SELECT oficina
						FROM oficina
						WHERE ventas > objetivo);
						
#Ejercicio 8.2
SELECT numempl, nombre, oficina
FROM empleado JOIN oficina O USING(oficina)
WHERE O.ventas > O.objetivo;

#Ejercicio 9
SELECT numempl, nombre, oficina
FROM empleado
WHERE oficina NOT IN (SELECT oficina
								FROM oficina
								WHERE dir != 108); 
								
#Ejercicio 10
SELECT id_producto, id_fab, descripcion
FROM producto
WHERE id_producto NOT IN (SELECT producto
									FROM pedido
									WHERE importe < 1000);
									
#Ejercicio 11
SELECT *
FROM oficina 
WHERE oficina IN (SELECT oficina
						FROM empleado
						WHERE cuota > (0.55 * objetivo));
						
#Ejercicio 11.1
SELECT O.*
FROM oficina O JOIN empleado E USING(oficina)
WHERE cuota > (0.55 * objetivo);

#Ejercicio 12
SELECT *
FROM empleado
WHERE numempl NOT IN (SELECT IFNULL(dir,0)
								FROM oficina);

								

