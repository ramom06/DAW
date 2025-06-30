USE DAW;

CREATE TABLE creadaporInv(
	nombre CHAR(20)	PRIMARY key
	);
	
	SELECT CURRENT_USER();

CREATE INDEX ON_PERSONA_NOMBRE_APELLIDO ON personal(nombre, apellidos);
ALTER TABLE personal ADD COLUMN DNI CHAR(9) UNIQUE;
DROP INDEX ON_PERSONA_NOMBRE_APELLIDO ON personal;
CREATE VIEW personal_juego AS SELECT DNI, nombre, apellidos, fecNacimiento FROM personal;