CREATE TABLE `capitulo` (
  `id` int PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `nombre_capitulo` varchar(200),
  `orden_capitulo` int,
  `updated_at` datetime,
  `created_at` datetime
);

CREATE TABLE `contenido_capitulo` (
  `id` int PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `titulo_subtitulo` varchar(200),
  `tipo` int,
  `contenido` text,
  `orden_contenido` int,
  `capitulos_id` int,
  `updated_at` datetime,
  `created_at` datetime
);

CREATE TABLE `contenido_capitulo2` (
  `id` int PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `titulo_subtitulo` varchar(200),
  `contenido` text,
  `orden_contenido` int,
  `contenido_capitulo_id` int,
  `updated_at` datetime,
  `created_at` datetime
);

ALTER TABLE `contenido_capitulo` ADD FOREIGN KEY (`capitulos_id`) REFERENCES `capitulo` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE `contenido_capitulo2` ADD FOREIGN KEY (`contenido_capitulo_id`) REFERENCES `contenido_capitulo` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
