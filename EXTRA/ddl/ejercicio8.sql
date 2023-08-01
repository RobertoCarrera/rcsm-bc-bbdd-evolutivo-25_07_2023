CREATE DATABASE piezas_proveedores;

USE piezas_proveedores;

CREATE TABLE piezas(
	codigo int,
    nombre nvarchar(100), 
    PRIMARY KEY (codigo)
);
CREATE TABLE proveedores(
	id char(4),
    nombre nvarchar(100),
    PRIMARY KEY (id)
);
CREATE TABLE suministra (
	codigo_pieza int,
    id_proveedor char(4),
    precio int,
    PRIMARY KEY (codigo_pieza, id_proveedor),
    FOREIGN KEY (codigo_pieza) REFERENCES piezas (codigo)
    ON DELETE cascade
    ON UPDATE cascade,
	FOREIGN KEY (id_proveedor) REFERENCES proveedores (id)
    ON DELETE cascade
    ON UPDATE cascade
);