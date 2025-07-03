#Ejercicio 1
SELECT C.codigo_cliente, P.codigo_pedido
FROM cliente C JOIN empleado E ON C.codigo_empleado_rep_ventas = E.codigo_empleado
	JOIN pedido P ON P.codigo_cliente = C.codigo_cliente
WHERE E.nombre LIKE 'Emmanuel';

#Ejercicio 2
SELECT E.nombre, COUNT(P.codigo_pedido) num_pedidos
FROM empleado E JOIN cliente C ON E.codigo_empleado = C.codigo_empleado_rep_ventas
	JOIN pedido P ON P.codigo_cliente = C.codigo_cliente
GROUP BY E.nombre
ORDER BY num_pedidos;

#Ejercicio 3
SELECT C.nombre_cliente
FROM cliente C JOIN pedido P USING(codigo_cliente)
WHERE C.codigo_cliente IN (SELECT codigo_cliente
									FROM pedido)
GROUP BY C.nombre_cliente
ORDER BY C.nombre_cliente;

SELECT C.nombre_cliente
FROM cliente C 
WHERE EXISTS (SELECT * FROM pedido p
					WHERE p.codigo_cliente = c.codigo_cliente)
ORDER BY C.nombre_cliente;

#Ejercicio 4
SELECT P.codigo_pedido, SUM(DP.cantidad * DP.precio_unidad) importe_total
FROM pedido P JOIN cliente C USING(codigo_cliente)
	JOIN detalle_pedido DP ON DP.codigo_pedido = P.codigo_pedido
WHERE C.nombre_cliente LIKE 'Beragua'
GROUP BY P.codigo_pedido
ORDER BY P.codigo_pedido;

#Ejercicio 5
SELECT P.codigo_pedido, SUM(DP.cantidad * DP.precio_unidad) importe_total
FROM pedido P JOIN detalle_pedido DP USING(codigo_pedido)
WHERE codigo_pedido BETWEEN 10 AND 15
GROUP BY P.codigo_pedido
ORDER BY P.codigo_pedido;

#Ejercicio 6
SELECT MAX(total_pedido) pedido_mayor_imp, MIN(total_pedido) pedido_min_imp
FROM (SELECT pe.codigo_pedido, SUM(DP.cantidad * DP.precio_unidad) total_pedido
		FROM pedido pe JOIN detalle_pedido dp ON pe.codigo_pedido = dp.codigo_pedido
		GROUP BY pe.codigo_pedido) AS pedidos_totales;

#Ejercicio 7
SELECT P.nombre, sum(DP.cantidad) cantidad
FROM producto P JOIN detalle_pedido DP USING(codigo_producto)
GROUP BY P.nombre
HAVING cantidad > 100
ORDER BY DP.cantidad;

#Ejercicio 8
SELECT C.nombre_cliente, SUM(DP.cantidad*DP.precio_unidad) importeTotal
FROM cliente C JOIN pedido P USING(codigo_cliente)
	JOIN detalle_pedido DP ON DP.codigo_pedido = P.codigo_pedido
GROUP BY C.nombre_cliente;

#Ejercicio 9
SELECT nombre, precio_venta
FROM producto
WHERE precio_venta IN (SELECT MAX(precio_venta)
								FROM producto);

#Ejercicio 10
SELECT C.nombre_cliente, P.codigo_pedido, 
	SUM(DP.precio_unidad*DP.cantidad)*0.21 IVA_producto, 
	SUM(DP.precio_unidad*DP.cantidad) 'importe sin iva', 
	SUM(DP.precio_unidad*DP.cantidad) * 1.21 Total 
FROM cliente C JOIN pedido P USING(codigo_cliente)
	JOIN detalle_pedido DP ON DP.codigo_pedido = P.codigo_pedido
WHERE P.codigo_pedido IN (9,10,12,14)
GROUP BY P.codigo_pedido;

#Ejercicio 11
SELECT O.codigo_oficina, P.estado, COUNT(P.codigo_pedido) cantidad_pedidos_pendientes
FROM oficina O JOIN empleado E USING(codigo_oficina)
	JOIN cliente C ON C.codigo_empleado_rep_ventas = E.codigo_empleado
	JOIN pedido P ON P.codigo_cliente = C.codigo_cliente
WHERE P.estado LIKE 'Pendiente'
GROUP BY O.codigo_oficina
ORDER BY cantidad_pedidos_pendientes desc;