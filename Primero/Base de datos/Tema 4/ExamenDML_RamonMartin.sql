USE ejemplos;

#Ejercicio 1
-- +1
SELECT NOMAP nombre_empleado, OFICIO, salario+IFNULL(comision,0) sueldo
FROM empleados
WHERE dep_no = 30 AND salario+IFNULL(comision,0) > 2000
ORDER BY oficio DESC, NOMAP ASC;

#Ejercicio 2
-- +1
SELECT DEP_NO 'número de departamento', MIN(fecha_alta) 'fecha de contratación más antigüa'
FROM empleados
GROUP BY dep_no
ORDER BY DEP_NO;

#Ejercicio 3
-- +1
SELECT MAX(salario+IFNULL(comision,0)) 'sueldo más alto', AVG(salario+IFNULL(comision,0)) 'sueldo medio', MIN(salario+IFNULL(comision,0)) 'sueldo más bajo', COUNT(NOMAP) numeroEmpleados
FROM empleados
WHERE dep_no IN (10,20);

#Ejercicio 4
-- Uso concat para juntar 2 cadenas, primero extraigo el nombre con substring,cogiendo desde la primera posición hasta la posición del espacio, que la averiguamos con position 

SELECT CONCAT(SUBSTRING(nomap,1,POSITION(" " IN nomap)),"*") AS 'nombre empleado', salario 
FROM empleados
WHERE dep_no % 2 = 0;

#Ejercicio 5
-- +1
SELECT nomap nombre_empleado, TIMESTAMPDIFF(YEAR,fecha_alta, CURDATE()) 'Años trabajando en la empresa'
FROM empleados
WHERE TIMESTAMPDIFF(YEAR,fecha_alta, CURDATE()) > 20;

#Ejercicio 6
-- +1
SELECT dep_no numero_departamento, AVG(salario+IFNULL(comision,0)) 'sueldo medio', COUNT(nomap) 'numero de empleados'
FROM empleados
GROUP BY dep_no
HAVING COUNT(nomap) > 2;

#Ejercicio 7
-- +1
SELECT dep_no numero_departamento,SUM(IFNULL(comision,0)) 'Total de comisiones' 
FROM empleados
WHERE dep_no = 30
GROUP BY dep_no;

#Ejercicio 8.1
-- +1
SELECT oficio
FROM empleados
WHERE dep_no != 20 AND dep_no != 30;

#Ejercicio 8.2
SELECT oficio
FROM empleados
WHERE dep_no <> 20 AND dep_no <> 30;

#Ejercicio 9
-- +1
SELECT nomap nombre_empleado, dep_no numero_departamento
FROM empleados
WHERE nomap LIKE '%mar%'
ORDER BY dep_no;

#Ejercicio 10
SELECT AVG(salario) media_salario, dep_no numero_departamento
FROM empleados
WHERE comision IS NULL
GROUP BY dep_no ;
