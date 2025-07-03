#-----------------
-- Ejemplo de ALL y DISTINCT
USE ejemplos;
-- ALL por defecto
SELECT oficio FROM empleados;

-- Vemos todo lo que no sea oficio
SELECT DISTINCT oficio FROM empleados;

#-----------------------
-- Ejemplo de selección de columna

-- Seleccionamos todas las columnas
SELECT * FROM empleados;

-- Muestra el nombre y el oficio de los empleados
SELECT nomap, oficio FROM empleados;

-- Select con una expresión
SELECT salario+comision FROM empleados;

-- Lo muestra con otro nombre en la tabla
SELECT salario+comision AS sueldo_total FROM empleados;

-- AS es opcional, por que así funciona igual
SELECT salario+comision sueldo_total FROM empleados;

-- Se puede escribir con espacios en blanco también entre comillas
SELECT salario+comision "sueldo total" FROM empleados;

#------------------------------------
-- Ejemplos de consultas

-- En todas las columnas de la tabla empleados quien sea director en la columna de oficio
SELECT * FROM empleados;
WHERE oficio = "DIRECTOR";

-- En todas las columnas de la tabla empleados quien no sea director en la columna de oficio
SELECT * FROM empleados
WHERE oficio <> "DIRECTOR";

SELECT * FROM empleados
WHERE oficio != "DIRECTOR";

-- En todas las columnas de la tabla empleados quien tenga un sueldo mayor a 1500
SELECT * FROM empleados
WHERE salario > 1500;

-- En todas las columnas de la tabla empleados quien tenga un sueldo + comisión mayor a 3000
SELECT * FROM empleados
WHERE salario+comision > 3000;

-- En todas las columnas de la tabla empleados quien tenga un sueldo + comisión mayor a 3000
-- Si la comisión es nula vale 0
SELECT * FROM empleados
WHERE salario+IFNULL(comision,0) > 3000; 

#---------------------
-- Ejemplos between

-- En todas las columnas de la tabla empleados quien tengo un sueldo entre 1000 y 3000
SELECT * FROM empleados
WHERE salario >= 1000 AND salario <= 3000;

SELECT * FROM empleados
WHERE salario BETWEEN 1000 AND 3000;

#---------------------
-- Ejemplos de IN

-- Devuelve directores y vendedores
SELECT * FROM empleados
WHERE oficio IN ("DIRECTOR", "VENDEDOR");

SELECT * FROM empleados
WHERE oficio = "DIRECTOR" OR oficio = "VENDEDOR");

-- Devuelve los no directores y vendedores
SELECT * FROM empleados
WHERE oficio NOT IN ("DIRECTOR", "VENDEDOR");

#---------------------
-- Ejemplos de like

-- Personas que su nombre empieza por M
SELECT * FROM empleados
WHERE nomap LIKE "M%";

-- Personas que en su nombre tengan una G
SELECT * FROM empleados
WHERE nomap LIKE "%G%";

#--------------------
-- Operadores aritméticos -ifnull

-- No funciona, por que da nulo cuand la comisión es nula
SELECT nomap salario+comision FROM empleados;

-- Cambiar los nulos que salgan por 0
SELECT nomap salado+IFNULL(comision,0) FROM empleados;
SELECT nomap salado+COALESCE(comision,0) FROM empleados;

#----------------------------
-- Operadores relacionales

-- Comparaciones con null = null
SELECT 10 = NULL;
SELECT 10 = 10;
SELECT 10 <> NULL;
SELECT 10 > NULL;

-- No da resultados auténticos
SELECT apellidos FROM empleado WHERE comision = NULL;

-- Esto si da los resulados son los esperados
-- Las filas en las que comision sea nula
SELECT nomap FROM empleado WHERE comision IS NULL;

-- Esto si da los resulados son los esperados
-- Las filas en las que comision no sea nula
SELECT nomap FROM empleado WHERE comision IS NOT NULL;

#-------------------------------
-- Operadores lógicos

SELECT nomap,comision,dep_no FROM empleados WHERE comision IS NULL OR dep_no > 10;

SELECT nomap,comision,dep_no FROM empleados WHERE comision IS NULL || dep_no > 10;

#-------------------------------
-- Operador COALESCE

SELECT nomap, salario+COALESCE(comision,0) FROM empleados;

#-------------------------------
-- FUNCIONES

-- Para seleccionar fecha inicial
SELECT CURRENT_DATE();

-- Hora actual
SELECT CURRENT_TIME();

-- Fecha y hora actual
SELECT CURRENT_TIMESTAMP();

-- Valor absoluto
SELECT ABS();

-- Devuelve la longitud de una cadena
SELECT CHAR_LENGTH();

-- Devuelte la posición en la cadena
SELECT POSITION("h" IN "holanda");

-- Potencias 5^2
SELECT POWER(5,2)

-- Raíz cuadrada
SELECT SQRT(4);

-- Tranforma texto en minúsculas
SELECT LOWER();

-- Transforma el texto en mayúscula
SELECT UPPER();

-- Extrae una subcadena
-- Desde e carácter 6, 8 en adelante
SELECT SUBSTRING('empleado', 2, 6);

-- muestra los dias de diferencia entre 2 fechas
DATEDIFF(fecha1, fecha2);

-- Muestra el año actual
YEAR(NOW());

-- Muestra el mes de una fecha
MONTH();

-- Muestra la Media
SELECT AVG();

-- Redondea al número de cifras indicado
SELECT ROUND(dato, 2);

#------------------------
-- Ordenar por 

-- Orden ascendente
SELECT nomap, salario FROM empleado ORDER BY salario;

-- Orden descendente
SELECT nomap, salario FROM empleado ORDER BY salario DESC;

-- Ordena por salario de manera descendente, y si las salarios son similares lo ordena por numera de dep
SELECT nomap, salario,dep_no FROM empleados ORDER BY salario, dep_no DESC;

#-----------------------------
-- Funciones de columnas

-- Contar numero de tuplas
SELECT COUNT(*) FROM empleados;

-- Cuidado si el campo acepta nulos
SELECT COUNT(emp_no) FROM empleados;

SELECT COUNT(emp_no) FROM empleados WHERE dep_no = 10;

-- Devuelve el máximo
SELECT MAX(salario) FROM empleados;

-- Devuelve la suma de la columna
SELECT SUM(salario)FROM empleados;

-- Años de diferencia entre una pecha y la actual
TIMESTAMPDIFF(YEAR,fecha, CURDATE())

#-----------------------
-- GROUP BY

-- Salario máximo de cada empleado
SELECT dep_no, MAX(salario) "salario maximo" FROM empleados GROUP BY dep_no;

-- Salario maximo de cada grupo de empleados de cada departamento
SELECT dep_no, oficio, MAX(salario) "salario maximo" FROM empleados GROUP BY dep_no, oficio;

#--------------------------
-- Having

-- Establece condiciones en las filas agrupadas
SELECT dep_no, MAX(salario) "salario maximo" FROM empleado GROUP BY dep_no HAVING salario_maximo > 3500;

-- No confundir con establecer condiciones en el where, que se ejercuta antes de realizar la agrupación
SELECT dep_no, MAX(salario) "salario maximo" FROM empleados WHERE dep_no!=10 GROUP BY dep_no;

 