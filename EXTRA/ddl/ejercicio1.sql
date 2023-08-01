CREATE DATABASE control_meterologia;

USE control_meterologia;

CREATE TABLE estacion(
	identificador int,
    latitud int,
    longitud int,
    altitud int,
    PRIMARY KEY (identificador)
);
CREATE TABLE muestra(
	identificador_estacion int,
    fecha date,
    temperatura_minima float,
    temperatura_maxima float,
    precipitaciones float,
    humedad_minima float,
    humedad_maxima float,
    velocidad_viento_minima float,
    velocidad_viento_maxima float,
    PRIMARY KEY (identificador_estacion),
    FOREIGN KEY (identificador_estacion) REFERENCES estacion (identificador)
    ON DELETE cascade
    ON UPDATE cascade
);