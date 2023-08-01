CREATE DATABASE almacenes;

USE almacenes;

CREATE TABLE almacenes(
	codigo int,
    lugar nvarchar(100),
    capacidad int,
    PRIMARY KEY (codigo)
);
CREATE TABLE cajas(
	numreferencia char(5),
    contenido nvarchar(100),
    valor int,
    almacen int,
    PRIMARY KEY (numreferencia),
    FOREIGN KEY (almacen) REFERENCES almacenes (codigo)
    ON DELETE cascade
    ON UPDATE cascade
);