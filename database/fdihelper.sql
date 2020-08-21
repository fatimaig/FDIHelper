-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost
-- Tiempo de generación: 18-05-2020 a las 18:23:06
-- Versión del servidor: 5.7.30-0ubuntu0.18.04.1
-- Versión de PHP: 7.2.24-0ubuntu0.18.04.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `fdihelper`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `answers`
--

CREATE TABLE `answers` (
  `id` int(11) NOT NULL,
  `id_topic` int(11) NOT NULL,
  `user` varchar(30) NOT NULL,
  `content` longtext NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `answers`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `associations`
--

CREATE TABLE `associations` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `description` varchar(10000) NOT NULL,
  `social_media` varchar(50) DEFAULT NULL,
  `location` varchar(50) DEFAULT NULL,
  `web` varchar(50) NOT NULL,
  `logo` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `associations`
--

INSERT INTO `associations` (`id`, `name`, `email`, `description`, `social_media`, `location`, `web`, `logo`) VALUES
(76, 'ASCII', 'testuser@ucm.es', 'Asociación \r\n                                                                \r\n                                                                \r\n                                                                ', 'Twitter: @ascii', 'Despacho 110 (primera planta)', 'http://ascii.fdi.ucm.es', '24e7bcd08ade5ab173d32a0b2d0d194e');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `join_association`
--

CREATE TABLE `join_association` (
  `userMail` varchar(30) NOT NULL,
  `associationId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `join_association`

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `join_meeting`
--

CREATE TABLE `join_meeting` (
  `id_meeting` int(11) NOT NULL,
  `user` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



--
-- Estructura de tabla para la tabla `meetings`
--

CREATE TABLE `meetings` (
  `id` int(11) NOT NULL,
  `user` varchar(30) NOT NULL,
  `title` varchar(50) NOT NULL,
  `subject` varchar(50) NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `comments` longtext NOT NULL,
  `capacity` int(2) NOT NULL,
  `location` varchar(50) NOT NULL,
  `datetime_meeting` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `state` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Estructura de tabla para la tabla `topics`
--

CREATE TABLE `topics` (
  `id` int(11) NOT NULL,
  `user` varchar(30) NOT NULL,
  `title` varchar(50) NOT NULL,
  `category` varchar(50) NOT NULL,
  `subcategory` varchar(50) NOT NULL,
  `content` longtext NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


--
-- Estructura de tabla para la tabla `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(60) NOT NULL,
  `email` varchar(30) NOT NULL,
  `password` varchar(100) NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `date_birth` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `type_user` varchar(15) NOT NULL,
  `image` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`id`, `username`, `email`, `password`, `date`, `date_birth`, `type_user`, `image`) VALUES
(43, 'TestUser', 'testuser@ucm.es', '$2b$10$ngTh7.KoOV8.minpQdcv9.zvfEawqq68HkBj.oMmL/FHAnTt3L4HO', '2020-05-18 17:52:12', '2000-06-24 00:00:00', '0', 'e77881d8621c25d9de1560ddd9b9eb15'),
(44, 'TestUserAsoc', 'testuserasoc@ucm.es', '$2b$10$iTo0TeiEOmbG/c0cKBg0h.v1BkOn5vXCt8kQeqRstAZA3wCcqLUCW', '2020-05-18 17:52:59', '1999-06-24 00:00:00', '1', 'e1416182b1c09a6e968ffd829d379e95');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `answers`
--
ALTER TABLE `answers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_topicAnswers` (`id_topic`);

--
-- Indices de la tabla `associations`
--
ALTER TABLE `associations`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `join_association`
--
ALTER TABLE `join_association`
  ADD PRIMARY KEY (`userMail`,`associationId`),
  ADD KEY `FK_association` (`associationId`);

--
-- Indices de la tabla `join_meeting`
--
ALTER TABLE `join_meeting`
  ADD KEY `FK_meeting` (`id_meeting`);

--
-- Indices de la tabla `meetings`
--
ALTER TABLE `meetings`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `topics`
--
ALTER TABLE `topics`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `answers`
--
ALTER TABLE `answers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=88;

--
-- AUTO_INCREMENT de la tabla `associations`
--
ALTER TABLE `associations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=77;

--
-- AUTO_INCREMENT de la tabla `meetings`
--
ALTER TABLE `meetings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=113;

--
-- AUTO_INCREMENT de la tabla `topics`
--
ALTER TABLE `topics`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=88;

--
-- AUTO_INCREMENT de la tabla `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=46;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `answers`
--
ALTER TABLE `answers`
  ADD CONSTRAINT `FK_topicAnswers` FOREIGN KEY (`id_topic`) REFERENCES `topics` (`id`);

--
-- Filtros para la tabla `join_meeting`
--
ALTER TABLE `join_meeting`
  ADD CONSTRAINT `FK_meeting` FOREIGN KEY (`id_meeting`) REFERENCES `meetings` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
