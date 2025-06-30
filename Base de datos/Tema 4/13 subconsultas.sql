USE ejemplos;

#Ejercico 1
SELECT E.*
FROM empleados E JOIN clientes C ON C.VENDEDOR_NO = E.EMP_NO
GROUP BY E.NOMAP;

#Ejercicio 2
SELECT C.*
FROM clientes C JOIN pedidos P USING(cliente_no)
WHERE P.UNIDADES >= 3;

#Ejercicio 3
SELECT P.*
FROM productos P 
GROUP BY P.PRODUCTO_NO
HAVING AVG(P.STOCK_DISPONIBLE) > (SELECT AVG(PE.unidades)
												FROM pedidos PE);
												
#Ejercicio 4
SELECT E.*
FROM empleados E
WHERE (E.SALARIO + E.COMISION) > (SELECT AVG(E1.SALARIO + E1.COMISION)
												FROM empleados E1
												WHERE E.OFICIO = E1.oficio)
GROUP BY E.EMP_NO;

#Ejercicio 5
SELECT C.*
FROM clientes C
WHERE C.VENDEDOR_NO IN (SELECT EMP_NO
								FROM empleados
								WHERE NOMAP LIKE '%alonso%');
						
#Ejercicio 6
SELECT SUBSTRING(E.NOMAP, POSITION(" " IN E.NOMAP)+1), E.OFICIO
FROM empleados E
WHERE E.DEP_NO IN (SELECT D.DEP_NO
							FROM departamentos D
							WHERE D.DNOMBRE LIKE 'ventas');
							
#Ejercicio 7
SELECT C.*
FROM clientes C JOIN pedidos P USING(cliente_no)
	JOIN productos PR ON P.PRODUCTO_NO = PR.PRODUCTO_NO
WHERE PR.DESCRIPCION LIKE 'SILLA DIRECTOR MOD. BUFALO';

#Ejercicio 8
SELECT PR.*
FROM productos PR left JOIN pedidos P USING(producto_no)
WHERE P.PEDIDO_NO IS NULL;

#Ejercicio 9
SELECT E.*
FROM empleados E
WHERE E.SALARIO = (SELECT MAX(SALARIO)
							FROM empleados E1
							WHERE E.DEP_NO = E1.DEP_NO);
							
#Ejercicio 10
SELECT D.*
FROM departamentos D
WHERE D.DEP_NO = (SELECT E.DEP_NO
    					FROM empleados E
    					GROUP BY E.DEP_NO
    					ORDER BY SUM(E.SALARIO + E.COMISION) DESC
    					LIMIT 1);
    					
#Ejercicio 11
SELECT C.*
FROM clientes C
WHERE C.VENDEDOR_NO IN (SELECT E.EMP_NO
    							FROM empleados E
    							WHERE (E.SALARIO + E.COMISION) = (SELECT MIN(E1.SALARIO + E1.COMISION)
        																		FROM empleados E1
        																		WHERE E1.DEP_NO = E.DEP_NO));
						