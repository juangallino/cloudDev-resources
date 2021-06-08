-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3308
-- Generation Time: May 23, 2021 at 04:26 AM
-- Server version: 8.0.18
-- PHP Version: 7.3.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `tp-dan`
--

-- --------------------------------------------------------

--
-- Table structure for table `hibernate_sequence`
--

DROP TABLE IF EXISTS `hibernate_sequence`;
CREATE TABLE IF NOT EXISTS `hibernate_sequence` (
  `next_val` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `hibernate_sequence`
--

INSERT INTO `hibernate_sequence` (`next_val`) VALUES
(1);

-- --------------------------------------------------------

--
-- Table structure for table `ped_detalle_pedido`
--

DROP TABLE IF EXISTS `ped_detalle_pedido`;
CREATE TABLE IF NOT EXISTS `ped_detalle_pedido` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cantidad` int(11) DEFAULT NULL,
  `precio_dp` double DEFAULT NULL,
  `id_material` int(11) DEFAULT NULL,
  `detalle_pedido_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK-Detalle_Ped-Material` (`id_material`) USING BTREE,
  KEY `FK-Detalle_Ped-Pedido` (`detalle_pedido_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ped_detalle_pedido`
--

INSERT INTO `ped_detalle_pedido` (`id`, `cantidad`, `precio_dp`, `id_material`, `detalle_pedido_id`) VALUES
(1, 10, 36, 2, NULL),
(2, 50, 3698, 4, 37);

-- --------------------------------------------------------

--
-- Table structure for table `ped_estado_pedido`
--

DROP TABLE IF EXISTS `ped_estado_pedido`;
CREATE TABLE IF NOT EXISTS `ped_estado_pedido` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `estado` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ped_estado_pedido`
--

INSERT INTO `ped_estado_pedido` (`id`, `estado`) VALUES
(1, 'NUEVO'),
(2, 'CONFIRMADO'),
(3, 'PENDIENTE'),
(4, 'CANCELADO'),
(5, 'ACEPTADO'),
(6, 'RECHAZADO'),
(7, 'EN PREPARACION'),
(8, 'ENTREGADO');

-- --------------------------------------------------------

--
-- Table structure for table `ped_pedido`
--

DROP TABLE IF EXISTS `ped_pedido`;
CREATE TABLE IF NOT EXISTS `ped_pedido` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fecha_pedido` timestamp NULL DEFAULT NULL,
  `estado_pedido_id` int(11) DEFAULT NULL,
  `obra_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK-Pedido_id-Obra_id` (`obra_id`) USING BTREE,
  KEY `FK-Pedido_id-Estado_Ped_id` (`estado_pedido_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ped_pedido`
--

INSERT INTO `ped_pedido` (`id`, `fecha_pedido`, `estado_pedido_id`, `obra_id`) VALUES
(17, '2021-02-12 12:26:31', 5, 1),
(34, '2021-02-12 09:26:31', 1, 1),
(35, '2021-02-12 09:26:31', 1, 1),
(36, '2021-02-12 09:26:31', 1, 1),
(37, '2021-02-12 09:26:31', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `pgs_medio_pago`
--

DROP TABLE IF EXISTS `pgs_medio_pago`;
CREATE TABLE IF NOT EXISTS `pgs_medio_pago` (
  `disc` char(1) NOT NULL,
  `id` int(11) NOT NULL,
  `observacion` varchar(255) DEFAULT NULL,
  `banco` varchar(255) DEFAULT NULL,
  `fecha_cobro` timestamp NULL DEFAULT NULL,
  `nro_cheque` int(11) DEFAULT NULL,
  `nro_recibo` int(11) DEFAULT NULL,
  `cbu_destino` varchar(255) DEFAULT NULL,
  `cbu_origen` varchar(255) DEFAULT NULL,
  `codigo_transferencia` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `pgs_pago`
--

DROP TABLE IF EXISTS `pgs_pago`;
CREATE TABLE IF NOT EXISTS `pgs_pago` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fecha_pago` timestamp NULL DEFAULT NULL,
  `id_cliente` int(11) DEFAULT NULL,
  `id_medio_pago` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK-Pago_id-Cliente_id` (`id_cliente`) USING BTREE,
  KEY `FK-Pago_id-MedioPago_id` (`id_medio_pago`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `stk_detalle_provision`
--

DROP TABLE IF EXISTS `stk_detalle_provision`;
CREATE TABLE IF NOT EXISTS `stk_detalle_provision` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cantidad` int(11) DEFAULT NULL,
  `id_material` int(11) DEFAULT NULL,
  `id_provision` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK-DetalleProvision_id-Material_id` (`id_material`) USING BTREE,
  KEY `FK-DetalleProvision_id-Provision_id` (`id_provision`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `stk_material`
--

DROP TABLE IF EXISTS `stk_material`;
CREATE TABLE IF NOT EXISTS `stk_material` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(255) DEFAULT NULL,
  `nombre` varchar(255) DEFAULT NULL,
  `precio` double DEFAULT NULL,
  `stock_actual` int(11) DEFAULT NULL,
  `stock_minimo` int(11) DEFAULT NULL,
  `id_unidad` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK-Material_id-Unidad_id` (`id_unidad`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `stk_material`
--

INSERT INTO `stk_material` (`id`, `descripcion`, `nombre`, `precio`, `stock_actual`, `stock_minimo`, `id_unidad`) VALUES
(1, 'Cemento', NULL, 250, 300, 50, 4),
(2, 'ladrillo', NULL, 550, 15000, 3000, 4),
(3, 'Tornillos', NULL, 50, 10000, 2000, 4),
(4, 'arena', NULL, 850, 5000, 300, 1);

-- --------------------------------------------------------

--
-- Table structure for table `stk_movimiento_stock`
--

DROP TABLE IF EXISTS `stk_movimiento_stock`;
CREATE TABLE IF NOT EXISTS `stk_movimiento_stock` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cantidad_entrada` int(11) DEFAULT NULL,
  `cantidad_salida` int(11) DEFAULT NULL,
  `fecha` timestamp NULL DEFAULT NULL,
  `id_detalle_pedido` int(11) DEFAULT NULL,
  `id_detalle_provision` int(11) DEFAULT NULL,
  `id_material` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK-MovStock_id-DetalleProvision_id` (`id_detalle_provision`) USING BTREE,
  KEY `FK-MovStock_id-DetallePedido_id` (`id_detalle_pedido`) USING BTREE,
  KEY `FK-MovStock_id-Material_id` (`id_material`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `stk_provision`
--

DROP TABLE IF EXISTS `stk_provision`;
CREATE TABLE IF NOT EXISTS `stk_provision` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fecha_provision` time DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `stk_unidad`
--

DROP TABLE IF EXISTS `stk_unidad`;
CREATE TABLE IF NOT EXISTS `stk_unidad` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `stk_unidad`
--

INSERT INTO `stk_unidad` (`id`, `descripcion`) VALUES
(1, 'M2'),
(2, 'LITROS'),
(3, 'KG'),
(4, 'UNIDAD');

-- --------------------------------------------------------

--
-- Table structure for table `usr_cliente`
--

DROP TABLE IF EXISTS `usr_cliente`;
CREATE TABLE IF NOT EXISTS `usr_cliente` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cuit` varchar(255) DEFAULT NULL,
  `habilitado_online` bit(1) DEFAULT NULL,
  `mail` varchar(255) DEFAULT NULL,
  `max_cuenta_corriente` double DEFAULT NULL,
  `razon_social` varchar(255) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK-Cliente_id-Usuario_id` (`user_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `usr_cliente`
--

INSERT INTO `usr_cliente` (`id`, `cuit`, `habilitado_online`, `mail`, `max_cuenta_corriente`, `razon_social`, `user_id`) VALUES
(1, '20-39839120-1', b'1', 'juanit@gmail.com', 55000.2, 'razonSocial1', 1),
(2, '20-059251941-1', b'0', 'pupi@gmail.com', 355000.2, 'razonSocial2', 1);

-- --------------------------------------------------------

--
-- Table structure for table `usr_empleado`
--

DROP TABLE IF EXISTS `usr_empleado`;
CREATE TABLE IF NOT EXISTS `usr_empleado` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mail` varchar(255) DEFAULT NULL,
  `nombre` varchar(255) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK-Empleado_id-Usuario_id` (`user_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `usr_obra`
--

DROP TABLE IF EXISTS `usr_obra`;
CREATE TABLE IF NOT EXISTS `usr_obra` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(255) DEFAULT NULL,
  `direccion` varchar(255) DEFAULT NULL,
  `latitud` float DEFAULT NULL,
  `longitud` float DEFAULT NULL,
  `superficie` int(11) DEFAULT NULL,
  `cliente_id` int(11) DEFAULT NULL,
  `id_tipo_obra` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKj3t1r6giw9rq918no8tlos2g7` (`id_tipo_obra`),
  KEY `FK-Obra_id-CLiente_id` (`cliente_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `usr_obra`
--

INSERT INTO `usr_obra` (`id`, `descripcion`, `direccion`, `latitud`, `longitud`, `superficie`, `cliente_id`, `id_tipo_obra`) VALUES
(1, 'refaccion', 'san lorenzo43', 60000, 31000, 20, 1, 3);

-- --------------------------------------------------------

--
-- Table structure for table `usr_tipo_obra`
--

DROP TABLE IF EXISTS `usr_tipo_obra`;
CREATE TABLE IF NOT EXISTS `usr_tipo_obra` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `usr_tipo_obra`
--

INSERT INTO `usr_tipo_obra` (`id`, `descripcion`) VALUES
(1, 'REFORMA'),
(2, 'CASA'),
(3, 'EDIFICIO'),
(4, 'VIAL');

-- --------------------------------------------------------

--
-- Table structure for table `usr_tipo_usuario`
--

DROP TABLE IF EXISTS `usr_tipo_usuario`;
CREATE TABLE IF NOT EXISTS `usr_tipo_usuario` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tipo` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `usr_tipo_usuario`
--

INSERT INTO `usr_tipo_usuario` (`id`, `tipo`) VALUES
(1, 'CLIENTE'),
(2, 'VENDEDOR');

-- --------------------------------------------------------

--
-- Table structure for table `usr_usuario`
--

DROP TABLE IF EXISTS `usr_usuario`;
CREATE TABLE IF NOT EXISTS `usr_usuario` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(255) DEFAULT NULL,
  `user` varchar(255) DEFAULT NULL,
  `tipo_usuario_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKsfg0f2vfondte1ku5it8c9pr` (`tipo_usuario_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `usr_usuario`
--

INSERT INTO `usr_usuario` (`id`, `password`, `user`, `tipo_usuario_id`) VALUES
(1, '1234', 'juan96', 1),
(2, 'vendedor', 'vendedor', 2);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `ped_detalle_pedido`
--
ALTER TABLE `ped_detalle_pedido`
  ADD CONSTRAINT `FKaasy94hdxrmne3t9iinhiomau` FOREIGN KEY (`id_material`) REFERENCES `stk_material` (`id`),
  ADD CONSTRAINT `FKp0nbcjoei4qy65wgfqonf4beo` FOREIGN KEY (`detalle_pedido_id`) REFERENCES `ped_pedido` (`id`);

--
-- Constraints for table `ped_pedido`
--
ALTER TABLE `ped_pedido`
  ADD CONSTRAINT `FKcehprhhsa9cxq9a4uo7cnongb` FOREIGN KEY (`estado_pedido_id`) REFERENCES `ped_estado_pedido` (`id`),
  ADD CONSTRAINT `FKd22v73s0y6wkuk7jfocfia373` FOREIGN KEY (`obra_id`) REFERENCES `usr_obra` (`id`);

--
-- Constraints for table `pgs_pago`
--
ALTER TABLE `pgs_pago`
  ADD CONSTRAINT `FK7l7l7qn4unrql4txnrt082okx` FOREIGN KEY (`id_medio_pago`) REFERENCES `pgs_medio_pago` (`id`),
  ADD CONSTRAINT `FKa6op551ce7shi11335dpkj9ll` FOREIGN KEY (`id_cliente`) REFERENCES `usr_cliente` (`id`);

--
-- Constraints for table `stk_detalle_provision`
--
ALTER TABLE `stk_detalle_provision`
  ADD CONSTRAINT `FK7bn2t5krofwpvg1fjsa2f5f3a` FOREIGN KEY (`id_provision`) REFERENCES `stk_provision` (`id`),
  ADD CONSTRAINT `FKhux61evunfi3f45b8t9k85m4k` FOREIGN KEY (`id_material`) REFERENCES `stk_material` (`id`);

--
-- Constraints for table `stk_material`
--
ALTER TABLE `stk_material`
  ADD CONSTRAINT `FKg423qmoe0veckdmie27fwtxpo` FOREIGN KEY (`id_unidad`) REFERENCES `stk_unidad` (`id`);

--
-- Constraints for table `stk_movimiento_stock`
--
ALTER TABLE `stk_movimiento_stock`
  ADD CONSTRAINT `FK6662tyuxceactqves6c7gphg2` FOREIGN KEY (`id_detalle_pedido`) REFERENCES `ped_detalle_pedido` (`id`),
  ADD CONSTRAINT `FK7qfn48f44lbvj9ucj5mqokd6c` FOREIGN KEY (`id_detalle_provision`) REFERENCES `stk_detalle_provision` (`id`),
  ADD CONSTRAINT `FKneqm5t2swmkks4ndsrnim8syo` FOREIGN KEY (`id_material`) REFERENCES `stk_material` (`id`);

--
-- Constraints for table `usr_cliente`
--
ALTER TABLE `usr_cliente`
  ADD CONSTRAINT `FKee3gumsbmm262g7w4sta6pahv` FOREIGN KEY (`user_id`) REFERENCES `usr_usuario` (`id`);

--
-- Constraints for table `usr_empleado`
--
ALTER TABLE `usr_empleado`
  ADD CONSTRAINT `FK2lhcqropmlkbpintnag6pmj3s` FOREIGN KEY (`user_id`) REFERENCES `usr_usuario` (`id`);

--
-- Constraints for table `usr_obra`
--
ALTER TABLE `usr_obra`
  ADD CONSTRAINT `FKj3t1r6giw9rq918no8tlos2g7` FOREIGN KEY (`id_tipo_obra`) REFERENCES `usr_tipo_obra` (`id`),
  ADD CONSTRAINT `FKmi1wih9lwqudr62drc2r1gx2d` FOREIGN KEY (`cliente_id`) REFERENCES `usr_cliente` (`id`);

--
-- Constraints for table `usr_usuario`
--
ALTER TABLE `usr_usuario`
  ADD CONSTRAINT `FKsfg0f2vfondte1ku5it8c9pr` FOREIGN KEY (`tipo_usuario_id`) REFERENCES `usr_tipo_usuario` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
