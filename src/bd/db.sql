/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Other/SQLTemplate.sql to edit this template
 */

DROP DATABASE IF EXISTS funcionarios;

CREATE DATABASE IF NOT EXISTS funcionarios;-- crea la BBDD

USE funcionarios;-- selecciona la BBDD

/*
Creación de tablas
*/

CREATE TABLE tipos_identificacion(
    id INT NOT NULL AUTO_INCREMENT,
    nombre VARCHAR(45) NOT NULL,
    descripcion VARCHAR(250),
    PRIMARY KEY(id)
);

CREATE TABLE estados_civil(
    id INT NOT NULL AUTO_INCREMENT,
    estado VARCHAR(45) NOT NULL,
    descripcion VARCHAR(250),
    PRIMARY KEY(id)
);

CREATE TABLE funcionarios(
    id INT NOT NULL AUTO_INCREMENT,
    numero_identificacion VARCHAR(120) NOT NULL,
    nombres VARCHAR(120) NOT NULL,
    apellidos VARCHAR(120) NOT NULL,
    sexo CHAR(2),
    direccion VARCHAR(255),
    telefono VARCHAR(255),
    fecha_nacimiento DATE,
    fecha_creacion DATETIME DEFAULT NOW(),
    fecha_actualizacion DATETIME DEFAULT NOW(),
    tipos_identificacion_id INT NOT NULL,
    estados_civil_id INT NOT NULL,
    PRIMARY KEY(id),
    UNIQUE(numero_identificacion),
    FOREIGN KEY(tipos_identificacion_id) REFERENCES tipos_identificacion(id),
    FOREIGN KEY(estados_civil_id) REFERENCES estados_civil(id) 
);

CREATE TABLE formaciones_academicas(
    id INT NOT NULL AUTO_INCREMENT,
    formacion VARCHAR(45) NOT NULL,
    funcionarios_id INT NOT NULL,
    universidades_id INT NOT NULL,
    estados_formacion_id INT NOT NULL,
    niveles_educativos_id INT NOT NULL,
    PRIMARY KEY(id),
    FOREIGN KEY(estados_formacion_id) REFERENCES estados_formacion(id),
    FOREIGN KEY(funcionarios_id) REFERENCES funcionarios(id),
    FOREIGN KEY(niveles_educativos_id) REFERENCES niveles_educativos_id),
    FOREIGN KEY(universidades_id) REFERENCES universidades(id)
);

CREATE TABLE estados_formacion(
    id INT NOT NULL AUTO_INCREMENT,
    nombre VARCHAR(45) NOT NULL,
    estado VARCHAR(45) NOT NULL,
    PRIMARY KEY(id)
);

CREATE TABLE universidades(
    id INT NOT NULL AUTO_INCREMENT,
    nombre VARCHAR(45) NOT NULL,
    telefono VARCHAR(45) NOT NULL,
    PRIMARY KEY(id)
);

CREATE TABLE niveles_educativos(
    id INT NOT NULL AUTO_INCREMENT,
    nombre VARCHAR(45) NOT NULL,
    nivel VARCHAR(45) NOT NULL,
    PRIMARY KEY(id)
);

CREATE TABLE grupo_familiares(
    id INT NOT NULL AUTO_INCREMENT,
    nombre VARCHAR(45) NOT NULL,
    telefono VARCHAR(45) NOT NULL,
    funcionarios_id INT NOT NULL,
    parentescos_id INT NOT NULL,
    PRIMARY KEY(id),
    FOREIGN KEY(funcionarios_id) REFERENCES funcionarios(id),
    FOREIGN KEY(parentescos_id) REFERENCES parentescos(id)
 );

CREATE TABLE parentescos(
    id INT NOT NULL AUTO_INCREMENT,
    parentesco VARCHAR(45) NOT NULL,
    PRIMARY KEY(id)
);


/*
POPULATION (llenado) DE TABLAS
*/
-- llenado tabla tipos de identificación
INSERT INTO tipos_identificacion(nombre,descripcion) 
VALUES ('CC', 'Cédula de ciudadanía');
INSERT INTO tipos_identificacion(nombre,descripcion) 
VALUES ('TI', 'Tarjeta de identidad');
INSERT INTO tipos_identificacion(nombre,descripcion) 
VALUES ('CE', 'Tarjeta de extranjería');
INSERT INTO tipos_identificacion(nombre,descripcion) 
VALUES ('PS', 'Pasaporte');
INSERT INTO tipos_identificacion(nombre,descripcion) 
VALUES ('OT', 'Otro documento de identificación');

-- llenado tabla estados civiles
INSERT INTO estados_civil(nombre,descripcion) 
VALUES ('SOL', 'Solterito y a la orden');
INSERT INTO estados_civil(nombre,descripcion) 
VALUES ('CAS', 'Casado y no a la orden');
INSERT INTO estados_civil(nombre,descripcion) 
VALUES ('ULB', 'En Unión libre');
INSERT INTO estados_civil(nombre,descripcion) 
VALUES ('VAC', 'Vacilando con la muchacha de al lado');
INSERT INTO estados_civil(nombre,descripcion) 
VALUES ('OTR', 'Otro estado civil');

-- llenado de tabla funcionario: se hace por la APP de Java
INSERT INTO funcionarios(
    numero_identificacion,
    nombres,
    apellidos,
    sexo,
    direccion,
    telefono,
    fecha_nacimiento,
    tipos_identificacion_id,
    estados_civil_id
)
VALUES ('111111', 'Julio', 'Martinez', 'M', 'Calle 20',
'603522222', '1985-08-05', 1, 2),
('1116489568', 'carlos', 'lopez', 'carrera 5', '5532563',
 '1982-02-02', 1, 1),
('14333568', 'pedro', 'perez', 'carrera 85', '6085497',
 '1995-07-05', 1, 2);

-- formaciones academicas

INSERT INTO formaciones_academicas(
funcionarios_id, universidades_id, estados_formacion_id, 
niveles_educativos_id, formacion)
VALUES (1, 1, 1, 1, 'Ingeniero Electricista'), 
       (2, 1, 2, 2, 'Tecnico industrial'),
       (3, 2, 2, 2, 'Electricista'),
       (4, 3, 1, 1, 'Ingeniero de Sistemas');

-- estados formacion
INSERT INTO estados_formacion(nombre, estado) 
VALUES ('AP', 'Aprobado');
INSERT INTO estados_formacion(nombre, estado) 
VALUES ('ENP', 'En proceso');
INSERT INTO estados_formacion(nombre, estado) 
VALUES ('NA', 'No aprobado');
INSERT INTO estados_formacion(nombre, estado) 
VALUES ('OTRO', 'O');

-- universidades
INSERT INTO universidades(nombre, telefono) 
VALUES('IUDIGITAL', '4085563');
INSERT INTO universidades(nombre, telefono) 
VALUES('Unal', '6004536');
INSERT INTO universidades(nombre, telefono) 
VALUES('Udea', '2258596');

-- niveles educativos
INSERT INTO niveles_educativos(nombre, nivel) 
VALUES('ING', 'Ingeniería');
INSERT INTO niveles_educativos(nombre, nivel) 
VALUES('Tecg' 'Tecnólogo');
INSERT INTO niveles_educativos(nombre, nivel) 
VALUES('Tec', 'Técnico');
INSERT INTO niveles_educativos(nombre, nivel) 
VALUES('Bac', 'Bachiller');

-- grupo familiares
INSERT INTO grupos_familiares(nombre, funcionarios_id, parentescos_id, telefono)
VALUES('Carla Restrepo', 1, 1, '3002556986'),
      ('Juana Medina', 3, 2, '3105552536'),
      ('Gabriel Diaz', 2, 3, '3165986324');

-- parentescos
INSERT INTO parentescos(parentesco)
 VALUES('Cónyugue');
INSERT INTO parentescos(parentesco) 
VALUES('Madre');
INSERT INTO parentescos(parentesco) 
VALUES('Padre');
INSERT INTO parentescos(parentesco) 
VALUES('Hijo/a');
INSERT INTO parentescos(parentesco) 
VALUES('Hermano/a');
INSERT INTO parentescos(parentesco) 
VALUES('Otro/a');

-- DAO: Data Access Object