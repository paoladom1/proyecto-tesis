CREATE TABLE `TIPO_USUARIO` (
  `id` int PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100),
  `created_at` timestamp DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDb;

CREATE TABLE `FACULTAD` (
  `id` int PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `nombre_facultad` varchar(200),
  `created_at` timestamp DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDb;

CREATE TABLE `DEPARTAMENTO_U` (
  `id` int PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `nombre_departamento` varchar(200),
  `facultad_id` int,
  `created_at` timestamp DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDb;

CREATE TABLE `CARRERA` (
  `id` int PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `nombre_carrera` varchar(200),
  `grado` varchar(200),
  `facultad_id` int,
  `created_at` timestamp DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDb;

CREATE TABLE `USUARIO` (
  `id` int PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `foto` varchar(200),
  `correo` varchar(100),
  `contrasena` varchar(100),
  `tipo_usuario_id` int,
  `created_at` timestamp DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDb;

CREATE TABLE `DIRECTOR_CARRERA` (
  `id` int PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `usuario_id` int,
  `carrera_id` int,
  `empleado_id` int,
  `created_at` timestamp DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDb;

CREATE TABLE `EXTERNO` (
  `id` int PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100),
  `apellido` varchar(100),
  `correo` varchar(100),
  `descripcion` text,
  `rol_externo` int,
  `departamento_u_id` int,
  `created_at` timestamp DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDb;

CREATE TABLE `TIPO_EMPLEADO` (
  `id` int PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `nombre_tipo_empleado` varchar(100),
  `created_at` timestamp DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDb;

CREATE TABLE `CARGO` (
  `id` int PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `nombre_cargo` varchar(100),
  `created_at` timestamp DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDb;

CREATE TABLE `EMPLEADO` (
  `id` int PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `codigo_empleado` varchar(10),
  `nombre` varchar(100),
  `apellido` varchar(100),
  `tipo_empleado_id` int,
  `cargo_id` int,
  `departamento_u_id` int,
  `created_at` timestamp DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDb;

CREATE TABLE `GRUPO_TRABAJO` (
  `id` int PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `anio_inicio` int,
  `ciclo_inicio` int,
  `tema` varchar(200),
  `prorroga` bool,
  `asesor_interno_id` int,
  `lector_interno_id` int,
  `asesor_externo_id` int,
  `lector_externo_id` int,
  `created_at` timestamp DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDb;

CREATE TABLE `ESTUDIANTE` (
  `id` int PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100),
  `apellido` varchar(100),
  `carnet` char(10),
  `carrera_id` int,
  `usuario_id` int,
  `grupo_trabajo_id` int,
  `created_at` timestamp DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDb;

CREATE TABLE `SECCION_RESUMEN` (
  `id` int PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `contenido` text,
  `grupo_trabajo_id` int,
  `created_at` timestamp DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDb;

CREATE TABLE `SECCION_CAPITULO` (
  `id` int PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `nombre_capitulo` varchar(200),
  `orden_capitulo` int,
  `grupo_trabajo_id` int,
  `created_at` timestamp DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDb;

CREATE TABLE `CONTENIDO_SECCION_CAPITULO` (
  `id` int PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `tema` varchar(200),
  `contenido` text,
  `orden_contenido` int,
  `seccion_capitulos_id` int,
  `created_at` timestamp DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDb;

CREATE TABLE `SUBCONTENIDO_SECCION_CAPITULO` (
  `id` int PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `subtema` varchar(200),
  `contenido` text,
  `orden_subcontenido` int,
  `contenido_seccion_capitulo_id` int,
  `created_at` timestamp DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDb;

CREATE TABLE `SECCION_GLOSARIO` (
  `id` int PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `opcional` bool,
  `contenido` text,
  `grupo_trabajo_id` int,
  `created_at` timestamp DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDb;

CREATE TABLE `TIPO_ABREVIATURA` (
  `id` int PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `nombre_tipo_abreviatura` varchar(100),
  `created_at` timestamp DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDb;

CREATE TABLE `SECCION_ABREVIATURA_NOMENCLATURA_SIGLA` (
  `id` int PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `contenido` text,
  `tipo_abreviatura_id` int,
  `grupo_trabajo_id` int,
  `created_at` timestamp DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDb;

CREATE TABLE `SECCION_AGRADECIMIENTO` (
  `id` int PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `opcional` bool,
  `autor` varchar(100),
  `contenido` text,
  `estudiante_id` int,
  `created_at` timestamp DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDb;

CREATE TABLE `SECCION_DEDICATORIA` (
  `id` int PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `opcional` bool,
  `autor` varchar(100),
  `contenido` text,
  `estudiante_id` int,
  `created_at` timestamp DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDb;

CREATE TABLE `SECCION_REFERENCIA` (
  `id` int PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `contenido` text,
  `grupo_trabajo_id` int,
  `created_at` timestamp DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDb;

CREATE TABLE `BITACORA_SECCION` (
  `id` int PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `nombre_seccion` varchar(150),
  `created_at` timestamp DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDb;

CREATE TABLE `BITACORA_MODIFICACION` (
  `id` int PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `nombre_modificacion` varchar(150),
  `created_at` timestamp DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDb;

CREATE TABLE `BITACORA` (
  `id` int PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `descripcion` text,
  `fecha_modificacion` datetime,
  `estudiante_id` int,
  `bitacora_seccion_id` int,
  `bitacora_modificacion_id` int,
  `created_at` timestamp DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDb;

CREATE TABLE `CONFIGURACION_SISTEMA` (
  `id` int PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `fecha_entrega` varchar(40),
  `fecha_prorroga` varchar(40),
  `numero_integrantes` int,
  `created_at` timestamp DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDb;

ALTER TABLE `DEPARTAMENTO_U` ADD FOREIGN KEY (`facultad_id`) REFERENCES `FACULTAD` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE `CARRERA` ADD FOREIGN KEY (`facultad_id`) REFERENCES `FACULTAD` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE `USUARIO` ADD FOREIGN KEY (`tipo_usuario_id`) REFERENCES `TIPO_USUARIO` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE `DIRECTOR_CARRERA` ADD FOREIGN KEY (`carrera_id`) REFERENCES `CARRERA` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE `DIRECTOR_CARRERA` ADD FOREIGN KEY (`usuario_id`) REFERENCES `USUARIO` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE `DIRECTOR_CARRERA` ADD FOREIGN KEY (`empleado_id`) REFERENCES `EMPLEADO` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE `EXTERNO` ADD FOREIGN KEY (`departamento_u_id`) REFERENCES `DEPARTAMENTO_U` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE `EMPLEADO` ADD FOREIGN KEY (`tipo_empleado_id`) REFERENCES `TIPO_EMPLEADO` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE `EMPLEADO` ADD FOREIGN KEY (`cargo_id`) REFERENCES `CARGO` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE `EMPLEADO` ADD FOREIGN KEY (`departamento_u_id`) REFERENCES `DEPARTAMENTO_U` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE `GRUPO_TRABAJO` ADD FOREIGN KEY (`asesor_interno_id`) REFERENCES `EMPLEADO` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE `GRUPO_TRABAJO` ADD FOREIGN KEY (`lector_interno_id`) REFERENCES `EMPLEADO` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE `GRUPO_TRABAJO` ADD FOREIGN KEY (`asesor_externo_id`) REFERENCES `EXTERNO` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE `GRUPO_TRABAJO` ADD FOREIGN KEY (`lector_externo_id`) REFERENCES `EXTERNO` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE `ESTUDIANTE` ADD FOREIGN KEY (`carrera_id`) REFERENCES `CARRERA` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE `ESTUDIANTE` ADD FOREIGN KEY (`usuario_id`) REFERENCES `USUARIO` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE `ESTUDIANTE` ADD FOREIGN KEY (`grupo_trabajo_id`) REFERENCES `GRUPO_TRABAJO` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE `SECCION_RESUMEN` ADD FOREIGN KEY (`grupo_trabajo_id`) REFERENCES `GRUPO_TRABAJO` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE `SECCION_CAPITULO` ADD FOREIGN KEY (`grupo_trabajo_id`) REFERENCES `GRUPO_TRABAJO` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE `CONTENIDO_SECCION_CAPITULO` ADD FOREIGN KEY (`seccion_capitulos_id`) REFERENCES `SECCION_CAPITULO` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE `SUBCONTENIDO_SECCION_CAPITULO` ADD FOREIGN KEY (`contenido_seccion_capitulo_id`) REFERENCES `CONTENIDO_SECCION_CAPITULO` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE `SECCION_GLOSARIO` ADD FOREIGN KEY (`grupo_trabajo_id`) REFERENCES `GRUPO_TRABAJO` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE `SECCION_ABREVIATURA_NOMENCLATURA_SIGLA` ADD FOREIGN KEY (`tipo_abreviatura_id`) REFERENCES `TIPO_ABREVIATURA` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE `SECCION_ABREVIATURA_NOMENCLATURA_SIGLA` ADD FOREIGN KEY (`grupo_trabajo_id`) REFERENCES `GRUPO_TRABAJO` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE `SECCION_AGRADECIMIENTO` ADD FOREIGN KEY (`estudiante_id`) REFERENCES `ESTUDIANTE` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE `SECCION_DEDICATORIA` ADD FOREIGN KEY (`estudiante_id`) REFERENCES `ESTUDIANTE` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE `SECCION_REFERENCIA` ADD FOREIGN KEY (`grupo_trabajo_id`) REFERENCES `GRUPO_TRABAJO` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE `BITACORA` ADD FOREIGN KEY (`estudiante_id`) REFERENCES `ESTUDIANTE` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE `BITACORA` ADD FOREIGN KEY (`bitacora_seccion_id`) REFERENCES `BITACORA_SECCION` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE `BITACORA` ADD FOREIGN KEY (`bitacora_modificacion_id`) REFERENCES `BITACORA_MODIFICACION` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
