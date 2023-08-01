CREATE DATABASE biblioteca;

USE biblioteca;

CREATE TABLE tema(
	clave_tema int,
    nombre varchar(35),
    PRIMARY KEY (clave_tema)
);
CREATE TABLE autor(
	clave_autor int,
    nombre varchar(35),
    PRIMARY KEY (clave_autor)
);
CREATE TABLE editorial(
	clave_editorial int,
    nombre varchar(35),
    direccion varchar (50),
    telefono int,
    PRIMARY KEY (clave_editorial)
);
CREATE TABLE socio(
	clave_socio int,
    nombre varchar(30),
    direccion varchar(35),
    telefono int,
    categoria varchar(20),
    PRIMARY KEY (clave_socio)
);
CREATE TABLE libro(
	clave_libro int,
    titulo varchar(35),
    idioma varchar(25),
    formato varchar(20),
    clave_editorial int,
    PRIMARY KEY (clave_libro),
    FOREIGN KEY (clave_editorial) REFERENCES editorial (clave_editorial)
    ON DELETE cascade
    ON UPDATE cascade
);
CREATE TABLE ejemplar(
	clave_ejemplar int,
    clave_libro int,
    numero_orden int,
    edicion varchar(20),
    ubicacion varchar(30),
    categoria varchar(24),
    PRIMARY KEY (clave_ejemplar),
    FOREIGN KEY (clave_libro) REFERENCES libro (clave_libro)
    ON DELETE cascade
    ON UPDATE cascade
);
CREATE TABLE prestamo(
	clave_socio int,
    clave_ejemplar int,
    numero_orden int,
    fecha_prestamo date,
    fecha_devolucion date,
    notas varchar(50),
    PRIMARY KEY (clave_socio),
    FOREIGN KEY (clave_socio) REFERENCES socio (clave_socio)
    ON DELETE cascade
    ON UPDATE cascade,
	FOREIGN KEY (clave_ejemplar) REFERENCES ejemplar (clave_ejemplar)
    ON DELETE cascade
    ON UPDATE cascade
);
CREATE TABLE trata_sobre(
	clave_libro int,
	clave_tema int,
    PRIMARY KEY (clave_libro, clave_tema),
	FOREIGN KEY (clave_libro) REFERENCES libro (clave_libro)
    ON DELETE cascade
    ON UPDATE cascade,
	FOREIGN KEY (clave_tema) REFERENCES tema (clave_tema)
    ON DELETE cascade
    ON UPDATE cascade
);
CREATE TABLE escrito_por(
	clave_libro int,
	clave_autor int,
    PRIMARY KEY (clave_libro, clave_autor),
	FOREIGN KEY (clave_libro) REFERENCES libro (clave_libro)
    ON DELETE cascade
    ON UPDATE cascade,
	FOREIGN KEY (clave_autor) REFERENCES autor (clave_autor)
    ON DELETE cascade
    ON UPDATE cascade
);

DROP DATABASE biblioteca;