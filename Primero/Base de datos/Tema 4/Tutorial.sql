/*Creamos una base de datos sin opciones para modificarla posteriormente*/

CREATE DATABASE IF NOT EXISTS ejemplos;
USE ejemplos;
#-------------------------------
#CREACIÓN DE TABLAS

#Creamos la primera tabla sin claves foraneas

CREATE TABLE consulta(
	cod_consulta	INTEGER			PRIMARY KEY,
	id_medico		INTEGER			NOT NULL,
	fecha				DATE				NOT NULL,
	diagnostico		VARCHAR(200)	NOT NULL,
	id_pac			INTEGER			NOT NULL
);

-- Creamos una tabla, esta vez con las claves foráneas 

CREATE TABLE medico(
	id_medico	INTEGER PRIMARY KEY
);

CREATE TABLE paciente(
	id_pac	INTEGER	PRIMARY KEY
);

CREATE TABLE consulta2(
	cod_consulta	INTEGER,
	num_consulta	INTEGER,
	id_medico		INTEGER			NOT NULL,
	fecha				DATE				NOT NULL,
	diagnostico		VARCHAR(200)	NOT NULL,
	id_pac			INTEGER			NOT NULL,
	CONSTRAINT PRIMARY KEY(cod_consulta,num_consulta),
	CONSTRAINT FOREIGN KEY(id_medico) REFERENCES medico(id_medico),
	CONSTRAINT FOREIGN KEY (id_pac) REFERENCES paciente(id_pac),
	INDEX IN_CONSULTA2_NOM_CONSULTA (num_consulta)
);

# Vuelvo a crear la tabla poniéndole nombre a las restricciones

CREATE TABLE consulta3(
	cod_consulta	INTEGER,
	num_consulta	INTEGER,
	id_medico		INTEGER			NOT NULL,
	fecha				DATE				NOT NULL,
	diagnostico		VARCHAR(200)	NOT NULL,
	id_pac			INTEGER			NOT NULL,
	CONSTRAINT PRIMARY KEY(cod_consulta),
	CONSTRAINT FK_CONSULTA3_MEDICO FOREIGN KEY(id_medico) REFERENCES medico(id_medico),
	CONSTRAINT FK_CONSULTA3_PACIENTE FOREIGN KEY (id_pac) REFERENCES paciente(id_pac),
	INDEX IN_CONSULTA2_NOM_CONSULTA (num_consulta)
);

#--------------------
#MODIFICACIÓN DE TABLAS

-- Añade una columna 
ALTER TABLE consulta2 ADD COLUMN cod_consulta INTEGER;

-- Añade una clave primaria
ALTER TABLE consulta2 ADD CONSTRAINT PRIMARY KEY (cod_consulta);

-- Añado una clave foránea
ALTER TABLE consulta ADD CONSTRAINT FK_consulta_medico FOREIGN KEY (id_medico) REFERENCES medico(id_medico); 

-- Modifica la columna
ALTER TABLE consulta2 MODIFY COLUMN cod_consulta INTEGER(9);

-- Establecer por defecto
ALTER TABLE consulta2 ALTER COLUMN cod_consulta SET DEFAULT 123456789;

-- Borra columna
ALTER TABLE consulta2 DROP COLUMN cod_consulta;


# ----------------------------
-- ELIMINACIÓN DE TABLAS

DROP TABLE consulta2;
DROP TABLE consulta3;

#-----------------------------
-- CREACIÓN DE ÍNDICES

ALTER TABLE consulta ADD COLUMN nom_consulta VARCHAR(100);
CREATE INDEX IN_CONSULTA_NOM_CONSULTA ON consulta (nom_consulta);

#----------------------------
-- BORRADO DE ÍNDICES

DROP INDEX IN_CONSULTA_NOM_CONSULTA ON consulta;

#-----------------------------
-- CREACIÓN DE VISTAS

USE consulta2;

-- Crea la vista llamada vista10 para la columna diagnostico de la tabla consulta2
CREATE VIEW visto10 AS SELECT diagnostico FROM consulta2;

#-----------------------------
-- MODIFICACIÓN DE VISTAS

CREATE OR REPLACE VIEW visto10 AS SELECT fecha FROM consulta2;

#---------------------
#ELIMINACIÓN DE VISTAS

DROP VIEW visto10;

#-----------------------
-- Para ver los usuarios creados
USE mysql;

DESCRIBE USER;

SELECT USER, HOST, PASSWORD FROM USER;

Select USER,HOST from mysql.user;

#-------------------------
# Creamos usuario

-- Por defecto el usuario se crea para cualquier máquina y sin clave
CREATE USER ramon;

-- Para este equipo
CREATE USER ramon@localhost;

-- Usuario con la ip indicada
CREATE USER ramon@172.16.70.238
CREATE USER ramon1@172.16.70.240

-- Usuario que puede usar cualquier máquina le ponemos contraseña
CREATE USER usuari0@'%' IDENTIFIED BY '1941'; 

#--------------------------------
-- Borramos usuario

DROP USER ramon@localhost;

#--------------------------------
-- Renombramos un usuario

RENAME USER ramon@'%' TO ramom;

#------------------------------
-- Cambiamos contraseña al usuario alumno

ALTER USER alumno@localhost IDENTIFIED BY 'nueva_clave';
#--------------------------------
-- Ver los privilegios de un usuario

SHOW GRANTS FOR root@localhost;
SHOW GRANTS FOR ramon;

#---------------------------------
-- Para ver usuario en el que estas

SELECT CURRENT_USER();

#-----------------
-- Dar privilegios

-- Se le dan los permisos indicados en la tabla empleado de farmacia
USE farmacias
GRANT SELECT, INSERT, DELETE, UPDATE ON farmacias.empleado TO ramon;

-- Puede dar permisos a otros usuarios
GRANT SELECT, INSERT, DELETE, UPDATE ON farmacias.empleado TO ramon WITH GRANT OPTION;

-- Usa create user para toda la tabla entera
GRANT CREATE USER *.* ON farmacias.empleado TO ramon;

-- Para actualizar los permisos 
FLUSH PRIVILEGES;

#-----------------------
-- Quitar pemisos

REVOKE SELECT, INSERT ON farmacias.empleado FROM ramon;

-- Quitar permisos sobre todo el sistema
REVOKE ALL ON *.* FROM ramon;

#-------------------------------
#Creación de roles

CREATE ROLE consulta;
GRANT SELECT ON farmacias.* TO consulta;
GRANT consulta TO ramon;

#Activa el rol
SET ROLE consulta;

-- Sacar del rol a un usuario
REVOKE consulta FROM ramon;