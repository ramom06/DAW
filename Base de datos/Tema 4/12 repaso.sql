#Ejercicio 1
SELECT NOMEM, NUMEM, EXTEL, numde
FROM temple
WHERE NUMDE = 121
ORDER BY NOMEM DESC;

#Ejercicio 2
SELECT SALAR, NOMEM
FROM temple
WHERE numhi = 0
ORDER BY salar DESC, nomem;

#Ejercicio 3
SELECT SALAR+30 salario, NOMEM, NUMHI
FROM temple
WHERE numhi = 1

UNION 

SELECT SALAR + 60 salario, NOMEM, NUMHI
FROM temple
WHERE numhi = 2

UNION 

SELECT SALAR + 90 salario, NOMEM, NUMHI
FROM temple
WHERE numhi >= 3
ORDER BY NOMEM;

#Ejercicio 4
SELECT NOMEM,COMIS,NUMDE
FROM temple
WHERE NUMDE = 110 
	AND comis IS NOT null
ORDER BY NOMEM;

#Ejercicio 5
SELECT COUNT(*), AVG(PRESU)
FROM tdepto;

#Ejercicio 6
SELECT SUM(SALAR+COMIS) * 14 'masa salarial anual'
FROM temple;

#Ejercicio 7
SELECT COUNT(*)
FROM temple
WHERE YEAR(CURRENT_DATE()) = YEAR(FECIN);

#Ejercicio 8
SELECT MAX(SALAR) - MIN(SALAR) 'Diferencia entre maximo y minimo salario'
FROM temple; 

#Ejercicio 9
SELECT NUMDE,numhi,COUNT(*) numero_empleados
FROM temple
GROUP BY NUMDE, NUMHI
ORDER BY NUMDE, NUMHI;

#Ejercicio 10
SELECT NUMDE , COUNTE(eXTEL)
FROM temple
GROUP BY NUMDE
having AVG(SALAR) > 1800;

#Ejercicio 11
SELECT *
FROM temple
WHERE NUMde NOT IN (102,121)
ORDER BY NUMEM;



