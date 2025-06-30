USE empleados;

-- muestra productos, e indica id_fab, id_producto, descripción, precio y precio con IVA.
SELECT id_fab, id_producto, precio, precio* 0.21 "precio con IVA incluido" FROM producto; 

-- Muestra de cada pedido numero de pedido, fabricante, producto, cantidad e importe.
SELECT num_pedido,fab,producto,cantidad, importe FROM pedido;

-- Muestra para cada empleado nombre, días trabajados y año de nacimiento
SELECT nombre, DATEDIFF(CURRENT_DATE(),contrato) "dias trabajados", YEAR(NOW()) - edad "año de nacimiento FROM empleado;

-- Muestra clientes en orden alfabético, agrupados por el código de su representante
SELECT * FROM cliente ORDER BY repclie;

#Ejercicio 5
-- Muestra las oficinas  por orden alfabético de región y dentro de cada región por ciudad, si hay una oficina en la misma ciudad, aparece la que tenga mayor numero de oficina
SELECT * FROM oficina ORDER BY region, ciudad, oficina;

#Ejercicio 6
-- Muestra pedidos ordenador por sus fechas
SELECT * FROM pedido ORDER BY fecha_pedido;

#Ejercicio 7
-- Muestra pedidos de Marzo
SELECT * FROM pedido WHERE MONTH(fecha_pedido) = 3;

#Ejercicio 8
-- Los numeros de los empleados que tienen oficinas asignadas
SELECT numempl FROM empleado WHERE oficina IS NOT NULL;

#Ejercicio 9
-- Muestra el numero de la oficina que no tiene director
SELECT oficina FROM oficina WHERE dir IS NOT NULL;

#Ejercicio 10
-- Muestra todo de las oficinas de regiones norte y este apareciendo primero norte
SELECT * FROM oficina WHERE region LIKE "norte" OR region LIKE "este" ORDER BY region DESC;

#Ejercicio 11
-- Muestra los empleados que se llaman Juan
SELECT * FROM empleado WHERE nombre LIKE 'Juan%';

#Ejercicio 12
-- Muestra los productos que su id termina por x
SELECT * FROM producto WHERE id_producto LIKE "%x";

#Ejercicio 13
-- Muestra el precio medio de los productos
SELECT AVG(precio) AS "precio medio"  FROM producto;

#Ejercicio 14
-- Muestra el precio media de los productos de los que hay existencias
SELECT AVG(precio) AS "precio medio"  FROM producto WHERE existencias > 0;

#Ejercicio 15
-- Muestra el precio medio de los productos de los frabicantes aci o bic y que además haya existencias en el almacén 
SELECT AVG(precio) AS "precio medio"  FROM producto WHERE id_fab LIKE 'aci' OR id_fab LIKE 'bic' && existencias > 0;

#Ejercicio 16
-- Muestra el numeros de oficinas en la compañia
SELECT COUNT(oficina) FROM oficina;

#Ejercicio 17
-- Muestra el numero de empleados con n ventas mayores que 150000
SELECT COUNT(numempl) FROM empleado WHERE ventas > 150000;

#Ejercicio 18
-- Muestra el numero de clientes que representa el empleado 101
SELECT COUNT(numclie) FROM cliente WHERE repclie = 101;

#Ejercicio 19
-- Muestra el mayor crédito
SELECT MAX(limite_credito) FROM cliente;

#Ejercicio 20
-- Muestra el mayor y menor importe en las ventes de los empleados
SELECT MAX(ventas), MIN(ventas) FROM empleado;

#Ejercicio 21
-- Ventas totales de los empleados
SELECT SUM(ventas)FROM empleado;

#Ejercicio 22
-- Ventas totales de los empleados de las oficinas 11 y 12.
SELECT SUM(ventas) FROM empleado WHERE oficina = 11 OR oficina = 12;

#Ejercicio 23
-- Cuota y venta media de los empleados
SELECT AVG(cuota) 'cuota media' , AVG(ventas) 'venta media' FROM empleado;

#Ejercicio 24
-- Muestra el importe medio de un pedido, el importe total de todos los pedidos y el precio medio de venta
SELECT AVG(importe) 'importe medio de un pedido', SUM(importe) 'importe total', importe/cantidad 'precio medio de venta' FROM pedido;

#Ejercicio 25
-- Muestra el precio medio de los productos fabricados por aci
SELECT AVG(precio) 'precio medio' FROM producto WHERE id_fab LIKE 'aci';

#Ejercicio 26
-- Muestra el importe total de los pedidos hechos por Vicente Pantalla con id 105
SELECT SUM(codigo) 'total de pedidos' FROM pedido WHERE rep = 105;

#Ejercicio 27
-- Muestra el numero de pedidos de mas de 25000 euros
SELECT COUNT(codigo)FROM pedido WHERE IMPORTE > 25000;