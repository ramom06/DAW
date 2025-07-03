#INSERCIONES

CREATE or replace DATABASE EJEMPLOS2;

CREATE TABLE departamento(
	codigo	INTEGER(3)	PRIMARY KEY,
	nombre	VARCHAR(15)	NOT NULL);
	
	CREATE TABLE empleado(
	codigo 		INTEGER		PRIMARY KEY,
	dni			CHAR(9)		UNIQUE,
	nombre		VARCHAR(20)	NOT NULL,
	apellidos 	VARCHAR(40)	NOT NULL,
	direccion	VARCHAR(100),
	fecha_alta	DATE,
	telefono		INTEGER(9),
	cod_dep		INTEGER(3)	REFERENCES 	departamento(codigo) ON DELETE SET NULL);
	
#Insertamos sobre todos los campos de la tabla
INSERT INTO departamento VALUES(10,"RRHH");
INSERT INTO empleado VALUES(1,"111111A","Marta","García","C/Islas Canarias","2005-02-03",NULL,NULL);

#Insertamos indicando algunos valores
INSERT INTO empleado (codigo,nombre,apellidos) VALUES(2,"MARGA","JURADO");

#Insertamos varias filas al mismo tiempo
INSERT INTO empleado (codigo,nombre,apellidos) 
	VALUES(3,"Mario","Vargas"),
			(4,"Cristobal","Velazquez");
			
#Violación de clave primaria
INSERT INTO empleado (codigo,nombre,apellidos) 
	VALUES(2,"Juan","Silva");
	
#Violación de clave foránea
INSERT INTO empleado VALUES(9,"22222222r","Pablo","Lopez",NULL,"2004-04-05",NULL,50);

#Violación de nulos
INSERT INTO empleado (codigo,nombre) VALUES(7,"Rosa");

#INSERCIÓN DE DATOS CON SELECT
USE ejemplos;

CREATE OR REPLACE TABLE vendedores(
	emp_no		INT(4)		PRIMARY KEY,
	nomap			VARCHAR(30),
	salario		FLOAT(6,2),
	comision		FLOAT(6,2),
	dep_no		INT(2),
	CONSTRAINT FK_VEND_DEP_NO FOREIGN KEY(DEP_NO) REFERENCES departamentos(dep_no));
	
INSERT INTO vendedores SELECT emp_no,nomap,salario,comision,dep_no
								FROM empleados
								WHERE oficio="VENDEDOR";
								
INSERT INTO vendedores (emp_no,nomap,salario,comision,dep_no)
	SELECT emp_no,nomap,salario,comision,dep_no
	FROM empleados
	WHERE oficio="Analista";
	
#Creamos tabla con un select
CREATE TABLE vendedores2 SELECT emp_no,nomap,salario,comision,dep_no
								FROM empleados
								WHERE oficio="VENDEDOR";
								