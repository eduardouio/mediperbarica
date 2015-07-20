-- phpMyAdmin SQL Dump
-- version 4.0.10deb1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Jul 13, 2015 at 03:07 PM
-- Server version: 5.5.43-0ubuntu0.14.04.1
-- PHP Version: 5.5.9-1ubuntu4.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `gelvscom_mediperbarica`
--

-- --------------------------------------------------------

--
-- Table structure for table `antecedente`
--

CREATE TABLE IF NOT EXISTS `antecedente` (
  `id_antecedente` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `id_paciente` varchar(10) NOT NULL,
  `tipo` varchar(45) NOT NULL COMMENT 'solo poner como opciones (antedentes patologicos personales, quirurjicos,familiares)',
  `detalle` varchar(180) NOT NULL,
  `creado` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_antecedente`,`tipo`),
  KEY `FK_ANTECENDETE_HISTORIA` (`id_paciente`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=9 ;

--
-- Dumping data for table `antecedente`
--

INSERT INTO `antecedente` (`id_antecedente`, `id_paciente`, `tipo`, `detalle`, `creado`) VALUES
(1, '1710005750', 'Patológicos Personales', 'Hepatitis A', '2015-07-13 18:57:27'),
(2, '1710005750', 'Quirúrgicos', 'H Quimica\nCirujia De Colson', '2015-07-13 18:58:19'),
(3, '1710005750', 'Patológicos Familiares', 'Asmatica / Madre Con Multi Traumas/ Asim Dm', '2015-07-13 18:59:25'),
(4, '1704968388', 'Patológicos Personales', 'Hdt, Tta, Droup / Hipotiroidismo / Cirrocis Hepatica /', '2015-07-13 19:06:41'),
(5, '1704968388', 'Quirúrgicos', 'Amigdalatomia / Toreidemigtomia / Histereotomia /', '2015-07-13 19:07:48'),
(6, '1704968388', 'Alergias', 'Aines', '2015-07-13 19:09:19'),
(7, '1704968388', 'Patológicos Familiares', 'Padre Fallece Con Cancer Estomacal', '2015-07-13 19:09:59'),
(8, '0801916529', 'Quirúrgicos', 'Post Operatorio Lipoescultura', '2015-07-13 19:20:09');

-- --------------------------------------------------------

--
-- Table structure for table `cliente`
--

CREATE TABLE IF NOT EXISTS `cliente` (
  `id_cliente` char(13) NOT NULL,
  `nombres` varchar(40) NOT NULL,
  `telefono` varchar(10) NOT NULL,
  `direccion` varchar(120) NOT NULL,
  `creado` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_cliente`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `factura`
--

CREATE TABLE IF NOT EXISTS `factura` (
  `id_factura` smallint(5) unsigned NOT NULL,
  `id_cliente` char(13) NOT NULL,
  `id_tratamiento` smallint(5) unsigned NOT NULL,
  `descuento` decimal(6,2) DEFAULT NULL,
  `subtotal0` decimal(6,2) DEFAULT NULL,
  `subtotal12` decimal(6,2) DEFAULT NULL,
  `fecha` date DEFAULT NULL,
  `estado` varchar(10) NOT NULL DEFAULT 'Emitida',
  `notas` varchar(180) DEFAULT NULL,
  `registro` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_factura`),
  KEY `fk_factura_cliente` (`id_cliente`),
  KEY `fk_factura_tratamiento` (`id_tratamiento`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `historia`
--

CREATE TABLE IF NOT EXISTS `historia` (
  `id_historia` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `id_paciente` varchar(10) NOT NULL,
  `nombres` varchar(40) NOT NULL,
  `telefono` varchar(10) NOT NULL,
  `fecha_nacimiento` date NOT NULL,
  `mail` varchar(45) NOT NULL,
  `direccion` varchar(120) NOT NULL,
  `nombre_referente` varchar(40) DEFAULT NULL,
  `telefono_referente` varchar(10) DEFAULT NULL,
  `mail_referente` varchar(45) DEFAULT NULL,
  `nombre_familiar` varchar(40) DEFAULT NULL,
  `telefono_familiar` varchar(10) DEFAULT NULL,
  `direccion_familiar` varchar(50) DEFAULT NULL,
  `examen_fisico` varchar(360) DEFAULT NULL,
  `manejo` varchar(180) DEFAULT NULL,
  `creado` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_paciente`),
  UNIQUE KEY `id_historia` (`id_historia`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `historia`
--

INSERT INTO `historia` (`id_historia`, `id_paciente`, `nombres`, `telefono`, `fecha_nacimiento`, `mail`, `direccion`, `nombre_referente`, `telefono_referente`, `mail_referente`, `nombre_familiar`, `telefono_familiar`, `direccion_familiar`, `examen_fisico`, `manejo`, `creado`) VALUES
(5, '0801916529', 'Shirley Quinoñez Prado', '0000000000', '1975-07-07', 'sinmail', 'Quito', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2015-07-13 19:19:36'),
(3, '1704968388', 'Pilar Patricio Arboleda Segovia', '2803153', '1957-06-11', 'sinmail', 'Quito', '', '', '', '', '', '', NULL, NULL, '2015-07-13 19:03:37'),
(2, '1710005750', 'Granda Darquea Francisco Javier', '0998648089', '1977-03-02', 'sinmail', 'Torre San Isisdro', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2015-07-13 18:56:38'),
(4, '1710019611', 'Jorge Yanez Romero', '0992004511', '1972-07-12', 'jorgeyanezjr@hotmail.com', 'Quito, Quiroz S95', 'Casa', '02261747', NULL, NULL, NULL, NULL, NULL, NULL, '2015-07-13 19:15:10'),
(1, '1722919725', 'Eduardo Villota', '0992936569', '1987-07-01', 'eduardouio7@gmail.com', 'Quito, Colon E4-412 Y Amazonas', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2015-07-09 19:44:58');

-- --------------------------------------------------------

--
-- Table structure for table `personal`
--

CREATE TABLE IF NOT EXISTS `personal` (
  `id_personal` varchar(10) NOT NULL,
  `nombres` varchar(40) NOT NULL,
  `direccion` varchar(180) DEFAULT NULL,
  `telefono_fijo` varchar(10) DEFAULT NULL,
  `celular` varchar(10) DEFAULT NULL,
  `mail` varchar(45) NOT NULL,
  `notas` varchar(180) DEFAULT NULL,
  `creado` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_personal`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `sesion`
--

CREATE TABLE IF NOT EXISTS `sesion` (
  `id_sesion` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `id_personal` varchar(10) NOT NULL,
  `id_tratamiento` smallint(5) unsigned NOT NULL,
  `fecha` date NOT NULL,
  `hora` time NOT NULL,
  `notas` varchar(450) DEFAULT NULL,
  `creado` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_sesion`,`id_tratamiento`),
  UNIQUE KEY `id_sesion` (`id_sesion`),
  KEY `FK_SESION_TRATAMIENTO` (`id_tratamiento`),
  KEY `FK_SESION_PERSONAL_idx` (`id_personal`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

-- --------------------------------------------------------

--
-- Table structure for table `tratamiento`
--

CREATE TABLE IF NOT EXISTS `tratamiento` (
  `id_tratamiento` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `id_paciente` varchar(10) NOT NULL,
  `id_personal` varchar(10) NOT NULL,
  `motivo_tratamiento` varchar(360) NOT NULL,
  `nro_sesiones` smallint(6) NOT NULL,
  `descuento` decimal(4,2) NOT NULL DEFAULT '0.00',
  `costo` decimal(4,2) NOT NULL DEFAULT '0.00',
  `creado` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `notas` varchar(360) DEFAULT NULL,
  PRIMARY KEY (`id_tratamiento`),
  KEY `FK_TRATAMIENTO_HISTORIA` (`id_paciente`),
  KEY `FK_TRATAMIENTO_PERSONAL` (`id_personal`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=8 ;

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE IF NOT EXISTS `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime NOT NULL,
  `username` varchar(30) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `email` varchar(75) NOT NULL,
  `creado` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `antecedente`
--
ALTER TABLE `antecedente`
  ADD CONSTRAINT `FK_ANTECENDETE_HISTORIA` FOREIGN KEY (`id_paciente`) REFERENCES `historia` (`id_paciente`) ON UPDATE CASCADE;

--
-- Constraints for table `factura`
--
ALTER TABLE `factura`
  ADD CONSTRAINT `fk_factura_cliente` FOREIGN KEY (`id_cliente`) REFERENCES `cliente` (`id_cliente`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_factura_tratamiento` FOREIGN KEY (`id_tratamiento`) REFERENCES `tratamiento` (`id_tratamiento`) ON UPDATE CASCADE;

--
-- Constraints for table `sesion`
--
ALTER TABLE `sesion`
  ADD CONSTRAINT `FK_SESION_PERSONAL` FOREIGN KEY (`id_personal`) REFERENCES `personal` (`id_personal`) ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_SESION_TRATAMIENTO` FOREIGN KEY (`id_tratamiento`) REFERENCES `tratamiento` (`id_tratamiento`) ON UPDATE CASCADE;

--
-- Constraints for table `tratamiento`
--
ALTER TABLE `tratamiento`
  ADD CONSTRAINT `FK_TRATAMIENTO_HISTORIA` FOREIGN KEY (`id_paciente`) REFERENCES `historia` (`id_paciente`) ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_TRATAMIENTO_PERSONAL` FOREIGN KEY (`id_personal`) REFERENCES `personal` (`id_personal`) ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;