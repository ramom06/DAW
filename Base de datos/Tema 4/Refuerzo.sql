USE tienda;

#Ejercicio 1
SELECT nombre FROM producto;

#Ejercicio 2
SELECT nombre, precio FROM producto;

#Ejercicio 3
SELECT nombre, precio 'precio en euros', Round(precio * 1.14344, 2) 'precio en dólares estadounidense' FROM producto;

#Ejercicio 4
SELECT UPPER(nombre), precio FROM producto; 

#Ejercicio 5
SELECT LOWER(nombre), precio FROM producto; 

#Ejercicio 6
SELECT nombre, SUBSTRING(UPPER(nombre),1,2) FROM fabricante;
SELECT nombre, LEFT(UPPER(nombre), 2) FROM fabricante;

#Ejercicio 7
SELECT nombre, TRUNCATE(precio,0) FROM producto; 

#Ejercicio 8
SELECT codigo_fabricante FROM producto;

#Ejercicio 9
SELECT DISTINCT codigo FROM producto;

#Ejercicio 10 
SELECT nombre FROM fabricante 
ORDER BY nombre;

#Ejercicio 11
SELECT nombre FROM fabricante 
ORDER BY nombre DESC;

#Ejercicio 12
SELECT nombre FROM producto
WHERE codigo_fabricante = 2;

#Ejercicio 13
SELECT nombre FROM producto
WHERE precio <= 120;

#Ejercicio 14
SELECT nombre FROM producto
WHERE precio >= 400;

#Ejercicio 15
SELECT nombre FROM producto
WHERE precio < 400;

#Ejercicio 16
SELECT * FROM producto
WHERE precio >= 80 AND precio <= 300;

#Ejercicio 17
SELECT * FROM producto
WHERE precio BETWEEN 60 AND 200;

#Ejercicio 18
SELECT * FROM producto
WHERE precio > 200 AND codigo_fabricante = 6;

#Ejercicio 19
SELECT * FROM producto
WHERE codigo_fabricante = 1 
	OR codigo_fabricante = 3
	OR codigo_fabricante = 5;
 
#Ejercicio 20
SELECT * FROM producto
WHERE codigo_fabricante IN (2,4,6);
	
#Ejercicio 21
SELECT nombre, (precio*100) 'precio en céntimos' FROM producto;

#Ejercicio 22
SELECT nombre FROM fabricante
WHERE nombre LIKE 'S%'; 

#Ejercicio 23
SELECT nombre FROM fabricante
WHERE nombre LIKE '%e'; 

#Ejercicio 24
SELECT nombre FROM fabricante
WHERE nombre LIKE '%w%'; 

#Ejercicio 25
SELECT nombre FROM fabricante
WHERE CHAR_LENGTH(nombre) = 4;

#Ejercicio 26
SELECT nombre FROM producto
WHERE nombre LIKE '%Portátil%';

#Ejercicio 27
SELECT nombre FROM producto
WHERE nombre LIKE '%Monitor%' AND precio < 215;

#Ejercicio 28
SELECT nombre, precio FROM producto
WHERE precio >= 180
ORDER BY precio DESC, nombre ASC;

#Ejercicio 29
SELECT COUNT(*) 'Número total de productos' FROM producto;

#Ejercicio 30
SELECT COUNT(*) 'Número total de fabricantes' FROM fabricante;

#Ejercicio 31
SELECT COUNT(DISTINCT codigo_fabricante) 'Número de códigos de fabricantes' FROM producto;
 
#Ejercicio 32
SELECT ROUND(AVG(precio),2) 'Media de precio' FROM producto;

#Ejercicio 33
SELECT MIN(precio) 'Precio más barato' FROM producto;
 
#Ejercicio 34
SELECT MAX(precio) 'Precio más caro' FROM producto;

#Ejercicio 35
SELECT SUM(precio) 'Suma de todos los precios' FROM producto;

#Ejercicio 36
SELECT COUNT(*) 'Número de productos' FROM producto
WHERE codigo_fabricante = 1;

#Ejercicio 37
SELECT AVG(precio) 'Media de precos de Asus' FROM producto
WHERE codigo_fabricante = 1;

#Ejercicio 38
SELECT MIN(precio) 'Precio más barato' FROM producto
WHERE codigo_fabricante = 1;

#Ejercico 39
SELECT MAX(precio) 'Precio más barato' FROM producto
WHERE codigo_fabricante = 1;

#Ejercicio 40
SELECT MIN(precio) 'Precio mínimo del fabricante Crucial', 
	MAX(precio) 'Precio máximo del fabricante Crucial', 
	AVG(precio) 'Precio medio del fabricante Crucial', COUNT(*)
FROM producto
WHERE codigo_fabricante = 6;

#Ejercicio 41
SELECT codigo_fabricante, COUNT(*) numero_productos FROM producto
GROUP BY codigo_fabricante
ORDER BY numero_productos DESC;

#Ejercicio 42
SELECT MAX(precio) precio_máximo, MIN(precio) precio_mínimo, AVG(precio) precio_medio, codigo_fabricante FROM producto
GROUP BY codigo_fabricante;

#Ejercico 43
SELECT MAX(precio) precio_máximo, MIN(precio) precio_mínimo, AVG(precio) precio_medio, codigo_fabricante FROM producto
GROUP BY codigo_fabricante
HAVING precio_medio > 200;

#Ejercicio 44
SELECT COUNT(*) numero_productos, codigo_fabricante FROM producto
WHERE precio >= 180
GROUP BY codigo_fabricante;

#Ejercicio 45
SELECT codigo_fabricante, COUNT(*) productos_por_fabricante
FROM producto
WHERE precio >= 220
GROUP BY codigo_fabricante
HAVING productos_por_fabricante > 1;

#Ejercicio 46
SELECT codigo_fabricante, SUM(precio) suma_precio
FROM producto
WHERE  precio > 100
GROUP BY codigo_fabricante
HAVING suma_precio > 500;

 
 
 
 
 
 
 
 
 
 
 