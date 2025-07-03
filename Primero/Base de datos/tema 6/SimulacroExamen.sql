USE empresa2;

#Ejercicio 1
INSERT INTO empleados VALUES(7950,"Marcos Garcia", "VENDEDOR",7698,"2015-02-15",1400,400,30), 
								(7951,"Julia Palma", "VENDEDOR",7698,"2015-02-15",1400,300,30);
								
#Ejercicio 2
CREATE OR REPLACE TABLE ProductosClientes SELECT C.NOMBRE, P.PEDIDO_NO, PR.DESCRIPCION, P.UNIDADES, P.FECHA_PEDIDO
											FROM clientes C JOIN pedidos P ON C.CLIENTE_NO = P.CLIENTE_NO
																	JOIN productos PR ON P.PRODUCTO_NO = PR.PRODUCTO_NO
											WHERE C.VENDEDOR_NO IN (SELECT EMP_NO
																				FROM empleados
																				WHERE DEP_NO IN (SELECT DEP_NO
																										FROM departamentos
																										WHERE LOCALIDAD LIKE '%madrid%'));
																										
#Ejercicio 3
CREATE OR REPLACE VIEW departs
	AS SELECT D.DEP_NO, D.DNOMBRE, COUNT(E.EMP_NO)
		FROM departamentos D JOIN empleados E
		GROUP BY 1,2;
		
#Ejercicio 4
UPDATE empleados SET comision = 10 * TIMESTAMPDIFF(YEAR,empleados.FECHA_ALTA,CURDATE()) 
WHERE COMISION IS NULL;

#Ejercicio 5
BEGIN;
DELETE FROM empleados WHERE salario < (SELECT AVG(SALARIO) FROM empleados) 
								AND TIMESTAMPDIFF(YEAR,empleados.FECHA_ALTA,CURDATE()) > 40;
ROLLBACK;