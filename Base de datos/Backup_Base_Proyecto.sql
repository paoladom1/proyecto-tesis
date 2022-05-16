-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 16-05-2022 a las 02:31:17
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
-- Base de datos: `prueba_capitulos`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `bitacora`
--

CREATE TABLE `bitacora` (
  `id` int(11) NOT NULL,
  `descripcion` text DEFAULT NULL,
  `fecha_modificacion` datetime DEFAULT NULL,
  `estudiante_id` int(11) DEFAULT NULL,
  `bitacora_seccion_id` int(11) DEFAULT NULL,
  `bitacora_modificacion_id` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `bitacora_modificacion`
--

CREATE TABLE `bitacora_modificacion` (
  `id` int(11) NOT NULL,
  `nombre_modificacion` varchar(150) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `bitacora_seccion`
--

CREATE TABLE `bitacora_seccion` (
  `id` int(11) NOT NULL,
  `nombre_seccion` varchar(150) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cargo`
--

CREATE TABLE `cargo` (
  `id` int(11) NOT NULL,
  `nombre_cargo` varchar(100) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `carrera`
--

CREATE TABLE `carrera` (
  `id` int(11) NOT NULL,
  `nombre_carrera` varchar(200) DEFAULT NULL,
  `grado` varchar(200) DEFAULT NULL,
  `facultad_id` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `configuracion_sistema`
--

CREATE TABLE `configuracion_sistema` (
  `id` int(11) NOT NULL,
  `mes_entrega` varchar(15) DEFAULT NULL,
  `anio_entrega` int(11) DEFAULT NULL,
  `mes_prorroga` varchar(15) DEFAULT NULL,
  `anio_prorroga` int(11) DEFAULT NULL,
  `numero_integrantes` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `contenido_seccion_capitulo`
--

CREATE TABLE `contenido_seccion_capitulo` (
  `id` int(11) NOT NULL,
  `tema` varchar(200) DEFAULT NULL,
  `contenido` text DEFAULT NULL,
  `orden_contenido` int(11) DEFAULT NULL,
  `seccion_capitulo_id` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `contenido_seccion_capitulo`
--

INSERT INTO `contenido_seccion_capitulo` (`id`, `tema`, `contenido`, `orden_contenido`, `seccion_capitulo_id`, `created_at`, `updated_at`) VALUES
(1, 'sdfsdfsdf', '<p>ertrtetert</p>', 4, 4, '2022-05-14 01:20:40', '2022-05-14 09:14:13'),
(2, 'fsdfsdfsd', NULL, 1, 4, '2022-05-14 09:02:37', '2022-05-14 09:14:13');

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
(59, 12, 'nombre_cargo', 'text', 'Nombre Cargo', 0, 1, 1, 1, 1, 1, '{}', 2),
(60, 12, 'created_at', 'timestamp', 'Created At', 1, 1, 1, 1, 0, 1, '{}', 3),
(61, 12, 'updated_at', 'timestamp', 'Updated At', 1, 0, 0, 0, 0, 0, '{}', 4),
(62, 13, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(63, 13, 'nombre_carrera', 'text', 'Nombre Carrera', 0, 1, 1, 1, 1, 1, '{}', 3),
(64, 13, 'grado', 'text', 'Grado', 0, 1, 1, 1, 1, 1, '{}', 4),
(65, 13, 'facultad_id', 'text', 'Facultad Id', 0, 1, 1, 1, 1, 1, '{}', 2),
(66, 13, 'created_at', 'timestamp', 'Created At', 1, 1, 1, 1, 0, 1, '{}', 5),
(67, 13, 'updated_at', 'timestamp', 'Updated At', 1, 0, 0, 0, 0, 0, '{}', 6),
(68, 14, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(69, 14, 'mes_entrega', 'text', 'Mes Entrega', 0, 1, 1, 1, 1, 1, '{}', 2),
(70, 14, 'anio_entrega', 'text', 'Anio Entrega', 0, 1, 1, 1, 1, 1, '{}', 3),
(71, 14, 'mes_prorroga', 'text', 'Mes Prorroga', 0, 1, 1, 1, 1, 1, '{}', 4),
(72, 14, 'anio_prorroga', 'text', 'Anio Prorroga', 0, 1, 1, 1, 1, 1, '{}', 5),
(73, 14, 'numero_integrantes', 'text', 'Numero Integrantes', 0, 1, 1, 1, 1, 1, '{}', 6),
(74, 14, 'created_at', 'timestamp', 'Created At', 1, 1, 1, 1, 0, 1, '{}', 7),
(75, 14, 'updated_at', 'timestamp', 'Updated At', 1, 0, 0, 0, 0, 0, '{}', 8),
(76, 15, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(77, 15, 'nombre_departamento', 'text', 'Nombre Departamento', 0, 1, 1, 1, 1, 1, '{}', 3),
(78, 15, 'facultad_id', 'text', 'Facultad Id', 0, 1, 1, 1, 1, 1, '{}', 2),
(79, 15, 'created_at', 'timestamp', 'Created At', 1, 1, 1, 1, 0, 1, '{}', 4),
(80, 15, 'updated_at', 'timestamp', 'Updated At', 1, 0, 0, 0, 0, 0, '{}', 5),
(81, 16, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(82, 16, 'usuario_id', 'text', 'Usuario Id', 0, 1, 1, 1, 1, 1, '{}', 2),
(83, 16, 'carrera_id', 'text', 'Carrera Id', 0, 1, 1, 1, 1, 1, '{}', 3),
(84, 16, 'empleado_id', 'text', 'Empleado Id', 0, 1, 1, 1, 1, 1, '{}', 4),
(85, 16, 'created_at', 'timestamp', 'Created At', 1, 1, 1, 1, 0, 1, '{}', 5),
(86, 16, 'updated_at', 'timestamp', 'Updated At', 1, 0, 0, 0, 0, 0, '{}', 6),
(87, 17, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(88, 17, 'codigo_empleado', 'text', 'Codigo Empleado', 0, 1, 1, 1, 1, 1, '{}', 5),
(89, 17, 'nombre', 'text', 'Nombre', 0, 1, 1, 1, 1, 1, '{}', 6),
(90, 17, 'apellido', 'text', 'Apellido', 0, 1, 1, 1, 1, 1, '{}', 7),
(91, 17, 'tipo_empleado_id', 'text', 'Tipo Empleado Id', 0, 1, 1, 1, 1, 1, '{}', 2),
(92, 17, 'cargo_id', 'text', 'Cargo Id', 0, 1, 1, 1, 1, 1, '{}', 3),
(93, 17, 'departamento_u_id', 'text', 'Departamento U Id', 0, 1, 1, 1, 1, 1, '{}', 4),
(94, 17, 'created_at', 'timestamp', 'Created At', 1, 1, 1, 1, 0, 1, '{}', 8),
(95, 17, 'updated_at', 'timestamp', 'Updated At', 1, 0, 0, 0, 0, 0, '{}', 9),
(96, 18, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(97, 18, 'nombre', 'text', 'Nombre', 0, 1, 1, 1, 1, 1, '{}', 5),
(98, 18, 'apellido', 'text', 'Apellido', 0, 1, 1, 1, 1, 1, '{}', 6),
(99, 18, 'carnet', 'text', 'Carnet', 0, 1, 1, 1, 1, 1, '{}', 7),
(100, 18, 'carrera_id', 'text', 'Carrera Id', 0, 1, 1, 1, 1, 1, '{}', 2),
(101, 18, 'usuario_id', 'text', 'Usuario Id', 0, 1, 1, 1, 1, 1, '{}', 3),
(102, 18, 'grupo_trabajo_id', 'text', 'Grupo Trabajo Id', 0, 1, 1, 1, 1, 1, '{}', 4),
(103, 18, 'created_at', 'timestamp', 'Created At', 1, 1, 1, 1, 0, 1, '{}', 8),
(104, 18, 'updated_at', 'timestamp', 'Updated At', 1, 0, 0, 0, 0, 0, '{}', 9),
(105, 19, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(106, 19, 'nombre', 'text', 'Nombre', 0, 1, 1, 1, 1, 1, '{}', 3),
(107, 19, 'apellido', 'text', 'Apellido', 0, 1, 1, 1, 1, 1, '{}', 4),
(108, 19, 'correo', 'text', 'Correo', 0, 1, 1, 1, 1, 1, '{}', 5),
(109, 19, 'descripcion', 'text', 'Descripcion', 0, 1, 1, 1, 1, 1, '{}', 6),
(110, 19, 'rol_externo', 'text', 'Rol Externo', 0, 1, 1, 1, 1, 1, '{}', 7),
(111, 19, 'departamento_u_id', 'text', 'Departamento U Id', 0, 1, 1, 1, 1, 1, '{}', 2),
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
(178, 31, 'foto', 'text', 'Foto', 0, 1, 1, 1, 1, 1, '{}', 3),
(179, 31, 'correo', 'text', 'Correo', 0, 1, 1, 1, 1, 1, '{}', 4),
(180, 31, 'contrasena', 'text', 'Contrasena', 0, 1, 1, 1, 1, 1, '{}', 5),
(181, 31, 'tipo_usuario_id', 'text', 'Tipo Usuario Id', 0, 1, 1, 1, 1, 1, '{}', 2),
(182, 31, 'created_at', 'timestamp', 'Created At', 1, 1, 1, 1, 0, 1, '{}', 6),
(183, 31, 'updated_at', 'timestamp', 'Updated At', 1, 0, 0, 0, 0, 0, '{}', 7);

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
(12, 'cargo', 'cargo', 'Cargo', 'Cargos', NULL, 'App\\Models\\Cargo', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null}', '2022-05-14 11:24:58', '2022-05-14 11:24:58'),
(13, 'carrera', 'carrera', 'Carrera', 'Carreras', NULL, 'App\\Models\\Carrera', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null}', '2022-05-14 11:26:47', '2022-05-14 11:26:47'),
(14, 'configuracion_sistema', 'configuracion-sistema', 'Configuracion Sistema', 'Configuracion Sistemas', NULL, 'App\\Models\\ConfiguracionSistema', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null}', '2022-05-14 11:28:56', '2022-05-14 11:28:56'),
(15, 'departamento_u', 'departamento-u', 'Departamento U', 'Departamento Us 2', NULL, 'App\\Models\\DepartamentoU', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}', '2022-05-14 11:31:07', '2022-05-15 05:40:14'),
(16, 'director_carrera', 'director-carrera', 'Director Carrera', 'Director Carreras', NULL, 'App\\Models\\DirectorCarrera', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null}', '2022-05-14 11:33:02', '2022-05-14 11:33:02'),
(17, 'empleado', 'empleado', 'Empleado', 'Empleados', NULL, 'App\\Models\\Empleado', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null}', '2022-05-14 11:36:44', '2022-05-14 11:36:44'),
(18, 'estudiante', 'estudiante', 'Estudiante', 'Estudiantes', NULL, 'App\\Models\\Estudiante', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null}', '2022-05-14 11:40:48', '2022-05-14 11:40:48'),
(19, 'externo', 'externo', 'Externo', 'Externos', NULL, 'App\\Models\\Externo', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null}', '2022-05-14 11:44:48', '2022-05-14 11:44:48'),
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
(31, 'usuario', 'usuario', 'Usuario', 'Usuarios', NULL, 'App\\Models\\Usuario', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null}', '2022-05-14 12:58:49', '2022-05-14 12:58:49');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `departamento_u`
--

CREATE TABLE `departamento_u` (
  `id` int(11) NOT NULL,
  `nombre_departamento` varchar(200) DEFAULT NULL,
  `facultad_id` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `director_carrera`
--

CREATE TABLE `director_carrera` (
  `id` int(11) NOT NULL,
  `usuario_id` int(11) DEFAULT NULL,
  `carrera_id` int(11) DEFAULT NULL,
  `empleado_id` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empleado`
--

CREATE TABLE `empleado` (
  `id` int(11) NOT NULL,
  `codigo_empleado` varchar(10) DEFAULT NULL,
  `nombre` varchar(100) DEFAULT NULL,
  `apellido` varchar(100) DEFAULT NULL,
  `tipo_empleado_id` int(11) DEFAULT NULL,
  `cargo_id` int(11) DEFAULT NULL,
  `departamento_u_id` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estudiante`
--

CREATE TABLE `estudiante` (
  `id` int(11) NOT NULL,
  `nombre` varchar(100) DEFAULT NULL,
  `apellido` varchar(100) DEFAULT NULL,
  `carnet` char(10) DEFAULT NULL,
  `carrera_id` int(11) DEFAULT NULL,
  `usuario_id` int(11) DEFAULT NULL,
  `grupo_trabajo_id` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `externo`
--

CREATE TABLE `externo` (
  `id` int(11) NOT NULL,
  `nombre` varchar(100) DEFAULT NULL,
  `apellido` varchar(100) DEFAULT NULL,
  `correo` varchar(100) DEFAULT NULL,
  `descripcion` text DEFAULT NULL,
  `rol_externo` int(11) DEFAULT NULL,
  `departamento_u_id` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `facultad`
--

CREATE TABLE `facultad` (
  `id` int(11) NOT NULL,
  `nombre_facultad` varchar(200) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `grupo_trabajo`
--

CREATE TABLE `grupo_trabajo` (
  `id` int(11) NOT NULL,
  `anio_inicio` int(11) DEFAULT NULL,
  `ciclo_inicio` int(11) DEFAULT NULL,
  `tema` varchar(200) DEFAULT NULL,
  `prorroga` tinyint(1) DEFAULT NULL,
  `asesor_interno_id` int(11) DEFAULT NULL,
  `lector_interno_id` int(11) DEFAULT NULL,
  `asesor_externo_id` int(11) DEFAULT NULL,
  `lector_externo_id` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

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
(11, 1, 'Seccion Capitulos', '', '_self', NULL, NULL, 37, 2, '2022-05-14 06:33:07', '2022-05-14 13:11:16', 'voyager.seccion-capitulo.index', NULL),
(12, 1, 'Contenido Seccion Capitulos', '', '_self', NULL, NULL, 37, 3, '2022-05-14 06:37:37', '2022-05-14 13:11:16', 'voyager.contenido-seccion-capitulo.index', NULL),
(13, 1, 'Subcontenido Seccion Capitulos', '', '_self', NULL, NULL, 37, 4, '2022-05-14 06:40:26', '2022-05-14 13:11:16', 'voyager.subcontenido-seccion-capitulo.index', NULL),
(14, 1, 'Bitacoras', '', '_self', NULL, NULL, 37, 5, '2022-05-14 11:17:05', '2022-05-14 13:11:16', 'voyager.bitacora.index', NULL),
(15, 1, 'Bitacora Modificacions', '', '_self', NULL, NULL, 37, 7, '2022-05-14 11:20:10', '2022-05-14 13:11:16', 'voyager.bitacora-modificacion.index', NULL),
(16, 1, 'Bitacora Seccions', '', '_self', NULL, NULL, 37, 6, '2022-05-14 11:22:06', '2022-05-14 13:11:16', 'voyager.bitacora-seccion.index', NULL),
(17, 1, 'Cargos', '', '_self', NULL, NULL, 37, 8, '2022-05-14 11:24:58', '2022-05-14 13:11:16', 'voyager.cargo.index', NULL),
(18, 1, 'Carreras', '', '_self', NULL, NULL, 37, 9, '2022-05-14 11:26:47', '2022-05-14 13:11:16', 'voyager.carrera.index', NULL),
(19, 1, 'Configuracion Sistemas', '', '_self', NULL, NULL, 37, 10, '2022-05-14 11:28:56', '2022-05-14 13:11:16', 'voyager.configuracion-sistema.index', NULL),
(20, 1, 'Departamento Us', '', '_self', NULL, NULL, 37, 1, '2022-05-14 11:31:07', '2022-05-14 13:10:56', 'voyager.departamento-u.index', NULL),
(21, 1, 'Director Carreras', '', '_self', NULL, NULL, 37, 11, '2022-05-14 11:33:02', '2022-05-14 13:11:16', 'voyager.director-carrera.index', NULL),
(22, 1, 'Empleados', '', '_self', NULL, NULL, 37, 12, '2022-05-14 11:36:44', '2022-05-14 13:11:16', 'voyager.empleado.index', NULL),
(23, 1, 'Estudiantes', '', '_self', NULL, NULL, 37, 13, '2022-05-14 11:40:48', '2022-05-14 13:11:16', 'voyager.estudiante.index', NULL),
(24, 1, 'Externos', '', '_self', NULL, NULL, 37, 15, '2022-05-14 11:44:48', '2022-05-14 13:11:16', 'voyager.externo.index', NULL),
(25, 1, 'Facultads', '', '_self', NULL, NULL, 37, 14, '2022-05-14 11:48:44', '2022-05-14 13:11:16', 'voyager.facultad.index', NULL),
(26, 1, 'Grupo Trabajos', '', '_self', NULL, NULL, 37, 16, '2022-05-14 12:39:12', '2022-05-14 13:11:16', 'voyager.grupo-trabajo.index', NULL),
(27, 1, 'Seccion Abreviatura Nomenclatura Siglas', '', '_self', NULL, NULL, 37, 17, '2022-05-14 12:43:10', '2022-05-14 13:11:16', 'voyager.seccion-abreviatura-nomenclatura-sigla.index', NULL),
(28, 1, 'Seccion Agradecimientos', '', '_self', NULL, NULL, 37, 18, '2022-05-14 12:44:26', '2022-05-14 13:11:16', 'voyager.seccion-agradecimiento.index', NULL),
(29, 1, 'Seccion Dedicatoria', '', '_self', NULL, NULL, 37, 19, '2022-05-14 12:47:04', '2022-05-14 13:11:16', 'voyager.seccion-dedicatoria.index', NULL),
(30, 1, 'Seccion Glosarios', '', '_self', NULL, NULL, 37, 20, '2022-05-14 12:50:01', '2022-05-14 13:11:16', 'voyager.seccion-glosario.index', NULL),
(31, 1, 'Seccion Referencia', '', '_self', NULL, NULL, 37, 21, '2022-05-14 12:52:29', '2022-05-14 13:11:16', 'voyager.seccion-referencia.index', NULL),
(32, 1, 'Seccion Resumen', '', '_self', NULL, NULL, 37, 22, '2022-05-14 12:53:47', '2022-05-14 13:11:16', 'voyager.seccion-resumen.index', NULL),
(33, 1, 'Tipo Abreviaturas', '', '_self', NULL, NULL, 37, 24, '2022-05-14 12:55:48', '2022-05-14 13:11:16', 'voyager.tipo-abreviatura.index', NULL),
(34, 1, 'Tipo Empleados', '', '_self', NULL, NULL, 37, 25, '2022-05-14 12:56:42', '2022-05-14 13:11:16', 'voyager.tipo-empleado.index', NULL),
(35, 1, 'Tipo Usuarios', '', '_self', NULL, NULL, 37, 23, '2022-05-14 12:57:38', '2022-05-14 13:11:16', 'voyager.tipo-usuario.index', NULL),
(36, 1, 'Usuarios', '', '_self', NULL, NULL, 37, 26, '2022-05-14 12:58:49', '2022-05-14 13:11:16', 'voyager.usuario.index', NULL),
(37, 1, 'Gestionar Sitio', '', '_self', 'voyager-folder', '#000000', NULL, 2, '2022-05-14 13:08:31', '2022-05-14 13:16:55', NULL, '');

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
(66, 'browse_configuracion_sistema', 'configuracion_sistema', '2022-05-14 11:28:56', '2022-05-14 11:28:56'),
(67, 'read_configuracion_sistema', 'configuracion_sistema', '2022-05-14 11:28:56', '2022-05-14 11:28:56'),
(68, 'edit_configuracion_sistema', 'configuracion_sistema', '2022-05-14 11:28:56', '2022-05-14 11:28:56'),
(69, 'add_configuracion_sistema', 'configuracion_sistema', '2022-05-14 11:28:56', '2022-05-14 11:28:56'),
(70, 'delete_configuracion_sistema', 'configuracion_sistema', '2022-05-14 11:28:56', '2022-05-14 11:28:56'),
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
(155, 'delete_usuario', 'usuario', '2022-05-14 12:58:49', '2022-05-14 12:58:49');

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
(2, 1),
(3, 1),
(4, 1),
(5, 1),
(6, 1),
(7, 1),
(8, 1),
(9, 1),
(10, 1),
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
(56, 1),
(57, 1),
(58, 1),
(59, 1),
(60, 1),
(61, 1),
(62, 1),
(63, 1),
(64, 1),
(65, 1),
(66, 1),
(67, 1),
(68, 1),
(69, 1),
(70, 1),
(71, 1),
(72, 1),
(73, 1),
(74, 1),
(75, 1),
(76, 1),
(77, 1),
(78, 1),
(79, 1),
(80, 1),
(81, 1),
(82, 1),
(83, 1),
(84, 1),
(85, 1),
(86, 1),
(87, 1),
(88, 1),
(89, 1),
(90, 1),
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
(152, 1),
(153, 1),
(154, 1),
(155, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
  `contenido` text DEFAULT NULL,
  `tipo_abreviatura_id` int(11) DEFAULT NULL,
  `grupo_trabajo_id` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `seccion_agradecimiento`
--

CREATE TABLE `seccion_agradecimiento` (
  `id` int(11) NOT NULL,
  `opcional` tinyint(1) DEFAULT NULL,
  `autor` varchar(100) DEFAULT NULL,
  `contenido` text DEFAULT NULL,
  `estudiante_id` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `seccion_capitulo`
--

CREATE TABLE `seccion_capitulo` (
  `id` int(11) NOT NULL,
  `nombre_capitulo` varchar(200) DEFAULT NULL,
  `orden_capitulo` int(11) DEFAULT NULL,
  `grupo_trabajo_id` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `seccion_capitulo`
--

INSERT INTO `seccion_capitulo` (`id`, `nombre_capitulo`, `orden_capitulo`, `grupo_trabajo_id`, `created_at`, `updated_at`) VALUES
(3, 'Introduccion', 1, NULL, '2022-05-14 06:52:20', '2022-05-14 06:52:55'),
(4, 'Marco Teorico', 2, NULL, '2022-05-14 06:52:43', '2022-05-14 06:52:55');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `seccion_dedicatoria`
--

CREATE TABLE `seccion_dedicatoria` (
  `id` int(11) NOT NULL,
  `opcional` tinyint(1) DEFAULT NULL,
  `autor` varchar(100) DEFAULT NULL,
  `contenido` text DEFAULT NULL,
  `estudiante_id` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `seccion_glosario`
--

CREATE TABLE `seccion_glosario` (
  `id` int(11) NOT NULL,
  `opcional` tinyint(1) DEFAULT NULL,
  `contenido` text DEFAULT NULL,
  `grupo_trabajo_id` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `seccion_referencia`
--

CREATE TABLE `seccion_referencia` (
  `id` int(11) NOT NULL,
  `contenido` text DEFAULT NULL,
  `grupo_trabajo_id` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `seccion_resumen`
--

CREATE TABLE `seccion_resumen` (
  `id` int(11) NOT NULL,
  `contenido` text DEFAULT NULL,
  `grupo_trabajo_id` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

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
(4, 'site.google_analytics_tracking_id', 'Google Analytics Tracking ID', '', '', 'text', 4, 'Site'),
(5, 'admin.bg_image', 'Admin Background Image', '', '', 'image', 5, 'Admin'),
(6, 'admin.title', 'Admin Title', 'Voyager', '', 'text', 1, 'Admin'),
(7, 'admin.description', 'Admin Description', 'Welcome to Voyager. The Missing Admin for Laravel', '', 'text', 2, 'Admin'),
(8, 'admin.loader', 'Admin Loader', '', '', 'image', 3, 'Admin'),
(9, 'admin.icon_image', 'Admin Icon Image', '', '', 'image', 4, 'Admin'),
(10, 'admin.google_analytics_client_id', 'Google Analytics Client ID (used for admin dashboard)', '', '', 'text', 1, 'Admin');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `subcontenido_seccion_capitulo`
--

CREATE TABLE `subcontenido_seccion_capitulo` (
  `id` int(11) NOT NULL,
  `subtema` varchar(200) DEFAULT NULL,
  `contenido` text DEFAULT NULL,
  `orden_subcontenido` int(11) DEFAULT NULL,
  `contenido_seccion_capitulo_id` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `subcontenido_seccion_capitulo`
--

INSERT INTO `subcontenido_seccion_capitulo` (`id`, `subtema`, `contenido`, `orden_subcontenido`, `contenido_seccion_capitulo_id`, `created_at`, `updated_at`) VALUES
(2, '(Sin sub-tema)', NULL, 4, 1, '2022-05-14 09:09:55', '2022-05-14 09:14:13'),
(3, '(Sin sub-tema)', NULL, 5, 1, '2022-05-14 09:09:55', '2022-05-14 09:14:13'),
(4, '(Sin sub-tema)', NULL, 1, 2, '2022-05-14 09:09:55', '2022-05-14 09:14:13'),
(5, '(Sin sub-tema)', NULL, 2, 2, '2022-05-14 09:09:55', '2022-05-14 09:14:13');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_abreviatura`
--

CREATE TABLE `tipo_abreviatura` (
  `id` int(11) NOT NULL,
  `nombre_tipo_abreviatura` varchar(100) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_empleado`
--

CREATE TABLE `tipo_empleado` (
  `id` int(11) NOT NULL,
  `nombre_tipo_empleado` varchar(100) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_usuario`
--

CREATE TABLE `tipo_usuario` (
  `id` int(11) NOT NULL,
  `nombre` varchar(100) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

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
(1, 1, 'admin', 'admin@admin.com', 'users\\April2022\\4i27Z4SzTf9g3qq9otYF.jpg', NULL, '$2y$10$1J74gd2v3O5HG.hJpnovkOfkdl8ZSUT/BDGoyYptD88aVnHbPa1cO', NULL, '{\"locale\":\"en\"}', '2022-04-15 04:09:47', '2022-04-22 08:31:58');

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
  `foto` varchar(200) DEFAULT NULL,
  `correo` varchar(100) DEFAULT NULL,
  `contrasena` varchar(100) DEFAULT NULL,
  `tipo_usuario_id` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

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
-- Indices de la tabla `departamento_u`
--
ALTER TABLE `departamento_u`
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
  ADD KEY `departamento_u_id` (`departamento_u_id`);

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
  ADD KEY `departamento_u_id` (`departamento_u_id`);

--
-- Indices de la tabla `facultad`
--
ALTER TABLE `facultad`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

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
-- Indices de la tabla `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

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
  ADD KEY `tipo_usuario_id` (`tipo_usuario_id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `bitacora`
--
ALTER TABLE `bitacora`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `bitacora_modificacion`
--
ALTER TABLE `bitacora_modificacion`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `bitacora_seccion`
--
ALTER TABLE `bitacora_seccion`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `cargo`
--
ALTER TABLE `cargo`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `carrera`
--
ALTER TABLE `carrera`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `configuracion_sistema`
--
ALTER TABLE `configuracion_sistema`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `contenido_seccion_capitulo`
--
ALTER TABLE `contenido_seccion_capitulo`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `data_rows`
--
ALTER TABLE `data_rows`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=184;

--
-- AUTO_INCREMENT de la tabla `data_types`
--
ALTER TABLE `data_types`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT de la tabla `departamento_u`
--
ALTER TABLE `departamento_u`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `director_carrera`
--
ALTER TABLE `director_carrera`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `empleado`
--
ALTER TABLE `empleado`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `estudiante`
--
ALTER TABLE `estudiante`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `externo`
--
ALTER TABLE `externo`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `facultad`
--
ALTER TABLE `facultad`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `grupo_trabajo`
--
ALTER TABLE `grupo_trabajo`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `menus`
--
ALTER TABLE `menus`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `menu_items`
--
ALTER TABLE `menu_items`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- AUTO_INCREMENT de la tabla `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT de la tabla `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=156;

--
-- AUTO_INCREMENT de la tabla `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `seccion_abreviatura_nomenclatura_sigla`
--
ALTER TABLE `seccion_abreviatura_nomenclatura_sigla`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `seccion_agradecimiento`
--
ALTER TABLE `seccion_agradecimiento`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `seccion_capitulo`
--
ALTER TABLE `seccion_capitulo`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `seccion_dedicatoria`
--
ALTER TABLE `seccion_dedicatoria`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `seccion_glosario`
--
ALTER TABLE `seccion_glosario`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `seccion_referencia`
--
ALTER TABLE `seccion_referencia`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `seccion_resumen`
--
ALTER TABLE `seccion_resumen`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `settings`
--
ALTER TABLE `settings`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `subcontenido_seccion_capitulo`
--
ALTER TABLE `subcontenido_seccion_capitulo`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `tipo_abreviatura`
--
ALTER TABLE `tipo_abreviatura`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `tipo_empleado`
--
ALTER TABLE `tipo_empleado`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `tipo_usuario`
--
ALTER TABLE `tipo_usuario`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `translations`
--
ALTER TABLE `translations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

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
-- Filtros para la tabla `departamento_u`
--
ALTER TABLE `departamento_u`
  ADD CONSTRAINT `departamento_u_ibfk_1` FOREIGN KEY (`facultad_id`) REFERENCES `facultad` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

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
  ADD CONSTRAINT `empleado_ibfk_3` FOREIGN KEY (`departamento_u_id`) REFERENCES `departamento_u` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `estudiante`
--
ALTER TABLE `estudiante`
  ADD CONSTRAINT `estudiante_ibfk_1` FOREIGN KEY (`carrera_id`) REFERENCES `carrera` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `estudiante_ibfk_2` FOREIGN KEY (`usuario_id`) REFERENCES `usuario` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `estudiante_ibfk_3` FOREIGN KEY (`grupo_trabajo_id`) REFERENCES `grupo_trabajo` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `externo`
--
ALTER TABLE `externo`
  ADD CONSTRAINT `externo_ibfk_1` FOREIGN KEY (`departamento_u_id`) REFERENCES `departamento_u` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

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
