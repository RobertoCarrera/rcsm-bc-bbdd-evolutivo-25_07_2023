CREATE DATABASE cientificos;

USE cientificos;

CREATE TABLE cientificos(
	dni varchar(8),
    nom_apels nvarchar(255),
    PRIMARY KEY (dni)
);
CREATE TABLE proyecto(
	id char(4),
    nombre nvarchar(255),
    horas int,
    PRIMARY KEY (id)
);
CREATE TABLE asignado_a(
	cientifico varchar(8),
    proyecto char(4),
    PRIMARY KEY (cientifico, proyecto),
    FOREIGN KEY (cientifico) REFERENCES cientificos (dni)
    ON DELETE cascade
    ON UPDATE cascade,
    FOREIGN KEY (proyecto) REFERENCES proyecto (id)
	ON DELETE cascade
    ON UPDATE cascade
);