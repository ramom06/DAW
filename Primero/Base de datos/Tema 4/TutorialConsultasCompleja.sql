#Producto cartesiona de las tablas departamento y empleados

SELECT *
FROM departamentos, empleados;


#Producto cartesiano elgiendo solo algunas columnas
SELECT departamentos.DEP_NO, emp_no
FROM departamentos, empleados;

#Combinación de tablas
SELECT *
FROM departamentos, empleados
WHERE departamentos.DEP_NO = empleados.DEP_NO;

SELECT *
FROM departamentos D, empleados E
WHERE D.DEP_NO = E.DEP_NO;

SELECT nomap
FROM empleados E, departamentos D
WHERE D.DEP_NO = E.DEP_NO AND D.DNOMBRE LIKE 'VENTAS';

#Inner join en la cláusula from
SELECT *
FROM empleados E JOIN departamentos D ON E.dep_no = D.dep_no;

SELECT nomap
FROM empleados E join departamentos D ON E.dep_no = D.dep_no 
WHERE D.DNOMBRE LIKE 'VENTAS';

#Simplificación del inner join cuando coincide el nombre de las columnas
SELECT *
FROM empleados E JOIN departamentos D USING (dep_no);

SELECT nomap
FROM empleados E JOIN departamentos D USING (dep_no)
WHERE D.DNOMBRE = 'VENTAS';

#Natural join
-- Para cuando hay 1 tabla con el mismo nombre pero no más de 1
SELECT *
FROM empleados E NATURAL JOIN departamentos;

SELECT nomap
FROM empleados E NATURAL JOIN departamentos
WHERE departamentos.DNOMBRE = 'VENTAS';


#COMBINACIÓN EXTERNA
SELECT * 
FROM empleados LEFT JOIN departamentos USING (dep_no);

SELECT * 
FROM empleados RIGHT JOIN departamentos USING (dep_no);

#Combinación reflexiva
-- Muestra a los empleados con sus jefes, ordenados por jefes
SELECT E.nomap, J.nomap Jefe
FROM empleados E, empleados J
WHERE E.director = J.emp_no
ORDER BY 2;

