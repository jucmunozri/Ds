USE funcionarios;

-- funcionarios
INSERT INTO funcionarios(numero_identificacion, nombres, apellidos, sexo, direccion, telefono, fecha_nacimiento, tipos_identificacion_id, estados_civil_id)
VALUES('111111', 'Julio', 'Martinez', 'M', 'Calle 20', '603522222', '1985-08-05', 1, 2), 
	  ('1116489568', 'carlos', 'lopez', 'M', 'carrera 5', '5532563', '1982-02-02', 1, 1),
      ('14333568', 'pedro', 'perez', 'M', 'carrera 85', '6085497', '1995-07-05', 1, 2);

SELECT * FROM funcionarios;

-- estados_civil
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

SELECT * FROM estados_civil;

-- tipos_identificacion
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

SELECT * FROM tipos_identificacion;

-- formaciones_academicas
INSERT INTO formaciones_academicas(funcionarios_id, universidades_id, estados_formacion_id, niveles_educativos_id, formacion)
VALUES(1, 1, 1, 1, 'Ingeniero Electricista'), 
	  (2, 1, 2, 2, 'Tecnólogo industrial'),
      (3, 2, 2, 2, 'Electricista'),
      (4, 3, 1, 1, 'Ingeniero de Sistemas');

SELECT * FROM formaciones_academicas;


-- estados_formacion
INSERT INTO estados_formacion(nombre, estado) 
VALUES ('AP', 'Aprobado');
INSERT INTO estados_formacion(nombre, estado) 
VALUES ('ENP', 'En proceso');
INSERT INTO estados_formacion(nombre, estado) 
VALUES ('NA', 'No aprobado');


SELECT * FROM estados_formacion;

-- universidades
INSERT INTO universidades(nombre, telefono) 
VALUES('IUDIGITAL', '4085563');
INSERT INTO universidades(nombre, telefono) 
VALUES('Unal', '6004536');
INSERT INTO universidades(nombre, telefono) 
VALUES('Udea', '2258596');

SELECT * FROM universidades;

-- niveles educativos
INSERT INTO niveles_educativos(nombre, nivel) 
VALUES('ING', 'Ingeniería');
INSERT INTO niveles_educativos(nombre, nivel) 
VALUES('Tecg' 'Tecnólogo');
INSERT INTO niveles_educativos(nombre, nivel) 
VALUES('Tec', 'Técnico');
INSERT INTO niveles_educativos(nombre, nivel) 
VALUES('Bac', 'Bachiller');

SELECT * FROM niveles_educativos;

-- grupo Familiares
INSERT INTO grupos_familiares(nombre, funcionarios_id, parentescos_id, telefono)
VALUES('Carla Restrepo', 1, 1, '3002556986'),
      ('Juana Medina', 3, 2, '3105552536'),
      ('Gabriel Diaz', 2, 3, '3165986324');

SELECT * FROM grupo_familiares;

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

SELECT * FROM parentescos;









