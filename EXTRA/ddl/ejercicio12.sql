CREATE DATABASE alumnos_academia;

USE alumnos_academia;

CREATE TABLE profesores(
	nombre varchar(32),
    apellido1 varchar(32),
    apellido2 varchar(32),
    dni varchar(9),
    direccion varchar(35),
    titulo varchar(20),
    gana float NOT NULL,
    PRIMARY KEY (dni)
);
CREATE TABLE cursos(
	cod_curso int,
    nombre varchar(32) UNIQUE,
    dni_profesor varchar(9),
    maximo_alumnos int,
    fecha_inicio date, 
    fecha_fin date,
    CHECK (fecha_inicio < fecha_fin),
    num_horas int NOT NULL,
    PRIMARY KEY (cod_curso),
    FOREIGN KEY (dni_profesor) REFERENCES profesores (dni)
    ON DELETE cascade
    ON UPDATE cascade
);
CREATE TABLE alumnos(
	nombre varchar(32) UNIQUE,
    apellido1 varchar(32),
    apellido2 varchar(32),
    dni varchar(9),
    direccion varchar(32),
    sexo enum('H', 'M') NOT NULL,
    fecha_nacimiento date,
    curso int NOT NULL,
    PRIMARY KEY (dni),
    FOREIGN KEY (curso) REFERENCES cursos (cod_curso)
    ON DELETE cascade
    ON UPDATE cascade
);