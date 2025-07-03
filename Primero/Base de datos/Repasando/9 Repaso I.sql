USE motocicletas;

#Ejercicio 1.1
SELECT SUBSTRING_INDEX(fecha_hora,' ', 1)
FROM venta V JOIN cliente C ON V.nif_cliente = C.nif
WHERE C.nombre LIKE 'Manolo';

#Ejercicio 1.2
SELECT SUBSTRING_INDEX(fecha_hora,' ', 1)
FROM venta V
WHERE V.nif_cliente IN (SELECT nif
								FROM cliente
								WHERE nombre LIKE 'Manolo');
								
#Ejercicio 2
SELECT *
FROM venta
WHERE YEAR(SUBSTRING_INDEX(fecha_hora,' ', 1)) < 2000;	

#Ejercicio 3.1
SELECT direccion, COUNT(*) persona_misma_calle
FROM cliente 		
GROUP BY direccion
HAVING COUNT(*) > 1;

#Ejercicio 3.2
SELECT direccion, COUNT(*) persona_misma_calle
FROM cliente C1
WHERE EXISTS (SELECT *
					FROM cliente C2 
					WHERE c1.direccion = C2.direccion
						AND C1.nif != C2.nif);
						
#Ejercicio 3.3
SELECT direccion 
FROM (SELECT direccion, COUNT(*) AS clientes
		FROM cliente
		GROUP BY direccion) AS clientes_direccion
WHERE clientes > 1;	

#Ejercicio 4
SELECT C.nombre,COUNT(*) numero_motos_vendidas
FROM venta V JOIN comercial C ON V.nif_comercial = C.nif
GROUP BY nombre;

#Ejercicio 5
SELECT C.apellidos, C.nombre
FROM venta V JOIN cliente C ON V.nif_cliente = C.nif
	JOIN modelo M ON V.bastidor_modelo = M.bastidor
WHERE M.tipo LIKE 'Scooter'
ORDER BY apellidos, nombre;

#Ejercicio 6
SELECT *
FROM comercial CO JOIN cliente C USING(nif);

#Ejercicio 7
SELECT AVG(precio)
FROM modelo;

#Ejercicio 8
SELECT *
FROM modelo
WHERE precio > (SELECT AVG(precio)
						FROM modelo);
						
#Ejercicio 9
SELECT *
FROM modelo
WHERE fabricante LIKE 'KTM';

#Ejercicio 10
SELECT tipo, SUM(precio) facturacion
FROM modelo
GROUP BY tipo
ORDER BY facturacion DESC;

#Ejercicio 11
SELECT DAY(fecha_hora) dia, COUNT(*) ventas_totales
FROM venta
GROUP BY DAY(fecha_hora)
HAVING ventas_totales > 1;
					
