-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 09-08-2022 a las 06:43:53
-- Versión del servidor: 10.4.22-MariaDB
-- Versión de PHP: 7.4.27

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `db_documento`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `bitacora`
--

CREATE TABLE `bitacora` (
  `id` int(11) NOT NULL,
  `descripcion` text NOT NULL,
  `fecha_modificacion` datetime NOT NULL DEFAULT current_timestamp(),
  `estudiante_id` int(11) NOT NULL,
  `bitacora_seccion_id` int(11) NOT NULL,
  `bitacora_modificacion_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `bitacora`
--

INSERT INTO `bitacora` (`id`, `descripcion`, `fecha_modificacion`, `estudiante_id`, `bitacora_seccion_id`, `bitacora_modificacion_id`, `created_at`, `updated_at`) VALUES
(40, 'Se ha eliminado el tema: dgdfsgdfg del capítulo: Marco Teorico', '2022-07-06 18:27:32', 52, 7, 3, '2022-07-07 06:27:32', '2022-07-07 06:27:32'),
(41, 'Se ha modificado el contenido del capítulo: Marco Teorico', '2022-07-07 15:15:05', 52, 7, 2, '2022-07-08 03:15:05', '2022-07-08 03:15:05'),
(42, 'Se ha modificado el contenido del capítulo: Marco Teorico', '2022-07-07 15:15:13', 52, 7, 2, '2022-07-08 03:15:13', '2022-07-08 03:15:13'),
(43, 'Se ha eliminado el tema: (Sin tema) del capítulo: Marco Teorico', '2022-07-07 15:17:15', 52, 7, 3, '2022-07-08 03:17:15', '2022-07-08 03:17:15'),
(44, 'Se ha eliminado el tema: (Sin tema) del capítulo: Marco Teorico', '2022-07-07 15:17:17', 52, 7, 3, '2022-07-08 03:17:17', '2022-07-08 03:17:17'),
(45, 'Se ha eliminado el tema: (Sin tema) del capítulo: Marco Teorico', '2022-07-07 15:17:19', 52, 7, 3, '2022-07-08 03:17:19', '2022-07-08 03:17:19'),
(46, 'Se modificó la sección de resumen', '2022-07-07 20:20:05', 52, 3, 2, '2022-07-08 08:20:05', '2022-07-08 08:20:05'),
(47, 'Las secciones creadas fueron:\\n\\n- Resume', '2022-07-07 20:20:24', 52, 10, 4, '2022-07-08 08:20:24', '2022-07-08 08:20:24'),
(48, 'Se ha creado la dedicatoria de  Eduardo Alberto  Lopez Torres', '2022-07-08 01:00:17', 52, 2, 1, '2022-07-08 13:00:17', '2022-07-08 13:00:17'),
(49, 'La sección de dedicatorias cambió a estado: Es opcional', '2022-07-08 01:00:22', 52, 1, 2, '2022-07-08 13:00:22', '2022-07-08 13:00:22'),
(50, 'La sección de dedicatorias cambió a estado: No es opcional', '2022-07-08 01:00:53', 52, 2, 2, '2022-07-08 13:00:53', '2022-07-08 13:00:53'),
(51, 'La sección de dedicatorias cambió a estado: Es opcional', '2022-07-08 01:03:52', 52, 1, 2, '2022-07-08 13:03:52', '2022-07-08 13:03:52'),
(52, 'La sección de dedicatorias cambió a estado: No es opcional', '2022-07-08 01:04:08', 52, 2, 2, '2022-07-08 13:04:08', '2022-07-08 13:04:08'),
(53, 'La sección de dedicatorias cambió a estado: Es opcional', '2022-07-08 01:04:13', 52, 1, 2, '2022-07-08 13:04:13', '2022-07-08 13:04:13'),
(54, 'La sección de dedicatorias cambió a estado: No es opcional', '2022-07-08 01:04:29', 52, 2, 2, '2022-07-08 13:04:29', '2022-07-08 13:04:29'),
(55, 'La sección de dedicatorias cambió a estado: Es opcional', '2022-07-08 01:04:34', 52, 1, 2, '2022-07-08 13:04:34', '2022-07-08 13:04:34'),
(56, 'La sección de dedicatorias cambió a estado: No es opcional', '2022-07-08 01:04:46', 52, 2, 2, '2022-07-08 13:04:46', '2022-07-08 13:04:46'),
(57, 'La sección de dedicatorias cambió a estado: Es opcional', '2022-07-08 01:04:50', 52, 1, 2, '2022-07-08 13:04:50', '2022-07-08 13:04:50'),
(58, 'La sección de dedicatoria cambió a estado: No es opcional', '2022-07-08 01:05:08', 52, 2, 2, '2022-07-08 13:05:08', '2022-07-08 13:05:08'),
(59, 'La sección de dedicatoria cambió a estado: Es opcional', '2022-07-08 01:05:12', 52, 1, 2, '2022-07-08 13:05:12', '2022-07-08 13:05:12'),
(60, 'Se ha creado el agradecimiento de  Eduardo Alberto  Lopez Torres', '2022-07-08 01:06:11', 52, 1, 1, '2022-07-08 13:06:11', '2022-07-08 13:06:11'),
(61, 'La sección de agradecimiento cambió a estado: Es opcional', '2022-07-08 01:06:22', 52, 1, 2, '2022-07-08 13:06:22', '2022-07-08 13:06:22'),
(62, 'La sección de agradecimiento cambió a estado: No es opcional', '2022-07-08 01:06:26', 52, 2, 2, '2022-07-08 13:06:26', '2022-07-08 13:06:26'),
(63, 'La sección de dedicatoria cambió a estado: No es opcional', '2022-07-08 01:06:34', 52, 2, 2, '2022-07-08 13:06:34', '2022-07-08 13:06:34'),
(64, 'La sección de dedicatoria cambió a estado: Es opcional', '2022-07-08 01:06:38', 52, 1, 2, '2022-07-08 13:06:38', '2022-07-08 13:06:38'),
(65, 'Se cambió a estado: No es opcional', '2022-07-08 01:07:41', 52, 8, 2, '2022-07-08 13:07:41', '2022-07-08 13:07:41'),
(66, 'Se cambió a estado: Es opcional', '2022-07-08 01:07:53', 52, 8, 2, '2022-07-08 13:07:53', '2022-07-08 13:07:53'),
(67, 'Se cambió a estado: No es opcional', '2022-07-08 01:07:57', 52, 8, 2, '2022-07-08 13:07:57', '2022-07-08 13:07:57'),
(68, 'Se cambió a estado: Es opcional', '2022-07-08 01:08:12', 52, 8, 2, '2022-07-08 13:08:12', '2022-07-08 13:08:12'),
(69, 'Se cambió a estado: No es opcional', '2022-07-08 01:08:16', 52, 8, 2, '2022-07-08 13:08:16', '2022-07-08 13:08:16'),
(70, 'La sección de agradecimiento cambió a estado: Es opcional', '2022-07-08 01:08:51', 52, 1, 2, '2022-07-08 13:08:51', '2022-07-08 13:08:51'),
(71, 'La sección de agradecimiento cambió a estado: No es opcional', '2022-07-08 01:08:56', 52, 2, 2, '2022-07-08 13:08:56', '2022-07-08 13:08:56'),
(72, 'La sección de dedicatoria cambió a estado: No es opcional', '2022-07-08 01:09:01', 52, 2, 2, '2022-07-08 13:09:01', '2022-07-08 13:09:01'),
(73, 'La sección de dedicatoria cambió a estado: Es opcional', '2022-07-08 01:09:05', 52, 1, 2, '2022-07-08 13:09:05', '2022-07-08 13:09:05'),
(74, 'La sección de dedicatoria cambió a estado: No es opcional', '2022-07-08 01:09:09', 52, 2, 2, '2022-07-08 13:09:09', '2022-07-08 13:09:09'),
(75, 'La sección de agradecimiento cambió a estado: Es opcional', '2022-07-08 09:23:31', 52, 1, 2, '2022-07-08 21:23:31', '2022-07-08 21:23:31'),
(76, 'La sección de agradecimiento cambió a estado: No es opcional', '2022-07-08 09:23:44', 52, 2, 2, '2022-07-08 21:23:44', '2022-07-08 21:23:44'),
(77, 'La sección de agradecimiento cambió a estado: Es opcional', '2022-07-08 09:31:23', 52, 1, 2, '2022-07-08 21:31:23', '2022-07-08 21:31:23'),
(78, 'La sección de agradecimiento cambió a estado: No es opcional', '2022-07-08 09:31:24', 52, 2, 2, '2022-07-08 21:31:24', '2022-07-08 21:31:24'),
(79, 'Se ha eliminado la dedicatoria de Eduardo Alberto Lopez Torres', '2022-07-08 10:27:56', 52, 1, 3, '2022-07-08 22:27:56', '2022-07-08 22:27:56'),
(80, 'Se ha eliminado el agradecimiento de Eduardo Alberto Lopez Torres', '2022-07-08 10:32:41', 52, 1, 3, '2022-07-08 22:32:41', '2022-07-08 22:32:41'),
(81, 'Se ha creado el agradecimiento de  Eduardo Alberto  Lopez Torres', '2022-07-08 10:32:47', 52, 1, 1, '2022-07-08 22:32:47', '2022-07-08 22:32:47'),
(82, 'Se ha creado el agradecimiento de  Ruben Alexander  Sigüenza Argueta', '2022-07-08 10:33:04', 52, 1, 1, '2022-07-08 22:33:04', '2022-07-08 22:33:04'),
(83, 'Se ha creado el agradecimiento de  Joshua Steven  Sharp Reyes', '2022-07-08 10:33:15', 52, 1, 1, '2022-07-08 22:33:15', '2022-07-08 22:33:15'),
(84, 'Se modificó la sección de siglas', '2022-07-08 10:35:30', 52, 4, 2, '2022-07-08 22:35:30', '2022-07-08 22:35:30'),
(85, 'Se modificó la sección de abreviaciones', '2022-07-08 10:35:41', 52, 5, 2, '2022-07-08 22:35:41', '2022-07-08 22:35:41'),
(86, 'Se modificó la sección de nomenclaturas', '2022-07-08 10:36:05', 52, 6, 2, '2022-07-08 22:36:05', '2022-07-08 22:36:05'),
(87, 'Las secciones creadas fueron:\\n\\n- Portada y Segunda Portada\\n- Dedicatoria\\n- Resumen\\n- Índice\\n- Siglas\\n- Abreviaciones\\n- Nomenclaturas\\n- Capitulo 1. Introducción\\n- Capitulo 2. Marco Teorico\\n- Glosario\\n- Referencias', '2022-07-08 10:36:14', 52, 10, 4, '2022-07-08 22:36:14', '2022-07-08 22:36:14'),
(88, 'Las secciones creadas fueron:\\n\\n- Portada y Segunda Portada\\n- Dedicatoria\\n- Resumen\\n- Índice\\n- Siglas\\n- Abreviaciones\\n- Nomenclaturas\\n- Capitulo 1. Introducción\\n- Capitulo 2. Marco Teorico\\n- Glosario\\n- Referencias', '2022-07-08 10:38:40', 52, 10, 4, '2022-07-08 22:38:40', '2022-07-08 22:38:40'),
(89, 'Las secciones creadas fueron:\\n\\n- Portada y Segunda Portada\\n- Agradecimiento\\n- Resumen\\n- Índice\\n- Siglas\\n- Abreviaciones\\n- Nomenclaturas\\n- Capitulo 1. Introducción\\n- Capitulo 2. Marco Teorico\\n- Glosario\\n- Referencias', '2022-07-08 10:45:56', 52, 10, 4, '2022-07-08 22:45:56', '2022-07-08 22:45:56'),
(90, 'Se modificó la sección de abreviaciones', '2022-07-08 10:47:22', 52, 5, 2, '2022-07-08 22:47:22', '2022-07-08 22:47:22'),
(91, 'Se modificó la sección de siglas', '2022-07-08 10:48:35', 52, 4, 2, '2022-07-08 22:48:35', '2022-07-08 22:48:35'),
(92, 'Se modificó la sección de referencias', '2022-07-08 10:49:19', 52, 9, 2, '2022-07-08 22:49:19', '2022-07-08 22:49:19'),
(93, 'Se modificó la sección de glosario', '2022-07-08 10:50:34', 52, 8, 2, '2022-07-08 22:50:34', '2022-07-08 22:50:34'),
(94, 'Se modificó la sección de glosario', '2022-07-08 11:01:49', 52, 8, 2, '2022-07-08 23:01:49', '2022-07-08 23:01:49'),
(95, 'Las secciones creadas fueron:\\n\\n- Portada y Segunda Portada\\n- Agradecimiento\\n- Resumen\\n- Índice\\n- Siglas\\n- Abreviaciones\\n- Nomenclaturas\\n- Capitulo 1. Introducción\\n- Capitulo 2. Marco Teorico\\n- Glosario\\n- Referencias', '2022-07-08 11:01:59', 52, 10, 4, '2022-07-08 23:01:59', '2022-07-08 23:01:59'),
(96, 'Se modificó la sección de glosario', '2022-07-08 11:03:43', 52, 8, 2, '2022-07-08 23:03:43', '2022-07-08 23:03:43'),
(97, 'Las secciones creadas fueron:\\n\\n- Portada y Segunda Portada\\n- Agradecimiento\\n- Resumen\\n- Índice\\n- Siglas\\n- Abreviaciones\\n- Nomenclaturas\\n- Capitulo 1. Introducción\\n- Capitulo 2. Marco Teorico\\n- Glosario\\n- Referencias', '2022-07-08 11:03:55', 52, 10, 4, '2022-07-08 23:03:55', '2022-07-08 23:03:55'),
(98, 'Se modificó la sección de glosario', '2022-07-08 11:05:24', 52, 8, 2, '2022-07-08 23:05:24', '2022-07-08 23:05:24'),
(99, 'Las secciones creadas fueron:\\n\\n- Portada y Segunda Portada\\n- Agradecimiento\\n- Resumen\\n- Índice\\n- Siglas\\n- Abreviaciones\\n- Nomenclaturas\\n- Capitulo 1. Introducción\\n- Capitulo 2. Marco Teorico\\n- Glosario\\n- Referencias', '2022-07-08 11:05:34', 52, 10, 4, '2022-07-08 23:05:34', '2022-07-08 23:05:34'),
(100, 'Las secciones creadas fueron:\\n\\n- Portada y Segunda Portada\\n- Agradecimiento\\n- Resumen\\n- Índice\\n- Siglas\\n- Abreviaciones\\n- Nomenclaturas\\n- Capitulo 1. Introducción\\n- Capitulo 2. Marco Teorico\\n- Glosario\\n- Referencias', '2022-07-08 11:05:57', 52, 10, 4, '2022-07-08 23:05:57', '2022-07-08 23:05:57'),
(101, 'Las secciones creadas fueron:\\n\\n- Portada y Segunda Portada\\n- Agradecimiento\\n- Resumen\\n- Índice\\n- Siglas\\n- Abreviaciones\\n- Nomenclaturas\\n- Capitulo 1. Introducción\\n- Capitulo 2. Marco Teorico\\n- Glosario\\n- Referencias', '2022-07-08 11:08:03', 52, 10, 4, '2022-07-08 23:08:03', '2022-07-08 23:08:03'),
(102, 'Las secciones creadas fueron:\\n\\n- Portada y Segunda Portada\\n- Agradecimiento\\n- Resumen\\n- Índice\\n- Siglas\\n- Abreviaciones\\n- Nomenclaturas\\n- Capitulo 1. Introducción\\n- Capitulo 2. Marco Teorico\\n- Referencias', '2022-07-08 11:08:29', 52, 10, 4, '2022-07-08 23:08:29', '2022-07-08 23:08:29'),
(103, 'Las secciones creadas fueron:\\n\\n- Portada y Segunda Portada\\n- Agradecimiento\\n- Resumen\\n- Índice\\n- Siglas\\n- Abreviaciones\\n- Nomenclaturas\\n- Capitulo 1. Introducción\\n- Capitulo 2. Marco Teorico\\n- Glosario\\n- Referencias', '2022-07-08 11:09:13', 52, 10, 4, '2022-07-08 23:09:13', '2022-07-08 23:09:13'),
(104, 'Las secciones creadas fueron:\\n\\n- Portada y Segunda Portada\\n- Agradecimiento\\n- Resumen\\n- Índice\\n- Siglas\\n- Abreviaciones\\n- Nomenclaturas\\n- Capitulo 1. Introducción\\n- Capitulo 2. Marco Teorico\\n- Glosario\\n- Referencias', '2022-07-08 11:09:42', 52, 10, 4, '2022-07-08 23:09:42', '2022-07-08 23:09:42'),
(105, 'Las secciones creadas fueron:\\n\\n- Portada y Segunda Portada\\n- Agradecimiento\\n- Resumen\\n- Índice\\n- Siglas\\n- Abreviaciones\\n- Nomenclaturas\\n- Capitulo 1. Introducción\\n- Capitulo 2. Marco Teorico\\n- Glosario\\n- Referencias', '2022-07-08 11:10:02', 52, 10, 4, '2022-07-08 23:10:02', '2022-07-08 23:10:02'),
(106, 'Las secciones creadas fueron:\\n\\n- Portada y Segunda Portada\\n- Agradecimiento\\n- Resumen\\n- Índice\\n- Siglas\\n- Abreviaciones\\n- Nomenclaturas\\n- Capitulo 1. Introducción\\n- Capitulo 2. Marco Teorico\\n- Glosario\\n- Referencias', '2022-07-08 11:12:20', 52, 10, 4, '2022-07-08 23:12:20', '2022-07-08 23:12:20'),
(107, 'Las secciones creadas fueron:\\n\\n- Portada y Segunda Portada', '2022-07-08 11:17:38', 52, 10, 4, '2022-07-08 23:17:38', '2022-07-08 23:17:38'),
(108, 'Las secciones creadas fueron:\\n\\n- Portada y Segunda Portada\\n- Agradecimiento', '2022-07-08 11:17:55', 52, 10, 4, '2022-07-08 23:17:55', '2022-07-08 23:17:55'),
(109, 'Las secciones creadas fueron:\\n\\n- Portada y Segunda Portada\\n- Agradecimiento\\n- Resume', '2022-07-08 11:18:09', 52, 10, 4, '2022-07-08 23:18:09', '2022-07-08 23:18:09'),
(110, 'Las secciones creadas fueron:\\n\\n- Portada y Segunda Portada\\n- Agradecimiento\\n- Resumen\\n- Índice', '2022-07-08 11:18:22', 52, 10, 4, '2022-07-08 23:18:22', '2022-07-08 23:18:22'),
(111, 'Las secciones creadas fueron:\\n\\n- Portada y Segunda Portada\\n- Agradecimiento\\n- Resumen\\n- Índice\\n- Siglas', '2022-07-08 11:18:38', 52, 10, 4, '2022-07-08 23:18:38', '2022-07-08 23:18:38'),
(112, 'Las secciones creadas fueron:\\n\\n- Portada y Segunda Portada\\n- Agradecimiento\\n- Resumen\\n- Índice\\n- Siglas\\n- Abreviaciones\\n- Nomenclaturas', '2022-07-08 11:19:04', 52, 10, 4, '2022-07-08 23:19:04', '2022-07-08 23:19:04'),
(113, 'Las secciones creadas fueron:\\n\\n- Portada y Segunda Portada\\n- Agradecimiento\\n- Resumen\\n- Índice\\n- Siglas\\n- Abreviaciones\\n- Nomenclaturas\\n- Capitulo 1. Introducción\\n- Capitulo 2. Marco Teorico', '2022-07-08 11:19:25', 52, 10, 4, '2022-07-08 23:19:25', '2022-07-08 23:19:25'),
(114, 'Las secciones creadas fueron:\\n\\n- Portada y Segunda Portada\\n- Agradecimiento\\n- Resumen\\n- Índice\\n- Siglas\\n- Abreviaciones\\n- Nomenclaturas\\n- Capitulo 1. Introducción\\n- Capitulo 2. Marco Teorico\\n- Glosario', '2022-07-08 11:19:43', 52, 10, 4, '2022-07-08 23:19:43', '2022-07-08 23:19:43'),
(115, 'Las secciones creadas fueron:\\n\\n- Portada y Segunda Portada\\n- Agradecimiento\\n- Resumen\\n- Índice\\n- Siglas\\n- Abreviaciones\\n- Nomenclaturas\\n- Capitulo 1. Introducción\\n- Capitulo 2. Marco Teorico\\n- Glosario\\n- Referencias', '2022-07-08 11:20:00', 52, 10, 4, '2022-07-08 23:20:00', '2022-07-08 23:20:00'),
(116, 'La sección de agradecimiento cambió a estado: Es opcional', '2022-07-08 11:22:23', 52, 1, 2, '2022-07-08 23:22:23', '2022-07-08 23:22:23'),
(117, 'La sección de agradecimiento cambió a estado: No es opcional', '2022-07-08 11:22:28', 52, 2, 2, '2022-07-08 23:22:28', '2022-07-08 23:22:28'),
(118, 'Se modificó la sección de referencias', '2022-07-08 11:23:22', 52, 9, 2, '2022-07-08 23:23:22', '2022-07-08 23:23:22'),
(119, 'Las secciones creadas fueron:\\n\\n- Portada y Segunda Portada\\n- Agradecimiento\\n- Resumen\\n- Índice\\n- Siglas\\n- Abreviaciones\\n- Nomenclaturas\\n- Capitulo 1. Introducción\\n- Capitulo 2. Marco Teorico\\n- Glosario\\n- Referencias', '2022-07-08 11:23:53', 52, 10, 4, '2022-07-08 23:23:53', '2022-07-08 23:23:53'),
(120, 'Se modificó la sección de glosario', '2022-07-08 11:25:01', 52, 8, 2, '2022-07-08 23:25:01', '2022-07-08 23:25:01'),
(121, 'Las secciones creadas fueron:\\n\\n- Portada y Segunda Portada\\n- Agradecimiento\\n- Resumen\\n- Índice\\n- Siglas\\n- Abreviaciones\\n- Nomenclaturas\\n- Capitulo 1. Introducción\\n- Capitulo 2. Marco Teorico\\n- Glosario\\n- Referencias', '2022-07-08 11:25:10', 52, 10, 4, '2022-07-08 23:25:10', '2022-07-08 23:25:10'),
(122, 'Se modificó la sección de referencias', '2022-07-08 11:32:38', 52, 9, 2, '2022-07-08 23:32:38', '2022-07-08 23:32:38'),
(123, 'Las secciones creadas fueron:\\n\\n- Portada y Segunda Portada\\n- Agradecimiento\\n- Resumen\\n- Índice\\n- Siglas\\n- Abreviaciones\\n- Nomenclaturas\\n- Capitulo 1. Introducción\\n- Capitulo 2. Marco Teorico\\n- Glosario\\n- Referencias', '2022-07-08 11:32:47', 52, 10, 4, '2022-07-08 23:32:47', '2022-07-08 23:32:47'),
(124, 'Se modificó la sección de referencias', '2022-07-08 11:34:11', 52, 9, 2, '2022-07-08 23:34:11', '2022-07-08 23:34:11'),
(125, 'Las secciones creadas fueron:\\n\\n- Portada y Segunda Portada\\n- Agradecimiento\\n- Resumen\\n- Índice\\n- Siglas\\n- Abreviaciones\\n- Nomenclaturas\\n- Capitulo 1. Introducción\\n- Capitulo 2. Marco Teorico\\n- Glosario\\n- Referencias', '2022-07-08 11:34:23', 52, 10, 4, '2022-07-08 23:34:23', '2022-07-08 23:34:23'),
(126, 'Se modificó la sección de referencias', '2022-07-08 11:34:56', 52, 9, 2, '2022-07-08 23:34:56', '2022-07-08 23:34:56'),
(127, 'Las secciones creadas fueron:\\n\\n- Portada y Segunda Portada\\n- Agradecimiento\\n- Resumen\\n- Índice\\n- Siglas\\n- Abreviaciones\\n- Nomenclaturas\\n- Capitulo 1. Introducción\\n- Capitulo 2. Marco Teorico\\n- Glosario\\n- Referencias', '2022-07-08 11:35:11', 52, 10, 4, '2022-07-08 23:35:11', '2022-07-08 23:35:11'),
(128, 'Se modificó la sección de referencias', '2022-07-08 11:39:40', 52, 9, 2, '2022-07-08 23:39:40', '2022-07-08 23:39:40'),
(129, 'Las secciones creadas fueron:\\n\\n- Portada y Segunda Portada\\n- Agradecimiento\\n- Resumen\\n- Índice\\n- Siglas\\n- Abreviaciones\\n- Nomenclaturas\\n- Capitulo 1. Introducción\\n- Capitulo 2. Marco Teorico\\n- Glosario\\n- Referencias', '2022-07-08 11:40:22', 52, 10, 4, '2022-07-08 23:40:22', '2022-07-08 23:40:22'),
(130, 'Las secciones creadas fueron:\\n\\n- Referencias', '2022-07-08 11:44:38', 52, 10, 4, '2022-07-08 23:44:38', '2022-07-08 23:44:38'),
(131, 'Se modificó la sección de referencias', '2022-07-08 11:51:24', 52, 9, 2, '2022-07-08 23:51:24', '2022-07-08 23:51:24'),
(132, 'Las secciones creadas fueron:\\n\\n- Portada y Segunda Portada\\n- Agradecimiento\\n- Resumen\\n- Índice\\n- Siglas\\n- Abreviaciones\\n- Nomenclaturas\\n- Capitulo 1. Introducción\\n- Capitulo 2. Marco Teorico\\n- Glosario\\n- Referencias', '2022-07-08 11:51:33', 52, 10, 4, '2022-07-08 23:51:33', '2022-07-08 23:51:33'),
(133, 'Las secciones creadas fueron:\\n\\n- Portada y Segunda Portada\\n- Agradecimiento\\n- Resumen\\n- Índice\\n- Siglas\\n- Abreviaciones\\n- Nomenclaturas\\n- Capitulo 1. Introducción\\n- Capitulo 2. Marco Teorico\\n- Referencias', '2022-07-08 11:52:58', 52, 10, 4, '2022-07-08 23:52:58', '2022-07-08 23:52:58'),
(134, 'Se modificó la sección de referencias', '2022-07-08 11:55:20', 52, 9, 2, '2022-07-08 23:55:20', '2022-07-08 23:55:20'),
(135, 'Las secciones creadas fueron:\\n\\n- Portada y Segunda Portada\\n- Agradecimiento\\n- Resumen\\n- Índice\\n- Siglas\\n- Abreviaciones\\n- Nomenclaturas\\n- Capitulo 1. Introducción\\n- Capitulo 2. Marco Teorico\\n- Glosario\\n- Referencias', '2022-07-08 11:55:28', 52, 10, 4, '2022-07-08 23:55:28', '2022-07-08 23:55:28'),
(136, 'Se modificó la sección de referencias', '2022-07-08 11:55:42', 52, 9, 2, '2022-07-08 23:55:42', '2022-07-08 23:55:42'),
(137, 'Las secciones creadas fueron:\\n\\n- Portada y Segunda Portada\\n- Agradecimiento\\n- Resumen\\n- Índice\\n- Siglas\\n- Abreviaciones\\n- Nomenclaturas\\n- Capitulo 1. Introducción\\n- Capitulo 2. Marco Teorico\\n- Glosario\\n- Referencias', '2022-07-08 11:55:52', 52, 10, 4, '2022-07-08 23:55:52', '2022-07-08 23:55:52'),
(138, 'Se modificó la sección de referencias', '2022-07-08 11:56:07', 52, 9, 2, '2022-07-08 23:56:07', '2022-07-08 23:56:07'),
(139, 'Las secciones creadas fueron:\\n\\n- Portada y Segunda Portada\\n- Agradecimiento\\n- Resumen\\n- Índice\\n- Siglas\\n- Abreviaciones\\n- Nomenclaturas\\n- Capitulo 1. Introducción\\n- Capitulo 2. Marco Teorico\\n- Glosario\\n- Referencias', '2022-07-08 11:56:16', 52, 10, 4, '2022-07-08 23:56:16', '2022-07-08 23:56:16'),
(140, 'Se modificó la sección de referencias', '2022-07-08 11:56:32', 52, 9, 2, '2022-07-08 23:56:32', '2022-07-08 23:56:32'),
(141, 'Se modificó la sección de referencias', '2022-07-08 11:56:49', 52, 9, 2, '2022-07-08 23:56:49', '2022-07-08 23:56:49'),
(142, 'Las secciones creadas fueron:\\n\\n- Portada y Segunda Portada\\n- Agradecimiento\\n- Resumen\\n- Índice\\n- Siglas\\n- Abreviaciones\\n- Nomenclaturas\\n- Capitulo 1. Introducción\\n- Capitulo 2. Marco Teorico\\n- Glosario\\n- Referencias', '2022-07-08 11:57:02', 52, 10, 4, '2022-07-08 23:57:02', '2022-07-08 23:57:02'),
(143, 'Se modificó la sección de referencias', '2022-07-08 11:57:17', 52, 9, 2, '2022-07-08 23:57:17', '2022-07-08 23:57:17'),
(144, 'Las secciones creadas fueron:\\n\\n- Portada y Segunda Portada\\n- Agradecimiento\\n- Resumen\\n- Índice\\n- Siglas\\n- Abreviaciones\\n- Nomenclaturas\\n- Capitulo 1. Introducción\\n- Capitulo 2. Marco Teorico\\n- Glosario\\n- Referencias', '2022-07-08 11:57:31', 52, 10, 4, '2022-07-08 23:57:31', '2022-07-08 23:57:31'),
(145, 'Se modificó la sección de referencias', '2022-07-08 11:57:43', 52, 9, 2, '2022-07-08 23:57:43', '2022-07-08 23:57:43'),
(146, 'Las secciones creadas fueron:\\n\\n- Portada y Segunda Portada\\n- Agradecimiento\\n- Resumen\\n- Índice\\n- Siglas\\n- Abreviaciones\\n- Nomenclaturas\\n- Capitulo 1. Introducción\\n- Capitulo 2. Marco Teorico\\n- Glosario\\n- Referencias', '2022-07-08 11:58:02', 52, 10, 4, '2022-07-08 23:58:02', '2022-07-08 23:58:02'),
(147, 'Se modificó la sección de referencias', '2022-07-08 11:58:33', 52, 9, 2, '2022-07-08 23:58:33', '2022-07-08 23:58:33'),
(148, 'Las secciones creadas fueron:\\n\\n- Portada y Segunda Portada\\n- Agradecimiento\\n- Resumen\\n- Índice\\n- Siglas\\n- Abreviaciones\\n- Nomenclaturas\\n- Capitulo 1. Introducción\\n- Capitulo 2. Marco Teorico\\n- Glosario\\n- Referencias', '2022-07-08 11:58:41', 52, 10, 4, '2022-07-08 23:58:41', '2022-07-08 23:58:41'),
(149, 'Se modificó la sección de referencias', '2022-07-08 11:58:58', 52, 9, 2, '2022-07-08 23:58:58', '2022-07-08 23:58:58'),
(150, 'Las secciones creadas fueron:\\n\\n- Portada y Segunda Portada\\n- Agradecimiento\\n- Resumen\\n- Índice\\n- Siglas\\n- Abreviaciones\\n- Nomenclaturas\\n- Capitulo 1. Introducción\\n- Capitulo 2. Marco Teorico\\n- Glosario\\n- Referencias', '2022-07-08 11:59:07', 52, 10, 4, '2022-07-08 23:59:07', '2022-07-08 23:59:07'),
(151, 'Se modificó la sección de referencias', '2022-07-08 12:02:04', 52, 9, 2, '2022-07-09 00:02:04', '2022-07-09 00:02:04'),
(152, 'Las secciones creadas fueron:\\n\\n- Portada y Segunda Portada\\n- Agradecimiento\\n- Resumen\\n- Índice\\n- Siglas\\n- Abreviaciones\\n- Nomenclaturas\\n- Capitulo 1. Introducción\\n- Capitulo 2. Marco Teorico\\n- Glosario\\n- Referencias', '2022-07-08 12:02:13', 52, 10, 4, '2022-07-09 00:02:13', '2022-07-09 00:02:13'),
(153, 'Se modificó la sección de referencias', '2022-07-08 12:02:34', 52, 9, 2, '2022-07-09 00:02:34', '2022-07-09 00:02:34'),
(154, 'Se modificó la sección de referencias', '2022-07-08 12:02:39', 52, 9, 2, '2022-07-09 00:02:39', '2022-07-09 00:02:39'),
(155, 'Las secciones creadas fueron:\\n\\n- Portada y Segunda Portada\\n- Agradecimiento\\n- Resumen\\n- Índice\\n- Siglas\\n- Abreviaciones\\n- Nomenclaturas\\n- Capitulo 1. Introducción\\n- Capitulo 2. Marco Teorico\\n- Glosario\\n- Referencias', '2022-07-08 12:02:47', 52, 10, 4, '2022-07-09 00:02:47', '2022-07-09 00:02:47'),
(156, 'Se modificó la sección de referencias', '2022-07-08 12:03:18', 52, 9, 2, '2022-07-09 00:03:18', '2022-07-09 00:03:18'),
(157, 'Las secciones creadas fueron:\\n\\n- Portada y Segunda Portada\\n- Agradecimiento\\n- Resumen\\n- Índice\\n- Siglas\\n- Abreviaciones\\n- Nomenclaturas\\n- Capitulo 1. Introducción\\n- Capitulo 2. Marco Teorico\\n- Glosario\\n- Referencias', '2022-07-08 12:03:28', 52, 10, 4, '2022-07-09 00:03:28', '2022-07-09 00:03:28'),
(158, 'Se modificó la sección de referencias', '2022-07-08 12:03:42', 52, 9, 2, '2022-07-09 00:03:42', '2022-07-09 00:03:42'),
(159, 'Las secciones creadas fueron:\\n\\n- Portada y Segunda Portada\\n- Agradecimiento\\n- Resumen\\n- Índice\\n- Siglas\\n- Abreviaciones\\n- Nomenclaturas\\n- Capitulo 1. Introducción\\n- Capitulo 2. Marco Teorico\\n- Glosario\\n- Referencias', '2022-07-08 12:03:51', 52, 10, 4, '2022-07-09 00:03:51', '2022-07-09 00:03:51'),
(160, 'Se modificó la sección de referencias', '2022-07-08 12:04:23', 52, 9, 2, '2022-07-09 00:04:23', '2022-07-09 00:04:23'),
(161, 'Las secciones creadas fueron:\\n\\n- Portada y Segunda Portada\\n- Agradecimiento\\n- Resumen\\n- Índice\\n- Siglas\\n- Abreviaciones\\n- Nomenclaturas\\n- Capitulo 1. Introducción\\n- Capitulo 2. Marco Teorico\\n- Glosario\\n- Referencias', '2022-07-08 12:04:29', 52, 10, 4, '2022-07-09 00:04:29', '2022-07-09 00:04:29'),
(162, 'Se modificó la sección de referencias', '2022-07-08 12:05:05', 52, 9, 2, '2022-07-09 00:05:05', '2022-07-09 00:05:05'),
(163, 'Las secciones creadas fueron:\\n\\n- Portada y Segunda Portada\\n- Agradecimiento\\n- Resumen\\n- Índice\\n- Siglas\\n- Abreviaciones\\n- Nomenclaturas\\n- Capitulo 1. Introducción\\n- Capitulo 2. Marco Teorico\\n- Glosario\\n- Referencias', '2022-07-08 12:05:13', 52, 10, 4, '2022-07-09 00:05:13', '2022-07-09 00:05:13'),
(164, 'Se modificó la sección de referencias', '2022-07-08 12:08:12', 52, 9, 2, '2022-07-09 00:08:12', '2022-07-09 00:08:12'),
(165, 'Las secciones creadas fueron:\\n\\n- Portada y Segunda Portada\\n- Agradecimiento\\n- Resumen\\n- Índice\\n- Siglas\\n- Abreviaciones\\n- Nomenclaturas\\n- Capitulo 1. Introducción\\n- Capitulo 2. Marco Teorico\\n- Glosario\\n- Referencias', '2022-07-08 12:08:19', 52, 10, 4, '2022-07-09 00:08:19', '2022-07-09 00:08:19'),
(166, 'Se modificó la sección de referencias', '2022-07-08 12:09:12', 52, 9, 2, '2022-07-09 00:09:12', '2022-07-09 00:09:12'),
(167, 'Se modificó la sección de referencias', '2022-07-08 12:09:53', 52, 9, 2, '2022-07-09 00:09:53', '2022-07-09 00:09:53'),
(168, 'Las secciones creadas fueron:\\n\\n- Portada y Segunda Portada\\n- Agradecimiento\\n- Resumen\\n- Índice\\n- Siglas\\n- Abreviaciones\\n- Nomenclaturas\\n- Capitulo 1. Introducción\\n- Capitulo 2. Marco Teorico\\n- Glosario\\n- Referencias', '2022-07-08 12:10:00', 52, 10, 4, '2022-07-09 00:10:00', '2022-07-09 00:10:00'),
(169, 'Se modificó la sección de referencias', '2022-07-08 12:17:42', 52, 9, 2, '2022-07-09 00:17:42', '2022-07-09 00:17:42'),
(170, 'Las secciones creadas fueron:\\n\\n- Portada y Segunda Portada\\n- Agradecimiento\\n- Resumen\\n- Índice\\n- Siglas\\n- Abreviaciones\\n- Nomenclaturas\\n- Capitulo 1. Introducción\\n- Capitulo 2. Marco Teorico\\n- Glosario\\n- Referencias', '2022-07-08 12:17:49', 52, 10, 4, '2022-07-09 00:17:49', '2022-07-09 00:17:49'),
(171, 'Se modificó la sección de referencias', '2022-07-08 12:19:32', 52, 9, 2, '2022-07-09 00:19:32', '2022-07-09 00:19:32'),
(172, 'Las secciones creadas fueron:\\n\\n- Portada y Segunda Portada\\n- Agradecimiento\\n- Resumen\\n- Índice\\n- Siglas\\n- Abreviaciones\\n- Nomenclaturas\\n- Capitulo 1. Introducción\\n- Capitulo 2. Marco Teorico\\n- Glosario\\n- Referencias', '2022-07-08 12:19:40', 52, 10, 4, '2022-07-09 00:19:40', '2022-07-09 00:19:40'),
(173, 'Se modificó la sección de referencias', '2022-07-08 12:23:35', 52, 9, 2, '2022-07-09 00:23:35', '2022-07-09 00:23:35'),
(174, 'Las secciones creadas fueron:\\n\\n- Portada y Segunda Portada\\n- Agradecimiento\\n- Resumen\\n- Índice\\n- Siglas\\n- Abreviaciones\\n- Nomenclaturas\\n- Capitulo 1. Introducción\\n- Capitulo 2. Marco Teorico\\n- Glosario\\n- Referencias', '2022-07-08 12:23:42', 52, 10, 4, '2022-07-09 00:23:42', '2022-07-09 00:23:42'),
(175, 'Las secciones creadas fueron:\\n\\n- Portada y Segunda Portada\\n- Agradecimiento\\n- Resumen\\n- Índice\\n- Siglas\\n- Abreviaciones\\n- Nomenclaturas\\n- Capitulo 1. Introducción\\n- Capitulo 2. Marco Teorico\\n- Glosario\\n- Referencias', '2022-07-08 12:30:25', 52, 10, 4, '2022-07-09 00:30:25', '2022-07-09 00:30:25'),
(176, 'Se modificó la sección de referencias', '2022-07-08 12:31:10', 52, 9, 2, '2022-07-09 00:31:10', '2022-07-09 00:31:10'),
(177, 'Las secciones creadas fueron:\\n\\n- Portada y Segunda Portada\\n- Agradecimiento\\n- Resumen\\n- Índice\\n- Siglas\\n- Abreviaciones\\n- Nomenclaturas\\n- Capitulo 1. Introducción\\n- Capitulo 2. Marco Teorico\\n- Glosario\\n- Referencias', '2022-07-08 12:31:18', 52, 10, 4, '2022-07-09 00:31:18', '2022-07-09 00:31:18'),
(178, 'Se cambió a estado: Es opcional', '2022-07-08 22:03:52', 52, 8, 2, '2022-07-09 10:03:52', '2022-07-09 10:03:52'),
(179, 'Se cambió a estado: No es opcional', '2022-07-08 22:08:02', 52, 8, 2, '2022-07-09 10:08:02', '2022-07-09 10:08:02'),
(180, 'Las secciones creadas fueron:\\n\\n- Portada y Segunda Portada\\n- Agradecimiento\\n- Resumen\\n- Índice\\n- Siglas\\n- Abreviaciones\\n- Nomenclaturas\\n- Capitulo 1. Introducción\\n- Capitulo 2. Marco Teorico\\n- Glosario\\n- Referencias', '2022-07-08 22:08:10', 52, 10, 4, '2022-07-09 10:08:10', '2022-07-09 10:08:10'),
(181, 'Las secciones creadas fueron:\\n\\n- Portada y Segunda Portada\\n- Agradecimiento\\n- Resumen\\n- Índice\\n- Siglas\\n- Abreviaciones\\n- Nomenclaturas\\n- Capitulo 1. Introducción\\n- Capitulo 2. Marco Teorico\\n- Glosario\\n- Referencias', '2022-07-08 23:35:07', 52, 10, 4, '2022-07-09 11:35:07', '2022-07-09 11:35:07'),
(182, 'Las secciones creadas fueron:\\n\\n- Portada y Segunda Portada\\n- Agradecimiento\\n- Resumen\\n- Índice\\n- Siglas\\n- Abreviaciones\\n- Nomenclaturas\\n- Capitulo 1. Introducción\\n- Capitulo 2. Marco Teorico\\n- Glosario\\n- Referencias', '2022-07-10 16:00:59', 52, 10, 4, '2022-07-11 04:00:59', '2022-07-11 04:00:59'),
(183, 'Las secciones creadas fueron:\\n\\n- Portada y Segunda Portada\\n- Agradecimiento\\n- Resumen\\n- Índice\\n- Siglas\\n- Abreviaciones\\n- Nomenclaturas\\n- Capitulo 1. Introducción\\n- Capitulo 2. Marco Teorico\\n- Glosario\\n- Referencias', '2022-07-10 16:12:55', 52, 10, 4, '2022-07-11 04:12:55', '2022-07-11 04:12:55'),
(184, 'Las secciones creadas fueron:\\n\\n- Portada y Segunda Portada\\n- Agradecimiento\\n- Resumen\\n- Índice\\n- Siglas\\n- Abreviaciones\\n- Nomenclaturas\\n- Capitulo 1. Introducción\\n- Capitulo 2. Marco Teorico\\n- Glosario\\n- Referencias', '2022-07-10 16:21:43', 52, 10, 4, '2022-07-11 04:21:43', '2022-07-11 04:21:43'),
(185, 'La sección de agradecimiento cambió a estado: Es opcional', '2022-07-10 16:48:25', 53, 1, 2, '2022-07-11 04:48:25', '2022-07-11 04:48:25'),
(186, 'La sección de agradecimiento cambió a estado: No es opcional', '2022-07-10 16:48:29', 53, 2, 2, '2022-07-11 04:48:29', '2022-07-11 04:48:29'),
(187, 'La sección de agradecimiento cambió a estado: Es opcional', '2022-07-10 16:48:36', 53, 1, 2, '2022-07-11 04:48:36', '2022-07-11 04:48:36'),
(188, 'La sección de agradecimiento cambió a estado: No es opcional', '2022-07-10 16:48:41', 53, 2, 2, '2022-07-11 04:48:41', '2022-07-11 04:48:41'),
(189, 'Se ha creado la dedicatoria de  Eduardo Alberto  Lopez Torres', '2022-07-10 16:48:55', 53, 2, 1, '2022-07-11 04:48:55', '2022-07-11 04:48:55'),
(190, 'La sección de dedicatoria cambió a estado: Es opcional', '2022-07-10 16:49:21', 53, 1, 2, '2022-07-11 04:49:21', '2022-07-11 04:49:21'),
(191, 'La sección de dedicatoria cambió a estado: No es opcional', '2022-07-10 16:49:23', 53, 2, 2, '2022-07-11 04:49:23', '2022-07-11 04:49:23'),
(192, 'Se ha eliminado la dedicatoria de Eduardo Alberto Lopez Torres', '2022-07-10 16:49:28', 53, 1, 3, '2022-07-11 04:49:28', '2022-07-11 04:49:28'),
(193, 'Se ha creado la dedicatoria de  Eduardo Alberto  Lopez Torres', '2022-07-10 16:50:23', 53, 2, 1, '2022-07-11 04:50:23', '2022-07-11 04:50:23'),
(194, 'Se cambió a estado: Es opcional', '2022-07-10 16:51:35', 53, 8, 2, '2022-07-11 04:51:35', '2022-07-11 04:51:35'),
(195, 'Se modificó la sección de glosario', '2022-07-10 16:51:43', 53, 8, 2, '2022-07-11 04:51:43', '2022-07-11 04:51:43'),
(196, 'Se ha modificado el contenido del capítulo: Introducción', '2022-07-10 16:54:40', 53, 7, 2, '2022-07-11 04:54:40', '2022-07-11 04:54:40'),
(197, 'Las secciones creadas fueron:\\n\\n- Portada y Segunda Portada\\n- Dedicatoria\\n- Agradecimiento\\n- Resumen\\n- Índice\\n- Siglas\\n- Abreviaciones\\n- Nomenclaturas\\n- Capitulo 1. Introducción\\n- Capitulo 2. Marco Teorico\\n- Referencias', '2022-07-10 22:28:11', 52, 10, 4, '2022-07-11 10:28:11', '2022-07-11 10:28:11'),
(198, 'Se modificó la sección de resumen', '2022-07-11 22:21:08', 52, 3, 2, '2022-07-12 10:21:08', '2022-07-12 10:21:08'),
(199, 'Se ha eliminado el capítulo: Marco Teorico', '2022-07-11 22:47:21', 52, 7, 3, '2022-07-12 10:47:21', '2022-07-12 10:47:21'),
(200, 'Se ha modificado el capítulo: Introducción. El nuevo nombre del capítulo es: Introducción 4', '2022-07-11 22:54:17', 52, 7, 2, '2022-07-12 10:54:17', '2022-07-12 10:54:17'),
(201, 'Se ha creado el capítulo: sdfsdf', '2022-07-11 22:55:12', 52, 7, 1, '2022-07-12 10:55:12', '2022-07-12 10:55:12'),
(202, 'Se ha eliminado el tema: (Sin tema) del capítulo: Introducción 4', '2022-07-11 23:40:17', 52, 7, 3, '2022-07-12 11:40:17', '2022-07-12 11:40:17'),
(203, 'La sección de agradecimiento cambió a estado: Es opcional', '2022-07-11 23:43:23', 52, 1, 2, '2022-07-12 11:43:23', '2022-07-12 11:43:23'),
(204, 'La sección de agradecimiento cambió a estado: No es opcional', '2022-07-11 23:43:39', 52, 2, 2, '2022-07-12 11:43:39', '2022-07-12 11:43:39'),
(205, 'La sección de agradecimiento cambió a estado: Es opcional', '2022-07-11 23:43:43', 52, 1, 2, '2022-07-12 11:43:43', '2022-07-12 11:43:43'),
(206, 'Se ha eliminado el capítulo: sdfsdf', '2022-07-12 18:44:39', 53, 7, 3, '2022-07-13 06:44:39', '2022-07-13 06:44:39'),
(207, 'Se ha eliminado el capítulo: Introducción 4', '2022-07-12 18:44:42', 53, 7, 3, '2022-07-13 06:44:42', '2022-07-13 06:44:42'),
(208, 'Las secciones creadas fueron:\\n\\n- Portada y Segunda Portada\\n- Dedicatoria\\n- Resumen\\n- Índice\\n- Siglas\\n- Abreviaciones\\n- Nomenclaturas\\n- Referencias', '2022-07-12 18:45:25', 53, 10, 4, '2022-07-13 06:45:25', '2022-07-13 06:45:25'),
(209, 'Se ha creado el capítulo: Introducción', '2022-07-12 18:47:55', 53, 7, 1, '2022-07-13 06:47:55', '2022-07-13 06:47:55'),
(210, 'Se ha creado el capítulo: Marco Teórico', '2022-07-12 18:48:07', 53, 7, 1, '2022-07-13 06:48:07', '2022-07-13 06:48:07'),
(211, 'Se ha creado el capítulo: Requerimientos del Sistema', '2022-07-12 18:48:38', 53, 7, 1, '2022-07-13 06:48:38', '2022-07-13 06:48:38'),
(212, 'Se ha creado el capítulo: Herramientas y Metodologías del trabajo', '2022-07-12 18:49:00', 53, 7, 1, '2022-07-13 06:49:00', '2022-07-13 06:49:00'),
(213, 'Se ha creado el capítulo: Diseño del sistema', '2022-07-12 18:49:18', 53, 7, 1, '2022-07-13 06:49:18', '2022-07-13 06:49:18'),
(214, 'Se ha creado el capítulo: Desarrollo y pruebas del sistema', '2022-07-12 18:49:37', 53, 7, 1, '2022-07-13 06:49:37', '2022-07-13 06:49:37'),
(215, 'Se ha creado el capítulo: Conclusiones y recomendaciones', '2022-07-12 18:49:56', 53, 7, 1, '2022-07-13 06:49:56', '2022-07-13 06:49:56'),
(216, 'Se ha modificado el contenido del capítulo: Introducción', '2022-07-12 18:52:10', 53, 7, 2, '2022-07-13 06:52:10', '2022-07-13 06:52:10'),
(217, 'Se ha eliminado el tema:  del capítulo: Marco Teórico', '2022-07-12 19:09:29', 53, 7, 3, '2022-07-13 07:09:29', '2022-07-13 07:09:29'),
(218, 'Se ha modificado el contenido del capítulo: Marco Teórico', '2022-07-12 19:14:56', 53, 7, 2, '2022-07-13 07:14:56', '2022-07-13 07:14:56'),
(219, 'Se ha modificado el contenido del capítulo: Marco Teórico', '2022-07-12 19:15:08', 53, 7, 2, '2022-07-13 07:15:08', '2022-07-13 07:15:08'),
(220, 'Se ha modificado el contenido del capítulo: Marco Teórico', '2022-07-12 19:17:05', 53, 7, 2, '2022-07-13 07:17:05', '2022-07-13 07:17:05'),
(221, 'Se ha modificado el contenido del capítulo: Marco Teórico', '2022-07-12 19:17:48', 53, 7, 2, '2022-07-13 07:17:48', '2022-07-13 07:17:48'),
(222, 'Se ha modificado el contenido del capítulo: Marco Teórico', '2022-07-12 19:42:43', 53, 7, 2, '2022-07-13 07:42:43', '2022-07-13 07:42:43'),
(223, 'Se ha modificado el contenido del capítulo: Marco Teórico', '2022-07-12 19:44:01', 53, 7, 2, '2022-07-13 07:44:01', '2022-07-13 07:44:01'),
(224, 'Se ha modificado el contenido del capítulo: Marco Teórico', '2022-07-12 19:44:21', 53, 7, 2, '2022-07-13 07:44:21', '2022-07-13 07:44:21'),
(225, 'Se ha modificado el contenido del capítulo: Marco Teórico', '2022-07-12 19:44:34', 53, 7, 2, '2022-07-13 07:44:34', '2022-07-13 07:44:34'),
(226, 'Se ha modificado el contenido del capítulo: Marco Teórico', '2022-07-12 19:49:31', 53, 7, 2, '2022-07-13 07:49:31', '2022-07-13 07:49:31'),
(227, 'Se ha modificado el contenido del capítulo: Marco Teórico', '2022-07-13 09:00:33', 54, 7, 2, '2022-07-13 21:00:33', '2022-07-13 21:00:33'),
(228, 'Se ha eliminado el subtema:  del capitulo: Marco Teórico', '2022-07-13 09:00:41', 54, 7, 3, '2022-07-13 21:00:41', '2022-07-13 21:00:41'),
(229, 'Se ha modificado el contenido del capítulo: Marco Teórico', '2022-07-13 09:00:50', 54, 7, 2, '2022-07-13 21:00:50', '2022-07-13 21:00:50'),
(230, 'Se ha modificado el contenido del capítulo: Marco Teórico', '2022-07-13 10:24:20', 54, 7, 2, '2022-07-13 22:24:20', '2022-07-13 22:24:20'),
(231, 'Se ha modificado el contenido del capítulo: Marco Teórico', '2022-07-13 10:26:07', 54, 7, 2, '2022-07-13 22:26:07', '2022-07-13 22:26:07'),
(232, 'Se ha modificado el contenido del capítulo: Marco Teórico', '2022-07-13 10:33:23', 54, 7, 2, '2022-07-13 22:33:23', '2022-07-13 22:33:23'),
(233, 'Se ha modificado el contenido del capítulo: Marco Teórico', '2022-07-13 10:34:29', 54, 7, 2, '2022-07-13 22:34:29', '2022-07-13 22:34:29'),
(234, 'Se ha modificado el contenido del capítulo: Marco Teórico', '2022-07-13 10:43:09', 54, 7, 2, '2022-07-13 22:43:09', '2022-07-13 22:43:09'),
(235, 'Se ha modificado el contenido del capítulo: Marco Teórico', '2022-07-13 10:58:20', 54, 7, 2, '2022-07-13 22:58:20', '2022-07-13 22:58:20'),
(236, 'Se ha modificado el contenido del capítulo: Marco Teórico', '2022-07-13 10:58:35', 54, 7, 2, '2022-07-13 22:58:35', '2022-07-13 22:58:35'),
(237, 'Se ha modificado el contenido del capítulo: Requerimientos del Sistema', '2022-07-13 11:49:23', 54, 7, 2, '2022-07-13 23:49:23', '2022-07-13 23:49:23'),
(238, 'Se ha modificado el contenido del capítulo: Herramientas y Metodologías del trabajo', '2022-07-13 11:51:08', 54, 7, 2, '2022-07-13 23:51:08', '2022-07-13 23:51:08'),
(239, 'Se ha modificado el contenido del capítulo: Diseño del sistema', '2022-07-13 11:59:32', 54, 7, 2, '2022-07-13 23:59:32', '2022-07-13 23:59:32'),
(240, 'Se ha modificado el contenido del capítulo: Desarrollo y pruebas del sistema', '2022-07-13 12:01:44', 54, 7, 2, '2022-07-14 00:01:44', '2022-07-14 00:01:44'),
(241, 'Se ha modificado el contenido del capítulo: Conclusiones y recomendaciones', '2022-07-13 12:02:16', 54, 7, 2, '2022-07-14 00:02:16', '2022-07-14 00:02:16'),
(242, 'La sección de agradecimiento cambió a estado: No es opcional', '2022-07-13 12:02:42', 54, 2, 2, '2022-07-14 00:02:42', '2022-07-14 00:02:42'),
(243, 'Se cambió a estado: No es opcional', '2022-07-13 12:02:48', 54, 8, 2, '2022-07-14 00:02:48', '2022-07-14 00:02:48'),
(244, 'Las secciones creadas fueron:\\n\\n- Portada y Segunda Portada\\n- Dedicatoria\\n- Agradecimiento\\n- Resumen\\n- Índice\\n- Siglas\\n- Abreviaciones\\n- Nomenclaturas\\n- Capitulo 1. Introducción\\n- Capitulo 2. Marco Teórico\\n- Capitulo 3. Requerimientos del Sistema\\n- Capitulo 4. Herramientas y Metodologías del trabajo\\n- Capitulo 5. Diseño del sistema\\n- Capitulo 6. Desarrollo y pruebas del sistema\\n- Capitulo 7. Conclusiones y recomendaciones\\n- Glosario\\n- Referencias', '2022-07-13 12:03:19', 54, 10, 4, '2022-07-14 00:03:19', '2022-07-14 00:03:19'),
(245, 'Se ha modificado el contenido del capítulo: Conclusiones y recomendaciones', '2022-07-13 15:02:35', 52, 7, 2, '2022-07-14 03:02:35', '2022-07-14 03:02:35'),
(246, 'Se ha modificado el contenido del capítulo: Desarrollo y pruebas del sistema', '2022-07-13 15:05:07', 52, 7, 2, '2022-07-14 03:05:07', '2022-07-14 03:05:07'),
(247, 'Se ha modificado el contenido del capítulo: Herramientas y Metodologías del trabajo', '2022-07-13 15:06:57', 52, 7, 2, '2022-07-14 03:06:57', '2022-07-14 03:06:57'),
(248, 'Se ha modificado el contenido del capítulo: Herramientas y Metodologías del trabajo', '2022-07-13 15:07:20', 52, 7, 2, '2022-07-14 03:07:20', '2022-07-14 03:07:20'),
(249, 'Se ha modificado el contenido del capítulo: Requerimientos del Sistema', '2022-07-13 15:10:49', 52, 7, 2, '2022-07-14 03:10:49', '2022-07-14 03:10:49'),
(250, 'Se ha modificado el contenido del capítulo: Requerimientos del Sistema', '2022-07-13 15:11:19', 52, 7, 2, '2022-07-14 03:11:19', '2022-07-14 03:11:19'),
(251, 'Se ha modificado el contenido del capítulo: Marco Teórico', '2022-07-13 15:11:50', 52, 7, 2, '2022-07-14 03:11:50', '2022-07-14 03:11:50'),
(252, 'Se ha modificado el contenido del capítulo: Introducción', '2022-07-13 15:16:37', 52, 7, 2, '2022-07-14 03:16:37', '2022-07-14 03:16:37'),
(253, 'Las secciones creadas fueron:\\n\\n- Portada y Segunda Portada\\n- Dedicatoria\\n- Agradecimiento\\n- Resumen\\n- Índice\\n- Siglas\\n- Abreviaciones\\n- Nomenclaturas\\n- Capitulo 1. Introducción\\n- Capitulo 2. Marco Teórico\\n- Capitulo 3. Requerimientos del Sistema\\n- Capitulo 4. Herramientas y Metodologías del trabajo\\n- Capitulo 5. Diseño del sistema\\n- Capitulo 6. Desarrollo y pruebas del sistema\\n- Capitulo 7. Conclusiones y recomendaciones\\n- Glosario\\n- Referencias', '2022-07-13 15:17:18', 52, 10, 4, '2022-07-14 03:17:18', '2022-07-14 03:17:18'),
(254, 'Se ha modificado el contenido del capítulo: Introducción', '2022-07-13 15:20:20', 52, 7, 2, '2022-07-14 03:20:20', '2022-07-14 03:20:20'),
(255, 'Las secciones creadas fueron:\\n\\n- Portada y Segunda Portada\\n- Dedicatoria\\n- Agradecimiento\\n- Resumen\\n- Índice\\n- Siglas\\n- Abreviaciones\\n- Nomenclaturas\\n- Capitulo 1. Introducción\\n- Capitulo 2. Marco Teórico\\n- Capitulo 3. Requerimientos del Sistema\\n- Capitulo 4. Herramientas y Metodologías del trabajo\\n- Capitulo 5. Diseño del sistema\\n- Capitulo 6. Desarrollo y pruebas del sistema\\n- Capitulo 7. Conclusiones y recomendaciones\\n- Glosario\\n- Referencias', '2022-07-13 15:20:36', 52, 10, 4, '2022-07-14 03:20:36', '2022-07-14 03:20:36'),
(256, 'Las secciones creadas fueron:\\n\\n- Portada y Segunda Portada\\n- Dedicatoria\\n- Agradecimiento\\n- Resumen\\n- Índice\\n- Siglas\\n- Abreviaciones\\n- Nomenclaturas\\n- Capitulo 1. Introducción\\n- Capitulo 2. Marco Teórico\\n- Capitulo 3. Requerimientos del Sistema\\n- Capitulo 4. Herramientas y Metodologías del trabajo\\n- Capitulo 5. Diseño del sistema\\n- Capitulo 6. Desarrollo y pruebas del sistema\\n- Capitulo 7. Conclusiones y recomendaciones\\n- Glosario\\n- Referencias', '2022-07-13 15:24:29', 52, 10, 4, '2022-07-14 03:24:29', '2022-07-14 03:24:29'),
(257, 'Las secciones creadas fueron:\\n\\n- Portada y Segunda Portada\\n- Dedicatoria\\n- Agradecimiento\\n- Resumen\\n- Índice\\n- Siglas\\n- Abreviaciones\\n- Nomenclaturas\\n- Capitulo 1. Introducción\\n- Capitulo 2. Marco Teórico\\n- Capitulo 3. Requerimientos del Sistema\\n- Capitulo 4. Herramientas y Metodologías del trabajo\\n- Capitulo 5. Diseño del sistema\\n- Capitulo 6. Desarrollo y pruebas del sistema\\n- Capitulo 7. Conclusiones y recomendaciones\\n- Glosario\\n- Referencias', '2022-07-13 15:27:35', 52, 10, 4, '2022-07-14 03:27:35', '2022-07-14 03:27:35'),
(258, 'Las secciones creadas fueron:\\n\\n- Portada y Segunda Portada\\n- Dedicatoria\\n- Agradecimiento\\n- Resumen\\n- Índice\\n- Siglas\\n- Abreviaciones\\n- Nomenclaturas\\n- Capitulo 1. Introducción\\n- Capitulo 2. Marco Teórico\\n- Capitulo 3. Requerimientos del Sistema\\n- Capitulo 4. Herramientas y Metodologías del trabajo\\n- Capitulo 5. Diseño del sistema\\n- Capitulo 6. Desarrollo y pruebas del sistema\\n- Capitulo 7. Conclusiones y recomendaciones\\n- Glosario\\n- Referencias', '2022-07-13 15:30:26', 52, 10, 4, '2022-07-14 03:30:26', '2022-07-14 03:30:26'),
(259, 'Se ha modificado el contenido del capítulo: Marco Teórico', '2022-07-13 16:48:32', 52, 7, 2, '2022-07-14 04:48:32', '2022-07-14 04:48:32'),
(260, 'Se ha modificado el contenido del capítulo: Marco Teórico', '2022-07-13 16:51:30', 52, 7, 2, '2022-07-14 04:51:30', '2022-07-14 04:51:30'),
(261, 'Se modificó la sección de resumen', '2022-07-13 17:21:34', 52, 3, 2, '2022-07-14 05:21:34', '2022-07-14 05:21:34'),
(262, 'Las secciones creadas fueron:\\n\\n- Resume', '2022-07-13 17:21:51', 52, 10, 4, '2022-07-14 05:21:51', '2022-07-14 05:21:51'),
(263, 'Se modificó la sección de resumen', '2022-07-13 17:27:33', 52, 3, 2, '2022-07-14 05:27:33', '2022-07-14 05:27:33'),
(264, 'Las secciones creadas fueron:\\n\\n- Resume', '2022-07-13 17:29:44', 52, 10, 4, '2022-07-14 05:29:44', '2022-07-14 05:29:44'),
(265, 'Las secciones creadas fueron:\\n\\n- Resume', '2022-07-13 17:35:50', 52, 10, 4, '2022-07-14 05:35:50', '2022-07-14 05:35:50'),
(266, 'Se modificó la sección de resumen', '2022-07-13 18:21:08', 52, 3, 2, '2022-07-14 06:21:08', '2022-07-14 06:21:08'),
(267, 'Las secciones creadas fueron:\\n\\n- Portada y Segunda Portada\\n- Dedicatoria\\n- Agradecimiento\\n- Resumen\\n- Índice\\n- Siglas\\n- Abreviaciones\\n- Nomenclaturas\\n- Capitulo 1. Introducción\\n- Capitulo 2. Marco Teórico\\n- Capitulo 3. Requerimientos del Sistema\\n- Capitulo 4. Herramientas y Metodologías del trabajo\\n- Capitulo 5. Diseño del sistema\\n- Capitulo 6. Desarrollo y pruebas del sistema\\n- Capitulo 7. Conclusiones y recomendaciones\\n- Glosario\\n- Referencias', '2022-07-13 18:24:09', 52, 10, 4, '2022-07-14 06:24:09', '2022-07-14 06:24:09'),
(268, 'Se ha modificado el contenido del capítulo: Marco Teórico', '2022-07-13 18:43:36', 52, 7, 2, '2022-07-14 06:43:36', '2022-07-14 06:43:36'),
(269, 'Se ha eliminado la dedicatoria de Eduardo Alberto Lopez Torres', '2022-07-13 18:44:23', 52, 1, 3, '2022-07-14 06:44:23', '2022-07-14 06:44:23'),
(270, 'Las secciones creadas fueron:\\n\\n- Portada y Segunda Portada\\n- Agradecimiento\\n- Resumen\\n- Índice\\n- Siglas\\n- Abreviaciones\\n- Nomenclaturas\\n- Capitulo 1. Introducción\\n- Capitulo 2. Marco Teórico\\n- Capitulo 3. Requerimientos del Sistema\\n- Capitulo 4. Herramientas y Metodologías del trabajo\\n- Capitulo 5. Diseño del sistema\\n- Capitulo 6. Desarrollo y pruebas del sistema\\n- Capitulo 7. Conclusiones y recomendaciones\\n- Glosario\\n- Referencias', '2022-07-13 18:45:26', 52, 10, 4, '2022-07-14 06:45:26', '2022-07-14 06:45:26'),
(271, 'Se ha modificado el contenido del capítulo: Marco Teórico', '2022-07-13 18:52:49', 52, 7, 2, '2022-07-14 06:52:49', '2022-07-14 06:52:49'),
(272, 'Se modificó la sección de resumen', '2022-07-13 19:12:54', 52, 3, 2, '2022-07-14 07:12:54', '2022-07-14 07:12:54'),
(273, 'Se modificó la sección de resumen', '2022-07-14 09:09:58', 52, 3, 2, '2022-07-14 21:09:58', '2022-07-14 21:09:58'),
(274, 'Las secciones creadas fueron:\\n\\n- Resume', '2022-07-14 09:10:08', 52, 10, 4, '2022-07-14 21:10:08', '2022-07-14 21:10:08'),
(275, 'Se modificó la sección de resumen', '2022-07-14 09:17:28', 52, 3, 2, '2022-07-14 21:17:28', '2022-07-14 21:17:28'),
(276, 'Se modificó la sección de resumen', '2022-07-14 09:45:54', 52, 3, 2, '2022-07-14 21:45:54', '2022-07-14 21:45:54'),
(277, 'Las secciones creadas fueron:\\n\\n- Resume', '2022-07-14 09:46:21', 52, 10, 4, '2022-07-14 21:46:21', '2022-07-14 21:46:21'),
(278, 'Las secciones creadas fueron:\\n\\n- Portada y Segunda Portada\\n- Agradecimiento\\n- Resumen\\n- Índice\\n- Siglas\\n- Abreviaciones\\n- Nomenclaturas\\n- Capitulo 1. Introducción\\n- Capitulo 2. Marco Teórico\\n- Capitulo 3. Requerimientos del Sistema\\n- Capitulo 4. Herramientas y Metodologías del trabajo\\n- Capitulo 5. Diseño del sistema\\n- Capitulo 6. Desarrollo y pruebas del sistema\\n- Capitulo 7. Conclusiones y recomendaciones\\n- Glosario\\n- Referencias', '2022-07-14 10:21:48', 52, 10, 4, '2022-07-14 22:21:48', '2022-07-14 22:21:48'),
(279, 'Las secciones creadas fueron:\\n\\n- Portada y Segunda Portada\\n- Agradecimiento\\n- Resumen\\n- Índice\\n- Siglas\\n- Abreviaciones\\n- Nomenclaturas\\n- Capitulo 1. Introducción\\n- Capitulo 2. Marco Teórico\\n- Capitulo 3. Requerimientos del Sistema\\n- Capitulo 4. Herramientas y Metodologías del trabajo\\n- Capitulo 5. Diseño del sistema\\n- Capitulo 6. Desarrollo y pruebas del sistema\\n- Capitulo 7. Conclusiones y recomendaciones\\n- Glosario\\n- Referencias', '2022-07-14 10:26:58', 52, 10, 4, '2022-07-14 22:26:58', '2022-07-14 22:26:58'),
(280, 'Las secciones creadas fueron:\\n\\n- Resume', '2022-07-14 11:46:56', 52, 10, 4, '2022-07-14 23:46:56', '2022-07-14 23:46:56'),
(281, 'Las secciones creadas fueron:\\n\\n- Resume', '2022-07-14 11:47:40', 52, 10, 4, '2022-07-14 23:47:40', '2022-07-14 23:47:40'),
(282, 'Las secciones creadas fueron:\\n\\n- Resume', '2022-07-14 11:47:47', 52, 10, 4, '2022-07-14 23:47:47', '2022-07-14 23:47:47'),
(283, 'Las secciones creadas fueron:\\n\\n- Resume', '2022-07-14 11:56:56', 52, 10, 4, '2022-07-14 23:56:56', '2022-07-14 23:56:56'),
(284, 'Las secciones creadas fueron:\\n\\n- Resume', '2022-07-14 11:58:23', 52, 10, 4, '2022-07-14 23:58:23', '2022-07-14 23:58:23'),
(285, 'Las secciones creadas fueron:\\n\\n- Resume', '2022-07-14 12:01:13', 52, 10, 4, '2022-07-15 00:01:13', '2022-07-15 00:01:13'),
(286, 'Las secciones creadas fueron:\\n\\n- Resume', '2022-07-14 12:04:18', 52, 10, 4, '2022-07-15 00:04:18', '2022-07-15 00:04:18'),
(287, 'Las secciones creadas fueron:\\n\\n- Resume', '2022-07-14 12:10:30', 52, 10, 4, '2022-07-15 00:10:30', '2022-07-15 00:10:30'),
(288, 'Las secciones creadas fueron:\\n\\n- Resume', '2022-07-14 12:12:53', 52, 10, 4, '2022-07-15 00:12:53', '2022-07-15 00:12:53'),
(289, 'Las secciones creadas fueron:\\n\\n- Resume', '2022-07-14 12:14:52', 52, 10, 4, '2022-07-15 00:14:52', '2022-07-15 00:14:52'),
(290, 'Las secciones creadas fueron:\\n\\n- Resume', '2022-07-14 12:19:23', 52, 10, 4, '2022-07-15 00:19:23', '2022-07-15 00:19:23'),
(291, 'Se modificó la sección de resumen', '2022-07-14 12:35:42', 52, 3, 2, '2022-07-15 00:35:42', '2022-07-15 00:35:42'),
(292, 'Se modificó la sección de resumen', '2022-07-14 12:36:08', 52, 3, 2, '2022-07-15 00:36:08', '2022-07-15 00:36:08'),
(293, 'Se modificó la sección de resumen', '2022-07-14 12:38:31', 52, 3, 2, '2022-07-15 00:38:31', '2022-07-15 00:38:31'),
(294, 'Las secciones creadas fueron:\\n\\n- Resume', '2022-07-14 12:38:54', 52, 10, 4, '2022-07-15 00:38:54', '2022-07-15 00:38:54'),
(295, 'Se modificó la sección de resumen', '2022-07-14 14:02:40', 52, 3, 2, '2022-07-15 02:02:40', '2022-07-15 02:02:40'),
(296, 'Las secciones creadas fueron:\\n\\n- Resume', '2022-07-14 14:07:32', 52, 10, 4, '2022-07-15 02:07:32', '2022-07-15 02:07:32'),
(297, 'Se ha modificado el contenido del capítulo: Marco Teórico', '2022-07-14 19:17:11', 53, 7, 2, '2022-07-15 07:17:11', '2022-07-15 07:17:11');
INSERT INTO `bitacora` (`id`, `descripcion`, `fecha_modificacion`, `estudiante_id`, `bitacora_seccion_id`, `bitacora_modificacion_id`, `created_at`, `updated_at`) VALUES
(298, 'Las secciones creadas fueron:\\n\\n- Portada y Segunda Portada\\n- Agradecimiento\\n- Resumen\\n- Índice\\n- Siglas\\n- Abreviaciones\\n- Nomenclaturas\\n- Capitulo 1. Introducción\\n- Capitulo 2. Marco Teórico\\n- Capitulo 3. Requerimientos del Sistema\\n- Capitulo 4. Herramientas y Metodologías del trabajo\\n- Capitulo 5. Diseño del sistema\\n- Capitulo 6. Desarrollo y pruebas del sistema\\n- Capitulo 7. Conclusiones y recomendaciones\\n- Glosario\\n- Referencias', '2022-07-14 19:17:23', 53, 10, 4, '2022-07-15 07:17:23', '2022-07-15 07:17:23'),
(299, 'Se ha modificado el contenido del capítulo: Marco Teórico', '2022-07-14 19:20:02', 53, 7, 2, '2022-07-15 07:20:02', '2022-07-15 07:20:02'),
(300, 'Se ha modificado el contenido del capítulo: Marco Teórico', '2022-07-14 19:21:34', 53, 7, 2, '2022-07-15 07:21:34', '2022-07-15 07:21:34'),
(301, 'Se ha modificado el contenido del capítulo: Herramientas y Metodologías del trabajo', '2022-07-14 19:21:50', 53, 7, 2, '2022-07-15 07:21:50', '2022-07-15 07:21:50'),
(302, 'Se ha modificado el contenido del capítulo: Diseño del sistema', '2022-07-14 23:05:03', 54, 7, 2, '2022-07-15 11:05:03', '2022-07-15 11:05:03'),
(303, 'Se ha modificado el contenido del capítulo: Diseño del sistema', '2022-07-14 23:16:54', 54, 7, 2, '2022-07-15 11:16:54', '2022-07-15 11:16:54'),
(304, 'Se ha modificado el contenido del capítulo: Diseño del sistema', '2022-07-14 23:20:03', 54, 7, 2, '2022-07-15 11:20:03', '2022-07-15 11:20:03'),
(305, 'Se ha modificado el contenido del capítulo: Diseño del sistema', '2022-07-14 23:20:33', 54, 7, 2, '2022-07-15 11:20:33', '2022-07-15 11:20:33'),
(306, 'Las secciones creadas fueron:\\n\\n- Portada y Segunda Portada\\n- Agradecimiento\\n- Resumen\\n- Índice\\n- Siglas\\n- Abreviaciones\\n- Nomenclaturas\\n- Capitulo 1. Introducción\\n- Capitulo 2. Marco Teórico\\n- Capitulo 3. Requerimientos del Sistema\\n- Capitulo 4. Herramientas y Metodologías del trabajo\\n- Capitulo 5. Diseño del sistema\\n- Capitulo 6. Desarrollo y pruebas del sistema\\n- Capitulo 7. Conclusiones y recomendaciones\\n- Glosario\\n- Referencias', '2022-07-14 23:23:33', 54, 10, 4, '2022-07-15 11:23:33', '2022-07-15 11:23:33'),
(307, 'Se ha modificado el contenido del capítulo: Diseño del sistema', '2022-07-14 23:28:17', 54, 7, 2, '2022-07-15 11:28:17', '2022-07-15 11:28:17'),
(308, 'Se modificó la sección de siglas', '2022-07-14 23:30:20', 54, 4, 2, '2022-07-15 11:30:20', '2022-07-15 11:30:20'),
(309, 'Se modificó la sección de nomenclaturas', '2022-07-14 23:30:24', 54, 6, 2, '2022-07-15 11:30:24', '2022-07-15 11:30:24'),
(310, 'Se modificó la sección de abreviaciones', '2022-07-14 23:30:28', 54, 5, 2, '2022-07-15 11:30:28', '2022-07-15 11:30:28'),
(311, 'Las secciones creadas fueron:\\n\\n- Portada y Segunda Portada\\n- Agradecimiento\\n- Resumen\\n- Índice\\n- Siglas\\n- Abreviaciones\\n- Nomenclaturas\\n- Capitulo 1. Introducción\\n- Capitulo 2. Marco Teórico\\n- Capitulo 3. Requerimientos del Sistema\\n- Capitulo 4. Herramientas y Metodologías del trabajo\\n- Capitulo 5. Diseño del sistema\\n- Capitulo 6. Desarrollo y pruebas del sistema\\n- Capitulo 7. Conclusiones y recomendaciones\\n- Glosario\\n- Referencias', '2022-07-16 11:53:05', 52, 10, 4, '2022-07-16 23:53:05', '2022-07-16 23:53:05'),
(336, 'Se ha creado el capítulo: Glosario', '2022-07-17 15:28:58', 52, 7, 1, '2022-07-18 03:28:58', '2022-07-18 03:28:58'),
(337, 'Se ha eliminado el capítulo: Glosario', '2022-07-17 15:29:06', 52, 7, 3, '2022-07-18 03:29:06', '2022-07-18 03:29:06'),
(338, 'Las secciones creadas fueron:\\n\\n- Portada y Segunda Portada', '2022-07-18 19:12:26', 11, 10, 4, '2022-07-19 07:12:26', '2022-07-19 07:12:26'),
(339, 'Las secciones creadas fueron:\\n\\n- Portada y Segunda Portada\\n- Índice', '2022-07-18 19:13:07', 11, 10, 4, '2022-07-19 07:13:07', '2022-07-19 07:13:07'),
(340, 'Las secciones creadas fueron:\\n\\n- Portada y Segunda Portada\\n- Índice', '2022-07-18 19:14:22', 11, 10, 4, '2022-07-19 07:14:22', '2022-07-19 07:14:22'),
(341, 'Las secciones creadas fueron:\\n\\n- Portada y Segunda Portada\\n- Índice', '2022-07-18 19:15:38', 11, 10, 4, '2022-07-19 07:15:38', '2022-07-19 07:15:38'),
(342, 'Las secciones creadas fueron:\\n\\n- Portada y Segunda Portada\\n- Índice', '2022-07-18 19:16:50', 11, 10, 4, '2022-07-19 07:16:50', '2022-07-19 07:16:50'),
(343, 'Las secciones creadas fueron:\\n\\n- Portada y Segunda Portada\\n- Índice', '2022-07-18 19:22:15', 21, 10, 4, '2022-07-19 07:22:15', '2022-07-19 07:22:15'),
(344, 'Las secciones creadas fueron:\\n\\n- Resume', '2022-07-22 00:29:40', 52, 10, 4, '2022-07-22 12:29:40', '2022-07-22 12:29:40'),
(345, 'Las secciones creadas fueron:\\n\\n- Portada y Segunda Portada\\n- Agradecimiento\\n- Resumen\\n- Índice\\n- Siglas\\n- Abreviaciones\\n- Nomenclaturas\\n- Capitulo 1. Introducción\\n- Capitulo 2. Marco Teórico\\n- Capitulo 3. Requerimientos del Sistema\\n- Capitulo 4. Herramientas y Metodologías del trabajo\\n- Capitulo 5. Diseño del sistema\\n- Capitulo 6. Desarrollo y pruebas del sistema\\n- Capitulo 7. Conclusiones y recomendaciones\\n- Glosario\\n- Referencias', '2022-07-22 00:29:58', 52, 10, 4, '2022-07-22 12:29:58', '2022-07-22 12:29:58'),
(346, 'Las secciones creadas fueron:\\n\\n- Portada y Segunda Portada\\n- Agradecimiento\\n- Resumen\\n- Índice\\n- Siglas\\n- Abreviaciones\\n- Nomenclaturas\\n- Capitulo 1. Introducción\\n- Capitulo 2. Marco Teórico\\n- Capitulo 3. Requerimientos del Sistema\\n- Capitulo 4. Herramientas y Metodologías del trabajo\\n- Capitulo 5. Diseño del sistema\\n- Capitulo 6. Desarrollo y pruebas del sistema\\n- Capitulo 7. Conclusiones y recomendaciones\\n- Glosario\\n- Referencias', '2022-07-22 00:32:38', 52, 10, 4, '2022-07-22 12:32:38', '2022-07-22 12:32:38'),
(347, 'Las secciones creadas fueron:\\n\\n- Portada y Segunda Portada\\n- Agradecimiento\\n- Resumen\\n- Índice\\n- Siglas\\n- Abreviaciones\\n- Nomenclaturas\\n- Capitulo 1. Introducción\\n- Capitulo 2. Marco Teórico\\n- Capitulo 3. Requerimientos del Sistema\\n- Capitulo 4. Herramientas y Metodologías del trabajo\\n- Capitulo 5. Diseño del sistema\\n- Capitulo 6. Desarrollo y pruebas del sistema\\n- Capitulo 7. Conclusiones y recomendaciones\\n- Glosario\\n- Referencias', '2022-07-22 00:34:51', 52, 10, 4, '2022-07-22 12:34:51', '2022-07-22 12:34:51'),
(348, 'Las secciones creadas fueron:\\n\\n- Portada y Segunda Portada\\n- Agradecimiento\\n- Resumen\\n- Índice\\n- Siglas\\n- Abreviaciones\\n- Nomenclaturas\\n- Capitulo 1. Introducción\\n- Capitulo 2. Marco Teórico\\n- Capitulo 3. Requerimientos del Sistema\\n- Capitulo 4. Herramientas y Metodologías del trabajo\\n- Capitulo 5. Diseño del sistema\\n- Capitulo 6. Desarrollo y pruebas del sistema\\n- Capitulo 7. Conclusiones y recomendaciones\\n- Glosario\\n- Referencias', '2022-07-31 20:19:06', 52, 10, 4, '2022-08-01 08:19:06', '2022-08-01 08:19:06');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `bitacora_modificacion`
--

CREATE TABLE `bitacora_modificacion` (
  `id` int(11) NOT NULL,
  `nombre_modificacion` varchar(20) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `bitacora_modificacion`
--

INSERT INTO `bitacora_modificacion` (`id`, `nombre_modificacion`, `created_at`, `updated_at`) VALUES
(1, 'Agregó', '2022-05-20 06:19:17', '2022-05-20 06:19:17'),
(2, 'Modificó', '2022-05-20 06:19:17', '2022-05-20 06:19:17'),
(3, 'Eliminó', '2022-05-20 06:19:17', '2022-05-20 06:19:17'),
(4, 'Creación', '2022-06-19 23:21:09', '2022-06-19 23:21:09');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `bitacora_seccion`
--

CREATE TABLE `bitacora_seccion` (
  `id` int(11) NOT NULL,
  `nombre_seccion` varchar(30) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `bitacora_seccion`
--

INSERT INTO `bitacora_seccion` (`id`, `nombre_seccion`, `created_at`, `updated_at`) VALUES
(1, 'Agradecimiento', '2022-05-20 06:19:17', '2022-05-20 06:19:17'),
(2, 'Dedicatoria', '2022-05-20 06:19:17', '2022-05-20 06:19:17'),
(3, 'Resumen', '2022-05-20 06:19:17', '2022-05-20 06:19:17'),
(4, 'Siglas', '2022-05-20 06:19:17', '2022-05-20 06:19:17'),
(5, 'Abreviaciones', '2022-05-20 06:19:17', '2022-05-20 06:19:17'),
(6, 'Nomenclaturas', '2022-05-20 06:19:17', '2022-05-20 06:19:17'),
(7, 'Capitulo', '2022-05-20 06:19:17', '2022-05-20 06:19:17'),
(8, 'Glosario', '2022-05-20 06:19:17', '2022-05-20 06:19:17'),
(9, 'Referencia', '2022-05-20 06:19:17', '2022-05-20 06:19:17'),
(10, 'Creación de documento', '2022-05-20 06:19:17', '2022-05-20 06:19:17');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cargo`
--

CREATE TABLE `cargo` (
  `id` int(11) NOT NULL,
  `nombre_cargo` varchar(100) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `cargo`
--

INSERT INTO `cargo` (`id`, `nombre_cargo`, `created_at`, `updated_at`) VALUES
(1, 'Decano', '2022-05-20 06:19:17', '2022-05-20 06:19:17'),
(2, 'Secretaria Académica', '2022-05-20 06:19:17', '2022-05-20 06:19:17'),
(3, 'Director de carrera', '2022-05-20 06:19:17', '2022-05-20 06:19:17'),
(4, 'Catedrático', '2022-05-20 06:19:18', '2022-05-20 06:19:18'),
(5, 'Rector', '2022-05-20 06:19:18', '2022-05-20 06:19:18'),
(6, 'Secretaria Ejecutiva', '2022-05-20 06:19:18', '2022-05-20 06:19:18'),
(7, 'Asesora de Proyectos Estratégicos', '2022-05-20 06:19:18', '2022-05-20 06:19:18'),
(8, 'Secretaria', '2022-05-20 06:19:18', '2022-05-20 06:19:18'),
(9, 'Secretaría General', '2022-05-20 06:19:18', '2022-05-20 06:19:18'),
(10, 'Jefe', '2022-07-18 05:00:23', '2022-07-18 05:00:23');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `carrera`
--

CREATE TABLE `carrera` (
  `id` int(11) NOT NULL,
  `nombre_carrera` varchar(200) NOT NULL,
  `grado` varchar(200) NOT NULL,
  `facultad_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `carrera`
--

INSERT INTO `carrera` (`id`, `nombre_carrera`, `grado`, `facultad_id`, `created_at`, `updated_at`) VALUES
(1, 'Arquitectura', 'Arquitecto', 1, '2022-05-20 06:19:17', '2022-05-20 06:19:17'),
(2, 'Ingeniería de Alimentos', 'Ingeniero de Alimentos', 1, '2022-05-20 06:19:17', '2022-05-20 06:19:17'),
(3, 'Ingeniería Civil', 'Ingeniero Civil', 1, '2022-05-20 06:19:17', '2022-05-20 06:19:17'),
(4, 'Ingeniería Eléctrica', 'Ingeniero Electricista', 1, '2022-05-20 06:19:17', '2022-05-20 06:19:17'),
(5, 'Ingeniería Energética', 'Ingeniero Energético', 1, '2022-05-20 06:19:17', '2022-05-20 06:19:17'),
(6, 'Ingeniería Industrial', 'Ingeniero Industrial', 1, '2022-05-20 06:19:17', '2022-05-20 06:19:17'),
(7, 'Ingeniería Informática', 'Ingeniero Informático', 1, '2022-05-20 06:19:17', '2022-05-20 06:19:17'),
(8, 'Ingeniería Mecánica', 'Ingeniero Mecánico', 1, '2022-05-20 06:19:17', '2022-05-20 06:19:17'),
(9, 'Ingeniería Química', 'Ingeniero Químico', 1, '2022-05-20 06:19:17', '2022-05-20 06:19:17'),
(10, 'Licenciatura en Filosofía', 'Licenciado en Filosofía', 2, '2022-05-20 06:19:17', '2022-05-20 06:19:17'),
(11, 'Licenciatura en Idioma Inglés', 'Licenciado en Idioma Inglés', 2, '2022-05-20 06:19:17', '2022-05-20 06:19:17'),
(12, 'Licenciatura en Psicología', 'Licenciado en Psicología', 2, '2022-05-20 06:19:17', '2022-05-20 06:19:17'),
(13, 'Licenciatura en Teología', 'Licenciado en Teología', 2, '2022-05-20 06:19:17', '2022-05-20 06:19:17'),
(14, 'Licenciatura en Ciencias Jurídicas', 'Licenciado en Ciencias Jurídicas', 2, '2022-05-20 06:19:17', '2022-05-20 06:19:17'),
(15, 'Técnico en Mercadeo', 'Técnico en Mercadeo', 3, '2022-05-20 06:19:17', '2022-05-20 06:19:17'),
(16, 'Técnico en Producción Multimedia', 'Técnico en Producción Multimedia', 3, '2022-05-20 06:19:17', '2022-05-20 06:19:17'),
(17, 'Licenciatura en Mercadeo', 'Licenciado en Mercadeo', 3, '2022-05-20 06:19:17', '2022-05-20 06:19:17'),
(18, 'Licenciatura en Comunicación Social', 'Licenciado en Comunicación Social', 3, '2022-05-20 06:19:17', '2022-05-20 06:19:17'),
(19, 'Profesorado en Idioma Ingles', 'Profesor en Idioma Inglés para Tercer Ciclo de Eduación Básica y Eduación Media', 2, '2022-05-20 06:19:17', '2022-05-20 06:19:17'),
(20, 'Profesorado en Teología', 'Profesor en Teología', 2, '2022-05-20 06:19:17', '2022-05-20 06:19:17'),
(21, 'Técnico en Contaduría', 'Técnico en Contaduría', 3, '2022-05-20 06:19:17', '2022-05-20 06:19:17'),
(22, 'Licenciatura en Administración de Empresas', 'Licenciado en Administración de Empresas', 3, '2022-05-20 06:19:17', '2022-05-20 06:19:17'),
(23, 'Licenciatura en Contaduría Pública', 'Licenciado en Contaduría Pública ', 3, '2022-05-20 06:19:17', '2022-05-20 06:19:17'),
(24, 'Licenciatura en Economía', 'Licenciado en Economía', 3, '2022-05-20 06:19:17', '2022-05-20 06:19:17');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `configuracion_sistema`
--

CREATE TABLE `configuracion_sistema` (
  `id` int(11) NOT NULL,
  `fecha_entrega` varchar(20) NOT NULL,
  `fecha_prorroga` varchar(20) NOT NULL,
  `numero_integrantes` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `configuracion_sistema`
--

INSERT INTO `configuracion_sistema` (`id`, `fecha_entrega`, `fecha_prorroga`, `numero_integrantes`, `created_at`, `updated_at`) VALUES
(1, 'JULIO 2022', 'AGOSTO 2022', 4, '2022-05-20 06:19:17', '2022-05-20 06:19:17');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `contenido_seccion_capitulo`
--

CREATE TABLE `contenido_seccion_capitulo` (
  `id` int(11) NOT NULL,
  `tema` varchar(255) DEFAULT NULL,
  `contenido` text DEFAULT NULL,
  `orden_contenido` int(11) NOT NULL,
  `seccion_capitulo_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `contenido_seccion_capitulo`
--

INSERT INTO `contenido_seccion_capitulo` (`id`, `tema`, `contenido`, `orden_contenido`, `seccion_capitulo_id`, `created_at`, `updated_at`) VALUES
(27, 'Introducción del capitulo', '<p>null</p>', 0, 16, '2022-07-13 06:52:10', '2022-07-13 06:52:10'),
(28, 'Planteamiento del problema', '<p style=\"text-align:justify\">Los estudiantes egresados de la Universidad Centroamericana Jos&eacute; Sime&oacute;n Ca&ntilde;as (UCA) realizan su trabajo de graduaci&oacute;n con el fin de culminar su trayectoria acad&eacute;mica, por lo tanto, el alumnado acoge los requerimientos espec&iacute;ficos sobre dicho trabajo, el cual es brindado por su respectivo Decanato.</p>\r\n\r\n<p style=\"text-align:justify\">&nbsp;</p>\r\n\r\n<p style=\"text-align:justify\">Para este caso de estudio, la investigaci&oacute;n se centra en los requerimientos del Decanato de Ingenier&iacute;a y Arquitectura. El Decanato es el encargado de hacer las revisiones de los trabajos de graduaci&oacute;n, pero actualmente se han observado ciertas problem&aacute;ticas que tienen que ver con los lineamientos presentados, ya que los estudiantes no siguen correctamente las especificaciones dadas por Decanato, y esto genera un proceso lento de revisi&oacute;n. A continuaci&oacute;n, se escriben ciertos puntos, en donde el alumnado no cumple en totalidad los lineamientos establecidos:&nbsp;</p>\r\n\r\n<p style=\"text-align:justify\">&nbsp;</p>\r\n\r\n<ul>\r\n	<li style=\"text-align:justify\"><u>M&aacute;rgenes:</u> en la mayor&iacute;a de trabajos de graduaci&oacute;n revisados por Decanato se observa la falta de m&aacute;rgenes establecidos, que son de 2.5 cm en la parte inferior, superior y laterales (izquierda y derecha), dejando 1 cm para el encuadernado.</li>\r\n	<li style=\"text-align:justify\"><u>P&aacute;rrafos y alineaci&oacute;n:</u> los documentos no poseen la justificaci&oacute;n de texto, sangr&iacute;a e interlineado de 1.5 descritos en el &ldquo;Instructivo para Estudiantes - Proceso de graduaci&oacute;n&rdquo;.</li>\r\n	<li style=\"text-align:justify\"><u>Numeraci&oacute;n de p&aacute;ginas:</u> no se coloca de manera adecuada la enumeraci&oacute;n en cada secci&oacute;n del documento, ya que en los estudiantes se genera confusi&oacute;n por los 3 tipos de numeraciones distintas, los cuales son: numeraci&oacute;n romana (i, ii, iii, &hellip;), ar&aacute;biga (1, 2, 3, &hellip;) e independiente, esta &uacute;ltima se refiere al apartado de anexos, por ejemplo, la p&aacute;gina C-5 es la p&aacute;gina 5 del anexo C.</li>\r\n	<li style=\"text-align:justify\"><u>Figuras y tablas:</u> los estudiantes no colocan el t&iacute;tulo o numeraci&oacute;n respectiva de las figuras o tablas, y seg&uacute;n el instructivo es obligatorio hacer referencias de ellas en el texto y a su vez deben de ir referenciada en el texto inmediato, ya sea anterior o posteriormente a la misma, al igual que deber&aacute; contar con la fuente de origen de la informaci&oacute;n.</li>\r\n	<li style=\"text-align:justify\"><u>Citas bibliogr&aacute;ficas:</u> uno de los problemas m&aacute;s comunes que el estudiante comete a lo largo del desarrollo del trabajo de graduaci&oacute;n, es la falta de citas bibliogr&aacute;ficas o el no cumplimiento del formato de estas, y cabe recalcar que en el instructivo muestra los formatos espec&iacute;ficos que se deben seguir, adem&aacute;s se debe tener en cuenta la edici&oacute;n de APA (American Psychology Association) correspondiente.</li>\r\n	<li style=\"text-align:justify\"><u>&Iacute;ndice: </u>en el trabajo no se encuentra expresado el &iacute;ndice de figuras y tablas, adem&aacute;s de omitir algunos de los t&iacute;tulos o cap&iacute;tulos en el &iacute;ndice general, dando por consecuencia errores en la numeraci&oacute;n de las p&aacute;ginas. Asimismo, al no contar con un &iacute;ndice automatizado es dif&iacute;cil buscar cierto contenido, ya que los cap&iacute;tulos, temas, subtemas, figuras y tablas no est&aacute;n vinculados, por lo tanto, no se puede trasladar a la p&aacute;gina correspondiente.</li>\r\n</ul>\r\n\r\n<p style=\"text-align:justify\">&nbsp;</p>\r\n\r\n<p style=\"text-align:justify\">Anteriormente, se explicaron a detalle todos los puntos que se consideran errores comunes que normalmente cometen los estudiantes al momento de trabajar en su respectivo tema, estos problemas se han podido identificar por medio de la colaboraci&oacute;n del Departamento de Electr&oacute;nica e Inform&aacute;tica y el Decanato, que ha brindado informaci&oacute;n valiosa con respecto a los lineamientos que deben cumplir los trabajos de graduaci&oacute;n.</p>\r\n\r\n<p style=\"text-align:justify\">&nbsp;</p>\r\n\r\n<p style=\"text-align:justify\">Tambi&eacute;n, se ha podido extraer los incumplimientos que han cometido los estudiantes por medio de los Encargados que escoge Decano, los Directores de Carrera y los respectivos Directores de trabajo de graduaci&oacute;n, que realizan revisiones previas de los avances de dicho trabajo, y por lo tanto tienen m&aacute;s presente los errores comunes.</p>', 1, 16, '2022-07-13 06:52:10', '2022-07-14 03:16:37'),
(29, 'Antecedentes', '<p style=\"text-align:justify\">La Universidad Centroamericana &ldquo;Jos&eacute; Sime&oacute;n Ca&ntilde;as&rdquo; (UCA) se fund&oacute; en septiembre de 1965, se cre&oacute; a partir de generar una segunda opci&oacute;n de Universidad en El Salvador, por lo que la Compa&ntilde;&iacute;a de Jes&uacute;s realiz&oacute; esfuerzos fundamentales para establecer dicha instituci&oacute;n.</p>\r\n\r\n<p style=\"text-align:justify\">&nbsp;</p>\r\n\r\n<p style=\"text-align:justify\">Seg&uacute;n el sitio oficial de la Universidad (<a href=\"https://uca.edu.sv/\">https://uca.edu.sv/</a>) la instituci&oacute;n inicialmente contaba con las carreras de Econom&iacute;a, Administraci&oacute;n de Empresa, y las Ingenier&iacute;as Industrial, El&eacute;ctrica, Mec&aacute;nica y Qu&iacute;mica. Actualmente, la UCA cuenta con variadas opciones de carreras que forman diversas Facultades como lo son: Arquitectura e Ingenier&iacute;a, Ciencias Sociales y Humanidades, y Ciencias Econ&oacute;micas y Empresariales, asimismo ofrece Maestr&iacute;as y Doctorados.</p>\r\n\r\n<p style=\"text-align:justify\">&nbsp;</p>\r\n\r\n<p style=\"text-align:justify\">Para la culminaci&oacute;n de los estudios superiores el Reglamento Administrativo Acad&eacute;mico (Universidad Centroamericana &quot;Jos&eacute; Sime&oacute;n Ca&ntilde;as&quot;, 2021) define ciertos requisitos para obtener el estado de egresado, los cuales son:&nbsp;</p>\r\n\r\n<ul>\r\n	<li style=\"text-align:justify\">Aprobar todas las asignaturas del plan de estudios respectivo, del cual al menos 32 unidades valorativas (UV) han debido ser cursadas en esta Universidad.</li>\r\n	<li style=\"text-align:justify\">Obtener, como m&iacute;nimo, el CUM establecido en el plan de estudios respectivo.</li>\r\n	<li style=\"text-align:justify\">Haber cumplido con el servicio social, seg&uacute;n el Reglamento respectivo.</li>\r\n	<li style=\"text-align:justify\">Haber realizado todos los tr&aacute;mites administrativos, requeridos por la Universidad.</li>\r\n	<li style=\"text-align:justify\">Haber cumplido otros requisitos exigidos por la ley.</li>\r\n	<li style=\"text-align:justify\">Para los profesorados, cumplir con los requisitos espec&iacute;ficos establecidos por el Ministerio de Educaci&oacute;n, Ciencia y Tecnolog&iacute;a.</li>\r\n</ul>\r\n\r\n<p style=\"text-align:justify\">&nbsp;</p>\r\n\r\n<p style=\"text-align:justify\">Como anteriormente se menciona, los requisitos se vuelven fundamentales al momento de culminar los estudios, es por ello que el proceso de graduaci&oacute;n es muy importante para todo estudiante egresado de la UCA, ya que esto significa poner en pr&aacute;ctica los conocimientos, habilidades y metodolog&iacute;as adquiridas a lo largo de los estudios superiores, teniendo as&iacute; la oportunidad de hacer proyectos que beneficien a la sociedad y/o instituciones.</p>\r\n\r\n<p style=\"text-align:justify\">&nbsp;</p>\r\n\r\n<p style=\"text-align:justify\">Para la realizaci&oacute;n del trabajo de graduaci&oacute;n es importante documentar todo lo sucedido a lo largo del proyecto, explicando las diferentes metodolog&iacute;as utilizadas, herramientas, esquemas, mapas, entre otras pr&aacute;cticas propias de cada carrera, en el caso de la Facultad de Ingenier&iacute;a y Arquitectura seg&uacute;n el Instructivo para Estudiantes - Proceso de Graduaci&oacute;n (2019), las revisiones respectivas las realiza el Director de Trabajo y el Director de Carrera, dando as&iacute; las respectivas observaciones o sugerencias, las cuales posteriormente se brindan a los estudiantes.</p>\r\n\r\n<p style=\"text-align:justify\">&nbsp;</p>\r\n\r\n<p style=\"text-align:justify\">La revisi&oacute;n del trabajo de graduaci&oacute;n es importante, por lo que se necesita entregar documentaci&oacute;n profesional y de calidad que cumpla con los lineamientos estipulados por Decanato. Cada estudiante egresado que llega a esta fase de su carrera, se encuentra con ciertas dificultades a la hora de hacer su respectivo documento, ya que no se cumple en su totalidad con los par&aacute;metros establecidos, generando as&iacute; retrasos en el proceso de revisi&oacute;n.</p>\r\n\r\n<p style=\"text-align:justify\">&nbsp;</p>\r\n\r\n<p style=\"text-align:justify\">Actualmente se vive en la era digital, donde mediante aplicaciones se puede agilizar procesos y aumentar la productividad, como lo han hecho muchas Universidades, saltando a la era digital. Las Universidades han desarrollado plataformas virtuales, en donde sus estudiantes pueden aprender de una manera m&aacute;s eficiente e intuitiva, mejorando as&iacute; la educaci&oacute;n, como ejemplo de esto, a continuaci&oacute;n, se mencionan tres universidades que han planteado un sistema de gesti&oacute;n de los trabajos de graduaci&oacute;n:</p>\r\n\r\n<p style=\"text-align:justify\">&nbsp;</p>\r\n\r\n<ul>\r\n	<li style=\"text-align:justify\"><u>Universidad Polit&eacute;cnica Salesiana:</u> en la tesis &ldquo;Implementaci&oacute;n de sistema web para la gesti&oacute;n y control de los procesos de la unidad de titulaci&oacute;n de la carrera Ingenier&iacute;a en Sistemas de la Universidad Salesiana, Sede Guayaquil&rdquo; junio 2017, se propone una plataforma web para la gesti&oacute;n y seguimiento de cada una de las etapas de las respectivas opciones que se tienen de titulaci&oacute;n en la Universidad, y as&iacute; automatizar el proceso de titulaci&oacute;n. Jorge Enrique, M.V. (2019) <em>Implementaci&oacute;n de sistema web para la gesti&oacute;n y control de los procesos de la unidad de titulaci&oacute;n de la carrera Ingenier&iacute;a en Sistemas de la Universidad Salesiana, Sede Guayaquil </em>(T&iacute;tulo profesional). Recuperado el 24 de febrero de 2022 de https://dspace.ups.edu.ec/bitstream/123456789/14482/4/UPS-GT001930.pdf</li>\r\n	<li style=\"text-align:justify\"><u>Universidad T&eacute;cnica Particular de Loja (UTPL):</u> en la tesis &ldquo;Desarrollo e Implementaci&oacute;n de un sistema que permita administrar y gestionar los proyectos de fin de titulaci&oacute;n que se postulan en las titulaciones de la UTPL&rdquo; junio 2015, se formula la creaci&oacute;n de una plataforma web donde automatice el proceso de titulaci&oacute;n de la Universidad, en la cual tendr&aacute;n acceso ciertos roles dependiendo del usuario ingresado y de esa manera tanto el Alumnado, Director de Tesis, Tutor de Tesis y Secretaria de Titulaci&oacute;n tendr&aacute;n un m&oacute;dulo de f&aacute;cil acceso y asimismo, contar&aacute; con la disponibilidad de la informaci&oacute;n de manera r&aacute;pida para la administraci&oacute;n de los proyectos de titulaci&oacute;n. Henry Manuel, C.H. (2015) <em>Desarrollo en Implementaci&oacute;n de un sistema que permita administrar y gestionar los proyectos de fin de titulaci&oacute;n que se postulan en las titulaciones de la UTPL </em>(T&iacute;tulo profesional). Recuperado el 25 de febrero de 2022 de https://dspace.utpl.edu.ec/bitstream/123456789/12591/1/Campoverde%20Hidalgo%20Henry%20Manuel.pdf.</li>\r\n	<li style=\"text-align:justify\"><u>Universidad de Quintana Roo:</u> en la tesis &ldquo;Sistema para la gesti&oacute;n de trabajos de titulaci&oacute;n en la Divisi&oacute;n de Ciencias e Ingenier&iacute;a&rdquo; junio de 2015, se detalla la implementaci&oacute;n de un sistema web para la administraci&oacute;n de tesis y monograf&iacute;as, con el prop&oacute;sito de agilizar el proceso de titulaci&oacute;n y evitar hacer operaciones manuales, de esta forma se evitar&aacute;n ciertas dificultades a lo largo del trabajo de titulaci&oacute;n. Francisco Javier, A.U. <em>Sistema para la gesti&oacute;n de trabajos de titulaci&oacute;n en la Divisi&oacute;n de Ciencias e Ingenier&iacute;a </em>(T&iacute;tulo profesional). Recuperado el 24 de febrero de 2022 de http://risisbi.uqroo.mx/bitstream/handle/20.500.12249/646/T58.6.AL101.2015-822.pdf?sequence=1.</li>\r\n</ul>\r\n\r\n<p style=\"text-align:justify\">&nbsp;</p>\r\n\r\n<p style=\"text-align:justify\">Despu&eacute;s de esta breve explicaci&oacute;n de algunas tesis que fueron desarrolladas por otras Universidades, encontramos que es fundamental contar con un sistema totalmente automatizado para agilizar el proceso de revisi&oacute;n de los trabajos de graduaciones, adem&aacute;s estos modelos de aplicativos web tienen el fin de ayudar a los estudiantes con la gesti&oacute;n de su trabajo de titulaci&oacute;n y/o graduaci&oacute;n.</p>\r\n\r\n<p style=\"text-align:justify\">&nbsp;</p>\r\n\r\n<p style=\"text-align:justify\">Observando los modelos anteriores y en base a los grandes avances tecnol&oacute;gicos, se ha llegado a la conclusi&oacute;n que, todas las Instituciones Educativas deben fomentar el uso de aplicativos web que ayudan al estudiantado y a la administraci&oacute;n interna, para que todos los procesos acad&eacute;micos se realicen de manera virtual, disminuyendo el tiempo invertido en estos y de esta manera se pueden agilizar las tareas, proyectos, investigaciones, trabajos de graduaci&oacute;n, entre otros.</p>\r\n\r\n<p style=\"text-align:justify\">&nbsp;</p>\r\n\r\n<p style=\"text-align:justify\">Por lo tanto, estos sistemas deben contar con funcionalidades espec&iacute;ficas para cada Universidad, ya que estas poseen su propia y &uacute;nica jerarqu&iacute;a, por ejemplo en este caso de estudio la Universidad Centroamericana &ldquo;Jos&eacute; Sime&oacute;n Ca&ntilde;as&rdquo; cuenta con su proceso de graduaci&oacute;n, donde involucra a los Estudiantes, Decanato y Encargados de cada Facultad, por lo que se ha visto en necesidad de crear un aplicativo web que ayude, como anteriormente se ha mencionado, a generar el documento del trabajo de graduaci&oacute;n de los estudiantes con sus respectivos lineamientos y en su respectiva revisi&oacute;n.</p>', 2, 16, '2022-07-13 06:52:10', '2022-07-14 03:16:37'),
(30, 'Objetivos', NULL, 3, 16, '2022-07-13 06:52:10', '2022-07-13 06:52:10'),
(31, 'Limitantes', '<p style=\"text-align:justify\">Dentro de las limitantes se encuentran:&nbsp;</p>\r\n\r\n<p style=\"text-align:justify\">&nbsp;</p>\r\n\r\n<ul>\r\n	<li style=\"text-align:justify\">Debido a la pandemia del COVID-19, se han suspendido ciertas actividades dentro del campus de la Universidad por mandatos del Ministerio de Salud (MINSAL), por lo que las reuniones con el grupo de trabajo deben trasladarse a una modalidad virtual, haciendo m&aacute;s dif&iacute;cil la interacci&oacute;n y comunicaci&oacute;n entre los integrantes.</li>\r\n	<li style=\"text-align:justify\">Al ser un proyecto que no cuenta con referencias previas, se debi&oacute; recurrir a herramientas que fomenten el aprendizaje de nuevas tecnolog&iacute;as, que ser&aacute;n utilizadas y aplicadas por los integrantes del grupo para la realizaci&oacute;n del proyecto.</li>\r\n	<li style=\"text-align:justify\">Al ser un proyecto de una gran magnitud, se debe aclarar que el sistema solo se enfocar&aacute; en este caso en la Facultad de Ingenier&iacute;a y Arquitectura de la Universidad, siguiendo de manera concreta los lineamientos establecidos por la instituci&oacute;n, para la realizaci&oacute;n del trabajo de graduaci&oacute;n de los estudiantes.</li>\r\n	<li style=\"text-align:justify\">El sistema se encargar&aacute; de generar las partes del documento correspondientes, esto dependiendo de lo que seleccione el usuario, asimismo, el sistema no revisar&aacute; la parte l&oacute;gica o de an&aacute;lisis de lo escrito por los usuarios dentro del documento, sino m&aacute;s bien verificar el formato y los lineamientos que este debe tener.</li>\r\n</ul>', 6, 16, '2022-07-13 06:52:10', '2022-07-14 03:16:37'),
(32, 'Alcances', '<ul>\r\n	<li style=\"text-align:justify\">El sistema permitir&aacute; la creaci&oacute;n de documentos en formato Word, los cuales contendr&aacute;n los lineamientos establecidos por Decanato, esto se realizar&aacute; mediante formularios en donde los usuarios tengan la capacidad de escribir la informaci&oacute;n requerida de cada secci&oacute;n del trabajo de graduaci&oacute;n.</li>\r\n	<li style=\"text-align:justify\">El aplicativo web contar&aacute; con 3 tipos de usuarios, estos tendr&aacute;n diferentes m&oacute;dulos y funcionalidades, a continuaci&oacute;n, se describen:\r\n	<ul>\r\n		<li style=\"text-align:justify\"><u>Estudiantes</u>: los estudiantes contar&aacute;n con un m&oacute;dulo donde crear&aacute;n documentos en formato Word, este contar&aacute; con los lineamientos establecidos en el Instructivo, adem&aacute;s el aplicativo tendr&aacute; la caracter&iacute;stica de que el estudiante pueda observar los cambios de sus compa&ntilde;eros y adem&aacute;s, construir su respectivo trabajo por medio de los formularios, dichos formularios tendr&aacute;n los mismos registros, por lo tanto el aplicativo tiene una visi&oacute;n colaborativa, de esa forma los integrantes pueden hacer las respectivas correcciones.</li>\r\n		<li style=\"text-align:justify\"><u>Director de Carrera:</u> los Directores podr&aacute;n crear los grupos de trabajo en el sistema, al igual que eliminar o modificar y tambi&eacute;n asignarle el tema a cada equipo con su respectivo Lector y Director de trabajo de graduaci&oacute;n. Asimismo, tendr&aacute; la capacidad de poder agregar Lectores o Directores de trabajo de graduaci&oacute;n externos y as&iacute; poder ser asignados al respectivo grupo.</li>\r\n		<li style=\"text-align:justify\"><u>Administrador del Sistema:</u> el Administrador tendr&aacute; un m&oacute;dulo donde podr&aacute; crear, modificar y eliminar usuarios, este gestor contar&aacute; con la autoridad de asignar roles dentro del aplicativo.</li>\r\n	</ul>\r\n	</li>\r\n	<li style=\"text-align:justify\">La aplicaci&oacute;n web guardar&aacute; el registro de cada parte del documento que ha sido trabajada por el equipo, al igual que las modificaciones que se hagan a lo largo del trabajo de graduaci&oacute;n.</li>\r\n	<li style=\"text-align:justify\">El sistema permitir&aacute; realizar inicios de sesi&oacute;n a cada usuario, en el cual dependiendo del tipo de usuario (Estudiante o Director de carrera), se le mostrar&aacute; la pantalla principal con las opciones propias de cada usuario.</li>\r\n	<li style=\"text-align:justify\">Como anteriormente se menciona se seguir&aacute;n los lineamientos establecidos por Decanato, por lo tanto, el aplicativo contar&aacute; con los siguientes puntos, que ayudar&aacute;n a los estudiantes a realizar su trabajo de graduaci&oacute;n. Estos son los lineamientos a considerar dentro del aplicativo:&nbsp;\r\n	<ul>\r\n		<li style=\"text-align:justify\"><u>Fuente de letra:</u> todo el documento se escribir&aacute; con la letra Times News Roman (11) con excepci&oacute;n de la portada y segunda portada se deben de escribir con el mismo tipo de letra con la consideraci&oacute;n del tama&ntilde;o de letra 14.</li>\r\n		<li style=\"text-align:justify\"><u>M&aacute;rgenes:</u> en todas las p&aacute;ginas el margen superior, inferior y lateral ser&aacute; de 2.5 cm, dejando un borde para encuadernaci&oacute;n de 1 cm.</li>\r\n		<li style=\"text-align:justify\"><u>P&aacute;rrafos y su alineaci&oacute;n:</u> los p&aacute;rrafos estar&aacute;n justificados, sin sangr&iacute;a e interlineado de 1.5.</li>\r\n		<li style=\"text-align:justify\"><u>Numeraci&oacute;n de p&aacute;ginas:</u> el documento tienes 3 tipos de numeraci&oacute;n, las cuales son: romana, ar&aacute;bica e independiente. La numeraci&oacute;n romana comienza desde la secci&oacute;n Resumen hasta la Nomenclatura, la ar&aacute;biga comienza desde la secci&oacute;n Cap&iacute;tulos hasta el final del documento, esto sin incluir los anexos y la numeraci&oacute;n independiente contempla la secci&oacute;n de los anexos, por ejemplo, la p&aacute;gina C-5 hace referencia a la p&aacute;gina 5 del tercer anexo (anexo C).</li>\r\n		<li style=\"text-align:justify\"><u>Espacio entre l&iacute;neas:</u> interlineado de 1.5.<u> </u></li>\r\n		<li style=\"text-align:justify\"><u>Portada:</u> el tama&ntilde;o de letra es de 14 con alineaci&oacute;n centrada agregando el logo de la Universidad Centroamericana &ldquo;Jos&eacute; Sime&oacute;n Ca&ntilde;as&rdquo; (UCA).</li>\r\n		<li style=\"text-align:justify\"><u>T&iacute;tulo de los cap&iacute;tulos:</u> el n&uacute;mero y el nombre del cap&iacute;tulo estar&aacute; en letra may&uacute;scula, adem&aacute;s, de estar centrado y con el formato de fuente en negrita.</li>\r\n		<li style=\"text-align:justify\"><u>T&iacute;tulos y subt&iacute;tulos:</u> todos los t&iacute;tulos y subt&iacute;tulos del trabajo deben de estar alineados a la izquierda y con una fuente en negrita. Adem&aacute;s, se le presentar&aacute; al estudiante la respectiva numeraci&oacute;n dentro del documento.</li>\r\n		<li style=\"text-align:justify\"><u>Numeraci&oacute;n de apartados:</u> Los apartados de los cap&iacute;tulos se numeran en secuencia jer&aacute;rquica, sin sobrepasar de tres numerales. Por ejemplo, el tercer apartado del cap&iacute;tulo 2 se enumerar&aacute; como 2.3. Para desgloses mayores de tres numerales se utilizar&aacute; numeraci&oacute;n simple o vi&ntilde;etas.</li>\r\n	</ul>\r\n	</li>\r\n	<li style=\"text-align:justify\">El aplicativo web ha considerado distintos apartados, los cuales son fundamentales dentro del trabajo de graduaci&oacute;n, de esta manera el alumnado podr&aacute; completar las siguientes secciones:\r\n	<ul>\r\n		<li style=\"text-align:justify\"><u>Portada y Segunda portada:</u> contiene los nombres y apellidos de los alumnos que realizaron el Trabajo de graduaci&oacute;n y a su vez se hace menci&oacute;n de la Instituci&oacute;n y personal involucrado en el desarrollo de dicho trabajo (Director de carrera, Decano, Director del trabajo de graduaci&oacute;n, etc).</li>\r\n		<li style=\"text-align:justify\"><u>Agradecimiento (opcional):</u> es un apartado en el que se da el respectivo cr&eacute;dito y agradecimiento a todo aquel que haya colaborado de alguna manera en la elaboraci&oacute;n del Trabajo de graduaci&oacute;n.</li>\r\n		<li style=\"text-align:justify\"><u>Dedicatorias (opcional):</u> es una secci&oacute;n en donde el autor extiende reconocimiento o gratitud a una persona, lugar o grupo de personas que resultan especiales.</li>\r\n		<li style=\"text-align:justify\"><u>Resumen:</u> la secci&oacute;n comprende entre 2 y 3 p&aacute;ginas, en donde se expresan los conceptos principales de los cap&iacute;tulos del documento, haciendo &eacute;nfasis en las conclusiones y recomendaciones.</li>\r\n		<li style=\"text-align:justify\"><u>&Iacute;ndice general:</u> es un apartado en forma de lista que incluye todas las secciones y cap&iacute;tulos del documento, indicando a su vez el n&uacute;mero de p&aacute;gina donde se encuentra.</li>\r\n		<li style=\"text-align:justify\"><u>Siglas:</u> en esta secci&oacute;n se presentan en orden alfab&eacute;tico las abreviaturas formadas por las letras iniciales de un sintagma, como nombres de instituciones, empresas, etc. En el caso de que no est&eacute; en castellano, deber&aacute; presentarse la traducci&oacute;n correspondiente entre par&eacute;ntesis.</li>\r\n		<li style=\"text-align:justify\"><u>Abreviaciones:</u> se presentan todas las abreviaciones en orden alfab&eacute;tico junto con su significado. El uso de estas debe evitarse, pero cuando sea necesario se debe procurar utilizar pocas, esto con el fin de hacer una lectura m&aacute;s fluida del documento.</li>\r\n		<li style=\"text-align:justify\"><u>Nomenclaturas:</u> en dicha secci&oacute;n se presentan las nomenclaturas en orden alfab&eacute;tico junto con su significado. En algunas ocasiones un mismo s&iacute;mbolo puede hacer referencia a uno o varios significados, aunque deber&iacute;a de evitarse a toda costa su uso, por lo que, si no es posible hacerlo, debe de indicarse los apartados o cap&iacute;tulos donde se aplica cada significado.</li>\r\n		<li style=\"text-align:justify\"><u>Cap&iacute;tulos:</u> la secci&oacute;n de cap&iacute;tulos contiene el desarrollo y resultados del trabajo de graduaci&oacute;n, como, por ejemplo: Introducci&oacute;n, Marco Te&oacute;rico, Metodolog&iacute;a, etc.</li>\r\n		<li style=\"text-align:justify\"><u>Glosario (Opcional):</u> consiste en una lista de definiciones de t&eacute;rminos t&eacute;cnicos muy especializados que no pueden encontrarse en un Diccionario t&eacute;cnico general, asimismo, debe de ordenarse alfab&eacute;ticamente.</li>\r\n		<li style=\"text-align:justify\"><u>Referencias:</u> en dicha secci&oacute;n se presenta un conjunto de datos que sirven para identificar o describir documento, libro, fuente electr&oacute;nica u otro tipo de obra intelectual, usado a lo largo del documento escrito.</li>\r\n	</ul>\r\n	</li>\r\n</ul>', 7, 16, '2022-07-13 06:52:10', '2022-07-14 03:16:37'),
(33, 'Introducción del capitulo', '<p>null</p>', 0, 17, '2022-07-13 06:57:45', '2022-07-13 06:57:45'),
(35, 'Documentos para el proceso de graduación', '<p style=\"text-align:justify\">Para el proceso de graduaci&oacute;n de la Universidad Centroamericana &ldquo;Jos&eacute; Sime&oacute;n Ca&ntilde;as&rdquo;, se cuenta con una serie de documentos los cuales deben seguir los estudiantes egresados de las diferentes facultades, como primera instancia se tiene el Reglamento Administrativo Acad&eacute;mico de las Carreras de Grado, y por otro lado se tiene el Instructivo para Estudiantes en Proceso de Graduaci&oacute;n, este instructivo var&iacute;a seg&uacute;n cada Facultad.</p>\r\n\r\n<p style=\"text-align:justify\">&nbsp;</p>\r\n\r\n<p style=\"text-align:justify\">Como anteriormente se menciona, el Instructivo contiene el reglamento que todo estudiante debe cumplir a lo largo del proceso de graduaci&oacute;n, as&iacute; como tambi&eacute;n los actores involucrados y lineamientos a seguir en los documentos a entregar al finalizar su respectivo trabajo. Es por ello, que a continuaci&oacute;n se explica a detalle el contenido de dicho Instructivo.</p>', 1, 17, '2022-07-13 07:15:08', '2022-07-14 04:48:32'),
(36, '¿Qué son las Aplicaciones Web?', '<p style=\"text-align:justify\">Las aplicaciones web son programas que funcionan a trav&eacute;s de internet, es decir que cualquier tipo de interacci&oacute;n es procesada y almacenada dentro de un servidor web, por lo que necesita de una conexi&oacute;n a internet estable, y cabe mencionar que estas aplicaciones no requieren de ning&uacute;n tipo de instalaci&oacute;n, solo necesitan un entorno que sea capaz de enviar e interpretar todo tipo de peticiones y respuestas que sean recibidas, dichos entornos son conocidos como navegadores.</p>\r\n\r\n<p style=\"text-align:justify\">&nbsp;</p>\r\n\r\n<p style=\"text-align:justify\">El concepto de aplicaci&oacute;n web est&aacute; ligado al almacenamiento en la nube, toda informaci&oacute;n se guarda de forma permanente en un datacenter, los cuales son los encargados de recibir todas las peticiones para luego retornar una respuesta al cliente, generando una copia temporal dentro del dispositivo que aloja el navegador. (GCFGlobal.org, 2022)</p>\r\n\r\n<p style=\"text-align:justify\">&nbsp;</p>\r\n\r\n<p style=\"text-align:justify\">Como se mencion&oacute; anteriormente, los datacenter son los encargados de almacenar toda la informaci&oacute;n que el usuario env&iacute;a, pero no se limitan solo a retornar la informaci&oacute;n necesaria, tambi&eacute;n se encargan de realizar copias de seguridad de todos los datos almacenados, y procesar todas las peticiones realizadas por todos los usuarios conectados a nivel mundial, por lo general los datacenter son instalaciones ubicadas en puntos estrat&eacute;gicos, con monitorizaci&oacute;n continua, y adem&aacute;s, cuentan con muy buena refrigeraci&oacute;n.</p>\r\n\r\n<p style=\"text-align:justify\">&nbsp;</p>\r\n\r\n<p style=\"text-align:justify\">La principal ventaja de las aplicaciones web, es que pueden ser accedidas desde cualquier lugar, en cualquier momento y en cualquier dispositivo que admita una conexi&oacute;n a internet, asimismo, ofrecen una enorme facilidad en su mantenimiento, haciendo que la labor de las actualizaciones o reparaciones de estas, resulte ser extremadamente f&aacute;cil en comparaci&oacute;n a una aplicaci&oacute;n nativa para un dispositivo, ya que una vez que se aplica la actualizaci&oacute;n, su distribuci&oacute;n es muy f&aacute;cil y no es necesario que el usuario realice procesos adicionales.</p>\r\n\r\n<p style=\"text-align:justify\">&nbsp;</p>\r\n\r\n<p>El t&eacute;rmino aplicaci&oacute;n web puede ser utilizado para designar a todos aquellos programas que son ejecutados en el entorno del navegador, o que fueron creados usando un lenguaje soportado por dicho navegador, de esta manera, este se utiliza para renderizar la interfaz gr&aacute;fica de la aplicaci&oacute;n. (Aplicaciones Web, n.d.)</p>', 8, 17, '2022-07-13 22:24:20', '2022-07-14 04:51:30'),
(37, 'Lenguaje de Programación PHP', '<p style=\"text-align:justify\">A la hora de crear una aplicaci&oacute;n web es necesario del uso de uno o varios lenguajes de programaci&oacute;n, normalmente para la creaci&oacute;n de este tipo de aplicaciones se cubren 2 aspectos: la programaci&oacute;n &ldquo;Front end&rdquo; y la programaci&oacute;n &ldquo;Back end&rdquo;. La parte &ldquo;Front end&rdquo; conforma todo lo que el usuario puede ver, es decir, los dise&ntilde;os del sitio, la estructura del mismo, colores, y los efectos y animaciones que estos pueden llegar a contener. Por otro lado, la parte &ldquo;Back end&rdquo;, consiste en la construcci&oacute;n de las funcionalidades que toda aplicaci&oacute;n debe tener, esto se complementa con la programaci&oacute;n &ldquo;Front end&rdquo;.</p>\r\n\r\n<p style=\"text-align:justify\">&nbsp;</p>\r\n\r\n<p style=\"text-align:justify\">En la actualidad existen muchos lenguajes de programaci&oacute;n que se pueden utilizar para la creaci&oacute;n de p&aacute;ginas web, para el presente trabajo, se har&aacute; uso del lenguaje de programaci&oacute;n llamado PHP, el cual es muy utilizado alrededor del mundo.</p>\r\n\r\n<p style=\"text-align:justify\">&nbsp;</p>\r\n\r\n<p style=\"text-align:justify\">PHP, cuyo acr&oacute;nimo significa &ldquo;HyperText Preprocessor&rdquo; o preprocesador de hipertexto, es un lenguaje de c&oacute;digo abierto que permite el desarrollo de aplicaciones web, este lenguaje puede trabajar dentro del lenguaje HTML que significa &ldquo;HyperText Markup Language&rdquo;, pero se deben seguir algunas reglas preestablecidas. (Epitech Espa&ntilde;a, 2021)</p>\r\n\r\n<p style=\"text-align:justify\">&nbsp;</p>\r\n\r\n<p style=\"text-align:justify\">Como anteriormente se mencion&oacute;, PHP es utilizado para un gran n&uacute;mero de aplicaciones, tiene como ventaja el ser un lenguaje de c&oacute;digo abierto, lo cual &ldquo;permite a los desarrolladores editar su estructura, y por lo tanto aplicarse en cualquier proyecto&rdquo;. &nbsp;Este lenguaje al funcionar en conjunto con HTML permite una mejor manipulaci&oacute;n de este y por ende facilita la comunicaci&oacute;n entre las funciones de &ldquo;Back end&rdquo; y &ldquo;Front end&rdquo;. (Epitech Espa&ntilde;a, 2021)</p>', 10, 17, '2022-07-13 22:26:07', '2022-07-14 04:51:30'),
(38, 'PHPWord', '<p style=\"text-align:justify\">Cabe mencionar que, PHP como cualquier lenguaje de programaci&oacute;n, posee librer&iacute;as que ayudan a los desarrolladores al momento de la programaci&oacute;n, facilitando la creaci&oacute;n de plataformas complejas y bien estructuradas.</p>\r\n\r\n<p style=\"text-align:justify\">&nbsp;</p>\r\n\r\n<p style=\"text-align:justify\">Las librer&iacute;as o bibliotecas de PHP son colecciones de c&oacute;digo prescritos que ayudan al programador a optimizar tareas, logrando as&iacute; desarrollar proyectos completos y funcionales, ya que la creaci&oacute;n desde cero de algunas tareas puede resultar tedioso y cansado, por lo que las librer&iacute;as ayudan a reducir el tiempo de desarrollo de las aplicaciones, esto con el fin de reducir la carga de los programadores durante la codificaci&oacute;n.</p>\r\n\r\n<p style=\"text-align:justify\">&nbsp;</p>\r\n\r\n<p style=\"text-align:justify\">Como se menciona en la documentaci&oacute;n oficial de PHPWord, la librer&iacute;a est&aacute; escrita con PHP puro que contiene diversas clases para leer y escribir archivos de diferentes formatos, como lo son: Microsoft Office Open XML (OOXML u OpenXML), formato de documento abierto OASIS para aplicaciones de Office (OpenDocument u ODF) y formato de texto enriquecido (RTF). (PHPWord, n.d.)</p>', 15, 17, '2022-07-13 22:33:23', '2022-07-15 07:17:11'),
(39, 'Laravel', '<p style=\"text-align:justify\">Laravel es un framework de c&oacute;digo abierto para el desarrollo de aplicaciones y servicios web, haciendo uso del lenguaje de programaci&oacute;n PHP en sus versiones 5, 7 y 8.&nbsp; Laravel posee una comunidad inmensa compuesta por desarrolladores que colaboran para el soporte y mejora del mismo.</p>', 17, 17, '2022-07-13 22:33:23', '2022-07-15 07:17:11'),
(40, 'Voyager Laravel', '<p style=\"text-align:justify\">En un sitio web es fundamental tener un panel administrativo en el cual los datos mostrados, puedan ser modificados seg&uacute;n sea conveniente y de esa manera tener la informaci&oacute;n m&aacute;s actualizada, por lo que existe una herramienta creada exclusivamente en Laravel que ayuda a solventar dicha necesidad, llamada Voyager Laravel.</p>\r\n\r\n<p style=\"text-align:justify\">&nbsp;</p>\r\n\r\n<p style=\"text-align:justify\">Voyager es un panel de administraci&oacute;n que brinda a toda aplicaci&oacute;n creada en Laravel, la forma de mantener sus datos actualizados de manera f&aacute;cil logrando agregar, modificar y eliminar la informaci&oacute;n almacenada en la base de datos, teniendo as&iacute; total control sobre un sitio web. A continuaci&oacute;n, se muestran las diferentes funcionalidades que posee el panel administrativo, seg&uacute;n la documentaci&oacute;n oficial de Voyager:</p>\r\n\r\n<p style=\"text-align:justify\">&nbsp;</p>\r\n\r\n<ul>\r\n	<li style=\"text-align:justify\">Es una interfaz de administraci&oacute;n para una aplicaci&oacute;n Laravel.</li>\r\n	<li style=\"text-align:justify\">Una manera f&aacute;cil de agregar/editar/eliminar datos para su aplicaci&oacute;n.</li>\r\n	<li style=\"text-align:justify\">Un generador de men&uacute;s, este puede crear menus para su aplicaci&oacute;n.</li>\r\n	<li style=\"text-align:justify\">Administrador de medios para los archivos.</li>\r\n	<li style=\"text-align:justify\">Generador de CRUD (Crear, Leer, Modificar y Eliminar) / BREAD (Navegar, Editar, Leer, Agregar).</li>\r\n</ul>\r\n\r\n<p style=\"text-align:justify\">&nbsp;</p>\r\n\r\n<p style=\"text-align:justify\">Teniendo en cuenta las funcionalidades mencionadas anteriormente es necesario resaltar que Voyager es una herramienta que facilita la creaci&oacute;n de un panel administrativo, por lo que dicha herramienta no puede ser usada para otros fines como, por ejemplo: un sistema gestor de contenidos, una plataforma de blogs y Wordpress. (Voyager, 2022)</p>', 22, 17, '2022-07-13 22:33:23', '2022-07-15 07:17:11'),
(41, 'CKEditor', '<p style=\"text-align:justify\">JavaScript es uno de los lenguajes de programaci&oacute;n m&aacute;s utilizados, esto debido a que provee una mayor interactividad y dinamismo a las p&aacute;ginas web, ya que cuando JavaScript es ejecutado en el navegador, no es necesario de ning&uacute;n compilador, es por ello que existen diferentes librer&iacute;as o frameworks programados en dicho lenguaje, esto con el fin de poder facilitar la programaci&oacute;n de ciertos m&oacute;dulos que, sin la ayuda de estas herramientas, se perder&iacute;a tiempo y recursos. (Ramos, 2020)</p>\r\n\r\n<p style=\"text-align:justify\">&nbsp;</p>\r\n\r\n<p style=\"text-align:justify\">Para este caso de estudio es necesario utilizar herramientas para la implementaci&oacute;n de un sitio web que sea capaz de crear documentos, por lo cual debe de contar con un editor de texto &uacute;til y que sea f&aacute;cil de utilizar, adem&aacute;s, que provea todas las funciones necesarias para escribir y dar formato a dichos documentos, para ello se implementar&aacute; la librer&iacute;a llamada CKEditor en su versi&oacute;n 5.0.</p>', 23, 17, '2022-07-13 22:58:20', '2022-07-15 07:17:11'),
(42, 'MySQL', '<p style=\"text-align:justify\">En un aplicativo web es importante contar con alguna base de datos que se encargue de guardar informaci&oacute;n importante, ya que esta nos permite llevar un control de procesos y de flujo de usuarios que utilicen el sitio web, por lo que las bases de datos se vuelven fundamentales en muchos proyectos de software, y no solamente para proyectos que involucren aplicaciones web.</p>\r\n\r\n<p style=\"text-align:justify\">&nbsp;</p>\r\n\r\n<p style=\"text-align:justify\">Para este caso se tiene pensado utilizar un gestor de bases de datos basado en modelo relacional SQL, cuyo acr&oacute;nimo significa &ldquo;Structured Query Language&rdquo; o lenguaje estructurado de comandos. El lenguaje SQL se encarga de la extracci&oacute;n y organizaci&oacute;n de la informaci&oacute;n obtenida en una base de datos relacional, por lo que para poder utilizar el lenguaje SQL, es importante contar con un &ldquo;diagrama relacional&rdquo; para poder dar las directivas sobre c&oacute;mo estar&aacute; conformada la base de datos y posteriormente crear el &ldquo;diagrama entidad-relaci&oacute;n&rdquo;. A continuaci&oacute;n, se muestra un ejemplo de diagrama entidad-relaci&oacute;n:</p>\r\n\r\n<p style=\"text-align:justify\">&nbsp;</p>\r\n\r\n<p style=\"text-align:justify\"><strong>(Espacio para figura)</strong></p>\r\n\r\n<p style=\"text-align:justify\">&nbsp;</p>\r\n\r\n<p style=\"text-align:justify\">En el lenguaje SQL existen varias versiones y herramientas para el soporte del mismo, el m&aacute;s com&uacute;n es MySQL. Este es un gestor de c&oacute;digo abierto que ayuda en la parte de &ldquo;Back-end&rdquo;, o en la parte de la programaci&oacute;n que se encarga de procesos que no son vistos por el usuario. Cuando se utiliza SQL, el comando debe pasar por un optimizador de comandos y al momento de alcanzar el gestor este se compila en 3 fases:</p>\r\n\r\n<p style=\"text-align:justify\">&nbsp;</p>\r\n\r\n<ul>\r\n	<li style=\"text-align:justify\"><u>Parseo </u><u>de data:</u> Proceso de chequeo de sintaxis.</li>\r\n	<li style=\"text-align:justify\"><u>Uni&oacute;n de la data:</u> Proceso de chequeo para la sem&aacute;ntica de comandos.</li>\r\n	<li style=\"text-align:justify\"><u>Optimizaci&oacute;n de la data:</u> Proceso para generar la ejecuci&oacute;n del plan. (Springboard, 2021)</li>\r\n</ul>', 26, 17, '2022-07-13 22:58:20', '2022-07-15 07:17:11'),
(43, 'Módulo de seguridad OAuth2', '<p style=\"text-align:justify\">El m&oacute;dulo OAuth 2.0 es el est&aacute;ndar de la industria respecto a los protocolos para autorizaci&oacute;n, lo que nos permite compartir informaci&oacute;n entre sitios sin tener que compartir la identidad. OAuth es un m&oacute;dulo utilizado por varias empresas, tales como: Google, Facebook, Microsoft, GitHub y muchas m&aacute;s.</p>\r\n\r\n<p style=\"text-align:justify\">&nbsp;</p>\r\n\r\n<p style=\"text-align:justify\">Este modelo, surge para poder suplir la necesidad de enviar credenciales de forma continua entre el cliente y el servidor, esto se puede ver reflejado en el caso de que se cuente con una API y una aplicaci&oacute;n cliente, si ambos sistemas pertenecen a la misma organizaci&oacute;n es posible que no exista ning&uacute;n problema, sin embargo, si se quisiera conectar a un servicio de terceros podr&iacute;a implicar algunos problemas o un flujo que no es c&oacute;modo para el usuario, adem&aacute;s, que esto no es aceptable. Un ejemplo de esto es: tener que solicitar al usuario sus credenciales para poder enviarlas a la plataforma de terceros.</p>\r\n\r\n<p style=\"text-align:justify\">&nbsp;</p>\r\n\r\n<p style=\"text-align:justify\">En la actualidad estos flujos no son as&iacute;, ya que al usar el m&oacute;dulo OAuth el usuario delega muchas de estas funciones o acciones a este, por lo que &eacute;l ya no tiene que preocuparse de eso, cabe destacar que las acciones o funciones que el usuario usa son &uacute;nicamente aquellas a las que &eacute;l ha dado su consentimiento, de esta manera podr&iacute;amos delegar en una aplicaci&oacute;n de terceros la posibilidad de que ejecute alguna acci&oacute;n en alg&uacute;n momento sin que esta tenga que conocer nuestras credenciales, o bien sin la necesidad de que la aplicaci&oacute;n nos solicite las credenciales cada que se necesite hacer una acci&oacute;n. (L&oacute;pez Maga&ntilde;a, 2020)</p>', 31, 17, '2022-07-13 22:58:20', '2022-07-15 07:17:11'),
(44, 'Metodología ágil y tradicional', '<p style=\"text-align:justify\">En una empresa o grupo de trabajo tiene m&uacute;ltiples ventajas utilizar la metodolog&iacute;a &aacute;gil, ya que puede aportar numerosos beneficios como la optimizaci&oacute;n del flujo de trabajo, aumento de productividad del equipo y una mayor satisfacci&oacute;n de parte del cliente.</p>\r\n\r\n<p style=\"text-align:justify\">&nbsp;</p>\r\n\r\n<p style=\"text-align:justify\">La idea principal de dicha metodolog&iacute;a es que las actividades importantes en un proceso de desarrollo se puedan realizar de manera m&aacute;s din&aacute;mica y con mayores resultados. La metodolog&iacute;a &aacute;gil, es un conjunto de pr&aacute;cticas y t&eacute;cnicas que hacen que la realizaci&oacute;n y la finalizaci&oacute;n de proyectos sea satisfactoria y de esta manera se brinde un producto de calidad. (da Silva, 2021)</p>\r\n\r\n<p style=\"text-align:justify\">&nbsp;</p>\r\n\r\n<p style=\"text-align:justify\">Scrum es una de las metodolog&iacute;as con enfoque &aacute;gil m&aacute;s utilizadas en la actualidad, pero para poder comenzar a hablar sobre Scrum es necesario entender que son estas metodolog&iacute;as, y cu&aacute;l es su prop&oacute;sito principal.</p>\r\n\r\n<p style=\"text-align:justify\">&nbsp;</p>\r\n\r\n<p style=\"text-align:justify\">Cuando se habla de una metodolog&iacute;a que sigue un enfoque &aacute;gil o simplemente metodolog&iacute;a &aacute;gil para desarrollo de software, hacemos referencia a que es un marco de trabajo que tiene como objetivo la entrega continua de software funcionando en intervalos cortos de tiempo, sin embargo, una metodolog&iacute;a &aacute;gil no hace referencia a un conjunto de reglas o indicaciones que detallan con total claridad lo que se debe hacer durante un proceso de desarrollo de software, m&aacute;s bien se trata de una forma de pensar basada en la colaboraci&oacute;n entre cada miembro del equipo y los flujos de trabajo.&nbsp;</p>\r\n\r\n<p style=\"text-align:justify\">&nbsp;</p>\r\n\r\n<p style=\"text-align:justify\">Adem&aacute;s, esta forma de trabajo define un conjunto de valores que ayudan a guiar las decisiones en base a lo que se planea hacer y los resultados que se desean obtener. En resumen, las metodolog&iacute;as &aacute;giles buscan generar peque&ntilde;os segmentos de software funcional para aumentar el nivel de satisfacci&oacute;n del cliente. Por lo general, estas utilizan enfoques flexibles y el trabajo en equipo, para lograr obtener mejoras de manera constante, por lo que para un desarrollo &aacute;gil implica el uso de equipos peque&ntilde;os auto organizados.</p>\r\n\r\n<p style=\"text-align:justify\">&nbsp;</p>\r\n\r\n<p style=\"text-align:justify\">Las metodolog&iacute;as &aacute;giles poseen cuatro caracter&iacute;sticas fundamentales que deben priorizarse por encima de otras, debido a esto los equipos de desarrollo deben tomar en cuenta los siguientes valores &aacute;giles y adoptarlos para cualquier proyecto:</p>\r\n\r\n<p style=\"text-align:justify\">&nbsp;</p>\r\n\r\n<ul>\r\n	<li style=\"text-align:justify\">Las personas y las interacciones antes que los procesos y las herramientas.</li>\r\n	<li style=\"text-align:justify\">Software funcionando antes que documentaci&oacute;n exhaustiva.</li>\r\n	<li style=\"text-align:justify\">La colaboraci&oacute;n con el cliente antes que la negociaci&oacute;n contractual.</li>\r\n	<li style=\"text-align:justify\">La respuesta ante el cambio antes que el apego a un plan. (Red Hat, 2020)</li>\r\n</ul>\r\n\r\n<p style=\"text-align:justify\">&nbsp;</p>\r\n\r\n<p style=\"text-align:justify\">Tambi&eacute;n, se destaca una diferencia muy notoria entre una metodolog&iacute;a tradicional en cascada y una metodolog&iacute;a &aacute;gil, ya que una metodolog&iacute;a tradicional se basa en realizar todas las tareas en etapas muy bien segmentadas, por ejemplo, se tiene la fase de dise&ntilde;o y en esta fase se dise&ntilde;a cada elemento del sistema, finalizada esta etapa es posible dar inicio a la etapa de desarrollo y as&iacute; sucesivamente.</p>\r\n\r\n<p style=\"text-align:justify\">&nbsp;</p>\r\n\r\n<p style=\"text-align:justify\">Otra diferencia muy importante tiene que ver con los plazos de entregas, en una metodolog&iacute;a &aacute;gil las entregas son peri&oacute;dicas y el producto final comienza a tomar forma poco a poco, en metodolog&iacute;as tradicionales se realiza una sola entrega final, luego de que ha pasado por todas las etapas, a su vez en una metodolog&iacute;a tradicional al momento de entregar el producto final, se podr&iacute;a requerir alg&uacute;n cambio, lo que implica un retroceso significativo, por otro lado, en una metodolog&iacute;a &aacute;gil es posible realizar cambios entre iteraciones sin mayor problema. Posteriormente, se muestra una esquematizaci&oacute;n de la metodolog&iacute;a tradicional y &aacute;gil:</p>\r\n\r\n<p style=\"text-align:justify\">&nbsp;</p>\r\n\r\n<p style=\"text-align:justify\"><strong>(Espacio para figura)</strong></p>', 35, 17, '2022-07-13 22:58:20', '2022-07-15 07:17:11'),
(45, 'Introducción del capitulo', '<p>null</p>', 0, 18, '2022-07-13 23:49:23', '2022-07-13 23:49:23');
INSERT INTO `contenido_seccion_capitulo` (`id`, `tema`, `contenido`, `orden_contenido`, `seccion_capitulo_id`, `created_at`, `updated_at`) VALUES
(46, 'Descripción del proyecto', '<p style=\"text-align:justify\">En la Universidad Centroamericana &ldquo;Jos&eacute; Sime&oacute;n Ca&ntilde;as&rdquo; cada a&ntilde;o los alumnos que est&aacute;n por culminar sus estudios de pregrado, desarrollan un proyecto final denominado &ldquo;Trabajo de Graduaci&oacute;n&rdquo;, en el cual se les asigna un tema que deben de investigar y, por lo tanto, se pide un documento con los resultados obtenidos de dicha investigaci&oacute;n, esto con el fin de dar a conocer la informaci&oacute;n recopilada durante el tiempo del proceso y su posible soluci&oacute;n.</p>\r\n\r\n<p style=\"text-align:justify\">&nbsp;</p>\r\n\r\n<p style=\"text-align:justify\">Como se mencion&oacute; anteriormente, cada a&ntilde;o se realizan diferentes proyectos que ayudan a un sector de la poblaci&oacute;n o distintas Instituciones, por lo que se han podido observar ciertas dificultades entre los estudiantes que est&aacute;n realizando el proceso de graduaci&oacute;n. Dichas dificultades se presentan al momento de hacer su respectivo documento, ya que no siempre se cumple con los lineamientos estipulados por Decanato, de manera que se necesita una soluci&oacute;n inform&aacute;tica para poder brindar una soluci&oacute;n a la Universidad y a todos los estudiantes que est&eacute;n en el proceso.</p>\r\n\r\n<p style=\"text-align:justify\">&nbsp;</p>\r\n\r\n<p style=\"text-align:justify\">Como soluci&oacute;n inform&aacute;tica, se desea implementar un sitio web, el cual ser&aacute; una importante herramienta donde los estudiantes de manera f&aacute;cil e intuitiva puedan crear sus respectivos documentos del trabajo de graduaci&oacute;n, los cuales cumplir&aacute;n con los lineamientos estipulados por su correspondiente Decanato. La aplicaci&oacute;n estar&aacute; enfocada a la Facultad de Ingenier&iacute;a y Arquitectura, por lo que los lineamientos a seguir en el presente proyecto ser&aacute;n los de dicha Facultad y eventualmente en futuras actualizaciones poder implementarlo en las dem&aacute;s Facultades.</p>\r\n\r\n<p style=\"text-align:justify\">&nbsp;</p>\r\n\r\n<p style=\"text-align:justify\">El sistema contar&aacute; con 3 roles principales, los cuales son: Administrador, Director de Carrera y Estudiante Egresado, cada uno con su correspondiente m&oacute;dulo y funcionalidades propias de cada usuario. A continuaci&oacute;n, se detalla los m&oacute;dulos y funcionalidades de cada uno de los roles:</p>\r\n\r\n<p style=\"text-align:justify\">&nbsp;</p>\r\n\r\n<ul>\r\n	<li style=\"text-align:justify\"><u>Administrador:</u> el usuario administrador tiene a cargo el manejo de usuarios y roles en el sistema, los cuales tendr&aacute; la capacidad de modificar, agregar y eliminar usuarios y, asimismo, podr&aacute; asignar roles dentro del aplicativo.</li>\r\n	<li style=\"text-align:justify\"><u>Director de Carrera:</u> dicho usuario se encargar&aacute; de la gesti&oacute;n de los grupos de los Trabajos de graduaci&oacute;n, por lo que podr&aacute; formar los grupos, asignarles el tema, asignar Lector y Director del trabajo, tambi&eacute;n, podr&aacute; modificar dichos datos seg&uacute;n sea conveniente. El usuario podr&aacute; ingresar al sistema a personas ajenas a la Universidad, es decir personas externas, que ayuden en el desarrollo del trabajo de graduaci&oacute;n, ya sea como Director del trabajo o Segundo Lector y posteriormente ser asignado a un grupo en particular.</li>\r\n	<li style=\"text-align:justify\"><u>Estudiante Egresado:</u> el usuario del estudiante tendr&aacute; un m&oacute;dulo que le facilitar&aacute; la creaci&oacute;n de su documento escrito del trabajo de graduaci&oacute;n, lo cual cumplir&aacute; con los lineamientos establecidos por el Decanato de la Facultad de Ingenier&iacute;a y Arquitectura. El sitio web le brindar&aacute; al usuario una serie de formularios, donde podr&aacute; llenarlos con la informaci&oacute;n correspondiente a cada secci&oacute;n del documento y luego podr&aacute; ser descargada la informaci&oacute;n en un documento en formato Word, el cual ya tendr&aacute; configurado previamente los lineamientos anteriormente mencionados. Las secciones del documento que el usuario podr&aacute; desarrollar son los siguientes:\r\n	<ul>\r\n		<li style=\"text-align:justify\">Portada y Segunda portada.</li>\r\n		<li style=\"text-align:justify\">Agradecimientos (Opcional).</li>\r\n		<li style=\"text-align:justify\">Dedicatoria (Opcional).</li>\r\n		<li style=\"text-align:justify\">Resumen.</li>\r\n		<li style=\"text-align:justify\">&Iacute;ndice General.</li>\r\n		<li style=\"text-align:justify\">Siglas.</li>\r\n		<li style=\"text-align:justify\">Abreviaciones.</li>\r\n		<li style=\"text-align:justify\">Nomenclaturas.</li>\r\n		<li style=\"text-align:justify\">Cap&iacute;tulos.</li>\r\n		<li style=\"text-align:justify\">Glosario (Opcional).</li>\r\n		<li style=\"text-align:justify\">Referencias.</li>\r\n	</ul>\r\n	</li>\r\n</ul>', 1, 18, '2022-07-13 23:49:23', '2022-07-14 03:10:48'),
(47, 'Requerimientos del Sistema', '<p style=\"text-align:justify\">Para la creaci&oacute;n de un aplicativo web capaz de crear los respectivos documentos de graduaci&oacute;n, es necesario analizar las necesidades que el sistema debe solventar a los usuarios, as&iacute; como tambi&eacute;n, detallar las funcionalidades esperadas, ya que son la base al momento de desarrollar el sitio web, por lo tanto, se han planteado los requerimientos funcionales y no funcionales de dicho sistema.</p>', 2, 18, '2022-07-13 23:49:23', '2022-07-14 03:10:49'),
(48, 'Introducción del capitulo', '<p style=\"text-align:justify\">Al momento de la creaci&oacute;n de un sitio web es necesario conocer las herramientas o librer&iacute;as que se usar&aacute;n para lograr solventar de la mejor manera las necesidades del usuario y, asimismo, tener una metodolog&iacute;a de trabajo que ayude a estructurar y estandarizar los procesos de desarrollo, logrando as&iacute;, optimizar las actividades del equipo de trabajo a lo largo del Trabajo de Graduaci&oacute;n.</p>', 0, 19, '2022-07-13 23:51:08', '2022-07-14 03:06:57'),
(49, 'Herramientas de trabajo', '<p style=\"text-align:justify\">Para el desarrollo de un aplicativo web se necesita de las herramientas adecuadas para brindar una posible soluci&oacute;n y proveer as&iacute;, un aplicativo &uacute;til que ayude a los estudiantes en su Trabajo de Graduaci&oacute;n. A continuaci&oacute;n, se muestran los instrumentos de programaci&oacute;n a utilizar en la creaci&oacute;n del sitio web:</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<ul>\r\n	<li><u>Lenguaje de programaci&oacute;n:</u> Lenguaje de programaci&oacute;n PHP 7.4.27.</li>\r\n	<li><u>Editor de c&oacute;digo:</u> Visual Studio Code.</li>\r\n	<li><u>Framework PHP:</u> Laravel 8.</li>\r\n	<li><u>Librer&iacute;a para la creaci&oacute;n de documentos:</u>&nbsp; PHPWord.</li>\r\n	<li><u>Interfaz de administraci&oacute;n:</u> Voyager Laravel.</li>\r\n	<li><u>Librer&iacute;a de dise&ntilde;o:</u> Bootstrap.</li>\r\n	<li><u>Componente de editor de texto JavaScript:</u> CKEditor 5.0</li>\r\n	<li><u>Gestor de base de datos:</u> MySQL.</li>\r\n	<li><u>Administrador de base de datos:</u> PHPMyAdmin.</li>\r\n	<li><u>Diagrama de base de datos:</u> dbdiagram.io</li>\r\n	<li><u>Control de versiones:</u> Git.</li>\r\n	<li><u>Sistema de gesti&oacute;n de aplicaciones:</u> Github.</li>\r\n</ul>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p style=\"text-align:justify\">En el caso de la creaci&oacute;n de los documentos de los trabajos de graduaci&oacute;n, es indispensable cumplir con ciertos par&aacute;metros previamente establecidos por Decanato, por consiguiente, los lineamientos que se han utilizado como referencia son pertenecientes al Instructivo para Estudiantes - Proceso de Graduaci&oacute;n, octubre 2019 de la Facultad de Ingenier&iacute;a y Arquitectura de la Universidad Centroamericana &ldquo;Jos&eacute; Sime&oacute;n Ca&ntilde;as&rdquo;.</p>', 1, 19, '2022-07-13 23:51:08', '2022-07-14 03:06:57'),
(50, 'Metodología de trabajo', '<p style=\"text-align:justify\">Las metodolog&iacute;as de trabajo es una herramienta muy potente que ayudan a optimizar los recursos y a definir los procedimientos a seguir dentro del grupo de trabajo, mejorando as&iacute; la calidad del producto final, ya que se reducen los riesgos y se establecen las prioridades para su desarrollo, por lo que los resultados obtenidos al final de dicho proyecto son totalmente satisfactorios para el equipo de trabajo y el usuario.&nbsp;(Junquera, 2020)</p>', 2, 19, '2022-07-13 23:51:08', '2022-07-14 03:06:57'),
(51, 'Arquitectura MVC (Modelo-Vista-Controlador)', '<p style=\"text-align:justify\">En el desarrollo de una aplicaci&oacute;n web, es necesario la elecci&oacute;n de una estructura a seguir, la cual debe proporcionar las funcionalidades deseadas y herramientas que se necesiten a la hora de programar los diferentes m&oacute;dulos del sitio web.</p>\r\n\r\n<p style=\"text-align:justify\">&nbsp;</p>\r\n\r\n<p style=\"text-align:justify\">Las estructuras mencionadas anteriormente, se denomina &ldquo;Arquitectura de Software&rdquo; la cual contiene diferentes patrones arquitect&oacute;nicos a seleccionar, como, por ejemplo: Patr&oacute;n de capas, Patr&oacute;n cliente-servidor, Patr&oacute;n de pizarra, Modelo-Vista-Controlador, siendo este &uacute;ltimo el patr&oacute;n elegido para el desarrollo del proyecto.&nbsp;(Huaman, 2018)</p>\r\n\r\n<p style=\"text-align:justify\">&nbsp;</p>\r\n\r\n<p style=\"text-align:justify\">El MVC tiene una separaci&oacute;n en 3 capas, como su nombre lo indica y Laravel, as&iacute; como la mayor&iacute;a de frameworks de PHP implementan este patr&oacute;n de dise&ntilde;o en donde, cada capa maneja un aspecto de la aplicaci&oacute;n. En la Tabla 4.1, se detalla cada una de las capas que posee dicho patr&oacute;n:</p>\r\n\r\n<p style=\"text-align:justify\">&nbsp;</p>\r\n\r\n<p style=\"text-align:justify\"><strong>(ESPACIO PARA TABLA)</strong></p>', 4, 19, '2022-07-13 23:51:08', '2022-07-14 03:06:57'),
(52, 'Introducción del capitulo', '<p>null</p>', 0, 20, '2022-07-13 23:59:32', '2022-07-13 23:59:32'),
(53, 'Diseño de la Interfaz Gráfica', '<p style=\"text-align:justify\">Cuando se realiza un an&aacute;lisis de dise&ntilde;o de un sistema inform&aacute;tico es importante tomar en cuenta la comodidad del usuario. Una interfaz debe ser c&oacute;moda, sencilla e intuitiva para los est&aacute;ndares de hoy en d&iacute;a y, asimismo, evitar cualquier tipo de confusiones al usuario, por lo que la interfaz debe ser capaz de cumplir la funcionalidad requerida con estos est&aacute;ndares.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p style=\"text-align:justify\">El sitio web se cre&oacute; con est&aacute;ndares en donde cada una de sus pantallas procura ser lo m&aacute;s sencilla y f&aacute;cil de utilizar. La librer&iacute;a de Bootstrap fue utilizada para la mayor&iacute;a de partes de la aplicaci&oacute;n, y adem&aacute;s se realizaron algunos dise&ntilde;os propios haciendo uso de CSS y HTML5.&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p style=\"text-align:justify\">Para el dise&ntilde;o del sistema, se opt&oacute; por utilizar una combinaci&oacute;n de azul con blanco como los colores predominantes en todo el sitio y el color naranja para dar tonos de resaltado, asimismo, para color de fondo en los formularios se utiliz&oacute; un celeste claro. Los colores: azul y blanco conforman los colores oficiales de la Universidad Centroamericana Jos&eacute; Sime&oacute;n Ca&ntilde;as.&nbsp;</p>', 1, 20, '2022-07-13 23:59:32', '2022-07-15 11:05:03'),
(54, 'Diseño de la Base de Datos', '<p style=\"text-align:justify\">Para el almacenamiento de los datos del sitio web, se ha propuesto el dise&ntilde;o de una base de datos, la cual se divide en dos partes: el m&oacute;dulo de Administraci&oacute;n y el m&oacute;dulo del Director de Carrera - Estudiante, por lo que es necesario describir c&oacute;mo est&aacute; conformado cada uno de los m&oacute;dulos con sus respectivos campos.</p>', 7, 20, '2022-07-13 23:59:32', '2022-07-15 11:16:54'),
(55, 'Casos de uso', '<p style=\"text-align:justify\">Los casos de uso permiten conocer el comportamiento que tendr&aacute; una caracter&iacute;stica del sistema. En los casos de uso podemos conocer los actores involucrados en cada una de las funcionalidades, as&iacute; como la respuesta que el sistema debe otorgar a la hora que el actor anteriormente mencionado interact&uacute;e con el sistema.</p>\r\n\r\n<p style=\"text-align:justify\">&nbsp;</p>\r\n\r\n<p style=\"text-align:justify\">Al detallar las acciones que debe realizar el actor para obtener una respuesta, tambi&eacute;n se colocan las excepciones o casos extraordinarios donde el sistema arroja alg&uacute;n tipo de alerta o error, dado que se ha realizado alguna acci&oacute;n donde el sistema no est&aacute; programado para realizar el procedimiento, pero posee su respectiva validaci&oacute;n para informar sobre alg&uacute;n tipo error esperado. Estas caracter&iacute;sticas deben llevar su precondici&oacute;n y su postcondici&oacute;n para conocer que otras funcionalidades provoca o acciona dicha caracter&iacute;stica y el resultado esperado al finalizar esta acci&oacute;n.</p>\r\n\r\n<p style=\"text-align:justify\">&nbsp;</p>\r\n\r\n<p style=\"text-align:justify\">Para lograr resolver la problem&aacute;tica acerca de los trabajos de graduaci&oacute;n, se han propuesto los siguientes casos de uso que conforman la soluci&oacute;n ante el problema presentado:</p>', 10, 20, '2022-07-13 23:59:32', '2022-07-15 11:20:03'),
(56, 'Introducción del capitulo', '<p>null</p>', 0, 21, '2022-07-14 00:01:44', '2022-07-14 00:01:44'),
(57, 'Etapa de Desarrollo del sistema', '<p style=\"text-align:justify\">El desarrollo del aplicativo web comprendi&oacute; del periodo de marzo 2022 a julio 2022, en el cual durante este tiempo se ha realizado el an&aacute;lisis, dise&ntilde;o, desarrollo y pruebas del sistema, esto con ayuda de diferentes herramientas que facilitan dichos procesos. Por consiguiente, cada uno de los procesos son explicados a continuaci&oacute;n:</p>\r\n\r\n<p style=\"text-align:justify\">&nbsp;</p>\r\n\r\n<ul>\r\n	<li style=\"text-align:justify\"><u>An&aacute;lisis:</u> en este proceso se realiza un an&aacute;lisis de las distintas problem&aacute;ticas que se pretenden solucionar mediante una herramienta inform&aacute;tica y, por lo tanto, se hace una investigaci&oacute;n acerca de tecnolog&iacute;as a ocupar para poder dar la mejor soluci&oacute;n ante dichas problem&aacute;ticas.</li>\r\n	<li style=\"text-align:justify\"><u>Dise&ntilde;o:</u> en esta fase de dise&ntilde;o se realizan diversos an&aacute;lisis, diagramas y esquemas en los cuales se muestre, de manera detallada, cada uno de los pasos a seguir al momento de pasar a la siguiente fase. El proceso de dise&ntilde;o es el m&aacute;s importante, ya que en ella se puede observar la l&oacute;gica que el sistema tendr&aacute; y de esa manera facilitar&aacute; el desarrollo del sitio web.</li>\r\n	<li style=\"text-align:justify\"><u>Desarrollo:</u> en esta etapa se hace el desarrollo del sitio web, con las herramientas anteriormente investigadas en la etapa de an&aacute;lisis y a su vez se toma como gu&iacute;a los diagramas y esquemas creados en la etapa de dise&ntilde;o, los cuales contienen la l&oacute;gica que tendr&aacute; el aplicativo.</li>\r\n	<li style=\"text-align:justify\"><u>Pruebas del sistema:</u> ya finalizadas las 3 fases anteriores, se realizan las pruebas del sistema, esto con el fin de detectar algunas fallas o funcionalidades que faltaron por implementar. La fase de pruebas es la &uacute;ltima etapa del desarrollo en el que se documenta posibles errores o inconvenientes del sistema, en el caso que el aplicativo se desempe&ntilde;e de manera &oacute;ptima y sin errores, tambi&eacute;n se realiza documentaci&oacute;n acerca de ello.<u> </u></li>\r\n</ul>', 1, 21, '2022-07-14 00:01:44', '2022-07-14 03:05:07'),
(58, 'Etapa de Pruebas del sistema', '<p style=\"text-align:justify\">Al trabajar bajo un marco de trabajo &aacute;gil se obtienen algunas ventajas, las cuales no solo son perceptibles para el cliente, sino que tambi&eacute;n para los desarrolladores. Una de las m&aacute;s notorias son los ciclos de pruebas, si se toma como comparaci&oacute;n un proyecto desarrollado en metodolog&iacute;a en cascada, las pruebas se realizan al finalizar todo el desarrollo, esto trae una serie de complicaciones de cara a la entrega del proyecto, debido a que si se encuentra alg&uacute;n defecto en la etapa de pruebas, su correcci&oacute;n podr&iacute;a inyectar nuevos defectos en todo el sistema o generar un malfuncionamiento por una mala integraci&oacute;n, eso sin mencionar de los retrasos en los periodos de entrega.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p style=\"text-align:justify\">En el caso del trabajo con la metodolog&iacute;a &aacute;gil, los periodos de pruebas se realizan con cada funcionalidad finalizada, de modo que con cada m&oacute;dulo que se termine, se integra en el sistema y se realizan sus respectivas pruebas, siendo de esta manera la forma de verificar posibles errores que se puedan generar, teniendo as&iacute; la posibilidad de solucionar dichos errores. Por lo tanto, en los tiempos de entrega no hay retrasos, generando as&iacute; satisfacci&oacute;n por parte del cliente.&nbsp;</p>', 3, 21, '2022-07-14 00:01:44', '2022-07-14 03:05:07'),
(59, 'Introducción del capitulo', '<p>null</p>', 0, 22, '2022-07-14 00:02:16', '2022-07-14 00:02:16'),
(60, 'Conclusiones', '<ul>\r\n	<li style=\"text-align:justify\">Se concluye que el desarrollo de aplicaciones web brinda herramientas &uacute;tiles que ayudan a agilizar tareas o procesos y, asimismo, permite que dichas herramientas sean utilizadas independientemente del sistema operativo o del dispositivo en el que se quiera acceder, por lo que solo ser&iacute;a indispensable tener una conexi&oacute;n a internet y un navegador.</li>\r\n	<li style=\"text-align:justify\">Se identificaron problemas comunes que los estudiantes que est&aacute;n en el proceso de graduaci&oacute;n comenten al momento crear su respectivo documento, por lo que se logr&oacute; crear una soluci&oacute;n ante dichas problem&aacute;ticas mediante el desarrollo de un sitio web, capaz de crear los documentos de los trabajos de graduaci&oacute;n y cumpliendo con la mayor&iacute;a de lineamientos que el Decanato de Ingenier&iacute;a y Arquitectura de la Universidad Centroamericana Jos&eacute; Sime&oacute;n Ca&ntilde;as ha estipulado.</li>\r\n	<li style=\"text-align:justify\">El sitio web posee un m&oacute;dulo de seguridad, que ofrece privacidad y confidencialidad de los datos m&aacute;s sensibles del aplicativo, por lo que cada rol del sistema no puede acceder a partes del sitio donde no tenga autorizaci&oacute;n y, asimismo, los datos de los trabajos de graduaci&oacute;n de cada grupo son individuales, y no pueden ser accedidos por estudiantes que no pertenezcan a dicho grupo de trabajo.</li>\r\n	<li style=\"text-align:justify\">El control de registro de acciones o bit&aacute;cora es uno de los aspectos m&aacute;s importantes dentro del m&oacute;dulo de los estudiantes, ya que en ella se muestran detalladamente las acciones realizadas por cada miembro del grupo y esto su vez es una manera de monitorear el trabajo o el desempe&ntilde;o de cada integrante, en caso de alg&uacute;n error, p&eacute;rdidas de datos o simplemente la necesidad de consulta de las acciones realizadas.</li>\r\n	<li style=\"text-align:justify\">Se ha desarrollado un sitio web intuitivo y amigable para el usuario, generando as&iacute; una buena experiencia, por lo que facilita la aceptaci&oacute;n de nuevas tecnolog&iacute;as, con el fin de poder incrementar en gran medida la experiencia de usuario, al brindar herramientas y funcionalidades que ayuden en la creaci&oacute;n de los trabajos de graduaci&oacute;n.</li>\r\n</ul>', 1, 22, '2022-07-14 00:02:16', '2022-07-14 03:02:35'),
(61, 'Recomendaciones', '<ul>\r\n	<li style=\"text-align:justify\">Se recomienda adaptar el sitio web para distintos tama&ntilde;os de pantallas, esto con el fin de mejorar la experiencia de usuario y lograr que el aplicativo se despliegue de manera correcta en diferentes dispositivos.</li>\r\n	<li style=\"text-align:justify\">Crear un m&eacute;todo de recuperaci&oacute;n de informaci&oacute;n al estilo de una papelera de reciclaje, la cual ayude en caso de eliminar informaci&oacute;n de manera accidental o simplemente se quiera recuperar informaci&oacute;n que ha sido borrada.</li>\r\n	<li style=\"text-align:justify\">Implementar un m&oacute;dulo de entrega de documentos de trabajo de graduaci&oacute;n y que esto a su vez ayude a agilizar los procesos de revisi&oacute;n de los trabajos entregados, lo cual posteriormente se pueda hacer entrega de las respectivas observaciones o correcciones dentro del sistema.</li>\r\n	<li style=\"text-align:justify\">Se recomienda que en la secci&oacute;n Bit&aacute;cora del m&oacute;dulo del estudiante, se pueda incorporar registros m&aacute;s detallados acerca de las acciones que cada integrante del equipo de trabajo realice sobre el documento, como, por ejemplo: en el caso de eliminar alg&uacute;n elemento del documento, escribir la raz&oacute;n de la eliminaci&oacute;n o mostrar el registro que modific&oacute; junto con su contenido.</li>\r\n	<li style=\"text-align:justify\">Implementaci&oacute;n de la secci&oacute;n de Anexos del documento del trabajo de graduaci&oacute;n en el m&oacute;dulo del estudiante, en la cual el grupo pueda agregar, modificar o eliminar y, asimismo, queden registradas las acciones realizadas sobre este apartado en la Bit&aacute;cora.</li>\r\n	<li style=\"text-align:justify\">A&ntilde;adir un m&oacute;dulo de modificaci&oacute;n de lineamientos de los trabajos de graduaci&oacute;n y tambi&eacute;n seccionar cada lineamiento seg&uacute;n la Carrera o Facultad a la que pertenezca el grupo de graduaci&oacute;n, esto debido a que en la Universidad dependiendo de la Carrera, los par&aacute;metros a cumplir pueden ser diferentes.</li>\r\n	<li style=\"text-align:justify\">Implementar m&aacute;s herramientas al editor de texto que el sitio posee actualmente, que permitan agregar tablas, im&aacute;genes, formas, gr&aacute;ficos, entre otros.</li>\r\n	<li style=\"text-align:justify\">Implementar un sistema de autenticaci&oacute;n que permita ingresar al sistema mediante los Servicios de Google utilizando las cuentas institucionales, creando as&iacute; una manera f&aacute;cil y sencilla de acceder a la plataforma.</li>\r\n	<li style=\"text-align:justify\">Se recomienda la implementaci&oacute;n de la funcionalidad de cambio de estado de los usuarios con el rol de estudiantes egresados, los cuales ya pasaron por el proceso de graduaci&oacute;n actual, por lo que se restringir&iacute;a el acceso luego de dar por finalizado su trabajo de graduaci&oacute;n. Asimismo, implementar en el sistema, la creaci&oacute;n de un m&oacute;dulo en donde cada documento de graduaci&oacute;n sea respaldado en su &uacute;ltima versi&oacute;n modificada, esto con el fin de poder dar una limpieza a la base de datos, antes de dar inicio con cada proceso de graduaci&oacute;n.</li>\r\n	<li style=\"text-align:justify\">Se recomienda la implementaci&oacute;n de un versionamiento de secciones, en la cual cada estudiante pueda visualizar los cambios que se han hecho en las distintas secciones del documento y, asimismo, tenga la capacidad de poder restaurar versiones anteriores de cambios realizados sobre el documento.</li>\r\n	<li style=\"text-align:justify\">Implementaci&oacute;n de la secci&oacute;n de los &Iacute;ndices de figuras y tablas, en la cual se muestre el t&iacute;tulo de la figura con su respectiva referencia a la p&aacute;gina donde se encuentra.</li>\r\n	<li style=\"text-align:justify\">Crear un m&oacute;dulo de Administraci&oacute;n personalizado para la Universidad, el cual funcione sin la necesidad del panel administrativo de Voyager, generando as&iacute; un m&oacute;dulo que se adapte a las necesidades o configuraciones que se requieran.</li>\r\n	<li style=\"text-align:justify\">Agregar en el m&oacute;dulo del Director de Carrera, la capacidad de poder realizar configuraciones personalizadas, tanto para el documento de graduaci&oacute;n como en la formaci&oacute;n de equipos de trabajo. Algunos ejemplos de configuraciones pueden ser:\r\n	<ul>\r\n		<li style=\"text-align:justify\">Configurar el n&uacute;mero m&aacute;ximo de integrantes por equipo.</li>\r\n		<li style=\"text-align:justify\">Modificar las fechas de entrega del documento de graduaci&oacute;n (tiempo normal y fechas de pr&oacute;rroga).</li>\r\n	</ul>\r\n	</li>\r\n	<li style=\"text-align:justify\">Se recomienda la creaci&oacute;n de un filtro en donde los grupos de trabajo de graduaci&oacute;n puedan ser buscados por a&ntilde;o y ciclo en que se formaron, esto con el fin de tener disponibilidad de los registros de cada proceso que se ha realizado y finalizado.</li>\r\n	<li style=\"text-align:justify\">Implementaci&oacute;n del &aacute;rea de referencia dentro del sistema, ya que es necesario definir un estilo o cita bibliogr&aacute;fica como est&aacute;ndar para documento del trabajo de graduaci&oacute;n como, por ejemplo, APA en su &uacute;ltima edici&oacute;n.</li>\r\n	<li style=\"text-align:justify\">Adaptaci&oacute;n del m&oacute;dulo del estudiante para la carrera de Arquitectura, ya que los lineamientos para dicha carrera son distintos a las de Ingenier&iacute;a, por lo que es necesario modificar los par&aacute;metros que el sistema posee.</li>\r\n</ul>', 2, 22, '2022-07-14 00:02:16', '2022-07-14 03:02:35');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `data_rows`
--

CREATE TABLE `data_rows` (
  `id` int(10) UNSIGNED NOT NULL,
  `data_type_id` int(10) UNSIGNED NOT NULL,
  `field` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `required` tinyint(1) NOT NULL DEFAULT 0,
  `browse` tinyint(1) NOT NULL DEFAULT 1,
  `read` tinyint(1) NOT NULL DEFAULT 1,
  `edit` tinyint(1) NOT NULL DEFAULT 1,
  `add` tinyint(1) NOT NULL DEFAULT 1,
  `delete` tinyint(1) NOT NULL DEFAULT 1,
  `details` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `data_rows`
--

INSERT INTO `data_rows` (`id`, `data_type_id`, `field`, `type`, `display_name`, `required`, `browse`, `read`, `edit`, `add`, `delete`, `details`, `order`) VALUES
(1, 1, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, NULL, 1),
(2, 1, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, NULL, 2),
(3, 1, 'email', 'text', 'Email', 1, 1, 1, 1, 1, 1, NULL, 3),
(4, 1, 'password', 'password', 'Password', 1, 0, 0, 1, 1, 0, NULL, 4),
(5, 1, 'remember_token', 'text', 'Remember Token', 0, 0, 0, 0, 0, 0, NULL, 5),
(6, 1, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 0, 0, 0, NULL, 6),
(7, 1, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, NULL, 7),
(8, 1, 'avatar', 'image', 'Avatar', 0, 1, 1, 1, 1, 1, NULL, 8),
(9, 1, 'user_belongsto_role_relationship', 'relationship', 'Role', 0, 1, 1, 1, 1, 0, '{\"model\":\"TCG\\\\Voyager\\\\Models\\\\Role\",\"table\":\"roles\",\"type\":\"belongsTo\",\"column\":\"role_id\",\"key\":\"id\",\"label\":\"display_name\",\"pivot_table\":\"roles\",\"pivot\":0}', 10),
(10, 1, 'user_belongstomany_role_relationship', 'relationship', 'voyager::seeders.data_rows.roles', 0, 1, 1, 1, 1, 0, '{\"model\":\"TCG\\\\Voyager\\\\Models\\\\Role\",\"table\":\"roles\",\"type\":\"belongsToMany\",\"column\":\"id\",\"key\":\"id\",\"label\":\"display_name\",\"pivot_table\":\"user_roles\",\"pivot\":\"1\",\"taggable\":\"0\"}', 11),
(11, 1, 'settings', 'hidden', 'Settings', 0, 0, 0, 0, 0, 0, NULL, 12),
(12, 2, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, NULL, 1),
(13, 2, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, NULL, 2),
(14, 2, 'created_at', 'timestamp', 'Created At', 0, 0, 0, 0, 0, 0, NULL, 3),
(15, 2, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, NULL, 4),
(16, 3, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, NULL, 1),
(17, 3, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, NULL, 2),
(18, 3, 'created_at', 'timestamp', 'Created At', 0, 0, 0, 0, 0, 0, NULL, 3),
(19, 3, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, NULL, 4),
(20, 3, 'display_name', 'text', 'Display Name', 1, 1, 1, 1, 1, 1, NULL, 5),
(21, 1, 'role_id', 'text', 'Role', 1, 1, 1, 1, 1, 1, NULL, 9),
(22, 5, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(23, 5, 'nombre_capitulo', 'text', 'Nombre Capitulo', 0, 1, 1, 1, 1, 1, '{}', 3),
(24, 5, 'orden_capitulo', 'text', 'Orden Capitulo', 0, 1, 1, 1, 1, 1, '{}', 4),
(25, 5, 'grupo_trabajo_id', 'text', 'Grupo Trabajo Id', 0, 1, 1, 1, 1, 1, '{}', 2),
(26, 5, 'created_at', 'timestamp', 'Created At', 1, 1, 1, 1, 0, 1, '{}', 5),
(27, 5, 'updated_at', 'timestamp', 'Updated At', 1, 0, 0, 0, 0, 0, '{}', 6),
(28, 6, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(29, 6, 'tema', 'text', 'Tema', 0, 1, 1, 1, 1, 1, '{}', 3),
(30, 6, 'contenido', 'text', 'Contenido', 0, 1, 1, 1, 1, 1, '{}', 4),
(31, 6, 'orden_contenido', 'text', 'Orden Contenido', 0, 1, 1, 1, 1, 1, '{}', 5),
(32, 6, 'seccion_capitulos_id', 'text', 'Seccion Capitulos Id', 0, 1, 1, 1, 1, 1, '{}', 2),
(33, 6, 'created_at', 'timestamp', 'Created At', 1, 1, 1, 1, 0, 1, '{}', 6),
(34, 6, 'updated_at', 'timestamp', 'Updated At', 1, 0, 0, 0, 0, 0, '{}', 7),
(35, 7, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(36, 7, 'subtema', 'text', 'Subtema', 0, 1, 1, 1, 1, 1, '{}', 3),
(37, 7, 'contenido', 'text', 'Contenido', 0, 1, 1, 1, 1, 1, '{}', 4),
(38, 7, 'orden_subcontenido', 'text', 'Orden Subcontenido', 0, 1, 1, 1, 1, 1, '{}', 5),
(39, 7, 'contenido_seccion_capitulo_id', 'text', 'Contenido Seccion Capitulo Id', 0, 1, 1, 1, 1, 1, '{}', 2),
(40, 7, 'created_at', 'timestamp', 'Created At', 1, 1, 1, 1, 0, 1, '{}', 6),
(41, 7, 'updated_at', 'timestamp', 'Updated At', 1, 0, 0, 0, 0, 0, '{}', 7),
(42, 9, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(43, 9, 'descripcion', 'text', 'Descripcion', 0, 1, 1, 1, 1, 1, '{}', 5),
(44, 9, 'fecha_modificacion', 'text', 'Fecha Modificacion', 0, 1, 1, 1, 1, 1, '{}', 6),
(45, 9, 'estudiante_id', 'text', 'Estudiante Id', 0, 1, 1, 1, 1, 1, '{}', 2),
(46, 9, 'bitacora_seccion_id', 'text', 'Bitacora Seccion Id', 0, 1, 1, 1, 1, 1, '{}', 3),
(47, 9, 'bitacora_modificacion_id', 'text', 'Bitacora Modificacion Id', 0, 1, 1, 1, 1, 1, '{}', 4),
(48, 9, 'created_at', 'timestamp', 'Created At', 1, 1, 1, 1, 0, 1, '{}', 7),
(49, 9, 'updated_at', 'timestamp', 'Updated At', 1, 0, 0, 0, 0, 0, '{}', 8),
(50, 10, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(51, 10, 'nombre_modificacion', 'text', 'Nombre Modificacion', 0, 1, 1, 1, 1, 1, '{}', 2),
(52, 10, 'created_at', 'timestamp', 'Created At', 1, 1, 1, 1, 0, 1, '{}', 3),
(53, 10, 'updated_at', 'timestamp', 'Updated At', 1, 0, 0, 0, 0, 0, '{}', 4),
(54, 11, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(55, 11, 'nombre_seccion', 'text', 'Nombre Seccion', 0, 1, 1, 1, 1, 1, '{}', 2),
(56, 11, 'created_at', 'timestamp', 'Created At', 1, 1, 1, 1, 0, 1, '{}', 3),
(57, 11, 'updated_at', 'timestamp', 'Updated At', 1, 0, 0, 0, 0, 0, '{}', 4),
(58, 12, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(59, 12, 'nombre_cargo', 'text', 'Nombre del cargo', 1, 1, 1, 1, 1, 1, '{}', 2),
(60, 12, 'created_at', 'timestamp', 'Created At', 1, 0, 0, 0, 0, 0, '{}', 3),
(61, 12, 'updated_at', 'timestamp', 'Updated At', 1, 0, 0, 0, 0, 0, '{}', 4),
(62, 13, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(63, 13, 'nombre_carrera', 'text', 'Nombre de la carrera', 1, 1, 1, 1, 1, 1, '{}', 3),
(64, 13, 'grado', 'text', 'Grado', 1, 1, 1, 1, 1, 1, '{}', 4),
(65, 13, 'facultad_id', 'text', 'Facultad Id', 1, 1, 1, 1, 1, 1, '{}', 2),
(66, 13, 'created_at', 'timestamp', 'Created At', 1, 0, 0, 0, 0, 0, '{}', 5),
(67, 13, 'updated_at', 'timestamp', 'Updated At', 1, 0, 0, 0, 0, 0, '{}', 6),
(76, 15, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(77, 15, 'nombre_departamento', 'text', 'Nombre Departamento', 0, 1, 1, 1, 1, 1, '{}', 3),
(78, 15, 'facultad_id', 'text', 'Facultad Id', 0, 1, 1, 1, 1, 1, '{}', 2),
(79, 15, 'created_at', 'timestamp', 'Created At', 1, 1, 1, 1, 0, 1, '{}', 4),
(80, 15, 'updated_at', 'timestamp', 'Updated At', 1, 0, 0, 0, 0, 0, '{}', 5),
(81, 16, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(82, 16, 'usuario_id', 'text', 'Usuario Id', 1, 1, 1, 1, 1, 1, '{}', 2),
(83, 16, 'carrera_id', 'text', 'Carrera Id', 1, 1, 1, 1, 1, 1, '{}', 3),
(84, 16, 'empleado_id', 'text', 'Empleado Id', 1, 1, 1, 1, 1, 1, '{}', 4),
(85, 16, 'created_at', 'timestamp', 'Created At', 1, 0, 0, 0, 0, 0, '{}', 5),
(86, 16, 'updated_at', 'timestamp', 'Updated At', 1, 0, 0, 0, 0, 0, '{}', 6),
(87, 17, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(88, 17, 'codigo_empleado', 'text', 'Codigo Empleado', 1, 1, 1, 1, 1, 1, '{}', 5),
(89, 17, 'nombre', 'text', 'Nombre', 1, 1, 1, 1, 1, 1, '{}', 6),
(90, 17, 'apellido', 'text', 'Apellido', 1, 1, 1, 1, 1, 1, '{}', 7),
(91, 17, 'tipo_empleado_id', 'text', 'Tipo Empleado Id', 1, 1, 1, 1, 1, 1, '{}', 2),
(92, 17, 'cargo_id', 'text', 'Cargo Id', 1, 1, 1, 1, 1, 1, '{}', 3),
(94, 17, 'created_at', 'timestamp', 'Created At', 1, 0, 0, 0, 0, 0, '{}', 8),
(95, 17, 'updated_at', 'timestamp', 'Updated At', 1, 0, 0, 0, 0, 0, '{}', 9),
(96, 18, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(97, 18, 'nombre', 'text', 'Nombre', 1, 1, 1, 1, 1, 1, '{}', 5),
(98, 18, 'apellido', 'text', 'Apellido', 1, 1, 1, 1, 1, 1, '{}', 6),
(99, 18, 'carnet', 'text', 'Carnet', 1, 1, 1, 1, 1, 1, '{}', 7),
(100, 18, 'carrera_id', 'text', 'Carrera Id', 1, 1, 1, 1, 1, 1, '{}', 2),
(101, 18, 'usuario_id', 'text', 'Usuario Id', 1, 1, 1, 1, 1, 1, '{}', 3),
(102, 18, 'grupo_trabajo_id', 'text', 'Grupo Trabajo Id', 0, 1, 1, 0, 0, 0, '{}', 4),
(103, 18, 'created_at', 'timestamp', 'Created At', 1, 0, 0, 0, 0, 0, '{}', 8),
(104, 18, 'updated_at', 'timestamp', 'Updated At', 1, 0, 0, 0, 0, 0, '{}', 9),
(105, 19, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(106, 19, 'nombre', 'text', 'Nombre', 1, 1, 1, 1, 1, 1, '{}', 3),
(107, 19, 'apellido', 'text', 'Apellido', 1, 1, 1, 1, 1, 1, '{}', 4),
(108, 19, 'correo', 'text', 'Correo', 1, 1, 1, 1, 1, 1, '{}', 5),
(109, 19, 'descripcion', 'text', 'Descripcion', 1, 1, 1, 1, 1, 1, '{}', 6),
(110, 19, 'rol_externo', 'text', 'Rol Externo', 1, 1, 1, 1, 1, 1, '{}', 7),
(112, 19, 'created_at', 'timestamp', 'Created At', 1, 1, 1, 1, 0, 1, '{}', 8),
(113, 19, 'updated_at', 'timestamp', 'Updated At', 1, 0, 0, 0, 0, 0, '{}', 9),
(114, 20, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(115, 20, 'nombre_facultad', 'text', 'Nombre Facultad', 0, 1, 1, 1, 1, 1, '{}', 2),
(116, 20, 'created_at', 'timestamp', 'Created At', 1, 1, 1, 1, 0, 1, '{}', 3),
(117, 20, 'updated_at', 'timestamp', 'Updated At', 1, 0, 0, 0, 0, 0, '{}', 4),
(118, 21, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(119, 21, 'anio_inicio', 'text', 'Anio Inicio', 0, 1, 1, 1, 1, 1, '{}', 6),
(120, 21, 'ciclo_inicio', 'text', 'Ciclo Inicio', 0, 1, 1, 1, 1, 1, '{}', 7),
(121, 21, 'tema', 'text', 'Tema', 0, 1, 1, 1, 1, 1, '{}', 8),
(122, 21, 'prorroga', 'text', 'Prorroga', 0, 1, 1, 1, 1, 1, '{}', 9),
(123, 21, 'asesor_interno_id', 'text', 'Asesor Interno Id', 0, 1, 1, 1, 1, 1, '{}', 2),
(124, 21, 'lector_interno_id', 'text', 'Lector Interno Id', 0, 1, 1, 1, 1, 1, '{}', 3),
(125, 21, 'asesor_externo_id', 'text', 'Asesor Externo Id', 0, 1, 1, 1, 1, 1, '{}', 4),
(126, 21, 'lector_externo_id', 'text', 'Lector Externo Id', 0, 1, 1, 1, 1, 1, '{}', 5),
(127, 21, 'created_at', 'timestamp', 'Created At', 1, 1, 1, 1, 0, 1, '{}', 10),
(128, 21, 'updated_at', 'timestamp', 'Updated At', 1, 0, 0, 0, 0, 0, '{}', 11),
(129, 22, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(130, 22, 'contenido', 'text', 'Contenido', 0, 1, 1, 1, 1, 1, '{}', 4),
(131, 22, 'tipo_abreviatura_id', 'text', 'Tipo Abreviatura Id', 0, 1, 1, 1, 1, 1, '{}', 2),
(132, 22, 'grupo_trabajo_id', 'text', 'Grupo Trabajo Id', 0, 1, 1, 1, 1, 1, '{}', 3),
(133, 22, 'created_at', 'timestamp', 'Created At', 1, 1, 1, 1, 0, 1, '{}', 5),
(134, 22, 'updated_at', 'timestamp', 'Updated At', 1, 0, 0, 0, 0, 0, '{}', 6),
(135, 23, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(136, 23, 'opcional', 'text', 'Opcional', 0, 1, 1, 1, 1, 1, '{}', 3),
(137, 23, 'autor', 'text', 'Autor', 0, 1, 1, 1, 1, 1, '{}', 4),
(138, 23, 'contenido', 'text', 'Contenido', 0, 1, 1, 1, 1, 1, '{}', 5),
(139, 23, 'estudiante_id', 'text', 'Estudiante Id', 0, 1, 1, 1, 1, 1, '{}', 2),
(140, 23, 'created_at', 'timestamp', 'Created At', 1, 1, 1, 1, 0, 1, '{}', 6),
(141, 23, 'updated_at', 'timestamp', 'Updated At', 1, 0, 0, 0, 0, 0, '{}', 7),
(142, 24, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(143, 24, 'opcional', 'text', 'Opcional', 0, 1, 1, 1, 1, 1, '{}', 3),
(144, 24, 'autor', 'text', 'Autor', 0, 1, 1, 1, 1, 1, '{}', 4),
(145, 24, 'contenido', 'text', 'Contenido', 0, 1, 1, 1, 1, 1, '{}', 5),
(146, 24, 'estudiante_id', 'text', 'Estudiante Id', 0, 1, 1, 1, 1, 1, '{}', 2),
(147, 24, 'created_at', 'timestamp', 'Created At', 1, 1, 1, 1, 0, 1, '{}', 6),
(148, 24, 'updated_at', 'timestamp', 'Updated At', 1, 0, 0, 0, 0, 0, '{}', 7),
(149, 25, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(150, 25, 'opcional', 'text', 'Opcional', 0, 1, 1, 1, 1, 1, '{}', 3),
(151, 25, 'contenido', 'text', 'Contenido', 0, 1, 1, 1, 1, 1, '{}', 4),
(152, 25, 'grupo_trabajo_id', 'text', 'Grupo Trabajo Id', 0, 1, 1, 1, 1, 1, '{}', 2),
(153, 25, 'created_at', 'timestamp', 'Created At', 1, 1, 1, 1, 0, 1, '{}', 5),
(154, 25, 'updated_at', 'timestamp', 'Updated At', 1, 0, 0, 0, 0, 0, '{}', 6),
(155, 26, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(156, 26, 'contenido', 'text', 'Contenido', 0, 1, 1, 1, 1, 1, '{}', 3),
(157, 26, 'grupo_trabajo_id', 'text', 'Grupo Trabajo Id', 0, 1, 1, 1, 1, 1, '{}', 2),
(158, 26, 'created_at', 'timestamp', 'Created At', 1, 1, 1, 1, 0, 1, '{}', 4),
(159, 26, 'updated_at', 'timestamp', 'Updated At', 1, 0, 0, 0, 0, 0, '{}', 5),
(160, 27, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(161, 27, 'contenido', 'text', 'Contenido', 0, 1, 1, 1, 1, 1, '{}', 3),
(162, 27, 'grupo_trabajo_id', 'text', 'Grupo Trabajo Id', 0, 1, 1, 1, 1, 1, '{}', 2),
(163, 27, 'created_at', 'timestamp', 'Created At', 1, 1, 1, 1, 0, 1, '{}', 4),
(164, 27, 'updated_at', 'timestamp', 'Updated At', 1, 0, 0, 0, 0, 0, '{}', 5),
(165, 28, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(166, 28, 'nombre_tipo_abreviatura', 'text', 'Nombre Tipo Abreviatura', 0, 1, 1, 1, 1, 1, '{}', 2),
(167, 28, 'created_at', 'timestamp', 'Created At', 1, 1, 1, 1, 0, 1, '{}', 3),
(168, 28, 'updated_at', 'timestamp', 'Updated At', 1, 0, 0, 0, 0, 0, '{}', 4),
(169, 29, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(170, 29, 'nombre_tipo_empleado', 'text', 'Nombre Tipo Empleado', 0, 1, 1, 1, 1, 1, '{}', 2),
(171, 29, 'created_at', 'timestamp', 'Created At', 1, 1, 1, 1, 0, 1, '{}', 3),
(172, 29, 'updated_at', 'timestamp', 'Updated At', 1, 0, 0, 0, 0, 0, '{}', 4),
(173, 30, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(174, 30, 'nombre', 'text', 'Nombre', 0, 1, 1, 1, 1, 1, '{}', 2),
(175, 30, 'created_at', 'timestamp', 'Created At', 1, 1, 1, 1, 0, 1, '{}', 3),
(176, 30, 'updated_at', 'timestamp', 'Updated At', 1, 0, 0, 0, 0, 0, '{}', 4),
(177, 31, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(178, 31, 'foto', 'text', 'Foto', 1, 0, 0, 0, 0, 0, '{}', 3),
(181, 31, 'tipo_usuario_id', 'text', 'Tipo Usuario Id', 1, 1, 1, 1, 1, 1, '{}', 2),
(182, 31, 'created_at', 'timestamp', 'Created At', 1, 0, 0, 0, 0, 0, '{}', 6),
(183, 31, 'updated_at', 'timestamp', 'Updated At', 1, 0, 0, 0, 0, 0, '{}', 7),
(184, 32, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(185, 32, 'fecha_entrega', 'text', 'Fecha de entrega', 1, 1, 1, 1, 0, 0, '{}', 2),
(186, 32, 'fecha_prorroga', 'text', 'Fecha de entrega - Prorroga', 1, 1, 1, 1, 0, 0, '{}', 3),
(187, 32, 'numero_integrantes', 'text', 'Número de integrantes', 1, 1, 1, 1, 0, 0, '{}', 4),
(188, 32, 'created_at', 'timestamp', 'Created At', 1, 0, 0, 0, 0, 0, '{}', 5),
(189, 32, 'updated_at', 'timestamp', 'Updated At', 1, 0, 0, 0, 0, 0, '{}', 6),
(190, 33, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(191, 33, 'nombre_departamento', 'text', 'Nombre del Departamento/Unidad', 1, 1, 1, 1, 1, 1, '{}', 3),
(192, 33, 'facultad_id', 'text', 'Facultad Id', 0, 1, 1, 1, 1, 1, '{}', 2),
(193, 33, 'created_at', 'timestamp', 'Created At', 1, 0, 0, 0, 0, 0, '{}', 4),
(194, 33, 'updated_at', 'timestamp', 'Updated At', 1, 0, 0, 0, 0, 0, '{}', 5),
(195, 19, 'departamento_unidad_id', 'text', 'Departamento Unidad Id', 1, 1, 1, 1, 1, 1, '{}', 2),
(196, 17, 'departamento_unidad_id', 'text', 'Departamento Unidad Id', 1, 1, 1, 1, 1, 1, '{}', 4),
(197, 31, 'email', 'text', 'Correo institucional', 1, 1, 1, 1, 1, 1, '{}', 4),
(198, 31, 'password', 'password', 'Contraseña', 1, 0, 0, 1, 1, 0, '{}', 5),
(199, 16, 'director_carrera_belongsto_usuario_relationship', 'relationship', 'Usuario', 0, 1, 1, 1, 1, 1, '{\"scope\":\"director\",\"model\":\"App\\\\Models\\\\Usuario\",\"table\":\"usuario\",\"type\":\"belongsTo\",\"column\":\"usuario_id\",\"key\":\"id\",\"label\":\"email\",\"pivot_table\":\"bitacora\",\"pivot\":\"0\",\"taggable\":\"0\"}', 7),
(200, 31, 'usuario_belongsto_tipo_usuario_relationship', 'relationship', 'Tipo de usuario', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\Models\\\\TipoUsuario\",\"table\":\"tipo_usuario\",\"type\":\"belongsTo\",\"column\":\"tipo_usuario_id\",\"key\":\"id\",\"label\":\"nombre\",\"pivot_table\":\"bitacora\",\"pivot\":\"0\",\"taggable\":\"0\"}', 8),
(201, 18, 'estudiante_belongsto_carrera_relationship', 'relationship', 'Carrera', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\Models\\\\Carrera\",\"table\":\"carrera\",\"type\":\"belongsTo\",\"column\":\"carrera_id\",\"key\":\"id\",\"label\":\"nombre_carrera\",\"pivot_table\":\"bitacora\",\"pivot\":\"0\",\"taggable\":\"0\"}', 10),
(202, 18, 'estudiante_belongsto_usuario_relationship', 'relationship', 'Usuario', 0, 1, 1, 1, 1, 1, '{\"scope\":\"estudiante\",\"model\":\"App\\\\Models\\\\Usuario\",\"table\":\"usuario\",\"type\":\"belongsTo\",\"column\":\"usuario_id\",\"key\":\"id\",\"label\":\"email\",\"pivot_table\":\"bitacora\",\"pivot\":\"0\",\"taggable\":\"0\"}', 11),
(203, 18, 'estudiante_belongsto_grupo_trabajo_relationship', 'relationship', 'grupo_trabajo', 0, 1, 1, 0, 0, 0, '{\"model\":\"App\\\\Models\\\\GrupoTrabajo\",\"table\":\"grupo_trabajo\",\"type\":\"belongsTo\",\"column\":\"grupo_trabajo_id\",\"key\":\"id\",\"label\":\"tema\",\"pivot_table\":\"bitacora\",\"pivot\":\"0\",\"taggable\":\"0\"}', 12),
(204, 17, 'empleado_belongsto_tipo_empleado_relationship', 'relationship', 'Tipo de empleado', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\Models\\\\TipoEmpleado\",\"table\":\"tipo_empleado\",\"type\":\"belongsTo\",\"column\":\"tipo_empleado_id\",\"key\":\"id\",\"label\":\"nombre_tipo_empleado\",\"pivot_table\":\"bitacora\",\"pivot\":\"0\",\"taggable\":\"0\"}', 10),
(205, 17, 'empleado_belongsto_cargo_relationship', 'relationship', 'Cargo del empleado', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\Models\\\\Cargo\",\"table\":\"cargo\",\"type\":\"belongsTo\",\"column\":\"cargo_id\",\"key\":\"id\",\"label\":\"nombre_cargo\",\"pivot_table\":\"bitacora\",\"pivot\":\"0\",\"taggable\":\"0\"}', 11),
(206, 17, 'empleado_belongsto_departamento_unidad_relationship', 'relationship', 'Departamento/Unidad', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\Models\\\\DepartamentoU\",\"table\":\"departamento_unidad\",\"type\":\"belongsTo\",\"column\":\"departamento_unidad_id\",\"key\":\"id\",\"label\":\"nombre_departamento\",\"pivot_table\":\"bitacora\",\"pivot\":\"0\",\"taggable\":\"0\"}', 12),
(207, 16, 'director_carrera_belongsto_carrera_relationship', 'relationship', 'Carrera', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\Models\\\\Carrera\",\"table\":\"carrera\",\"type\":\"belongsTo\",\"column\":\"carrera_id\",\"key\":\"id\",\"label\":\"nombre_carrera\",\"pivot_table\":\"bitacora\",\"pivot\":\"0\",\"taggable\":\"0\"}', 8),
(208, 16, 'director_carrera_belongsto_empleado_relationship', 'relationship', 'Empleado', 0, 1, 1, 1, 1, 1, '{\"scope\":\"empleado\",\"model\":\"App\\\\Models\\\\Empleado\",\"table\":\"empleado\",\"type\":\"belongsTo\",\"column\":\"empleado_id\",\"key\":\"id\",\"label\":\"nombre\",\"pivot_table\":\"bitacora\",\"pivot\":\"0\",\"taggable\":\"0\"}', 9),
(209, 13, 'carrera_belongsto_facultad_relationship', 'relationship', 'Nombre de la facultad', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\Models\\\\Facultad\",\"table\":\"facultad\",\"type\":\"belongsTo\",\"column\":\"facultad_id\",\"key\":\"id\",\"label\":\"nombre_facultad\",\"pivot_table\":\"bitacora\",\"pivot\":\"0\",\"taggable\":\"0\"}', 7),
(210, 33, 'departamento_unidad_belongsto_facultad_relationship', 'relationship', 'Facultad', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\Models\\\\Facultad\",\"table\":\"facultad\",\"type\":\"belongsTo\",\"column\":\"facultad_id\",\"key\":\"id\",\"label\":\"nombre_facultad\",\"pivot_table\":\"bitacora\",\"pivot\":\"0\",\"taggable\":\"0\"}', 6);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `data_types`
--

CREATE TABLE `data_types` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name_singular` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name_plural` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `icon` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `model_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `policy_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `controller` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `generate_permissions` tinyint(1) NOT NULL DEFAULT 0,
  `server_side` tinyint(4) NOT NULL DEFAULT 0,
  `details` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `data_types`
--

INSERT INTO `data_types` (`id`, `name`, `slug`, `display_name_singular`, `display_name_plural`, `icon`, `model_name`, `policy_name`, `controller`, `description`, `generate_permissions`, `server_side`, `details`, `created_at`, `updated_at`) VALUES
(1, 'users', 'users', 'User', 'Users', 'voyager-person', 'TCG\\Voyager\\Models\\User', 'TCG\\Voyager\\Policies\\UserPolicy', 'TCG\\Voyager\\Http\\Controllers\\VoyagerUserController', '', 1, 0, NULL, '2022-04-15 04:23:00', '2022-04-15 04:23:00'),
(2, 'menus', 'menus', 'Menu', 'Menus', 'voyager-list', 'TCG\\Voyager\\Models\\Menu', NULL, '', '', 1, 0, NULL, '2022-04-15 04:23:00', '2022-04-15 04:23:00'),
(3, 'roles', 'roles', 'Role', 'Roles', 'voyager-lock', 'TCG\\Voyager\\Models\\Role', NULL, 'TCG\\Voyager\\Http\\Controllers\\VoyagerRoleController', '', 1, 0, NULL, '2022-04-15 04:23:00', '2022-04-15 04:23:00'),
(5, 'seccion_capitulo', 'seccion-capitulo', 'Seccion Capitulo', 'Seccion Capitulos', NULL, 'App\\Models\\SeccionCapitulo', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null}', '2022-05-14 06:33:07', '2022-05-14 06:33:07'),
(6, 'contenido_seccion_capitulo', 'contenido-seccion-capitulo', 'Contenido Seccion Capitulo', 'Contenido Seccion Capitulos', NULL, 'App\\Models\\ContenidoSeccionCapitulo', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null}', '2022-05-14 06:37:37', '2022-05-14 06:37:37'),
(7, 'subcontenido_seccion_capitulo', 'subcontenido-seccion-capitulo', 'Subcontenido Seccion Capitulo', 'Subcontenido Seccion Capitulos', NULL, 'App\\Models\\SubcontenidoSeccionCapitulo', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null}', '2022-05-14 06:40:26', '2022-05-14 06:40:26'),
(9, 'bitacora', 'bitacora', 'Bitacora', 'Bitacoras', NULL, 'App\\Models\\Bitacora', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null}', '2022-05-14 11:17:05', '2022-05-14 11:17:05'),
(10, 'bitacora_modificacion', 'bitacora-modificacion', 'Bitacora Modificacion', 'Bitacora Modificacions', NULL, 'App\\Models\\BitacoraModificacion', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null}', '2022-05-14 11:20:10', '2022-05-14 11:20:10'),
(11, 'bitacora_seccion', 'bitacora-seccion', 'Bitacora Seccion', 'Bitacora Seccions', NULL, 'App\\Models\\BitacoraSeccion', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null}', '2022-05-14 11:22:06', '2022-05-14 11:22:06'),
(12, 'cargo', 'cargo', 'Cargo', 'Cargos', NULL, 'App\\Models\\Cargo', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}', '2022-05-14 11:24:58', '2022-07-06 22:22:52'),
(13, 'carrera', 'carrera', 'Carrera', 'Carreras', NULL, 'App\\Models\\Carrera', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}', '2022-05-14 11:26:47', '2022-07-06 22:27:23'),
(15, 'departamento_u', 'departamento-u', 'Departamento U', 'Departamento Us 2', NULL, 'App\\Models\\DepartamentoU', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}', '2022-05-14 11:31:07', '2022-05-15 05:40:14'),
(16, 'director_carrera', 'director-carrera', 'Director Carrera', 'Directores de Carreras', NULL, 'App\\Models\\DirectorCarrera', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}', '2022-05-14 11:33:02', '2022-07-08 00:30:46'),
(17, 'empleado', 'empleado', 'Empleado', 'Empleados', NULL, 'App\\Models\\Empleado', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}', '2022-05-14 11:36:44', '2022-07-06 22:15:33'),
(18, 'estudiante', 'estudiante', 'Estudiante', 'Estudiantes', NULL, 'App\\Models\\Estudiante', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}', '2022-05-14 11:40:48', '2022-07-08 00:27:39'),
(19, 'externo', 'externo', 'Externo', 'Externos', NULL, 'App\\Models\\Externo', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}', '2022-05-14 11:44:48', '2022-05-21 02:10:57'),
(20, 'facultad', 'facultad', 'Facultad', 'Facultads', NULL, 'App\\Models\\Facultad', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null}', '2022-05-14 11:48:43', '2022-05-14 11:48:43'),
(21, 'grupo_trabajo', 'grupo-trabajo', 'Grupo Trabajo', 'Grupo Trabajos', NULL, 'App\\Models\\GrupoTrabajo', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null}', '2022-05-14 12:39:12', '2022-05-14 12:39:12'),
(22, 'seccion_abreviatura_nomenclatura_sigla', 'seccion-abreviatura-nomenclatura-sigla', 'Seccion Abreviatura Nomenclatura Sigla', 'Seccion Abreviatura Nomenclatura Siglas', NULL, 'App\\Models\\SeccionAbreviaturaNomenclaturaSigla', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null}', '2022-05-14 12:43:10', '2022-05-14 12:43:10'),
(23, 'seccion_agradecimiento', 'seccion-agradecimiento', 'Seccion Agradecimiento', 'Seccion Agradecimientos', NULL, 'App\\Models\\SeccionAgradecimiento', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null}', '2022-05-14 12:44:26', '2022-05-14 12:44:26'),
(24, 'seccion_dedicatoria', 'seccion-dedicatoria', 'Seccion Dedicatorium', 'Seccion Dedicatoria', NULL, 'App\\Models\\SeccionDedicatoria', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}', '2022-05-14 12:47:04', '2022-05-14 12:47:29'),
(25, 'seccion_glosario', 'seccion-glosario', 'Seccion Glosario', 'Seccion Glosarios', NULL, 'App\\Models\\SeccionGlosario', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null}', '2022-05-14 12:50:01', '2022-05-14 12:50:01'),
(26, 'seccion_referencia', 'seccion-referencia', 'Seccion Referencium', 'Seccion Referencia', NULL, 'App\\Models\\SeccionReferencia', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null}', '2022-05-14 12:52:29', '2022-05-14 12:52:29'),
(27, 'seccion_resumen', 'seccion-resumen', 'Seccion Resuman', 'Seccion Resumen', NULL, 'App\\Models\\SeccionResumen', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null}', '2022-05-14 12:53:46', '2022-05-14 12:53:46'),
(28, 'tipo_abreviatura', 'tipo-abreviatura', 'Tipo Abreviatura', 'Tipo Abreviaturas', NULL, 'App\\Models\\TipoAbreviatura', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null}', '2022-05-14 12:55:48', '2022-05-14 12:55:48'),
(29, 'tipo_empleado', 'tipo-empleado', 'Tipo Empleado', 'Tipo Empleados', NULL, 'App\\Models\\TipoEmpleado', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null}', '2022-05-14 12:56:42', '2022-05-14 12:56:42'),
(30, 'tipo_usuario', 'tipo-usuario', 'Tipo Usuario', 'Tipo Usuarios', NULL, 'App\\Models\\TipoUsuario', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null}', '2022-05-14 12:57:38', '2022-05-14 12:57:38'),
(31, 'usuario', 'usuario', 'Usuario', 'Usuarios', NULL, 'App\\Models\\Usuario', NULL, 'App\\Http\\Controllers\\Voyager\\UsuarioController', NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}', '2022-05-14 12:58:49', '2022-07-18 03:28:05'),
(32, 'configuracion_sistema', 'configuracion-sistema', 'Configuraciones', 'Configuraciones', NULL, 'App\\Models\\ConfiguracionSistema', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}', '2022-05-17 05:13:41', '2022-07-19 05:16:37'),
(33, 'departamento_unidad', 'departamento-unidad', 'Departamento/Unidad', 'Departamentos/Unidades', NULL, 'App\\Models\\DepartamentoU', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}', '2022-05-21 01:55:11', '2022-07-08 00:31:43');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `departamento_unidad`
--

CREATE TABLE `departamento_unidad` (
  `id` int(11) NOT NULL,
  `nombre_departamento` varchar(200) NOT NULL,
  `facultad_id` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `departamento_unidad`
--

INSERT INTO `departamento_unidad` (`id`, `nombre_departamento`, `facultad_id`, `created_at`, `updated_at`) VALUES
(1, 'Departamento de Administración de Empresas', 3, '2022-05-20 06:19:00', '2022-05-21 01:57:45'),
(2, 'Departamento de Ciencias de la Eduación', 2, '2022-05-20 06:19:17', '2022-05-20 06:19:17'),
(3, 'Departamento de Ciencias Energéticas y Fluídicas', 1, '2022-05-20 06:19:17', '2022-05-20 06:19:17'),
(4, 'Departamento de Ciencias Jurídicas', 2, '2022-05-20 06:19:17', '2022-05-20 06:19:17'),
(5, 'Departamento de Comunicaciones y Cultural', 2, '2022-05-20 06:19:17', '2022-05-20 06:19:17'),
(6, 'Departamento de Contabilidad y Finanzas', 3, '2022-05-20 06:19:17', '2022-05-20 06:19:17'),
(7, 'Departamento de Economía', 3, '2022-05-20 06:19:17', '2022-05-20 06:19:17'),
(8, 'Departamento de Electrónica e Informática', 1, '2022-05-20 06:19:17', '2022-05-20 06:19:17'),
(9, 'Departamento de Filosofía', 2, '2022-05-20 06:19:17', '2022-05-20 06:19:17'),
(10, 'Departamento de Ingeniería de Procesos y Ciencias Ambientales', 1, '2022-05-20 06:19:17', '2022-05-20 06:19:17'),
(11, 'Departamento de Matemática', 1, '2022-05-20 06:19:17', '2022-05-20 06:19:17'),
(12, 'Departamento de Mecánica Estructural', 1, '2022-05-20 06:19:17', '2022-05-20 06:19:17'),
(13, 'Departamento de Operaciones y Sistemas', 1, '2022-05-20 06:19:00', '2022-05-21 01:58:04'),
(14, 'Departamento de Organización del Espacio', 1, '2022-05-20 06:19:17', '2022-05-20 06:19:17'),
(15, 'Departamento de Psicología y de Salud Pública', 2, '2022-05-20 06:19:17', '2022-05-20 06:19:17'),
(16, 'Departamento de Sociología y Ciencias', 2, '2022-05-20 06:19:17', '2022-05-20 06:19:17'),
(17, 'Departamento de Teología', 2, '2022-05-20 06:19:17', '2022-05-20 06:19:17'),
(18, 'Decanato de Ciencias Económicas y Empresariales', 2, '2022-05-20 06:19:17', '2022-05-20 06:19:17'),
(19, 'Decanato de Ciencias Sociales y Humanidades', 3, '2022-05-20 06:19:17', '2022-05-20 06:19:17'),
(20, 'Decanato de Ingeniería y Arquitectura', 1, '2022-05-20 06:19:17', '2022-05-20 06:19:17'),
(21, 'Decanato de Postgrados', 4, '2022-05-20 06:19:17', '2022-05-20 06:19:17'),
(22, 'Rectoría', NULL, '2022-05-25 23:55:22', '2022-05-25 23:55:22'),
(23, 'Secretaría General', NULL, '2022-05-26 00:21:05', '2022-05-26 00:21:05');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `director_carrera`
--

CREATE TABLE `director_carrera` (
  `id` int(11) NOT NULL,
  `usuario_id` int(11) NOT NULL,
  `carrera_id` int(11) NOT NULL,
  `empleado_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `director_carrera`
--

INSERT INTO `director_carrera` (`id`, `usuario_id`, `carrera_id`, `empleado_id`, `created_at`, `updated_at`) VALUES
(3, 63, 7, 5, '2022-07-05 19:04:26', '2022-07-05 19:04:26'),
(4, 64, 4, 21, '2022-07-18 06:04:40', '2022-07-18 06:04:40');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empleado`
--

CREATE TABLE `empleado` (
  `id` int(11) NOT NULL,
  `codigo_empleado` varchar(10) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `apellido` varchar(100) NOT NULL,
  `tipo_empleado_id` int(11) NOT NULL,
  `cargo_id` int(11) NOT NULL,
  `departamento_unidad_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `empleado`
--

INSERT INTO `empleado` (`id`, `codigo_empleado`, `nombre`, `apellido`, `tipo_empleado_id`, `cargo_id`, `departamento_unidad_id`, `created_at`, `updated_at`) VALUES
(2, '', 'Silvia Eleonor', 'Azucena de Fernández', 2, 2, 23, '2022-05-26 00:25:59', '2022-05-26 00:25:59'),
(3, 'CER009', 'Carlos Ernesto', 'Rivas', 2, 1, 20, '2022-05-26 00:33:16', '2022-05-26 00:33:16'),
(4, '', 'Elisa Cristina', 'Aldana Calderon', 1, 4, 8, '2022-05-26 00:34:44', '2022-05-26 00:34:44'),
(5, '', 'Jose Enmanuel', 'Amaya Araujo', 1, 3, 8, '2022-05-26 00:37:07', '2022-05-26 00:37:07'),
(6, '', 'Andreu', 'Oliva de la Esperanza, S.J.', 2, 5, 22, '2022-05-26 06:10:32', '2022-05-26 06:10:32'),
(7, 'MCH01231', 'Mayra Cecilia', 'Herrera', 2, 2, 20, '2022-07-15 06:55:00', '2022-07-15 06:55:00'),
(8, 'erwed', 'Angel Fernando', 'Duarte Novoa', 1, 4, 8, '2022-07-18 04:35:50', '2022-07-19 07:16:46'),
(9, 'sdfsdf', 'Douglas Antonio', 'Hernández Torres', 1, 4, 8, '2022-07-18 04:41:55', '2022-07-18 04:41:55'),
(10, 'dfgdfgr', 'Erick Giovanni', 'Varela Guzmán', 1, 4, 8, '2022-07-18 04:42:40', '2022-07-18 04:42:40'),
(11, 'ewrwer', 'Gabriela Carolina', 'Reynosa Pérez', 1, 4, 8, '2022-07-18 04:49:29', '2022-07-18 04:49:29'),
(12, 'ewrwer', 'Gabriela Carolina', 'Reynosa Pérez', 1, 4, 8, '2022-07-18 04:49:29', '2022-07-18 04:49:29'),
(13, 'sdfsf', 'Guillermo Ernesto', 'Cortés Villeda', 1, 4, 8, '2022-07-18 04:50:27', '2022-07-18 04:50:27'),
(14, 'sdfsd', 'Javier Alonso', 'Hernández Flores', 1, 4, 8, '2022-07-18 04:51:14', '2022-07-18 04:51:14'),
(15, 'adasd', 'Marlene Elizabeth', 'Aguilar Navarro', 1, 4, 8, '2022-07-18 04:51:58', '2022-07-18 04:51:58'),
(16, 'dsfsd', 'Néstor Santiago', 'Aldana Rodríguez', 1, 4, 8, '2022-07-18 04:52:54', '2022-07-18 04:52:54'),
(17, 'dsfsdf', 'Óscar Antonio', 'Valencia Monterrosa', 1, 4, 8, '2022-07-18 04:53:34', '2022-07-18 04:53:34'),
(18, 'ohso', 'Ronaldo Armando', 'Canizales Turcios', 1, 4, 8, '2022-07-18 04:54:19', '2022-07-18 04:54:19'),
(19, 'sdfsdf', 'Silvia Carolina', 'Ortíz Cuéllar', 1, 4, 8, '2022-07-18 04:55:07', '2022-07-18 04:55:07'),
(20, 'were', 'Carlos Aníbal', 'Juárez', 1, 10, 8, '2022-07-18 05:04:01', '2022-07-18 05:04:01'),
(21, 'dsfsdf', 'Francisco Eduardo', 'Huguet Méndez', 1, 3, 8, '2022-07-18 05:05:02', '2022-07-18 05:05:02'),
(22, 'sdfsdf', 'Merlyn Elena', 'Bautista', 1, 8, 8, '2022-07-18 05:07:04', '2022-07-18 05:07:04');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estudiante`
--

CREATE TABLE `estudiante` (
  `id` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `apellido` varchar(100) NOT NULL,
  `carnet` char(10) NOT NULL,
  `carrera_id` int(11) NOT NULL,
  `usuario_id` int(11) NOT NULL,
  `grupo_trabajo_id` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `estudiante`
--

INSERT INTO `estudiante` (`id`, `nombre`, `apellido`, `carnet`, `carrera_id`, `usuario_id`, `grupo_trabajo_id`, `created_at`, `updated_at`) VALUES
(11, ' Juan Pablo', ' Acosta Valdivieso', '00128917', 7, 13, 9, '2022-07-05 17:26:55', '2022-07-19 04:55:07'),
(12, ' Mauricio Alejandro', ' Pacheco Guerrero', '00170517', 7, 14, 9, '2022-07-05 17:26:55', '2022-07-19 04:55:07'),
(15, ' Luis Eduardo', ' Cortez Murillo', '00029117', 7, 17, NULL, '2022-07-05 17:26:55', '2022-07-05 17:26:55'),
(16, ' Daniel Leonardo', ' Hernandez Chica', '00209317', 7, 18, NULL, '2022-07-05 17:26:55', '2022-07-05 17:26:55'),
(17, ' Luis Adalberto', ' Trujillo Perez', '00127717', 7, 19, NULL, '2022-07-05 17:26:55', '2022-07-05 17:26:55'),
(18, ' Luis Fernando', ' Anstirman Henriquez', '00024117', 7, 20, 8, '2022-07-05 17:26:55', '2022-07-19 04:51:06'),
(19, ' David Alejandro', ' Guardado Chinchilla', '00184217', 7, 21, 8, '2022-07-05 17:26:56', '2022-07-19 04:51:06'),
(20, ' Javier Ernesto', ' Mejia Arevalo', '00076017', 7, 22, 8, '2022-07-05 17:26:56', '2022-07-19 04:51:06'),
(21, ' Ricardo Antonio', ' Villeda Flores', '00004817', 7, 23, 8, '2022-07-05 17:26:56', '2022-07-19 05:37:39'),
(22, ' Luisa Daniela', ' Arevalo Rodas', '00038617', 7, 24, NULL, '2022-07-05 17:26:56', '2022-07-05 17:26:56'),
(23, ' Fabricio Enrique', ' Hernandez Lopez', '00163217', 7, 25, NULL, '2022-07-05 17:26:56', '2022-07-05 17:26:56'),
(24, ' Jose David', ' Mejia Segura', '00001617', 7, 26, NULL, '2022-07-05 17:26:56', '2022-07-05 17:26:56'),
(25, ' Walter Antoniell', ' Bustillo Ayala', '00189617', 7, 27, NULL, '2022-07-05 17:26:56', '2022-07-05 17:26:56'),
(26, ' Alvaro Francisco', ' Garcia Cornejo', '00111317', 7, 28, NULL, '2022-07-05 17:26:56', '2022-07-05 17:26:56'),
(27, ' Edwin Ernesto', ' Lovo Ramos', '00120617', 7, 29, NULL, '2022-07-05 17:26:56', '2022-07-05 17:26:56'),
(28, ' Francisco Josue', ' Molina Lopez', '00300917', 7, 30, NULL, '2022-07-05 17:26:56', '2022-07-05 17:26:56'),
(29, ' Raul Fabricio', ' Calderon Jimenez', '00004017', 7, 31, NULL, '2022-07-05 17:26:56', '2022-07-05 17:26:56'),
(30, ' Alexis Javier', ' Gomez Coto', '00122717', 7, 32, NULL, '2022-07-05 17:26:56', '2022-07-05 17:26:56'),
(31, ' Andre Vladimir', ' Gonzalez Hernandez', '00103017', 7, 33, NULL, '2022-07-05 17:26:56', '2022-07-05 17:26:56'),
(32, ' Gerardo Andres', ' Castro Lemus', '00032515', 7, 34, NULL, '2022-07-05 17:26:56', '2022-07-05 17:26:56'),
(33, ' Fernando Antonio', ' Martinez Olmedo', '00076617', 7, 35, NULL, '2022-07-05 17:26:56', '2022-07-05 17:26:56'),
(34, ' Antonio Alexis', ' Pertuz Arevalo', '00267016', 7, 36, NULL, '2022-07-05 17:26:56', '2022-07-05 17:26:56'),
(35, ' Carlos Alejandro', ' Valle Contreras', '00018316', 7, 37, NULL, '2022-07-05 17:26:56', '2022-07-05 17:26:56'),
(36, ' Elsy Alejandra', ' Chavez Mendoza', '00125717', 7, 38, NULL, '2022-07-05 17:26:56', '2022-07-05 17:26:56'),
(37, ' Erick Fernando', ' Leones Arevalo', '00092217', 7, 39, NULL, '2022-07-05 17:26:56', '2022-07-05 17:26:56'),
(38, ' Cristian Alexander', ' Mundo Orellana', '00086917', 7, 40, NULL, '2022-07-05 17:26:56', '2022-07-05 17:26:56'),
(39, ' Rudi David', ' Vallecios Gonzalez', '00078217', 7, 41, NULL, '2022-07-05 17:26:56', '2022-07-05 17:26:56'),
(40, ' Roberto Antonio', ' Fuentes Guardado', '00062217', 7, 42, NULL, '2022-07-05 17:26:56', '2022-07-05 17:26:56'),
(41, ' Oscar Edenilson', ' Lovato Quintanilla', '00127417', 7, 43, NULL, '2022-07-05 17:26:56', '2022-07-05 17:26:56'),
(42, ' Marvin Geovanni', ' Ramirez Vides', '00120717', 7, 44, NULL, '2022-07-05 17:26:56', '2022-07-05 17:26:56'),
(43, ' Ricardo Alberto', ' Gomez Quijano', '00108517', 7, 45, NULL, '2022-07-05 17:26:56', '2022-07-05 17:26:56'),
(44, ' Mario Isaac', ' Lopez Guevara', '00046317', 7, 46, NULL, '2022-07-05 17:26:56', '2022-07-05 17:26:56'),
(45, ' Victor Enrique', ' Mendoza Yanes', '00046517', 7, 47, NULL, '2022-07-05 17:26:56', '2022-07-05 17:26:56'),
(46, ' Daniel Alejandro', ' Gomez Rodriguez', '00118717', 7, 48, NULL, '2022-07-05 17:26:56', '2022-07-05 17:26:56'),
(47, ' Brenda Marcela', ' Guerrero Diaz', '00024317', 7, 49, NULL, '2022-07-05 17:26:56', '2022-07-05 17:26:56'),
(48, ' Esther Maria', ' Lara Garcia', '00049717', 7, 50, NULL, '2022-07-05 17:26:56', '2022-07-05 17:26:56'),
(49, ' Roberto Ernesto', ' Hernandez Contreras', '00162317', 7, 51, NULL, '2022-07-05 17:26:56', '2022-07-05 17:26:56'),
(50, ' Fredy Alexander', ' Sanchez Perez', '00082817', 7, 52, NULL, '2022-07-05 17:26:56', '2022-07-05 17:26:56'),
(51, ' Diego Edgardo', ' Vega Herrera', '00148816', 7, 53, NULL, '2022-07-05 17:26:56', '2022-07-05 17:26:56'),
(52, ' Eduardo Alberto', ' Lopez Torres', '00092117', 7, 54, 1, '2022-07-05 17:26:56', '2022-07-17 21:56:01'),
(53, ' Joshua Steven', ' Sharp Reyes', '00159817', 7, 55, 1, '2022-07-05 17:26:56', '2022-07-05 17:26:56'),
(54, ' Ruben Alexander', ' Sigüenza Argueta', '00068817', 7, 56, 1, '2022-07-05 17:26:56', '2022-07-05 17:26:56'),
(55, ' Jeniffer Daniela', ' Merino Beltran', '00030717', 7, 57, NULL, '2022-07-05 17:26:56', '2022-07-05 17:26:56'),
(56, ' Danniela Alejandra', ' Renderos Lainez', '00087717', 7, 58, NULL, '2022-07-05 17:26:56', '2022-07-05 17:26:56'),
(57, ' Cesar Alejandro', ' Rosales Cruz', '00060917', 7, 59, NULL, '2022-07-05 17:26:56', '2022-07-05 17:26:56'),
(58, ' Carlos Jose', ' Trigueros Rivas', '00082217', 7, 60, NULL, '2022-07-05 17:26:56', '2022-07-05 17:26:56'),
(61, ' Jose Fernando', ' Salazar Aquino', '00017917', 7, 15, 9, '2022-07-18 17:22:15', '2022-07-19 04:55:07'),
(62, ' Cristian Mauricio', ' Alfaro Contreras', '00167917', 7, 16, NULL, '2022-07-18 17:22:15', '2022-07-18 17:22:15'),
(63, ' Karina Daniela', ' Mina Martinez', '00012217', 7, 61, NULL, '2022-07-18 17:24:50', '2022-07-18 17:24:50'),
(64, ' Jose Alejandro', ' Olmedo Araniva', '00097017', 7, 62, NULL, '2022-07-18 17:24:50', '2022-07-18 17:24:50');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `externo`
--

CREATE TABLE `externo` (
  `id` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `apellido` varchar(100) NOT NULL,
  `correo` varchar(100) NOT NULL,
  `descripcion` text DEFAULT NULL,
  `rol_externo` tinyint(1) NOT NULL,
  `departamento_unidad_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `externo`
--

INSERT INTO `externo` (`id`, `nombre`, `apellido`, `correo`, `descripcion`, `rol_externo`, `departamento_unidad_id`, `created_at`, `updated_at`) VALUES
(13, 'Torre', 'Cline', 'tcline0@google.com', '', 0, 8, '2022-07-17 20:44:41', '2022-07-17 20:44:41'),
(14, 'Gabrila', 'Arrigo', 'garrigo1@wordpress.org', '', 0, 8, '2022-07-17 20:44:41', '2022-07-17 20:44:41'),
(15, 'Lindy', 'Goddard', 'lgoddard2@cdc.gov', '', 0, 8, '2022-07-17 20:44:41', '2022-07-17 20:44:41'),
(16, 'Abdul', 'Bracer', 'abracer3@jigsy.com', '', 0, 8, '2022-07-17 20:44:41', '2022-07-17 20:44:41'),
(17, 'Susannah', 'Pillington', 'spillington4@blog.com', '', 0, 8, '2022-07-17 20:44:41', '2022-07-17 20:44:41'),
(18, 'Tan', 'Geockle', 'tgeockle5@friendfeed.com', '', 0, 8, '2022-07-17 20:44:41', '2022-07-17 20:44:41'),
(19, 'Sybil', 'Barradell', 'sbarradell6@biglobe.ne.jp', '', 0, 8, '2022-07-17 20:44:41', '2022-07-17 20:44:41'),
(20, 'Chelsae', 'Kingsford', 'ckingsford7@usatoday.com', '', 0, 8, '2022-07-17 20:44:41', '2022-07-17 20:44:41'),
(21, 'Alethea', 'Maffucci', 'amaffucci8@360.cn', '', 0, 8, '2022-07-17 20:44:41', '2022-07-17 20:44:41'),
(22, 'Bessy', 'Coolbear', 'bcoolbear9@whitehouse.gov', '', 0, 8, '2022-07-17 20:44:41', '2022-07-17 20:44:41'),
(23, 'Isidoro', 'Richley', 'irichleya@fda.gov', '', 0, 8, '2022-07-17 20:44:41', '2022-07-17 20:44:41'),
(24, 'Siana', 'Glyne', 'sglyneb@amazon.com', '', 0, 8, '2022-07-17 20:44:41', '2022-07-17 20:44:41'),
(25, 'Piotr', 'Ashworth', 'pashworthc@ehow.com', '', 0, 8, '2022-07-17 20:44:41', '2022-07-17 20:44:41'),
(26, 'Joellyn', 'Chrichton', 'jchrichtond@geocities.com', '', 0, 8, '2022-07-17 20:44:41', '2022-07-17 20:44:41'),
(27, 'Sibyl', 'Honnicott', 'shonnicotte@canalblog.com', '', 0, 8, '2022-07-17 20:44:41', '2022-07-17 20:44:41'),
(28, 'Chandler', 'Simonite', 'csimonitef@ow.ly', '', 1, 8, '2022-07-17 20:44:41', '2022-07-17 20:44:41'),
(29, 'Marve', 'Fursse', 'mfursseg@icq.com', '', 1, 8, '2022-07-17 20:44:41', '2022-07-17 20:44:41'),
(30, 'Golda', 'Goddert.sf', 'ggoddertsfh@mit.edu', '', 1, 8, '2022-07-17 20:44:41', '2022-07-17 20:44:41'),
(31, 'Kimmi', 'Enderle', 'kenderlei@deviantart.com', '', 1, 8, '2022-07-17 20:44:41', '2022-07-17 20:44:41'),
(32, 'Harmony', 'Pace', 'hpacej@hatena.ne.jp', '', 1, 8, '2022-07-17 20:44:41', '2022-07-17 20:44:41'),
(33, 'Dylan', 'Alforde', 'dalfordek@dailymotion.com', '', 1, 8, '2022-07-17 20:44:41', '2022-07-17 20:44:41'),
(34, 'Peter', 'Glaisner', 'pglaisnerl@ed.gov', '', 1, 8, '2022-07-17 20:44:41', '2022-07-17 20:44:41'),
(35, 'Leonard', 'Oades', 'loadesm@alexa.com', '', 1, 8, '2022-07-17 20:44:41', '2022-07-17 20:44:41'),
(36, 'Wittie', 'Cassells', 'wcassellsn@mayoclinic.com', '', 1, 8, '2022-07-17 20:44:41', '2022-07-17 20:44:41'),
(37, 'Ciro', 'Withey', 'cwitheyo@de.vu', '', 1, 8, '2022-07-17 20:44:41', '2022-07-17 20:44:41'),
(38, 'Oliviero', 'Dalbey', 'odalbeyp@globo.com', '', 1, 8, '2022-07-17 20:44:41', '2022-07-17 20:44:41'),
(39, 'Artie', 'Brockley', 'abrockleyq@deliciousdays.com', '', 1, 8, '2022-07-17 20:44:41', '2022-07-17 20:44:41'),
(40, 'Karmen', 'Gundry', 'kgundryr@live.com', '', 1, 8, '2022-07-17 20:44:41', '2022-07-17 20:44:41'),
(41, 'Kean', 'Rambadt', 'krambadts@newsvine.com', '', 1, 8, '2022-07-17 20:44:41', '2022-07-17 20:44:41'),
(42, 'Bondon', 'Jurca', 'bjurcat@4shared.com', NULL, 1, 8, '2022-07-17 20:44:41', '2022-08-09 10:34:28');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `facultad`
--

CREATE TABLE `facultad` (
  `id` int(11) NOT NULL,
  `nombre_facultad` varchar(200) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `facultad`
--

INSERT INTO `facultad` (`id`, `nombre_facultad`, `created_at`, `updated_at`) VALUES
(1, 'Facultad de Ingeniería y Arquitectura', '2022-05-20 06:19:17', '2022-05-20 06:19:17'),
(2, 'Facultad de Ciencias Sociales y Humanidades', '2022-05-20 06:19:17', '2022-05-20 06:19:17'),
(3, 'Facultad de Ciencias Económicas y Empresariales', '2022-05-20 06:19:17', '2022-05-20 06:19:17'),
(4, 'Facultad de Postgrados', '2022-05-20 06:19:17', '2022-05-20 06:19:17');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `grupo_trabajo`
--

CREATE TABLE `grupo_trabajo` (
  `id` int(11) NOT NULL,
  `anio_inicio` int(11) NOT NULL,
  `ciclo_inicio` int(11) NOT NULL,
  `tema` text NOT NULL,
  `prorroga` tinyint(1) NOT NULL,
  `asesor_interno_id` int(11) DEFAULT NULL,
  `lector_interno_id` int(11) DEFAULT NULL,
  `asesor_externo_id` int(11) DEFAULT NULL,
  `lector_externo_id` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `grupo_trabajo`
--

INSERT INTO `grupo_trabajo` (`id`, `anio_inicio`, `ciclo_inicio`, `tema`, `prorroga`, `asesor_interno_id`, `lector_interno_id`, `asesor_externo_id`, `lector_externo_id`, `created_at`, `updated_at`) VALUES
(1, 2022, 1, 'Desarrollo de aplicación para facilitar la escritura de los trabajos de graduación para los estudiantes egresados de la Facultad de Ingeniería y Arquitectura de la Universidad Centroamericana José Simeón Cañas.', 0, 4, 7, NULL, NULL, '2022-05-22 05:16:05', '2022-07-19 04:53:08'),
(8, 2022, 1, 'Desarrollo de plugins para el eCampus', 0, 13, 15, NULL, NULL, '2022-07-19 04:51:06', '2022-07-21 06:38:29'),
(9, 2022, 1, 'Herramienta para composición de música asistida por computadora', 0, 8, NULL, NULL, NULL, '2022-07-19 04:55:07', '2022-07-19 04:55:07');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `menus`
--

CREATE TABLE `menus` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `menus`
--

INSERT INTO `menus` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'admin', '2022-04-15 04:23:00', '2022-04-15 04:23:00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `menu_items`
--

CREATE TABLE `menu_items` (
  `id` int(10) UNSIGNED NOT NULL,
  `menu_id` int(10) UNSIGNED DEFAULT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `url` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `target` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '_self',
  `icon_class` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `color` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `order` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `route` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parameters` text COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `menu_items`
--

INSERT INTO `menu_items` (`id`, `menu_id`, `title`, `url`, `target`, `icon_class`, `color`, `parent_id`, `order`, `created_at`, `updated_at`, `route`, `parameters`) VALUES
(1, 1, 'Dashboard', '', '_self', 'voyager-boat', NULL, NULL, 1, '2022-04-15 04:23:00', '2022-05-14 13:13:17', 'voyager.dashboard', NULL),
(2, 1, 'Media', '', '_self', 'voyager-images', NULL, NULL, 5, '2022-04-15 04:23:00', '2022-05-14 13:13:09', 'voyager.media.index', NULL),
(3, 1, 'Users', '', '_self', 'voyager-person', NULL, NULL, 4, '2022-04-15 04:23:00', '2022-05-14 13:13:09', 'voyager.users.index', NULL),
(4, 1, 'Roles', '', '_self', 'voyager-lock', NULL, NULL, 3, '2022-04-15 04:23:00', '2022-05-14 13:13:09', 'voyager.roles.index', NULL),
(5, 1, 'Tools', '', '_self', 'voyager-tools', NULL, NULL, 6, '2022-04-15 04:23:00', '2022-05-14 13:13:09', NULL, NULL),
(6, 1, 'Menu Builder', '', '_self', 'voyager-list', NULL, 5, 1, '2022-04-15 04:23:00', '2022-05-14 13:08:40', 'voyager.menus.index', NULL),
(7, 1, 'Database', '', '_self', 'voyager-data', NULL, 5, 2, '2022-04-15 04:23:00', '2022-05-14 13:08:40', 'voyager.database.index', NULL),
(8, 1, 'Compass', '', '_self', 'voyager-compass', NULL, 5, 3, '2022-04-15 04:23:00', '2022-05-14 13:08:40', 'voyager.compass.index', NULL),
(9, 1, 'BREAD', '', '_self', 'voyager-bread', NULL, 5, 4, '2022-04-15 04:23:00', '2022-05-14 13:08:40', 'voyager.bread.index', NULL),
(10, 1, 'Settings', '', '_self', 'voyager-settings', NULL, NULL, 7, '2022-04-15 04:23:00', '2022-05-14 13:13:09', 'voyager.settings.index', NULL),
(11, 1, 'Seccion Capitulos', '', '_self', NULL, NULL, 37, 19, '2022-05-14 06:33:07', '2022-05-17 04:13:49', 'voyager.seccion-capitulo.index', NULL),
(12, 1, 'Contenido Seccion Capitulos', '', '_self', NULL, NULL, 37, 26, '2022-05-14 06:37:37', '2022-05-17 04:13:49', 'voyager.contenido-seccion-capitulo.index', NULL),
(13, 1, 'Subcontenido Seccion Capitulos', '', '_self', NULL, NULL, 37, 25, '2022-05-14 06:40:26', '2022-05-17 04:13:49', 'voyager.subcontenido-seccion-capitulo.index', NULL),
(14, 1, 'Bitacoras', '', '_self', NULL, NULL, 37, 15, '2022-05-14 11:17:05', '2022-07-06 12:26:41', 'voyager.bitacora.index', NULL),
(15, 1, 'Bitacora Modificacions', '', '_self', NULL, NULL, 37, 9, '2022-05-14 11:20:10', '2022-07-19 05:05:43', 'voyager.bitacora-modificacion.index', NULL),
(16, 1, 'Bitacora Seccions', '', '_self', NULL, NULL, 37, 10, '2022-05-14 11:22:06', '2022-07-19 05:05:43', 'voyager.bitacora-seccion.index', NULL),
(17, 1, 'Cargos', '', '_self', NULL, NULL, 37, 5, '2022-05-14 11:24:58', '2022-07-06 12:26:54', 'voyager.cargo.index', NULL),
(18, 1, 'Carreras', '', '_self', NULL, NULL, 37, 6, '2022-05-14 11:26:47', '2022-07-06 12:27:10', 'voyager.carrera.index', NULL),
(21, 1, 'Director de Carrera', '', '_self', NULL, '#000000', 37, 4, '2022-05-14 11:33:02', '2022-07-06 12:28:18', 'voyager.director-carrera.index', 'null'),
(22, 1, 'Empleados', '', '_self', NULL, NULL, 37, 3, '2022-05-14 11:36:44', '2022-07-06 12:26:36', 'voyager.empleado.index', NULL),
(23, 1, 'Estudiantes', '', '_self', NULL, NULL, 37, 2, '2022-05-14 11:40:48', '2022-07-06 12:26:27', 'voyager.estudiante.index', NULL),
(24, 1, 'Externos', '', '_self', NULL, NULL, 37, 16, '2022-05-14 11:44:48', '2022-05-17 04:13:49', 'voyager.externo.index', NULL),
(25, 1, 'Facultads', '', '_self', NULL, NULL, 37, 11, '2022-05-14 11:48:44', '2022-07-06 12:26:41', 'voyager.facultad.index', NULL),
(26, 1, 'Grupo Trabajos', '', '_self', NULL, NULL, 37, 17, '2022-05-14 12:39:12', '2022-05-17 04:13:49', 'voyager.grupo-trabajo.index', NULL),
(27, 1, 'Seccion Abreviatura Nomenclatura Siglas', '', '_self', NULL, NULL, 37, 18, '2022-05-14 12:43:10', '2022-05-17 04:13:49', 'voyager.seccion-abreviatura-nomenclatura-sigla.index', NULL),
(28, 1, 'Seccion Agradecimientos', '', '_self', NULL, NULL, 37, 20, '2022-05-14 12:44:26', '2022-05-17 04:13:49', 'voyager.seccion-agradecimiento.index', NULL),
(29, 1, 'Seccion Dedicatoria', '', '_self', NULL, NULL, 37, 21, '2022-05-14 12:47:04', '2022-05-17 04:13:49', 'voyager.seccion-dedicatoria.index', NULL),
(30, 1, 'Seccion Glosarios', '', '_self', NULL, NULL, 37, 22, '2022-05-14 12:50:01', '2022-05-17 04:13:49', 'voyager.seccion-glosario.index', NULL),
(31, 1, 'Seccion Referencia', '', '_self', NULL, NULL, 37, 23, '2022-05-14 12:52:29', '2022-05-17 04:13:49', 'voyager.seccion-referencia.index', NULL),
(32, 1, 'Seccion Resumen', '', '_self', NULL, NULL, 37, 24, '2022-05-14 12:53:47', '2022-05-17 04:13:49', 'voyager.seccion-resumen.index', NULL),
(33, 1, 'Tipo Abreviaturas', '', '_self', NULL, NULL, 37, 12, '2022-05-14 12:55:48', '2022-07-06 12:26:41', 'voyager.tipo-abreviatura.index', NULL),
(34, 1, 'Tipo Empleados', '', '_self', NULL, NULL, 37, 13, '2022-05-14 12:56:42', '2022-07-06 12:26:41', 'voyager.tipo-empleado.index', NULL),
(35, 1, 'Tipo Usuarios', '', '_self', NULL, NULL, 37, 14, '2022-05-14 12:57:38', '2022-07-06 12:26:41', 'voyager.tipo-usuario.index', NULL),
(36, 1, 'Usuarios', '', '_self', NULL, NULL, 37, 1, '2022-05-14 12:58:49', '2022-07-06 12:26:13', 'voyager.usuario.index', NULL),
(37, 1, 'Gestionar Sitio', '', '_self', 'voyager-folder', '#000000', NULL, 2, '2022-05-14 13:08:31', '2022-05-14 13:16:55', NULL, ''),
(38, 1, 'Configuraciónes', '', '_self', NULL, '#000000', 37, 8, '2022-05-17 05:13:41', '2022-07-19 05:11:49', 'voyager.configuracion-sistema.index', 'null'),
(39, 1, 'Departamento/Unidad', '', '_self', NULL, '#000000', 37, 7, '2022-05-21 01:55:11', '2022-07-06 12:28:51', 'voyager.departamento-unidad.index', 'null');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2016_01_01_000000_add_voyager_user_fields', 1),
(4, '2016_01_01_000000_create_data_types_table', 1),
(5, '2016_05_19_173453_create_menu_table', 1),
(6, '2016_10_21_190000_create_roles_table', 1),
(7, '2016_10_21_190000_create_settings_table', 1),
(8, '2016_11_30_135954_create_permission_table', 1),
(9, '2016_11_30_141208_create_permission_role_table', 1),
(10, '2016_12_26_201236_data_types__add__server_side', 1),
(11, '2017_01_13_000000_add_route_to_menu_items_table', 1),
(12, '2017_01_14_005015_create_translations_table', 1),
(13, '2017_01_15_000000_make_table_name_nullable_in_permissions_table', 1),
(14, '2017_03_06_000000_add_controller_to_data_types_table', 1),
(15, '2017_04_21_000000_add_order_to_data_rows_table', 1),
(16, '2017_07_05_210000_add_policyname_to_data_types_table', 1),
(17, '2017_08_05_000000_add_group_to_settings_table', 1),
(18, '2017_11_26_013050_add_user_role_relationship', 1),
(19, '2017_11_26_015000_create_user_roles_table', 1),
(20, '2018_03_11_000000_add_user_settings', 1),
(21, '2018_03_14_000000_add_details_to_data_types_table', 1),
(22, '2018_03_16_000000_make_settings_value_nullable', 1),
(23, '2019_08_19_000000_create_failed_jobs_table', 1),
(24, '2019_12_14_000001_create_personal_access_tokens_table', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `permissions`
--

CREATE TABLE `permissions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `table_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `permissions`
--

INSERT INTO `permissions` (`id`, `key`, `table_name`, `created_at`, `updated_at`) VALUES
(1, 'browse_admin', NULL, '2022-04-15 04:23:00', '2022-04-15 04:23:00'),
(2, 'browse_bread', NULL, '2022-04-15 04:23:00', '2022-04-15 04:23:00'),
(3, 'browse_database', NULL, '2022-04-15 04:23:00', '2022-04-15 04:23:00'),
(4, 'browse_media', NULL, '2022-04-15 04:23:00', '2022-04-15 04:23:00'),
(5, 'browse_compass', NULL, '2022-04-15 04:23:00', '2022-04-15 04:23:00'),
(6, 'browse_menus', 'menus', '2022-04-15 04:23:00', '2022-04-15 04:23:00'),
(7, 'read_menus', 'menus', '2022-04-15 04:23:00', '2022-04-15 04:23:00'),
(8, 'edit_menus', 'menus', '2022-04-15 04:23:00', '2022-04-15 04:23:00'),
(9, 'add_menus', 'menus', '2022-04-15 04:23:00', '2022-04-15 04:23:00'),
(10, 'delete_menus', 'menus', '2022-04-15 04:23:00', '2022-04-15 04:23:00'),
(11, 'browse_roles', 'roles', '2022-04-15 04:23:00', '2022-04-15 04:23:00'),
(12, 'read_roles', 'roles', '2022-04-15 04:23:00', '2022-04-15 04:23:00'),
(13, 'edit_roles', 'roles', '2022-04-15 04:23:00', '2022-04-15 04:23:00'),
(14, 'add_roles', 'roles', '2022-04-15 04:23:00', '2022-04-15 04:23:00'),
(15, 'delete_roles', 'roles', '2022-04-15 04:23:00', '2022-04-15 04:23:00'),
(16, 'browse_users', 'users', '2022-04-15 04:23:00', '2022-04-15 04:23:00'),
(17, 'read_users', 'users', '2022-04-15 04:23:00', '2022-04-15 04:23:00'),
(18, 'edit_users', 'users', '2022-04-15 04:23:00', '2022-04-15 04:23:00'),
(19, 'add_users', 'users', '2022-04-15 04:23:00', '2022-04-15 04:23:00'),
(20, 'delete_users', 'users', '2022-04-15 04:23:00', '2022-04-15 04:23:00'),
(21, 'browse_settings', 'settings', '2022-04-15 04:23:00', '2022-04-15 04:23:00'),
(22, 'read_settings', 'settings', '2022-04-15 04:23:00', '2022-04-15 04:23:00'),
(23, 'edit_settings', 'settings', '2022-04-15 04:23:00', '2022-04-15 04:23:00'),
(24, 'add_settings', 'settings', '2022-04-15 04:23:00', '2022-04-15 04:23:00'),
(25, 'delete_settings', 'settings', '2022-04-15 04:23:00', '2022-04-15 04:23:00'),
(26, 'browse_seccion_capitulo', 'seccion_capitulo', '2022-05-14 06:33:07', '2022-05-14 06:33:07'),
(27, 'read_seccion_capitulo', 'seccion_capitulo', '2022-05-14 06:33:07', '2022-05-14 06:33:07'),
(28, 'edit_seccion_capitulo', 'seccion_capitulo', '2022-05-14 06:33:07', '2022-05-14 06:33:07'),
(29, 'add_seccion_capitulo', 'seccion_capitulo', '2022-05-14 06:33:07', '2022-05-14 06:33:07'),
(30, 'delete_seccion_capitulo', 'seccion_capitulo', '2022-05-14 06:33:07', '2022-05-14 06:33:07'),
(31, 'browse_contenido_seccion_capitulo', 'contenido_seccion_capitulo', '2022-05-14 06:37:37', '2022-05-14 06:37:37'),
(32, 'read_contenido_seccion_capitulo', 'contenido_seccion_capitulo', '2022-05-14 06:37:37', '2022-05-14 06:37:37'),
(33, 'edit_contenido_seccion_capitulo', 'contenido_seccion_capitulo', '2022-05-14 06:37:37', '2022-05-14 06:37:37'),
(34, 'add_contenido_seccion_capitulo', 'contenido_seccion_capitulo', '2022-05-14 06:37:37', '2022-05-14 06:37:37'),
(35, 'delete_contenido_seccion_capitulo', 'contenido_seccion_capitulo', '2022-05-14 06:37:37', '2022-05-14 06:37:37'),
(36, 'browse_subcontenido_seccion_capitulo', 'subcontenido_seccion_capitulo', '2022-05-14 06:40:26', '2022-05-14 06:40:26'),
(37, 'read_subcontenido_seccion_capitulo', 'subcontenido_seccion_capitulo', '2022-05-14 06:40:26', '2022-05-14 06:40:26'),
(38, 'edit_subcontenido_seccion_capitulo', 'subcontenido_seccion_capitulo', '2022-05-14 06:40:26', '2022-05-14 06:40:26'),
(39, 'add_subcontenido_seccion_capitulo', 'subcontenido_seccion_capitulo', '2022-05-14 06:40:26', '2022-05-14 06:40:26'),
(40, 'delete_subcontenido_seccion_capitulo', 'subcontenido_seccion_capitulo', '2022-05-14 06:40:26', '2022-05-14 06:40:26'),
(41, 'browse_bitacora', 'bitacora', '2022-05-14 11:17:05', '2022-05-14 11:17:05'),
(42, 'read_bitacora', 'bitacora', '2022-05-14 11:17:05', '2022-05-14 11:17:05'),
(43, 'edit_bitacora', 'bitacora', '2022-05-14 11:17:05', '2022-05-14 11:17:05'),
(44, 'add_bitacora', 'bitacora', '2022-05-14 11:17:05', '2022-05-14 11:17:05'),
(45, 'delete_bitacora', 'bitacora', '2022-05-14 11:17:05', '2022-05-14 11:17:05'),
(46, 'browse_bitacora_modificacion', 'bitacora_modificacion', '2022-05-14 11:20:10', '2022-05-14 11:20:10'),
(47, 'read_bitacora_modificacion', 'bitacora_modificacion', '2022-05-14 11:20:10', '2022-05-14 11:20:10'),
(48, 'edit_bitacora_modificacion', 'bitacora_modificacion', '2022-05-14 11:20:10', '2022-05-14 11:20:10'),
(49, 'add_bitacora_modificacion', 'bitacora_modificacion', '2022-05-14 11:20:10', '2022-05-14 11:20:10'),
(50, 'delete_bitacora_modificacion', 'bitacora_modificacion', '2022-05-14 11:20:10', '2022-05-14 11:20:10'),
(51, 'browse_bitacora_seccion', 'bitacora_seccion', '2022-05-14 11:22:06', '2022-05-14 11:22:06'),
(52, 'read_bitacora_seccion', 'bitacora_seccion', '2022-05-14 11:22:06', '2022-05-14 11:22:06'),
(53, 'edit_bitacora_seccion', 'bitacora_seccion', '2022-05-14 11:22:06', '2022-05-14 11:22:06'),
(54, 'add_bitacora_seccion', 'bitacora_seccion', '2022-05-14 11:22:06', '2022-05-14 11:22:06'),
(55, 'delete_bitacora_seccion', 'bitacora_seccion', '2022-05-14 11:22:06', '2022-05-14 11:22:06'),
(56, 'browse_cargo', 'cargo', '2022-05-14 11:24:58', '2022-05-14 11:24:58'),
(57, 'read_cargo', 'cargo', '2022-05-14 11:24:58', '2022-05-14 11:24:58'),
(58, 'edit_cargo', 'cargo', '2022-05-14 11:24:58', '2022-05-14 11:24:58'),
(59, 'add_cargo', 'cargo', '2022-05-14 11:24:58', '2022-05-14 11:24:58'),
(60, 'delete_cargo', 'cargo', '2022-05-14 11:24:58', '2022-05-14 11:24:58'),
(61, 'browse_carrera', 'carrera', '2022-05-14 11:26:47', '2022-05-14 11:26:47'),
(62, 'read_carrera', 'carrera', '2022-05-14 11:26:47', '2022-05-14 11:26:47'),
(63, 'edit_carrera', 'carrera', '2022-05-14 11:26:47', '2022-05-14 11:26:47'),
(64, 'add_carrera', 'carrera', '2022-05-14 11:26:47', '2022-05-14 11:26:47'),
(65, 'delete_carrera', 'carrera', '2022-05-14 11:26:47', '2022-05-14 11:26:47'),
(71, 'browse_departamento_u', 'departamento_u', '2022-05-14 11:31:07', '2022-05-14 11:31:07'),
(72, 'read_departamento_u', 'departamento_u', '2022-05-14 11:31:07', '2022-05-14 11:31:07'),
(73, 'edit_departamento_u', 'departamento_u', '2022-05-14 11:31:07', '2022-05-14 11:31:07'),
(74, 'add_departamento_u', 'departamento_u', '2022-05-14 11:31:07', '2022-05-14 11:31:07'),
(75, 'delete_departamento_u', 'departamento_u', '2022-05-14 11:31:07', '2022-05-14 11:31:07'),
(76, 'browse_director_carrera', 'director_carrera', '2022-05-14 11:33:02', '2022-05-14 11:33:02'),
(77, 'read_director_carrera', 'director_carrera', '2022-05-14 11:33:02', '2022-05-14 11:33:02'),
(78, 'edit_director_carrera', 'director_carrera', '2022-05-14 11:33:02', '2022-05-14 11:33:02'),
(79, 'add_director_carrera', 'director_carrera', '2022-05-14 11:33:02', '2022-05-14 11:33:02'),
(80, 'delete_director_carrera', 'director_carrera', '2022-05-14 11:33:02', '2022-05-14 11:33:02'),
(81, 'browse_empleado', 'empleado', '2022-05-14 11:36:44', '2022-05-14 11:36:44'),
(82, 'read_empleado', 'empleado', '2022-05-14 11:36:44', '2022-05-14 11:36:44'),
(83, 'edit_empleado', 'empleado', '2022-05-14 11:36:44', '2022-05-14 11:36:44'),
(84, 'add_empleado', 'empleado', '2022-05-14 11:36:44', '2022-05-14 11:36:44'),
(85, 'delete_empleado', 'empleado', '2022-05-14 11:36:44', '2022-05-14 11:36:44'),
(86, 'browse_estudiante', 'estudiante', '2022-05-14 11:40:48', '2022-05-14 11:40:48'),
(87, 'read_estudiante', 'estudiante', '2022-05-14 11:40:48', '2022-05-14 11:40:48'),
(88, 'edit_estudiante', 'estudiante', '2022-05-14 11:40:48', '2022-05-14 11:40:48'),
(89, 'add_estudiante', 'estudiante', '2022-05-14 11:40:48', '2022-05-14 11:40:48'),
(90, 'delete_estudiante', 'estudiante', '2022-05-14 11:40:48', '2022-05-14 11:40:48'),
(91, 'browse_externo', 'externo', '2022-05-14 11:44:48', '2022-05-14 11:44:48'),
(92, 'read_externo', 'externo', '2022-05-14 11:44:48', '2022-05-14 11:44:48'),
(93, 'edit_externo', 'externo', '2022-05-14 11:44:48', '2022-05-14 11:44:48'),
(94, 'add_externo', 'externo', '2022-05-14 11:44:48', '2022-05-14 11:44:48'),
(95, 'delete_externo', 'externo', '2022-05-14 11:44:48', '2022-05-14 11:44:48'),
(96, 'browse_facultad', 'facultad', '2022-05-14 11:48:43', '2022-05-14 11:48:43'),
(97, 'read_facultad', 'facultad', '2022-05-14 11:48:43', '2022-05-14 11:48:43'),
(98, 'edit_facultad', 'facultad', '2022-05-14 11:48:43', '2022-05-14 11:48:43'),
(99, 'add_facultad', 'facultad', '2022-05-14 11:48:43', '2022-05-14 11:48:43'),
(100, 'delete_facultad', 'facultad', '2022-05-14 11:48:43', '2022-05-14 11:48:43'),
(101, 'browse_grupo_trabajo', 'grupo_trabajo', '2022-05-14 12:39:12', '2022-05-14 12:39:12'),
(102, 'read_grupo_trabajo', 'grupo_trabajo', '2022-05-14 12:39:12', '2022-05-14 12:39:12'),
(103, 'edit_grupo_trabajo', 'grupo_trabajo', '2022-05-14 12:39:12', '2022-05-14 12:39:12'),
(104, 'add_grupo_trabajo', 'grupo_trabajo', '2022-05-14 12:39:12', '2022-05-14 12:39:12'),
(105, 'delete_grupo_trabajo', 'grupo_trabajo', '2022-05-14 12:39:12', '2022-05-14 12:39:12'),
(106, 'browse_seccion_abreviatura_nomenclatura_sigla', 'seccion_abreviatura_nomenclatura_sigla', '2022-05-14 12:43:10', '2022-05-14 12:43:10'),
(107, 'read_seccion_abreviatura_nomenclatura_sigla', 'seccion_abreviatura_nomenclatura_sigla', '2022-05-14 12:43:10', '2022-05-14 12:43:10'),
(108, 'edit_seccion_abreviatura_nomenclatura_sigla', 'seccion_abreviatura_nomenclatura_sigla', '2022-05-14 12:43:10', '2022-05-14 12:43:10'),
(109, 'add_seccion_abreviatura_nomenclatura_sigla', 'seccion_abreviatura_nomenclatura_sigla', '2022-05-14 12:43:10', '2022-05-14 12:43:10'),
(110, 'delete_seccion_abreviatura_nomenclatura_sigla', 'seccion_abreviatura_nomenclatura_sigla', '2022-05-14 12:43:10', '2022-05-14 12:43:10'),
(111, 'browse_seccion_agradecimiento', 'seccion_agradecimiento', '2022-05-14 12:44:26', '2022-05-14 12:44:26'),
(112, 'read_seccion_agradecimiento', 'seccion_agradecimiento', '2022-05-14 12:44:26', '2022-05-14 12:44:26'),
(113, 'edit_seccion_agradecimiento', 'seccion_agradecimiento', '2022-05-14 12:44:26', '2022-05-14 12:44:26'),
(114, 'add_seccion_agradecimiento', 'seccion_agradecimiento', '2022-05-14 12:44:26', '2022-05-14 12:44:26'),
(115, 'delete_seccion_agradecimiento', 'seccion_agradecimiento', '2022-05-14 12:44:26', '2022-05-14 12:44:26'),
(116, 'browse_seccion_dedicatoria', 'seccion_dedicatoria', '2022-05-14 12:47:04', '2022-05-14 12:47:04'),
(117, 'read_seccion_dedicatoria', 'seccion_dedicatoria', '2022-05-14 12:47:04', '2022-05-14 12:47:04'),
(118, 'edit_seccion_dedicatoria', 'seccion_dedicatoria', '2022-05-14 12:47:04', '2022-05-14 12:47:04'),
(119, 'add_seccion_dedicatoria', 'seccion_dedicatoria', '2022-05-14 12:47:04', '2022-05-14 12:47:04'),
(120, 'delete_seccion_dedicatoria', 'seccion_dedicatoria', '2022-05-14 12:47:04', '2022-05-14 12:47:04'),
(121, 'browse_seccion_glosario', 'seccion_glosario', '2022-05-14 12:50:01', '2022-05-14 12:50:01'),
(122, 'read_seccion_glosario', 'seccion_glosario', '2022-05-14 12:50:01', '2022-05-14 12:50:01'),
(123, 'edit_seccion_glosario', 'seccion_glosario', '2022-05-14 12:50:01', '2022-05-14 12:50:01'),
(124, 'add_seccion_glosario', 'seccion_glosario', '2022-05-14 12:50:01', '2022-05-14 12:50:01'),
(125, 'delete_seccion_glosario', 'seccion_glosario', '2022-05-14 12:50:01', '2022-05-14 12:50:01'),
(126, 'browse_seccion_referencia', 'seccion_referencia', '2022-05-14 12:52:29', '2022-05-14 12:52:29'),
(127, 'read_seccion_referencia', 'seccion_referencia', '2022-05-14 12:52:29', '2022-05-14 12:52:29'),
(128, 'edit_seccion_referencia', 'seccion_referencia', '2022-05-14 12:52:29', '2022-05-14 12:52:29'),
(129, 'add_seccion_referencia', 'seccion_referencia', '2022-05-14 12:52:29', '2022-05-14 12:52:29'),
(130, 'delete_seccion_referencia', 'seccion_referencia', '2022-05-14 12:52:29', '2022-05-14 12:52:29'),
(131, 'browse_seccion_resumen', 'seccion_resumen', '2022-05-14 12:53:47', '2022-05-14 12:53:47'),
(132, 'read_seccion_resumen', 'seccion_resumen', '2022-05-14 12:53:47', '2022-05-14 12:53:47'),
(133, 'edit_seccion_resumen', 'seccion_resumen', '2022-05-14 12:53:47', '2022-05-14 12:53:47'),
(134, 'add_seccion_resumen', 'seccion_resumen', '2022-05-14 12:53:47', '2022-05-14 12:53:47'),
(135, 'delete_seccion_resumen', 'seccion_resumen', '2022-05-14 12:53:47', '2022-05-14 12:53:47'),
(136, 'browse_tipo_abreviatura', 'tipo_abreviatura', '2022-05-14 12:55:48', '2022-05-14 12:55:48'),
(137, 'read_tipo_abreviatura', 'tipo_abreviatura', '2022-05-14 12:55:48', '2022-05-14 12:55:48'),
(138, 'edit_tipo_abreviatura', 'tipo_abreviatura', '2022-05-14 12:55:48', '2022-05-14 12:55:48'),
(139, 'add_tipo_abreviatura', 'tipo_abreviatura', '2022-05-14 12:55:48', '2022-05-14 12:55:48'),
(140, 'delete_tipo_abreviatura', 'tipo_abreviatura', '2022-05-14 12:55:48', '2022-05-14 12:55:48'),
(141, 'browse_tipo_empleado', 'tipo_empleado', '2022-05-14 12:56:42', '2022-05-14 12:56:42'),
(142, 'read_tipo_empleado', 'tipo_empleado', '2022-05-14 12:56:42', '2022-05-14 12:56:42'),
(143, 'edit_tipo_empleado', 'tipo_empleado', '2022-05-14 12:56:42', '2022-05-14 12:56:42'),
(144, 'add_tipo_empleado', 'tipo_empleado', '2022-05-14 12:56:42', '2022-05-14 12:56:42'),
(145, 'delete_tipo_empleado', 'tipo_empleado', '2022-05-14 12:56:42', '2022-05-14 12:56:42'),
(146, 'browse_tipo_usuario', 'tipo_usuario', '2022-05-14 12:57:38', '2022-05-14 12:57:38'),
(147, 'read_tipo_usuario', 'tipo_usuario', '2022-05-14 12:57:38', '2022-05-14 12:57:38'),
(148, 'edit_tipo_usuario', 'tipo_usuario', '2022-05-14 12:57:38', '2022-05-14 12:57:38'),
(149, 'add_tipo_usuario', 'tipo_usuario', '2022-05-14 12:57:38', '2022-05-14 12:57:38'),
(150, 'delete_tipo_usuario', 'tipo_usuario', '2022-05-14 12:57:38', '2022-05-14 12:57:38'),
(151, 'browse_usuario', 'usuario', '2022-05-14 12:58:49', '2022-05-14 12:58:49'),
(152, 'read_usuario', 'usuario', '2022-05-14 12:58:49', '2022-05-14 12:58:49'),
(153, 'edit_usuario', 'usuario', '2022-05-14 12:58:49', '2022-05-14 12:58:49'),
(154, 'add_usuario', 'usuario', '2022-05-14 12:58:49', '2022-05-14 12:58:49'),
(155, 'delete_usuario', 'usuario', '2022-05-14 12:58:49', '2022-05-14 12:58:49'),
(156, 'browse_configuracion_sistema', 'configuracion_sistema', '2022-05-17 05:13:41', '2022-05-17 05:13:41'),
(157, 'read_configuracion_sistema', 'configuracion_sistema', '2022-05-17 05:13:41', '2022-05-17 05:13:41'),
(158, 'edit_configuracion_sistema', 'configuracion_sistema', '2022-05-17 05:13:41', '2022-05-17 05:13:41'),
(159, 'add_configuracion_sistema', 'configuracion_sistema', '2022-05-17 05:13:41', '2022-05-17 05:13:41'),
(160, 'delete_configuracion_sistema', 'configuracion_sistema', '2022-05-17 05:13:41', '2022-05-17 05:13:41'),
(161, 'browse_departamento_unidad', 'departamento_unidad', '2022-05-21 01:55:11', '2022-05-21 01:55:11'),
(162, 'read_departamento_unidad', 'departamento_unidad', '2022-05-21 01:55:11', '2022-05-21 01:55:11'),
(163, 'edit_departamento_unidad', 'departamento_unidad', '2022-05-21 01:55:11', '2022-05-21 01:55:11'),
(164, 'add_departamento_unidad', 'departamento_unidad', '2022-05-21 01:55:11', '2022-05-21 01:55:11'),
(165, 'delete_departamento_unidad', 'departamento_unidad', '2022-05-21 01:55:11', '2022-05-21 01:55:11');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `permission_role`
--

CREATE TABLE `permission_role` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `permission_role`
--

INSERT INTO `permission_role` (`permission_id`, `role_id`) VALUES
(1, 1),
(1, 2),
(2, 1),
(3, 1),
(4, 1),
(5, 1),
(6, 1),
(6, 2),
(7, 1),
(7, 2),
(8, 1),
(8, 2),
(9, 1),
(9, 2),
(10, 1),
(10, 2),
(11, 1),
(12, 1),
(13, 1),
(14, 1),
(15, 1),
(16, 1),
(17, 1),
(18, 1),
(19, 1),
(20, 1),
(21, 1),
(22, 1),
(23, 1),
(24, 1),
(25, 1),
(41, 1),
(42, 1),
(43, 1),
(44, 1),
(45, 1),
(46, 1),
(47, 1),
(48, 1),
(49, 1),
(50, 1),
(51, 1),
(52, 1),
(53, 1),
(54, 1),
(55, 1),
(56, 1),
(56, 2),
(57, 1),
(57, 2),
(58, 1),
(58, 2),
(59, 1),
(59, 2),
(60, 1),
(60, 2),
(61, 1),
(61, 2),
(62, 1),
(62, 2),
(63, 1),
(63, 2),
(64, 1),
(64, 2),
(65, 1),
(65, 2),
(71, 1),
(71, 2),
(72, 1),
(72, 2),
(73, 1),
(73, 2),
(74, 1),
(74, 2),
(75, 1),
(75, 2),
(76, 1),
(76, 2),
(77, 1),
(77, 2),
(78, 1),
(78, 2),
(79, 1),
(79, 2),
(80, 1),
(80, 2),
(81, 1),
(81, 2),
(82, 1),
(82, 2),
(83, 1),
(83, 2),
(84, 1),
(84, 2),
(85, 1),
(85, 2),
(86, 1),
(86, 2),
(87, 1),
(87, 2),
(88, 1),
(88, 2),
(89, 1),
(89, 2),
(90, 1),
(90, 2),
(91, 1),
(92, 1),
(93, 1),
(94, 1),
(95, 1),
(96, 1),
(97, 1),
(98, 1),
(99, 1),
(100, 1),
(136, 1),
(137, 1),
(138, 1),
(139, 1),
(140, 1),
(141, 1),
(142, 1),
(143, 1),
(144, 1),
(145, 1),
(146, 1),
(147, 1),
(148, 1),
(149, 1),
(150, 1),
(151, 1),
(151, 2),
(152, 1),
(152, 2),
(153, 1),
(153, 2),
(154, 1),
(154, 2),
(155, 1),
(155, 2),
(156, 1),
(156, 2),
(157, 1),
(157, 2),
(158, 1),
(158, 2),
(161, 1),
(161, 2),
(162, 1),
(162, 2),
(163, 1),
(163, 2),
(164, 1),
(164, 2),
(165, 1),
(165, 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `roles`
--

CREATE TABLE `roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `roles`
--

INSERT INTO `roles` (`id`, `name`, `display_name`, `created_at`, `updated_at`) VALUES
(1, 'admin', 'Administrator', '2022-04-15 04:09:47', '2022-04-15 04:09:47'),
(2, 'user', 'Normal User', '2022-04-15 04:23:00', '2022-04-15 04:23:00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `seccion_abreviatura_nomenclatura_sigla`
--

CREATE TABLE `seccion_abreviatura_nomenclatura_sigla` (
  `id` int(11) NOT NULL,
  `contenido` text NOT NULL,
  `tipo_abreviatura_id` int(11) NOT NULL,
  `grupo_trabajo_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `seccion_abreviatura_nomenclatura_sigla`
--

INSERT INTO `seccion_abreviatura_nomenclatura_sigla` (`id`, `contenido`, `tipo_abreviatura_id`, `grupo_trabajo_id`, `created_at`, `updated_at`) VALUES
(8, '<p>App: Aplicativo o aplicaci&oacute;n.</p>\n\n<p>Docx: Documento XML.</p>', 1, 1, '2022-05-28 10:17:30', '2022-07-15 11:30:28'),
(9, '<p>txt: Bloc de notas.</p>', 3, 1, '2022-05-28 10:17:49', '2022-07-15 11:30:24'),
(10, '<p>APA: American Psychology Association (Asociaci&oacute;n Americana de Psicolog&iacute;a)</p>\n\n<p>API: Application Programming Interface (Interfaz de programaci&oacute;n de aplicaciones)</p>\n\n<p>CLI: Command-Line Interface (Interfaz de l&iacute;nea de comandos)</p>\n\n<p>CSS: Cascading Style Sheets (Hoja de estilo en cascada)</p>\n\n<p>GPL: General Public License (Licencia P&uacute;blica General)</p>\n\n<p>HTML: HyperText Markup Language (Lenguaje de marcado de hipertexto)</p>\n\n<p>HTTP: HyperText Transfer Protocol (Protocolo de transferencia de hipertextos)</p>\n\n<p>HTTPS: HyperText Transfer Protocol Secure (Protocolo seguro de transferencia de hipertexto)</p>\n\n<p>IDE: Integrated Development Environment (Entorno de Desarrollo Integrado)</p>\n\n<p>JSON: JavaScript Object Notation (Notaci&oacute;n de objeto de JavaScript)</p>\n\n<p>JWT: JSON Web Token.</p>\n\n<p>MVC: Model View Controller (Modelo-Vista-Controlador)</p>\n\n<p>ODF: OpernDocument Format (Formato OpenDocument)</p>\n\n<p>OOXML: Office Open XML.</p>\n\n<p>ORM: Object Relational Mapping (Asignaci&oacute;n relacional de objetos)</p>\n\n<p>PHP: Hypertext Pre-Processor (Preprocesador de hipertexto).</p>\n\n<p>RTF: Rich Text Format (Formato de texto enriquecido)</p>\n\n<p>SQL: Structured Query Language (Lenguaje de consulta estructurada)</p>\n\n<p>UCA: Universidad Centroamerica Jos&eacute; Sime&oacute;n Ca&ntilde;as.</p>\n\n<p>UTF-8: UCS Transformation Format 8 (Formato de transformaci&oacute;n UCS)</p>\n\n<p>UV: Unidades valorativas.</p>\n\n<p>VSC: Visual Studio Code.</p>\n\n<p>WYSIWYG: What you see is what you get (Lo que ves es lo que obtienes)</p>\n\n<p>XML: Extensible Markup Language (Lenguaje de Marcado Extensible)</p>', 2, 1, '2022-05-28 10:18:13', '2022-07-15 11:30:20');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `seccion_agradecimiento`
--

CREATE TABLE `seccion_agradecimiento` (
  `id` int(11) NOT NULL,
  `opcional` tinyint(1) NOT NULL,
  `autor` varchar(100) DEFAULT NULL,
  `contenido` text NOT NULL,
  `estudiante_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `seccion_agradecimiento`
--

INSERT INTO `seccion_agradecimiento` (`id`, `opcional`, `autor`, `contenido`, `estudiante_id`, `created_at`, `updated_at`) VALUES
(27, 0, 'Eduardo Alberto Lopez Torres', '<p>El trabajo de graduaci&oacute;n es un paso importante en mis estudios en la carrera de Ingenier&iacute;a Inform&aacute;tica en la UCA, ya que esto significa la culminaci&oacute;n de toda una trayectoria y preparaci&oacute;n que, durante 5 a&ntilde;os, con mucho esfuerzo y sacrificios he logrado finalizar.</p>\n\n<p>&nbsp;</p>\n\n<p>A lo largo de mi carrera universitaria siempre he tenido el apoyo de mi familia y amigos, los cuales agradezco por toda su ayuda y cari&ntilde;o que me mostraron en cada paso que di, ense&ntilde;&aacute;ndome que con esfuerzo y valent&iacute;a alcanzar&iacute;a a lograr cumplir todas las metas y objetivos que me he propuesto en la vida.</p>\n\n<p>&nbsp;</p>\n\n<p>Agradezco especialmente a mis padres Alberto L&oacute;pez y Roci&oacute; Torres, quienes estuvieron conmigo en cada una de las etapas de estudios, desde k&iacute;nder hasta la universidad, siempre ense&ntilde;&aacute;ndome a esforzarme m&aacute;s por alcanzar mis objetivos y metas. Tambi&eacute;n agradezco a mi hermana Gabriela L&oacute;pez, quien me estuvo apoyando y motivando a seguir adelante y, asimismo, a no rendirme logrando as&iacute;, cumplir mis sue&ntilde;os.</p>\n\n<p>&nbsp;</p>\n\n<p>Igualmente, quisiera agradecer a Rub&eacute;n Argueta y Joshua Sharp, mis compa&ntilde;eros de trabajo, quienes estuvieron conmigo realizando el trabajo de graduaci&oacute;n y que gracias a ellos este proceso se ha hecho posible y, asimismo, agradecer a nuestra Directora de trabajo de graduaci&oacute;n Elisa Aldana, quien nos estuvo apoyando a lo largo del proceso auxili&aacute;ndonos y motiv&aacute;ndonos a hacer que este proyecto saliera de la mejor manera posible.</p>\n\n<p>&nbsp;</p>\n\n<p>Tambi&eacute;n hay una persona muy especial quien estuvo apoy&aacute;ndome durante mis &uacute;ltimos a&ntilde;os de carrera y se ha convertido en alguien muy significativo para m&iacute;, Marielos Najarro, quien es la persona que estuvo motiv&aacute;ndome y me ense&ntilde;&oacute; a no rendirme, aunque la situaci&oacute;n fuera dif&iacute;cil, demostr&aacute;ndome as&iacute;, que siempre existe una soluci&oacute;n ante cualquier problema existente.</p>\n\n<p>&nbsp;</p>\n\n<p>Para terminar, hay muchas m&aacute;s personas que tuvieron un impacto en mi vida y es necesario agradecer por cada una de ellas, ya que han sido un gran apoyo y no me han abandonado, estando conmigo en cualquier adversidad, en las buenas y en las malas, por lo que agradezco mucho a las personas que me han estado conmigo a lo largo de mi carrera.</p>', 52, '2022-07-08 22:32:47', '2022-07-14 00:02:42'),
(28, 0, 'Ruben Alexander  Sigüenza Argueta', '<p>La culminaci&oacute;n de este trabajo de graduaci&oacute;n tiene un significado enorme para mi, no solo por que signifique la finalizaci&oacute;n de mis estudios universitarios, sino que,&nbsp; tambi&eacute;n es el resultado de todos aquellos sacrificios realizados y obst&aacute;culos superados a lo largo de todos estos a&ntilde;os para poder alcanzar esta meta.</p>\n\n<p>&nbsp;</p>\n\n<p>Durante estos a&ntilde;os cont&eacute; con el apoyo de mis familiares m&aacute;s cercanos, como mis padres, mis t&iacute;os y mis abuelos, quienes siempre estuvieron ah&iacute; para darme su apoyo en momentos en los que el panorama no era el mejor, anim&aacute;ndome y ayud&aacute;ndome a motivarme para lograr afrontar las situaciones, tambi&eacute;n estuvieron ah&iacute; para celebrar mis logros haci&eacute;ndome sentir que por m&aacute;s peque&ntilde;os que fueran, para ellos eran enormes.</p>\n\n<p>&nbsp;</p>\n\n<p>A lo largo de la carrera pude conocer personas muy interesantes, algunas de ellas hasta la fecha actual siendo personas muy importantes para m&iacute;, personas con las que puedo contar y con las que tengo la certeza que seguir&eacute; teniendo comunicaci&oacute;n aun al finalizar la carrera.</p>\n\n<p>&nbsp;</p>\n\n<p>De todas las personas que he conocido a lo largo de estos a&ntilde;os, quisiera agradecer particularmente a Joshua Sharp y Eduardo L&oacute;pez, quienes en los &uacute;ltimos a&ntilde;os han sido de gran apoyo y han demostrado ser personas con las que se puede contar en cualquier momento y no solo para situaciones acad&eacute;micas o de trabajo, adem&aacute;s, son dos personas con las que es muy agradable tratar.</p>\n\n<p>&nbsp;</p>\n\n<p>Para finalizar, existen muchas m&aacute;s personas a las que quisiera agradecer, ya que a trav&eacute;s de ellas logre adquirir muchas experiencias y conocimientos, tambi&eacute;n han sido de mucho apoyo en situaciones adversas y me han ayudado a no rendirme.</p>', 54, '2022-07-08 22:33:04', '2022-07-14 00:02:42'),
(29, 0, 'Joshua Steven  Sharp Reyes', '<p>Quiero agradecer a mi madre Emma Reyes por todo el apoyo que me ha brindado a lo largo de la carrera. A mi hermana Daniella Reyes por estar conmigo y a mis dem&aacute;s familiares que han estado pendientes de mi progreso y que me cuidan tanto en lo f&iacute;sico como a la distancia y aquellos que me cuidan desde el cielo.</p>\n\n<p>&nbsp;</p>\n\n<p>Quiero agradecer a mis compa&ntilde;eros de tesis Eduardo L&oacute;pez y Rub&eacute;n Sig&uuml;enza por la dedicaci&oacute;n y compa&ntilde;erismo que hemos logrado sacar adelante esta tesis y tambi&eacute;n esta carrera universitaria. Quiero darle las gracias a Dios por permitirme llegar hasta este punto y siempre guiarme en el camino correcto y poder superar los obst&aacute;culos durante mi etapa universitaria.</p>\n\n<p>&nbsp;</p>\n\n<p>Quiero agradecer a Elisa Aldana por la asesor&iacute;a y el apoyo que ha brindado durante todo el proceso. Finalmente agradecer a todas las personas que conoc&iacute; durante mi etapa universitaria y que me siguen apoyando hasta hoy d&iacute;a.</p>', 53, '2022-07-08 22:33:15', '2022-07-14 00:02:42');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `seccion_capitulo`
--

CREATE TABLE `seccion_capitulo` (
  `id` int(11) NOT NULL,
  `nombre_capitulo` varchar(200) NOT NULL,
  `orden_capitulo` int(11) NOT NULL,
  `grupo_trabajo_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `seccion_capitulo`
--

INSERT INTO `seccion_capitulo` (`id`, `nombre_capitulo`, `orden_capitulo`, `grupo_trabajo_id`, `created_at`, `updated_at`) VALUES
(16, 'Introducción', 1, 1, '2022-07-13 06:47:55', '2022-07-14 07:11:40'),
(17, 'Marco Teórico', 2, 1, '2022-07-13 06:48:07', '2022-07-14 07:11:40'),
(18, 'Requerimientos del Sistema', 3, 1, '2022-07-13 06:48:38', '2022-07-14 07:11:40'),
(19, 'Herramientas y Metodologías del trabajo', 4, 1, '2022-07-13 06:49:00', '2022-07-13 06:49:00'),
(20, 'Diseño del sistema', 5, 1, '2022-07-13 06:49:18', '2022-07-13 06:49:18'),
(21, 'Desarrollo y pruebas del sistema', 6, 1, '2022-07-13 06:49:37', '2022-07-13 06:49:37'),
(22, 'Conclusiones y recomendaciones', 7, 1, '2022-07-13 06:49:56', '2022-07-13 06:49:56');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `seccion_dedicatoria`
--

CREATE TABLE `seccion_dedicatoria` (
  `id` int(11) NOT NULL,
  `opcional` tinyint(1) NOT NULL,
  `autor` varchar(100) NOT NULL,
  `contenido` text NOT NULL,
  `estudiante_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `seccion_glosario`
--

CREATE TABLE `seccion_glosario` (
  `id` int(11) NOT NULL,
  `opcional` tinyint(1) NOT NULL,
  `contenido` text NOT NULL,
  `grupo_trabajo_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `seccion_glosario`
--

INSERT INTO `seccion_glosario` (`id`, `opcional`, `contenido`, `grupo_trabajo_id`, `created_at`, `updated_at`) VALUES
(7, 0, '<p style=\"text-align:center\"><strong>A</strong></p>\n\n<p>&nbsp;</p>\n\n<p><strong>Aplicativo</strong></p>\n\n<p style=\"text-align:justify\">Es un programa inform&aacute;tico dise&ntilde;ado como herramienta para realizar funciones u operaciones espec&iacute;ficas, por lo que son de gran ayuda para hacer tareas complejas.</p>\n\n<p>&nbsp;</p>\n\n<p style=\"text-align:center\"><strong>B</strong></p>\n\n<p>&nbsp;</p>\n\n<p><strong>Bit&aacute;cora</strong></p>\n\n<p style=\"text-align:justify\">Es la compilaci&oacute;n de informaci&oacute;n acerca de acciones realizadas en el sistema, lo cual se pudieron realizar por un autor o autores y, asimismo, se registra la fecha y hora de cada uno de los registros.</p>\n\n<p>&nbsp;</p>\n\n<p><strong>Bug </strong></p>\n\n<p>Es un error de c&oacute;digo en un programa inform&aacute;tico.</p>\n\n<p>&nbsp;</p>\n\n<p style=\"text-align:center\"><strong>I</strong></p>\n\n<p>&nbsp;</p>\n\n<p><strong>Interfaz</strong></p>\n\n<p>Es una conexi&oacute;n funcional entre 2 sistemas, programas o dispositivos que permite la comunicaci&oacute;n y el intercambio de informaci&oacute;n.</p>\n\n<p>&nbsp;</p>\n\n<p style=\"text-align:center\"><strong>M</strong></p>\n\n<p>&nbsp;</p>\n\n<p><strong>M&oacute;dulo</strong></p>\n\n<p>Es la secci&oacute;n de un aplicativo o sistema que se encarga de una tarea o tareas espec&iacute;ficas.</p>\n\n<p>&nbsp;</p>\n\n<p style=\"text-align:center\"><strong>P</strong></p>\n\n<p>&nbsp;</p>\n\n<p><strong>Parser </strong></p>\n\n<p>Es un programa que analiza una porci&oacute;n de texto para determinar su estructura l&oacute;gica.</p>\n\n<p>&nbsp;</p>\n\n<p><strong>Programa</strong></p>\n\n<p>Es un conjunto de instrucciones que al ejecutarse puede realizar una o m&aacute;s tareas espec&iacute;ficas.</p>\n\n<p>&nbsp;</p>\n\n<p>&nbsp;</p>\n\n<p><strong>Protocolo</strong></p>\n\n<p style=\"text-align:justify\">Es un conjunto formal de est&aacute;ndares y normas.</p>\n\n<p style=\"text-align:center\">&nbsp;</p>\n\n<p style=\"text-align:center\"><strong>R</strong></p>\n\n<p>&nbsp;</p>\n\n<p><strong>Renderizar</strong></p>\n\n<p>&nbsp;</p>\n\n<p>Es un proceso en el que se toma el contenido marcado (HTML, XML, archivos de im&aacute;genes, etc) e informaci&oacute;n de formateo (CSS, XSL, etc) y luego se muestra el contenido formateado en la pantalla de aplicaciones.</p>\n\n<p>&nbsp;</p>\n\n<p style=\"text-align:center\"><strong>S</strong></p>\n\n<p>&nbsp;</p>\n\n<p><strong>Servidor</strong></p>\n\n<p style=\"text-align:justify\">Es un sistema que proporciona recursos, datos, servicios o programas a otros ordenadores, com&uacute;nmente conocidos como clientes.</p>\n\n<p>&nbsp;</p>\n\n<p style=\"text-align:center\"><strong>T</strong></p>\n\n<p>&nbsp;</p>\n\n<p><strong>Token</strong></p>\n\n<p style=\"text-align:justify\">Es un componente l&eacute;xico de una cadena de caracteres que tiene un significado coherente en cierto lenguaje de programaci&oacute;n. El token de seguridad es utilizado para autenticar a un usuario que esta por entrar al sistema.</p>', 1, '2022-06-01 23:33:07', '2022-07-14 00:02:48');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `seccion_referencia`
--

CREATE TABLE `seccion_referencia` (
  `id` int(11) NOT NULL,
  `contenido` text NOT NULL,
  `grupo_trabajo_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `seccion_referencia`
--

INSERT INTO `seccion_referencia` (`id`, `contenido`, `grupo_trabajo_id`, `created_at`, `updated_at`) VALUES
(3, '<ul>\n	<li>Alcocer UH, F. J. (2015). Sistema para la gesti&oacute;n de trabajos de titulaci&oacute;n en la divisi&oacute;n de ciencias e Ingenier&iacute;a. Recuperado 24 de febrero de 2022, de http://risisbi.uqroo.mx/bitstream/handle/20.500.12249/646/T58.6.AL101.2015-822.pdf?sequence=1</li>\n	<li>Anicas, M. (2021, 28 julio). An Introduction to OAuth 2. DigitalOcean Community. Recuperado 16 de marzo de 2022, de https://www.digitalocean.com/community/tutorials/an-introduction-to-oauth-2</li>\n	<li>Atlassian. (s. f.). C&oacute;mo usar Jira Software | Gu&iacute;a oficial del comprador y el usuario. Recuperado 21 de febrero de 2022, de https://www.atlassian.com/es/software/jira/guides</li>\n	<li>B., G. (2022, 27 mayo). &iquest;Qu&eacute; es MySQL? Explicaci&oacute;n detallada para principiantes. Tutoriales Hostinger. Recuperado 21 de marzo de 2022, de https://www.hostinger.es/tutoriales/que-es-mysql</li>\n	<li>Breve historia de PHP. (2016, 26 octubre). Desarrollo Web. Recuperado 15 de marzo de 2022, de https://desarrolloweb.com/articulos/436.php</li>\n	<li>Campoverde Hidalgo, H. M. (2015). Desarrollo e Implementaci&oacute;n de un sistema que permita administrar y gestionar los proyectos de fin de titulaci&oacute;n que se postulan en las titulaciones de la UTPL. Recuperado 25 de febrero de 2022, de https://dspace.utpl.edu.ec/bitstream/123456789/12591/1/Campoverde%20Hidalgo%20Henry%20Manuel.pdf</li>\n	<li>Ciclo Gesti&oacute;n de Innovaci&oacute;n. (2019). Recuperado 21 de febrero de 2022, de https://innovacion.fch.cl/wp-content/uploads/2017/10/diseno-informado-metodologias-agiles.pdf</li>\n	<li>CKEditor.com. (s. f.-a). Features Overview | CKEditor 5. Recuperado 11 de junio de 2022, de https://ckeditor.com/ckeditor-5/features/#productivity</li>\n	<li>CKEditor.com. (s. f.-b). WYSIWYG HTML Editor with Collaborative Rich Text Editing. Recuperado 11 de junio de 2022, de https://ckeditor.com/</li>\n	<li>Costanzo, M. (2020). Platzi: Cursos online profesionales de tecnolog&iacute;a. Platzi. Recuperado 17 de marzo de 2022, de https://platzi.com/tutoriales/1248-pro-arquitectura/5466-que-es-el-patron-mvc</li>\n	<li>da Silva, D. (2021, 19 febrero). &iquest;Qu&eacute; es la metodolog&iacute;a &aacute;gil? &iquest;Para qu&eacute; sirve? Zendesk MX. Recuperado 8 de abril de 2022, de https://www.zendesk.com.mx/blog/metodologia-agil-que-es/</li>\n	<li>de Souza, I. (2020, 9 mayo). Descubre qu&eacute; es el lenguaje de programaci&oacute;n PHP y en qu&eacute; situaciones se hace &uacute;til. Rock Content - ES. Recuperado 15 de marzo de 2022, de https://rockcontent.com/es/blog/php/</li>\n	<li>Definici&oacute;n - Aplicaciones Web. (s. f.). Google Sites: Definicion. Recuperado 18 de marzo de 2022, de https://sites.google.com/site/smr2teresa/definicion</li>\n	<li>Documentation - Laravel PHP Framework. (s. f.). Web archive. Recuperado 17 de marzo de 2022, de https://web.archive.org/web/20130929055257/http://laravel.com/docs/introduction</li>\n	<li>Drake, M. (2020, 14 diciembre). &iquest;What is MySQL? DigitalOcean Community. Recuperado 19 de marzo de 2022, de https://www.digitalocean.com/community/tutorials/what-is-mysql</li>\n	<li>Gupta, S. (2021, 6 octubre). What Is SQL &amp; How Does It Work? A Guide To Structured Query Language. Springboard Blog. Recuperado 19 de marzo de 2022, de https://www.springboard.com/blog/data-analytics/what-is-sql/</li>\n	<li>History of Laravel - Javatpoint. (s. f.). Www.Javatpoint.Com. Recuperado 17 de marzo de 2022, de https://www.javatpoint.com/history-of-laravel</li>\n	<li>Huaman, W. C. (2018, 7 septiembre). Los 10 patrones comunes de arquitectura de software. Medium. Recuperado 3 de mayo de 2022, de https://medium.com/@maniakhitoccori/los-10-patrones-comunes-de-arquitectura-de-software-d8b9047edf0b</li>\n	<li>Inform&aacute;tica B&aacute;sica: &iquest;Qu&eacute; son las aplicaciones web? (s. f.). GCFGlobal.org. Recuperado 18 de marzo de 2022, de https://edu.gcfglobal.org/es/informatica-basica/que-son-las-aplicaciones-web/1/</li>\n	<li>Introduction &mdash; PHPWord 0.18.2 documentation. (s. f.). PHPWord. Recuperado 10 de abril de 2022, de https://phpword.readthedocs.io/en/latest/intro.html#features</li>\n	<li>JWT Access Tokens for OAuth 2.0. (s. f.). Oauth.Net. Recuperado 18 de marzo de 2022, de https://oauth.net/2/jwt-access-tokens/</li>\n	<li>Laravel - Overview. (s. f.). Tutorials Point. Recuperado 17 de marzo de 2022, de https://www.tutorialspoint.com/laravel/laravel_overview.htm</li>\n	<li>Laravel - The PHP Framework For Web Artisans. (s. f.). Laravel. Recuperado 17 de marzo de 2022, de https://laravel.com/docs/9.x/releases</li>\n	<li>Maga&ntilde;a, L. M. L. (2020, 17 enero). &iquest;Qu&eacute; es OAuth 2? OpenWebinars.net. Recuperado 16 de marzo de 2022, de https://openwebinars.net/blog/que-es-oauth2/</li>\n	<li>Mendoza Rivilla, J. E. (2017). Implementaci&oacute;n de sistema web para la gesti&oacute;n y control de los procesos de la unidad de titulaci&oacute;n de la carrera de Ingenier&iacute;a En Sistemas de la Universidad Salesiana, Sede Guayaquil. Recuperado 24 de febrero de 2022, de https://dspace.ups.edu.ec/bitstream/123456789/14482/4/UPS-GT001930.pdf</li>\n	<li>Metodolog&iacute;a SCRUM para desarrollo de software a medida. (s. f.). www.softeng.es. Recuperado 13 de marzo de 2022, de https://www.softeng.es/es-es/empresa/metodologias-de-trabajo/metodologia-scrum.html</li>\n	<li>Monster Digital Agency. (2022, 10 febrero). &iquest;Qu&eacute; es PHP y para qu&eacute; sirve? Epitech Espa&ntilde;a. Recuperado 14 de marzo de 2022, de https://www.epitech-it.es/que-es-php/</li>\n	<li>MySQL. (2019, 12 noviembre). TecnoMagazine. Recuperado 23 de marzo de 2022, de https://tecnomagazine.net/mysql/</li>\n	<li>MySQL: &iquest;Qu&eacute; es? Caracter&iacute;sticas, Ventajas y Desventajas. (2019, 19 enero). hostingpedia.net. Recuperado 21 de marzo de 2022, de https://hostingpedia.net/mysql.html</li>\n	<li>Negocios y Estrategia Business School. (s. f.). Por qu&eacute; tener una metodolog&iacute;a de trabajo en las empresas. Recuperado 3 de mayo de 2022, de https://negociosyestrategia.com/blog/metodologia-trabajo/#:%7E:text=Las%20metodolog%C3%ADas%20de%20trabajo%20ayudan,a%20sus%20clientes%20y%20proveedores.</li>\n	<li>O&rsquo;Brien, J. (2016, 8 junio). A Brief History of Laravel - Vehikl News. Medium. Recuperado 17 de marzo de 2022, de https://medium.com/vehikl-news/a-brief-history-of-laravel-5d55970885bc</li>\n	<li>Pachev, S. (s. f.). Understanding MySQL Internals. O&rsquo;Reilly Online Learning. Recuperado 19 de marzo de 2022, de https://www.oreilly.com/library/view/understanding-mysql-internals/0596009577/ch01.html</li>\n	<li>PHP: Historia de PHP - Manual. (s. f.). PHP. Recuperado 15 de marzo de 2022, de https://www.php.net/manual/es/history.php.php</li>\n	<li>&iquest;Qu&eacute; es la metodolog&iacute;a &aacute;gil? (2020, 5 enero). Red Hat. Recuperado 12 de marzo de 2022, de https://www.redhat.com/es/devops/what-is-agile-methodology</li>\n	<li>Qu&eacute; es SCRUM. (2008, 4 agosto). Proyectos &Aacute;giles. Recuperado 13 de marzo de 2022, de https://proyectosagiles.org/que-es-scrum/</li>\n	<li>Ramos, R. (2021, 25 septiembre). &iquest;Qu&eacute; es JavaScript y para qu&eacute; sirve? Agencia de Marketing Digital Sevilla - Rafa Ramos. Recuperado 11 de junio de 2022, de https://soyrafaramos.com/que-es-javascript-para-que-sirve/</li>\n	<li>REGLAMENTO ADMINISTRATIVO ACAD&Eacute;MICO DE LAS CARRERAS DE GRADO. (2021). Recuperado 21 de febrero de 2022, de https://uca.edu.sv/wp-content/uploads/2021/03/reglamento-administrativo-academico-grado.pdf</li>\n	<li>Relaciones entre tablas en Sql Server 2014 Bases de Datos en Microsoft Sql Server 2014 (4&ndash;35). (2015, 1 julio). www.IncanatoIT.com - Desarrollando Software. Recuperado 21 de junio de 2022, de https://www.incanatoit.com/2014/12/relaciones-entre-tablas-sql-server-2014.html</li>\n	<li>Rieuf, E. (2016, 16 diciembre). History of MySQL. Data Science Central. Recuperado 19 de marzo de 2022, de https://www.datasciencecentral.com/history-of-mysql/</li>\n	<li>Rodr&iacute;guez, Y. (2020, 30 noviembre). Qu&eacute; es una web app: todo lo que necesitas saber | Vanadis. Vanadis | Empresa de Desarrollo de aplicaciones m&oacute;viles y Consultor&iacute;a Digital. Apps nativas para Android y para iPhone y aplicaciones multiplataforma, webapp, app h&iacute;bridas. Solicita tu presupuesto. Recuperado 18 de marzo de 2022, de https://vanadis.es/web-app-todo-lo-que-necesitas-saber/</li>\n	<li>Tapia, N. (2021, 6 febrero). Ventajas y desventajas del lenguaje PHP. BaulPHP. Recuperado 11 de junio de 2022, de https://www.baulphp.com/ventajas-y-desventajas-del-lenguaje-php/</li>\n	<li>Ventajas y desventajas de usar PHP - Bloguero Pro. (2020, 23 noviembre). Bloguero Pro. Recuperado 11 de junio de 2022, de https://blogueropro.com/blog/ventajas-y-desventajas-de-usar-php</li>\n	<li>What is Voyager - Voyager. (s. f.). Voyager Laravel. Recuperado 17 de mayo de 2022, de https://voyager-docs.devdojo.com/getting-started/what-is-voyager</li>\n</ul>', 1, '2022-05-28 10:11:21', '2022-07-09 00:31:10');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `seccion_resumen`
--

CREATE TABLE `seccion_resumen` (
  `id` int(11) NOT NULL,
  `contenido` text NOT NULL,
  `grupo_trabajo_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `seccion_resumen`
--

INSERT INTO `seccion_resumen` (`id`, `contenido`, `grupo_trabajo_id`, `created_at`, `updated_at`) VALUES
(16, '<p>Para graduarse en la Universidad Centroamericana Jos&eacute; Sime&oacute;n Ca&ntilde;as en la Facultad de Ingenier&iacute;a y Arquitectura es necesario que los estudiantes egresados inicien con el proceso de graduaci&oacute;n, el cual comprende de 6 meses en donde desarrollan un trabajo con un tema espec&iacute;fico y su respectivo documento que contiene los resultados de dicho trabajo.</p>\n\n<p>&nbsp;</p>\n\n<p>En el trabajo de graduaci&oacute;n est&aacute;n involucrados distintos actores, los cuales a lo largo del proceso ayudan en el desarrollo y revisi&oacute;n del mismo. Algunos de los actores son: Director del trabajo de graduaci&oacute;n, Lector y Director de Carrera.</p>\n\n<p>&nbsp;</p>\n\n<p>Uno de los requisitos en el proceso de graduaci&oacute;n es el desarrollo de un documento, el cual debe cumplir con ciertos lineamientos o par&aacute;metros estipulados por los distintos Decanatos que la Universidad posee. Para este caso de estudio, los lineamientos que se tomaron en cuenta fueron los del Decanato de Ingenier&iacute;a y Arquitectura, los cuales se explican en el Instructivo para estudiantes en el proceso de graduaci&oacute;n (Octubre 2019).</p>\n\n<p>&nbsp;</p>\n\n<p>Para el desarrollo del documento, como se mencion&oacute; anteriormente, se deben de cumplir con ciertos lineamientos, por lo que los estudiantes tienen ciertas dificultades al momento de cumplirlos y, el incumplimiento de estos lleva a que el trabajo de graduaci&oacute;n no sea aprobado, ya que dichos documentos pasan por distintas revisiones por parte del Director del trabajo de graduaci&oacute;n, Director de Carrera, Encargados de Decanato y Lector, los cuales verifican que los par&aacute;metros en el documento se cumplan y a su vez hacen una revisi&oacute;n del contenido.</p>\n\n<p>&nbsp;</p>\n\n<p>Las aplicaciones web facilitan el acceso a herramientas &uacute;tiles y funcionales, las cuales agilizan y automatizan el desarrollo de ciertas tareas complejas. Por lo tanto, se ha propuesto la idea de la creaci&oacute;n de una plataforma o aplicativo que ayuden a los estudiantes a crear sus documentos de manera que se cumpla con los lineamientos estipulados en el Instructivo.</p>\n\n<p>&nbsp;</p>\n\n<p>El prop&oacute;sito del aplicativo es, crear una herramienta sencilla y f&aacute;cil de utilizar, en la que los estudiantes que est&eacute;n en el proceso de graduaci&oacute;n podr&aacute;n crear sus documentos siguiendo con el debido cumplimiento de los lineamientos.</p>\n\n<p>&nbsp;</p>\n\n<p>Utilizando las distintas herramientas de programaci&oacute;n, se cre&oacute; un sitio web donde el usuario puede observar una interfaz sencilla y f&aacute;cil de comprender, donde a cada rol del sistema se le brinda las funcionalidades adecuadas para cumplir con sus respectivas tareas. Adem&aacute;s, el sistema cuenta con un m&oacute;dulo de seguridad, en el que la informaci&oacute;n que se guarde en la aplicaci&oacute;n est&aacute; protegida y, asimismo, es necesaria la autenticaci&oacute;n para permitir el acceso al sistema y a sus diferentes m&oacute;dulos dependiendo del rol del usuario en sesi&oacute;n.</p>\n\n<p>&nbsp;</p>\n\n<p>El sitio web cuenta con 3 roles los cuales poseen sus respectivos m&oacute;dulos y funcionalidades, lo que hace que cada usuario tenga un papel fundamental en el desarrollo de cada trabajo de graduaci&oacute;n. A continuaci&oacute;n, se explicar&aacute; brevemente en que consiste cada uno de los tipos usuarios que el sistema posee:</p>\n\n<p>&nbsp;</p>\n\n<ul>\n	<li><u>Administrador del sistema:</u> es el encargado de registrar a cada usuario en el sistema y, asimismo, manejar y dar mantenimiento a los datos o configuraciones de cada m&oacute;dulo, tanto para el Director de Carrera como para los Estudiantes.</li>\n	<li><u>Director de Carrera:</u> se encarga de formar a los grupos de graduaci&oacute;n y asignarles su respectivo tema, Director y Lector de trabajo de graduaci&oacute;n, as&iacute; como tambi&eacute;n de registrar a Directores o Lectores de trabajos de graduaci&oacute;n externos, para poder ser asignados a su respectivo grupo.</li>\n	<li><u>Estudiante egresado:</u> este tipo de usuario es el encargado del desarrollo del trabajo de graduaci&oacute;n, en el que se brinda una herramienta de creaci&oacute;n de documentos de graduaci&oacute;n, la cual sigue con los lineamientos estipulados en el Instructivo.</li>\n</ul>\n\n<p>&nbsp;</p>\n\n<p>Las aplicaciones web son una herramienta &uacute;til que ayuda a optimizar ciertas tareas y a su vez automatiza ciertos procesos, mejorando as&iacute; los tiempos de ejecuci&oacute;n. La implementaci&oacute;n de un sistema capaz de crear los documentos de graduaci&oacute;n es un paso acertado ante una de las mayores problem&aacute;ticas que el proceso de graduaci&oacute;n posee, ya que los estudiantes egresados que pasan por esta etapa tienen ciertas dificultades en cumplir con el 100% de los lineamientos y esto genera el rechazo de los trabajos de graduaci&oacute;n.</p>\n\n<p>&nbsp;</p>\n\n<p style=\"margin-left:40px\">Se espera que, en futuras versiones del proyecto, puedan ser implementadas m&aacute;s herramientas que faciliten la creaci&oacute;n de los documentos y, asimismo, se pueda desplegar en las dem&aacute;s facultades, de este modo se tendr&iacute;a una herramienta funcional que sea utilizada por todos los estudiantes egresados de la Universidad.</p>', 1, '2022-05-30 05:11:40', '2022-07-15 00:36:08');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `settings`
--

CREATE TABLE `settings` (
  `id` int(10) UNSIGNED NOT NULL,
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `details` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `order` int(11) NOT NULL DEFAULT 1,
  `group` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `settings`
--

INSERT INTO `settings` (`id`, `key`, `display_name`, `value`, `details`, `type`, `order`, `group`) VALUES
(1, 'site.title', 'Site Title', 'Site Title', '', 'text', 1, 'Site'),
(2, 'site.description', 'Site Description', 'Site Description', '', 'text', 2, 'Site'),
(3, 'site.logo', 'Site Logo', '', '', 'image', 3, 'Site'),
(4, 'site.google_analytics_tracking_id', 'Google Analytics Tracking ID', NULL, '', 'text', 4, 'Site'),
(5, 'admin.bg_image', 'Admin Background Image', 'settings\\June2022\\3o4fuLEPcspUxtNe2qfN.jpg', '', 'image', 5, 'Admin'),
(6, 'admin.title', 'Admin Title', 'Panel de administrador UCA', '', 'text', 1, 'Admin'),
(7, 'admin.description', 'Admin Description', 'Panel de administrador de sistema de gestión de trabajos de graduación.', '', 'text', 2, 'Admin'),
(8, 'admin.loader', 'Admin Loader', 'settings\\June2022\\OsTCMCniIpPCxJZo3V9W.png', '', 'image', 3, 'Admin'),
(9, 'admin.icon_image', 'Admin Icon Image', 'settings\\June2022\\WpgvTXWxg5dggBuXU4tR.png', '', 'image', 4, 'Admin'),
(10, 'admin.google_analytics_client_id', 'Google Analytics Client ID (used for admin dashboard)', NULL, '', 'text', 1, 'Admin');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `subcontenido_seccion_capitulo`
--

CREATE TABLE `subcontenido_seccion_capitulo` (
  `id` int(11) NOT NULL,
  `subtema` text NOT NULL,
  `contenido` text DEFAULT NULL,
  `orden_subcontenido` int(11) NOT NULL,
  `contenido_seccion_capitulo_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `subcontenido_seccion_capitulo`
--

INSERT INTO `subcontenido_seccion_capitulo` (`id`, `subtema`, `contenido`, `orden_subcontenido`, `contenido_seccion_capitulo_id`, `created_at`, `updated_at`) VALUES
(7, 'Objetivo General', '<p style=\"text-align:justify\">Crear un aplicativo que ayude a los estudiantes egresados a generar documentos de trabajo de graduaci&oacute;n, el cual cumpla con todos los lineamientos establecidos por Decanato.</p>', 4, 30, '2022-07-13 06:52:10', '2022-07-14 03:16:37'),
(8, 'Objetivos Específicos', '<ol start=\"1\" style=\"list-style-type:upper-alpha\" type=\"A\">\r\n	<li style=\"text-align:justify\">Identificar las problem&aacute;ticas que se generan al realizar los trabajos de graduaci&oacute;n y generar soluciones por medio de una aplicaci&oacute;n que siga los lineamientos establecidos por Decanato.</li>\r\n	<li style=\"text-align:justify\">Elaborar un aplicativo cliente-servidor con los respectivos par&aacute;metros que denota la Instituci&oacute;n, generando una plataforma que construya los formatos de los trabajos de graduaci&oacute;n.</li>\r\n	<li style=\"text-align:justify\">Fraccionar el tiempo de revisi&oacute;n de los trabajos de graduaci&oacute;n para los Encargados de Decanato, con la ayuda de una herramienta funcional, en donde los estudiantes puedan desarrollar documentos completos de sus respectivos temas.</li>\r\n	<li style=\"text-align:justify\">Establecer un sistema amigable e intuitivo en el que los alumnos cuenten con una herramienta funcional y, asimismo, se pueda trabajar de manera colaborativa.</li>\r\n</ol>', 5, 30, '2022-07-13 06:52:10', '2022-07-14 03:20:20'),
(10, 'Instructivo para Estudiantes Proceso de Graduación', '<p style=\"text-align:justify\">En el Instructivo para Estudiantes Proceso de Graduaci&oacute;n de octubre 2019, se mencionan art&iacute;culos del Reglamento Administrativo Acad&eacute;mico de las Carreras de Grado referente al proceso de graduaci&oacute;n, dichos art&iacute;culos se encuentran en la secci&oacute;n 1 &ldquo;Reglamento Concerniente&rdquo; del instructivo, en este caso solo se mencionan los art&iacute;culos relevantes para esta investigaci&oacute;n, los cuales son:&nbsp;</p>\r\n\r\n<p style=\"text-align:justify\">&nbsp;</p>\r\n\r\n<ul>\r\n	<li style=\"text-align:justify\"><u>Art. 178.</u> El Decano puede prorrogar el plazo establecido para concluir el proceso de graduaci&oacute;n, si la solicitud del egresado o de los egresados es respaldada por el director, mediante una nota razonada.</li>\r\n	<li style=\"text-align:justify\"><u>Art. 179.</u> La pr&oacute;rroga no anula la obligaci&oacute;n de cancelar la escolaridad, mientras el egresado est&eacute; inscrito en el proceso de graduaci&oacute;n.</li>\r\n	<li style=\"text-align:justify\"><u>Art. 181.</u> La propiedad intelectual de los productos del proceso de graduaci&oacute;n pertenece a la Universidad Centroamericana &ldquo;Jos&eacute; Sime&oacute;n Ca&ntilde;as&rdquo;. Queda a criterio de esta instituci&oacute;n autorizar a los autores su publicaci&oacute;n total o parcial.</li>\r\n	<li style=\"text-align:justify\"><u>Art. 184.</u> El trabajo de graduaci&oacute;n para obtener el grado de Licenciado, Ingeniero o Arquitecto podr&aacute; realizarse de forma individual o en grupo, constituido por un m&aacute;ximo de cuatro egresados.</li>\r\n	<li style=\"text-align:justify\"><u>Art. 185.</u> El egresado o cada grupo de egresados ser&aacute; orientado por un director, nombrado por el Decano, a propuesta del Jefe de Departamento.</li>\r\n	<li style=\"text-align:justify\"><u>Art. 186.</u> Cuando el trabajo de graduaci&oacute;n sea interdisciplinario, el Decano, adem&aacute;s del director, nombrar&aacute; a un asesor por cada disciplina.</li>\r\n	<li style=\"text-align:justify\"><u>Art. 187.</u> Son funciones del director del trabajo de graduaci&oacute;n:\r\n	<ol>\r\n		<li style=\"text-align:justify\">Orientar al egresado de tal manera que pueda presentar y aprobar su trabajo, en el plazo establecido.</li>\r\n		<li style=\"text-align:justify\">Dedicar al menos dos horas semanales a dirigir al egresado, en el recinto universitario.</li>\r\n		<li style=\"text-align:justify\">Hacer las correcciones que considere pertinentes al trabajo de graduaci&oacute;n, las cuales deben ser introducidas por el egresado o los egresados.</li>\r\n		<li style=\"text-align:justify\">Calificar el aporte individual de cada egresado al trabajo de graduaci&oacute;n y el trabajo de graduaci&oacute;n mismo.</li>\r\n	</ol>\r\n	</li>\r\n	<li style=\"text-align:justify\"><u>Art. 188.</u> El Coordinador de la Carrera supervisar&aacute; el desarrollo del proceso de graduaci&oacute;n.</li>\r\n	<li style=\"text-align:justify\"><u>Art. 189.</u> El tema del trabajo de graduaci&oacute;n ser&aacute; determinado por el Decano, en coordinaci&oacute;n con el Jefe del Departamento, seg&uacute;n los criterios siguientes, en orden de importancia:\r\n	<ol>\r\n		<li style=\"text-align:justify\">Temas relacionados con el plan de desarrollo del Departamento o de la Universidad.</li>\r\n		<li style=\"text-align:justify\">Temas externos, ajenos a la Universidad.</li>\r\n	</ol>\r\n	</li>\r\n	<li style=\"text-align:justify\"><u>Art. 190.</u> El trabajo de graduaci&oacute;n debe satisfacer los criterios siguientes:\r\n	<ol>\r\n		<li style=\"text-align:justify\">Debe ser elaborado de acuerdo a los lineamientos del Decano.</li>\r\n		<li style=\"text-align:justify\">Debe ser entregado en la Facultad correspondiente en un periodo no mayor de seis meses.</li>\r\n		<li style=\"text-align:justify\">A solicitud del egresado, el Decano podr&aacute; conceder una pr&oacute;rroga de dos meses.</li>\r\n	</ol>\r\n	</li>\r\n	<li style=\"text-align:justify\"><u>Art. 191.</u> Una vez aprobado por el director, el trabajo de graduaci&oacute;n debe ser entregado a un segundo lector, quien ser&aacute; designado por el Decano, a propuesta del Jefe de Departamento, para que otorgue una calificaci&oacute;n, en un plazo de treinta d&iacute;as, a partir de la fecha en la cual el texto le fue entregado por el Decano.</li>\r\n	<li style=\"text-align:justify\"><u>Art. 192.</u> La evaluaci&oacute;n del trabajo de graduaci&oacute;n se har&aacute; de la siguiente manera:\r\n	<ol>\r\n		<li style=\"text-align:justify\">El director califica el aporte de cada egresado, en la elaboraci&oacute;n del trabajo, de forma individual y diferenciada, considerando su asistencia, participaci&oacute;n, contribuci&oacute;n, responsabilidad, etc.</li>\r\n		<li style=\"text-align:justify\">El director otorga una nota al trabajo en s&iacute;, la cual se aplica al egresado o a cada uno de los egresados, si se trata de un grupo.</li>\r\n		<li style=\"text-align:justify\">El promedio de las calificaciones de los dos literales anteriores (a y b) constituye, para cada egresado, el 70 por ciento de la nota del trabajo de graduaci&oacute;n.</li>\r\n		<li style=\"text-align:justify\">El segundo lector otorga una nota al trabajo final, la cual tambi&eacute;n se aplica a cada egresado y &nbsp;equivale al 30 por ciento de la nota de graduaci&oacute;n.</li>\r\n		<li style=\"text-align:justify\">La suma de los promedios ponderados de las notas del director (70%) y de la nota del segundo lector (30%) determina la calificaci&oacute;n final de cada egresado.</li>\r\n		<li style=\"text-align:justify\">La nota m&iacute;nima final para aprobar el trabajo de graduaci&oacute;n es siete (7.0).</li>\r\n	</ol>\r\n	</li>\r\n	<li style=\"text-align:justify\"><u>Art. 195.</u> Para concluir el proceso de graduaci&oacute;n, el egresado o los egresados entregar&aacute;n cinco copias de su trabajo al Decano respectivo, en el formato electr&oacute;nico que &eacute;l determine, y, o impresos, cuando la materia tratada lo requiera.</li>\r\n</ul>\r\n\r\n<p style=\"text-align:justify\">&nbsp;</p>\r\n\r\n<p style=\"text-align:justify\">Asimismo, a lo largo del proceso de graduaci&oacute;n se involucran ciertas figuras que animan a desarrollar con &eacute;xito el respectivo trabajo, as&iacute; como lo indica la secci&oacute;n 2 del Instructivo que se denomina &ldquo;Actores involucrados&rdquo;, a continuaci&oacute;n, se presentan los actores principales que est&aacute;n envueltos en el proceso:</p>\r\n\r\n<p style=\"text-align:justify\">&nbsp;</p>\r\n\r\n<ul>\r\n	<li style=\"text-align:justify\"><u>Egresado:</u> es la persona responsable de desarrollar el trabajo de graduaci&oacute;n, de acuerdo a los lineamientos estipulados de su respectiva Facultad y Departamento. Dichos lineamientos ser&aacute;n verificados por el Director del trabajo de graduaci&oacute;n.</li>\r\n	<li style=\"text-align:justify\"><u>Coordinador de carrera:</u> es la persona encargada de orientar y dirigir a los Directores como a su vez a los Alumnos, en los diferentes aspectos administrativos del proceso de graduaci&oacute;n. Tambi&eacute;n, dentro de sus responsabilidades se encuentran, el monitoreo de los resultados y avances de cada uno de los grupos de graduaci&oacute;n, asimismo, podr&aacute; asignar temas y organizar a los grupos de manera espec&iacute;fica.</li>\r\n	<li style=\"text-align:justify\"><u>Segundo Lector:</u> es el encargado de hacer la revisi&oacute;n oficial del trabajo de graduaci&oacute;n, es decir el documento escrito, asign&aacute;ndole un 30% de la nota final.</li>\r\n	<li style=\"text-align:justify\"><u>Director:</u> persona responsable de dirigir al grupo de alumnos para el desarrollo del trabajo de graduaci&oacute;n. Adem&aacute;s, se encarga de evaluar junto al Segundo Lector, el trabajo realizado por los alumnos que dirige.</li>\r\n</ul>\r\n\r\n<p style=\"text-align:justify\">&nbsp;</p>\r\n\r\n<p style=\"text-align:justify\">Como se observa en el listado anterior, hay 3 principales actores encargados de revisar los avances realizados dentro del trabajo de graduaci&oacute;n. Por consiguiente, es relevante mencionar los aspectos de la secci&oacute;n 3 del Instructivo &ldquo;Sistema de evaluaci&oacute;n&rdquo;, ya que el trabajo ser&aacute; evaluado por dos personas, uno de ellos es el Director del trabajo y el Segundo Lector, teniendo el 70% y 30% respectivamente de la nota final del trabajo de graduaci&oacute;n.</p>\r\n\r\n<p style=\"text-align:justify\">&nbsp;</p>\r\n\r\n<p style=\"text-align:justify\">La evaluaci&oacute;n del Director comprender&aacute; del aporte individual que cada alumno tenga durante el desarrollo del trabajo de graduaci&oacute;n y el producto final, por lo que la nota es de car&aacute;cter individual. El Lector, por su parte, colocar&aacute; una nota global para el producto final del trabajo.</p>', 2, 35, '2022-07-13 22:24:20', '2022-07-14 04:51:30'),
(11, 'Criterios para la evaluación del Trabajo de Graduación', '<p style=\"text-align:justify\">En el trabajo de graduaci&oacute;n es importante cumplir con ciertas caracter&iacute;sticas para su aprobaci&oacute;n, como lo expresa la secci&oacute;n 3.1 del Instructivo &ldquo;Criterios para la evaluaci&oacute;n del Trabajo de Graduaci&oacute;n&rdquo;, el Director del trabajo y Segundo lector utilizan 5 criterios fundamentales al momento de la evaluaci&oacute;n, que son: consistencia, rigurosidad, calidad, originalidad y aplicabilidad. A causa de esto, se presenta la siguiente Tabla 2.1 con los detalles de cada uno de los criterios mencionados anteriormente:</p>\r\n\r\n<p style=\"text-align:justify\">&nbsp;</p>\r\n\r\n<p style=\"text-align:justify\"><strong>(Espacio para tabla)</strong></p>', 3, 35, '2022-07-13 22:24:20', '2022-07-14 06:52:49'),
(12, 'Indicaciones para la elaboración del documento guía del Trabajo de Graduación', '<p style=\"text-align:justify\">El documento gu&iacute;a es importante al momento de iniciar un proyecto, ya que contiene las bases del trabajo de graduaci&oacute;n y sirve de preliminar para el desarrollo del documento principal, como se menciona en la secci&oacute;n 4 del instructivo &ldquo;Indicaciones para la elaboraci&oacute;n del documento gu&iacute;a del trabajo de graduaci&oacute;n&rdquo;, se establecen las partes del documento, tales como:</p>\r\n\r\n<p style=\"text-align:justify\">&nbsp;</p>\r\n\r\n<ul>\r\n	<li style=\"text-align:justify\">T&iacute;tulo del trabajo de graduaci&oacute;n.</li>\r\n	<li style=\"text-align:justify\">Integrantes del grupo de egresados.</li>\r\n	<li style=\"text-align:justify\">Director del grupo de egresados.</li>\r\n	<li style=\"text-align:justify\">Definici&oacute;n del problema.</li>\r\n	<li style=\"text-align:justify\">Objetivos generales y espec&iacute;ficos.</li>\r\n	<li style=\"text-align:justify\">L&iacute;mites y Alcances del trabajo de graduaci&oacute;n.</li>\r\n	<li style=\"text-align:justify\">Estructura preliminar del trabajo.</li>\r\n	<li style=\"text-align:justify\">Metodolog&iacute;a.</li>\r\n	<li style=\"text-align:justify\">Programaci&oacute;n y divisi&oacute;n del desarrollo del trabajo de graduaci&oacute;n.</li>\r\n	<li style=\"text-align:justify\">Referencias.</li>\r\n</ul>\r\n\r\n<p style=\"text-align:justify\">&nbsp;</p>\r\n\r\n<p style=\"text-align:justify\">Como se mencion&oacute; anteriormente, cada parte del documento gu&iacute;a es utilizado para poder definir los alcances y limitaciones del proyecto, al igual que una breve descripci&oacute;n de la idea del trabajo a realizar durante todo el proceso de graduaci&oacute;n.</p>', 4, 35, '2022-07-13 22:24:20', '2022-07-14 04:48:32'),
(13, 'Partes del documento escrito del Trabajo de graduación', '<p style=\"text-align:justify\">El documento escrito es la parte m&aacute;s importante en el desarrollo del trabajo de graduaci&oacute;n, ya que en &eacute;l se establece el proyecto realizado durante todo el proceso, asimismo se debe seguir una estructura preestablecida por Decanato.</p>\r\n\r\n<p style=\"text-align:justify\">&nbsp;</p>\r\n\r\n<p style=\"text-align:justify\">En el Instructivo del proceso de graduaci&oacute;n de la UCA, se tiene un apartado para el documento escrito del trabajo de graduaci&oacute;n, donde cada secci&oacute;n debe tener una estructura m&iacute;nima para su aceptaci&oacute;n. Seg&uacute;n la secci&oacute;n 5 del instructivo denominado &ldquo;Partes del documento escrito del trabajo de graduaci&oacute;n&rdquo;, se mencionan los apartados que se esperan en el documento, los cuales se muestra a continuaci&oacute;n:</p>\r\n\r\n<p style=\"text-align:justify\">&nbsp;</p>\r\n\r\n<ul>\r\n	<li style=\"text-align:justify\"><u>Portada:</u> es la primera hoja del documento, el cual debe de llevar en orden alfab&eacute;tico el apellido y el nombre completo de cada uno de los integrantes del equipo. Asimismo, se debe incluir el nombre de la universidad, el t&iacute;tulo del trabajo de graduaci&oacute;n, tal como aparece en su hoja de inscripci&oacute;n del proceso de graduaci&oacute;n, adem&aacute;s, el tipo del trabajo y facultad, fecha y lugar de la Universidad.</li>\r\n	<li style=\"text-align:justify\"><u>Segunda portada:</u> es la segunda hoja del documento, la cual es la continuaci&oacute;n de la primera portada. En dicha hoja se debe incluir: el nombre del Rector, Secretaria General, Decano de la Facultad, Director de la Carrera, Director del trabajo y Segundo Lector.</li>\r\n	<li style=\"text-align:justify\"><u>Agradecimientos (Opcional):</u> en caso de realizar la secci&oacute;n de agradecimientos, esta debe ser hecha por todos los integrantes del equipo y su extensi&oacute;n debe ser m&aacute;ximo de 1 p&aacute;gina.</li>\r\n	<li style=\"text-align:justify\"><u>Dedicatoria (Opcional):</u> en caso de realizar la secci&oacute;n de dedicatoria, la extensi&oacute;n debe ser m&aacute;xima de 1 p&aacute;gina, es decir son 4 p&aacute;ginas m&aacute;ximo debido al l&iacute;mite de egresados por grupo.</li>\r\n	<li style=\"text-align:justify\"><u>Resumen:</u> se describen los conceptos principales de cada cap&iacute;tulo del documento escrito del trabajo de graduaci&oacute;n, tambi&eacute;n, se debe de hacer &eacute;nfasis en las conclusiones y recomendaciones.</li>\r\n	<li style=\"text-align:justify\"><u>&Iacute;ndice:</u> existen 3 tipos de &iacute;ndices que puede llevar el documento, como lo son: el &iacute;ndice general, &iacute;ndice de figuras y el &iacute;ndice de tablas. A continuaci&oacute;n, se explica brevemente en qu&eacute; consiste cada uno de los &iacute;ndices:&nbsp;\r\n	<ul>\r\n		<li style=\"text-align:justify\"><u>&Iacute;ndice General:</u> es una lista correlativa de todas las secciones y cap&iacute;tulos del documento escrito, indicando el n&uacute;mero de p&aacute;gina en donde se encuentra. Cada uno de los &iacute;ndices debe de iniciar en p&aacute;gina impar y los apartados de los cap&iacute;tulos deben mostrarse en el &iacute;ndice con sangr&iacute;a, respetando el orden jer&aacute;rquico.</li>\r\n		<li style=\"text-align:justify\"><u>&Iacute;ndice de Figuras:</u> consiste en la referencia del n&uacute;mero de p&aacute;gina de todos los gr&aacute;ficos, mapas, planos, fotograf&iacute;as, ilustraciones y diagramas del documento.</li>\r\n		<li style=\"text-align:justify\"><u>&Iacute;ndice de Tablas:</u> consiste en la referencia de cada tabla realizada a lo largo del documento, indicando el n&uacute;mero de p&aacute;gina en donde se encuentran dichas tablas.</li>\r\n	</ul>\r\n	</li>\r\n</ul>\r\n\r\n<ul>\r\n	<li style=\"text-align:justify\"><u>Siglas, Abreviaturas y Nomenclaturas: </u>en dado caso que se utilice por primera vez dentro de un cap&iacute;tulo una sigla, abreviatura o nomenclatura, debe definirse completamente, aun cuando ya se haya hecho al inicio del documento. Para este caso, la realizaci&oacute;n de dicha secci&oacute;n es obligatoria en el caso que aplique en el documento escrito.\r\n\r\n	<ul>\r\n		<li style=\"text-align:justify\"><u>Siglas:</u> se muestran en orden alfab&eacute;tico junto con su significado, en el caso de que esta no est&eacute; en castellano se debe proporcionar su respectiva traducci&oacute;n.</li>\r\n		<li style=\"text-align:justify\"><u>Abreviaturas:</u> las abreviaturas deben ser listadas en orden alfab&eacute;tico junto con su significado. Las unidades de medici&oacute;n no deber&aacute;n incluirse en dicho listado, asimismo, cuando se utilicen en el documento deber&aacute;n de escribirse sin punto al final de la &uacute;ltima letra, y debe de usarse el sistema m&eacute;trico decimal.</li>\r\n		<li style=\"text-align:justify\"><u>Nomenclaturas:</u> las nomenclaturas se deben de listar en orden alfab&eacute;tico. En algunas ocasiones un mismo s&iacute;mbolo puede referirse a muchos significados, aunque se deber&iacute;a de evitar su uso, por lo que, si esto no es posible, debe indicarse las secciones o cap&iacute;tulos donde se aplica cada significado. En el caso de usar s&iacute;mbolos griegos, estos deben de ir tambi&eacute;n en orden alfab&eacute;tico, inmediatamente despu&eacute;s del listado de s&iacute;mbolos con letras latinas.</li>\r\n	</ul>\r\n	</li>\r\n</ul>\r\n\r\n<ul>\r\n	<li style=\"text-align:justify\"><u>Cap&iacute;tulos:</u> los cap&iacute;tulos son el desarrollo del trabajo de graduaci&oacute;n, por lo que la estructura de cada cap&iacute;tulo puede variar seg&uacute;n el tema y tipo de trabajo que se presente.&nbsp; Dichos cap&iacute;tulos se pueden organizar de la siguiente manera:\r\n\r\n	<ul>\r\n		<li style=\"text-align:justify\"><u>Introducci&oacute;n:</u> se presenta la formulaci&oacute;n del planteamiento del problema al igual que su posible soluci&oacute;n. Las partes que se esperan en el cap&iacute;tulo son las siguientes: Antecedentes, Planteamiento del problema, Objetivos, Alcances y limitaciones, entre otros.</li>\r\n		<li style=\"text-align:justify\"><u>Marco Te&oacute;rico:</u> debe de contener conceptos necesarios para sustentar el trabajo de graduaci&oacute;n, al igual que el desarrollo de teor&iacute;as para la soluci&oacute;n de la problem&aacute;tica, esto con el fin de lograr los Objetivos del trabajo.</li>\r\n		<li style=\"text-align:justify\"><u>Metodolog&iacute;a:</u> es la descripci&oacute;n de los M&eacute;todos utilizados para lograr los Objetivos del trabajo.</li>\r\n		<li style=\"text-align:justify\"><u>Presentaci&oacute;n, an&aacute;lisis e interpretaci&oacute;n de resultados:</u> en esta secci&oacute;n se debe explicar c&oacute;mo los resultados se derivan de las mediciones realizadas, se puede a&ntilde;adir diagramas, gr&aacute;ficos y tablas para explicar de una mejor manera los resultados. Por otra parte, se debe de responder a la pregunta planteada en la secci&oacute;n de Introducci&oacute;n y hacer &eacute;nfasis en porqu&eacute; de sus resultados.</li>\r\n		<li style=\"text-align:justify\"><u>Conclusiones y recomendaciones:</u> se resumen los resultados obtenidos del trabajo y plantean inquietudes sobre futuras investigaciones, aplicaciones pr&aacute;cticas, desarrollo de teor&iacute;as, etc. Es importante en todo proyecto la implementaci&oacute;n de las conclusiones y recomendaciones, por lo que se presenta como un cap&iacute;tulo m&aacute;s.</li>\r\n	</ul>\r\n	</li>\r\n</ul>\r\n\r\n<ul>\r\n	<li style=\"text-align:justify\"><u>Glosario (Opcional):</u> es un listado de definiciones de t&eacute;rminos t&eacute;cnicos muy especializados que no pueden encontrarse en un diccionario convencional, el cual debe de ordenarse alfab&eacute;ticamente.</li>\r\n	<li style=\"text-align:justify\"><u>Referencias:</u> las referencias son todo el conjunto de documentos o investigaciones que respalda la informaci&oacute;n escrita dentro del documento escrito, por lo que hay diferentes tipos de referencias que se pueden hacer, a continuaci&oacute;n, se muestran los tipos principales de referencias que se esperan dentro del trabajo escrito:\r\n	<ul>\r\n		<li style=\"text-align:justify\">Obras completas de un autor o m&uacute;ltiples autores.</li>\r\n		<li style=\"text-align:justify\">Cap&iacute;tulos de un libro.</li>\r\n		<li style=\"text-align:justify\">Ponencias, congresos, conferencias y seminarios.</li>\r\n		<li style=\"text-align:justify\">M&uacute;ltiples obras de un solo autor.</li>\r\n		<li style=\"text-align:justify\">Revistas.</li>\r\n		<li style=\"text-align:justify\">Fuentes electr&oacute;nicas.&nbsp;</li>\r\n	</ul>\r\n	</li>\r\n</ul>\r\n\r\n<p style=\"text-align:justify\"><u>Anexos:</u> los anexos se ordenar&aacute;n con letras como, por ejemplo: Anexo A, Anexo B, Anexo C, etc. La primera p&aacute;gina de cada anexo debe ser impar y los m&aacute;rgenes deben de seguir los lineamientos de las p&aacute;ginas del texto, es decir no se siguen las indicaciones para la primera p&aacute;gina de los cap&iacute;tulos. Tambi&eacute;n las p&aacute;ginas de los anexos se enumeran de forma independiente a la del resto del documento.</p>', 5, 35, '2022-07-13 22:24:20', '2022-07-14 04:48:32'),
(14, 'Indicaciones Generales de Formato', '<p style=\"text-align:justify\">El documento escrito en general debe seguir un formato preestablecido por Decanato, el cual se debe de cumplir, esto con el fin de que el trabajo de graduaci&oacute;n sea aceptado, por lo que en la secci&oacute;n 6 &ldquo;Indicaciones generales de formato&rdquo; del Instructivo se estipula el formato a seguir en el documento. A continuaci&oacute;n, en la Tabla 2.2, se muestra:</p>\r\n\r\n<p style=\"text-align:justify\">&nbsp;</p>\r\n\r\n<p style=\"text-align:justify\"><strong>(Espacio para tabla)</strong></p>', 6, 35, '2022-07-13 22:24:20', '2022-07-14 04:48:32'),
(15, 'Entrega de documento definitivo a Director(a) y Decanato', '<p style=\"text-align:justify\">Para la entrega final del trabajo de graduaci&oacute;n, en la secci&oacute;n 8 del Instructivo se indica una serie de pasos a seguir, los cuales son:</p>\r\n\r\n<p style=\"text-align:justify\">&nbsp;</p>\r\n\r\n<ul>\r\n	<li style=\"text-align:justify\"><u>Paso 1.</u> Antes de iniciar la revisi&oacute;n del formato de tesis, el Director del trabajo de graduaci&oacute;n y Director/a de carrera deben revisar el documento y dar su respectiva aprobaci&oacute;n, tanto del contenido y formato, seg&uacute;n el formulario &ldquo;Revisi&oacute;n de formato para trabajo de graduaci&oacute;n&rdquo;.</li>\r\n	<li style=\"text-align:justify\"><u>Paso 2.</u> Para las carreras de Arquitectura, Ingenier&iacute;a Civil e Ingenier&iacute;a El&eacute;ctrica, se presenta a Decanato la tesis en hojas sueltas firmadas por el Director/a de carrera en la primera portada, junto con los n&uacute;meros telef&oacute;nicos de los integrantes del equipo. Asimismo, al ser aprobado el formato de tesis por Decanato, se debe de empastar el documento en color gris y presentarlo junto con los documentos digitales al Director/a de carrera correspondiente para llenar el formulario denominado &ldquo;Entrega de archivos digitales&rdquo;.</li>\r\n	<li style=\"text-align:justify\"><u>Paso 3.</u> Se entregar&aacute;n los archivos digitales al Director/a de su respectiva carrera, por lo cual todas las carreras de la Facultad de Ingenier&iacute;a, deber&aacute;n de presentar los siguientes documentos:\r\n	<ul>\r\n		<li style=\"text-align:justify\">El documento de graduaci&oacute;n en un solo archivo en formato PDF, protegido contra escritura, pero no por impresi&oacute;n.</li>\r\n		<li style=\"text-align:justify\">El documento de graduaci&oacute;n en un solo archivo en formato .DOC, sin ninguna protecci&oacute;n.</li>\r\n		<li style=\"text-align:justify\">Cualquier archivo complementario que requiera el trabajo de graduaci&oacute;n en su respectivo formato.</li>\r\n		<li style=\"text-align:justify\">El art&iacute;culo cient&iacute;fico en un archivo digital en formato .DOC, el cual debe ser aprobado por el Director del trabajo y el Director/a de carrera respectivo en cuanto a formato y escritura.</li>\r\n		<li style=\"text-align:justify\">La presentaci&oacute;n de su trabajo final en Powerpoint con extensi&oacute;n .PPT, si le ha sido solicitada por el Director del trabajo de graduaci&oacute;n.</li>\r\n	</ul>\r\n	</li>\r\n</ul>\r\n\r\n<ul>\r\n	<li style=\"text-align:justify\"><u>Paso 4.</u> Entrega de documento de graduaci&oacute;n empastado a Decanato, para que sea firmado por el Decanato de la Facultad.</li>\r\n	<li style=\"text-align:justify\"><u>Paso 5.</u> El Director/a de carrera deber&aacute; completar el formulario &ldquo;Comprobante de entrega de archivos digitales&rdquo;, detallando los nombres de los archivos que fueron entregados por el grupo.</li>\r\n	<li style=\"text-align:justify\"><u>Paso 6.</u> Presentar al Decanato de Ingenier&iacute;a el comprobante entregado en el paso 5. &lsquo;</li>\r\n	<li style=\"text-align:justify\">En el caso de las carreras de Arquitectura, Ingenier&iacute;a Civil e Ingenier&iacute;a El&eacute;ctrica, deber&aacute;n entregar un ejemplar impreso y empastado, para su respectiva firma y sello del Decano, para posteriormente ser presentado en el Viceministerio de Vivienda y Desarrollo Urbano.</li>\r\n</ul>\r\n\r\n<p style=\"text-align:justify\">&nbsp;</p>\r\n\r\n<p style=\"text-align:justify\">Despu&eacute;s de todos estos requerimientos mencionados en el transcurso del trabajo, los cuales son fundamentales e importantes para un buen desarrollo, tanto para los involucrados dentro de este, como para las personas que se encargan de revisar y aprobar dicho trabajo de graduaci&oacute;n. Es por ello que, a partir de esto, es necesario mencionar otros puntos relevantes que se relacionan &iacute;ntimamente con el actual tema en cuesti&oacute;n.</p>', 7, 35, '2022-07-13 22:24:20', '2022-07-14 04:48:32'),
(16, 'Ventajas y Desventajas de una Aplicación Web', '<p style=\"text-align:justify\">Como se mencion&oacute; anteriormente, las aplicaciones web son plataformas en donde el usuario puede acceder desde cualquier lugar usando el navegador, pero las aplicaciones web cuentan con sus respectivas ventajas y desventajas con respecto a otro tipo de aplicaciones (m&oacute;viles y de escritorio). A continuaci&oacute;n, se muestran algunas ventajas y desventajas de las aplicaciones web:</p>\r\n\r\n<p style=\"text-align:justify\">&nbsp;</p>\r\n\r\n<p style=\"text-align:justify\"><strong>Ventajas:</strong></p>\r\n\r\n<ul>\r\n	<li style=\"text-align:justify\"><u>Funcionan en la mayor&iacute;a de dispositivos:</u> como ya se mencion&oacute;, una Web App es capaz de ejecutarse en cualquier dispositivo que soporte una conexi&oacute;n a internet, por lo tanto, se puede acceder desde un celular (smartphone), Tablet o computadora.</li>\r\n	<li style=\"text-align:justify\"><u>El usuario no necesita actualizarlas:</u> las aplicaciones web son f&aacute;ciles de mantener, modificar o actualizar, por lo que el usuario no necesita actualizar la aplicaci&oacute;n o verse en la situaci&oacute;n de usar una versi&oacute;n antigua u obsoleta, esto da como resultado que los usuarios puedan ver todas las actualizaciones de manera instant&aacute;nea.</li>\r\n	<li style=\"text-align:justify\"><u>Las Apps Web no usan espacio:</u> Uno de los puntos m&aacute;s fuertes de una App Web es que al ejecutarse sobre un navegador la informaci&oacute;n del usuario no se guarda en su dispositivo, por lo que no importa cu&aacute;ntas Web Apps el visite, su almacenamiento no se ver&aacute; comprometido.</li>\r\n	<li style=\"text-align:justify\"><u>El desarrollo es mucho m&aacute;s barato:</u> A muchas personas les puede llegar a preocupar el tema econ&oacute;mico, sobre todo si lo que est&aacute;n buscando es desarrollar una aplicaci&oacute;n, si se tiene un presupuesto reducido, o no se quiere gastar mucho, las Web Apps son la soluci&oacute;n, ya que son m&aacute;s baratas de desarrollar en comparaci&oacute;n a una app nativa.</li>\r\n</ul>\r\n\r\n<p style=\"text-align:justify\">&nbsp;</p>\r\n\r\n<p style=\"text-align:justify\"><strong>Desventajas:</strong></p>\r\n\r\n<ul>\r\n	<li style=\"text-align:justify\"><u>No aprovechan en su totalidad las tecnolog&iacute;as del dispositivo:</u> Al usar una Web App desde una computadora de escritorio o laptop esto no tiene mucha relevancia, sin embargo, al entrar en el mundo de los dispositivos inteligentes esto cambia, ya que cuentan con mucha tecnolog&iacute;a que podr&iacute;a ser aprovechada para mejorar las interacciones con el usuario.</li>\r\n	<li style=\"text-align:justify\"><u>Requieren internet de manera obligatoria:</u> Como se mencion&oacute; anteriormente, las Apps Web, o por lo menos la gran mayor&iacute;a acceden a los servicios proporcionados por un datacenter por lo que es necesario que se cuente con una conexi&oacute;n de red activa y estable. (Vanadis, 2020)</li>\r\n</ul>', 9, 36, '2022-07-13 22:24:20', '2022-07-14 04:51:30'),
(17, 'Historia de PHP', '<p style=\"text-align:justify\">El lenguaje de programaci&oacute;n conocido como PHP tuvo su origen en el a&ntilde;o 1994 creado por Rasmus Lerdorf. La primera versi&oacute;n de PHP fue un complemento de lenguaje C llamado CGI por su acr&oacute;nimo &ldquo;Common Gateway Interface&rdquo; o Interfaz de Enlace Com&uacute;n. Este complemento era utilizado principalmente para registrar las visitas que Lerdorf recib&iacute;a a la hora que los visitantes buscaban su hoja de vida, por lo que el creador las llam&oacute; &ldquo;Personal Home Page Tools&rdquo; aunque tambi&eacute;n se le conoci&oacute; como &ldquo;PHP Tools&rdquo;.</p>\r\n\r\n<p style=\"text-align:justify\">&nbsp;</p>\r\n\r\n<p style=\"text-align:justify\">Posteriormente Rasmus quiso darle m&aacute;s funcionalidades a PHP y reescribi&oacute; parte del entonces &ldquo;PHP Tools&rdquo;, mejor&aacute;ndolo de modo que PHP proporcion&oacute; un entorno de trabajo donde los usuarios podr&iacute;an crear aplicaciones web de manera m&aacute;s sencilla. En junio de 1995, Rasmus liber&oacute; el c&oacute;digo fuente de PHP de modo que los usuarios que se dedicaban a la programaci&oacute;n pudieran utilizarlo como ellos quisieran, de modo que este tuvo mejoras por parte de la comunidad. (PHP: Historia de PHP - Manual, n.d.)</p>\r\n\r\n<p style=\"text-align:justify\">&nbsp;</p>\r\n\r\n<p style=\"text-align:justify\">Durante septiembre de 1995, Rasmus amplio PHP de modo que obtuvo variables similares a las de Perl, la interpretaci&oacute;n de variables de formulario y sintaxis de HTML y brevemente fue llamado &ldquo;FI&rdquo; o &ldquo;Interpretador de formularios&rdquo;. Los usuarios no recibieron de buen modo dichas variables, ya que FI deb&iacute;a funcionar utilizando comentarios HTML, porque deb&iacute;an embeber el c&oacute;digo dentro de este lenguaje, durante esta &eacute;poca todav&iacute;a no era un lenguaje de programaci&oacute;n. PHP sufri&oacute; cambios en octubre de 1995 cuando Rasmus present&oacute; una nueva versi&oacute;n del mismo, este tom&oacute; el nombre de &ldquo;Personal Home Page Construction KIT&rdquo;. Su estructura se asemejaba a C, de modo que los desarrolladores que trabajaron con C, Perl o sus similares no tuvieron mucho problema al trabajar con &eacute;l.</p>\r\n\r\n<p style=\"text-align:justify\">&nbsp;</p>\r\n\r\n<p style=\"text-align:justify\">En abril del a&ntilde;o 1996, Rasmus introdujo PHP/FI, cuyo c&oacute;digo fue escrito desde cero nuevamente, esta versi&oacute;n obtuvo soporte para las bases de datos DBM, MySQL y postgres95, y tambi&eacute;n m&aacute;s caracter&iacute;sticas como cookies, soportes para funciones hechas por los usuarios, entre otros. En junio, Rasmus lanz&oacute; la versi&oacute;n 2 de PHP/FI, pero solo existi&oacute; una versi&oacute;n completa y posteriormente en 1997, el motor de an&aacute;lisis subyacente sufr&iacute;a cambios grandes al ser escrito desde cero.</p>\r\n\r\n<p style=\"text-align:justify\">&nbsp;</p>\r\n\r\n<p>Durante 1998, PHP goz&oacute; de una popularidad grande puesto que muchos de los usuarios de todo el mundo comenzaron a utilizar PHP para sus propios proyectos. Netcraft realiz&oacute; una encuesta en la que indic&oacute; que alrededor de 60,000 dominios utilizaban PHP, puesto que muchos de los servidores que albergaban estos dominios ten&iacute;an instalado este lenguaje.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><strong>(ESPACIO PARA FIGURA)</strong></p>', 11, 37, '2022-07-13 22:26:07', '2022-07-14 04:51:30'),
(18, 'Versiones de PHP', '<p style=\"text-align:justify\">Las versiones de PHP, son las siguientes, asimismo se establece una breve descripci&oacute;n:</p>\r\n\r\n<p style=\"text-align:justify\">&nbsp;</p>\r\n\r\n<ul>\r\n	<li style=\"text-align:justify\"><u>PHP 3.0:</u> dada la ineficiencia de PHP 2.0 y su falta de caracter&iacute;sticas, dos estudiantes de Israel: Andi Gutmans y Zeev Suraski, comenzaron una nueva versi&oacute;n del analizador subyacente durante el a&ntilde;o 1997, los estudiantes se contactaron con Rasmus donde discutieron nuevas implementaciones a PHP, &eacute;stos se dedicaron al desarrollo de un nuevo e independiente lenguaje de programaci&oacute;n, este fue renombrado simplemente como &ldquo;PHP&rdquo;.&nbsp;PHP 3.0 destac&oacute; por su gran extensibilidad y de una interfaz madura para m&uacute;ltiples bases de datos, protocolos y APIs. PHP tambi&eacute;n incluye soporte para la programaci&oacute;n orientada a objetos. Durante 1998, se present&oacute; PHP 3.0 de manera oficial, muchos de los usuarios ya lo ten&iacute;an instalado y se registraron, dando como resultado 70,000 dominios alrededor del mundo. En ese mismo a&ntilde;o se registr&oacute; que aproximadamente el 10% de los servidores web de Internet ten&iacute;an instalado PHP.</li>\r\n	<li style=\"text-align:justify\"><u>PHP 4.0:</u> poco despu&eacute;s del lanzamiento de su versi&oacute;n 3.0, los estudiantes Andi Gutmans y Zeev Suraski comenzaron a trabajar en una nueva versi&oacute;n de PHP. Entre las implementaciones que discutieron <em>&ldquo;fueron mejorar la ejecuci&oacute;n de aplicaciones complejas y mejorar la modularidad del c&oacute;digo base de PHP&rdquo;</em>.&nbsp;PHP 4.0 funcionaria en un nuevo motor llamado &ldquo;Motor Zend&rdquo; que se introducir&iacute;a a mediados de 1999, en mayo del 2000 se lanz&oacute; la versi&oacute;n 4 de PHP, en donde se incluyeron caracter&iacute;sticas como el soporte para la mayor&iacute;a de servidores web, sesiones http, buffers de salida, formas seguras para controlar las entradas de usuarios y finalmente nuevas construcciones de lenguaje.&nbsp;(PHP: Historia de PHP - Manual, n.d.)</li>\r\n	<li style=\"text-align:justify\"><u>PHP 5.0:</u> PHP en su quinta iteraci&oacute;n fue lanzado en julio del 2004 despu&eacute;s de un largo desarrollo, este funcionaba bajo una segunda versi&oacute;n del motor Zend. Esta versi&oacute;n de PHP fue desarrollada por un grupo de desarrolladores y personas que utilizan PHP para dar soporte a esta herramienta, se estima que esta versi&oacute;n fue instalada entre 10 a 100 millones de dominios alrededor del mundo.</li>\r\n	<li style=\"text-align:justify\"><u>PHP 7.0:</u> La versi&oacute;n 7 de PHP lleg&oacute; en reemplazo de la versi&oacute;n 5, dado a contratiempos que existieron con la versi&oacute;n 6. Se desech&oacute; la idea de realizar una sexta versi&oacute;n y se pas&oacute; a la s&eacute;ptima versi&oacute;n de PHP. Esta herramienta en esta versi&oacute;n es la que se utiliza hoy d&iacute;a dado sus notables mejoras en rendimiento y la facilidad del lenguaje en comparaci&oacute;n a otros. PHP cuenta con una gran cantidad de librer&iacute;as y software que no tiende a fallar bajo la versi&oacute;n actual. (desarrolloweb.com, 2016)</li>\r\n</ul>', 12, 37, '2022-07-13 22:26:07', '2022-07-15 07:17:11'),
(19, 'Ventajas de PHP', '<p style=\"text-align:justify\">Conociendo la historia de PHP y dado su extenso uso alrededor del mundo, es necesario mencionar la importancia de PHP para aplicativos web, por lo que las ventajas seg&uacute;n Ivan de Souza son:</p>\r\n\r\n<p style=\"text-align:justify\">&nbsp;</p>\r\n\r\n<ul>\r\n	<li style=\"text-align:justify\"><u>Aprendizaje intuitivo:</u> PHP es un lenguaje f&aacute;cil de aprender, por su extensa comunidad y el soporte que este tiene. Al ser un lenguaje de c&oacute;digo abierto se tiene mucho material, con el que se puede trabajar para obtener conocimiento y dominio. Cabe mencionar que este posee una sintaxis sencilla y no tan compleja como puede ser un lenguaje C o sus derivados.</li>\r\n	<li style=\"text-align:justify\"><u>C&oacute;digo abierto:</u> PHP es un lenguaje que cualquier persona puede utilizar para sus proyectos ya que no genera ning&uacute;n costo, asimismo, se pueden reportar bugs a la comunidad y realizar soluciones para los mismos, en caso que el desarrollador lo desee, ya que este lenguaje es de c&oacute;digo abierto.</li>\r\n	<li style=\"text-align:justify\"><u>Gran cantidad de datos:</u> PHP al estar optimizado y trabajar con el mejor rendimiento, es una opci&oacute;n muy utilizada para aplicaciones web.</li>\r\n	<li style=\"text-align:justify\"><u>Compatibilidad con diversas bases de datos:</u> En toda aplicaci&oacute;n web es necesario que se cuente con una conexi&oacute;n a base de datos, por lo que PHP agiliza este proceso dado a la compatibilidad que este provee con la mayor&iacute;a de bases de datos relacionales o bases de datos SQL. Por lo tanto, el lenguaje es compatible con:\r\n	<ul style=\"list-style-type:circle\">\r\n		<li style=\"text-align:justify\">Oracle</li>\r\n		<li style=\"text-align:justify\">MySQL</li>\r\n		<li style=\"text-align:justify\">Interbase</li>\r\n		<li style=\"text-align:justify\">SQLite</li>\r\n		<li style=\"text-align:justify\">Sybase</li>\r\n	</ul>\r\n	</li>\r\n</ul>\r\n\r\n<p style=\"text-align:justify\">(Rock Content - ES, 2020)</p>', 13, 37, '2022-07-13 22:26:07', '2022-07-15 07:17:11'),
(20, 'Desventajas de PHP', '<p style=\"text-align:justify\">PHP tambi&eacute;n cuenta con sus respectivas desventajas, lo cual no hace que la creaci&oacute;n de aplicaciones con dicho lenguaje sea un problema, sino m&aacute;s bien que PHP no cumple con ciertas necesidades espec&iacute;ficas seg&uacute;n el tipo de aplicaci&oacute;n a desarrollar. Algunas de las desventajas que tiene son:</p>\r\n\r\n<p style=\"text-align:justify\">&nbsp;</p>\r\n\r\n<ul>\r\n	<li style=\"text-align:justify\"><u>Uso de un servidor web:</u> para la ejecuci&oacute;n del software mediante internet es necesario de un hosting, ya sea gratuito o de paga, que permita la ejecuci&oacute;n del sitio web. &nbsp;(Bloguero Pro, 2020)</li>\r\n	<li style=\"text-align:justify\"><u>Accesibilidad de sitios web:</u> existe la posibilidad que, en algunos navegadores, no se cumpla con algunas funcionalidades, dificultando su posicionamiento. (Mina &amp; Cede&ntilde;o, 2018)</li>\r\n	<li style=\"text-align:justify\"><u>El c&oacute;digo fuente no se oculta de manera eficiente:</u> un gran inconveniente que posee PHP es que el c&oacute;digo no se puede ocultar eficientemente, debido a los m&eacute;todos que se utilizan para lograr dicho objetivo, como es el caso de la ofuscaci&oacute;n, lo cual es una t&eacute;cnica que permite que el c&oacute;digo fuente sea dif&iacute;cil de leer, lo cual se ve afectado en sus tiempos de ejecuci&oacute;n. (Tapia, 2018)</li>\r\n</ul>', 14, 37, '2022-07-13 22:26:07', '2022-07-15 07:17:11'),
(21, 'Características de PHPWord', '<p style=\"text-align:justify\">La librer&iacute;a permite la configuraci&oacute;n de diversos lineamientos a la hora de la creaci&oacute;n de documentos, a continuaci&oacute;n, se muestran las principales caracter&iacute;sticas que PHPWord permite configurar:</p>\r\n\r\n<p style=\"text-align:justify\">&nbsp;</p>\r\n\r\n<ul>\r\n	<li style=\"text-align:justify\">Propiedades del documento (t&iacute;tulo, tema y creador).</li>\r\n	<li style=\"text-align:justify\">Creaci&oacute;n de secciones en el documento con diferentes configuraciones (vertical/horizontal, tama&ntilde;o de p&aacute;gina y numeraci&oacute;n de p&aacute;ginas).</li>\r\n	<li style=\"text-align:justify\">Establecer estilos de p&aacute;rrafos predeterminados (tipo de fuente y tama&ntilde;o).</li>\r\n	<li style=\"text-align:justify\">Creaci&oacute;n de encabezado y pie de p&aacute;gina por secci&oacute;n.</li>\r\n	<li style=\"text-align:justify\">Se utilizan fuentes/caracteres UTF-8 y de Asia oriental.</li>\r\n	<li style=\"text-align:justify\">Estilos de fuentes personalizados (negrita, cursiva, color) y estilos de p&aacute;rrafos (centrado, varias columnas y espaciado).</li>\r\n	<li style=\"text-align:justify\">Inserci&oacute;n de p&aacute;rrafos, ya sea como un texto simple o complejo (texto corrido) que contiene otros elementos.</li>\r\n	<li style=\"text-align:justify\">Inserci&oacute;n de t&iacute;tulos (encabezados) y tabla de contenido (&iacute;ndice).</li>\r\n	<li style=\"text-align:justify\">Inserci&oacute;n de saltos de texto y p&aacute;gina.</li>\r\n	<li style=\"text-align:justify\">Inserci&oacute;n de texto de derecha a izquierda.</li>\r\n	<li style=\"text-align:justify\">Inserci&oacute;n y formato de im&aacute;genes, ya sea de forma local, remota o como marca de agua de p&aacute;gina.</li>\r\n	<li style=\"text-align:justify\">Inserci&oacute;n y formato de tablas con propiedades personalizadas para cada fila (p. ej., repetir como fila de encabezado) y celdas (p. ej., color de fondo, rango de filas, rango de columnas).</li>\r\n	<li style=\"text-align:justify\">Inserci&oacute;n de elementos de lista como vi&ntilde;etas, numerados o de varios niveles.</li>\r\n	<li style=\"text-align:justify\">Inserci&oacute;n de hiperv&iacute;nculos.</li>\r\n	<li style=\"text-align:justify\">Inserci&oacute;n de nota al pie y notas al final.</li>\r\n	<li style=\"text-align:justify\">Inserci&oacute;n de formas de dibujo (arco, curva, l&iacute;nea, polil&iacute;nea, rect&aacute;ngulo y &oacute;valo).</li>\r\n	<li style=\"text-align:justify\">Inserci&oacute;n de gr&aacute;ficos (circulares, de anillos, de barras, de l&iacute;neas, de &aacute;reas, de dispersi&oacute;n y de radar).</li>\r\n	<li style=\"text-align:justify\">Inserci&oacute;n de comentarios.</li>\r\n	<li style=\"text-align:justify\">Creaci&oacute;n de documentos a partir de plantillas. (PHPWord, n.d.)</li>\r\n</ul>', 16, 38, '2022-07-13 22:33:23', '2022-07-15 07:17:11'),
(22, 'Historia de Laravel', '<p style=\"text-align:justify\">Antes de la creaci&oacute;n de Laravel, la comunidad de PHP estaba llena de otros frameworks que compet&iacute;an entre s&iacute;, donde los desarrolladores debat&iacute;an cual framework utilizar y en cual se desempe&ntilde;an mejor en cada &aacute;rea.</p>\r\n\r\n<p style=\"text-align:justify\">&nbsp;</p>\r\n\r\n<p style=\"text-align:justify\">Taylor Otwell era un desarrollador de .NET en Arkansas, EE.UU. En el momento que utilizaba el framework de Codeigniter, Otwell se puso a pensar en todas las caracter&iacute;sticas que podr&iacute;a agregar, pero eso implicaba modificar el c&oacute;digo interno del framework y eso le tomar&iacute;a tiempo. Otwell deseaba algo m&aacute;s simple y m&aacute;s flexible, por lo que con esta idea naci&oacute; lo que hoy se conoce como Laravel.</p>\r\n\r\n<p style=\"text-align:justify\">&nbsp;</p>\r\n\r\n<p style=\"text-align:justify\">PHP es un lenguaje din&aacute;micamente tipado, lo cual implica que las cosas podr&iacute;an ir mal sin dar ninguna advertencia, pero en otros lenguajes de programaci&oacute;n se observa que estos si se encargan de compilar el c&oacute;digo, revisar errores en &eacute;l y finalmente notificar el error que necesita ser arreglado, por lo que Otwell procuro arreglar este tipo de problemas cuando estuvo creando Laravel. El creador finalmente se bas&oacute; en la infraestructura que utilizan las tecnolog&iacute;as de Microsoft en su lenguaje .NET. (O&#39;Brien, 2016)</p>', 18, 39, '2022-07-13 22:33:23', '2022-07-15 07:17:11');
INSERT INTO `subcontenido_seccion_capitulo` (`id`, `subtema`, `contenido`, `orden_subcontenido`, `contenido_seccion_capitulo_id`, `created_at`, `updated_at`) VALUES
(23, 'Versiones de Laravel', '<p style=\"text-align:justify\">Otwell inicialmente cre&oacute; Laravel y este fue evolucionando a sus diferentes versiones, a continuaci&oacute;n, mencionaremos las m&aacute;s relevantes:</p>\r\n\r\n<p style=\"text-align:justify\">&nbsp;</p>\r\n\r\n<ul>\r\n	<li style=\"text-align:justify\"><u>Laravel 1:</u> Laravel fue lanzado el 9 de junio de 2011, como una primera beta para posteriormente ser lanzado como Laravel Versi&oacute;n 1, en el mes siguiente. Esta versi&oacute;n incluye la autenticaci&oacute;n, el ORM eloquent, cacheo de datos, sesiones, vistas y una extensibilidad entre m&oacute;dulos y librer&iacute;as.</li>\r\n	<li style=\"text-align:justify\"><u>Laravel 2:</u> La versi&oacute;n 2 fue lanzada el 24 de noviembre de 2011, donde se solucionaron muchos problemas presentados en la versi&oacute;n 1. Con esta versi&oacute;n ya se pod&iacute;a emplear el patr&oacute;n MVC puro, as&iacute; como la incorporaci&oacute;n del sistema de plantillas &ldquo;Blade&rdquo;. Lamentablemente se perdi&oacute; el soporte a m&oacute;dulos creados por terceros durante esta versi&oacute;n.</li>\r\n	<li style=\"text-align:justify\"><u>Laravel 3:</u> Esta versi&oacute;n fue lanzada el 22 de febrero del 2012, donde esta versi&oacute;n incluye el sistema de l&iacute;nea de comandos &ldquo;Artisan&rdquo;, la migraci&oacute;n de la base de datos, controladores de sesiones y de base de datos.</li>\r\n	<li style=\"text-align:justify\"><u>Laravel 4:</u> Lanzada el 28 de mayo del 2013, en esta versi&oacute;n se incluyeron componentes integrados unos con otros donde eran manejados por el sistema de dependencias &ldquo;Composer&rdquo;. Esta versi&oacute;n tambi&eacute;n incluye la poblaci&oacute;n de base de datos, &ldquo;scopes&rdquo; para el ORM eloquent y borrados suaves.</li>\r\n	<li style=\"text-align:justify\"><u>Laravel 5:</u> Lanzado en febrero del 2015, esta versi&oacute;n incluye la agenda para la ejecuci&oacute;n de tareas por medio del paquete &ldquo;Scheduler&rdquo;, simplificar la autenticaci&oacute;n por medio del paquete &ldquo;Socialite&rdquo; y, por &uacute;ltimo, el directorio en forma de &aacute;rbol para aplicaci&oacute;n en desarrollo. Posteriormente se lanzaron las versiones 5.1, 5.2, 5.3, 5.4, 5.6, 5.7 y 5.8, en el periodo de junio del 2015 a septiembre del 2018, en estas versiones se incluyeron nuevas funcionalidades que beneficiaron a los programadores para mejorar las aplicaciones a desarrollar.</li>\r\n	<li style=\"text-align:justify\"><u>Laravel 6:</u> Lanzado el 3 de septiembre del 2019, donde se implement&oacute; el versionamiento sem&aacute;ntico, compatibilidad con &ldquo;Laravel Vapor&rdquo;, mejoras al sistema de autorizaci&oacute;n y sus respuestas, inclusi&oacute;n de middlewares, colecciones, mejoras a los subcomandos de bases de datos y soluci&oacute;n a diversos bugs.</li>\r\n	<li style=\"text-align:justify\"><u>Laravel 7:</u> Lanzado el 3 de marzo del 2020, donde se implement&oacute; &ldquo;Laravel Sanctum&rdquo;, dando mejoras de velocidad al sistema de rutas, componentes de etiquetas de Blade, operaciones fluidas para cadenas de caracteres, cliente dedicado a HTTP, mejoras a las capas del modelo de rutas, mejoras a la espera para la base de datos, diversos controladores para correos electr&oacute;nicos, un nuevo comando llamado &ldquo;artisan test&rdquo; y soluci&oacute;n a diversos bugs.</li>\r\n	<li style=\"text-align:justify\"><u>Laravel 8:</u> Lanzado el 8 de septiembre del 2020, donde se implement&oacute;: &ldquo;Laravel Jetstream&rdquo;, el modelo de clases &ldquo;factory&rdquo;, componentes din&aacute;micos para &ldquo;Blade&rdquo;, &ldquo;helpers para el testeo de tiempo, mejoras al comando &ldquo;artisan serve&rdquo;, mejoras al escuchador de eventos y soluci&oacute;n a diversos bugs. (www.javatpoint.com, n.d.)</li>\r\n	<li style=\"text-align:justify\"><u>Laravel 9:</u> Lanzado el 8 de febrero del 2022, donde se mejor&oacute; el mantenimiento dado por la comunidad a Laravel. Se introdujo el soporte para pruebas en paralelo, mejoras al cliente HTTP y nuevas relaciones para el sistema Eloquent. (Laravel, 2022)</li>\r\n</ul>\r\n\r\n<p style=\"text-align:justify\">&nbsp;</p>\r\n\r\n<p style=\"text-align:justify\">Como anteriormente se defini&oacute;, Laravel ha tenido reestructuraciones, ofreciendo nuevas versiones a sus usuarios, por lo que Laravel ha tenido un gran crecimiento y ha formado una comunidad grande donde la misma se encarga de dar soporte y montar conferencias alrededor del mundo. Laracon US y EU son las conferencias oficiales de Laravel, en la primera se tuvo un registro de 70 participantes en 2013, 500 en 2015 y 2016, mostrando c&oacute;mo la comunidad ha crecido al igual que Laravel. (O&#39;Brien, 2016)</p>', 19, 39, '2022-07-13 22:33:23', '2022-07-15 07:17:11'),
(24, 'Funcionamiento de Laravel', '<p style=\"text-align:justify\">Laravel tiene como objetivo ser un framework que permita la creaci&oacute;n de aplicaci&oacute;n web ofreciendo una forma sencilla de crear c&oacute;digo y el uso de m&uacute;ltiples frameworks para aprovechar las caracter&iacute;sticas de PHP. Laravel est&aacute; compuesto por dependencias del framework Symfony, lo que significa que Laravel se desarrollar&aacute; al igual que este. (Otwell, 2013)</p>\r\n\r\n<p style=\"text-align:justify\">&nbsp;</p>\r\n\r\n<p style=\"text-align:justify\">Con Laravel se puede hacer uso del patr&oacute;n MVC (Modelo-Vista-Controlador), dado a c&oacute;mo funciona para la creaci&oacute;n de aplicaciones web, el patr&oacute;n MVC se encarga de organizar y estructurar los componentes de una pieza de software de modo que puedan interactuar entre ellos. A continuaci&oacute;n, podemos observar una representaci&oacute;n gr&aacute;fica de los componentes, como a su vez su explicaci&oacute;n:</p>\r\n\r\n<p style=\"text-align:justify\">&nbsp;</p>\r\n\r\n<p style=\"text-align:justify\"><strong>(Espacio para figura)</strong></p>\r\n\r\n<p style=\"text-align:justify\">&nbsp;</p>\r\n\r\n<ul>\r\n	<li style=\"text-align:justify\"><u>Modelo:</u> Conocida como la capa &ldquo;Modelo&rdquo;, se representan como entidades que se encargaran de almacenar la informaci&oacute;n. Usualmente se usan DTOs (Objetos de Transferencia de Datos) que sirven para guardar la informaci&oacute;n en la base de datos, o para consumir informaci&oacute;n de otros sistemas. Laravel utiliza un mapeo de datos llamado Eloquent ORM, que nos permite crear modelos de una manera m&aacute;s f&aacute;cil, pero siempre se puede utilizar el esquema tradicional de modelos que contiene un patr&oacute;n MVC.</li>\r\n	<li style=\"text-align:justify\"><u>Vista:</u> La capa de &ldquo;Vista&rdquo; se encarga de generar lo que el usuario puede observar en la aplicaci&oacute;n, es decir, las pantallas, p&aacute;ginas o cualquier tipo de interfaz con el que el usuario puede interactuar. La vista tambi&eacute;n se encarga de proveer una representaci&oacute;n del estado del modelo, dependiendo las acciones del modelo. Laravel contiene un sistema de plantillas llamadas Blade, este sistema ayuda a que el c&oacute;digo se vea mejor organizado en las vistas e incluye un sistema de cach&eacute; que hace m&aacute;s r&aacute;pido a este sistema.</li>\r\n	<li style=\"text-align:justify\"><u>Controlador:</u> La capa del &ldquo;Controlador&rdquo; se encarga de ser un intermediario entre el sistema y el usuario. Esta capa se encarga de capturar las interacciones o peticiones que el usuario haga sobre la vista, consultar con el modelo y arrojar un resultado al usuario siempre en la capa de la vista. Se entiende que la capa del controlador es la que coordina la interacci&oacute;n que existe entre la vista y el modelo. Laravel tiene un apartado para la escritura de controladores y estos deben extenderse de la clase &lsquo;BaseController&rdquo;, el cual viene incluido a la hora de generar un proyecto. (Conztanzo, 2020)</li>\r\n</ul>', 20, 39, '2022-07-13 22:33:23', '2022-07-15 07:20:02'),
(25, 'Características de Laravel', '<p style=\"text-align:justify\">Laravel es un framework bastante completo en cuesti&oacute;n de creaci&oacute;n de aplicaciones web, ya que cuenta con un paquete de CLI (Interfaz de L&iacute;nea de Comando) en el cual hace uso de su herramienta llamada Artisan, ayudando en la construcci&oacute;n de los aplicativos, est&aacute; entre otras caracter&iacute;sticas se mencionan a continuaci&oacute;n:</p>\r\n\r\n<p style=\"text-align:justify\">&nbsp;</p>\r\n\r\n<ul>\r\n	<li style=\"text-align:justify\">Reducci&oacute;n de costos, tiempos en el desarrollo y mantenimiento del mismo al ser de c&oacute;digo abierto.</li>\r\n	<li style=\"text-align:justify\">Curva de aprendizaje baja en comparaci&oacute;n con otros frameworks de PHP.</li>\r\n	<li style=\"text-align:justify\">Existe una diversidad de contenido y documentaci&oacute;n sobre Laravel.</li>\r\n	<li style=\"text-align:justify\">Cuenta con una comunidad grande y extensa, lo cual colabora en su constante construcci&oacute;n.</li>\r\n	<li style=\"text-align:justify\">Laravel incluye caracter&iacute;sticas que ayudan para el &ldquo;testing&rdquo; del c&oacute;digo o producto en desarrollo.</li>\r\n	<li style=\"text-align:justify\">Laravel posee: un ORM (Mapeo Objeto-Relacional) y un generador de &ldquo;queries&rdquo;, comandos utilizados para bases de datos, que facilita la interacci&oacute;n con la base de datos.</li>\r\n	<li style=\"text-align:justify\">Constructor de Esquemas o &ldquo;Schema Builder&rdquo; que ayuda al seguimiento de cambios y permite realizar migraciones al ocurrir un cambio en la base de datos.</li>\r\n	<li style=\"text-align:justify\">Incluye una librer&iacute;a que permite el env&iacute;o de correos incluyendo archivos adjuntos.</li>\r\n	<li style=\"text-align:justify\">Laravel incluye una librer&iacute;a para la autenticaci&oacute;n de usuarios. Permite el registro de usuarios, la recuperaci&oacute;n de contrase&ntilde;as y el ingreso de usuarios.</li>\r\n	<li style=\"text-align:justify\">Laravel contiene una librer&iacute;a llamada &ldquo;Redis&rdquo; que permite el ingreso a una sesi&oacute;n ya existente y el uso del cach&eacute; de datos. Por ejemplo: cerrar el navegador con la sesi&oacute;n iniciada, abrir nuevamente el navegador y seguir conectado a la misma sesi&oacute;n. (TutorialsPoint, n.d.)</li>\r\n</ul>', 21, 39, '2022-07-13 22:33:23', '2022-07-15 07:17:11'),
(26, '¿Qué es CKEditor?', '<p style=\"text-align:justify\">CKEditor es un editor de texto programado en lenguaje JavaScript con estructura modular, la cual tiene una interfaz amigable y limpia, por lo que brinda caracter&iacute;sticas que ayudan a tener una buena experiencia de usuario y, adem&aacute;s, esta herramienta es perfecta para la creaci&oacute;n de contenido sem&aacute;ntico. (CKEditor Ecosystem, n.d.)</p>\r\n\r\n<p style=\"text-align:justify\">&nbsp;</p>\r\n\r\n<p style=\"text-align:justify\">La versi&oacute;n 5 de CKEditor brinda toda clase de soluciones, que van desde editores similares a Google Docs y Medium, hasta aplicaciones similares a Slack o Twitter, lo cual es posible dentro de la misma herramienta de edici&oacute;n.</p>', 24, 41, '2022-07-13 22:58:20', '2022-07-15 07:17:11'),
(27, 'Características del editor de texto', '<p style=\"text-align:justify\">Como se hace menci&oacute;n en la documentaci&oacute;n oficial de CKEditor 5, el editor de texto ofrece distintas funcionalidades o caracter&iacute;sticas enriquecido en WYSIWYG (What you see is what you get, en espa&ntilde;ol, lo que ves es lo que obtienes), lo cual se puede definir como, un editor de texto que le permite al desarrollador o usuario poder ver el resultado final mientras se crea el documento o interfaz. Algunas de las funcionalidades que posee el editor de texto, seg&uacute;n la documentaci&oacute;n oficial de CKEditor 5 son (CKEditor Ecosystem, n.d.):</p>\r\n\r\n<p style=\"text-align:justify\">&nbsp;</p>\r\n\r\n<ul>\r\n	<li style=\"text-align:justify\"><u>Autoformato:</u> se puede formatear el texto en MarkDown o de forma personalizada, esto gracias al formato autom&aacute;tico, ya que se puede agregar letra en negrita, encabezados, c&oacute;digo en l&iacute;nea, bloque de c&oacute;digo y listas con vi&ntilde;etas.</li>\r\n	<li style=\"text-align:justify\"><u>Menci&oacute;n:</u> tiene la funci&oacute;n de autocompletar el texto mientras el usuario escribe, esto es posible gracias a marcadores preconfigurados, como @ o #, recibiendo as&iacute; sugerencias autom&aacute;ticas para autocompletar, nombres, grupos, temas y mucho m&aacute;s.</li>\r\n	<li style=\"text-align:justify\"><u>Guardado autom&aacute;tico:</u> permite guardar los datos de forma autom&aacute;tica cuando sea necesario, asimismo, no permite que el usuario salga antes de que se guarde el contenido o se realice acciones pendientes.</li>\r\n	<li style=\"text-align:justify\"><u>Transformaci&oacute;n autom&aacute;tica de texto:</u> a esta funcionalidad tambi&eacute;n se le conoce como &ldquo;Autocorrecci&oacute;n&rdquo;, dicha caracter&iacute;stica convierte fragmentos predefinidos de caracteres o s&iacute;mbolos especiales, como, por ejemplo: cuando se quiere escribir &trade; o &frac12; se vuelve una tarea f&aacute;cil al escribir (TM) o 1/2 en el editor de texto.</li>\r\n	<li style=\"text-align:justify\"><u>Edici&oacute;n restringida:</u> se puede restringir el acceso a la edici&oacute;n de partes del documento. Dicha funcionalidad es muy &uacute;til a la hora de llenar plantillas y, solo es necesario rellenar ciertos campos.</li>\r\n	<li style=\"text-align:justify\"><u>Enlace autom&aacute;tico:</u> esta funci&oacute;n permite que los enlaces de texto sin formato se conviertan en hiperv&iacute;nculos de forma autom&aacute;tica.<u> </u></li>\r\n	<li style=\"text-align:justify\"><u>Revisi&oacute;n ortogr&aacute;fica y gramatical:</u> el editor de texto, permite la revisi&oacute;n de errores gramaticales u ortogr&aacute;ficos mientras se escribe, pasando el cursor sobre las palabras subrayadas en rojo para ver las posibles sugerencias de correcci&oacute;n.</li>\r\n	<li style=\"text-align:justify\"><u>Inserci&oacute;n de im&aacute;genes pegando URL:</u> esta funcionalidad permite cargar im&aacute;genes simplemente pegando la URL de la imagen en el editor.<u> </u></li>\r\n	<li style=\"text-align:justify\"><u>Atajos de teclado:</u> en el editor de texto se tienen diversos atajos muy intuitivos, lo cual mejora la experiencia del usuario a la hora de escribir, como, por ejemplo: Ctrl + B es negrita o Ctrl + Z es deshacer.</li>\r\n	<li style=\"text-align:justify\"><u>Recuento de palabras:</u> esta caracter&iacute;stica realiza un seguimiento del n&uacute;mero de palabras y caracteres en su contenido, asimismo, se puede establecer un l&iacute;mite de palabras.</li>\r\n</ul>', 25, 41, '2022-07-13 22:58:20', '2022-07-15 07:17:11'),
(28, '¿Qué es MySQL?', '<p style=\"text-align:justify\">MySQL es un gestor de bases de datos basado en el lenguaje relacional SQL. Este guarda la informaci&oacute;n en tablas estructuradas en forma de filas y columnas. Los usuarios pueden definir, manipular, controlar y comandar la informaci&oacute;n utilizando SQL. El origen del porqu&eacute; es llamado &ldquo;MySQL&rdquo;, es porque el creador, Michael Widenius, tom&oacute; parte del nombre de su hija y lo combin&oacute; con &ldquo;SQL&rdquo; para formar as&iacute; su nombre.</p>\r\n\r\n<p style=\"text-align:justify\">&nbsp;</p>\r\n\r\n<p style=\"text-align:justify\">MySQL es uno de los gestores m&aacute;s populares en el mundo, dado que se ocupa en combinaci&oacute;n con servicios como Apache web server, el cual es un sistema basado en Linux y PHP. Con esta combinaci&oacute;n es posible guardar y extraer informaci&oacute;n de aplicaciones, sitios web y de servicios. (DigitalOcean, n.d.)</p>', 27, 42, '2022-07-13 22:58:20', '2022-07-15 07:17:11'),
(29, 'Historia de MySQL', '<p style=\"text-align:justify\">Durante 1979, Michael Widenius trabajaba para su compa&ntilde;&iacute;a llamada TcX, fundada tanto por el, c&oacute;mo por David Axmark y Allan Larsson, donde Michael cre&oacute; una herramienta escrita en BASIC que era capaz de correr en una computadora de 4 Mhz con 16kb de memoria RAM. Esta herramienta fue reescrita en lenguaje C y migrada al sistema operativo Unix, el cual funcionaba como un motor de bajo nivel para almacenamiento que se encargaba de dar reportes por medio de su interfaz gr&aacute;fica, esta herramienta llevaba el nombre de &ldquo;Unireg&rdquo;.</p>\r\n\r\n<p style=\"text-align:justify\">&nbsp;</p>\r\n\r\n<p style=\"text-align:justify\">En la d&eacute;cada de los 90 &#39;s, los clientes de TcX exigen una pieza de software basada en SQL para el almacenamiento de su informaci&oacute;n, dando como resultado que Widenius no le convenci&oacute; la velocidad del programa, as&iacute; que tom&oacute; prestado el c&oacute;digo del programa MySQL e integr&oacute; partes de &eacute;l, en conjunto con el c&oacute;digo de Unireg, pero este experimento no funcion&oacute; como esperaba y Widenus, tom&oacute; la decisi&oacute;n de escribirlo &eacute;l mismo. (O&#39;REILLY, n.d.)</p>\r\n\r\n<p style=\"text-align:justify\">&nbsp;</p>\r\n\r\n<p style=\"text-align:justify\">En el a&ntilde;o 1995, Widenius en compa&ntilde;&iacute;a de David Axamark y Allan Larsson desarrollaron MySQL. El prop&oacute;sito principal era proveer opciones de manejo de informaci&oacute;n de una manera eficiente y confiable a los usuarios profesionales y comunes. (Rieuf, 2016)</p>\r\n\r\n<p style=\"text-align:justify\">&nbsp;</p>\r\n\r\n<p style=\"text-align:justify\">En 1996 se lanz&oacute; la primera versi&oacute;n de MySQL a un grupo limitado, seguido de un lanzamiento al p&uacute;blico en octubre del mismo a&ntilde;o. La versi&oacute;n 3.11.1 ten&iacute;a solamente una &uacute;nica distribuci&oacute;n binaria para el sistema Solaris, posteriormente en el mes siguiente se lanz&oacute; para el sistema operativo Linux. Dos a&ntilde;os despu&eacute;s MySQL fue adaptado para funcionar en otros sistemas operativos.</p>\r\n\r\n<p style=\"text-align:justify\">&nbsp;</p>\r\n\r\n<p style=\"text-align:justify\">Continuando con la historia, luego se lanz&oacute; con una licencia especial donde se permite su uso comercial y tambi&eacute;n se lanzaron otros tipos de licencia para vender el producto junto con el sistema operativo. Con esta estrategia se pudo continuar el desarrollo de MySQL dado que el programa se vend&iacute;a muy bien a pesar de que el objetivo principal de MySQL ya hab&iacute;a sido completado.</p>\r\n\r\n<p style=\"text-align:justify\">&nbsp;</p>\r\n\r\n<p style=\"text-align:justify\">MySQL fue desarrollado a su versi&oacute;n 3.22 donde soportaba buena parte del lenguaje SQL. Este programa era muy r&aacute;pido y bastante estable, desgraciadamente el programa segu&iacute;a siendo imperfecto dado que todav&iacute;a no ten&iacute;a soporte para transacciones, subcomandos, llaves for&aacute;neas, procedimientos almacenados y vistas de la informaci&oacute;n. (O&#39;REILLY, n.d.)</p>\r\n\r\n<p style=\"text-align:justify\">&nbsp;</p>\r\n\r\n<p style=\"text-align:justify\">Originalmente el proyecto pertenec&iacute;a a la compa&ntilde;&iacute;a antes mencionada, pero en el a&ntilde;o 2000 se tom&oacute; la decisi&oacute;n de volverlo de c&oacute;digo abierto y este sigui&oacute; los t&eacute;rminos de la licencia GPL (Licencia P&uacute;blica General) para llegar a ser un software de c&oacute;digo abierto. Esto gener&oacute; p&eacute;rdidas al inicio, pero eventualmente pudieron generar ganancias de todas formas con esta estrategia, dado a las contribuciones de desarrolladores terceros.</p>\r\n\r\n<p style=\"text-align:justify\">&nbsp;</p>\r\n\r\n<p style=\"text-align:justify\">En el a&ntilde;o 2001, MySQL empez&oacute; a ganar la popularidad que la empresa busco en un inicio, que la plataforma fuera utilizada por usuarios comunes y profesionales. El boom fue de tal forma que se tuvieron 2 millones de instalaciones activas. Ese mismo a&ntilde;o durante el mes de junio, la Compa&ntilde;&iacute;a MySQL AB tuvo su primer caso donde fue demandada por la compa&ntilde;&iacute;a NuSphere en Boston, Estados Unidos, los cargos imputados fueron la violaci&oacute;n de contratos de terceros y competencia injusta. (Rieuf, 2016)</p>\r\n\r\n<p style=\"text-align:justify\">&nbsp;</p>\r\n\r\n<p style=\"text-align:justify\">Durante este mismo periodo, Heikki Tuuri se acerc&oacute; a MySQL AB, anteriormente TcX, donde propuso integrar su motor de almacenamiento &ldquo;InnoDB&rdquo;, el cual era capaz de realizar transacciones y bloques de bajo nivel, con esta integraci&oacute;n realizada, MySQL pas&oacute; a su versi&oacute;n 4 con una alpha lanzada en octubre del 2001. (O&#39;REILLY, n.d.)</p>\r\n\r\n<p style=\"text-align:justify\">&nbsp;</p>\r\n\r\n<p style=\"text-align:justify\">En 2002, MySQL AB demand&oacute; a NuSphere por derechos de autor e infringimiento de la marca. Posteriormente las compa&ntilde;&iacute;as llegaron a un acuerdo mutuo en febrero del mismo a&ntilde;o. En este mismo a&ntilde;o, la versi&oacute;n 4 llev&oacute; a MySQL a otro nivel y su versi&oacute;n estable fue lanzada en 2003. MySQL AB se expandi&oacute; y abri&oacute; una sede en los Estados Unidos en adici&oacute;n a la que ya pose&iacute;an en Suecia. Tambi&eacute;n, ese mismo a&ntilde;o anunciaron que la plataforma ten&iacute;a alrededor de 3 millones de usuarios con una ganancia de 6.5 millones de d&oacute;lares. (Rieuf, 2016)</p>\r\n\r\n<p style=\"text-align:justify\">&nbsp;</p>\r\n\r\n<p style=\"text-align:justify\">En abril del 2003 se lanza la alpha de la versi&oacute;n 4.1 y su beta en junio del 2004, tuvo un gran n&uacute;mero de mejoras, entre estas est&aacute;n: mejoras significativas para sub comandos, soporte para indexado espacial, soporte para Unicode, cambios al protocolo cliente-servidor y se reforz&oacute; la seguridad ante ataques.</p>\r\n\r\n<p style=\"text-align:justify\">&nbsp;</p>\r\n\r\n<p style=\"text-align:justify\">En octubre de 2005, Oracle Corporation adquiri&oacute; Innobase OY, que era la compa&ntilde;&iacute;a creadora del motor InnoDB. Este motor era una de las bases de MySQL, ya que le permit&iacute;a realizar transacciones y llaves for&aacute;neas. Dado que Oracle se hizo con esta compa&ntilde;&iacute;a, entrar&iacute;a en conflictos legales con MySQL por el uso de este motor y propuso a MySQL AB realizar nuevos contratos para continuar el uso de este motor por la compa&ntilde;&iacute;a creadora de MySQL.&nbsp; En este mismo periodo, se lanz&oacute; la versi&oacute;n 5 de MySQL y en noviembre del mismo a&ntilde;o se lanza la alpha de la versi&oacute;n 5.1 del mismo. Esta versi&oacute;n agreg&oacute; muchas mejoras, como se menciona a continuaci&oacute;n:</p>\r\n\r\n<p style=\"text-align:justify\">&nbsp;</p>\r\n\r\n<ul>\r\n	<li style=\"text-align:justify\">Partici&oacute;n de tablas.</li>\r\n	<li style=\"text-align:justify\">Replicaci&oacute;n basada en filas.</li>\r\n	<li style=\"text-align:justify\">Organizador de eventos.</li>\r\n	<li style=\"text-align:justify\">API que facilita la integraci&oacute;n de nuevos motores de almacenamiento y otros componentes.</li>\r\n</ul>\r\n\r\n<p style=\"text-align:justify\">&nbsp;</p>\r\n\r\n<p style=\"text-align:justify\">Actualmente MySQL continua en su versi&oacute;n 5.0 con una versi&oacute;n estable y tambi&eacute;n diversas versiones de este siguen saliendo al p&uacute;blico. En Enero del 2008, MySQL fue adquirido por Sun Microsystems por 1 billones de d&oacute;lares para posteriormente en abril del 2009 entrar en negociaciones con Oracle Corporation, que buscaba hacer la compra de la compa&ntilde;&iacute;a Sun Microsystems. En diciembre del 2009, Oracle afirm&oacute; que seguir&iacute;a mejorando MySQL como lo hab&iacute;a hecho los 4 a&ntilde;os anteriores. En el a&ntilde;o 2010 Oracle finalmente realiz&oacute; la compra de Sun Microsystems y por ende con MySQL. (O&#39;REILLY, n.d.)</p>\r\n\r\n<p style=\"text-align:justify\">&nbsp;</p>\r\n\r\n<p style=\"text-align:justify\"><strong>(Espacio para figura)</strong></p>', 28, 42, '2022-07-13 22:58:20', '2022-07-15 07:17:11'),
(30, 'Características de MySQL', '<p style=\"text-align:justify\">MySQL se encarga de guardar informaci&oacute;n por medio de tablas separadas dado que esto permite tener una mayor velocidad y flexibilidad a la hora de buscar datos. Al ser un programa de c&oacute;digo abierto, cualquier persona tiene la ventaja de poder utilizarlo y crear modificaciones si este lo desea siempre y cuando cumpla con los lineamientos de la licencia GPL. (HostingPedia, 2019)</p>\r\n\r\n<p style=\"text-align:justify\">&nbsp;</p>\r\n\r\n<p style=\"text-align:justify\">MySQL funciona de modo que los usuarios deben conectarse a un servidor por medio de una red, para luego realizar solicitudes por medio de su interfaz gr&aacute;fica. El procedimiento se explica a continuaci&oacute;n, asimismo, se puede observar de manera gr&aacute;fica:</p>\r\n\r\n<p style=\"text-align:justify\">&nbsp;</p>\r\n\r\n<ol>\r\n	<li style=\"text-align:justify\">MySQL crea la base de datos donde se guardar&aacute;n los datos.</li>\r\n	<li style=\"text-align:justify\">Las solicitudes se hacen por medio del lenguaje SQL.</li>\r\n	<li style=\"text-align:justify\">El servidor devolver&aacute; respuestas a los clientes.</li>\r\n</ol>\r\n\r\n<p style=\"text-align:justify\">&nbsp;</p>\r\n\r\n<p style=\"text-align:justify\"><strong>(Espacio para figura)</strong></p>\r\n\r\n<p style=\"text-align:justify\">&nbsp;</p>\r\n\r\n<p style=\"text-align:justify\">Al ser un gestor de bases de datos basado en SQL posee todas las caracter&iacute;sticas que da este lenguaje a la hora de realizar operaciones con &eacute;l, por medio de SQL se pueden realizar las siguientes operaciones:</p>\r\n\r\n<p style=\"text-align:justify\">&nbsp;</p>\r\n\r\n<ul>\r\n	<li style=\"text-align:justify\">Consultar datos espec&iacute;ficos.</li>\r\n	<li style=\"text-align:justify\">Manipulaci&oacute;n y modificaci&oacute;n de los datos como seria: agregar, cambiar, eliminar y ordenar</li>\r\n	<li style=\"text-align:justify\">Definici&oacute;n de datos, as&iacute; como sus relaciones.</li>\r\n	<li style=\"text-align:justify\">Control de los datos. (Gustavo, 2019)</li>\r\n</ul>', 29, 42, '2022-07-13 22:58:20', '2022-07-15 07:21:34'),
(31, 'Ventajas de MySQL', '<p style=\"text-align:justify\">Al utilizar MySQL podemos tener las siguientes ventajas:</p>\r\n\r\n<p style=\"text-align:justify\">&nbsp;</p>\r\n\r\n<ul>\r\n	<li style=\"text-align:justify\"><u>Multiplataformas:</u> MySQL tiene la ventaja de funcionar en muchos sistemas operativos conocidos como Linux o Windows, pero tambi&eacute;n funciona en FreeBSD, Mac OS y Solaris haci&eacute;ndolo bastante compatible en muchos equipos alrededor del mundo.</li>\r\n	<li style=\"text-align:justify\"><u>Interfaz Gr&aacute;fica:</u> posee una interfaz gr&aacute;fica f&aacute;cil de utilizar y posee varias interfaces para poder ocupar este gestor, y tambi&eacute;n, se puede utilizar mediante consola.</li>\r\n	<li style=\"text-align:justify\"><u>Motores:</u> MySQL es compatible con muchos motores de almacenamiento, aunque la mayor&iacute;a s&oacute;lo usa InnoDB y MyISAM dado que cada tabla de la base de datos puede ser configurada de forma individual.</li>\r\n	<li style=\"text-align:justify\"><u>Respaldos:</u> MySQL incluye un sistema de respaldo conocido como mysqldump que permite realizar copias comprimidas de la base de datos para restaurar un punto en caso de p&eacute;rdidas.</li>\r\n	<li style=\"text-align:justify\"><u>Mantenimiento y reparaci&oacute;n:</u> incluye el servicio mysqlcheck y este se encarga de tareas de chequeo y reparaciones de bases de datos.</li>\r\n	<li style=\"text-align:justify\"><u>Arquitectura multihilo:</u> brinda la posibilidad de que varios usuarios puedan acceder a los datos de forma simult&aacute;nea.</li>\r\n	<li style=\"text-align:justify\"><u>Privilegios:</u> MySQL permite la creaci&oacute;n de usuarios y otorgarles privilegios a estos usuarios.</li>\r\n	<li style=\"text-align:justify\"><u>Replicaci&oacute;n:</u> MySQL puede ser montado junto con otro sistema para generar replicaci&oacute;n de bases de datos mediante el modelo master-master o master-slave. (TecnoMagazine, 2019)</li>\r\n</ul>', 30, 42, '2022-07-13 22:58:20', '2022-07-15 07:17:11'),
(32, 'Roles en OAuth', '<p style=\"text-align:justify\">El m&oacute;dulo de OAuth 2.0 cuenta con varios roles, los cuales participan en el proceso:</p>\r\n\r\n<p style=\"text-align:justify\">&nbsp;</p>\r\n\r\n<ul>\r\n	<li style=\"text-align:justify\"><u>Due&ntilde;o del recurso:</u> Este rol se asigna al usuario que da autorizaci&oacute;n a una determinada aplicaci&oacute;n para que esta pueda acceder a su cuenta y que pueda realizar algunas acciones en nombre de este usuario. Al conjunto de cosas a las que el usuario da su autorizaci&oacute;n se le denomina &ldquo;alcance&rdquo;. A pesar de que el usuario no es el due&ntilde;o de la API o del servicio que consume, se le llama &ldquo;due&ntilde;o del recurso&rdquo; porque los datos que &eacute;l maneja son suyos.</li>\r\n	<li style=\"text-align:justify\"><u>Cliente:</u> Cuando se habla del cliente se est&aacute; haciendo referencia a la aplicaci&oacute;n a la que se quiere acceder, en este caso es a la cuenta del usuario, sin embargo, antes de que esta aplicaci&oacute;n pueda acceder a la cuenta del usuario es necesario que se brinde una autorizaci&oacute;n por el usuario y, adem&aacute;s, debe ser validada por la API.</li>\r\n	<li style=\"text-align:justify\"><u>Servidor de recursos protegidos:</u> El servidor de recursos es la propia API, en otras palabras, es el servidor que aloja el recurso al que se quiere acceder luego. Tambi&eacute;n, puede darse el caso de que el servidor de recursos a su vez, este puede ser parte de la misma aplicaci&oacute;n.</li>\r\n	<li style=\"text-align:justify\"><u>Servidor de autorizaci&oacute;n:</u> El servidor de autorizaci&oacute;n es el responsable de gestionar todas aquellas peticiones de autorizaci&oacute;n que sean emitidas por el cliente. Este servidor se encarga de verificar la identidad de los usuarios, y es el encargado de emitir una serie de tokens de acceso al cliente. En algunas ocasiones tambi&eacute;n, es posible implementar el servidor de autorizaci&oacute;n de manera nativa, por lo que es posible delegar este servicio a un tercero y &uacute;nicamente contar con un servidor de recursos.</li>\r\n</ul>\r\n\r\n<p style=\"text-align:justify\">(L&oacute;pez Maga&ntilde;a, 2020)</p>', 32, 43, '2022-07-13 22:58:20', '2022-07-15 07:17:11'),
(33, 'Flujo abstracto del protocolo OAuth2', '<p style=\"text-align:justify\">Teniendo una noci&oacute;n de lo que es OAuth2 y los roles que participan en el proceso, es necesario explicar el flujo que se sigue a la hora de realizar una petici&oacute;n de autenticaci&oacute;n. Analizando de manera m&aacute;s detallada el flujo es relevante visualizar la secuencia de las peticiones y respuestas, y, adem&aacute;s, cu&aacute;les m&oacute;dulos se comunican entre ellos de manera directa. Inicialmente la aplicaci&oacute;n o cliente realiza una petici&oacute;n de autorizaci&oacute;n para acceder al servidor de recursos del usuario, en el caso de que el usuario acepte dicha petici&oacute;n se conceder&aacute; la autorizaci&oacute;n a la aplicaci&oacute;n para que esta pueda acceder a la data del usuario.</p>\r\n\r\n<p style=\"text-align:justify\">&nbsp;</p>\r\n\r\n<p style=\"text-align:justify\">Una vez se conceden los permisos a la aplicaci&oacute;n, esta procede a solicitar un token de acceso al servidor de autorizaci&oacute;n, para esto es necesario que se env&iacute;e la propia identidad de la aplicaci&oacute;n y tambi&eacute;n, los permisos que le fueron concedidos por el usuario. Si la identidad es autenticada y los permisos cedidos son validados, el servidor de autorizaci&oacute;n concede un token de acceso a la aplicaci&oacute;n. A partir de ac&aacute; la autorizaci&oacute;n ha sido completada.</p>\r\n\r\n<p style=\"text-align:justify\">&nbsp;</p>\r\n\r\n<p style=\"text-align:justify\">La aplicaci&oacute;n solicita el acceso a un recurso del servidor o API, para que se le pueda brindar el recurso solicitado, es necesario que se presente el token de acceso generado anteriormente, y si el token es v&aacute;lido la API le brinda el recurso solicitado a la aplicaci&oacute;n (Anicas, 2021). A continuaci&oacute;n, se puede observar de manera gr&aacute;fica el flujo de protocolo abstracto:</p>\r\n\r\n<p style=\"text-align:justify\">&nbsp;</p>\r\n\r\n<p style=\"text-align:justify\"><strong>(Espacio para figura)</strong></p>', 33, 43, '2022-07-13 22:58:20', '2022-07-15 07:17:11'),
(34, 'Clientes y Permisos de OAuth2', '<p style=\"text-align:justify\">OAuth2 tambi&eacute;n cuenta con 2 tipos de clientes diferentes, los cuales son:</p>\r\n\r\n<p style=\"text-align:justify\">&nbsp;</p>\r\n\r\n<ul>\r\n	<li style=\"text-align:justify\"><u>Clientes confidenciales:</u> son aquellos clientes que tienen la capacidad de poder guardar una contrase&ntilde;a sin que esta pueda ser expuesta, un claro ejemplo de esta categor&iacute;a de clientes es: las aplicaciones nativas compiladas.</li>\r\n	<li style=\"text-align:justify\"><u>Clientes p&uacute;blicos:</u> los clientes p&uacute;blicos, a diferencia de los confidenciales, no son capaces de poder mantener una contrase&ntilde;a segura, por lo general los clientes p&uacute;blicos son aplicaciones como: JavaScript, Angular, entre otros.</li>\r\n</ul>\r\n\r\n<p style=\"text-align:justify\">&nbsp;</p>\r\n\r\n<p style=\"text-align:justify\">De igual manera existen varios tipos de concesiones o permisos, los m&aacute;s conocidos y usados se enlistan a continuaci&oacute;n:</p>\r\n\r\n<p style=\"text-align:justify\">&nbsp;</p>\r\n\r\n<ul>\r\n	<li style=\"text-align:justify\">Authorization code.</li>\r\n	<li style=\"text-align:justify\">Implicit.</li>\r\n	<li style=\"text-align:justify\">Resource Owner Password Credentials.</li>\r\n	<li style=\"text-align:justify\">Device code flow.</li>\r\n	<li style=\"text-align:justify\">Client credentials flow.</li>\r\n</ul>\r\n\r\n<p style=\"text-align:justify\">&nbsp;</p>\r\n\r\n<p style=\"text-align:justify\">De los tipos de concesiones listados anteriormente es posible destacar uno en espec&iacute;fico, este es &quot;Authorization code&quot; ya que es el m&aacute;s completo de todos, y es el que implementan los clientes confidenciales. (OpenWebinars.net, 2020)</p>\r\n\r\n<p style=\"text-align:justify\">&nbsp;</p>\r\n\r\n<ul>\r\n	<li style=\"text-align:justify\"><u>Authorization code:</u> Este es el tipo de autorizaci&oacute;n m&aacute;s utilizado, esto se debe a su nivel de optimizaci&oacute;n del lado del servidor, donde el c&oacute;digo no se expone de manera p&uacute;blica y se puede mantener la confidencialidad del client_secret.</li>\r\n</ul>\r\n\r\n<p style=\"text-align:justify\">Este flujo se basa en la redirecci&oacute;n, lo que significa que la aplicaci&oacute;n debe tener la capacidad de interactuar con el navegador que el usuario usa y recibir c&oacute;digos de autorizaci&oacute;n, por parte de la API que ser&aacute;n enrutados a trav&eacute;s del navegador.</p>\r\n\r\n<ul>\r\n	<li style=\"text-align:justify\"><u>Client credentials:</u> Este tipo de autorizaci&oacute;n proporciona a una aplicaci&oacute;n una forma f&aacute;cil de acceder a su propia cuenta de servicio a trav&eacute;s de una API, podr&iacute;a ser &uacute;til en el caso de que una aplicaci&oacute;n quiera actualizar su descripci&oacute;n o acceder a otros datos almacenados en su cuenta de servicio. (Anicas, 2021)</li>\r\n</ul>\r\n\r\n<p style=\"text-align:justify\">&nbsp;</p>\r\n\r\n<p style=\"text-align:justify\">Por consiguiente, OAuth 2 tambi&eacute;n ofrece la capacidad de codificar tokens de acceso en forma de un JSON Web Token o JWT, esto incluye un conjunto de notificaciones est&aacute;ndar que son &uacute;tiles en un token de acceso. Un JWT se puede usar como un token portador de OAuth 2.0 y as&iacute; codificar todas aquellas partes relevantes en un token de acceso en lugar de almacenarlas en la base de datos.&nbsp;(OAuth 2.0, n.d.)</p>', 34, 43, '2022-07-13 22:58:20', '2022-07-15 07:17:11'),
(35, 'Metodología SCRUM', '<p style=\"text-align:justify\">Despu&eacute;s de esta breve explicaci&oacute;n sobre las metodolog&iacute;as &aacute;giles, es necesario hablar sobre la metodolog&iacute;a llamada &ldquo;Scrum&rdquo;, la cual est&aacute; dentro de esta categor&iacute;a, asimismo cuenta con flexibilidad y se enfoca en construir primero la funcionalidad con un mayor valor para el cliente.</p>\r\n\r\n<p style=\"text-align:justify\">&nbsp;</p>\r\n\r\n<p style=\"text-align:justify\">El uso de esta metodolog&iacute;a tambi&eacute;n implica grandes ventajas para el cliente, como lo es ver el avance y mejoras del proyecto en cada iteraci&oacute;n, realizar cambios o mejoras al proyecto con el prop&oacute;sito de adaptarse a sus necesidades sin que esto ocasione problemas. Scrum promueve la innovaci&oacute;n, motivaci&oacute;n y el compromiso por parte del equipo, esto gracias a que los integrantes del equipo puedan desarrollar sus capacidades en un ambiente que premia la mejora continua.</p>\r\n\r\n<p style=\"text-align:justify\">&nbsp;</p>\r\n\r\n<p style=\"text-align:justify\">El uso esta metodolog&iacute;a trae consigo algunos beneficios de cara al producto final, y la manera en la que este se desarrolla, as&iacute; como lo es tambi&eacute;n, para los integrantes del equipo:</p>\r\n\r\n<p style=\"text-align:justify\">&nbsp;</p>\r\n\r\n<ul>\r\n	<li style=\"text-align:justify\">Cumplimiento de las expectativas.</li>\r\n	<li style=\"text-align:justify\">Flexibilidad ante los cambios.</li>\r\n	<li style=\"text-align:justify\">Reducci&oacute;n del tiempo en el mercado. (Release)</li>\r\n	<li style=\"text-align:justify\">Mayor calidad del software.</li>\r\n	<li style=\"text-align:justify\">Mayor productividad.</li>\r\n	<li style=\"text-align:justify\">Maximiza el retorno de la inversi&oacute;n.</li>\r\n	<li style=\"text-align:justify\">Predicciones de tiempos.</li>\r\n	<li style=\"text-align:justify\">Reducci&oacute;n de riesgos. (Softeng, 2021)</li>\r\n</ul>\r\n\r\n<p style=\"text-align:justify\">&nbsp;</p>\r\n\r\n<p style=\"text-align:justify\">Una metodolog&iacute;a &aacute;gil busca liberar software funcional de manera peri&oacute;dica usando intervalos de tiempo definidos, en el caso de Scrum estos intervalos son llamados sprint y normalmente duran dos semanas, algunos equipos pueden usar sprints de 3 o 4 semanas, pero es necesario comprender que entre m&aacute;s largo sea un sprint se tendr&aacute; menos visibilidad del desarrollo, y el producto no se entregar&aacute; de forma peri&oacute;dica.</p>\r\n\r\n<p style=\"text-align:justify\">&nbsp;</p>\r\n\r\n<p style=\"text-align:justify\">Cada iteraci&oacute;n o sprint va acompa&ntilde;ada de una serie de actividades que se realizan al inicio, durante o al final. Adem&aacute;s, es necesario que se tengan definidos todos aquellos requerimientos o funcionalidades que se espera que tendr&aacute; el software de cara al usuario final, o al menos los que tienen mayor prioridad.</p>\r\n\r\n<p style=\"text-align:justify\">&nbsp;</p>\r\n\r\n<p style=\"text-align:justify\">Antes de dar inicio a un sprint es necesario que se tenga una reuni&oacute;n para definir todas aquellas funcionalidades que ser&aacute;n trabajadas durante la iteraci&oacute;n que est&aacute; a punto de iniciar, esta sesi&oacute;n recibe el nombre de &ldquo;sprint planning&rdquo;, en esta sesi&oacute;n se suele hacer un refinamiento de aquellas funcionalidades que el cliente considera pueden ser desarrolladas.</p>\r\n\r\n<p style=\"text-align:justify\">&nbsp;</p>\r\n\r\n<p style=\"text-align:justify\">Dentro del sprint planning, el equipo puede hacer las preguntas necesarias para poder tener un mejor entendimiento de lo que el cliente espera de cada funcionalidad, en esta sesi&oacute;n tambi&eacute;n se suele hacer una estimaci&oacute;n para cada funcionalidad, estas estimaciones sirven para dar una visibilidad de cuanto esfuerzo demandar&aacute;, y en base a la sumatoria de todas las estimaciones se puede saber si el equipo ser&aacute; capaz de afrontar toda la carga de trabajo, o si es necesario dejar fuera algunas para este sprint.</p>\r\n\r\n<p style=\"text-align:justify\">&nbsp;</p>\r\n\r\n<p style=\"text-align:justify\">Una vez iniciado el sprint, se tienen reuniones de sincronizaci&oacute;n diarias que reciben el nombre de &ldquo;daily scrum meeting&rdquo;, durante estas reuniones cada miembro del equipo debe decir qu&eacute; cosas ha hecho desde la &uacute;ltima reuni&oacute;n, tambi&eacute;n se debe hablar sobre qu&eacute; cosas se har&aacute;n despu&eacute;s para alcanzar el objetivo del sprint y se debe expresar cualquier situaci&oacute;n que le est&eacute; impidiendo trabajar, para que todo funcione como se espera. Es necesario que cada integrante se comprometa a ser transparente, y que tenga la confianza para poder expresar cualquier situaci&oacute;n que pueda afectar, sobre todo se debe recalcar la honestidad con las actualizaciones diarias.</p>\r\n\r\n<p style=\"text-align:justify\">&nbsp;</p>\r\n\r\n<p style=\"text-align:justify\">De cara al final del sprint, es necesario que se realicen una serie de ceremonias, estas pueden tener un impacto bastante grande para las siguientes iteraciones, estas se llevan a cabo con el fin de realizar la revisi&oacute;n del sprint y la retrospectiva del sprint. Ambas sesiones son importantes ya que con ellas se pueden realizar mejoras para los futuros sprints.</p>\r\n\r\n<p style=\"text-align:justify\">&nbsp;</p>\r\n\r\n<p style=\"text-align:justify\">En la revisi&oacute;n del sprint se tiene la participaci&oacute;n de todo el equipo y del cliente, en esta sesi&oacute;n el equipo muestra al cliente todas las cosas nuevas que se crearon y las cosas que se modificaron, en esta reuni&oacute;n el cliente verifica las nuevas caracter&iacute;sticas y le indica al equipo si lo desarrollado se adapta a sus necesidades, si es necesario realizar alg&uacute;n cambio, agregar algo nuevo o corregir alg&uacute;n defecto.</p>\r\n\r\n<p style=\"text-align:justify\">&nbsp;</p>\r\n\r\n<p style=\"text-align:justify\">En la sesi&oacute;n de retrospectiva del sprint el equipo realiza una peque&ntilde;a autoevaluaci&oacute;n del rendimiento que se ha visto a lo largo del sprint, esta reuni&oacute;n tambi&eacute;n sirve para que el equipo responda a 3 interrogantes:</p>\r\n\r\n<p style=\"text-align:justify\">&nbsp;</p>\r\n\r\n<ol>\r\n	<li style=\"text-align:justify\">&iquest;Qu&eacute; se hizo bien?</li>\r\n	<li style=\"text-align:justify\">&iquest;Qu&eacute; debemos dejar de hacer?</li>\r\n	<li style=\"text-align:justify\">&iquest;Qu&eacute; se debe comenzar a hacer?</li>\r\n</ol>\r\n\r\n<p style=\"text-align:justify\">&nbsp;</p>\r\n\r\n<p style=\"text-align:justify\">Estas podr&iacute;an parecer preguntas que no aporten nada, pero en desarrollos &aacute;giles, este tipo de informaci&oacute;n ayuda a que se contin&uacute;e mejorando iteraci&oacute;n a iteraci&oacute;n, de esta manera el equipo da su opini&oacute;n desde su perspectiva de c&oacute;mo va avanzando el proyecto y a partir de estas opiniones es posible realizar cambios de cara al siguiente sprint. (proyectosagiles.org, 2008)</p>', 36, 44, '2022-07-13 22:58:20', '2022-07-15 07:17:11'),
(36, 'Requerimientos Funcionales', '<p style=\"text-align:justify\">Las principales funcionalidades con el que contar&aacute; el sitio web para la creaci&oacute;n de documentos de graduaci&oacute;n son las siguientes:</p>\r\n\r\n<p style=\"text-align:justify\">&nbsp;</p>\r\n\r\n<ul>\r\n	<li style=\"text-align:justify\">El sitio web contar&aacute; con un m&oacute;dulo de Administraci&oacute;n, donde se gestionan los usuarios y roles del sistema, los cuales se podr&aacute;n agregar, modificar o eliminar.</li>\r\n	<li style=\"text-align:justify\">El sistema tendr&aacute; un m&oacute;dulo para el Director de Carrera, en el cual ser&aacute; capaz de formar los equipos de trabajo y asignarles su respectivo tema, Director y Segundo Lector del trabajo de graduaci&oacute;n.</li>\r\n	<li style=\"text-align:justify\">El usuario del Director de carrera ser&aacute; capaz de agregar y modificar lectores externos al igual que Directores del trabajo de graduaci&oacute;n, es decir personas ajenas a la Universidad y que ser&aacute;n de ayuda en el desarrollo del proceso.</li>\r\n	<li style=\"text-align:justify\">El usuario del estudiante tendr&aacute; diversos formularios donde podr&aacute; llenarlos con la informaci&oacute;n de las secciones del documento escrito, el cual ser&aacute; almacenado en una base de datos.</li>\r\n	<li style=\"text-align:justify\">El m&oacute;dulo de estudiantes, permitir&aacute; la creaci&oacute;n y descarga de los documentos de los trabajos de graduaci&oacute;n, esto mediante la recopilaci&oacute;n de la informaci&oacute;n almacenada en la base de datos.</li>\r\n	<li style=\"text-align:justify\">Los documentos de graduaci&oacute;n que se crear&aacute;n en el sitio web contar&aacute;n con los siguientes lineamientos estipulados por Decanato:\r\n	<ul>\r\n		<li style=\"text-align:justify\"><u>Fuente de letra:</u> todo el documento se escribir&aacute; con la letra Times News Roman (11) con excepci&oacute;n de la portada y segunda portada se deben de escribir con el mismo tipo de letra con la consideraci&oacute;n del tama&ntilde;o de letra 14.</li>\r\n		<li style=\"text-align:justify\"><u>M&aacute;rgenes:</u> en todas las p&aacute;ginas el margen superior, inferior y lateral ser&aacute; de 2.5 cm, dejando un borde para encuadernaci&oacute;n de 1 cm.</li>\r\n		<li style=\"text-align:justify\"><u>P&aacute;rrafos y su alineaci&oacute;n:</u> los p&aacute;rrafos estar&aacute;n justificados, sin sangr&iacute;a e interlineado de 1.5.</li>\r\n		<li style=\"text-align:justify\"><u>Numeraci&oacute;n de p&aacute;ginas:</u> el documento tienes 3 tipos de numeraci&oacute;n, las cuales son: romana, ar&aacute;bica e independiente. La numeraci&oacute;n romana comienza desde la secci&oacute;n Resumen hasta la Nomenclatura, la ar&aacute;biga comienza desde la secci&oacute;n Cap&iacute;tulos hasta el final del documento, esto sin incluir los anexos y la numeraci&oacute;n independiente contempla la secci&oacute;n de los anexos, por ejemplo, la p&aacute;gina C-5 hace referencia a la p&aacute;gina 5 del tercer anexo (anexo C).</li>\r\n		<li style=\"text-align:justify\"><u>Espacio entre l&iacute;neas:</u> interlineado de 1.5.<u> </u></li>\r\n		<li style=\"text-align:justify\"><u>Portada:</u> el tama&ntilde;o de letra es de 14 con alineaci&oacute;n centrada agregando el logo de la Universidad Centroamericana &ldquo;Jos&eacute; Sime&oacute;n Ca&ntilde;as&rdquo; (UCA).</li>\r\n		<li style=\"text-align:justify\"><u>T&iacute;tulo de los cap&iacute;tulos:</u> el n&uacute;mero y el nombre del cap&iacute;tulo estar&aacute; en letra may&uacute;scula, adem&aacute;s, de estar centrado y con el formato de fuente en negrita.</li>\r\n		<li style=\"text-align:justify\"><u>T&iacute;tulos y subt&iacute;tulos:</u> todos los t&iacute;tulos y subt&iacute;tulos del trabajo deben de estar alineados a la izquierda y con una fuente en negrita. Adem&aacute;s, se le presentar&aacute; al estudiante la respectiva numeraci&oacute;n dentro del documento.</li>\r\n		<li style=\"text-align:justify\"><u>Numeraci&oacute;n de apartados:</u> Los apartados de los cap&iacute;tulos se numeran en secuencia jer&aacute;rquica, sin sobrepasar de tres numerales. Por ejemplo, el tercer apartado del cap&iacute;tulo 2 se enumerar&aacute; como 2.3. Para desgloses mayores de tres numerales se utilizar&aacute; numeraci&oacute;n simple o vi&ntilde;etas.</li>\r\n	</ul>\r\n	</li>\r\n	<li style=\"text-align:justify\">El sistema contar&aacute; con un formulario de inicio de sesi&oacute;n, el cual posee un m&oacute;dulo de seguridad capaz de autenticar a los usuarios por medio de su correo y contrase&ntilde;a, en donde dependiendo del rol en el sistema, se les dar&aacute; acceso a sus respectivos m&oacute;dulos.</li>\r\n	<li style=\"text-align:justify\">El usuario del estudiante tendr&aacute; una bit&aacute;cora de cambios, en donde se mostrar&aacute; la secci&oacute;n que se modific&oacute;, agreg&oacute; o elimin&oacute;, la fecha y hora de la modificaci&oacute;n y, adem&aacute;s, se indicar&aacute; el integrante del grupo que hizo el cambio.</li>\r\n</ul>', 3, 47, '2022-07-13 23:49:23', '2022-07-14 03:10:49'),
(37, 'Requerimientos no Funcionales', '<ul>\r\n	<li style=\"text-align:justify\">El sistema contar&aacute; con un m&oacute;dulo de seguridad basado en OAuth2 usando token de seguridad con la estructura de JWT.</li>\r\n	<li style=\"text-align:justify\">La aplicaci&oacute;n debe tener una interfaz que sea amigable con el usuario.</li>\r\n	<li style=\"text-align:justify\">La aplicaci&oacute;n debe tener un tiempo de respuesta bajo.</li>\r\n	<li style=\"text-align:justify\">El sistema se optimizar&aacute; para los navegadores Firefox y Chrome.</li>\r\n	<li style=\"text-align:justify\">La plataforma contar&aacute; con el logo y colores institucionales, como lo son Pantone 541, blanco y negro 100%, as&iacute; como se estipula en el Manual de Imagen Visual de la Universidad Centroamericana &ldquo;Jos&eacute; Sime&oacute;n Ca&ntilde;as&rdquo;.</li>\r\n	<li style=\"text-align:justify\">Los documentos creados en el sitio web, ser&aacute;n compatibles con los programas de Microsoft Word (versi&oacute;n local y en l&iacute;nea), Open Office, WPS Office y Libre Office.</li>\r\n</ul>', 4, 47, '2022-07-13 23:49:23', '2022-07-14 03:10:49');
INSERT INTO `subcontenido_seccion_capitulo` (`id`, `subtema`, `contenido`, `orden_subcontenido`, `contenido_seccion_capitulo_id`, `created_at`, `updated_at`) VALUES
(38, 'Metodología Scrum', '<p style=\"text-align:justify\">En el presente trabajo de graduaci&oacute;n se utiliz&oacute; una metodolog&iacute;a &aacute;gil llamada Scrum, la cual es muy usada en la creaci&oacute;n de software, esto debido a que se lleva a cabo un conjunto de tareas de forma regular con el objetivo de trabajar de manera colaborativa y poder as&iacute; alcanzar el mejor resultado en un proyecto determinado.</p>\r\n\r\n<p style=\"text-align:justify\">&nbsp;</p>\r\n\r\n<p style=\"text-align:justify\">Para la creaci&oacute;n del sitio web y el desarrollo del trabajo de graduaci&oacute;n, es necesario dividir el proyecto en actividades que ayuden a dar una soluci&oacute;n ante la principal problem&aacute;tica, por ello dichas actividades se subdividen en tareas que son asignadas entre los integrantes del equipo.</p>\r\n\r\n<p style=\"text-align:justify\">&nbsp;</p>\r\n\r\n<p style=\"text-align:justify\">Cada tarea o actividad asignada tiene un periodo de tiempo en que se debe de realizar, esto con el fin de poder llevar una mejor organizaci&oacute;n en el desarrollo del proyecto, siendo as&iacute; la manera m&aacute;s optima de trabajo, ya que al Director del trabajo de graduaci&oacute;n se le muestran distintos avances del proyecto semanalmente, por lo que se pueden hacer observaciones o sugerencias acerca de dichos avances y as&iacute; poder realizar las respectivas correcciones. El plan de trabajo con las actividades se encuentra en el Anexo A.</p>', 3, 50, '2022-07-13 23:51:08', '2022-07-14 03:06:57'),
(39, 'Inicio de sesión', '<p>En la siguiente figura se muestra el inicio de sesi&oacute;n para ingresar al sistema.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><strong>(Espacio para figura)</strong></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p style=\"text-align:justify\">El inicio de sesi&oacute;n est&aacute; compuesto de dos partes divididas verticalmente. En la parte izquierda predomina el logo y nombre de la Universidad Centroamericana Jos&eacute; Sime&oacute;n Ca&ntilde;as. En la parte derecha se encuentra el formulario donde el usuario debe ingresar sus credenciales y el bot&oacute;n de inicio de sesi&oacute;n. En la parte inferior de este apartado se encuentran las redes sociales de la instituci&oacute;n.</p>', 2, 53, '2022-07-13 23:59:32', '2022-07-15 11:05:03'),
(40, 'Alertas y diálogos', '<p style=\"text-align:justify\">Las siguientes figuras muestran la composici&oacute;n de las alertas y di&aacute;logos que se pueden encontrar a lo largo de la aplicaci&oacute;n.</p>\r\n\r\n<p style=\"text-align:justify\">&nbsp;</p>\r\n\r\n<p style=\"text-align:justify\"><strong>(Espacio para figura)</strong></p>\r\n\r\n<p style=\"text-align:justify\"><strong>(Espacio para figura)</strong></p>\r\n\r\n<p style=\"text-align:justify\">&nbsp;</p>\r\n\r\n<p style=\"text-align:justify\">En la figura 5.2 y 5.3 se observan ejemplos de algunas advertencias temporales, dado que al momento de realizarse una acci&oacute;n se activar&aacute; alguna de las dos alertas y estas desaparecen luego de un breve momento.&nbsp;</p>\r\n\r\n<p style=\"text-align:justify\">&nbsp;</p>\r\n\r\n<p style=\"text-align:justify\"><strong>(Espacio para figura)</strong></p>\r\n\r\n<p style=\"text-align:justify\">&nbsp;</p>\r\n\r\n<p style=\"text-align:justify\">Para la figura 5.4 se tiene el dise&ntilde;o que utilizan todas las pantallas que necesiten confirmaci&oacute;n por parte del usuario. Esta pantalla de confirmaci&oacute;n de utiliza en las acciones m&aacute;s sensibles del sistema, como es el caso de eliminar o descartar alg&uacute;n cambio, ya que dichas acciones no deben de poderse ejecutar accidentalmente.</p>', 3, 53, '2022-07-13 23:59:32', '2022-07-15 11:05:03'),
(41, 'Perfil de usuario', '<p style=\"text-align:justify\">La secci&oacute;n de perfil de usuario est&aacute; compuesta por un formulario que permite la lectura de los datos que conforman los perfiles de cada usuario: nombres, apellidos, contrase&ntilde;a y correo electr&oacute;nico. La escritura s&oacute;lo est&aacute; permitida para el apartado de contrase&ntilde;a, por lo que los dem&aacute;s apartados se han restringido por las pol&iacute;ticas de usuarios que maneja la Universidad. El usuario tambi&eacute;n puede realizar cambio de su imagen de perfil por medio del bot&oacute;n azul con icono de subida de archivos.&nbsp;</p>\r\n\r\n<p style=\"text-align:justify\">&nbsp;</p>\r\n\r\n<p style=\"text-align:justify\">El perfil de usuario se visualiza de la misma manera para los usuarios con rol de Estudiante y rol de Director de Carrera. La figura 5.5 representa el dise&ntilde;o que posee el apartado de perfil de usuario.&nbsp;</p>\r\n\r\n<p style=\"text-align:justify\">&nbsp;</p>\r\n\r\n<p style=\"text-align:justify\"><strong>(Espacio para figura)</strong></p>', 4, 53, '2022-07-13 23:59:32', '2022-07-15 11:05:03'),
(42, 'Apartado del rol de Director de carrera', '<p><u>Men&uacute; Principal</u></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p style=\"text-align:justify\">El rol de Director de Carrera tiene su propio m&oacute;dulo, en donde tiene acceso a dos opciones en el men&uacute; principal. A continuaci&oacute;n, se puede observar el apartado del men&uacute; principal representado en la figura 5.6.</p>\r\n\r\n<p style=\"text-align:justify\">&nbsp;</p>\r\n\r\n<p style=\"text-align:justify\"><strong>(Espacio para figura)</strong></p>\r\n\r\n<p style=\"text-align:justify\">&nbsp;</p>\r\n\r\n<p style=\"text-align:justify\">El men&uacute; principal adopta los colores de manera distribuida en los paneles superior, inferior y lateral izquierdo, en donde predomina el color azul y de fondo se tiene el color blanco para toda la pantalla principal. Todas las pantallas relacionadas al usuario con el rol de Director de Carrera poseen los 3 paneles.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p style=\"text-align:justify\">En la parte superior se tiene la barra de navegaci&oacute;n que contiene el logo y nombre de la Universidad, adem&aacute;s, de contar con la imagen de perfil y un men&uacute; desplegable en la esquina superior derecha de la barra. Este men&uacute; permite al usuario dirigirse a la pantalla de perfil de usuario y cerrar la sesi&oacute;n.&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p style=\"text-align:justify\">En la parte lateral izquierda se tiene una barra de navegaci&oacute;n que permite al usuario moverse entre las diferentes pantallas que ofrece el men&uacute; principal. Para el Director de Carrera tendr&aacute; disponible lo siguiente: apartado de Directores y Lectores externos y la formaci&oacute;n de los grupos de trabajo de graduaci&oacute;n. Adem&aacute;s, de contar con el bot&oacute;n que permite retornar al men&uacute; principal.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p style=\"text-align:justify\">En la parte inferior del sitio se cuenta con un pie de p&aacute;gina que permitir&aacute; al usuario observar la informaci&oacute;n de contacto de la Universidad del lado izquierdo y sus respectivas redes sociales del lado derecho. Cabe mencionar que estos paneles ser&aacute;n visibles en las dem&aacute;s pantallas accesibles que dispone el sistema.&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p style=\"text-align:justify\">Por &uacute;ltimo, se tiene el contenido del men&uacute; principal que al igual cuenta con las mismas opciones que la barra de navegaci&oacute;n lateral izquierda a excepci&oacute;n de la opci&oacute;n de &ldquo;Men&uacute; principal&rdquo;.</p>\r\n\r\n<p style=\"text-align:justify\">&nbsp;</p>\r\n\r\n<p style=\"text-align:justify\"><u>Tablas de datos</u></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p style=\"text-align:justify\">El usuario del Director de Carrera, podr&aacute; observar en cada una de las ventanas distintas tablas de datos, en las cuales se mostrar&aacute; la informaci&oacute;n respectiva de cada apartado, los cuales son: la secci&oacute;n de &ldquo;Directores y Lectores de trabajo de graduaci&oacute;n externo&rdquo; y &ldquo;Grupos de trabajo de graduaci&oacute;n&rdquo;. En la figura 5.7 y 5.8 se observa las tablas de cada uno de los apartados mencionados anteriormente:</p>\r\n\r\n<p style=\"text-align:justify\">&nbsp;</p>\r\n\r\n<p style=\"text-align:justify\"><strong>(Espacio para figura)</strong></p>\r\n\r\n<p style=\"text-align:justify\"><strong>(Espacio para figura)</strong></p>\r\n\r\n<p style=\"text-align:justify\">&nbsp;</p>\r\n\r\n<p style=\"text-align:justify\">Las tablas presentan un dise&ntilde;o est&aacute;ndar donde en la cabecera se encontrar&aacute; el tipo de informaci&oacute;n que se obtendr&aacute; y en las dem&aacute;s filas estar&aacute; el contenido dividido en cada una de sus columnas como, por ejemplo: en la tabla mostrada en la Figura 5.8, en la columna 1 representa el n&uacute;mero de integrantes en el grupo, por lo que en dicha columna se mostrar&aacute; el n&uacute;mero de integrantes de cada grupo de graduaci&oacute;n. Estas tablas siempre tendr&aacute;n la opci&oacute;n de &ldquo;Acciones&rdquo; donde solamente se encuentra la opci&oacute;n de editar la informaci&oacute;n de la fila seleccionada.</p>\r\n\r\n<p style=\"text-align:justify\">&nbsp;</p>\r\n\r\n<p style=\"text-align:justify\">La diferencia entre ambas secciones radica en que la secci&oacute;n de &ldquo;Director y Lectores externos&rdquo; el cual contiene un buscador en su parte superior y cuenta con la opci&oacute;n para alternar entre la tabla lector y director. El apartado de los grupos de trabajo de graduaci&oacute;n solamente contiene la tabla de los grupos de trabajo de graduaci&oacute;n. Ambas secciones contienen un bot&oacute;n flotante que permite crear una nueva entidad que ser&aacute; agregada en la tabla de sus respectivas secciones.&nbsp;</p>\r\n\r\n<p style=\"text-align:justify\">&nbsp;</p>\r\n\r\n<p style=\"text-align:justify\"><u>Formularios modales del Director</u></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p style=\"text-align:justify\">Las secciones a las que puede acceder el Director de Carrera poseen pantallas modales que incluyen formulario para el llenado de informaci&oacute;n. Cuando el usuario acceda a una ventana modal, la ventana principal se oscurecer&aacute; y dicha ventana se sobrepondr&aacute; encima de este.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p style=\"text-align:justify\">En la figura 5.9 se puede observar el formulario para el registro de un Director o Lector de trabajo de graduaci&oacute;n con sus respectivos botones de registro y cancelar.</p>\r\n\r\n<p style=\"text-align:justify\">&nbsp;</p>\r\n\r\n<p style=\"text-align:justify\"><strong>(Espacio para figura)</strong></p>\r\n\r\n<p style=\"text-align:justify\">&nbsp;</p>\r\n\r\n<p style=\"text-align:justify\">En la figura 5.10 se observa la ventana para la creaci&oacute;n y modificaci&oacute;n de grupos de trabajo de graduaci&oacute;n. Este formulario se ha construido de modo que sea f&aacute;cil para el usuario conocer d&oacute;nde est&aacute; cada apartado. Asimismo, en dicho formulario hay un bot&oacute;n &ldquo;Seleccionar estudiantes&rdquo;, en la cual se despliega otra ventana modal en donde aparece una lista con los estudiantes que a&uacute;n no tienen grupo o en el caso de modificar al grupo de graduaci&oacute;n, aparecer&aacute; una lista con los integrantes del grupo unido a los estudiantes que no tienen grupo. La ventana &ldquo;Seleccionar estudiantes&rdquo; se puede observar en la figura 5.11.</p>\r\n\r\n<p style=\"text-align:justify\">&nbsp;</p>\r\n\r\n<p style=\"text-align:justify\"><strong>(Espacio para figura)</strong></p>\r\n\r\n<p style=\"text-align:justify\"><strong>(Espacio para figura)</strong></p>\r\n\r\n<p style=\"text-align:justify\">&nbsp;</p>\r\n\r\n<p style=\"text-align:justify\">Por &uacute;ltimo, se tienen las modales con formularios complementarios acerca del Lector y Director de trabajo de graduaci&oacute;n. Estos formularios son de menor tama&ntilde;o dado la reducida informaci&oacute;n que estos requieren para la selecci&oacute;n de datos. Al igual que las dem&aacute;s ventanas modales, se encuentran los colores institucionales presentes donde el color blanco predomina como fondo del formulario y el tono de azul es usado para la cabecera de cada uno, acompa&ntilde;ado de un color naranja para el borde inferior de la cabecera.&nbsp;</p>\r\n\r\n<p style=\"text-align:justify\">&nbsp;</p>\r\n\r\n<p style=\"text-align:justify\"><strong>(Espacio para figura)</strong></p>\r\n\r\n<p style=\"text-align:justify\"><strong>(Espacio para figura)</strong></p>\r\n\r\n<p style=\"text-align:justify\"><strong>(Espacio para figura)</strong></p>\r\n\r\n<p style=\"text-align:justify\"><strong>(Espacio para figura)</strong></p>', 5, 53, '2022-07-13 23:59:32', '2022-07-15 11:28:17'),
(43, 'Apartado del rol de Estudiante', '<p><u>Men&uacute; Principal</u></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p style=\"text-align:justify\">El rol de Estudiante tiene su propio m&oacute;dulo, en donde tiene acceso a distintas opciones en el men&uacute; principal, en donde le permitir&aacute; hacer cada secci&oacute;n de su documento de graduaci&oacute;n. A continuaci&oacute;n, se puede observar el apartado del men&uacute; principal representado en la figura 5.16 y figura 5.17.</p>\r\n\r\n<p style=\"text-align:justify\">&nbsp;</p>\r\n\r\n<p style=\"text-align:justify\"><strong>(Espacio para figura)</strong></p>\r\n\r\n<p style=\"text-align:justify\"><strong>(Espacio para figura)</strong></p>\r\n\r\n<p style=\"text-align:justify\">&nbsp;</p>\r\n\r\n<p style=\"text-align:justify\">El men&uacute; principal adopta los colores de manera distribuida en los paneles superior, inferior y lateral izquierdo donde predomina el color azul y como fondo el color blanco para toda la pantalla principal. Todas las pantallas relacionadas al usuario del Estudiante poseen los 3 paneles.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p style=\"text-align:justify\">En la parte superior se tiene la barra de navegaci&oacute;n superior que contiene el logo y nombre de la Universidad Centroamericana Jos&eacute; Sime&oacute;n Ca&ntilde;as, adem&aacute;s, de contar con la imagen de perfil y un men&uacute; desplegable al extremo derecho de la barra. Este men&uacute; permite al usuario dirigirse a la pantalla de perfil de usuario y cerrar la sesi&oacute;n.&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p style=\"text-align:justify\">En la parte lateral izquierda se tiene una barra de navegaci&oacute;n que permite al usuario moverse entre las diferentes pantallas que le permitir&aacute;n crear diferentes partes del documento de trabajo de graduaci&oacute;n. Esta barra de navegaci&oacute;n contiene: el resumen, los agradecimientos, las abreviaturas, los cap&iacute;tulos, el glosario, las referencias y la bit&aacute;cora de cambios. Tambi&eacute;n incluye el bot&oacute;n de &ldquo;Men&uacute; principal&rdquo; que permitir&aacute; al usuario retornar nuevamente al inicio del aplicativo.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p style=\"text-align:justify\">En la parte inferior del sitio web se cuenta con un pie de p&aacute;gina que permitir&aacute; al usuario observar la informaci&oacute;n de contacto de la Universidad del lado izquierdo y sus respectivas redes sociales del lado derecho. Cabe mencionar que estos paneles ser&aacute;n visibles en las dem&aacute;s pantallas accesibles que dispone el sistema.&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p style=\"text-align:justify\">Por &uacute;ltimo, se tiene el contenido del men&uacute; principal que al igual cuenta con las mismas opciones que la barra de navegaci&oacute;n lateral izquierda a excepci&oacute;n de la opci&oacute;n de &ldquo;Men&uacute; principal&rdquo; y en la parte superior podr&aacute; observar el usuario el tema de su respectivo trabajo de graduaci&oacute;n.&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p style=\"text-align:justify\">Para ofrecer una navegaci&oacute;n sencilla se escogi&oacute; por un sistema de 3 columnas donde se tendr&aacute;n las opciones a las que el usuario puede acceder. Por &uacute;ltimo, al final del men&uacute; principal se tiene un bot&oacute;n flotante del lado derecho el cual permite al usuario crear el documento de trabajo de graduaci&oacute;n.&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p style=\"text-align:justify\">La figura 5.18 se muestra la ventana modal que se activar&aacute; al momento de utilizar el bot&oacute;n flotante.</p>\r\n\r\n<p style=\"text-align:justify\">&nbsp;</p>\r\n\r\n<p style=\"text-align:justify\"><strong>(Espacio para figura)</strong></p>\r\n\r\n<p style=\"text-align:justify\">&nbsp;</p>\r\n\r\n<p><u>Formulario de ingreso de datos&nbsp;</u></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p style=\"text-align:justify\">A continuaci&oacute;n, se presenta el dise&ntilde;o general del formulario de datos que est&aacute; presente en muchas pantallas relacionadas al documento de trabajo de graduaci&oacute;n. Este dise&ntilde;o se compone de un cuadro de texto expandible y posee un editor de texto en su parte superior. La figura 5.19 nos da una representaci&oacute;n visual de lo que el usuario puede encontrar en las diversas pantallas del aplicativo:</p>\r\n\r\n<p style=\"text-align:justify\">&nbsp;</p>\r\n\r\n<p style=\"text-align:justify\"><strong>(Espacio para figura)</strong></p>\r\n\r\n<p style=\"text-align:justify\">&nbsp;</p>\r\n\r\n<p style=\"text-align:justify\">Las siguientes pantallas contienen el formulario para el ingreso de datos. Muchas de las pantallas est&aacute;n compuestas por un formulario sencillo, mientras que en pantallas como las de las figuras 5.21 y 5.22 tienen m&aacute;s de una secci&oacute;n, pero siempre contando con un formulario dentro de estas secciones adicionales.&nbsp;</p>\r\n\r\n<p style=\"text-align:justify\">&nbsp;</p>\r\n\r\n<p style=\"text-align:justify\"><strong>(Espacio para figura)</strong></p>\r\n\r\n<p style=\"text-align:justify\"><strong>(Espacio para figura)</strong></p>\r\n\r\n<p style=\"text-align:justify\"><strong>(Espacio para figura)</strong></p>\r\n\r\n<p style=\"text-align:justify\"><strong>(Espacio para figura)</strong></p>\r\n\r\n<p style=\"text-align:justify\"><strong>(Espacio para figura)</strong></p>\r\n\r\n<p style=\"text-align:justify\">&nbsp;</p>\r\n\r\n<p><u>Cap&iacute;tulos</u></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p style=\"text-align:justify\">La secci&oacute;n de cap&iacute;tulos tiene un dise&ntilde;o diferente a las dem&aacute;s pantallas, dado que esta pantalla es din&aacute;mica, es decir, el usuario tiene la posibilidad de agregar o restar contenido de la misma.&nbsp; La secci&oacute;n cap&iacute;tulos contiene un formulario dividido en dos partes: la primera parte consta de un cuadro de texto y un bot&oacute;n que permite la agregaci&oacute;n de cap&iacute;tulos que se ver&iacute;a representado en la segunda parte del formulario, y la segunda parte consta de una lista de cap&iacute;tulos con la opci&oacute;n de poder moverlos de orden con el icono de arrastre que se encuentra en la parte izquierda al t&iacute;tulo del cap&iacute;tulo. Esta lista contiene 3 botones los cuales realizan diferentes funciones: el bot&oacute;n azul permite la modificaci&oacute;n de contenido del cap&iacute;tulo seleccionado, el bot&oacute;n amarillo permite la modificaci&oacute;n del t&iacute;tulo del cap&iacute;tulo y el bot&oacute;n rojo permite la eliminaci&oacute;n del cap&iacute;tulo.&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p style=\"text-align:justify\">El dise&ntilde;o de esta secci&oacute;n comparte los colores institucionales ubicados en la cabecera del formulario donde este contiene el color azul combinado con el color naranja en el borde inferior, y la cabecera de la tabla de cap&iacute;tulos contiene un tono de azul para acompa&ntilde;ar a la cabecera principal. Se hizo uso de colores representativos como el color verde para el bot&oacute;n de agregar, que normalmente es asociado con la acci&oacute;n de agregar, y el color rojo para acciones de borrado. En la figura 5.24 se puede observar la pantalla de la secci&oacute;n de cap&iacute;tulos.</p>\r\n\r\n<p style=\"text-align:justify\">&nbsp;</p>\r\n\r\n<p style=\"text-align:justify\"><strong>(Espacio para figura)</strong></p>\r\n\r\n<p style=\"text-align:justify\">&nbsp;</p>\r\n\r\n<p style=\"text-align:justify\">Por &uacute;ltimo, en la pantalla de la figura 5.26 se muestra el contenido de todo un cap&iacute;tulo, el cual es accesible al utilizar el bot&oacute;n de &ldquo;Modificar Contenido&rdquo; de la ventana anterior. Esta secci&oacute;n est&aacute; compuesta por un acorde&oacute;n que, al extender por medio del icono de extensi&oacute;n, se mostrar&aacute; el formulario de ingreso de datos. De forma predeterminada al registrar un nuevo cap&iacute;tulo, se mostrar&aacute; solo un acorde&oacute;n, el cual servir&aacute; para escribir la introducci&oacute;n de dicho cap&iacute;tulo, por lo tanto, en caso de no necesitar de la introducci&oacute;n, simplemente se deja vac&iacute;o el campo.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p style=\"text-align:justify\">El bot&oacute;n de &ldquo;Agregar tema&rdquo; permite agregar m&aacute;s acordeones que representan el/los temas del cap&iacute;tulo y estos acordeones realizan la misma acci&oacute;n que el acorde&oacute;n predeterminado.&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p style=\"text-align:justify\">En caso de agregar un subtema por medio de su respectivo bot&oacute;n, se realizar&aacute; un proceso similar al de agregar un tema, aunque el acorde&oacute;n ser&aacute; un poco m&aacute;s peque&ntilde;o, esto con el fin de representar al tema que le corresponde.&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p style=\"text-align:justify\">En caso de eliminar un tema o subtema se procede a utilizar el bot&oacute;n de &ldquo;Eliminar&rdquo;, y este eliminar&aacute; el subtema y en el caso de los temas eliminar&aacute; todo lo relacionado al mismo, incluyendo los subtemas.&nbsp;&nbsp;En la figura 5.26 se puede observar la ventana del contenido de un cap&iacute;tulo:</p>\r\n\r\n<p style=\"text-align:justify\">&nbsp;</p>\r\n\r\n<p style=\"text-align:justify\"><strong>(Espacio para figura)</strong></p>\r\n\r\n<p style=\"text-align:justify\">&nbsp;</p>\r\n\r\n<p><u>Bit&aacute;cora</u></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p style=\"text-align:justify\">La secci&oacute;n de la bit&aacute;cora ha sido dise&ntilde;ada para que el usuario conozca el historial de las actividades realizadas en cada secci&oacute;n del documento de graduaci&oacute;n. Este apartado se ha creado de modo que sea sencillo para el usuario poder observar el historial de actividades sin tener que realizar tantos procedimientos. Al igual que las dem&aacute;s pantallas la cabecera contiene el color azul con tono de naranja en su borde inferior. Comparte la divisi&oacute;n en 2 partes del formulario que contiene la secci&oacute;n de cap&iacute;tulos con la diferencia que en su primera parte contiene el filtrado para la bit&aacute;cora.&nbsp;</p>\r\n\r\n<p style=\"text-align:justify\">&nbsp;</p>\r\n\r\n<p style=\"text-align:justify\">Esta primera secci&oacute;n contiene 3 men&uacute;s desplegables, en donde cada men&uacute; contiene opciones diferentes, como: filtrar las acciones: crear, agregaci&oacute;n, edici&oacute;n y eliminaci&oacute;n; el segundo men&uacute; filtra las secciones que han sufrido alguna modificaci&oacute;n y el tercer men&uacute; sirve para filtrar en base a los integrantes del equipo.&nbsp;</p>\r\n\r\n<p style=\"text-align:justify\">&nbsp;</p>\r\n\r\n<p style=\"text-align:justify\">La segunda secci&oacute;n contiene las acciones que se han realizado en el documento, donde se puede conocer qui&eacute;n realiz&oacute; la modificaci&oacute;n, la acci&oacute;n que se ha realizado y la fecha que se hizo la modificaci&oacute;n. Adem&aacute;s, de que se cuenta con un bot&oacute;n para poder observar m&aacute;s a detalle la acci&oacute;n realizada.</p>\r\n\r\n<p style=\"text-align:justify\">&nbsp;</p>\r\n\r\n<p style=\"text-align:justify\"><strong>(Espacio para figura)</strong></p>', 6, 53, '2022-07-13 23:59:32', '2022-07-15 11:28:17'),
(44, 'Almacenamiento de los datos del Módulo de Administración', '<p>El m&oacute;dulo de Administraci&oacute;n es el encargado de manejar los datos del sitio web, por lo que para su funcionamiento se utiliz&oacute; un paquete de administraci&oacute;n exclusiva de Laravel llamado Voyager, el cual posee una base de datos con una estructura predeterminada. En dicho m&oacute;dulo se tienen 13 tablas, las cuales se describen a continuaci&oacute;n:</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><strong>(Espacio para tabla)</strong></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p style=\"text-align:justify\">Posteriormente, se observa una descripci&oacute;n detallada de cada campo de las tablas mencionadas anteriormente:</p>\r\n\r\n<p style=\"text-align:justify\">&nbsp;</p>\r\n\r\n<p style=\"text-align:justify\"><strong>(Espacio para tabla)</strong></p>\r\n\r\n<p style=\"text-align:justify\"><strong>(Espacio para tabla)</strong></p>\r\n\r\n<p style=\"text-align:justify\"><strong>(Espacio para tabla)</strong></p>\r\n\r\n<p style=\"text-align:justify\"><strong>(Espacio para tabla)</strong></p>\r\n\r\n<p style=\"text-align:justify\"><strong>(Espacio para tabla)</strong></p>\r\n\r\n<p style=\"text-align:justify\"><strong>(Espacio para tabla)</strong></p>\r\n\r\n<p style=\"text-align:justify\"><strong>(Espacio para tabla)</strong></p>\r\n\r\n<p style=\"text-align:justify\"><strong>(Espacio para tabla)</strong></p>\r\n\r\n<p style=\"text-align:justify\"><strong>(Espacio para tabla)</strong></p>\r\n\r\n<p style=\"text-align:justify\"><strong>(Espacio para tabla)</strong></p>\r\n\r\n<p style=\"text-align:justify\"><strong>(Espacio para tabla)</strong></p>\r\n\r\n<p style=\"text-align:justify\"><strong>(Espacio para tabla)</strong></p>\r\n\r\n<p style=\"text-align:justify\"><strong>(Espacio para tabla)</strong></p>\r\n\r\n<p style=\"text-align:justify\">&nbsp;</p>\r\n\r\n<p style=\"text-align:justify\">En un diagrama entidad-relaci&oacute;n, se muestra de una mejor manera la estructura, las tablas y relaciones que el m&oacute;dulo de Administraci&oacute;n posee, como se puede observar a continuaci&oacute;n:</p>\r\n\r\n<p style=\"text-align:justify\">&nbsp;</p>\r\n\r\n<p style=\"text-align:justify\"><strong>(Espacio para figura)</strong></p>', 8, 54, '2022-07-13 23:59:32', '2022-07-15 11:16:54'),
(45, 'Almacenamiento de los datos del Módulo del Director de Carrera y Estudiante', '<p>El m&oacute;dulo del Director de Carrera se encarga de formar a los grupos de los trabajos de graduaci&oacute;n, asimismo, se les asigna Director del trabajo de graduaci&oacute;n, Segundo Lector y su respectivo tema. Tambi&eacute;n tiene la funci&oacute;n de agregar y modificar a Directores o Lectores externos, es decir personas ajenas a la Universidad y que ser&aacute;n de ayuda en la realizaci&oacute;n del proceso de graduaci&oacute;n.</p>\r\n\r\n<p style=\"text-align:justify\">&nbsp;</p>\r\n\r\n<p style=\"text-align:justify\">El m&oacute;dulo de los estudiantes egresados se encarga de la creaci&oacute;n de cada una de las secciones del documento, las cuales se guardan en diferentes tablas de la base de datos, de igual forma, en dicho m&oacute;dulo se crea un registro de cada movimiento realizado en el documento de cada grupo, por lo que se mantiene un historial de las acciones realizadas, como lo son: agregar, modificar, crear y eliminar.</p>\r\n\r\n<p style=\"text-align:justify\">&nbsp;</p>\r\n\r\n<p style=\"text-align:justify\">Para ambos m&oacute;dulos mencionados anteriormente, se tienen 26 tablas en la base de datos, las cuales se describen a continuaci&oacute;n:</p>\r\n\r\n<p style=\"text-align:justify\">&nbsp;</p>\r\n\r\n<p style=\"text-align:justify\"><strong>(Espacio para tabla)</strong></p>\r\n\r\n<p style=\"text-align:justify\">&nbsp;</p>\r\n\r\n<p style=\"text-align:justify\">Posteriormente, se observa una descripci&oacute;n detallada de cada campo de las tablas mencionadas anteriormente:</p>\r\n\r\n<p style=\"text-align:justify\">&nbsp;</p>\r\n\r\n<p style=\"text-align:justify\"><strong>(Espacio para tabla)</strong></p>\r\n\r\n<p style=\"text-align:justify\"><strong>(Espacio para tabla)</strong></p>\r\n\r\n<p style=\"text-align:justify\"><strong>(Espacio para tabla)</strong></p>\r\n\r\n<p style=\"text-align:justify\"><strong>(Espacio para tabla)</strong></p>\r\n\r\n<p style=\"text-align:justify\"><strong>(Espacio para tabla)</strong></p>\r\n\r\n<p style=\"text-align:justify\"><strong>(Espacio para tabla)</strong></p>\r\n\r\n<p style=\"text-align:justify\"><strong>(Espacio para tabla)</strong></p>\r\n\r\n<p style=\"text-align:justify\"><strong>(Espacio para tabla)</strong></p>\r\n\r\n<p style=\"text-align:justify\"><strong>(Espacio para tabla)</strong></p>\r\n\r\n<p style=\"text-align:justify\"><strong>(Espacio para tabla)</strong></p>\r\n\r\n<p style=\"text-align:justify\"><strong>(Espacio para tabla)</strong></p>\r\n\r\n<p style=\"text-align:justify\"><strong>(Espacio para tabla)</strong></p>\r\n\r\n<p style=\"text-align:justify\"><strong>(Espacio para tabla)</strong></p>\r\n\r\n<p style=\"text-align:justify\"><strong>(Espacio para tabla)</strong></p>\r\n\r\n<p style=\"text-align:justify\"><strong>(Espacio para tabla)</strong></p>\r\n\r\n<p style=\"text-align:justify\"><strong>(Espacio para tabla)</strong></p>\r\n\r\n<p style=\"text-align:justify\"><strong>(Espacio para tabla)</strong></p>\r\n\r\n<p style=\"text-align:justify\"><strong>(Espacio para tabla)</strong></p>\r\n\r\n<p style=\"text-align:justify\"><strong>(Espacio para tabla)</strong></p>\r\n\r\n<p style=\"text-align:justify\"><strong>(Espacio para tabla)</strong></p>\r\n\r\n<p style=\"text-align:justify\"><strong>(Espacio para tabla)</strong></p>\r\n\r\n<p style=\"text-align:justify\"><strong>(Espacio para tabla)</strong></p>\r\n\r\n<p style=\"text-align:justify\"><strong>(Espacio para tabla)</strong></p>\r\n\r\n<p style=\"text-align:justify\"><strong>(Espacio para tabla)</strong></p>\r\n\r\n<p style=\"text-align:justify\"><strong>(Espacio para tabla)</strong></p>\r\n\r\n<p style=\"text-align:justify\">&nbsp;</p>\r\n\r\n<p>En un diagrama entidad-relaci&oacute;n, se muestra de una mejor manera la estructura, las tablas y relaciones que el m&oacute;dulo del Estudiante y Director de Carrera poseen, como se puede observar a continuaci&oacute;n:</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><strong>(Espacio para figura)</strong></p>', 9, 54, '2022-07-13 23:59:32', '2022-07-15 11:20:03'),
(46, 'Administración de usuarios', '<p><strong>(Espacio para tabla)</strong></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><strong>(Espacio para figura)</strong></p>', 11, 55, '2022-07-13 23:59:32', '2022-07-15 11:20:03'),
(47, 'Administración de grupos de trabajo de graduación', '<p><strong>(Espacio para tabla)</strong></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><strong>(Espacio para figura)</strong></p>', 12, 55, '2022-07-13 23:59:32', '2022-07-15 11:20:03'),
(48, 'Administrador de Director de trabajo y Lector de graduación externos', '<p><strong>(Espacio para tabla)</strong></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><strong>(Espacio para figura)</strong></p>', 13, 55, '2022-07-13 23:59:32', '2022-07-15 11:20:03'),
(49, 'Personalización de perfil', '<p><strong>(Espacio para tabla)</strong></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><strong>(Espacio para figura)</strong></p>', 14, 55, '2022-07-13 23:59:32', '2022-07-15 11:20:03'),
(50, 'Creación de sección de resumen de trabajo de graduación', '<p><strong>(Espacio para tabla)</strong></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><strong>(Espacio para figura)</strong></p>', 15, 55, '2022-07-13 23:59:32', '2022-07-15 11:20:03'),
(51, 'Creación de sección agradecimientos de trabajo de graduación', '<p><strong>(Espacio para tabla)</strong></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><strong>(Espacio para figura)</strong></p>', 16, 55, '2022-07-13 23:59:32', '2022-07-15 11:20:03'),
(52, 'Creación de sección de dedicatoria de trabajo de graduación', '<p><strong>(Espacio para tabla)</strong></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><strong>(Espacio para figura)</strong></p>', 17, 55, '2022-07-13 23:59:32', '2022-07-15 11:20:03'),
(53, 'Creación de sección de capítulos de trabajo de graduación', '<p><strong>(Espacio para tabla)</strong></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><strong>(Espacio para figura)</strong></p>', 18, 55, '2022-07-13 23:59:32', '2022-07-15 11:20:03'),
(54, 'Creación de glosario de trabajo de graduación', '<p><strong>(Espacio para tabla)</strong></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><strong>(Espacio para figura)</strong></p>', 19, 55, '2022-07-13 23:59:32', '2022-07-15 11:20:03'),
(55, 'Creación de sección de abreviaturas de trabajo de graduación', '<p><strong>(Espacio para tabla)</strong></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><strong>(Espacio para figura)</strong></p>', 20, 55, '2022-07-13 23:59:32', '2022-07-15 11:20:03'),
(56, 'Creación de sección de siglas de trabajo de graduación', '<p><strong>(Espacio para tabla)</strong></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><strong>(Espacio para figura)</strong></p>', 21, 55, '2022-07-13 23:59:32', '2022-07-15 11:20:03'),
(57, 'Creación de sección de nomenclaturas de trabajo de graduación', '<p><strong>(Espacio para tabla)</strong></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><strong>(Espacio para figura)</strong></p>', 22, 55, '2022-07-13 23:59:32', '2022-07-15 11:20:03'),
(58, 'Creación de sección de referencias de trabajo de graduación', '<p><strong>(Espacio para tabla)</strong></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><strong>(Espacio para figura)</strong></p>', 23, 55, '2022-07-13 23:59:32', '2022-07-15 11:20:03'),
(59, 'Creación del documento de trabajo de graduación', '<p><strong>(Espacio para tabla)</strong></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><strong>(Espacio para figura)</strong></p>', 24, 55, '2022-07-13 23:59:32', '2022-07-15 11:20:03'),
(60, 'Herramientas de desarrollo', '<p>Como se mencion&oacute; anteriormente, se han utilizado diversas herramientas que facilitaron el desarrollo del sistema, los cuales son:</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<ul>\r\n	<li style=\"text-align:justify\"><u>Visual Studio Code:</u> es un editor de c&oacute;digo abierto de software libre, desarrollado por Microsoft en el cual se puede ejecutar en los diferentes sistemas operativos como lo son: Windows, MacOS y Linux. VSC tiene caracter&iacute;sticas que lo vuelven similar a un IDE de programaci&oacute;n, como: resaltado de texto, escritura inteligente de texto, sugerencias de texto personalizadas dependiendo del lenguaje en el que se trabaje, entre otras. Este editor de c&oacute;digo fuente, fue utilizado para la codificaci&oacute;n de la interfaz de usuario y sus respectivos m&oacute;dulos, utilizando Laravel 8.&nbsp;</li>\r\n	<li style=\"text-align:justify\"><u>phpMyAdmin:</u> es una herramienta de software libre escrita en PHP, que es utilizado para el manejo de administraci&oacute;n de MySQL en la Web y, asimismo, phpMyAdmin tiene la capacidad de realizar una gama de distintas operaciones en MySQL y MariaDB.</li>\r\n	<li style=\"text-align:justify\"><u>dbdiagram.io:</u> es una herramienta dise&ntilde;ada para desarrolladores y analista de datos, lo cual es gratuita y sencilla de utilizar. Dicha herramienta est&aacute; destinada a dibujar diagramas entidad-relaci&oacute;n simplemente al escribir c&oacute;digo.</li>\r\n</ul>', 2, 57, '2022-07-14 00:01:44', '2022-07-14 03:05:07'),
(61, 'Metodología de las pruebas', '<p style=\"text-align:justify\">A lo largo del proceso de desarrollo se realizaron pruebas unitarias antes de unir cada m&oacute;dulo, esto con el prop&oacute;sito de que la integraci&oacute;n entre los mismos fuera lo m&aacute;s limpia y r&aacute;pida posible, por lo que cualquier posible defecto podr&iacute;a ser solucionado a tiempo.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p style=\"text-align:justify\">Realizar un ciclo de pruebas de sistema antes de realizar cualquier entrega es considerada una buena pr&aacute;ctica al momento de desarrollar cualquier aplicativo, ya que en la mayor&iacute;a de ocasiones la revisi&oacute;n de m&oacute;dulos independientes, no puede indicar como ser&aacute; el comportamiento general del sistema una vez est&eacute;n integrados todos los m&oacute;dulos.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p style=\"text-align:justify\">A continuaci&oacute;n, se muestra el formato que se ha considerado para la documentaci&oacute;n de las pruebas de sistema:&nbsp;</p>\r\n\r\n<p style=\"text-align:justify\">&nbsp;</p>\r\n\r\n<p style=\"text-align:justify\"><strong>(ESPACIO PARA TABLA)</strong></p>', 4, 58, '2022-07-14 00:01:44', '2022-07-14 03:05:07'),
(62, 'Desarrollo de las pruebas del sistema', '<p>Las pruebas estar&aacute;n comprendidas en dos tablas, en donde se documentan los resultados obtenidos de cada m&oacute;dulo (Estudiante y Director de Carrera).</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><strong>(ESPACIO PARA TABLA 1)</strong></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><strong>(ESPACIO PARA TABLA 2)</strong></p>', 5, 58, '2022-07-14 00:01:44', '2022-07-14 03:05:07');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_abreviatura`
--

CREATE TABLE `tipo_abreviatura` (
  `id` int(11) NOT NULL,
  `nombre_tipo_abreviatura` varchar(20) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `tipo_abreviatura`
--

INSERT INTO `tipo_abreviatura` (`id`, `nombre_tipo_abreviatura`, `created_at`, `updated_at`) VALUES
(1, 'Abreviatura', '2022-05-20 06:19:17', '2022-05-20 06:19:17'),
(2, 'Sigla', '2022-05-20 06:19:17', '2022-05-20 06:19:17'),
(3, 'Nomenclatura', '2022-05-20 06:19:17', '2022-05-20 06:19:17');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_empleado`
--

CREATE TABLE `tipo_empleado` (
  `id` int(11) NOT NULL,
  `nombre_tipo_empleado` varchar(20) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `tipo_empleado`
--

INSERT INTO `tipo_empleado` (`id`, `nombre_tipo_empleado`, `created_at`, `updated_at`) VALUES
(1, 'Academico', '2022-05-20 06:19:18', '2022-05-20 06:19:18'),
(2, 'Administrativo', '2022-05-20 06:19:18', '2022-05-20 06:19:18'),
(3, 'Servicio', '2022-05-20 06:19:18', '2022-05-20 06:19:18');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_usuario`
--

CREATE TABLE `tipo_usuario` (
  `id` int(11) NOT NULL,
  `nombre` varchar(30) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `tipo_usuario`
--

INSERT INTO `tipo_usuario` (`id`, `nombre`, `created_at`, `updated_at`) VALUES
(1, 'Estudiante', '2022-05-20 06:19:18', '2022-05-20 06:19:18'),
(2, 'Director de carrera', '2022-05-20 06:19:18', '2022-05-20 06:19:18');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `translations`
--

CREATE TABLE `translations` (
  `id` int(10) UNSIGNED NOT NULL,
  `table_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `column_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `foreign_key` int(10) UNSIGNED NOT NULL,
  `locale` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `avatar` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT 'users/default.png',
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `settings` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`id`, `role_id`, `name`, `email`, `avatar`, `email_verified_at`, `password`, `remember_token`, `settings`, `created_at`, `updated_at`) VALUES
(1, 1, 'admin', 'admin@admin.com', 'users\\June2022\\RD9mfJUeLdY1yJuqrTJb.png', NULL, '$2y$10$0K.xhMg/W1ssYrJR/8Kjve7xuDnP.UwFxWVdkz4wCp78C5YRu8BrG', NULL, '{\"locale\":\"en\"}', '2022-04-15 04:09:47', '2022-06-20 05:02:46'),
(3, 2, 'eduardo', 'eduardo@gmail.com', 'users/default.png', NULL, '$2y$10$0K.xhMg/W1ssYrJR/8Kjve7xuDnP.UwFxWVdkz4wCp78C5YRu8BrG', NULL, '{\"locale\":\"en\"}', '2022-05-26 22:28:33', '2022-05-27 03:58:40');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `user_roles`
--

CREATE TABLE `user_roles` (
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `id` int(11) NOT NULL,
  `foto` varchar(200) NOT NULL DEFAULT 'img/profile.png',
  `email` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `tipo_usuario_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`id`, `foto`, `email`, `password`, `tipo_usuario_id`, `created_at`, `updated_at`) VALUES
(13, 'img/profile.png', '00128917@uca.edu.sv', '$2y$10$foE3Sy7G/aeJ0ngr58CVkeff65xX.cPOWnAP7RE3pz5somrZnCaQe', 1, '2022-07-05 17:06:44', '2022-07-18 03:17:38'),
(14, 'img/profile.png', '00170517@uca.edu.sv', '$2y$10$QF1LEjwSw.6tXSxX32fV7.kk55Jz1N23Q9KGMMLrMurRJPMGZC3mu', 1, '2022-07-05 17:06:44', '2022-07-18 03:17:53'),
(15, 'img/profile.png', '00017917@uca.edu.sv', '$2y$10$vzAOL.CCrvYzYdn4qdnzrO0ufL4WNdTVQtarZs7FuhPForupU8/jK', 1, '2022-07-05 17:06:44', '2022-07-18 03:18:05'),
(16, 'img/profile.png', '00167917@uca.edu.sv', '$2y$10$2i5wiy/4EigNRgF4UFIL7.MfHiD9NTpPcclnBi7MaavSFgiFl3UAO', 1, '2022-07-05 17:06:44', '2022-07-18 03:18:30'),
(17, 'img/profile.png', '00029117@uca.edu.sv', '$2y$10$KieS7.Ml3wSpLCz4azKGnuQmAme/x0BKt9qejVI4X4zamzUwoK4MG', 1, '2022-07-05 17:06:44', '2022-07-18 03:18:43'),
(18, 'img/profile.png', '00209317@uca.edu.sv', '$2y$10$fZxa4wPOI4UudF30K1xkUuWznaWJC8sXnRyLQTgmnJM6vqhzq4oPa', 1, '2022-07-05 17:06:44', '2022-07-18 03:18:58'),
(19, 'img/profile.png', '00127717@uca.edu.sv', '$2y$10$0DHhMjQwjZ5sl1J1jToUOelUZNz1lhp6lBGGOTRSanwWFncs2gtUO', 1, '2022-07-05 17:06:44', '2022-07-18 03:19:14'),
(20, 'img/profile.png', '00024117@uca.edu.sv', '$2y$10$IqJvTyFTcbQMVQ.6VRuVMeXlcGlRw.UgX1lFIAbi6gpDXLUAf1sue', 1, '2022-07-05 17:06:44', '2022-07-18 03:19:31'),
(21, 'img/profile.png', '00184217@uca.edu.sv', '$2y$10$LhZ3oA/ELsvRPZLYbGFN0OIrsmRmLnGgkGPvkUmKVK6sNVFGGTH2K', 1, '2022-07-05 17:06:44', '2022-07-18 03:19:53'),
(22, 'img/profile.png', '00076017@uca.edu.sv', '$2y$10$1pzw8D3IhaqxY4ajFajnJeLvRFCeup77dvFmcedYMaILuAaX9Qxge', 1, '2022-07-05 17:06:44', '2022-07-18 03:20:11'),
(23, 'img/profile.png', '00004817@uca.edu.sv', '$2y$10$U62hNAYVpSvFX8FIWivXtOkV1c1wvjSg2NZz6aWrjwCg.iS3ns7oG', 1, '2022-07-05 17:06:44', '2022-07-18 03:20:36'),
(24, 'img/profile.png', '00038617@uca.edu.sv', '$2y$10$FIRrrJxgPGNP6rXJHPe/uO.jwBcLZDmgHApyws7qMIZ3uuoJJ.Wn2', 1, '2022-07-05 17:06:44', '2022-07-18 03:20:59'),
(25, 'img/profile.png', '00163217@uca.edu.sv', '$2y$10$v9yQT.YJkLis9ZfuLrJrZOzf3UTeMz5.UOfFEARPCX8.rvW.Qy97O', 1, '2022-07-05 17:06:44', '2022-07-18 03:21:12'),
(26, 'img/profile.png', '00001617@uca.edu.sv', '$2y$10$4J/UE8L9j9Po0gdVbxy8COktnbY1KZfMQcvA/EVZFDMnZWxKDLfUe', 1, '2022-07-05 17:06:44', '2022-07-18 03:21:24'),
(27, 'img/profile.png', '00189617@uca.edu.sv', '$2y$10$NP0j8VAqorKlXECTG21AReqZA6iYcCWeVwWJNJHV61aVEwKY9gmQm', 1, '2022-07-05 17:06:44', '2022-07-18 03:21:38'),
(28, 'img/profile.png', '00111317@uca.edu.sv', '$2y$10$Ffk2gyhC7ZXlGKZH7xzMeuWb.x4dVwcyvBmqxwM.49QGaumC5HQjC', 1, '2022-07-05 17:06:44', '2022-07-18 03:21:59'),
(29, 'img/profile.png', '00120617@uca.edu.sv', '$2y$10$C4SNmd4ZKEreHP8sH.Ul1OE8jlKsehYxaUdQeon.Og4lL9G1j1fk6', 1, '2022-07-05 17:06:44', '2022-07-18 03:22:15'),
(30, 'img/profile.png', '00300917@uca.edu.sv', '$2y$10$.ysstzgP5CKpT4J6dZ4M9.eqbl99Olj6y45RrDgmlYtSBZZB4Pf4O', 1, '2022-07-05 17:06:44', '2022-07-18 03:22:30'),
(31, 'img/profile.png', '00004017@uca.edu.sv', '$2y$10$/1KOut.eKEEiSAgRXEY3LuW6TE93j3HXW0F74CHzACkpqfIZdY3rK', 1, '2022-07-05 17:06:44', '2022-07-18 03:22:52'),
(32, 'img/profile.png', '00122717@uca.edu.sv', '$2y$10$dsWEbsABh4XvF0vQl6Md0..AzvcTrvKXqBi.49at9jpK4ksPNSuYO', 1, '2022-07-05 17:06:44', '2022-07-18 03:23:05'),
(33, 'img/profile.png', '00103017@uca.edu.sv', '$2y$10$e/MPWBx54ZOdB1XRrx5CN.ChWFqx7.7XIVPMYEycJEPr6IaaxnLKS', 1, '2022-07-05 17:06:44', '2022-07-18 03:24:59'),
(34, 'img/profile.png', '00032515@uca.edu.sv', '$2y$10$CjROvpDaYjk/.t9/4nKYkOQMwCTRkpHUsaEvILxZ.LlkYKtfd2oNa', 1, '2022-07-05 17:06:44', '2022-07-18 03:25:23'),
(35, 'img/profile.png', '00076617@uca.edu.sv', '$2y$10$uLN9xkNOgLr6vLiwKGTtXOOuEiNVK.OBx2K9CmARTpj5Uon4iREV2', 1, '2022-07-05 17:06:44', '2022-07-18 03:25:39'),
(36, 'img/profile.png', '00267016@uca.edu.sv', '$2y$10$kWrH3/HrJV7FmFjCftQee.QqTV3kj5wTGllmAi5RsvrkFWhtb2iuC', 1, '2022-07-05 17:06:44', '2022-07-18 03:25:54'),
(37, 'img/profile.png', '00018316@uca.edu.sv', '$2y$10$tVK1.VB7DT5llZHc6GE1gedso8NB5V8PamxuB/fv9ehYRaLLjoKwy', 1, '2022-07-05 17:06:44', '2022-07-18 03:26:08'),
(38, 'img/profile.png', '00125717@uca.edu.sv', '$2y$10$WsOnepvskf4IgT.9h4Uc.OWAe/bt2P74Oph/19PVlPBuLdm/u6TI2', 1, '2022-07-05 17:06:44', '2022-07-18 03:26:21'),
(39, 'img/profile.png', '00092217@uca.edu.sv', '$2y$10$yJqy86Hx9N15tNtYODC5B.6PFgAa03hM5tY4KrtVyDfR/DtwvBdLm', 1, '2022-07-05 17:06:45', '2022-07-18 03:05:58'),
(40, 'img/profile.png', '00086917@uca.edu.sv', '$2y$10$xscSvO6jb2Euu.rmKldavusjfuw1tI/lR17MrD.qlu257HkZuEKzG', 1, '2022-07-05 17:06:45', '2022-07-18 03:13:18'),
(41, 'img/profile.png', '00078217@uca.edu.sv', '$2y$10$RSj5fcbC31tF9x6iEXckU.6RYCmr97H2n09nBvED/imsHLQFKLlgG', 1, '2022-07-05 17:06:45', '2022-07-18 03:13:28'),
(42, 'img/profile.png', '00062217@uca.edu.sv', '$2y$10$GPrWF6TGN90M.1FOtI..9eicohkuWZs91ghlZ55rtRNT.liENXKya', 1, '2022-07-05 17:06:45', '2022-07-18 03:13:38'),
(43, 'img/profile.png', '00127417@uca.edu.sv', '$2y$10$3poxBuUf1INQc6c3N.2.gesp9LPuwwf/GKU2aVzB70MYpGspXHQbO', 1, '2022-07-05 17:06:45', '2022-07-18 03:13:49'),
(44, 'img/profile.png', '00120717@uca.edu.sv', '$2y$10$BOFUSHYKuew1yQhZmbCWyO2AJHhCSsXtNeGAPk0rwgoSr5xKtGskS', 1, '2022-07-05 17:06:45', '2022-07-18 03:14:05'),
(45, 'img/profile.png', '00108517@uca.edu.sv', '$2y$10$rkEf/S0h4R24gHoERdWUAutMEyNSZyqBJ5R13AOW2mLHkDzkU951m', 1, '2022-07-05 17:06:45', '2022-07-18 03:14:17'),
(46, 'img/profile.png', '00046317@uca.edu.sv', '$2y$10$pZRaOUGyia7wr0DssQsFWe2W8jnDRdV1zjf6k69U2oUYVYK6Rfd7.', 1, '2022-07-05 17:06:45', '2022-07-18 03:14:28'),
(47, 'img/profile.png', '00046517@uca.edu.sv', '$2y$10$Zth3xKTp9IrZv2.DfdmsuuJGBqlRmXUBBDf1pN7TKxOUQePMzsolu', 1, '2022-07-05 17:06:45', '2022-07-18 03:14:38'),
(48, 'img/profile.png', '00118717@uca.edu.sv', '$2y$10$GcfTauN/Nppx7PbX8OZt8eCQcr/d8Zj63770Y72uNYo//FximrbCW', 1, '2022-07-05 17:06:45', '2022-07-18 03:14:51'),
(49, 'img/profile.png', '00024317@uca.edu.sv', '$2y$10$4Y0KOYXR3.S.eRqraV0wpOfDgg2MQwYaX1N.5/CNudxXHEicez0hi', 1, '2022-07-05 17:06:45', '2022-07-18 03:15:02'),
(50, 'img/profile.png', '00049717@uca.edu.sv', '$2y$10$vgEDsgvucXYLnaBGoK5pJuPD2JeF6ttYLVSFMAJILp4/XXEWfkW7y', 1, '2022-07-05 17:06:45', '2022-07-18 03:15:18'),
(51, 'img/profile.png', '00162317@uca.edu.sv', '$2y$10$JHIxKguJI6y4eHOAOImTx.G1nHt2eeqe0XgF0Mo07CWRpZR6Flm7C', 1, '2022-07-05 17:06:45', '2022-07-18 03:15:29'),
(52, 'img/profile.png', '00082817@uca.edu.sv', '$2y$10$JDgNBM/8KtmWVwdcQ7H8TeAb9LZV63ZYNnTFypKPxTppZC4bblU2u', 1, '2022-07-05 17:06:45', '2022-07-18 03:15:44'),
(53, 'img/profile.png', '00148816@uca.edu.sv', '$2y$10$74uknT5QwJk8Xs.8TGYjSekKZjup61Vuk4oFC9IGJu23glBDnC2Ky', 1, '2022-07-05 17:06:45', '2022-07-18 03:15:57'),
(54, 'img/usuarios/5400092117@uca.edu.sv.png', '00092117@uca.edu.sv', '$2y$10$8xsoFM2bBj2jcCtORoU5WOp3UnpUPmmLRYJggAAL2X.22HWnAxsm6', 1, '2022-07-05 17:06:00', '2022-08-01 10:46:17'),
(55, 'img/profile.png', '00159817@uca.edu.sv', '$2y$10$FBz04fRWCUjvic/GydO.1.fIUzweMa8cCmyvdFnd0iPwz8YhADgh6', 1, '2022-07-05 17:06:00', '2022-07-06 06:40:01'),
(56, 'img/profile.png', '00068817@uca.edu.sv', '$2y$10$McRU3QRhh.X1ijiXTCfETeA1QsyOR8SJuTVCC9WoAGMBaqx1UqtrO', 1, '2022-07-05 17:06:00', '2022-07-06 06:40:36'),
(57, 'img/profile.png', '00030717@uca.edu.sv', '$2y$10$xYMkMLm2N.a1gN3MeRr0Ae4/FO0PuQvKArIUeOX1xhQzvNO1Cutjm', 1, '2022-07-05 17:06:45', '2022-07-18 03:16:11'),
(58, 'img/profile.png', '00087717@uca.edu.sv', '$2y$10$b0ccoN3TjRAkgnUUzdd9fO.I34cbQfO5nCnBqZrwQv9ATVLZru/jW', 1, '2022-07-05 17:06:45', '2022-07-18 03:16:27'),
(59, 'img/profile.png', '00060917@uca.edu.sv', '$2y$10$NG6h.8XSBstg536HCqEJ4OKtSqrtzaTOkcUA/yorLczdGbxrhhuyq', 1, '2022-07-05 17:06:45', '2022-07-18 03:16:40'),
(60, 'img/profile.png', '00082217@uca.edu.sv', '$2y$10$9BKRs6t7mD0em.msA0FW0uJNSdedPU4PzDo2ntpxGIGQPb.wAN/Cu', 1, '2022-07-05 17:06:45', '2022-07-18 03:16:55'),
(61, 'img/profile.png', '00012217@uca.edu.sv', '$2y$10$ytpeFP7cP/6fVbtT544kCOXhe5.AUpJpWEtUi6j8SawWPRzY.zza2', 1, '2022-07-05 17:06:45', '2022-07-18 03:17:09'),
(62, 'img/profile.png', '00097017@uca.edu.sv', '$2y$10$DohOlYt8CcS62esG4VhLReZSCPnWHP.FGSLmqqkQkzspjtLpw7cQa', 1, '2022-07-05 17:06:45', '2022-07-18 03:17:21'),
(63, 'img/profile.png', 'earaujo@uca.edu.sv', '$2y$10$bNBJRlqWPTofWyQe9V3cIeSrtq4/R1G5MO1ucTxQaOX5lXr3zkr7W', 2, '2022-07-05 18:33:00', '2022-07-06 02:44:05'),
(64, 'img/profile.png', 'fhuguet@uca.edu.sv', '$2y$10$gFPnfmXMVgDWR8GUqGf34O6wZGVnSkT0rfAlXngWgRAv2DOkRDSZ6', 2, '2022-07-18 06:03:59', '2022-07-18 06:03:59');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `bitacora`
--
ALTER TABLE `bitacora`
  ADD PRIMARY KEY (`id`),
  ADD KEY `estudiante_id` (`estudiante_id`),
  ADD KEY `bitacora_seccion_id` (`bitacora_seccion_id`),
  ADD KEY `bitacora_modificacion_id` (`bitacora_modificacion_id`);

--
-- Indices de la tabla `bitacora_modificacion`
--
ALTER TABLE `bitacora_modificacion`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `bitacora_seccion`
--
ALTER TABLE `bitacora_seccion`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `cargo`
--
ALTER TABLE `cargo`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `carrera`
--
ALTER TABLE `carrera`
  ADD PRIMARY KEY (`id`),
  ADD KEY `facultad_id` (`facultad_id`);

--
-- Indices de la tabla `configuracion_sistema`
--
ALTER TABLE `configuracion_sistema`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `contenido_seccion_capitulo`
--
ALTER TABLE `contenido_seccion_capitulo`
  ADD PRIMARY KEY (`id`),
  ADD KEY `seccion_capitulos_id` (`seccion_capitulo_id`);

--
-- Indices de la tabla `data_rows`
--
ALTER TABLE `data_rows`
  ADD PRIMARY KEY (`id`),
  ADD KEY `data_rows_data_type_id_foreign` (`data_type_id`);

--
-- Indices de la tabla `data_types`
--
ALTER TABLE `data_types`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `data_types_name_unique` (`name`),
  ADD UNIQUE KEY `data_types_slug_unique` (`slug`);

--
-- Indices de la tabla `departamento_unidad`
--
ALTER TABLE `departamento_unidad`
  ADD PRIMARY KEY (`id`),
  ADD KEY `facultad_id` (`facultad_id`);

--
-- Indices de la tabla `director_carrera`
--
ALTER TABLE `director_carrera`
  ADD PRIMARY KEY (`id`),
  ADD KEY `carrera_id` (`carrera_id`),
  ADD KEY `usuario_id` (`usuario_id`),
  ADD KEY `empleado_id` (`empleado_id`);

--
-- Indices de la tabla `empleado`
--
ALTER TABLE `empleado`
  ADD PRIMARY KEY (`id`),
  ADD KEY `tipo_empleado_id` (`tipo_empleado_id`),
  ADD KEY `cargo_id` (`cargo_id`),
  ADD KEY `departamento_unidad_id` (`departamento_unidad_id`);

--
-- Indices de la tabla `estudiante`
--
ALTER TABLE `estudiante`
  ADD PRIMARY KEY (`id`),
  ADD KEY `carrera_id` (`carrera_id`),
  ADD KEY `usuario_id` (`usuario_id`),
  ADD KEY `grupo_trabajo_id` (`grupo_trabajo_id`);

--
-- Indices de la tabla `externo`
--
ALTER TABLE `externo`
  ADD PRIMARY KEY (`id`),
  ADD KEY `departamento_unidad_id` (`departamento_unidad_id`);

--
-- Indices de la tabla `facultad`
--
ALTER TABLE `facultad`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `grupo_trabajo`
--
ALTER TABLE `grupo_trabajo`
  ADD PRIMARY KEY (`id`),
  ADD KEY `asesor_interno_id` (`asesor_interno_id`),
  ADD KEY `lector_interno_id` (`lector_interno_id`),
  ADD KEY `asesor_externo_id` (`asesor_externo_id`),
  ADD KEY `lector_externo_id` (`lector_externo_id`);

--
-- Indices de la tabla `menus`
--
ALTER TABLE `menus`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `menus_name_unique` (`name`);

--
-- Indices de la tabla `menu_items`
--
ALTER TABLE `menu_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `menu_items_menu_id_foreign` (`menu_id`);

--
-- Indices de la tabla `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indices de la tabla `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `permissions_key_index` (`key`);

--
-- Indices de la tabla `permission_role`
--
ALTER TABLE `permission_role`
  ADD PRIMARY KEY (`permission_id`,`role_id`),
  ADD KEY `permission_role_permission_id_index` (`permission_id`),
  ADD KEY `permission_role_role_id_index` (`role_id`);

--
-- Indices de la tabla `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `roles_name_unique` (`name`);

--
-- Indices de la tabla `seccion_abreviatura_nomenclatura_sigla`
--
ALTER TABLE `seccion_abreviatura_nomenclatura_sigla`
  ADD PRIMARY KEY (`id`),
  ADD KEY `tipo_abreviatura_id` (`tipo_abreviatura_id`),
  ADD KEY `grupo_trabajo_id` (`grupo_trabajo_id`);

--
-- Indices de la tabla `seccion_agradecimiento`
--
ALTER TABLE `seccion_agradecimiento`
  ADD PRIMARY KEY (`id`),
  ADD KEY `estudiante_id` (`estudiante_id`);

--
-- Indices de la tabla `seccion_capitulo`
--
ALTER TABLE `seccion_capitulo`
  ADD PRIMARY KEY (`id`),
  ADD KEY `grupo_trabajo_id` (`grupo_trabajo_id`);

--
-- Indices de la tabla `seccion_dedicatoria`
--
ALTER TABLE `seccion_dedicatoria`
  ADD PRIMARY KEY (`id`),
  ADD KEY `estudiante_id` (`estudiante_id`);

--
-- Indices de la tabla `seccion_glosario`
--
ALTER TABLE `seccion_glosario`
  ADD PRIMARY KEY (`id`),
  ADD KEY `grupo_trabajo_id` (`grupo_trabajo_id`);

--
-- Indices de la tabla `seccion_referencia`
--
ALTER TABLE `seccion_referencia`
  ADD PRIMARY KEY (`id`),
  ADD KEY `grupo_trabajo_id` (`grupo_trabajo_id`);

--
-- Indices de la tabla `seccion_resumen`
--
ALTER TABLE `seccion_resumen`
  ADD PRIMARY KEY (`id`),
  ADD KEY `grupo_trabajo_id` (`grupo_trabajo_id`);

--
-- Indices de la tabla `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `settings_key_unique` (`key`);

--
-- Indices de la tabla `subcontenido_seccion_capitulo`
--
ALTER TABLE `subcontenido_seccion_capitulo`
  ADD PRIMARY KEY (`id`),
  ADD KEY `contenido_seccion_capitulo_id` (`contenido_seccion_capitulo_id`);

--
-- Indices de la tabla `tipo_abreviatura`
--
ALTER TABLE `tipo_abreviatura`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `tipo_empleado`
--
ALTER TABLE `tipo_empleado`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `tipo_usuario`
--
ALTER TABLE `tipo_usuario`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `translations`
--
ALTER TABLE `translations`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `translations_table_name_column_name_foreign_key_locale_unique` (`table_name`,`column_name`,`foreign_key`,`locale`);

--
-- Indices de la tabla `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD KEY `users_role_id_foreign` (`role_id`);

--
-- Indices de la tabla `user_roles`
--
ALTER TABLE `user_roles`
  ADD PRIMARY KEY (`user_id`,`role_id`),
  ADD KEY `user_roles_user_id_index` (`user_id`),
  ADD KEY `user_roles_role_id_index` (`role_id`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD KEY `tipo_usuario_id` (`tipo_usuario_id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `bitacora`
--
ALTER TABLE `bitacora`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=349;

--
-- AUTO_INCREMENT de la tabla `bitacora_modificacion`
--
ALTER TABLE `bitacora_modificacion`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `bitacora_seccion`
--
ALTER TABLE `bitacora_seccion`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `cargo`
--
ALTER TABLE `cargo`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT de la tabla `carrera`
--
ALTER TABLE `carrera`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT de la tabla `configuracion_sistema`
--
ALTER TABLE `configuracion_sistema`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `contenido_seccion_capitulo`
--
ALTER TABLE `contenido_seccion_capitulo`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=62;

--
-- AUTO_INCREMENT de la tabla `data_rows`
--
ALTER TABLE `data_rows`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=211;

--
-- AUTO_INCREMENT de la tabla `data_types`
--
ALTER TABLE `data_types`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT de la tabla `departamento_unidad`
--
ALTER TABLE `departamento_unidad`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT de la tabla `director_carrera`
--
ALTER TABLE `director_carrera`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `empleado`
--
ALTER TABLE `empleado`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT de la tabla `estudiante`
--
ALTER TABLE `estudiante`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=65;

--
-- AUTO_INCREMENT de la tabla `externo`
--
ALTER TABLE `externo`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;

--
-- AUTO_INCREMENT de la tabla `facultad`
--
ALTER TABLE `facultad`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `grupo_trabajo`
--
ALTER TABLE `grupo_trabajo`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de la tabla `menus`
--
ALTER TABLE `menus`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `menu_items`
--
ALTER TABLE `menu_items`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;

--
-- AUTO_INCREMENT de la tabla `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT de la tabla `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=166;

--
-- AUTO_INCREMENT de la tabla `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `seccion_abreviatura_nomenclatura_sigla`
--
ALTER TABLE `seccion_abreviatura_nomenclatura_sigla`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `seccion_agradecimiento`
--
ALTER TABLE `seccion_agradecimiento`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT de la tabla `seccion_capitulo`
--
ALTER TABLE `seccion_capitulo`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT de la tabla `seccion_dedicatoria`
--
ALTER TABLE `seccion_dedicatoria`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT de la tabla `seccion_glosario`
--
ALTER TABLE `seccion_glosario`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `seccion_referencia`
--
ALTER TABLE `seccion_referencia`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `seccion_resumen`
--
ALTER TABLE `seccion_resumen`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT de la tabla `settings`
--
ALTER TABLE `settings`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `subcontenido_seccion_capitulo`
--
ALTER TABLE `subcontenido_seccion_capitulo`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=63;

--
-- AUTO_INCREMENT de la tabla `tipo_abreviatura`
--
ALTER TABLE `tipo_abreviatura`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `tipo_empleado`
--
ALTER TABLE `tipo_empleado`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `tipo_usuario`
--
ALTER TABLE `tipo_usuario`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `translations`
--
ALTER TABLE `translations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=65;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `bitacora`
--
ALTER TABLE `bitacora`
  ADD CONSTRAINT `bitacora_ibfk_1` FOREIGN KEY (`estudiante_id`) REFERENCES `estudiante` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `bitacora_ibfk_2` FOREIGN KEY (`bitacora_seccion_id`) REFERENCES `bitacora_seccion` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `bitacora_ibfk_3` FOREIGN KEY (`bitacora_modificacion_id`) REFERENCES `bitacora_modificacion` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `carrera`
--
ALTER TABLE `carrera`
  ADD CONSTRAINT `carrera_ibfk_1` FOREIGN KEY (`facultad_id`) REFERENCES `facultad` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `contenido_seccion_capitulo`
--
ALTER TABLE `contenido_seccion_capitulo`
  ADD CONSTRAINT `contenido_seccion_capitulo_ibfk_1` FOREIGN KEY (`seccion_capitulo_id`) REFERENCES `seccion_capitulo` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `data_rows`
--
ALTER TABLE `data_rows`
  ADD CONSTRAINT `data_rows_data_type_id_foreign` FOREIGN KEY (`data_type_id`) REFERENCES `data_types` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `departamento_unidad`
--
ALTER TABLE `departamento_unidad`
  ADD CONSTRAINT `departamento_unidad_ibfk_1` FOREIGN KEY (`facultad_id`) REFERENCES `facultad` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `director_carrera`
--
ALTER TABLE `director_carrera`
  ADD CONSTRAINT `director_carrera_ibfk_1` FOREIGN KEY (`carrera_id`) REFERENCES `carrera` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `director_carrera_ibfk_2` FOREIGN KEY (`usuario_id`) REFERENCES `usuario` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `director_carrera_ibfk_3` FOREIGN KEY (`empleado_id`) REFERENCES `empleado` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `empleado`
--
ALTER TABLE `empleado`
  ADD CONSTRAINT `empleado_ibfk_1` FOREIGN KEY (`tipo_empleado_id`) REFERENCES `tipo_empleado` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `empleado_ibfk_2` FOREIGN KEY (`cargo_id`) REFERENCES `cargo` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `empleado_ibfk_3` FOREIGN KEY (`departamento_unidad_id`) REFERENCES `departamento_unidad` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `estudiante`
--
ALTER TABLE `estudiante`
  ADD CONSTRAINT `estudiante_ibfk_1` FOREIGN KEY (`carrera_id`) REFERENCES `carrera` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `estudiante_ibfk_2` FOREIGN KEY (`usuario_id`) REFERENCES `usuario` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `estudiante_ibfk_3` FOREIGN KEY (`grupo_trabajo_id`) REFERENCES `grupo_trabajo` (`id`) ON DELETE SET NULL ON UPDATE SET NULL;

--
-- Filtros para la tabla `externo`
--
ALTER TABLE `externo`
  ADD CONSTRAINT `externo_ibfk_1` FOREIGN KEY (`departamento_unidad_id`) REFERENCES `departamento_unidad` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `grupo_trabajo`
--
ALTER TABLE `grupo_trabajo`
  ADD CONSTRAINT `grupo_trabajo_ibfk_1` FOREIGN KEY (`asesor_interno_id`) REFERENCES `empleado` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `grupo_trabajo_ibfk_2` FOREIGN KEY (`lector_interno_id`) REFERENCES `empleado` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `grupo_trabajo_ibfk_3` FOREIGN KEY (`asesor_externo_id`) REFERENCES `externo` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `grupo_trabajo_ibfk_4` FOREIGN KEY (`lector_externo_id`) REFERENCES `externo` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `menu_items`
--
ALTER TABLE `menu_items`
  ADD CONSTRAINT `menu_items_menu_id_foreign` FOREIGN KEY (`menu_id`) REFERENCES `menus` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `permission_role`
--
ALTER TABLE `permission_role`
  ADD CONSTRAINT `permission_role_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `permission_role_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `seccion_abreviatura_nomenclatura_sigla`
--
ALTER TABLE `seccion_abreviatura_nomenclatura_sigla`
  ADD CONSTRAINT `seccion_abreviatura_nomenclatura_sigla_ibfk_1` FOREIGN KEY (`tipo_abreviatura_id`) REFERENCES `tipo_abreviatura` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `seccion_abreviatura_nomenclatura_sigla_ibfk_2` FOREIGN KEY (`grupo_trabajo_id`) REFERENCES `grupo_trabajo` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `seccion_agradecimiento`
--
ALTER TABLE `seccion_agradecimiento`
  ADD CONSTRAINT `seccion_agradecimiento_ibfk_1` FOREIGN KEY (`estudiante_id`) REFERENCES `estudiante` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `seccion_capitulo`
--
ALTER TABLE `seccion_capitulo`
  ADD CONSTRAINT `seccion_capitulo_ibfk_1` FOREIGN KEY (`grupo_trabajo_id`) REFERENCES `grupo_trabajo` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `seccion_dedicatoria`
--
ALTER TABLE `seccion_dedicatoria`
  ADD CONSTRAINT `seccion_dedicatoria_ibfk_1` FOREIGN KEY (`estudiante_id`) REFERENCES `estudiante` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `seccion_glosario`
--
ALTER TABLE `seccion_glosario`
  ADD CONSTRAINT `seccion_glosario_ibfk_1` FOREIGN KEY (`grupo_trabajo_id`) REFERENCES `grupo_trabajo` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `seccion_referencia`
--
ALTER TABLE `seccion_referencia`
  ADD CONSTRAINT `seccion_referencia_ibfk_1` FOREIGN KEY (`grupo_trabajo_id`) REFERENCES `grupo_trabajo` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `seccion_resumen`
--
ALTER TABLE `seccion_resumen`
  ADD CONSTRAINT `seccion_resumen_ibfk_1` FOREIGN KEY (`grupo_trabajo_id`) REFERENCES `grupo_trabajo` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `subcontenido_seccion_capitulo`
--
ALTER TABLE `subcontenido_seccion_capitulo`
  ADD CONSTRAINT `subcontenido_seccion_capitulo_ibfk_1` FOREIGN KEY (`contenido_seccion_capitulo_id`) REFERENCES `contenido_seccion_capitulo` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`);

--
-- Filtros para la tabla `user_roles`
--
ALTER TABLE `user_roles`
  ADD CONSTRAINT `user_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `user_roles_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD CONSTRAINT `usuario_ibfk_1` FOREIGN KEY (`tipo_usuario_id`) REFERENCES `tipo_usuario` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
