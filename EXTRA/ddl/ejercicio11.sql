CREATE DATABASE investigadores;

USE investigadores;

CREATE TABLE facultad (
	codigo int,
    nombre nvarchar(100),
    PRIMARY KEY (codigo)
);
CREATE TABLE investigadores (
	dni varchar(8),
    nom_apels nvarchar(255),
    facultad int,
    PRIMARY KEY (dni),
    FOREIGN KEY (facultad) REFERENCES facultad (codigo)
    ON DELETE cascade
    ON UPDATE cascade
);
CREATE TABLE equipos (
	num_serie char(4),
    nombre nvarchar(100),
    facultad int,
    PRIMARY KEY (num_serie),
    FOREIGN KEY (facultad) REFERENCES facultad (codigo)
    ON DELETE cascade
    ON UPDATE cascade
);
CREATE TABLE reserva (
	dni varchar(8),
	num_serie char(4),
    comiento datetime,
    fin datetime,
    PRIMARY KEY (dni),
    FOREIGN KEY (dni) REFERENCES investigadores (dni)
    ON DELETE cascade
    ON UPDATE cascade,
    FOREIGN KEY (num_serie) REFERENCES equipos (num_serie)
    ON DELETE cascade
    ON UPDATE cascade
);