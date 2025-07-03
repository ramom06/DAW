USE daw;

create table personal (
idPersonal int auto_increment PRIMARY KEY,
nombre varchar(20) NOT NULL,
apellidos varchar(30) NOT NULL,
fecNacimiento date
);

create table juego (
idJuego int primary key,
nombre varchar(20) NOT NULL,
descripcion varchar(40),
fecCompra date,
idComprador int,
FOREIGN KEY (idComprador) REFERENCES personal(idPersonal)
);

CREATE USER invitado@localhost;
GRANT CREATE ON DAW.* TO invitado;

SELECT CURRENT_USER();

