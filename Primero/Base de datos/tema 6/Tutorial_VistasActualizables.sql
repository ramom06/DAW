#VISTAS ACTUALIZABLES

#Creo vista e inserto una fila
CREATE OR REPLACE VIEW v_empleados AS
	SELECT * FROM empleados;
	
INSERT INTO v_empleados (emp_no,nomap) VALUES(800,"Jose Medina");

#Creo una vista con check option
CREATE OR REPLACE VIEW v_empleados_check AS
	SELECT *
	FROM empleados
	WHERE oficio LIKE 'vendedor';
	
INSERT INTO v_empleados_check (emp_no,nomap,oficio) VALUES(1,"Pepe reina","Analista");

#Modifico la vista con check option
CREATE OR REPLACE VIEW v_empleados_check AS
	SELECT *
	FROM empleados
	WHERE oficio LIKE 'vendedor'
	WITH CHECK OPTION;
	
INSERT INTO v_empleados_check (emp_no,nomap,oficio) VALUES(33,"Pepe reina","Analista");


