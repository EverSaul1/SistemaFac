-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 21-10-2020 a las 07:55:55
-- Versión del servidor: 10.4.13-MariaDB
-- Versión de PHP: 7.4.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `pos2`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categorias`
--

CREATE TABLE `categorias` (
  `id` int(11) NOT NULL,
  `categoria` text COLLATE utf8_spanish_ci NOT NULL,
  `fecha` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `categorias`
--

INSERT INTO `categorias` (`id`, `categoria`, `fecha`) VALUES
(1, 'mandos', '2020-10-15 05:05:02');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clientes`
--

CREATE TABLE `clientes` (
  `id` int(11) NOT NULL,
  `nombre` text COLLATE utf8_spanish_ci NOT NULL,
  `documento` int(11) NOT NULL,
  `email` text COLLATE utf8_spanish_ci DEFAULT NULL,
  `telefono` text COLLATE utf8_spanish_ci NOT NULL,
  `direccion` text COLLATE utf8_spanish_ci NOT NULL,
  `fecha_nacimiento` date DEFAULT NULL,
  `compras` int(11) DEFAULT NULL,
  `ultima_compra` datetime DEFAULT NULL,
  `fecha` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `clientes`
--

INSERT INTO `clientes` (`id`, `nombre`, `documento`, `email`, `telefono`, `direccion`, `fecha_nacimiento`, `compras`, `ultima_compra`, `fecha`) VALUES
(1, 'cliente', 75787097, 'ever@hotmail.com', '111111111', '', '0000-00-00', 54, '2020-10-19 22:38:31', '2020-10-20 03:38:31');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ingresos`
--

CREATE TABLE `ingresos` (
  `id` int(11) NOT NULL,
  `codigo` int(11) NOT NULL,
  `id_especial` int(11) NOT NULL,
  `productos` text COLLATE utf8mb4_spanish2_ci NOT NULL,
  `fecha` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--

CREATE TABLE `productos` (
  `id` int(11) NOT NULL,
  `id_categoria` int(11) NOT NULL,
  `id_proveedor` int(11) NOT NULL,
  `codigo` text COLLATE utf8_spanish_ci NOT NULL,
  `descripcion` text COLLATE utf8_spanish_ci NOT NULL,
  `imagen` text COLLATE utf8_spanish_ci NOT NULL,
  `stock` int(11) NOT NULL,
  `precio_compra` float NOT NULL,
  `precio_venta` float NOT NULL,
  `ventas` int(11) NOT NULL,
  `fecha` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `productos`
--

INSERT INTO `productos` (`id`, `id_categoria`, `id_proveedor`, `codigo`, `descripcion`, `imagen`, `stock`, `precio_compra`, `precio_venta`, `ventas`, `fecha`) VALUES
(2, 1, 1, '102', 'sonyasdasdasd', 'vistas/img/productos/default/anonymous.png', 0, 10, 14, 10, '2020-10-20 02:02:31'),
(3, 1, 1, '103', 'sonys', 'vistas/img/productos/default/anonymous.png', 1212, 123, 172.2, 2, '2020-10-17 20:04:00'),
(4, 1, 4, '104', 'sonys', 'vistas/img/productos/default/anonymous.png', 98, 10, 14, 6, '2020-10-21 05:20:07'),
(6, 1, 4, '105', 'mando', 'vistas/img/productos/default/anonymous.png', 10, 50, 70, 16, '2020-10-21 05:20:07'),
(7, 1, 1, '106', 'xbox', 'vistas/img/productos/106/261.jpg', 24, 60, 70, 20, '2020-10-21 05:20:07'),
(8, 1, 1, '107', 'peluche', 'vistas/img/productos/107/350.png', 59, 45, 60, 0, '2020-10-21 05:20:07'),
(10, 1, 4, '108', 'tayson', 'vistas/img/productos/default/anonymous.png', 12, 12, 16.8, 0, '2020-10-21 05:52:02');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proveedores`
--

CREATE TABLE `proveedores` (
  `id` int(11) NOT NULL,
  `nombres` text COLLATE utf8mb4_spanish2_ci NOT NULL,
  `direccion` text COLLATE utf8mb4_spanish2_ci NOT NULL,
  `celular` int(11) NOT NULL,
  `correo` text COLLATE utf8mb4_spanish2_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;

--
-- Volcado de datos para la tabla `proveedores`
--

INSERT INTO `proveedores` (`id`, `nombres`, `direccion`, `celular`, `correo`) VALUES
(1, 'asds', 'sad', 123213123, 'asdasd'),
(4, 'hol', 'sadsad', 231, 'asdsa');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `id` int(11) NOT NULL,
  `nombre` text COLLATE utf8_spanish_ci NOT NULL,
  `usuario` text COLLATE utf8_spanish_ci NOT NULL,
  `password` text COLLATE utf8_spanish_ci NOT NULL,
  `perfil` text COLLATE utf8_spanish_ci NOT NULL,
  `foto` text COLLATE utf8_spanish_ci NOT NULL,
  `estado` int(11) DEFAULT NULL,
  `ultimo_login` datetime DEFAULT NULL,
  `fecha` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id`, `nombre`, `usuario`, `password`, `perfil`, `foto`, `estado`, `ultimo_login`, `fecha`) VALUES
(1, 'Administrador', 'admin', '$2a$07$asxx54ahjppf45sd87a5auXBm1Vr2M1NV5t/zNQtGHGpS5fFirrbG', 'Administrador', 'vistas/img/usuarios/admin/191.jpg', 1, '2020-10-20 21:08:28', '2020-10-21 02:08:28'),
(57, 'Juan Fernando Urrego', 'juan', '$2a$07$asxx54ahjppf45sd87a5auRajNP0zeqOkB9Qda.dSiTb2/n.wAC/2', 'Vendedor', 'vistas/img/usuarios/juan/461.jpg', 1, '2020-10-20 11:06:41', '2020-10-20 16:06:41'),
(58, 'Julio Gómez', 'julio', '$2a$07$asxx54ahjppf45sd87a5auQhldmFjGsrgUipGlmQgDAcqevQZSAAC', 'Especial', 'vistas/img/usuarios/julio/100.png', 1, '2018-02-06 17:09:22', '2018-02-06 22:09:22'),
(59, 'Ana Gonzalez', 'ana', '$2a$07$asxx54ahjppf45sd87a5auLd2AxYsA/2BbmGKNk2kMChC3oj7V0Ca', 'Vendedor', 'vistas/img/usuarios/ana/260.png', 1, '2017-12-26 19:21:40', '2017-12-27 00:21:40');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ventas`
--

CREATE TABLE `ventas` (
  `id` int(11) NOT NULL,
  `codigo` int(11) NOT NULL,
  `id_cliente` int(11) NOT NULL,
  `id_vendedor` int(11) NOT NULL,
  `productos` text COLLATE utf8_spanish_ci NOT NULL,
  `impuesto` float NOT NULL,
  `neto` float NOT NULL,
  `total` float NOT NULL,
  `metodo_pago` text COLLATE utf8_spanish_ci NOT NULL,
  `fecha` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `ventas`
--

INSERT INTO `ventas` (`id`, `codigo`, `id_cliente`, `id_vendedor`, `productos`, `impuesto`, `neto`, `total`, `metodo_pago`, `fecha`) VALUES
(3, 10003, 1, 1, '[{\"id\":\"4\",\"descripcion\":\"sonys\",\"cantidad\":\"1\",\"stock\":\"0\",\"precio\":\"14\",\"total\":\"14\"},{\"id\":\"3\",\"descripcion\":\"sony\",\"cantidad\":\"2\",\"stock\":\"121\",\"precio\":\"172.2\",\"total\":\"344.4\"}]', 0, 358.4, 358.4, 'Efectivo', '2020-10-17 20:00:15'),
(4, 10004, 1, 1, '[{\"id\":\"2\",\"descripcion\":\"sonyasdasdasd\",\"cantidad\":\"1\",\"stock\":\"9\",\"precio\":\"14\",\"total\":\"14\"}]', 0, 14, 14, 'Efectivo', '2020-10-19 22:53:00'),
(5, 10005, 1, 1, '[{\"id\":\"6\",\"descripcion\":\"mando\",\"cantidad\":\"2\",\"stock\":\"18\",\"precio\":\"70\",\"total\":\"140\"}]', 0, 140, 140, 'Efectivo', '2020-10-19 22:54:32'),
(6, 10006, 1, 1, '[{\"id\":\"6\",\"descripcion\":\"mando\",\"cantidad\":\"1\",\"stock\":\"17\",\"precio\":\"70\",\"total\":\"70\"}]', 0, 70, 70, 'Efectivo', '2020-10-19 23:23:15'),
(7, 10007, 1, 1, '[{\"id\":\"6\",\"descripcion\":\"mando\",\"cantidad\":\"1\",\"stock\":\"16\",\"precio\":\"70\",\"total\":\"70\"},{\"id\":\"4\",\"descripcion\":\"sonys\",\"cantidad\":\"1\",\"stock\":\"101\",\"precio\":\"14\",\"total\":\"14\"}]', 0, 84, 84, 'TC-2030303003', '2020-10-19 23:26:51'),
(8, 10008, 1, 1, '[{\"id\":\"6\",\"descripcion\":\"mando\",\"cantidad\":\"1\",\"stock\":\"15\",\"precio\":\"70\",\"total\":\"70\"}]', 0, 70, 70, 'Efectivo', '2020-10-19 23:30:19'),
(9, 10009, 1, 1, '[{\"id\":\"2\",\"descripcion\":\"sonyasdasdasd\",\"cantidad\":\"9\",\"stock\":\"0\",\"precio\":\"14\",\"total\":\"126\"}]', 0, 126, 126, 'Efectivo', '2020-10-20 02:02:31'),
(10, 10010, 1, 1, '[{\"id\":\"7\",\"descripcion\":\"xbox\",\"cantidad\":\"2\",\"stock\":\"18\",\"precio\":\"70\",\"total\":\"140\"}]', 0, 140, 140, 'Efectivo', '2020-10-20 02:04:27'),
(11, 10011, 1, 1, '[{\"id\":\"7\",\"descripcion\":\"xbox\",\"cantidad\":\"2\",\"stock\":\"16\",\"precio\":\"70\",\"total\":\"140\"}]', 0, 140, 140, 'Efectivo', '2020-10-20 03:36:31'),
(12, 10012, 1, 1, '[{\"id\":\"7\",\"descripcion\":\"xbox\",\"cantidad\":\"16\",\"stock\":\"0\",\"precio\":\"70\",\"total\":\"1120\"},{\"id\":\"6\",\"descripcion\":\"mando\",\"cantidad\":\"9\",\"stock\":\"6\",\"precio\":\"70\",\"total\":\"630\"}]', 0, 1750, 1750, 'Efectivo', '2020-10-20 03:37:36'),
(13, 10013, 1, 1, '[{\"id\":\"6\",\"descripcion\":\"mando\",\"cantidad\":\"2\",\"stock\":\"4\",\"precio\":\"70\",\"total\":\"140\"},{\"id\":\"4\",\"descripcion\":\"sonys\",\"cantidad\":\"4\",\"stock\":\"97\",\"precio\":\"14\",\"total\":\"56\"}]', 0, 196, 196, 'Efectivo', '2020-10-20 03:38:31');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `categorias`
--
ALTER TABLE `categorias`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `clientes`
--
ALTER TABLE `clientes`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `ingresos`
--
ALTER TABLE `ingresos`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `productos`
--
ALTER TABLE `productos`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `proveedores`
--
ALTER TABLE `proveedores`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `ventas`
--
ALTER TABLE `ventas`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `categorias`
--
ALTER TABLE `categorias`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `clientes`
--
ALTER TABLE `clientes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `ingresos`
--
ALTER TABLE `ingresos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `productos`
--
ALTER TABLE `productos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `proveedores`
--
ALTER TABLE `proveedores`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=60;

--
-- AUTO_INCREMENT de la tabla `ventas`
--
ALTER TABLE `ventas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
