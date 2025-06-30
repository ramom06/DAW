USE empleados;

-- UNIÓN

#Ejemplo 1: Uno una tabla consigo misma, usando los mismos campos
SELECT nombre, oficina FROM empleado WHERE oficina = 12
UNION
SELECT nombre , oficina FROM empleado WHERE oficina = 11;

#Ejemplo 2: Uno una tabla consigo misma, usando distintos campos
SELECT numempl FROM empleado 
UNION
SELECT jefe FROM empleado
ORDER BY numempl;

#Ejemplo 3: Repetimos la consutla mostrandos los resultados repetidos
SELECT numempl FROM empleado
UNION ALL
SELECT jefe FROM empleado
ORDER BY numempl;

#Ejemplo 4: Uno una tabla con otra distinta
SELECT nombre FROM cliente
UNION
SELECT nombre FROM empleado;

#Ejemplo 5: Añade una columna indicando qué es cada cosa
SELECT nombre, "Cliente"rol FROM cliente
UNION 
SELECT nombre, "Empleado" FROM empleado
ORDER BY nombre;

-- INTERSECCIÓN

#Ejemplo 1: muestra los empleados de la oficina 12 que han realizado algún pedido
SELECT numempl FROM empleado WHERE oficina = 12
intersect
SELECT rep FROM pedido;

#Ejemplo 2; Muestra los empleados que trabajen como representantes y vendan más de 350000
SELECT numempl FROM empleado WHERE titulo LIKE 'REPRESENTANTE'
intersect
SELECT numempl FROM empleado WHERE ventas > 35000;


-- DIFERENCIA

#Ejemplo 1: Clientes que no han hecho pedidos
SELECT numclie FROM cliente
EXCEPT
SELECT cliente FROM pedido
ORDER BY numclie;