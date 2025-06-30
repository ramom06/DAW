USE jardineria;

#Ejercicio 1
CREATE OR REPLACE VIEW Listin
	AS SELECT CONCAT(apellido1,' ',apellido2,', ',nombre) 'nombre_completo', extension
		FROM empleado;
		
#Ejercicico 2
CREATE OR REPLACE VIEW Pedpend
	AS SELECT codigo_pedido, fecha_pedido, C.nombre_cliente
		FROM pedido P JOIN cliente C USING(codigo_cliente)
		WHERE P.estado LIKE '%pendiente%';
		
#Ejercicio 3
CREATE OR REPLACE VIEW Stockb
	AS SELECT *
		FROM producto
		WHERE cantidad_en_stock < 25;
		
#Ejercicio 4
CREATE OR REPLACE VIEW Factura 
	AS SELECT P.codigo_pedido,  SUM(DP.precio_unidad* DP.cantidad) importe_total
		FROM pedido P JOIN detalle_pedido DP USING(codigo_pedido)
		GROUP BY codigo_pedido;

#Ejercicio 5
CREATE OR REPLACE VIEW ClienteVIP
	AS SELECT DISTINCT codigo_cliente
		FROM cliente C JOIN pedido P USING(codigo_cliente)
		WHERE codigo_pedido IN (SELECT codigo_pedido 
										FROM Factura 
										WHERE importe_total > (SELECT AVG(importe_total)
																		FROM Factura));
																		
#Ejercicio 6
CREATE OR REPLACE VIEW Distribucion
	AS SELECT ciudad, COUNT(*)
		FROM cliente
		GROUP BY ciudad;
		
#Ejercicio 7
CREATE OR REPLACE VIEW Pedreal
	AS SELECT nombre_cliente, COUNT(P.codigo_pedido)
		FROM cliente C left JOIN pedido P USING(codigo_cliente)
		GROUP BY nombre_cliente;
		
CREATE OR REPLACE VIEW Pedreal
	AS SELECT nombre_cliente, COUNT(P.codigo_pedido)
		FROM cliente C left JOIN pedido P USING(codigo_cliente)
		GROUP BY nombre_cliente
	
UNION 

	SELECT nombre_cliente, '0'
	FROM cliente 
	WHERE codigo_cliente NOT IN (SELECT codigo_cliente
											FROM pedido)
	GROUP BY nombre_cliente;
	
#Ejercicio 8
CREATE OR REPLACE VIEW pedidosClientes
	AS SELECT C.codigo_cliente, C.nombre_cliente, SUM(DP.precio_unidad* DP.cantidad) importe_total, C.codigo_empleado_rep_ventas
		FROM cliente C JOIN pedido P USING(codigo_cliente)
			JOIN detalle_pedido DP ON P.codigo_pedido = DP.codigo_pedido
		GROUP BY codigo_cliente;


CREATE OR REPLACE VIEW Comisiones
	AS SELECT E.nombre, PD.importe_total*0.05 comision
	FROM empleado E JOIN pedidosClientes PD ON E.codigo_empleado = PD.codigo_empleado_rep_ventas
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
	

		