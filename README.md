# rcsm-bc-ddl-25_07_2023
**Ejercicio 3**

![image](https://github.com/RobertoCarrera/rcsm-bc-ddl-25_07_2023/assets/24571167/7336adf7-dafd-4942-bb9a-8c542b025916)

![image](https://github.com/RobertoCarrera/rcsm-bc-ddl-25_07_2023/assets/24571167/66b8ceac-5957-4341-b81e-2f97244c0576)

CREATE DATABASE geografia;
USE geografia;
CREATE TABLE comunidades_autonomas(
	id_comunidad int auto_increment,
    nombre varchar(30),
    poblacion varchar(20),
    superficie int,
    PRIMARY KEY (id_comunidad)
    );
CREATE TABLE provincias(
	cp int,
    nombre varchar(20),
    superficie int,
    id_comunidad int,
    PRIMARY KEY (cp),
    FOREIGN KEY (id_comunidad) REFERENCES comunidades_autonomas(id_comunidad)
    ON DELETE cascade
    ON UPDATE cascade
);
CREATE TABLE localidades(
	cp int,
    nombre varchar(30),
    poblacion varchar(30),
    cp_provincia int,
    PRIMARY KEY (cp),
    FOREIGN KEY (cp_provincia) REFERENCES provincias(cp)
    ON DELETE cascade
    ON UPDATE cascade
);
CREATE TABLE capitales(
	id_capital int auto_increment,
    nombre varchar(30),
    id_comunidad int,
    cp_provincia int,
    cp_localidad int,
    PRIMARY KEY (id_capital),
    FOREIGN KEY (id_comunidad) REFERENCES comunidades_autonomas(id_comunidad),
    FOREIGN KEY (cp_provincia) REFERENCES provincias(cp),
    FOREIGN KEY (cp_localidad) REFERENCES localidades(cp)
    ON DELETE cascade
    ON UPDATE cascade
);
