USE empresa;

#Ejecicio 1
SELECT AVG(TIMESTAMPDIFF(YEAR, FECNA, CURRENT_DATE())) promedio_edad, AVG(SALAR) salario_medio, 'Tiene comisión' Comision 
	FROM temple 
	WHERE COMIS IS NULL
UNION
SELECT AVG(TIMESTAMPDIFF(YEAR, FECNA, CURRENT_DATE())) promedio_edad, AVG(SALAR+comis) salario_medio, 'No tiene comisión' 
	FROM temple 
	WHERE COMIS IS not NULL;

#Ejercicio 2
SELECT NOMEM, SALAR/IFNULL(NUMHI, 0) 'Cociente entre su salario y sus hijos', 'Con hijos' hijos 
	FROM temple 
	WHERE COMIS IS NULL AND NUMHI >= 1
UNION
SELECT NOMEM, SALAR 'Salario', 'Sin hijos'
	FROM temple
	WHERE COMIS IS NULL and NUMHI <= 0
	ORDER BY NOMEM;

#Ejercicio 3
SELECT NOMDE nombre, NULL "departamento dependiente", '0' Nivel_dependencia
	FROM tdepto
	WHERE DEPDE IS NULL
UNION
SELECT D1.NOMDE nombre, D2.NOMDE "departamento dependiente", '1' Nivel_dependencia
	FROM tdepto D1, tdepto D2
	WHERE D1.DEPDE = D2.NUMDE
	AND D2.DEPDE IS NULL
UNION
SELECT d1.NOMDE nombre,D2.NOMDE "departamento dependiente", '2' Nivel_dependencia
	FROM tdepto D1, tdepto D2, tdepto D3
	WHERE D1.DEPDE = D2.NUMDE
	AND D2.DEPDE = D3.NUMDE
	AND D3.DEPDE IS NULL
ORDER BY nombre;
	
	




