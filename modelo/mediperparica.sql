-- -------------------------------------------------------------------------- --
--          Modelo de Base de datos Medicina Hiperbarica
-- -------------------------------------------------------------------------- --
-- @autor Eduardo Villota <eduardouio7@gmail.com>
-- @creado 2015-03-17
-- @copyrigth Medicina Hiperbarica S.A.
-- @version 0.1.
-- @descripcion Modelo de base de datos para consultorio de tratamiento con oxigeno

CREATE DATABASE gelvscom_mediperbarica;
USE gelvscom_mediperbarica;

-- -------------------------------------------------------------------------- --
-- Tabla de usuarios 
-- -------------------------------------------------------------------------- --
CREATE TABLE user(
  id int(11) NOT NULL AUTO_INCREMENT,
  password VARCHAR(128) NOT NULL,
  last_login datetime NOT NULL,
  username VARCHAR(30) NOT NULL,
  first_name VARCHAR(30) NOT NULL,
  last_name VARCHAR(30) NOT NULL,
  email VARCHAR(75) NOT NULL,
  creado TIMESTAMP default CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=1000;

-- -------------------------------------------------------------------------- --
-- Medicos y Personal
-- -------------------------------------------------------------------------- --
CREATE TABLE personal(
  id_personal VARCHAR(10) NOT NULL,
  nombres VARCHAR(30) NOT NULL,
  direccion VARCHAR(180) DEFAULT NULL,
  telefono_fijo VARCHAR(10) DEFAULT NULL,
  celular VARCHAR(10) DEFAULT NULL,
  mail VARCHAR(45) NOT NULL,
  notas VARCHAR(180) DEFAULT NULL,
  creado TIMESTAMP default CURRENT_TIMESTAMP,
  PRIMARY KEY(id_personal)
)ENGINE=InnoDB AUTO_INCREMENT=1000;


-- -------------------------------------------------------------------------- --
-- Tabla de clientes
-- -------------------------------------------------------------------------- --
CREATE TABLE cliente(
  id_cliente CHAR(13) NOT NULL,
  nombres VARCHAR(40) NOT NULL,
  telefono VARCHAR(10) NOT NULL,
  direccion VARCHAR(120) NOT NULL,
  creado TIMESTAMP default CURRENT_TIMESTAMP,
  PRIMARY KEY(id_cliente)
) ENGINE = InnoDB;

-- -------------------------------------------------------------------------- --
-- Tabla de historias
-- -------------------------------------------------------------------------- --
CREATE TABLE historia(
  id_historia SMALLINT UNSIGNED NOT NULL AUTO_INCREMENT,
  id_paciente VARCHAR(10) NOT NULL,
  nombres VARCHAR(30) NOT NULL,
  telefono VARCHAR(10) NOT NULL,
  fecha_nacimiento date NOT NULL,
  mail VARCHAR(45) NOT NULL,
  direccion VARCHAR(120) NOT NULL,
  motivo_tratamiento VARCHAR(360) NOT NULL,
  examen_fisico VARCHAR(360) NOT NULL,
  manejo VARCHAR(180) DEFAULT NULL,
  nombre_familiar VARCHAR(30) DEFAULT NULL,
  telefono_familiar VARCHAR(10) DEFAULT NULL,
  direccion_familiar VARCHAR(50) DEFAULT NULL,
  creado TIMESTAMP default CURRENT_TIMESTAMP,
  PRIMARY KEY(id_paciente),
  UNIQUE(id_historia)
)ENGINE = InnoDB AUTO_INCREMENT = 1000;

-- -------------------------------------------------------------------------- --
-- Tabla de antecendetes
-- -------------------------------------------------------------------------- --
CREATE TABLE antecedente(
  id_antecedente SMALLINT UNSIGNED NOT NULL AUTO_INCREMENT,
  id_paciente VARCHAR(10) NOT NULL,
  tipo VARCHAR(45) NOT NULL comment 'solo poner como opciones (antedentes patologicos personales, quirurjicos,familiares)',
  detalle VARCHAR(180) NOT NULL,
  creado TIMESTAMP default CURRENT_TIMESTAMP,
  PRIMARY KEY(id_antecedente,tipo),
  CONSTRAINT `FK_ANTECENDETE_HISTORIA`
  FOREIGN KEY(id_paciente) REFERENCES historia(id_paciente)
  ON UPDATE CASCADE ON DELETE RESTRICT
)ENGINE = InnoDB;


-- -------------------------------------------------------------------------- --
-- Tabla de tratamientos
-- -------------------------------------------------------------------------- --
CREATE TABLE tratamiento(
  id_tratamiento SMALLINT UNSIGNED NOT NULL AUTO_INCREMENT,
  id_paciente VARCHAR(10) NOT NULL,
  id_personal VARCHAR(10) NOT NULL,
  nro_sesiones SMALLINT NOT NULL,
  forma_pago VARCHAR(15) COMMENT 'cheque,efectivo,tarjeta,credito directo',
  tarjeta_banco VARCHAR(15) COMMENT 'diners,mastercard,visa,coutafacil/internacional,pichincha',
  valor DECIMAL(5,3),
  creado TIMESTAMP default CURRENT_TIMESTAMP,
  notas VARCHAR(360) DEFAULT NULL,
  PRIMARY KEY(id_tratamiento),
  CONSTRAINT `FK_TRATAMIENTO_HISTORIA`
  FOREIGN KEY(id_paciente) REFERENCES historia(id_paciente)
  ON UPDATE CASCADE ON DELETE RESTRICT,
  CONSTRAINT `FK_TRATAMIENTO_PERSONAL`
  FOREIGN KEY(id_personal) REFERENCES personal(id_personal)
  ON UPDATE CASCADE ON DELETE RESTRICT
)ENGINE=InnoDB AUTO_INCREMENT=1000;

-- -------------------------------------------------------------------------- --
-- Tabla de sesiones
-- -------------------------------------------------------------------------- --
CREATE TABLE sesion(
  id_sesion SMALLINT UNSIGNED NOT NULL AUTO_INCREMENT,
  id_tratamiento SMALLINT UNSIGNED NOT NULL,
  fecha DATE NOT NULL,
  hora TIME NOT NULL,
  abono DECIMAL(4,2) DEFAULT NULL,    
  creado TIMESTAMP default CURRENT_TIMESTAMP,
  PRIMARY KEY(id_sesion,id_tratamiento),
  UNIQUE(id_sesion),
  CONSTRAINT `FK_SESION_TRATAMIENTO`
  FOREIGN KEY(id_tratamiento) REFERENCES tratamiento(id_tratamiento)
  ON UPDATE CASCADE ON DELETE RESTRICT
)ENGINE=InnoDB AUTO_INCREMENT=1000;