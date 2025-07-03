USE empresa;

#Ejercicio 1
SELECT NOMDE
FROM tdepto
WHERE DEPDE IN (SELECT NUMDE
						FROM tdepto
						WHERE NOMDE LIKE 'direcc. comercial');
						
#Ejercicio 2
SELECT E.NOMEM, D.NOMDE, C.NOMCE
FROM temple E JOIN tdepto D USING(NUMDE)
	JOIN tcentr C ON D.NUMCE = C.NUMCE
WHERE E.NUMDE IN (SELECT NUMDE 
							FROM tdepto
							WHERE PRESU > 18000);
							
#Ejercicio 3
SELECT SUBSTRING_INDEX(E.NOMEM,' ', -1) nombre
FROM temple E
WHERE E.NUMEM IN (SELECT DIREC
						FROM tdepto
						WHERE numde NOT IN (SELECT ifnull(DEPDE,0)
													FROM tdepto))
ORDER BY 1;

#Ejercicio 4
SELECT SUBSTRING_INDEX(E.NOMEM,' ', -1) nombre, (E.SALAR+IFNULL(E.COMIS,0)) salario_total, E.EXTEL
FROM temple E
WHERE E.NUMDE IN (SELECT NUMDE 
						FROM tdepto
						WHERE NOMDE IN ('PROCESO DE DATOS','DIRECCION GENERAL')
							AND NUMCE IN (SELECT NUMCE
												FROM TCENTR
												WHERE SENAS LIKE '%MADRID%'));
						
#Ejercicio 5
SELECT SUBSTRING_INDEX(D.NOMEM,' ', -1) nombre, D.NUMDE,sum(E.SALAR+IFNULL(E.COMIS,0)) total , 'funciones' Grupo
FROM temple D JOIN temple E ON D.NUMDE = E.NUMDE
WHERE D.NUMEM IN (SELECT DIREC
						FROM tdepto
						WHERE TIDIR LIKE 'f')
GROUP BY 1,2
UNION

SELECT SUBSTRING_INDEX(D.NOMEM,' ', -1), D.NUMDE,sum(E.SALAR+IFNULL(E.COMIS,0)) total, 'propiedad' 
FROM temple D JOIN temple E ON D.NUMDE = E.NUMDE
WHERE D.NUMEM IN (SELECT DIREC
						FROM tdepto
						WHERE TIDIR LIKE 'p')
GROUP BY 1,2
ORDER BY 1,2;