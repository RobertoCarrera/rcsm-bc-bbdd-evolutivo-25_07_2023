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
    FOREIGN KEY (id_comunidad) REFERENCES comunidades_autonomas(id_comunidad)
    ON DELETE cascade
    ON UPDATE cascade,
    FOREIGN KEY (cp_provincia) REFERENCES provincias(cp)
    ON DELETE cascade
    ON UPDATE cascade,
    FOREIGN KEY (cp_localidad) REFERENCES localidades(cp)
    ON DELETE cascade
    ON UPDATE cascade
);

**Ejercicio 4**

![image](https://github.com/RobertoCarrera/rcsm-bc-ddl-25_07_2023/assets/24571167/aaf38981-12b3-441e-b063-5194508c3820)

![image](https://github.com/RobertoCarrera/rcsm-bc-ddl-25_07_2023/assets/24571167/de2055ee-cf63-490d-9170-82ab41536eca)

CREATE DATABASE guerras;
USE guerras;
CREATE TABLE paises(
	id_pais int auto_increment,
    nombre varchar(30),
    PRIMARY KEY (id_pais)
);
CREATE TABLE anos_independencia(
	id_ano_indep int auto_increment,
    inicio_indep date, 
    final_indep date,
    id_pais int,
    PRIMARY KEY (id_ano_indep),
    FOREIGN KEY (id_pais) REFERENCES paises(id_pais)
    ON DELETE cascade
    ON UPDATE cascade
);
CREATE TABLE guerras(	
	id_guerra int auto_increment,
    nombre varchar(30),
    ano_inicio date,
    ano_final date,
    PRIMARY KEY (id_guerra)
);
CREATE TABLE bandos(
	id_bando int auto_increment,
    nombre varchar(30),
    PRIMARY KEY (id_bando)
);
CREATE TABLE participar(
	id_pais int,
    id_guerra int,
    FOREIGN KEY (id_pais) REFERENCES paises(id_pais)
    ON DELETE cascade
    ON UPDATE cascade,
    FOREIGN KEY (id_guerra) REFERENCES guerras(id_guerra)
    ON DELETE cascade
    ON UPDATE cascade
);
CREATE TABLE tener(
	participacion_inicio date,
    participacion_final date,
    id_guerra int,
    id_bando int,
    FOREIGN KEY (id_guerra) REFERENCES guerras(id_guerra)
    ON DELETE cascade
    ON UPDATE cascade,
    FOREIGN KEY (id_bando) REFERENCES bandos(id_bando)
    ON DELETE cascade
    ON UPDATE cascade
);
    FOREIGN KEY (id_bando) REFERENCES bandos(id_bando)
    ON DELETE cascade
    ON UPDATE cascade
);
