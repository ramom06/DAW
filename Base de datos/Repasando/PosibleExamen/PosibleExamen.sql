#Ejercicio 1
/*Muestra el nombre de empleado, el número de departamento y la extensión telefónica de los empleados que no trabajan en Atocha(subcconsulta).*/
SELECT E.NOMEM, E.NUMDE, E.EXTEL
FROM temple E
WHERE E.NUMDE NOT IN (SELECT D.NUMDE
							FROM tdepto D
							WHERE D.NUMCE IN (SELECT C.NUMCE
														FROM tcentr C
														WHERE C.SENAS LIKE '%Atocha%'));
														
#Ejercicio 2
/*Muestra el nombre de centro, el nombre de departamento, el numero de empleados que trabajen en ese departamento
 de aquellos departamentos que no estén en Alcalá (en BBDD Alcala) Ponle alias alas columnas.*/
SELECT C.NUMCE, D.NUMDE, COUNT(E.NUMEM)
FROM tcentr C JOIN tdepto D USING(NUMCE)
	JOIN temple E ON D.NUMDE = E.NUMDE
WHERE C.SENAS NOT LIKE '%ALCALA%'
GROUP BY C.NOMCE, D.NOMDE;

#Ejercicio 3
/*Modifica el ejercicio anterior para que muestre también los centros donde no hay deoartamentos ni empleados*/
SELECT C.NUMCE, D.NUMDE, COUNT(E.NUMEM)
FROM tcentr C left JOIN tdepto D USING(NUMCE)
	left JOIN temple E ON D.NUMDE = E.NUMDE
WHERE C.SENAS NOT LIKE '%ALCALA%' OR C.SENAS IS NULL
GROUP BY C.NOMCE, D.NOMDE;

#Ejercicio 4
/*Muestra el nombre de los jefes que trabajan en la sede central y que no tienen hijos(subconsulta)*/
SELECT E.NOMEM
FROM temple E
WHERE E.NUMDE IN (SELECT D.NUMDE
						FROM tdepto D 
						WHERE D.NUMCE IN (SELECT C.NUMCE
													FROM tcentr C
													WHERE C.NOMCE LIKE 'SEDE CENTRAL'))
	AND E.NUMHI = 0;
	
#Ejercicio 5
/*Muestra el nombre de jefe y el numero de departamento de aquellos jefes que dependen de otros departamentos
 cuyos empleados ganan menos que los empleados que trabajan en el departamento del no depende nadie(subconsulta)*/
SELECT E.NOMEM, E.NUMDE
FROM temple E
WHERE E.NUMDE NOT IN (SELECT D.NUMDE
								FROM tdepto D
								WHERE D.DEPDE IS NULL)
	AND (IFNULL(E.SALAR,0) + IFNULL(E.COMIS,0)) IN (SELECT (IFNULL(E1.SALAR,0) + IFNULL(E1.COMIS,0))
											FROM tdepto D JOIN temple E1 USING(NUMDE)
											WHERE D.DEPDE IS NULL);

