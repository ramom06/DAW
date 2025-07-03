USE empresa;

#Ejercicio 1
SELECT E.NOMEM nombre_empleado, E.NUMDE número_departament, E.EXTEL extensión_tel
FROM temple E
WHERE E.NUMDE IN (SELECT NUMDE
								FROM tdepto
								WHERE numce IN (SELECT numce
														FROM tcentr
														WHERE senas LIKE '%atocha%'));

#Ejercicio 2
SELECT C.NOMCE AS 'nombre del centro', D.NOMDE AS 'nombre del departamento', COUNT(E.NUMEM) numero_empleados
FROM tcentr C JOIN tdepto D USING(NUMCE)
	JOIN temple E USING(NUMDE)
WHERE C.SENAS NOT LIKE '%alcala%'
GROUP BY 1,2;

#Ejercicio 3
SELECT C.NOMCE AS 'nombre del centro', D.NOMDE AS 'nombre del departamento', COUNT(E.NUMEM) número_empl
FROM tcentr C JOIN tdepto D USING(NUMCE)
	LEFT JOIN temple E USING(NUMDE)
WHERE C.SENAS NOT LIKE '%alcala%' OR C.SENAS IS NULL
GROUP BY 1,2;

#Ejercicio 4
SELECT J.NOMEM
FROM temple J
WHERE J.NUMEM IN (SELECT DIREC
						FROM tdepto
						WHERE NUMCE IN (SELECT NUMCE
												FROM tcentr
												WHERE nomce LIKE 'sede central'))
	AND numhi = 0;

#Ejercicio 5
SELECT J.NOMEM, J.NUMDE
FROM temple J
WHERE J.NUMEM IN (SELECT DIREC
						FROM tdepto
						WHERE DEPDE IN (SELECT NUMDE 
												FROM temple
												GROUP BY NUMDE
												HAVING SUM(SALAR+IFNULL(COMIS,0)) < (SELECT SUM(SALAR+IFNULL(COMIS,0))
																			FROM temple
																			WHERE NUMDE IN (SELECT NUMDE
																									FROM tdepto 
																									WHERE DEPDE IS NULL))));

#Ejercicio 6
SELECT  C.NOMCE AS 'nombre del centro', D.NOMDE AS 'nombre del departamento', J.NOMEM AS 'nombre jefe', E.NOMEM AS 'nombre empleado', 'Preferencia mañana' Preferencia
FROM tcentr C JOIN tdepto D USING(NUMCE)
	JOIN temple J ON D.DIREC = J.NUMEM
	JOIN temple E ON D.NUMDE = E.NUMDE
WHERE D.TIDIR LIKE 'P'
	AND E.NUMHI > 0
	
UNION 

SELECT C.NOMCE, D.NOMDE, J.NOMEM, E.NOMEM, 'Sin preferencia' Preferencia
FROM tcentr C JOIN tdepto D USING(NUMCE)
	JOIN temple J ON D.DIREC = J.NUMEM
	JOIN temple E ON D.NUMDE = E.NUMDE
WHERE D.TIDIR LIKE 'P'
	AND E.NUMHI = 0
ORDER BY 1,2,3,4;

#Ejercicio 7
SELECT TRIM(SUBSTRING_INDEX(E.NOMEM, ',', 1)) apellido, TRIM(SUBSTRING_INDEX(E.NOMEM, ',', -1)) nombre,
	TIMESTAMPDIFF(YEAR,E.FECIN,CURDATE()) años_trabajados, NUMHI numero_hijos
FROM temple E
WHERE E.NUMDE IN (SELECT NUMDE
						FROM tdepto
						WHERE NOMDE LIKE 'PERSONAL' OR NOMDE LIKE 'ORGANIZACIÓN'
							AND numce IN (SELECT NUMCE 
												FROM tcentr
												WHERE senas LIKE '%madrid%'));
