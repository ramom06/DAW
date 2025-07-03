USE empresa;

#Ejercicio 1
-- Muestra el nombre del empleado, el número de departamento y la extensión
-- telefonica de los empelados que NO trabajan en Atocha, 1pt (Subconsulta)
SELECT NOMEM, NUMDE, EXTEL
FROM temple
WHERE numde NOT IN (SELECT numde
							FROM tdepto 
							WHERE numce IN (SELECT numce
													FROM tcentr
													WHERE senas LIKE '%atocha%'));
													
#Ejercicio 2
-- Muestra el nombre del centro, el nombre del departamento, el número de empelaldos que trabajan
-- en ese departamento de aquellos departamentos que no estén en Alcalá (en BBDD Alcala). 
-- Ponle alias a las columnas (1pt)
SELECT C.NOMCE 'nombre centro', D.NOMDE 'nombre departamento', COUNT(E.NUMEM) 'número empleados'
FROM tcentr C JOIN tdepto D USING(numce)
	JOIN temple E USING(numde)
WHERE C.SENAS NOT LIKE '%alcala%'
GROUP BY 1,2;

#Ejercicio 3
--  Modifica el ejercicio anterior para que muestre tambien los centro donde no hay departamentos ni empleados (1pt)
SELECT C.NOMCE 'nombre centro', D.NOMDE 'nombre departamento', COUNT(E.NUMEM) 'número empleados'
FROM tcentr C left JOIN tdepto D USING(numce)
	left JOIN temple E USING(numde)
WHERE C.SENAS NOT LIKE '%alcala%'
GROUP BY 1,2;

#Ejercicio 4
-- Muestra el nombre de los jefes que trabajan en la sede central y que no tienen hijos) 1pt) (subconsulta)
SELECT E.NOMEM
FROM temple E
WHERE E.NUMEM IN (SELECT DIREC
							FROM tdepto
							WHERE numce = (SELECT NUMCE 
													FROM tcentr
													WHERE NOMCE LIKE 'sede central'))
	AND E.NUMHI = 0;
	
#Ejercicio 5
-- Muestra el nombre de jefe y el número de departamento de aquellos jefes que dependen de otros departamentos 
-- cuyos empleados ganan menos que los empleados que trabajan
--  en el departamento del que no depende nadie (2pts) (subconsulta) (4 Filas)
SELECT E.NOMEM, E.NUMDE
FROM temple E
WHERE E.NUMEM IN (SELECT DIREC
							FROM tdepto
							WHERE DEPDE IN (SELECT NUMDE
													FROM temple
													GROUP BY NUMDE
													having SUM(SALAR+IFNULL(COMIS,0)) < (SELECT SUM(SALAR+IFNULL(COMIS,0))
																								FROM temple
																								WHERE NUMDE = (SELECT numde
																														FROM tdepto
																														WHERE DEPDE IS NULL))));
																														
#Ejercicio 6
-- Muestra el nombre del centro, el nombre del deparatmento, el nombre del jefe del  departamento 
-- y el nombre del empleado donde los directores en propiedad, añadiendo una columna llamada "preferencia" 
-- que diga "preferencia mañana" para aquellos empleados que tengan hijos, y "sin preferencia" 
-- para aquellos empleados que no tengan hijos. 
#Usa alias para todas las columnas. Ordénalos por nombre de centro, nombre de departamentos, nombre de director y nombre de empleado. 
-- No puedes apoyarte en estructuras auxiliares para resolver el ejercicio. (2pts
SELECT C.NOMCE 'nombre centro', D.NOMDE 'nombre departamento', J.NOMEM 'nombre jefe', E.NOMEM 'nombre empleado', 'preferencia mañana' preferencia
FROM tcentr C JOIN tdepto D USING(numce)
	JOIN temple J ON D.DIREC = J.NUMEM
	JOIN temple E ON E.NUMDE = D.NUMDE
WHERE D.TIDIR LIKE 'P' 
	AND E.NUMHI > 0
	
UNION 

SELECT C.NOMCE, D.NOMDE, J.NOMEM, E.NOMEM, 'Sin preferencia'
FROM tcentr C JOIN tdepto D USING(numce)
	JOIN temple J ON D.DIREC = J.NUMEM
	JOIN temple E ON E.NUMDE = D.NUMDE
WHERE D.TIDIR LIKE 'P' 
	AND E.NUMHI = 0
ORDER BY 1,2,3,4;

#Ejercicio 7
-- Muestra el apellido y el nombre del empleado, separado en columnas, los años trabjados y el número de hijos
-- de aquellos trabjadores que están en el  departamento de " PERSONAL" U " ORGANIZACION" 
-- y cuyo departamento está en Madrid (2pts) Subconsulta. 5 filas
SELECT TRIM(SUBSTRING_INDEX(E.NOMEM, ',', 1)) apellido, TRIM(SUBSTRING_INDEX(E.NOMEM, ',', -1)) nombre, TIMESTAMPDIFF(year,E.FECIN,CURDATE()) años_trabajados, E.NUMHI
FROM temple E
WHERE numde IN (SELECT numde
						FROM tdepto
						WHERE NOMDE LIKE 'personal' OR NOMDE LIKE 'organizacion'
							AND numce IN (SELECT numce
												FROM tcentr
												WHERE senas LIKE '%madrid%'));

