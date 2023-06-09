-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 09-06-2023 a las 17:08:53
-- Versión del servidor: 10.4.28-MariaDB
-- Versión de PHP: 8.0.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `restaurante317`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `administrador`
--

CREATE TABLE `administrador` (
  `id_admin` int(5) NOT NULL,
  `nombre` varchar(40) NOT NULL,
  `apPat` varchar(30) NOT NULL,
  `apMat` varchar(30) NOT NULL,
  `nick` varchar(20) NOT NULL,
  `password` varchar(15) NOT NULL,
  `an_expe` int(5) NOT NULL,
  `salario` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `administrador`
--

INSERT INTO `administrador` (`id_admin`, `nombre`, `apPat`, `apMat`, `nick`, `password`, `an_expe`, `salario`) VALUES
(2, 'Felipe', 'Altamirano', 'Monasterios', 'kdrew6739', 'kdrew6723145', 2, 2500),
(3, 'A', 'Admin1', 'Admin1', 'admin1', '123', 5, 2500),
(4, 'B', 'Admin1', 'Admin1', 'admin1', '123', 5, 2500),
(5, 'C', 'Admin2', 'Admin2', 'admin2', '123', 5, 1500),
(6, 'D', 'Admin3', 'Admin3', 'admin3', '123', 5, 3500),
(7, 'E', 'Admin4', 'Admin4', 'admin4', '123', 5, 1800),
(8, 'F', 'Admin5', 'Admin5', 'admin5', '123', 5, 1000),
(9, 'G', 'Admin6', 'Admin6', 'admin6', '123', 5, 15000),
(10, 'H', 'Admin7', 'Admin7', 'admin7', '123', 5, 1300),
(11, 'I', 'Admin8', 'Admin8', 'admin8', '123', 5, 1100);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `bebida`
--

CREATE TABLE `bebida` (
  `id_bebida` int(11) NOT NULL,
  `tipo_bedida` varchar(20) DEFAULT NULL,
  `id_producto` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `bebida`
--

INSERT INTO `bebida` (`id_bebida`, `tipo_bedida`, `id_producto`) VALUES
(1, 'Alcoholica', 2),
(2, 'Jugo', 10),
(3, 'Jugo', 4),
(4, 'Alcoholica', 14),
(5, 'Jugo', 13),
(6, 'Hervido', 11);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cajero`
--

CREATE TABLE `cajero` (
  `id_cajero` int(11) NOT NULL,
  `ci` int(11) NOT NULL,
  `años_exp` int(11) DEFAULT NULL,
  `ultimo_lugar` varchar(20) DEFAULT NULL,
  `salario` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `cajero`
--

INSERT INTO `cajero` (`id_cajero`, `ci`, `años_exp`, `ultimo_lugar`, `salario`) VALUES
(1, 151515, 2, 'BANCO BNB', 2500),
(2, 161616, 6, 'BCP', 1800),
(3, 101010, 2, 'BCB', 2800),
(4, 171717, 3, 'HIPERMAXI', 1500);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `camarero`
--

CREATE TABLE `camarero` (
  `id_camarero` int(11) NOT NULL,
  `años_exp` int(11) DEFAULT NULL,
  `ultimo_lugar` varchar(20) DEFAULT NULL,
  `salario` int(11) DEFAULT NULL,
  `ci` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `camarero`
--

INSERT INTO `camarero` (`id_camarero`, `años_exp`, `ultimo_lugar`, `salario`, `ci`) VALUES
(1, 2, 'SHANGRILLA', 1800, 171717),
(2, 2, 'CAFETERIA PARAISO', 1500, 161616);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `chef`
--

CREATE TABLE `chef` (
  `id_chef` int(11) NOT NULL,
  `años_exp` int(11) DEFAULT NULL,
  `ultimo_lugar` varchar(20) DEFAULT NULL,
  `salario` int(11) DEFAULT NULL,
  `ci` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cliente`
--

CREATE TABLE `cliente` (
  `id_cliente` int(11) NOT NULL,
  `hora_ingreso` timestamp NULL DEFAULT current_timestamp(),
  `ci` int(11) NOT NULL,
  `id_cajero` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `cliente`
--

INSERT INTO `cliente` (`id_cliente`, `hora_ingreso`, `ci`, `id_cajero`) VALUES
(1, '2023-06-09 04:00:00', 191919, 3),
(2, '2023-06-09 15:03:20', 202020, 4);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `contiene`
--

CREATE TABLE `contiene` (
  `id_producto` int(11) NOT NULL,
  `id_ingrediente` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `factura`
--

CREATE TABLE `factura` (
  `id_factura` int(11) NOT NULL,
  `id_cliente` int(11) DEFAULT NULL,
  `id_cajero` int(11) DEFAULT NULL,
  `total_pagar` int(11) DEFAULT NULL,
  `efectivo` int(11) DEFAULT NULL,
  `cambio` int(11) DEFAULT NULL,
  `fecha` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `factura`
--

INSERT INTO `factura` (`id_factura`, `id_cliente`, `id_cajero`, `total_pagar`, `efectivo`, `cambio`, `fecha`) VALUES
(1, 2, 3, 100, 100, 0, '2023-06-09 04:00:00'),
(2, 2, 3, 45, 100, 55, '2023-06-09 15:06:04'),
(3, 1, 1, 55, 60, 5, '2023-06-09 15:06:04');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ingrediente`
--

CREATE TABLE `ingrediente` (
  `id_ingrediente` int(11) NOT NULL,
  `precio` int(11) DEFAULT NULL,
  `descripcion` varchar(50) DEFAULT NULL,
  `cantidad` int(11) DEFAULT NULL,
  `id_chef` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mesa`
--

CREATE TABLE `mesa` (
  `id_mesa` int(11) NOT NULL,
  `capacidad` int(11) DEFAULT NULL,
  `id_camarero` int(11) DEFAULT NULL,
  `adicionar_quitar` varchar(20) DEFAULT NULL,
  `detalle` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `mesa`
--

INSERT INTO `mesa` (`id_mesa`, `capacidad`, `id_camarero`, `adicionar_quitar`, `detalle`) VALUES
(1, 5, 1, 'DISPONIBLE', 'MESA PARA 5 PERSONAS SIN RESERVACION'),
(2, 3, 2, 'DISPONIBLE', 'MESA PARA 2 PERSONAS SIN RESERVACION');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `orden`
--

CREATE TABLE `orden` (
  `id_orden` int(11) NOT NULL,
  `id_mesa` int(11) DEFAULT NULL,
  `id_chef` int(11) DEFAULT NULL,
  `hora` date DEFAULT current_timestamp(),
  `id_factura` int(11) DEFAULT NULL,
  `tipo_pago` varchar(20) DEFAULT NULL,
  `id_cliente` int(11) DEFAULT NULL,
  `habilita` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `orden_producto`
--

CREATE TABLE `orden_producto` (
  `id_orden` int(11) NOT NULL,
  `id_producto` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `plato`
--

CREATE TABLE `plato` (
  `id_plato` int(11) NOT NULL,
  `tipo_plato` varchar(20) DEFAULT NULL,
  `id_producto` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `producto`
--

CREATE TABLE `producto` (
  `id_producto` int(11) NOT NULL,
  `nombre` varchar(30) DEFAULT NULL,
  `descripcion` varchar(100) DEFAULT NULL,
  `precio` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `producto`
--

INSERT INTO `producto` (`id_producto`, `nombre`, `descripcion`, `precio`) VALUES
(1, 'Leche', 'Leche de Almendras', 20),
(2, 'Coctel', 'Coctel de Tumbo', 55),
(3, 'Pizza Carnivora', 'Pizza (Tocino, Carne y Complementos)', 75),
(4, 'Jugo Hervido', 'Jugo de Frutas Hervidas', 12),
(5, 'Chairo', 'Sopa de Chairo con carne, trigo, etc', 25),
(6, 'Sopa de Pollo', 'Sopa de Pollo con presa a elegir', 18),
(7, 'Milaneza', 'Milaneza de Pollo/Res con papas, arroz y ensalada.', 25),
(8, 'Chicharron', 'Chicharron de Cerdo', 35),
(9, 'Pescado', 'Trucha, pejerrey, sabalo.', 20),
(10, 'Tamarindo', 'Jugo de Tamarindo con azucar. 500ml', NULL),
(11, 'Kisa', 'Hervido de Kisa con mokolas', NULL),
(12, 'Sprite', 'Refresco', NULL),
(13, 'Jugo de Platano', 'Jugo de platano con leche/agua', NULL),
(14, 'Mojito', 'Bebida alcoholica con hierba buena, singani, menta', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `ci` int(11) NOT NULL,
  `nombres` varchar(30) DEFAULT NULL,
  `apPat` varchar(30) DEFAULT NULL,
  `apMat` varchar(30) DEFAULT NULL,
  `nick` varchar(20) DEFAULT NULL,
  `contraseña` varchar(20) DEFAULT NULL,
  `nacionalidad` varchar(30) DEFAULT NULL,
  `id_admin` int(11) DEFAULT NULL,
  `años_exp` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`ci`, `nombres`, `apPat`, `apMat`, `nick`, `contraseña`, `nacionalidad`, `id_admin`, `años_exp`) VALUES
(101010, 'David', 'Diaz', 'Marca', 'david123', '123', 'Bolivia', 3, 2),
(151515, 'Juan', 'Paredes', 'Lopz', 'juan123', '123', 'Bolivia', 2, 5),
(161616, 'Martha', 'Saz', 'Diaz', 'martha123', '123', 'Bolivia', 3, 2),
(171717, 'Fer', 'Gomez', 'A', 'fer123', '123', 'Bolivia', 3, 2),
(181818, 'Jorge', 'B', 'B', 'jor123', '123', 'Bolivia', 3, 2),
(191919, 'Ricardo', 'C', 'C', 'ricardo123', '123', 'Bolivia', 3, 2),
(202020, 'Luis', 'D', 'D', 'luis123', '123', 'Bolivia', 3, 2),
(212121, 'Ana', 'E', 'D', 'ana123', '123', 'Bolivia', 3, 2);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `administrador`
--
ALTER TABLE `administrador`
  ADD PRIMARY KEY (`id_admin`);

--
-- Indices de la tabla `bebida`
--
ALTER TABLE `bebida`
  ADD PRIMARY KEY (`id_bebida`),
  ADD KEY `id_producto` (`id_producto`);

--
-- Indices de la tabla `cajero`
--
ALTER TABLE `cajero`
  ADD PRIMARY KEY (`id_cajero`),
  ADD KEY `ci` (`ci`);

--
-- Indices de la tabla `camarero`
--
ALTER TABLE `camarero`
  ADD PRIMARY KEY (`id_camarero`),
  ADD KEY `ci` (`ci`);

--
-- Indices de la tabla `chef`
--
ALTER TABLE `chef`
  ADD PRIMARY KEY (`id_chef`),
  ADD KEY `ci` (`ci`);

--
-- Indices de la tabla `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`id_cliente`),
  ADD KEY `ci` (`ci`),
  ADD KEY `id_cajero` (`id_cajero`);

--
-- Indices de la tabla `contiene`
--
ALTER TABLE `contiene`
  ADD KEY `id_producto` (`id_producto`),
  ADD KEY `id_ingrediente` (`id_ingrediente`);

--
-- Indices de la tabla `factura`
--
ALTER TABLE `factura`
  ADD PRIMARY KEY (`id_factura`),
  ADD KEY `id_cliente` (`id_cliente`),
  ADD KEY `id_cajero` (`id_cajero`);

--
-- Indices de la tabla `ingrediente`
--
ALTER TABLE `ingrediente`
  ADD PRIMARY KEY (`id_ingrediente`),
  ADD KEY `id_chef` (`id_chef`);

--
-- Indices de la tabla `mesa`
--
ALTER TABLE `mesa`
  ADD PRIMARY KEY (`id_mesa`),
  ADD KEY `id_camarero` (`id_camarero`);

--
-- Indices de la tabla `orden`
--
ALTER TABLE `orden`
  ADD PRIMARY KEY (`id_orden`),
  ADD KEY `id_mesa` (`id_mesa`),
  ADD KEY `id_chef` (`id_chef`),
  ADD KEY `id_factura` (`id_factura`),
  ADD KEY `id_cliente` (`id_cliente`);

--
-- Indices de la tabla `orden_producto`
--
ALTER TABLE `orden_producto`
  ADD KEY `id_orden` (`id_orden`),
  ADD KEY `id_producto` (`id_producto`);

--
-- Indices de la tabla `plato`
--
ALTER TABLE `plato`
  ADD PRIMARY KEY (`id_plato`),
  ADD KEY `id_producto` (`id_producto`);

--
-- Indices de la tabla `producto`
--
ALTER TABLE `producto`
  ADD PRIMARY KEY (`id_producto`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`ci`),
  ADD KEY `id_admin` (`id_admin`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `administrador`
--
ALTER TABLE `administrador`
  MODIFY `id_admin` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT de la tabla `bebida`
--
ALTER TABLE `bebida`
  MODIFY `id_bebida` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `camarero`
--
ALTER TABLE `camarero`
  MODIFY `id_camarero` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `chef`
--
ALTER TABLE `chef`
  MODIFY `id_chef` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `cliente`
--
ALTER TABLE `cliente`
  MODIFY `id_cliente` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `factura`
--
ALTER TABLE `factura`
  MODIFY `id_factura` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `ingrediente`
--
ALTER TABLE `ingrediente`
  MODIFY `id_ingrediente` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `mesa`
--
ALTER TABLE `mesa`
  MODIFY `id_mesa` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `orden`
--
ALTER TABLE `orden`
  MODIFY `id_orden` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `plato`
--
ALTER TABLE `plato`
  MODIFY `id_plato` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `producto`
--
ALTER TABLE `producto`
  MODIFY `id_producto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `bebida`
--
ALTER TABLE `bebida`
  ADD CONSTRAINT `bebida_ibfk_1` FOREIGN KEY (`id_producto`) REFERENCES `producto` (`id_producto`);

--
-- Filtros para la tabla `cajero`
--
ALTER TABLE `cajero`
  ADD CONSTRAINT `cajero_ibfk_1` FOREIGN KEY (`ci`) REFERENCES `usuario` (`ci`);

--
-- Filtros para la tabla `camarero`
--
ALTER TABLE `camarero`
  ADD CONSTRAINT `camarero_ibfk_1` FOREIGN KEY (`ci`) REFERENCES `usuario` (`ci`);

--
-- Filtros para la tabla `chef`
--
ALTER TABLE `chef`
  ADD CONSTRAINT `chef_ibfk_1` FOREIGN KEY (`ci`) REFERENCES `usuario` (`ci`);

--
-- Filtros para la tabla `cliente`
--
ALTER TABLE `cliente`
  ADD CONSTRAINT `cliente_ibfk_1` FOREIGN KEY (`ci`) REFERENCES `usuario` (`ci`),
  ADD CONSTRAINT `cliente_ibfk_2` FOREIGN KEY (`id_cajero`) REFERENCES `cajero` (`id_cajero`);

--
-- Filtros para la tabla `contiene`
--
ALTER TABLE `contiene`
  ADD CONSTRAINT `contiene_ibfk_1` FOREIGN KEY (`id_producto`) REFERENCES `producto` (`id_producto`),
  ADD CONSTRAINT `contiene_ibfk_2` FOREIGN KEY (`id_ingrediente`) REFERENCES `ingrediente` (`id_ingrediente`);

--
-- Filtros para la tabla `factura`
--
ALTER TABLE `factura`
  ADD CONSTRAINT `factura_ibfk_1` FOREIGN KEY (`id_cliente`) REFERENCES `cliente` (`id_cliente`),
  ADD CONSTRAINT `factura_ibfk_2` FOREIGN KEY (`id_cajero`) REFERENCES `cajero` (`id_cajero`);

--
-- Filtros para la tabla `ingrediente`
--
ALTER TABLE `ingrediente`
  ADD CONSTRAINT `ingrediente_ibfk_1` FOREIGN KEY (`id_chef`) REFERENCES `chef` (`id_chef`);

--
-- Filtros para la tabla `mesa`
--
ALTER TABLE `mesa`
  ADD CONSTRAINT `mesa_ibfk_1` FOREIGN KEY (`id_camarero`) REFERENCES `camarero` (`id_camarero`);

--
-- Filtros para la tabla `orden`
--
ALTER TABLE `orden`
  ADD CONSTRAINT `orden_ibfk_1` FOREIGN KEY (`id_mesa`) REFERENCES `mesa` (`id_mesa`),
  ADD CONSTRAINT `orden_ibfk_2` FOREIGN KEY (`id_chef`) REFERENCES `chef` (`id_chef`),
  ADD CONSTRAINT `orden_ibfk_3` FOREIGN KEY (`id_factura`) REFERENCES `factura` (`id_factura`),
  ADD CONSTRAINT `orden_ibfk_4` FOREIGN KEY (`id_cliente`) REFERENCES `cliente` (`id_cliente`);

--
-- Filtros para la tabla `orden_producto`
--
ALTER TABLE `orden_producto`
  ADD CONSTRAINT `orden_producto_ibfk_1` FOREIGN KEY (`id_orden`) REFERENCES `orden` (`id_orden`),
  ADD CONSTRAINT `orden_producto_ibfk_2` FOREIGN KEY (`id_producto`) REFERENCES `producto` (`id_producto`);

--
-- Filtros para la tabla `plato`
--
ALTER TABLE `plato`
  ADD CONSTRAINT `plato_ibfk_1` FOREIGN KEY (`id_producto`) REFERENCES `producto` (`id_producto`);

--
-- Filtros para la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD CONSTRAINT `usuario_ibfk_1` FOREIGN KEY (`id_admin`) REFERENCES `administrador` (`id_admin`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
