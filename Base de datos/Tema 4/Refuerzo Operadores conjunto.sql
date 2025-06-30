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
GROUP BY C.codigo_cliente
ORDER BY C.codigo_cliente;

#Ejercicio 3
SELECT nombre nombre_empleado, "Marcos", "Nivel Jefe" "jefe"
FROM empleado;