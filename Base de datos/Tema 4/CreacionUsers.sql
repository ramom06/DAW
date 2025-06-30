CREATE DATABASE IF NOT EXISTS  DAW CHARACTER SET UTF8MB4 COLLATE UTF8MB4_SPANISH_CI;
USE DAW;

CHARACTER SET UTF8MB4 COLLATE UTF8MB4_SPANISH_CI
GRANT CREATE, ALTER, DELETE ON DAW.* TO alumno@localhost;
GRANT REFERENCES ON DAW.* TO alumno@localhost;
GRANT CREATE USER ON *.* TO alumno@localhost WITH GRANT OPTION;

REVOKE CREATE USER ON *.* FROM alumno@localhost;
REVOKE DELETE ON daw.* FROM alumno@localhost;
ALTER USER alumno@localhost IDENTIFIED BY 'nueva_clave';

RENAME USER alumno@localhost TO dawuser@localhost;

DROP USER invitado@localhost;

GRANT ALL ON daw.* TO dawuser@localhost WITH GRANT OPTION;

CREATE USER ramon@localhost;
GRANT ALL ON daw.* TO ramon@localhost;

SELECT user, host FROM mysql.user;