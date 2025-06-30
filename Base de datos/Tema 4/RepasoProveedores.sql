#Ejercicio 1.1
SELECT nombre, localidad
FROM proveedor
WHERE cod_jefe IN (SELECT cod_jefe
							FROM proveedor
							WHERE nombre LIKE 'ERNESTO'
								OR nombre LIKE 'ADOLFO');
								
#Ejercicio 1.2
SELECT p1.nombre, p1.localidad
FROM proveedor p1 JOIN proveedor p2 ON p1.cod_jefe = p2.cod_jefe
WHERE p2.nombre LIKE 'ERNESTO'
   OR p2.nombre LIKE 'ADOLFO';
   
#Ejercicio 2.1
SELECT nombre, localidad
FROM proveedor
WHERE localidad IN (SELECT localidad
    						FROM proveedor
    						WHERE cod_jefe = 11);

#Ejercicio 2.2
SELECT p1.nombre, p1.localidad
FROM proveedor p1 JOIN proveedor p2 USING(localidad)
WHERE p2.cod_jefe = 11;

#Ejercicio 3.1
SELECT p1.nombre, p1.localidad
FROM proveedor p1 JOIN proveedor p2 ON p1.cod_jefe = p2.cod_jefe
	JOIN proveedor p3 ON p1.localidad = p3.localidad
WHERE p2.nombre = 'ADOLFO'
  AND p3.codigo = 12;
  
#Ejercicio 3.2
SELECT nombre, localidad
FROM proveedor
WHERE cod_jefe IN (SELECT cod_jefe
							FROM proveedor
							WHERE nombre LIKE 'ADOLFO')
	AND localidad IN (SELECT localidad 
							FROM proveedor 
							WHERE codigo = 12);
							
#Ejercicio 4
SELECT A.codigo, A.denominacion, PR.nombre
FROM articulo A JOIN provart P ON A.codigo = P.codigo_articulo
	JOIN proveedor PR ON PR.codigo = P.codigo_proveedor
WHERE A.precio > (SELECT MAX(A2.precio)
						FROM articulo A2 JOIN provart P2 ON A2.codigo = P2.codigo_articulo
							JOIN proveedor PR2 ON PR2.codigo = P2.codigo_proveedor
						WHERE PR2.nombre LIKE 'ADOLFO')
	AND nombre NOT IN ('EDUARDO', 'MANUEL');

#Ejercicio 5
SELECT *
FROM articulo 
WHERE precio < (SELECT AVG(precio)
						FROM articulo);
						
#Ejercicio 6
SELECT denominacion, precio, (precio - (precio * 0.20)) rebajas
FROM articulo;	

#Ejercicio 7
SELECT COUNT(*) num_proveedores
FROM proveedor;					

#Ejercicio 8
SELECT AVG(precio) precio_medio
FROM articulo
WHERE denominacion != 'ZODIAC';

SELECT AVG(precio)
FROM (SELECT precio
		FROM articulo
		WHERE denominacion NOT LIKE 'Zodiac')AS a2;
