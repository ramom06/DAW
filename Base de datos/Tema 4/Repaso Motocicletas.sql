USE motocicletas;

#Ejercicio 1.1
SELECT fecha_hora
FROM venta V JOIN cliente C ON V.nif_cliente = C.nif
WHERE C.nombre = 'Manolo' AND  C.apellidos = 'Montoro';

#Ejercicio 1.2
SELECT fecha_hora
FROM venta 
WHERE nif_cliente = (SELECT nif
							FROM cliente
							WHERE nombre = 'Manolo' AND  apellidos = 'Montoro');

#Ejercicio 2
SELECT *
FROM venta V
WHERE fecha_hora < '2000-01-01 00';

#Ejercicio 3.1
SELECT direccion, COUNT(*) AS numero_clientes_en_calle
FROM cliente
GROUP BY direccion
HAVING COUNT(*) > 1;

#Ejercicio 3.2
SELECT direccion, COUNT(*) AS numero_clientes_en_calle
FROM cliente C1
WHERE EXISTS (SELECT * 
							FROM cliente C2
							WHERE C1.direccion = C2.direccion
							AND C1.nif != c2.nif)
GROUP BY direccion;

#Ejercicio 3.3
SELECT direccion 
FROM (SELECT direccion, COUNT(*) AS clientes
		FROM cliente
		GROUP BY direccion) AS clientes_direccion
WHERE clientes > 1;	

#Ejercicio 4
SELECT COUNT(*) numero_ventas, M.fabricante
FROM venta V JOIN modelo M ON V.bastidor_modelo = M.bastidor
GROUP BY M.fabricante
ORDER BY numero_ventas DESC;

#Ejercicio 5
SELECT nombre, apellidos
FROM cliente C JOIN venta V ON C.nif = V.nif_cliente 
	JOIN modelo M ON V.bastidor_modelo = M.bastidor
WHERE M.tipo LIKE 'Scooter';

#Ejercicio 6
SELECT *
FROM comercial
WHERE nif IN (SELECT nif_cliente
					FROM venta);
					
#Ejercicio 7
SELECT AVG(precio) precio_medio
FROM modelo;

#Ejercicio 8
SELECT bastidor, precio
FROM modelo
WHERE precio > (SELECT AVG(precio)
						FROM modelo);

#Ejercicio 9
SELECT bastidor
FROM modelo
WHERE fabricante LIKE 'KTM';

#Ejercicio 10
SELECT tipo, SUM(precio)
FROM modelo
WHERE bastidor IN (SELECT bastidor_modelo
					FROM venta)
GROUP BY tipo
ORDER BY SUM(precio) DESC;

#Ejercicio 11
SELECT DATE(fecha_hora), COUNT(*) numero_ventas
FROM venta
GROUP BY DATE(fecha_hora)
HAVING COUNT(*) > 1;