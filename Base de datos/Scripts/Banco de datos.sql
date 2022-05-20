INSERT INTO BITACORA_MODIFICACION(nombre_modificacion) VALUES ('Agregó');
INSERT INTO BITACORA_MODIFICACION(nombre_modificacion) VALUES ('Modificó');
INSERT INTO BITACORA_MODIFICACION(nombre_modificacion) VALUES ('Eliminó');

INSERT INTO BITACORA_SECCION(nombre_seccion) VALUES ('Agradecimiento');
INSERT INTO BITACORA_SECCION(nombre_seccion) VALUES ('Dedicatoria');
INSERT INTO BITACORA_SECCION(nombre_seccion) VALUES ('Resumen');
INSERT INTO BITACORA_SECCION(nombre_seccion) VALUES ('Siglas');
INSERT INTO BITACORA_SECCION(nombre_seccion) VALUES ('Abreviaciones');
INSERT INTO BITACORA_SECCION(nombre_seccion) VALUES ('Nomenclaturas');
INSERT INTO BITACORA_SECCION(nombre_seccion) VALUES ('Capitulo');
INSERT INTO BITACORA_SECCION(nombre_seccion) VALUES ('Glosario');
INSERT INTO BITACORA_SECCION(nombre_seccion) VALUES ('Referencia');
INSERT INTO BITACORA_SECCION(nombre_seccion) VALUES ('Creación de documento');

INSERT INTO CONFIGURACION_SISTEMA(fecha_entrega, fecha_prorroga, numero_integrantes) VALUES ('JULIO 2022', 'AGOSTO 2022', 4);
UPDATE CONFIGURACION_SISTEMA SET fecha_entrega = 'JULIO 2022', fecha_prorroga = 'AGOSTO 2022', numero_integrantes = 4 WHERE id = (SELECT MAX(id) FROM CONFIGURACION_SISTEMA);

INSERT INTO FACULTAD(nombre_facultad) VALUES('Facultad de Ingeniería y Arquitectura');
INSERT INTO FACULTAD(nombre_facultad) VALUES('Facultad de Ciencias Sociales y Humanidades');
INSERT INTO FACULTAD(nombre_facultad) VALUES('Facultad de Ciencias Económicas y Empresariales');
INSERT INTO FACULTAD(nombre_facultad) VALUES('Facultad de Postgrados');

INSERT INTO CARRERA(nombre_carrera, grado, facultad_id) VALUES('Arquitectura', 'Arquitecto', 1);
INSERT INTO CARRERA(nombre_carrera, grado, facultad_id) VALUES('Ingeniería de Alimentos', 'Ingeniero de Alimentos', 1);
INSERT INTO CARRERA(nombre_carrera, grado, facultad_id) VALUES('Ingeniería Civil', 'Ingeniero Civil', 1);
INSERT INTO CARRERA(nombre_carrera, grado, facultad_id) VALUES('Ingeniería Eléctrica', 'Ingeniero Electricista', 1);
INSERT INTO CARRERA(nombre_carrera, grado, facultad_id) VALUES('Ingeniería Energética', 'Ingeniero Energético', 1);
INSERT INTO CARRERA(nombre_carrera, grado, facultad_id) VALUES('Ingeniería Industrial', 'Ingeniero Industrial', 1);
INSERT INTO CARRERA(nombre_carrera, grado, facultad_id) VALUES('Ingeniería Informática', 'Ingeniero Informático', 1);
INSERT INTO CARRERA(nombre_carrera, grado, facultad_id) VALUES('Ingeniería Mecánica', 'Ingeniero Mecánico', 1);
INSERT INTO CARRERA(nombre_carrera, grado, facultad_id) VALUES('Ingeniería Química', 'Ingeniero Químico', 1);
INSERT INTO CARRERA(nombre_carrera, grado, facultad_id) VALUES('Licenciatura en Filosofía', 'Licenciado en Filosofía', 2);
INSERT INTO CARRERA(nombre_carrera, grado, facultad_id) VALUES('Licenciatura en Idioma Inglés', 'Licenciado en Idioma Inglés', 2);
INSERT INTO CARRERA(nombre_carrera, grado, facultad_id) VALUES('Licenciatura en Psicología', 'Licenciado en Psicología', 2);
INSERT INTO CARRERA(nombre_carrera, grado, facultad_id) VALUES('Licenciatura en Teología', 'Licenciado en Teología', 2);
INSERT INTO CARRERA(nombre_carrera, grado, facultad_id) VALUES('Licenciatura en Ciencias Jurídicas', 'Licenciado en Ciencias Jurídicas', 2);
INSERT INTO CARRERA(nombre_carrera, grado, facultad_id) VALUES('Técnico en Mercadeo', 'Técnico en Mercadeo', 3);
INSERT INTO CARRERA(nombre_carrera, grado, facultad_id) VALUES('Técnico en Producción Multimedia', 'Técnico en Producción Multimedia', 3);
INSERT INTO CARRERA(nombre_carrera, grado, facultad_id) VALUES('Licenciatura en Mercadeo', 'Licenciado en Mercadeo', 3);
INSERT INTO CARRERA(nombre_carrera, grado, facultad_id) VALUES('Licenciatura en Comunicación Social', 'Licenciado en Comunicación Social', 3);
INSERT INTO CARRERA(nombre_carrera, grado, facultad_id) VALUES('Profesorado en Idioma Ingles', 'Profesor en Idioma Inglés para Tercer Ciclo de Eduación Básica y Eduación Media', 2);
INSERT INTO CARRERA(nombre_carrera, grado, facultad_id) VALUES('Profesorado en Teología', 'Profesor en Teología', 2);
INSERT INTO CARRERA(nombre_carrera, grado, facultad_id) VALUES('Técnico en Contaduría', 'Técnico en Contaduría', 3);
INSERT INTO CARRERA(nombre_carrera, grado, facultad_id) VALUES('Licenciatura en Administración de Empresas', 'Licenciado en Administración de Empresas', 3);
INSERT INTO CARRERA(nombre_carrera, grado, facultad_id) VALUES('Licenciatura en Contaduría Pública', 'Licenciado en Contaduría Pública ', 3);
INSERT INTO CARRERA(nombre_carrera, grado, facultad_id) VALUES('Licenciatura en Economía', 'Licenciado en Economía', 3);

INSERT INTO DEPARTAMENTO_UNIDAD(nombre_departamento, facultad_id) VALUES('Departamento de Administración de Empresas', 3);
INSERT INTO DEPARTAMENTO_UNIDAD(nombre_departamento, facultad_id) VALUES('Departamento de Ciencias de la Eduación', 2);
INSERT INTO DEPARTAMENTO_UNIDAD(nombre_departamento, facultad_id) VALUES('Departamento de Ciencias Energéticas y Fluídicas', 1);
INSERT INTO DEPARTAMENTO_UNIDAD(nombre_departamento, facultad_id) VALUES('Departamento de Ciencias Jurídicas', 2);
INSERT INTO DEPARTAMENTO_UNIDAD(nombre_departamento, facultad_id) VALUES('Departamento de Comunicaciones y Cultural', 2);
INSERT INTO DEPARTAMENTO_UNIDAD(nombre_departamento, facultad_id) VALUES('Departamento de Contabilidad y Finanzas', 3);
INSERT INTO DEPARTAMENTO_UNIDAD(nombre_departamento, facultad_id) VALUES('Departamento de Economía', 3);
INSERT INTO DEPARTAMENTO_UNIDAD(nombre_departamento, facultad_id) VALUES('Departamento de Electrónica e Informática', 1);
INSERT INTO DEPARTAMENTO_UNIDAD(nombre_departamento, facultad_id) VALUES('Departamento de Filosofía', 2);
INSERT INTO DEPARTAMENTO_UNIDAD(nombre_departamento, facultad_id) VALUES('Departamento de Ingeniería de Procesos y Ciencias Ambientales', 1);
INSERT INTO DEPARTAMENTO_UNIDAD(nombre_departamento, facultad_id) VALUES('Departamento de Matemática', 1);
INSERT INTO DEPARTAMENTO_UNIDAD(nombre_departamento, facultad_id) VALUES('Departamento de Mecánica Estructural', 1);
INSERT INTO DEPARTAMENTO_UNIDAD(nombre_departamento, facultad_id) VALUES('Departamento de Operaciones y Sistemas', 1);
INSERT INTO DEPARTAMENTO_UNIDAD(nombre_departamento, facultad_id) VALUES('Departamento de Organización del Espacio', 1);
INSERT INTO DEPARTAMENTO_UNIDAD(nombre_departamento, facultad_id) VALUES('Departamento de Psicología y de Salud Pública', 2);
INSERT INTO DEPARTAMENTO_UNIDAD(nombre_departamento, facultad_id) VALUES('Departamento de Sociología y Ciencias', 2);
INSERT INTO DEPARTAMENTO_UNIDAD(nombre_departamento, facultad_id) VALUES('Departamento de Teología', 2);
INSERT INTO DEPARTAMENTO_UNIDAD(nombre_departamento, facultad_id) VALUES('Decanato de Ciencias Económicas y Empresariales', 2);
INSERT INTO DEPARTAMENTO_UNIDAD(nombre_departamento, facultad_id) VALUES('Decanato de Ciencias Sociales y Humanidades', 3);
INSERT INTO DEPARTAMENTO_UNIDAD(nombre_departamento, facultad_id) VALUES('Decanato de Ingeniería y Arquitectura', 1);
INSERT INTO DEPARTAMENTO_UNIDAD(nombre_departamento, facultad_id) VALUES('Decanato de Postgrados', 4);

INSERT INTO TIPO_ABREVIATURA(nombre_tipo_abreviatura) VALUES ('Abreviatura');
INSERT INTO TIPO_ABREVIATURA(nombre_tipo_abreviatura) VALUES ('Sigla');
INSERT INTO TIPO_ABREVIATURA(nombre_tipo_abreviatura) VALUES ('Nomenclatura');

INSERT INTO CARGO(nombre_cargo) VALUES ('Decano');
INSERT INTO CARGO(nombre_cargo) VALUES ('Secretaria Académica');
INSERT INTO CARGO(nombre_cargo) VALUES ('Director de carrera');
INSERT INTO CARGO(nombre_cargo) VALUES ('Catedrático');
INSERT INTO CARGO(nombre_cargo) VALUES ('Rector');
INSERT INTO CARGO(nombre_cargo) VALUES ('Secretaria Ejecutiva');
INSERT INTO CARGO(nombre_cargo) VALUES ('Asesora de Proyectos Estratégicos');
INSERT INTO CARGO(nombre_cargo) VALUES ('Secretaria');
INSERT INTO CARGO(nombre_cargo) VALUES ('Secretaría General');

INSERT INTO TIPO_EMPLEADO(nombre_tipo_empleado) VALUES ('Academico');
INSERT INTO TIPO_EMPLEADO(nombre_tipo_empleado) VALUES ('Administrativo');
INSERT INTO TIPO_EMPLEADO(nombre_tipo_empleado) VALUES ('Servicio');

INSERT INTO TIPO_USUARIO(nombre) VALUES('Estudiante');
INSERT INTO TIPO_USUARIO(nombre) VALUES('Director de carrera');

