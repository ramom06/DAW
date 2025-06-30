USE empresa;

#Ejercicio 1
CREATE OR REPLACE TABLE PERSONAL SELECT E.NOMEM nombre, E.EXTEL extension, E.NUMDE departamento, DIREC.NUMEM director
												FROM temple E JOIN tdepto D USING(NUMDE)
													JOIN temple DIREC ON D.DIREC = DIREC.NUMEM
												WHERE D.NOMDE LIKE 'personal';
												
SELECT * FROM personal;

#Ejercicio 2
CREATE OR REPLACE VIEW DEP_CENTROS AS
	SELECT C.NUMCE numero_centro, C.NOMCE nombre_centro, D.NUMDE numero_dep, D.NOMDE nombre_dep
	FROM tcentr C JOIN tdepto D USING(NUMCE)
	ORDER BY 1,3;
	
#Ejercicio 3
UPDATE tdepto SET PRESU = (SELECT AVG(PRESU) 
									FROM tdepto D JOIN tcentr C USING(numce) 
									WHERE C.SENAS LIKE '%ATOCHA%') 
					WHERE NOMDE LIKE 'FINANZAS';

#Ejercicio 4
UPDATE tdepto SET PRESU = PRESU + (SELECT PRESU - (SELECT PRESU FROM tdepto WHERE NOMDE LIKE 'personal')
												FROM tdepto
												WHERE NOMDE LIKE 'organizacion')
					WHERE NOMDE LIKE 'finanzas';
									
#Ejercicio 5
INSERT INTO tcentr VALUES(30,"I+D","C.Granada,30,Madrid"),
						(40,"PROMOCION","C.Kentia,10,Madrid");

#Ejercicio 6
BEGIN;
DELETE FROM temple;
SELECT * FROM temple;
ROLLBACK;