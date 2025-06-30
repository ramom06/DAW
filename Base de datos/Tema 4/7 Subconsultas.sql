USE empleados;

#Ejercicio 1
SELECT id_producto, descripcion, existencias
FROM producto
WHERE id_fab LIKE 'aci' AND existencias > (SELECT existencias
															FROM producto
															WHERE id_fab LIKE 'aci'
																AND id_producto = 41004);

#Ejercicio 2 
SELECT numempL, nombre, edad
FROM empleado
WHERE cuota > (SELECT AVG(cuota)
					FROM empleado);
					
#Ejercicio 3
SELECT COUNT(numempl) numero_empleados, AVG(edad) edad_media
FROM empleado
WHERE cuota > (SELECT AVG(cuota)
					FROM empleado);


#Ejercicio 4
SELECT *
FROM oficina O
WHERE objetivo > (SELECT SUM(cuota)
						FROM empleado E
						WHERE O.oficina = E.oficina)
ORDER BY oficina;
						
#Ejercicio 5
SELECT nombre
FROM cliente
WHERE numclie IN (SELECT cliente
						FROM pedido
						WHERE fab LIKE 'aci' 
							AND producto LIKE '4100%' 
							AND fecha_pedido BETWEEN '2010-01-1'AND'2010-04-15');
				
#Ejercicio 5.1
SELECT C.nombre
FROM cliente C JOIN pedido P ON C.numclie = P.cliente
WHERE fab LIKE 'aci' 
		AND producto LIKE '4100%' 
		AND fecha_pedido BETWEEN '2010-01-1'AND'2010-04-15';	
	
#Ejercicio 6
SELECT numempl, nombre
FROM empleado E
WHERE numempl IN (SELECT rep
							FROM pedido P
							WHERE (E.cuota * 0.01) < importe);
							
SELECT DISTINCT numempl, nombre
FROM empleado E JOIN pedido P ON E.numempl = P.rep
WHERE  (E.cuota * 0.01) < importe;
							
#Ejercicio 7
SELECT numclie, nombre
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
							
#Ejercicio 8.1
SELECT numempl, nombre, oficina
FROM empleado E JOIN oficina O USING(oficina)
WHERE O.ventas > O.objetivo;
		
							
#Ejercicio 9 
SELECT numempl, nombre, oficina
FROM empleado E
WHERE oficina NOT IN (SELECT oficina
							FROM oficina
							WHERE dir != 108);		

#Ejercicio 10
SELECT id_producto, id_fab, descripcion
FROM producto
WHERE id_producto IN (SELECT producto
								FROM pedido
								WHERE importe < 1000);
								
#Ejercicio 11
SELECT oficina, ciudad
FROM oficina O
WHERE oficina IN (SELECT oficina
						FROM empleado E
						WHERE E.cuota > (O.objetivo * 0.55));
						
#Ejercicio 11.2
SELECT oficina, ciudad
FROM oficina O JOIN empleado E USING(oficina)
WHERE E.cuota > (O.objetivo * 0.55);
						
#Ejercicio 12
SELECT numempl, nombre, edad
FROM empleado 
WHERE numempl not IN (SELECT IFNULL(dir,0)
							FROM oficina); 
