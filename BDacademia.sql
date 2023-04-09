-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 09-04-2023 a las 04:36:48
-- Versión del servidor: 10.4.27-MariaDB
-- Versión de PHP: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `academia`
--
CREATE DATABASE IF NOT EXISTS `academia` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `academia`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `admin`
--
-- Creación: 09-04-2023 a las 02:14:57
--

CREATE TABLE `admin` (
  `id_admin` int(11) NOT NULL,
  `userName` varchar(20) NOT NULL,
  `password` varchar(20) NOT NULL,
  `state` bit(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- RELACIONES PARA LA TABLA `admin`:
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `course`
--
-- Creación: 09-04-2023 a las 01:57:54
--

CREATE TABLE `course` (
  `id_course` int(11) NOT NULL,
  `course_name` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- RELACIONES PARA LA TABLA `course`:
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `groups`
--
-- Creación: 09-04-2023 a las 01:57:07
--

CREATE TABLE `groups` (
  `id_groups` int(11) NOT NULL,
  `groups_name` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- RELACIONES PARA LA TABLA `groups`:
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `homework`
--
-- Creación: 09-04-2023 a las 02:14:33
--

CREATE TABLE `homework` (
  `id_homework` int(11) NOT NULL,
  `homework_status` int(11) NOT NULL,
  `fk_cod_student` int(11) NOT NULL,
  `fk_cod_course` int(11) NOT NULL,
  `date_homework` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- RELACIONES PARA LA TABLA `homework`:
--   `fk_cod_course`
--       `homework` -> `id_homework`
--   `fk_cod_student`
--       `homework` -> `id_homework`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `inscription_course`
--
-- Creación: 09-04-2023 a las 02:13:31
--

CREATE TABLE `inscription_course` (
  `id_inscription` int(11) NOT NULL,
  `fk_id_course` int(11) NOT NULL,
  `fk_cod_student` int(11) NOT NULL,
  `fk_cod_teacher` int(11) NOT NULL,
  `date_inscription` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- RELACIONES PARA LA TABLA `inscription_course`:
--   `fk_cod_student`
--       `inscription_course` -> `id_inscription`
--   `fk_cod_teacher`
--       `inscription_course` -> `id_inscription`
--   `fk_id_course`
--       `inscription_course` -> `id_inscription`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `school`
--
-- Creación: 09-04-2023 a las 01:56:03
--

CREATE TABLE `school` (
  `num_registro` int(11) NOT NULL,
  `school_name` varchar(100) NOT NULL,
  `director_name` varchar(50) NOT NULL,
  `school_address` varchar(100) NOT NULL,
  `phone_number` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- RELACIONES PARA LA TABLA `school`:
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `student`
--
-- Creación: 09-04-2023 a las 02:04:40
--

CREATE TABLE `student` (
  `cod_student` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `lastname` varchar(50) NOT NULL,
  `age` int(11) NOT NULL,
  `address` varchar(100) NOT NULL,
  `responsible_name` varchar(100) NOT NULL,
  `phone_number` int(11) NOT NULL,
  `cod_groups` int(11) NOT NULL,
  `cod_school` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- RELACIONES PARA LA TABLA `student`:
--   `cod_groups`
--       `student` -> `cod_student`
--   `cod_school`
--       `student` -> `cod_student`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `teacher`
--
-- Creación: 09-04-2023 a las 02:10:11
--

CREATE TABLE `teacher` (
  `id_teacher` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `lastname` varchar(50) NOT NULL,
  `address` varchar(100) NOT NULL,
  `phone_number` int(11) NOT NULL,
  `code_groups` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- RELACIONES PARA LA TABLA `teacher`:
--   `code_groups`
--       `teacher` -> `id_teacher`
--

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id_admin`);

--
-- Indices de la tabla `course`
--
ALTER TABLE `course`
  ADD PRIMARY KEY (`id_course`);

--
-- Indices de la tabla `groups`
--
ALTER TABLE `groups`
  ADD PRIMARY KEY (`id_groups`);

--
-- Indices de la tabla `homework`
--
ALTER TABLE `homework`
  ADD PRIMARY KEY (`id_homework`),
  ADD KEY `fk_cod_course` (`fk_cod_course`),
  ADD KEY `fk_code_student` (`fk_cod_student`);

--
-- Indices de la tabla `inscription_course`
--
ALTER TABLE `inscription_course`
  ADD PRIMARY KEY (`id_inscription`),
  ADD KEY `fk_id_course` (`fk_id_course`),
  ADD KEY `fk_cod_student` (`fk_cod_student`),
  ADD KEY `fk_cod_teacher` (`fk_cod_teacher`);

--
-- Indices de la tabla `school`
--
ALTER TABLE `school`
  ADD PRIMARY KEY (`num_registro`);

--
-- Indices de la tabla `student`
--
ALTER TABLE `student`
  ADD PRIMARY KEY (`cod_student`),
  ADD KEY `fk_groups` (`cod_groups`),
  ADD KEY `fk_school` (`cod_school`);

--
-- Indices de la tabla `teacher`
--
ALTER TABLE `teacher`
  ADD PRIMARY KEY (`id_teacher`),
  ADD KEY `fkcod_groups` (`code_groups`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `admin`
--
ALTER TABLE `admin`
  MODIFY `id_admin` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `course`
--
ALTER TABLE `course`
  MODIFY `id_course` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `groups`
--
ALTER TABLE `groups`
  MODIFY `id_groups` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `homework`
--
ALTER TABLE `homework`
  MODIFY `id_homework` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `inscription_course`
--
ALTER TABLE `inscription_course`
  MODIFY `id_inscription` int(11) NOT NULL AUTO_INCREMENT;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `homework`
--
ALTER TABLE `homework`
  ADD CONSTRAINT `fk_cod_course` FOREIGN KEY (`fk_cod_course`) REFERENCES `homework` (`id_homework`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_code_student` FOREIGN KEY (`fk_cod_student`) REFERENCES `homework` (`id_homework`);

--
-- Filtros para la tabla `inscription_course`
--
ALTER TABLE `inscription_course`
  ADD CONSTRAINT `fk_cod_student` FOREIGN KEY (`fk_cod_student`) REFERENCES `inscription_course` (`id_inscription`),
  ADD CONSTRAINT `fk_cod_teacher` FOREIGN KEY (`fk_cod_teacher`) REFERENCES `inscription_course` (`id_inscription`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_id_course` FOREIGN KEY (`fk_id_course`) REFERENCES `inscription_course` (`id_inscription`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `student`
--
ALTER TABLE `student`
  ADD CONSTRAINT `fk_groups` FOREIGN KEY (`cod_groups`) REFERENCES `student` (`cod_student`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_school` FOREIGN KEY (`cod_school`) REFERENCES `student` (`cod_student`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `teacher`
--
ALTER TABLE `teacher`
  ADD CONSTRAINT `fkcod_groups` FOREIGN KEY (`code_groups`) REFERENCES `teacher` (`id_teacher`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
