CREATE DATABASE directores;

USE directores;

CREATE TABLE despachos(
	numero int,
    capacidad int,
    PRIMARY KEY (numero)
);
CREATE TABLE directores(
	dni varchar(8),
    nom_apels nvarchar(255),
    dni_jefe varchar(8),
    despacho int,
    PRIMARY KEY (dni),
    FOREIGN KEY (despacho) REFERENCES despachos (numero)
    ON DELETE cascade
    ON UPDATE cascade,
    FOREIGN KEY (dni_jefe) REFERENCES directores (dni)
    ON DELETE cascade
    ON UPDATE cascade
);