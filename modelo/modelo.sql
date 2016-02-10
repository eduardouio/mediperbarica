/*******************************************************************************
  Copyright 2014 Mediperbarica Todos los derechos reservados
  @autor: Eduardo Villota
  @date: 11-05-2016 23:44
  @version 0.2.16
 
 Introduccion: Modelo de base de datos, definicion de la estructura datos
/******************************************************************************/

-- -----------------------------------------------------------------------------
-- Tabla de Historias
-- -----------------------------------------------------------------------------
CREATE TABLE `historia` (
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
  `examen_fisico` varchar(360) DEFAULT NULL,
  `manejo` varchar(180) DEFAULT NULL,
  `creado` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_paciente`),
  UNIQUE KEY `id_historia` (`id_historia`)
) ENGINE=InnoDB AUTO_INCREMENT=1000 DEFAULT CHARSET=latin1;

-- -----------------------------------------------------------------------------
-- Tabla de personal
-- -----------------------------------------------------------------------------
CREATE TABLE `personal` (
  `id_personal` varchar(10) NOT NULL,
  `nombres` varchar(40) NOT NULL,
  `cargo` varchar(45) NOT NULL,
  `direccion` varchar(180) DEFAULT NULL,
  `telefono_fijo` varchar(10) DEFAULT NULL,
  `celular` varchar(10) DEFAULT NULL,
  `mail` varchar(45) NOT NULL,
  `notas` varchar(180) DEFAULT NULL,
  `creado` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_personal`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- -----------------------------------------------------------------------------
-- Tabla de cliente
-- -----------------------------------------------------------------------------
CREATE TABLE `cliente` (
  `id_cliente` char(13) NOT NULL,
  `nombres` varchar(40) NOT NULL,
  `telefono` varchar(10) NOT NULL,
  `direccion` varchar(120) NOT NULL,
  `creado` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_cliente`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- -----------------------------------------------------------------------------
-- Tabla de equipo
-- -----------------------------------------------------------------------------
CREATE TABLE `equipo` (
  `id_equipo` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) DEFAULT NULL,
  `nro_serie` varchar(45) DEFAULT NULL,
  `marca` varchar(45) DEFAULT NULL,
  `modelo` varchar(45) DEFAULT NULL,
  `notas` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`id_equipo`)
) ENGINE=InnoDB AUTO_INCREMENT=2001 DEFAULT CHARSET=latin1;

-- -----------------------------------------------------------------------------
-- Tabla de usuario
-- -----------------------------------------------------------------------------
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` int(11) NOT NULL,
  `admin` varchar(45) NOT NULL DEFAULT '0',
  `username` varchar(30) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `email` varchar(75) NOT NULL,
  `creado` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=1000 DEFAULT CHARSET=latin1;

-- -----------------------------------------------------------------------------
-- Tabla de antecedente
-- -----------------------------------------------------------------------------
CREATE TABLE `antecedente` (
  `id_antecedente` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `id_paciente` varchar(10) NOT NULL,
  `antecedente` varchar(180) NOT NULL,
  `creado` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_antecedente`,`tipo`),
  KEY `FK_ANTECENDETE_HISTORIA` (`id_paciente`),
  CONSTRAINT `FK_ANTECENDETE_HISTORIA` FOREIGN KEY (`id_paciente`) 
  REFERENCES `historia` (`id_paciente`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=0 DEFAULT CHARSET=latin1;

-- -----------------------------------------------------------------------------
-- Tabla de tratamiento
-- -----------------------------------------------------------------------------
CREATE TABLE `tratamiento` (
  `id_tratamiento` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `id_paciente` varchar(10) NOT NULL,
  `id_personal` varchar(10) NOT NULL,
  `motivo_tratamiento` varchar(360) NOT NULL,
  `nro_sesiones` smallint(6) NOT NULL,
  `descuento` decimal(4,2) NOT NULL DEFAULT '0.00',
  `costo` decimal(6,2) NOT NULL DEFAULT '0.00',
  `creado` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `notas` varchar(360) DEFAULT NULL,
  PRIMARY KEY (`id_tratamiento`),
  KEY `FK_TRATAMIENTO_HISTORIA` (`id_paciente`),
  KEY `FK_TRATAMIENTO_PERSONAL` (`id_personal`),
  CONSTRAINT `FK_TRATAMIENTO_HISTORIA` FOREIGN KEY (`id_paciente`) 
  REFERENCES `historia` (`id_paciente`) ON UPDATE CASCADE,
  CONSTRAINT `FK_TRATAMIENTO_PERSONAL` FOREIGN KEY (`id_personal`) 
  REFERENCES `personal` (`id_personal`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=1000 DEFAULT CHARSET=latin1;

-- -----------------------------------------------------------------------------
-- Tabla de sesion
-- -----------------------------------------------------------------------------
CREATE TABLE `sesion` (
  `id_sesion` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `id_personal` varchar(10) NOT NULL,
  `id_tratamiento` smallint(5) unsigned NOT NULL,
  `id_equipo` int(11) NOT NULL,
  `fecha` datetime NOT NULL,
  `notas` varchar(450) DEFAULT NULL,
  `creado` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_sesion`,`id_tratamiento`),
  UNIQUE KEY `id_sesion` (`id_sesion`),
  KEY `FK_SESION_TRATAMIENTO` (`id_tratamiento`),
  KEY `FK_SESION_PERSONAL_idx` (`id_personal`),
  KEY `FK_SESION_EQUIPO_idx` (`id_equipo`),
  CONSTRAINT `FK_SESION_EQUIPO` FOREIGN KEY (`id_equipo`) 
  REFERENCES `equipo` (`id_equipo`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `FK_SESION_PERSONAL` FOREIGN KEY (`id_personal`) 
  REFERENCES `personal` (`id_personal`) ON UPDATE CASCADE,
  CONSTRAINT `FK_SESION_TRATAMIENTO` FOREIGN KEY (`id_tratamiento`) 
  REFERENCES `tratamiento` (`id_tratamiento`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=1000 DEFAULT CHARSET=latin1;

-- -----------------------------------------------------------------------------
-- Tabla de factura
-- -----------------------------------------------------------------------------
CREATE TABLE `factura` (
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
  KEY `fk_factura_tratamiento` (`id_tratamiento`),
  CONSTRAINT `fk_factura_cliente` FOREIGN KEY (`id_cliente`) 
  REFERENCES `cliente` (`id_cliente`) ON UPDATE CASCADE,
  CONSTRAINT `fk_factura_tratamiento` FOREIGN KEY (`id_tratamiento`) 
  REFERENCES `tratamiento` (`id_tratamiento`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- -----------------------------------------------------------------------------
-- Tabla de cobro
-- -----------------------------------------------------------------------------
CREATE TABLE `gelvscom_mediperbarica`.`cobro` (
  `id_cobro` SMALLINT UNSIGNED NOT NULL AUTO_INCREMENT,
  `id_factura` SMALLINT(5) UNSIGNED NOT NULL,
  `tipo` VARCHAR(45) NOT NULL,
  `fecha` datetime NOT NULL,
  `banco` VARCHAR(45) NULL,
  `nro_cheque` VARCHAR(45) NULL,
  `nro_deposito` VARCHAR(45) NULL,
  `valor` VARCHAR(45) NOT NULL,
  `registro` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_cobro`),
  unique(`id_factura`),
  CONSTRAINT `FK_COBRO_FACTURA`
    FOREIGN KEY (id_factura)
    REFERENCES factura(id_factura)
    ON DELETE RESTRICT
    ON UPDATE CASCADE)
     ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- -----------------------------------------------------------------------------
-- Tabla log de actividades de ususario
-- -----------------------------------------------------------------------------
CREATE TABLE `log_user` (
  `id_log` int(10) unsigned NOT NULL AUTO_INCREMENT PRIMARY KEY,
  `accion` varchar(45) NOT NULL,
  `tabla` varchar(45) NOT NULL,
  `old_data` varchar(500) DEFAULT NULL,
  `new_data` varchar(500) DEFAULT NULL,
  `fecha` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;