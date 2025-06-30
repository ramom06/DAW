USE tienda;

#Ejercicio 1
SELECT nombre nombre_producto, precio euros, ROUND(precio * 1.08,2) dolares 
FROM producto;

#Ejercicio 2
SELECT * 
FROM producto
WHERE codigo_fabricante IN (1,3,5);

#Ejercicio 3
SELECT nombre
FROM fabricante
WHERE nombre LIKE '%w%';

#Ejercicio 4
SELECT nombre 
FROM fabricante
HAVING CHAR_LENGTH(nombre) = 4;

#Ejercicio 5
SELECT nombre, precio 
FROM producto
WHERE precio >= 180
ORDER BY precio DESC, nombre ASC;

#Ejercicio 6
SELECT COUNT(*) total_fabricantes
FROM fabricante;

#Ejercicio 7
SELECT MIN(precio) precio_minimo, MAX(precio) precio_maximo, AVG(precio) precio_medio, COUNT(*) total_productos
FROM producto
WHERE codigo_fabricante = 6;

#Ejercicio 8
SELECT codigo_fabricante, COUNT(*) numero_productos
FROM producto
GROUP BY codigo_fabricante
ORDER BY numero_productos DESC;

#Ejercicio 9
-- Aquí muestro todo lo que pide, y lo agrupo por codigo de fabricante para que se vea los datos entorno a los productos de cada fabricante,
-- podría no haber puesto codigo_fabricante y no agruparlo por fabricante para que se vean los datos que piden de manera general con todos los fabricantes
SELECT  MAX(precio) precio_maximo, MIN(precio) precio_minimo, AVG(precio) precio_medio, COUNT(*) total_productos, codigo_fabricante
FROM producto
GROUP BY codigo_fabricante
HAVING precio_medio > 200;

#Ejercicio 10
SELECT codigo_fabricante, COUNT(*) total_productos
FROM producto
WHERE precio >= 220
GROUP BY codigo_fabricante
HAVING total_productos > 1;

