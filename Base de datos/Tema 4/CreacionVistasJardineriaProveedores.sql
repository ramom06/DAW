#Ejercicio 1
CREATE OR REPLACE VIEW Listin 
	AS SELECT CONCAT(apellido1, ' ', apellido2, ', ', nombre), extension
	FROM empleado;
	
#Ejercicio 2
CREATE OR REPLACE VIEW Pedpend 
	AS SELECT codigo_pedido, fecha_pedido, C.nombre_cliente
	FROM pedido P JOIN cliente C Using(codigo_cliente)
	WHERE P.estado LIKE 'Pendiente';
	
#Ejercicio 3
CREATE OR REPLACE VIEW Stockb
	AS SELECT *
	FROM producto
	WHERE cantidad_en_stock < 25;
	
#Ejercicio 4
CREATE OR REPLACE VIEW Factura 
	AS SELECT codigo_pedido, SUM(precio_unidad*cantidad) importe
	FROM detalle_pedido
	GROUP BY codigo_pedido;

#Ejercicio 5
CREATE OR REPLACE VIEW Clientevip
	AS SELECT DISTINCT codigo_cliente
	FROM cliente NATURAL JOIN pedido 
	WHERE codigo_pedido IN (SELECT codigo_pedido
									FROM Factura
									WHERE importe > (SELECT AVG(importe)
															FROM Factura));
							
#Ejercicio 6
CREATE OR REPLACE VIEW Distribucion 
	AS SELECT ciudad, COUNT(*) numero_clientes_en_ciudad
	FROM cliente
	GROUP BY ciudad;
	
#Ejercicio 7
CREATE OR REPLACE VIEW Pedreal
	AS SELECT C.nombre_cliente, COUNT(P.codigo_pedido) numero_pedidos
	FROM cliente C LEFT JOIN pedido P USING(codigo_cliente)
	GROUP BY C.nombre_cliente;			

SELECT nombre_cliente, COUNT(*) numPedido
FROM cliente NATURAL JOIN pedido
GROUP BY codigo_cliente

UNION

SELECT nombre_cliente, "0"
FROM cliente
WHERE codigo_cliente NOT IN (SELECT codigo_cliente
										FROM pedido)
GROUP BY nombre_cliente;
	
#Ejericio 8
CREATE OR REPLACE VIEW TotalPedidosCliente 
	AS SELECT P.codigo_cliente, SUM(F.importe) total_pedido
	FROM factura F
	JOIN pedido P USING (codigo_pedido)
	GROUP BY P.codigo_cliente;


CREATE OR REPLACE VIEW Comisiones
	AS SELECT E.nombre, SUM(T.total_pedido * 0.05) comision
		FROM empleado E JOIN cliente C ON E.codigo_empleado = C.codigo_empleado_rep_ventas
		JOIN TotalPedidosCliente T ON C.codigo_cliente = T.codigo_cliente
		GROUP BY E.codigo_empleado;
	
#Ejercicio 1
CREATE OR REPLACE VIEW Prodbaratos
	AS SELECT *
	FROM articulo
	WHERE precio < (SELECT AVG(precio)
						FROM articulo);

#Ejercicio 2
CREATE OR REPLACE VIEW RebajaPrimavera
	AS SELECT *, precio * 0.8 rebajas_primavera
	FROM articulo;
	
	
