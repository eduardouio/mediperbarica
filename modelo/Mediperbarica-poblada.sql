-- MySQL dump 10.13  Distrib 5.6.27, for Linux (x86_64)
--
-- Host: localhost    Database: gelvscom_mediperbarica
-- ------------------------------------------------------
-- Server version 5.6.27

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `antecedente`
--

DROP TABLE IF EXISTS `antecedente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `antecedente` (
  `id_antecedente` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `id_paciente` varchar(10) NOT NULL,
  `tipo` varchar(45) NOT NULL COMMENT 'solo poner como opciones (antedentes patologicos personales, quirurjicos,familiares)',
  `detalle` varchar(180) NOT NULL,
  `creado` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_antecedente`,`tipo`),
  KEY `FK_ANTECENDETE_HISTORIA` (`id_paciente`),
  CONSTRAINT `FK_ANTECENDETE_HISTORIA` FOREIGN KEY (`id_paciente`) REFERENCES `historia` (`id_paciente`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=148 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `antecedente`
--

LOCK TABLES `antecedente` WRITE;
/*!40000 ALTER TABLE `antecedente` DISABLE KEYS */;
INSERT INTO `antecedente` VALUES (1,'1710005750','Patológicos Personales','Hepatitis A','2015-07-13 18:57:27'),(2,'1710005750','Quirúrgicos','H Quimica\nCirujia De Colson','2015-07-13 18:58:19'),(3,'1710005750','Patológicos Familiares','Asmatica / Madre Con Multi Traumas/ Asim Dm','2015-07-13 18:59:25'),(4,'1704968388','Patológicos Personales','Hdt, Tta, Droup / Hipotiroidismo / Cirrocis Hepatica /','2015-07-13 19:06:41'),(5,'1704968388','Quirúrgicos','Amigdalatomia / Toreidemigtomia / Histereotomia /','2015-07-13 19:07:48'),(6,'1704968388','Alergias','Aines','2015-07-13 19:09:19'),(7,'1704968388','Patológicos Familiares','Padre Fallece Con Cancer Estomacal','2015-07-13 19:09:59'),(8,'0801916529','Quirúrgicos','Post Operatorio Lipoescultura','2015-07-13 19:20:09'),(11,'1000000001','Quìmicos','Alerjia a la penisilina','2016-01-11 22:12:20'),(12,'1000000002','Quìmicos','Alerjia a la penisilina','2016-01-11 22:12:20'),(13,'1000000003','Quìmicos','Alerjia a la penisilina','2016-01-11 22:12:20'),(14,'1000000004','Quìmicos','Alerjia a la penisilina','2016-01-11 22:12:20'),(15,'1000000043','Quìmicos','Alerjia a la penisilina','2016-01-11 22:12:20'),(16,'1000000044','Quìmicos','Alerjia a la penisilina','2016-01-11 22:12:20'),(17,'1000000045','Quìmicos','Alerjia a la penisilina','2016-01-11 22:12:20'),(18,'1000000046','Quìmicos','Alerjia a la penisilina','2016-01-11 22:12:20'),(19,'1000000047','Quìmicos','Alerjia a la penisilina','2016-01-11 22:12:20'),(20,'1000000048','Quìmicos','Alerjia a la penisilina','2016-01-11 22:12:20'),(21,'1000000049','Quìmicos','Alerjia a la penisilina','2016-01-11 22:12:20'),(22,'1000000050','Quìmicos','Alerjia a la penisilina','2016-01-11 22:12:20'),(23,'1000000051','Quìmicos','Alerjia a la penisilina','2016-01-11 22:12:20'),(24,'1000000052','Quìmicos','Alerjia a la penisilina','2016-01-11 22:12:20'),(25,'1000000053','Quìmicos','Alerjia a la penisilina','2016-01-11 22:12:20'),(26,'1000000054','Quìmicos','Alerjia a la penisilina','2016-01-11 22:12:20'),(27,'1000000055','Quìmicos','Alerjia a la penisilina','2016-01-11 22:12:20'),(28,'1000000056','Quìmicos','Alerjia a la penisilina','2016-01-11 22:12:20'),(29,'1000000057','Quìmicos','Alerjia a la penisilina','2016-01-11 22:12:20'),(30,'1000000058','Quìmicos','Alerjia a la penisilina','2016-01-11 22:12:20'),(31,'1000000059','Quìmicos','Alerjia a la penisilina','2016-01-11 22:12:20'),(32,'1000000060','Quìmicos','Alerjia a la penisilina','2016-01-11 22:12:20'),(33,'1000000061','Quìmicos','Alerjia a la penisilina','2016-01-11 22:12:20'),(34,'1000000062','Quìmicos','Alerjia a la penisilina','2016-01-11 22:12:20'),(35,'1000000063','Quìmicos','Alerjia a la penisilina','2016-01-11 22:12:20'),(36,'1000000064','Quìmicos','Alerjia a la penisilina','2016-01-11 22:12:20'),(37,'1000000065','Quìmicos','Alerjia a la penisilina','2016-01-11 22:12:20'),(38,'1000000066','Quìmicos','Alerjia a la penisilina','2016-01-11 22:12:20'),(39,'1000000067','Quìmicos','Alerjia a la penisilina','2016-01-11 22:12:20'),(40,'1000000068','Quìmicos','Alerjia a la penisilina','2016-01-11 22:12:20'),(41,'1000000069','Quìmicos','Alerjia a la penisilina','2016-01-11 22:12:20'),(42,'1000000070','Quìmicos','Alerjia a la penisilina','2016-01-11 22:12:20'),(43,'1000000001','Quìmicos','Operacion de Vesícula','2016-01-11 22:12:20'),(44,'1000000002','Quìmicos','Operacion de Vesícula','2016-01-11 22:12:20'),(45,'1000000003','Quìmicos','Operacion de Vesícula','2016-01-11 22:12:20'),(46,'1000000004','Quìmicos','Operacion de Vesícula','2016-01-11 22:12:20'),(47,'1000000043','Quìmicos','Operacion de Vesícula','2016-01-11 22:12:20'),(48,'1000000051','Quìmicos','Operacion de Vesícula','2016-01-11 22:12:20'),(49,'1000000052','Quìmicos','Operacion de Vesícula','2016-01-11 22:12:20'),(50,'1000000053','Quìmicos','Operacion de Vesícula','2016-01-11 22:12:20'),(51,'1000000054','Quìmicos','Operacion de Vesícula','2016-01-11 22:12:20'),(52,'1000000055','Quìmicos','Operacion de Vesícula','2016-01-11 22:12:20'),(53,'1000000056','Quìmicos','Operacion de Vesícula','2016-01-11 22:12:20'),(54,'1000000057','Quìmicos','Operacion de Vesícula','2016-01-11 22:12:20'),(55,'1000000058','Quìmicos','Operacion de Vesícula','2016-01-11 22:12:20'),(56,'1000000059','Quìmicos','Operacion de Vesícula','2016-01-11 22:12:20'),(57,'1000000060','Quìmicos','Operacion de Vesícula','2016-01-11 22:12:20'),(58,'1000000061','Quìmicos','Operacion de Vesícula','2016-01-11 22:12:20'),(59,'1000000062','Quìmicos','Operacion de Vesícula','2016-01-11 22:12:20'),(60,'1000000063','Quìmicos','Operacion de Vesícula','2016-01-11 22:12:20'),(61,'1000000064','Quìmicos','Operacion de Vesícula','2016-01-11 22:12:20'),(62,'1000000065','Quìmicos','Operacion de Vesícula','2016-01-11 22:12:20'),(63,'1000000066','Quìmicos','Operacion de Vesícula','2016-01-11 22:12:20'),(64,'1000000067','Quìmicos','Operacion de Vesícula','2016-01-11 22:12:20'),(65,'1000000068','Quìmicos','Operacion de Vesícula','2016-01-11 22:12:20'),(66,'1000000069','Quìmicos','Operacion de Vesícula','2016-01-11 22:12:20'),(67,'1000000070','Quìmicos','Operacion de Vesícula','2016-01-11 22:12:20'),(68,'1000000001','Quirúrgicos','Operacion Estética','2016-01-11 22:12:20'),(69,'1000000002','Quirúrgicos','Operacion Estética','2016-01-11 22:12:20'),(70,'1000000003','Quirúrgicos','Operacion Estética','2016-01-11 22:12:20'),(71,'1000000004','Quirúrgicos','Operacion Estética','2016-01-11 22:12:20'),(72,'1000000005','Quirúrgicos','Operacion Estética','2016-01-11 22:12:20'),(73,'1000000006','Quirúrgicos','Operacion Estética','2016-01-11 22:12:20'),(74,'1000000007','Quirúrgicos','Operacion Estética','2016-01-11 22:12:20'),(75,'1000000008','Quirúrgicos','Operacion Estética','2016-01-11 22:12:20'),(76,'1000000009','Quirúrgicos','Operacion Estética','2016-01-11 22:12:20'),(77,'1000000010','Quirúrgicos','Operacion Estética','2016-01-11 22:12:20'),(78,'1000000032','Quirúrgicos','Operacion Estética','2016-01-11 22:12:20'),(79,'1000000033','Quirúrgicos','Operacion Estética','2016-01-11 22:12:20'),(80,'1000000034','Quirúrgicos','Operacion Estética','2016-01-11 22:12:20'),(81,'1000000035','Quirúrgicos','Operacion Estética','2016-01-11 22:12:20'),(82,'1000000036','Quirúrgicos','Operacion Estética','2016-01-11 22:12:20'),(83,'1000000037','Quirúrgicos','Operacion Estética','2016-01-11 22:12:20'),(84,'1000000038','Quirúrgicos','Operacion Estética','2016-01-11 22:12:20'),(85,'1000000039','Quirúrgicos','Operacion Estética','2016-01-11 22:12:20'),(86,'1000000040','Quirúrgicos','Operacion Estética','2016-01-11 22:12:20'),(87,'1000000041','Quirúrgicos','Operacion Estética','2016-01-11 22:12:20'),(88,'1000000042','Quirúrgicos','Operacion Estética','2016-01-11 22:12:20'),(89,'1000000043','Quirúrgicos','Operacion Estética','2016-01-11 22:12:20'),(90,'1000000044','Quirúrgicos','Operacion Estética','2016-01-11 22:12:20'),(91,'1000000056','Quirúrgicos','Operacion Estética','2016-01-11 22:12:20'),(92,'1000000057','Quirúrgicos','Operacion Estética','2016-01-11 22:12:20'),(93,'1000000058','Quirúrgicos','Operacion Estética','2016-01-11 22:12:20'),(94,'1000000059','Quirúrgicos','Operacion Estética','2016-01-11 22:12:20'),(95,'1000000060','Quirúrgicos','Operacion Estética','2016-01-11 22:12:20'),(96,'1000000061','Quirúrgicos','Operacion Estética','2016-01-11 22:12:20'),(97,'1000000062','Quirúrgicos','Operacion Estética','2016-01-11 22:12:20'),(98,'1000000063','Quirúrgicos','Operacion Estética','2016-01-11 22:12:20'),(99,'1000000064','Quirúrgicos','Operacion Estética','2016-01-11 22:12:20'),(100,'1000000065','Quirúrgicos','Operacion Estética','2016-01-11 22:12:20'),(101,'1000000066','Quirúrgicos','Operacion Estética','2016-01-11 22:12:20'),(102,'1000000067','Quirúrgicos','Operacion Estética','2016-01-11 22:12:20'),(103,'1000000068','Quirúrgicos','Operacion Estética','2016-01-11 22:12:20'),(104,'1000000069','Quirúrgicos','Operacion Estética','2016-01-11 22:12:20'),(105,'1000000070','Quirúrgicos','Operacion Estética','2016-01-11 22:12:20'),(106,'1000000001','Patológico','Hepatitis A','2016-01-11 22:12:20'),(107,'1000000002','Patológico','Hepatitis A','2016-01-11 22:12:20'),(108,'1000000003','Patológico','Hepatitis A','2016-01-11 22:12:20'),(109,'1000000004','Patológico','Hepatitis A','2016-01-11 22:12:20'),(110,'1000000005','Patológico','Hepatitis A','2016-01-11 22:12:20'),(111,'1000000006','Patológico','Hepatitis A','2016-01-11 22:12:20'),(112,'1000000007','Patológico','Hepatitis A','2016-01-11 22:12:20'),(113,'1000000008','Patológico','Hepatitis A','2016-01-11 22:12:20'),(114,'1000000009','Patológico','Hepatitis A','2016-01-11 22:12:20'),(115,'1000000010','Patológico','Hepatitis A','2016-01-11 22:12:20'),(116,'1000000011','Patológico','Hepatitis A','2016-01-11 22:12:20'),(117,'1000000012','Patológico','Hepatitis A','2016-01-11 22:12:20'),(118,'1000000013','Patológico','Hepatitis A','2016-01-11 22:12:20'),(119,'1000000014','Patológico','Hepatitis A','2016-01-11 22:12:20'),(120,'1000000015','Patológico','Hepatitis A','2016-01-11 22:12:20'),(121,'1000000016','Patológico','Hepatitis A','2016-01-11 22:12:20'),(122,'1000000017','Patológico','Hepatitis A','2016-01-11 22:12:20'),(123,'1000000018','Patológico','Hepatitis A','2016-01-11 22:12:20'),(124,'1000000019','Patológico','Hepatitis A','2016-01-11 22:12:20'),(125,'1000000020','Patológico','Hepatitis A','2016-01-11 22:12:20'),(126,'1000000021','Patológico','Hepatitis A','2016-01-11 22:12:20'),(127,'1000000022','Patológico','Hepatitis A','2016-01-11 22:12:20'),(128,'1000000051','Patológico','Hepatitis A','2016-01-11 22:12:20'),(129,'1000000052','Patológico','Hepatitis A','2016-01-11 22:12:20'),(130,'1000000053','Patológico','Hepatitis A','2016-01-11 22:12:20'),(131,'1000000054','Patológico','Hepatitis A','2016-01-11 22:12:20'),(132,'1000000055','Patológico','Hepatitis A','2016-01-11 22:12:20'),(133,'1000000056','Patológico','Hepatitis A','2016-01-11 22:12:20'),(134,'1000000057','Patológico','Hepatitis A','2016-01-11 22:12:20'),(135,'1000000058','Patológico','Hepatitis A','2016-01-11 22:12:20'),(136,'1000000059','Patológico','Hepatitis A','2016-01-11 22:12:20'),(137,'1000000060','Patológico','Hepatitis A','2016-01-11 22:12:20'),(138,'1000000061','Patológico','Hepatitis A','2016-01-11 22:12:20'),(139,'1000000062','Patológico','Hepatitis A','2016-01-11 22:12:20'),(140,'1000000063','Patológico','Hepatitis A','2016-01-11 22:12:20'),(141,'1000000064','Patológico','Hepatitis A','2016-01-11 22:12:20'),(142,'1000000065','Patológico','Hepatitis A','2016-01-11 22:12:20'),(143,'1000000066','Patológico','Hepatitis A','2016-01-11 22:12:20'),(144,'1000000067','Patológico','Hepatitis A','2016-01-11 22:12:20'),(145,'1000000068','Patológico','Hepatitis A','2016-01-11 22:12:20'),(146,'1000000069','Patológico','Hepatitis A','2016-01-11 22:12:20'),(147,'1000000070','Patológico','Hepatitis A','2016-01-11 22:12:20');
/*!40000 ALTER TABLE `antecedente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ci_sessions`
--

DROP TABLE IF EXISTS `ci_sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ci_sessions` (
  `session_id` varchar(40) NOT NULL DEFAULT '0',
  `ip_address` varchar(45) NOT NULL DEFAULT '0',
  `user_agent` varchar(120) NOT NULL,
  `last_activity` int(10) unsigned NOT NULL DEFAULT '0',
  `user_data` text NOT NULL,
  PRIMARY KEY (`session_id`),
  KEY `last_activity_idx` (`last_activity`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ci_sessions`
--

LOCK TABLES `ci_sessions` WRITE;
/*!40000 ALTER TABLE `ci_sessions` DISABLE KEYS */;
INSERT INTO `ci_sessions` VALUES ('1d8b5536b0397df4c0f564fde76e53c4','192.168.0.110','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/47.0.2526.106 Safari/537.36',1453328240,'a:7:{s:9:\"user_data\";s:0:\"\";s:2:\"id\";s:4:\"1000\";s:8:\"username\";s:7:\"eduardo\";s:10:\"first_name\";s:7:\"Eduardo\";s:9:\"last_name\";s:7:\"Villota\";s:5:\"email\";s:21:\"eduardouio7@gmail.com\";s:8:\"logueado\";i:1;}'),('9038d4c403a1a05bfcd2e8b928006b05','192.168.0.110','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/47.0.2526.106 Safari/537.36',1453150229,'a:7:{s:9:\"user_data\";s:0:\"\";s:2:\"id\";s:4:\"1000\";s:8:\"username\";s:7:\"eduardo\";s:10:\"first_name\";s:7:\"Eduardo\";s:9:\"last_name\";s:7:\"Villota\";s:5:\"email\";s:21:\"eduardouio7@gmail.com\";s:8:\"logueado\";i:1;}'),('93c3ab3c4a99b68df4180ce468ea2962','192.168.0.110','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/47.0.2526.106 Safari/537.36',1452981814,'a:7:{s:9:\"user_data\";s:0:\"\";s:2:\"id\";s:4:\"1000\";s:8:\"username\";s:7:\"eduardo\";s:10:\"first_name\";s:7:\"Eduardo\";s:9:\"last_name\";s:7:\"Villota\";s:5:\"email\";s:21:\"eduardouio7@gmail.com\";s:8:\"logueado\";i:1;}'),('a967845b910dbc62c92258caac7ca452','192.168.0.110','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/47.0.2526.106 Safari/537.36',1453299522,'a:7:{s:9:\"user_data\";s:0:\"\";s:2:\"id\";s:4:\"1000\";s:8:\"username\";s:7:\"eduardo\";s:10:\"first_name\";s:7:\"Eduardo\";s:9:\"last_name\";s:7:\"Villota\";s:5:\"email\";s:21:\"eduardouio7@gmail.com\";s:8:\"logueado\";i:1;}');
/*!40000 ALTER TABLE `ci_sessions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cliente`
--

DROP TABLE IF EXISTS `cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cliente` (
  `id_cliente` char(13) NOT NULL,
  `nombres` varchar(40) NOT NULL,
  `telefono` varchar(10) NOT NULL,
  `direccion` varchar(120) NOT NULL,
  `creado` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_cliente`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cliente`
--

LOCK TABLES `cliente` WRITE;
/*!40000 ALTER TABLE `cliente` DISABLE KEYS */;
/*!40000 ALTER TABLE `cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cobro`
--

DROP TABLE IF EXISTS `cobro`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cobro` (
  `id_cobro` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `id_factura` smallint(5) unsigned NOT NULL,
  `tipo` varchar(45) NOT NULL,
  `fecha` varchar(45) NOT NULL,
  `banco` varchar(45) DEFAULT NULL,
  `nro_cheque` varchar(45) DEFAULT NULL,
  `nro_deposito` varchar(45) DEFAULT NULL,
  `valor` varchar(45) NOT NULL,
  `registro` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_cobro`),
  UNIQUE KEY `id_factura` (`id_factura`),
  CONSTRAINT `FK_COBRO_FACTURA` FOREIGN KEY (`id_factura`) REFERENCES `factura` (`id_factura`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cobro`
--

LOCK TABLES `cobro` WRITE;
/*!40000 ALTER TABLE `cobro` DISABLE KEYS */;
/*!40000 ALTER TABLE `cobro` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `equipo`
--

DROP TABLE IF EXISTS `equipo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `equipo` (
  `id_equipo` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) DEFAULT NULL,
  `nro_serie` varchar(45) DEFAULT NULL,
  `marca` varchar(45) DEFAULT NULL,
  `modelo` varchar(45) DEFAULT NULL,
  `notas` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`id_equipo`)
) ENGINE=InnoDB AUTO_INCREMENT=2001 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `equipo`
--

LOCK TABLES `equipo` WRITE;
/*!40000 ALTER TABLE `equipo` DISABLE KEYS */;
INSERT INTO `equipo` VALUES (1000,'Camara Hiperbarica Nueva','1111111111','OXY','2011',NULL),(2000,'CAMARA NUEVA','222222','OXO','2012',NULL);
/*!40000 ALTER TABLE `equipo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `factura`
--

DROP TABLE IF EXISTS `factura`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
  CONSTRAINT `fk_factura_cliente` FOREIGN KEY (`id_cliente`) REFERENCES `cliente` (`id_cliente`) ON UPDATE CASCADE,
  CONSTRAINT `fk_factura_tratamiento` FOREIGN KEY (`id_tratamiento`) REFERENCES `tratamiento` (`id_tratamiento`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `factura`
--

LOCK TABLES `factura` WRITE;
/*!40000 ALTER TABLE `factura` DISABLE KEYS */;
/*!40000 ALTER TABLE `factura` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `historia`
--

DROP TABLE IF EXISTS `historia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
) ENGINE=InnoDB AUTO_INCREMENT=84 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `historia`
--

LOCK TABLES `historia` WRITE;
/*!40000 ALTER TABLE `historia` DISABLE KEYS */;
INSERT INTO `historia` VALUES (5,'0801916529','Shirley Quinoñez Prado','0000000000','1975-07-07','sinmail','Quito','','','','','','Infinito','1.30 H','2015-07-13 19:19:36'),(13,'1000000000','David Villacres','0999875001','2011-01-01','juan@aol.com','La comuna',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2016-01-11 22:04:10'),(14,'1000000001','Maria Ceibos','0999875001','2011-01-01','juan@aol.com','La comuna',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2016-01-11 22:04:10'),(15,'1000000002','Vanessa Arce','0999875001','2011-01-01','juan@aol.com','La comuna',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2016-01-11 22:04:10'),(16,'1000000003','David Orellana','0999875001','2011-01-01','juan@aol.com','La comuna',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2016-01-11 22:04:10'),(17,'1000000004','Patricio Villacis','0999875001','2011-01-01','juan@aol.com','La comuna',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2016-01-11 22:04:10'),(18,'1000000005','Liliana Lugmania','0999875001','2011-01-01','juan@aol.com','La comuna',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2016-01-11 22:04:10'),(19,'1000000006','Galo Sinchiguano','0999875001','2011-01-01','juan@aol.com','La comuna',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2016-01-11 22:04:10'),(20,'1000000007','MArco Llumiquinga','0999875001','2011-01-01','juan@aol.com','La comuna',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2016-01-11 22:04:10'),(21,'1000000008','Armando Hoyos','0999875001','2011-01-01','juan@aol.com','La comuna',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2016-01-11 22:04:10'),(22,'1000000009','Armando Huilcapi','0999875001','2011-01-01','juan@aol.com','La comuna',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2016-01-11 22:04:10'),(23,'1000000010','Alexandra Caiza','0999875001','2011-01-01','juan@aol.com','La comuna',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2016-01-11 22:04:10'),(24,'1000000011','Karla Ortega','0999875001','2011-01-01','juan@aol.com','La comuna',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2016-01-11 22:04:10'),(25,'1000000012','Karen Villacorte','0999875001','2011-01-01','juan@aol.com','La comuna',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2016-01-11 22:04:10'),(26,'1000000013','Diana Morelos','0999875001','2011-01-01','juan@aol.com','La comuna',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2016-01-11 22:04:10'),(27,'1000000014','Benito Juarez','0999875001','2011-01-01','juan@aol.com','La comuna',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2016-01-11 22:04:10'),(28,'1000000015','Cristobal Meneses','0999875001','2011-01-01','juan@aol.com','La comuna',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2016-01-11 22:04:10'),(29,'1000000016','Gustavo Vaca Soto','0999875001','2011-01-01','juan@aol.com','La comuna',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2016-01-11 22:04:10'),(30,'1000000017','Andrea Lincango','0999875001','2011-01-01','juan@aol.com','La comuna',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2016-01-11 22:04:10'),(31,'1000000018','Pedro Navaja','0999875001','2011-01-01','juan@aol.com','La comuna',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2016-01-11 22:04:10'),(32,'1000000019','Manuel Niolivos','0999875001','2011-01-01','juan@aol.com','La comuna',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2016-01-11 22:04:10'),(33,'1000000020','Sofia Chicaiza','0999875001','2011-01-01','juan@aol.com','La comuna',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2016-01-11 22:04:10'),(34,'1000000021','Marlene Montesdeoca','0999875001','2011-01-01','juan@aol.com','La comuna',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2016-01-11 22:04:10'),(35,'1000000022','Karina Davila','0999875001','2011-01-01','juan@aol.com','La comuna',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2016-01-11 22:04:10'),(36,'1000000023','Carmen Montenegro','0999875001','2011-01-01','juan@aol.com','La comuna',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2016-01-11 22:04:10'),(37,'1000000024','Aida Llumiquinga','0999875001','2011-01-01','juan@aol.com','La comuna',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2016-01-11 22:04:10'),(38,'1000000025','Luis Vaca','0999875001','2011-01-01','juan@aol.com','La comuna',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2016-01-11 22:04:10'),(39,'1000000026','Marco Guamani','0999875001','2011-01-01','juan@aol.com','La comuna',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2016-01-11 22:04:10'),(40,'1000000027','Jorge Nieto','0999875001','2011-01-01','juan@aol.com','La comuna',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2016-01-11 22:04:10'),(41,'1000000028','Jorge Villota','0999875001','2011-01-01','juan@aol.com','La comuna',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2016-01-11 22:04:10'),(42,'1000000029','Andrea Laica','0999875001','2011-01-01','juan@aol.com','La comuna',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2016-01-11 22:04:10'),(43,'1000000030','Adriana Lopez','0999875001','2011-01-01','juan@aol.com','La comuna',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2016-01-11 22:04:10'),(44,'1000000031','Paola Vega','0999875001','2011-01-01','juan@aol.com','La comuna',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2016-01-11 22:04:10'),(45,'1000000032','Clara Hernandez','0999875001','2011-01-01','juan@aol.com','La comuna',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2016-01-11 22:04:10'),(46,'1000000033','Cersar Hidalgo','0999875001','2011-01-01','juan@aol.com','La comuna',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2016-01-11 22:04:10'),(47,'1000000034','Juan Pablo Montenegro','0999875001','2011-01-01','juan@aol.com','La comuna',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2016-01-11 22:04:10'),(48,'1000000035','Luis Perez','0999875001','2011-01-01','juan@aol.com','La comuna',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2016-01-11 22:04:10'),(49,'1000000036','Paola Vasquez','0999875001','2011-01-01','juan@aol.com','La comuna',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2016-01-11 22:04:10'),(50,'1000000037','Adriana Montoya','0999875001','2011-01-01','juan@aol.com','La comuna',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2016-01-11 22:04:10'),(51,'1000000038','Juan Montoya','0999875001','2011-01-01','juan@aol.com','La comuna',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2016-01-11 22:04:10'),(52,'1000000039','Elena Vasquez','0999875001','2011-01-01','juan@aol.com','La comuna',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2016-01-11 22:04:10'),(53,'1000000040','Anibal Cañisares','0999875001','2011-01-01','juan@aol.com','La comuna',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2016-01-11 22:04:10'),(54,'1000000041','Manuela Olivos','0999875001','2011-01-01','juan@aol.com','La comuna',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2016-01-11 22:04:10'),(55,'1000000042','Juan Montalvo','0999875001','2011-01-01','juan@aol.com','La comuna',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2016-01-11 22:04:10'),(56,'1000000043','Pamela Hidalgo','0999875001','2011-01-01','juan@aol.com','La comuna',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2016-01-11 22:04:10'),(57,'1000000044','Stalin Cando','0999875001','2011-01-01','juan@aol.com','La comuna',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2016-01-11 22:04:10'),(58,'1000000045','Federico Gonzalez','0999875001','2011-01-01','juan@aol.com','La comuna',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2016-01-11 22:04:10'),(59,'1000000046','Pedro Pilay','0999875001','2011-01-01','juan@aol.com','La comuna',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2016-01-11 22:04:10'),(60,'1000000047','Patricia Obando','0999875001','2011-01-01','juan@aol.com','La comuna',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2016-01-11 22:04:10'),(61,'1000000048','Carlos Villota','0999875001','2011-01-01','juan@aol.com','La comuna',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2016-01-11 22:04:10'),(62,'1000000049','Adriana Recalde','0999875001','2011-01-01','juan@aol.com','La comuna',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2016-01-11 22:04:10'),(63,'1000000050','Vanesa Catagña','0999875001','2011-01-01','juan@aol.com','La comuna',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2016-01-11 22:04:10'),(64,'1000000051','Israles Villacres','0999875001','2011-01-01','juan@aol.com','La comuna',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2016-01-11 22:04:10'),(65,'1000000052','Amanda Toro','0999875001','2011-01-01','juan@aol.com','La comuna',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2016-01-11 22:04:10'),(66,'1000000053','Luis Armando Lopez','0999875001','2011-01-01','juan@aol.com','La comuna',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2016-01-11 22:04:10'),(67,'1000000054','Alfonso Armendaris','0999875001','2011-01-01','juan@aol.com','La comuna',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2016-01-11 22:04:10'),(68,'1000000055','Adrian Gutierres','0999875001','2011-01-01','juan@aol.com','La comuna',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2016-01-11 22:04:10'),(69,'1000000056','Rafael Lincango','0999875001','2011-01-01','juan@aol.com','La comuna',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2016-01-11 22:04:10'),(70,'1000000057','Juanita Guerra','0999875001','2011-01-01','juan@aol.com','La comuna',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2016-01-11 22:04:10'),(71,'1000000058','Lady Mueses','0999875001','2011-01-01','juan@aol.com','La comuna',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2016-01-11 22:04:10'),(72,'1000000059','Kimberly Sisalema','0999875001','2011-01-01','juan@aol.com','La comuna',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2016-01-11 22:04:10'),(73,'1000000060','Guadalupe Montenegro','0999875001','2011-01-01','juan@aol.com','La comuna',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2016-01-11 22:04:10'),(74,'1000000061','Cersar Pita','0999875001','2011-01-01','juan@aol.com','La comuna',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2016-01-11 22:04:10'),(75,'1000000062','Valerie Vaca','0999875001','2011-01-01','juan@aol.com','La comuna',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2016-01-11 22:04:10'),(76,'1000000063','Samantha Hidalgo','0999875001','2011-01-01','juan@aol.com','La comuna',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2016-01-11 22:04:10'),(77,'1000000064','Juan Correa','0999875001','2011-01-01','juan@aol.com','La comuna',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2016-01-11 22:04:10'),(78,'1000000065','Miriam Chango','0999875001','2011-01-01','juan@aol.com','La comuna',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2016-01-11 22:04:10'),(79,'1000000066','Liliana Chamorro','0999875001','2011-01-01','juan@aol.com','La comuna',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2016-01-11 22:04:10'),(80,'1000000067','Tatiana Moncayo','0999875001','2011-01-01','juan@aol.com','La comuna',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2016-01-11 22:04:10'),(81,'1000000068','Anibal Caceres','0999875001','2011-01-01','juan@aol.com','La comuna',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2016-01-11 22:04:10'),(82,'1000000069','Santiago Muzo','0999875001','2011-01-01','juan@aol.com','La comuna',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2016-01-11 22:04:10'),(83,'1000000070','Doris Montenegro','0999875001','2011-01-01','juan@aol.com','La comuna',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2016-01-11 22:04:10'),(12,'1111111111','Juan Ortega','098754152','2011-01-01','juan@aol.com','La comuna','',NULL,NULL,NULL,NULL,NULL,NULL,'2016-01-11 21:45:50'),(3,'1704968388','Pilar Patricia Arboleda Segovia','2803153','1957-06-11','sinmail','Quito','','','','','','Hidrodinamica Estobia : T/a 110/80 : Otras Cosas Mas: Una Cosa Adicional','Se Recomienda 25 Sesiones','2015-07-13 19:03:37'),(2,'1710005750','Granda Darquea Francisco Javier','0998648089','1977-03-02','sinmail','Torre San Isisdro','','','','','','Alguna Cosa','Camara Hiperbarica','2015-07-13 18:56:38'),(4,'1710019611','Jorge Yanez Romero','0992004511','1972-07-12','jorgeyanezjr@hotmail.com','Quito, Quiroz S95','Casa','02261747','','','','Algo Mas','30/60t30 2.75-3ama','2015-07-13 19:15:10'),(1,'1722919725','Eduardo Villota','0992936569','2011-02-01','eduardouio7@gmail.com','Quito, Colon E4-412 Y Amazonas','Eduardo Villota','','','','','90*100','Este Es El Manejo','2015-07-09 19:44:58');
/*!40000 ALTER TABLE `historia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `personal`
--

DROP TABLE IF EXISTS `personal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `personal`
--

LOCK TABLES `personal` WRITE;
/*!40000 ALTER TABLE `personal` DISABLE KEYS */;
INSERT INTO `personal` VALUES ('1823533946','Bolivar Hernandez','Medico Tratante','La Marsical, Colon y Amazonas','0238475646','0987547654','hernabdes2344@yahoo.es',NULL,'2015-07-22 21:23:03'),('1837463527','Dr. Ivan Cardenas','Medico Tratante','La Pulida calle e y Mariana de JEsus','0233322432','0987654326','ivandando@hotmail.com','Atienede de lunes a viernes','0000-00-00 00:00:00'),('1928661524','Dr. Juan Castro','Asistente','La Recoleta calle 25 de septiembre OE12-54','023453566','0986527853','jcastro@gmail.com','atiende solo sabados','0000-00-00 00:00:00');
/*!40000 ALTER TABLE `personal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sesion`
--

DROP TABLE IF EXISTS `sesion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sesion` (
  `id_sesion` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `id_personal` varchar(10) NOT NULL,
  `id_tratamiento` smallint(5) unsigned NOT NULL,
  `id_equipo` int(11) NOT NULL,
  `fecha` date NOT NULL,
  `hora` time NOT NULL,
  `notas` varchar(450) DEFAULT NULL,
  `creado` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_sesion`,`id_tratamiento`),
  UNIQUE KEY `id_sesion` (`id_sesion`),
  KEY `FK_SESION_TRATAMIENTO` (`id_tratamiento`),
  KEY `FK_SESION_PERSONAL_idx` (`id_personal`),
  KEY `FK_SESION_EQUIPO_idx` (`id_equipo`),
  CONSTRAINT `FK_SESION_EQUIPO` FOREIGN KEY (`id_equipo`) REFERENCES `equipo` (`id_equipo`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `FK_SESION_PERSONAL` FOREIGN KEY (`id_personal`) REFERENCES `personal` (`id_personal`) ON UPDATE CASCADE,
  CONSTRAINT `FK_SESION_TRATAMIENTO` FOREIGN KEY (`id_tratamiento`) REFERENCES `tratamiento` (`id_tratamiento`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=482 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sesion`
--

LOCK TABLES `sesion` WRITE;
/*!40000 ALTER TABLE `sesion` DISABLE KEYS */;
INSERT INTO `sesion` VALUES (1,'1837463527',3,1000,'2011-10-01','10:00:00',NULL,'2016-01-11 22:23:42'),(2,'1837463527',3,1000,'2011-10-01','10:00:00',NULL,'2016-01-11 22:23:55'),(3,'1837463527',3,1000,'2011-10-01','10:00:00',NULL,'2016-01-11 22:25:40'),(4,'1837463527',3,1000,'2011-11-02','11:55:00',NULL,'2016-01-11 22:25:40'),(5,'1837463527',4,1000,'2011-11-02','11:55:00',NULL,'2016-01-11 22:25:40'),(6,'1837463527',5,1000,'2011-11-02','11:55:00',NULL,'2016-01-11 22:25:40'),(7,'1837463527',6,1000,'2011-11-02','11:55:00',NULL,'2016-01-11 22:25:40'),(8,'1837463527',7,1000,'2011-11-02','11:55:00',NULL,'2016-01-11 22:25:40'),(9,'1837463527',8,1000,'2011-11-02','11:55:00',NULL,'2016-01-11 22:25:40'),(10,'1837463527',10,1000,'2011-11-02','11:55:00',NULL,'2016-01-11 22:25:40'),(11,'1837463527',11,1000,'2011-11-02','11:55:00',NULL,'2016-01-11 22:25:40'),(12,'1837463527',12,1000,'2011-11-02','11:55:00',NULL,'2016-01-11 22:25:40'),(13,'1837463527',15,1000,'2011-11-02','11:55:00',NULL,'2016-01-11 22:25:40'),(14,'1837463527',16,1000,'2011-11-02','11:55:00',NULL,'2016-01-11 22:25:40'),(15,'1837463527',17,1000,'2011-11-02','11:55:00',NULL,'2016-01-11 22:25:40'),(16,'1837463527',18,1000,'2011-11-02','11:55:00',NULL,'2016-01-11 22:25:40'),(17,'1837463527',19,1000,'2011-11-02','11:55:00',NULL,'2016-01-11 22:25:40'),(18,'1837463527',20,1000,'2011-11-02','11:55:00',NULL,'2016-01-11 22:25:40'),(19,'1837463527',22,1000,'2011-11-02','11:55:00',NULL,'2016-01-11 22:25:40'),(20,'1837463527',23,1000,'2011-11-02','11:55:00',NULL,'2016-01-11 22:25:40'),(21,'1837463527',25,1000,'2011-11-02','11:55:00',NULL,'2016-01-11 22:25:40'),(22,'1837463527',26,1000,'2011-11-02','11:55:00',NULL,'2016-01-11 22:25:40'),(23,'1837463527',28,1000,'2011-11-02','11:55:00',NULL,'2016-01-11 22:25:40'),(24,'1837463527',29,1000,'2011-11-02','11:55:00',NULL,'2016-01-11 22:25:40'),(25,'1837463527',30,1000,'2011-11-02','11:55:00',NULL,'2016-01-11 22:25:40'),(26,'1837463527',31,1000,'2011-11-02','11:55:00',NULL,'2016-01-11 22:25:40'),(27,'1837463527',33,1000,'2011-11-02','11:55:00',NULL,'2016-01-11 22:25:40'),(28,'1837463527',34,1000,'2011-11-02','11:55:00',NULL,'2016-01-11 22:25:40'),(29,'1837463527',35,1000,'2011-11-02','11:55:00',NULL,'2016-01-11 22:25:40'),(30,'1837463527',37,1000,'2011-11-02','11:55:00',NULL,'2016-01-11 22:25:40'),(31,'1837463527',38,1000,'2011-11-02','11:55:00',NULL,'2016-01-11 22:25:40'),(32,'1837463527',39,1000,'2011-11-02','11:55:00',NULL,'2016-01-11 22:25:40'),(33,'1837463527',40,1000,'2011-11-02','11:55:00',NULL,'2016-01-11 22:25:40'),(34,'1837463527',41,1000,'2011-11-02','11:55:00',NULL,'2016-01-11 22:25:40'),(35,'1837463527',42,1000,'2011-11-02','11:55:00',NULL,'2016-01-11 22:25:40'),(36,'1837463527',43,1000,'2011-11-02','11:55:00',NULL,'2016-01-11 22:25:40'),(37,'1837463527',44,1000,'2011-11-02','11:55:00',NULL,'2016-01-11 22:25:40'),(38,'1837463527',45,1000,'2011-11-02','11:55:00',NULL,'2016-01-11 22:25:40'),(39,'1837463527',47,1000,'2011-11-02','11:55:00',NULL,'2016-01-11 22:25:40'),(40,'1837463527',48,1000,'2011-11-02','11:55:00',NULL,'2016-01-11 22:25:40'),(41,'1837463527',50,1000,'2011-11-02','11:55:00',NULL,'2016-01-11 22:25:40'),(42,'1837463527',51,1000,'2011-11-02','11:55:00',NULL,'2016-01-11 22:25:40'),(43,'1837463527',52,1000,'2011-11-02','11:55:00',NULL,'2016-01-11 22:25:40'),(44,'1837463527',53,1000,'2011-11-02','11:55:00',NULL,'2016-01-11 22:25:40'),(45,'1837463527',54,1000,'2011-11-02','11:55:00',NULL,'2016-01-11 22:25:40'),(46,'1837463527',55,1000,'2011-11-02','11:55:00',NULL,'2016-01-11 22:25:40'),(47,'1837463527',56,1000,'2011-11-02','11:55:00',NULL,'2016-01-11 22:25:40'),(48,'1837463527',57,1000,'2011-11-02','11:55:00',NULL,'2016-01-11 22:25:40'),(49,'1837463527',58,1000,'2011-11-02','11:55:00',NULL,'2016-01-11 22:25:40'),(50,'1837463527',59,1000,'2011-11-02','11:55:00',NULL,'2016-01-11 22:25:40'),(51,'1837463527',60,1000,'2011-11-02','11:55:00',NULL,'2016-01-11 22:25:40'),(52,'1837463527',61,1000,'2011-11-02','11:55:00',NULL,'2016-01-11 22:25:40'),(53,'1837463527',62,1000,'2011-11-02','11:55:00',NULL,'2016-01-11 22:25:40'),(54,'1837463527',63,1000,'2011-11-02','11:55:00',NULL,'2016-01-11 22:25:40'),(55,'1837463527',64,1000,'2011-11-02','11:55:00',NULL,'2016-01-11 22:25:40'),(56,'1837463527',65,1000,'2011-11-02','11:55:00',NULL,'2016-01-11 22:25:40'),(57,'1837463527',66,1000,'2011-11-02','11:55:00',NULL,'2016-01-11 22:25:40'),(58,'1837463527',67,1000,'2011-11-02','11:55:00',NULL,'2016-01-11 22:25:40'),(59,'1837463527',68,1000,'2011-11-02','11:55:00',NULL,'2016-01-11 22:25:40'),(60,'1837463527',69,1000,'2011-11-02','11:55:00',NULL,'2016-01-11 22:25:40'),(61,'1837463527',71,1000,'2011-11-02','11:55:00',NULL,'2016-01-11 22:25:40'),(62,'1837463527',72,1000,'2011-11-02','11:55:00',NULL,'2016-01-11 22:25:40'),(63,'1837463527',74,1000,'2011-11-02','11:55:00',NULL,'2016-01-11 22:25:40'),(64,'1837463527',75,1000,'2011-11-02','11:55:00',NULL,'2016-01-11 22:25:40'),(65,'1837463527',76,1000,'2011-11-02','11:55:00',NULL,'2016-01-11 22:25:40'),(66,'1837463527',77,1000,'2011-11-02','11:55:00',NULL,'2016-01-11 22:25:40'),(67,'1837463527',78,1000,'2011-11-02','11:55:00',NULL,'2016-01-11 22:25:40'),(68,'1837463527',79,1000,'2011-11-02','11:55:00',NULL,'2016-01-11 22:25:40'),(69,'1837463527',80,1000,'2011-11-02','11:55:00',NULL,'2016-01-11 22:25:40'),(70,'1837463527',81,1000,'2011-11-02','11:55:00',NULL,'2016-01-11 22:25:40'),(71,'1837463527',84,1000,'2011-11-02','11:55:00',NULL,'2016-01-11 22:25:40'),(72,'1837463527',85,1000,'2011-11-02','11:55:00',NULL,'2016-01-11 22:25:40'),(73,'1837463527',86,1000,'2011-11-02','11:55:00',NULL,'2016-01-11 22:25:40'),(74,'1837463527',87,1000,'2011-11-02','11:55:00',NULL,'2016-01-11 22:25:40'),(75,'1837463527',88,1000,'2011-11-02','11:55:00',NULL,'2016-01-11 22:25:40'),(76,'1837463527',89,1000,'2011-11-02','11:55:00',NULL,'2016-01-11 22:25:40'),(77,'1837463527',90,1000,'2011-11-02','11:55:00',NULL,'2016-01-11 22:25:40'),(78,'1837463527',91,1000,'2011-11-02','11:55:00',NULL,'2016-01-11 22:25:40'),(79,'1837463527',92,1000,'2011-11-02','11:55:00',NULL,'2016-01-11 22:25:40'),(80,'1837463527',93,1000,'2011-11-02','11:55:00',NULL,'2016-01-11 22:25:40'),(81,'1837463527',95,1000,'2011-11-02','11:55:00',NULL,'2016-01-11 22:25:40'),(82,'1837463527',96,1000,'2011-11-02','11:55:00',NULL,'2016-01-11 22:25:40'),(83,'1837463527',97,1000,'2011-11-02','11:55:00',NULL,'2016-01-11 22:25:40'),(84,'1837463527',98,1000,'2011-11-02','11:55:00',NULL,'2016-01-11 22:25:40'),(85,'1837463527',99,1000,'2011-11-02','11:55:00',NULL,'2016-01-11 22:25:40'),(86,'1837463527',100,1000,'2011-11-02','11:55:00',NULL,'2016-01-11 22:25:40'),(87,'1837463527',101,1000,'2011-11-02','11:55:00',NULL,'2016-01-11 22:25:40'),(88,'1837463527',102,1000,'2011-11-02','11:55:00',NULL,'2016-01-11 22:25:40'),(89,'1837463527',103,1000,'2011-11-02','11:55:00',NULL,'2016-01-11 22:25:40'),(90,'1837463527',104,1000,'2011-11-02','11:55:00',NULL,'2016-01-11 22:25:40'),(91,'1837463527',105,1000,'2011-11-02','11:55:00',NULL,'2016-01-11 22:25:40'),(92,'1837463527',106,1000,'2011-11-02','11:55:00',NULL,'2016-01-11 22:25:40'),(93,'1837463527',107,1000,'2011-11-02','11:55:00',NULL,'2016-01-11 22:25:40'),(94,'1837463527',108,1000,'2011-11-02','11:55:00',NULL,'2016-01-11 22:25:40'),(95,'1837463527',109,1000,'2011-11-02','11:55:00',NULL,'2016-01-11 22:25:40'),(96,'1837463527',110,1000,'2011-11-02','11:55:00',NULL,'2016-01-11 22:25:40'),(97,'1837463527',111,1000,'2011-11-02','11:55:00',NULL,'2016-01-11 22:25:40'),(98,'1837463527',112,1000,'2011-11-02','11:55:00',NULL,'2016-01-11 22:25:40'),(99,'1837463527',113,1000,'2011-11-02','11:55:00',NULL,'2016-01-11 22:25:40'),(100,'1837463527',114,1000,'2011-11-02','11:55:00',NULL,'2016-01-11 22:25:40'),(101,'1837463527',115,1000,'2011-11-02','11:55:00',NULL,'2016-01-11 22:25:40'),(102,'1837463527',116,1000,'2011-11-02','11:55:00',NULL,'2016-01-11 22:25:40'),(103,'1837463527',117,1000,'2011-11-02','11:55:00',NULL,'2016-01-11 22:25:40'),(104,'1837463527',118,1000,'2011-11-02','11:55:00',NULL,'2016-01-11 22:25:40'),(105,'1837463527',119,1000,'2011-11-02','11:55:00',NULL,'2016-01-11 22:25:40'),(106,'1837463527',120,1000,'2011-11-02','11:55:00',NULL,'2016-01-11 22:25:40'),(107,'1837463527',121,1000,'2011-11-02','11:55:00',NULL,'2016-01-11 22:25:40'),(108,'1837463527',122,1000,'2011-11-02','11:55:00',NULL,'2016-01-11 22:25:40'),(109,'1837463527',123,1000,'2011-11-02','11:55:00',NULL,'2016-01-11 22:25:40'),(110,'1837463527',124,1000,'2011-11-02','11:55:00',NULL,'2016-01-11 22:25:40'),(111,'1837463527',125,1000,'2011-11-02','11:55:00',NULL,'2016-01-11 22:25:40'),(112,'1837463527',126,1000,'2011-11-02','11:55:00',NULL,'2016-01-11 22:25:40'),(113,'1837463527',127,1000,'2011-11-02','11:55:00',NULL,'2016-01-11 22:25:40'),(114,'1837463527',128,1000,'2011-11-02','11:55:00',NULL,'2016-01-11 22:25:40'),(115,'1837463527',129,1000,'2011-11-02','11:55:00',NULL,'2016-01-11 22:25:40'),(116,'1837463527',130,1000,'2011-11-02','11:55:00',NULL,'2016-01-11 22:25:40'),(117,'1837463527',131,1000,'2011-11-02','11:55:00',NULL,'2016-01-11 22:25:40'),(118,'1837463527',132,1000,'2011-11-02','11:55:00',NULL,'2016-01-11 22:25:40'),(119,'1837463527',133,1000,'2011-11-02','11:55:00',NULL,'2016-01-11 22:25:40'),(120,'1837463527',134,1000,'2011-11-02','11:55:00',NULL,'2016-01-11 22:25:40'),(121,'1837463527',135,1000,'2011-11-02','11:55:00',NULL,'2016-01-11 22:25:40'),(122,'1837463527',136,1000,'2011-11-02','11:55:00',NULL,'2016-01-11 22:25:40'),(123,'1837463527',137,1000,'2011-11-02','11:55:00',NULL,'2016-01-11 22:25:40'),(124,'1837463527',138,1000,'2011-11-02','11:55:00',NULL,'2016-01-11 22:25:40'),(125,'1837463527',139,1000,'2011-11-02','11:55:00',NULL,'2016-01-11 22:25:40'),(126,'1837463527',140,1000,'2011-11-02','11:55:00',NULL,'2016-01-11 22:25:40'),(127,'1837463527',141,1000,'2011-11-02','11:55:00',NULL,'2016-01-11 22:25:40'),(128,'1837463527',142,1000,'2011-11-02','11:55:00',NULL,'2016-01-11 22:25:40'),(129,'1837463527',143,1000,'2011-11-02','11:55:00',NULL,'2016-01-11 22:25:40'),(130,'1837463527',144,1000,'2011-11-02','11:55:00',NULL,'2016-01-11 22:25:40'),(131,'1837463527',145,1000,'2011-11-02','11:55:00',NULL,'2016-01-11 22:25:40'),(132,'1837463527',146,1000,'2011-11-02','11:55:00',NULL,'2016-01-11 22:25:40'),(133,'1837463527',147,1000,'2011-11-02','11:55:00',NULL,'2016-01-11 22:25:40'),(134,'1837463527',3,1000,'2011-10-01','10:00:00',NULL,'2016-01-11 22:27:10'),(135,'1837463527',3,1000,'2011-12-02','11:55:00',NULL,'2016-01-11 22:27:10'),(136,'1837463527',4,1000,'2011-12-02','11:55:00',NULL,'2016-01-11 22:27:10'),(137,'1837463527',5,1000,'2011-12-02','11:55:00',NULL,'2016-01-11 22:27:10'),(138,'1837463527',6,1000,'2011-12-02','11:55:00',NULL,'2016-01-11 22:27:10'),(139,'1837463527',7,1000,'2011-12-02','11:55:00',NULL,'2016-01-11 22:27:10'),(140,'1837463527',8,1000,'2011-12-02','11:55:00',NULL,'2016-01-11 22:27:10'),(141,'1837463527',10,1000,'2011-12-02','11:55:00',NULL,'2016-01-11 22:27:10'),(142,'1837463527',11,1000,'2011-12-02','11:55:00',NULL,'2016-01-11 22:27:10'),(143,'1837463527',12,1000,'2011-12-02','11:55:00',NULL,'2016-01-11 22:27:10'),(144,'1837463527',15,1000,'2011-12-02','11:55:00',NULL,'2016-01-11 22:27:10'),(145,'1837463527',16,1000,'2011-12-02','11:55:00',NULL,'2016-01-11 22:27:10'),(146,'1837463527',17,1000,'2011-12-02','11:55:00',NULL,'2016-01-11 22:27:10'),(147,'1837463527',18,1000,'2011-12-02','11:55:00',NULL,'2016-01-11 22:27:10'),(148,'1837463527',19,1000,'2011-12-02','11:55:00',NULL,'2016-01-11 22:27:10'),(149,'1837463527',20,1000,'2011-12-02','11:55:00',NULL,'2016-01-11 22:27:10'),(150,'1837463527',22,1000,'2011-12-02','11:55:00',NULL,'2016-01-11 22:27:10'),(151,'1837463527',23,1000,'2011-12-02','11:55:00',NULL,'2016-01-11 22:27:10'),(152,'1837463527',25,1000,'2011-12-02','11:55:00',NULL,'2016-01-11 22:27:10'),(153,'1837463527',26,1000,'2011-12-02','11:55:00',NULL,'2016-01-11 22:27:10'),(154,'1837463527',28,1000,'2011-12-02','11:55:00',NULL,'2016-01-11 22:27:10'),(155,'1837463527',29,1000,'2011-12-02','11:55:00',NULL,'2016-01-11 22:27:10'),(156,'1837463527',30,1000,'2011-12-02','11:55:00',NULL,'2016-01-11 22:27:10'),(157,'1837463527',31,1000,'2011-12-02','11:55:00',NULL,'2016-01-11 22:27:10'),(158,'1837463527',33,1000,'2011-12-02','11:55:00',NULL,'2016-01-11 22:27:10'),(159,'1837463527',34,1000,'2011-12-02','11:55:00',NULL,'2016-01-11 22:27:10'),(160,'1837463527',35,1000,'2011-12-02','11:55:00',NULL,'2016-01-11 22:27:10'),(161,'1837463527',37,1000,'2011-12-02','11:55:00',NULL,'2016-01-11 22:27:10'),(162,'1837463527',38,1000,'2011-12-02','11:55:00',NULL,'2016-01-11 22:27:10'),(163,'1837463527',39,1000,'2011-12-02','11:55:00',NULL,'2016-01-11 22:27:10'),(164,'1837463527',40,1000,'2011-12-02','11:55:00',NULL,'2016-01-11 22:27:10'),(165,'1837463527',41,1000,'2011-12-02','11:55:00',NULL,'2016-01-11 22:27:10'),(166,'1837463527',42,1000,'2011-12-02','11:55:00',NULL,'2016-01-11 22:27:10'),(167,'1837463527',43,1000,'2011-12-02','11:55:00',NULL,'2016-01-11 22:27:10'),(168,'1837463527',44,1000,'2011-12-02','11:55:00',NULL,'2016-01-11 22:27:10'),(169,'1837463527',45,1000,'2011-12-02','11:55:00',NULL,'2016-01-11 22:27:10'),(170,'1837463527',47,1000,'2011-12-02','11:55:00',NULL,'2016-01-11 22:27:10'),(171,'1837463527',48,1000,'2011-12-02','11:55:00',NULL,'2016-01-11 22:27:10'),(172,'1837463527',50,1000,'2011-12-02','11:55:00',NULL,'2016-01-11 22:27:10'),(173,'1837463527',51,1000,'2011-12-02','11:55:00',NULL,'2016-01-11 22:27:10'),(174,'1837463527',52,1000,'2011-12-02','11:55:00',NULL,'2016-01-11 22:27:10'),(175,'1837463527',53,1000,'2011-12-02','11:55:00',NULL,'2016-01-11 22:27:10'),(176,'1837463527',54,1000,'2011-12-02','11:55:00',NULL,'2016-01-11 22:27:10'),(177,'1837463527',55,1000,'2011-12-02','11:55:00',NULL,'2016-01-11 22:27:10'),(178,'1837463527',56,1000,'2011-12-02','11:55:00',NULL,'2016-01-11 22:27:10'),(179,'1837463527',57,1000,'2011-12-02','11:55:00',NULL,'2016-01-11 22:27:10'),(180,'1837463527',58,1000,'2011-12-02','11:55:00',NULL,'2016-01-11 22:27:10'),(181,'1837463527',59,1000,'2011-12-02','11:55:00',NULL,'2016-01-11 22:27:10'),(182,'1837463527',60,1000,'2011-12-02','11:55:00',NULL,'2016-01-11 22:27:10'),(183,'1837463527',61,1000,'2011-12-02','11:55:00',NULL,'2016-01-11 22:27:10'),(184,'1837463527',62,1000,'2011-12-02','11:55:00',NULL,'2016-01-11 22:27:10'),(185,'1837463527',63,1000,'2011-12-02','11:55:00',NULL,'2016-01-11 22:27:10'),(186,'1837463527',64,1000,'2011-12-02','11:55:00',NULL,'2016-01-11 22:27:10'),(187,'1837463527',65,1000,'2011-12-02','11:55:00',NULL,'2016-01-11 22:27:10'),(188,'1837463527',66,1000,'2011-12-02','11:55:00',NULL,'2016-01-11 22:27:10'),(189,'1837463527',67,1000,'2011-12-02','11:55:00',NULL,'2016-01-11 22:27:10'),(190,'1837463527',68,1000,'2011-12-02','11:55:00',NULL,'2016-01-11 22:27:10'),(191,'1837463527',69,1000,'2011-12-02','11:55:00',NULL,'2016-01-11 22:27:10'),(192,'1837463527',71,1000,'2011-12-02','11:55:00',NULL,'2016-01-11 22:27:10'),(193,'1837463527',72,1000,'2011-12-02','11:55:00',NULL,'2016-01-11 22:27:10'),(194,'1837463527',74,1000,'2011-12-02','11:55:00',NULL,'2016-01-11 22:27:10'),(195,'1837463527',75,1000,'2011-12-02','11:55:00',NULL,'2016-01-11 22:27:10'),(196,'1837463527',76,1000,'2011-12-02','11:55:00',NULL,'2016-01-11 22:27:10'),(197,'1837463527',77,1000,'2011-12-02','11:55:00',NULL,'2016-01-11 22:27:10'),(198,'1837463527',78,1000,'2011-12-02','11:55:00',NULL,'2016-01-11 22:27:10'),(199,'1837463527',79,1000,'2011-12-02','11:55:00',NULL,'2016-01-11 22:27:10'),(200,'1837463527',80,1000,'2011-12-02','11:55:00',NULL,'2016-01-11 22:27:10'),(201,'1837463527',81,1000,'2011-12-02','11:55:00',NULL,'2016-01-11 22:27:10'),(202,'1837463527',84,1000,'2011-12-02','11:55:00',NULL,'2016-01-11 22:27:10'),(203,'1837463527',85,1000,'2011-12-02','11:55:00',NULL,'2016-01-11 22:27:10'),(204,'1837463527',86,1000,'2011-12-02','11:55:00',NULL,'2016-01-11 22:27:10'),(205,'1837463527',87,1000,'2011-12-02','11:55:00',NULL,'2016-01-11 22:27:10'),(206,'1837463527',88,1000,'2011-12-02','11:55:00',NULL,'2016-01-11 22:27:10'),(207,'1837463527',89,1000,'2011-12-02','11:55:00',NULL,'2016-01-11 22:27:10'),(208,'1837463527',90,1000,'2011-12-02','11:55:00',NULL,'2016-01-11 22:27:10'),(209,'1837463527',91,1000,'2011-12-02','11:55:00',NULL,'2016-01-11 22:27:10'),(210,'1837463527',92,1000,'2011-12-02','11:55:00',NULL,'2016-01-11 22:27:10'),(211,'1837463527',93,1000,'2011-12-02','11:55:00',NULL,'2016-01-11 22:27:10'),(212,'1837463527',95,1000,'2011-12-02','11:55:00',NULL,'2016-01-11 22:27:10'),(213,'1837463527',96,1000,'2011-12-02','11:55:00',NULL,'2016-01-11 22:27:10'),(214,'1837463527',97,1000,'2011-12-02','11:55:00',NULL,'2016-01-11 22:27:10'),(215,'1837463527',98,1000,'2011-12-02','11:55:00',NULL,'2016-01-11 22:27:10'),(216,'1837463527',99,1000,'2011-12-02','11:55:00',NULL,'2016-01-11 22:27:10'),(217,'1837463527',100,1000,'2011-12-02','11:55:00',NULL,'2016-01-11 22:27:10'),(218,'1837463527',101,1000,'2011-12-02','11:55:00',NULL,'2016-01-11 22:27:10'),(219,'1837463527',102,1000,'2011-12-02','11:55:00',NULL,'2016-01-11 22:27:10'),(220,'1837463527',103,1000,'2011-12-02','11:55:00',NULL,'2016-01-11 22:27:10'),(221,'1837463527',104,1000,'2011-12-02','11:55:00',NULL,'2016-01-11 22:27:10'),(222,'1837463527',105,1000,'2011-12-02','11:55:00',NULL,'2016-01-11 22:27:10'),(223,'1837463527',106,1000,'2011-12-02','11:55:00',NULL,'2016-01-11 22:27:10'),(224,'1837463527',107,1000,'2011-12-02','11:55:00',NULL,'2016-01-11 22:27:10'),(225,'1837463527',108,1000,'2011-12-02','11:55:00',NULL,'2016-01-11 22:27:10'),(226,'1837463527',109,1000,'2011-12-02','11:55:00',NULL,'2016-01-11 22:27:10'),(227,'1837463527',110,1000,'2011-12-02','11:55:00',NULL,'2016-01-11 22:27:10'),(228,'1837463527',111,1000,'2011-12-02','11:55:00',NULL,'2016-01-11 22:27:10'),(229,'1837463527',112,1000,'2011-12-02','11:55:00',NULL,'2016-01-11 22:27:10'),(230,'1837463527',113,1000,'2011-12-02','11:55:00',NULL,'2016-01-11 22:27:10'),(231,'1837463527',114,1000,'2011-12-02','11:55:00',NULL,'2016-01-11 22:27:10'),(232,'1837463527',115,1000,'2011-12-02','11:55:00',NULL,'2016-01-11 22:27:10'),(233,'1837463527',116,1000,'2011-12-02','11:55:00',NULL,'2016-01-11 22:27:10'),(234,'1837463527',117,1000,'2011-12-02','11:55:00',NULL,'2016-01-11 22:27:10'),(235,'1837463527',131,1000,'2011-12-02','11:55:00',NULL,'2016-01-11 22:27:10'),(236,'1837463527',132,1000,'2011-12-02','11:55:00',NULL,'2016-01-11 22:27:10'),(237,'1837463527',133,1000,'2011-12-02','11:55:00',NULL,'2016-01-11 22:27:10'),(238,'1837463527',134,1000,'2011-12-02','11:55:00',NULL,'2016-01-11 22:27:10'),(239,'1837463527',135,1000,'2011-12-02','11:55:00',NULL,'2016-01-11 22:27:10'),(240,'1837463527',136,1000,'2011-12-02','11:55:00',NULL,'2016-01-11 22:27:10'),(241,'1837463527',137,1000,'2011-12-02','11:55:00',NULL,'2016-01-11 22:27:10'),(242,'1837463527',138,1000,'2011-12-02','11:55:00',NULL,'2016-01-11 22:27:10'),(243,'1837463527',139,1000,'2011-12-02','11:55:00',NULL,'2016-01-11 22:27:10'),(244,'1837463527',140,1000,'2011-12-02','11:55:00',NULL,'2016-01-11 22:27:10'),(245,'1837463527',141,1000,'2011-12-02','11:55:00',NULL,'2016-01-11 22:27:10'),(246,'1837463527',142,1000,'2011-12-02','11:55:00',NULL,'2016-01-11 22:27:10'),(247,'1837463527',143,1000,'2011-12-02','11:55:00',NULL,'2016-01-11 22:27:10'),(248,'1837463527',144,1000,'2011-12-02','11:55:00',NULL,'2016-01-11 22:27:10'),(249,'1837463527',145,1000,'2011-12-02','11:55:00',NULL,'2016-01-11 22:27:10'),(250,'1837463527',146,1000,'2011-12-02','11:55:00',NULL,'2016-01-11 22:27:10'),(251,'1837463527',147,1000,'2011-12-02','11:55:00',NULL,'2016-01-11 22:27:10'),(252,'1837463527',3,1000,'2011-11-01','10:00:00',NULL,'2016-01-11 22:27:45'),(253,'1837463527',3,1000,'2012-03-02','11:55:00',NULL,'2016-01-11 22:27:45'),(254,'1837463527',4,1000,'2012-03-02','11:55:00',NULL,'2016-01-11 22:27:45'),(255,'1837463527',5,1000,'2012-03-02','11:55:00',NULL,'2016-01-11 22:27:45'),(256,'1837463527',6,1000,'2012-03-02','11:55:00',NULL,'2016-01-11 22:27:45'),(257,'1837463527',7,1000,'2012-03-02','11:55:00',NULL,'2016-01-11 22:27:45'),(258,'1837463527',8,1000,'2012-03-02','11:55:00',NULL,'2016-01-11 22:27:45'),(259,'1837463527',10,1000,'2012-03-02','11:55:00',NULL,'2016-01-11 22:27:45'),(260,'1837463527',11,1000,'2012-03-02','11:55:00',NULL,'2016-01-11 22:27:45'),(261,'1837463527',12,1000,'2012-03-02','11:55:00',NULL,'2016-01-11 22:27:45'),(262,'1837463527',15,1000,'2012-03-02','11:55:00',NULL,'2016-01-11 22:27:45'),(263,'1837463527',16,1000,'2012-03-02','11:55:00',NULL,'2016-01-11 22:27:45'),(264,'1837463527',17,1000,'2012-03-02','11:55:00',NULL,'2016-01-11 22:27:45'),(265,'1837463527',18,1000,'2012-03-02','11:55:00',NULL,'2016-01-11 22:27:45'),(266,'1837463527',19,1000,'2012-03-02','11:55:00',NULL,'2016-01-11 22:27:45'),(267,'1837463527',20,1000,'2012-03-02','11:55:00',NULL,'2016-01-11 22:27:45'),(268,'1837463527',22,1000,'2012-03-02','11:55:00',NULL,'2016-01-11 22:27:45'),(269,'1837463527',23,1000,'2012-03-02','11:55:00',NULL,'2016-01-11 22:27:45'),(270,'1837463527',25,1000,'2012-03-02','11:55:00',NULL,'2016-01-11 22:27:45'),(271,'1837463527',26,1000,'2012-03-02','11:55:00',NULL,'2016-01-11 22:27:45'),(272,'1837463527',28,1000,'2012-03-02','11:55:00',NULL,'2016-01-11 22:27:45'),(273,'1837463527',29,1000,'2012-03-02','11:55:00',NULL,'2016-01-11 22:27:45'),(274,'1837463527',30,1000,'2012-03-02','11:55:00',NULL,'2016-01-11 22:27:45'),(275,'1837463527',31,1000,'2012-03-02','11:55:00',NULL,'2016-01-11 22:27:45'),(276,'1837463527',33,1000,'2012-03-02','11:55:00',NULL,'2016-01-11 22:27:45'),(277,'1837463527',34,1000,'2012-03-02','11:55:00',NULL,'2016-01-11 22:27:45'),(278,'1837463527',35,1000,'2012-03-02','11:55:00',NULL,'2016-01-11 22:27:45'),(279,'1837463527',37,1000,'2012-03-02','11:55:00',NULL,'2016-01-11 22:27:45'),(280,'1837463527',38,1000,'2012-03-02','11:55:00',NULL,'2016-01-11 22:27:45'),(281,'1837463527',39,1000,'2012-03-02','11:55:00',NULL,'2016-01-11 22:27:45'),(282,'1837463527',40,1000,'2012-03-02','11:55:00',NULL,'2016-01-11 22:27:45'),(283,'1837463527',41,1000,'2012-03-02','11:55:00',NULL,'2016-01-11 22:27:45'),(284,'1837463527',42,1000,'2012-03-02','11:55:00',NULL,'2016-01-11 22:27:45'),(285,'1837463527',43,1000,'2012-03-02','11:55:00',NULL,'2016-01-11 22:27:45'),(286,'1837463527',44,1000,'2012-03-02','11:55:00',NULL,'2016-01-11 22:27:45'),(287,'1837463527',45,1000,'2012-03-02','11:55:00',NULL,'2016-01-11 22:27:45'),(288,'1837463527',47,1000,'2012-03-02','11:55:00',NULL,'2016-01-11 22:27:45'),(289,'1837463527',48,1000,'2012-03-02','11:55:00',NULL,'2016-01-11 22:27:45'),(290,'1837463527',50,1000,'2012-03-02','11:55:00',NULL,'2016-01-11 22:27:45'),(291,'1837463527',51,1000,'2012-03-02','11:55:00',NULL,'2016-01-11 22:27:45'),(292,'1837463527',52,1000,'2012-03-02','11:55:00',NULL,'2016-01-11 22:27:45'),(293,'1837463527',53,1000,'2012-03-02','11:55:00',NULL,'2016-01-11 22:27:45'),(294,'1837463527',54,1000,'2012-03-02','11:55:00',NULL,'2016-01-11 22:27:45'),(295,'1837463527',55,1000,'2012-03-02','11:55:00',NULL,'2016-01-11 22:27:45'),(296,'1837463527',56,1000,'2012-03-02','11:55:00',NULL,'2016-01-11 22:27:45'),(297,'1837463527',57,1000,'2012-03-02','11:55:00',NULL,'2016-01-11 22:27:45'),(298,'1837463527',58,1000,'2012-03-02','11:55:00',NULL,'2016-01-11 22:27:45'),(299,'1837463527',59,1000,'2012-03-02','11:55:00',NULL,'2016-01-11 22:27:45'),(300,'1837463527',60,1000,'2012-03-02','11:55:00',NULL,'2016-01-11 22:27:45'),(301,'1837463527',61,1000,'2012-03-02','11:55:00',NULL,'2016-01-11 22:27:45'),(302,'1837463527',62,1000,'2012-03-02','11:55:00',NULL,'2016-01-11 22:27:45'),(303,'1837463527',63,1000,'2012-03-02','11:55:00',NULL,'2016-01-11 22:27:45'),(304,'1837463527',64,1000,'2012-03-02','11:55:00',NULL,'2016-01-11 22:27:45'),(305,'1837463527',65,1000,'2012-03-02','11:55:00',NULL,'2016-01-11 22:27:45'),(306,'1837463527',66,1000,'2012-03-02','11:55:00',NULL,'2016-01-11 22:27:45'),(307,'1837463527',67,1000,'2012-03-02','11:55:00',NULL,'2016-01-11 22:27:45'),(308,'1837463527',68,1000,'2012-03-02','11:55:00',NULL,'2016-01-11 22:27:45'),(309,'1837463527',69,1000,'2012-03-02','11:55:00',NULL,'2016-01-11 22:27:45'),(310,'1837463527',71,1000,'2012-03-02','11:55:00',NULL,'2016-01-11 22:27:45'),(311,'1837463527',72,1000,'2012-03-02','11:55:00',NULL,'2016-01-11 22:27:45'),(312,'1837463527',74,1000,'2012-03-02','11:55:00',NULL,'2016-01-11 22:27:45'),(313,'1837463527',75,1000,'2012-03-02','11:55:00',NULL,'2016-01-11 22:27:45'),(314,'1837463527',76,1000,'2012-03-02','11:55:00',NULL,'2016-01-11 22:27:45'),(315,'1837463527',77,1000,'2012-03-02','11:55:00',NULL,'2016-01-11 22:27:45'),(316,'1837463527',78,1000,'2012-03-02','11:55:00',NULL,'2016-01-11 22:27:45'),(317,'1837463527',79,1000,'2012-03-02','11:55:00',NULL,'2016-01-11 22:27:45'),(318,'1837463527',80,1000,'2012-03-02','11:55:00',NULL,'2016-01-11 22:27:45'),(319,'1837463527',81,1000,'2012-03-02','11:55:00',NULL,'2016-01-11 22:27:45'),(320,'1837463527',84,1000,'2012-03-02','11:55:00',NULL,'2016-01-11 22:27:45'),(321,'1837463527',85,1000,'2012-03-02','11:55:00',NULL,'2016-01-11 22:27:45'),(322,'1837463527',86,1000,'2012-03-02','11:55:00',NULL,'2016-01-11 22:27:45'),(323,'1837463527',87,1000,'2012-03-02','11:55:00',NULL,'2016-01-11 22:27:45'),(324,'1837463527',88,1000,'2012-03-02','11:55:00',NULL,'2016-01-11 22:27:45'),(325,'1837463527',89,1000,'2012-03-02','11:55:00',NULL,'2016-01-11 22:27:45'),(326,'1837463527',90,1000,'2012-03-02','11:55:00',NULL,'2016-01-11 22:27:45'),(327,'1837463527',91,1000,'2012-03-02','11:55:00',NULL,'2016-01-11 22:27:45'),(328,'1837463527',92,1000,'2012-03-02','11:55:00',NULL,'2016-01-11 22:27:45'),(329,'1837463527',93,1000,'2012-03-02','11:55:00',NULL,'2016-01-11 22:27:45'),(330,'1837463527',95,1000,'2012-03-02','11:55:00',NULL,'2016-01-11 22:27:45'),(331,'1837463527',96,1000,'2012-03-02','11:55:00',NULL,'2016-01-11 22:27:45'),(332,'1837463527',97,1000,'2012-03-02','11:55:00',NULL,'2016-01-11 22:27:45'),(333,'1837463527',98,1000,'2012-03-02','11:55:00',NULL,'2016-01-11 22:27:45'),(334,'1837463527',99,1000,'2012-03-02','11:55:00',NULL,'2016-01-11 22:27:45'),(335,'1837463527',137,1000,'2012-03-02','11:55:00',NULL,'2016-01-11 22:27:45'),(336,'1837463527',138,1000,'2012-03-02','11:55:00',NULL,'2016-01-11 22:27:45'),(337,'1837463527',139,1000,'2012-03-02','11:55:00',NULL,'2016-01-11 22:27:45'),(338,'1837463527',140,1000,'2012-03-02','11:55:00',NULL,'2016-01-11 22:27:45'),(339,'1837463527',141,1000,'2012-03-02','11:55:00',NULL,'2016-01-11 22:27:45'),(340,'1837463527',142,1000,'2012-03-02','11:55:00',NULL,'2016-01-11 22:27:45'),(341,'1837463527',143,1000,'2012-03-02','11:55:00',NULL,'2016-01-11 22:27:45'),(342,'1837463527',144,1000,'2012-03-02','11:55:00',NULL,'2016-01-11 22:27:45'),(343,'1837463527',145,1000,'2012-03-02','11:55:00',NULL,'2016-01-11 22:27:45'),(344,'1837463527',146,1000,'2012-03-02','11:55:00',NULL,'2016-01-11 22:27:45'),(345,'1837463527',147,1000,'2012-03-02','11:55:00',NULL,'2016-01-11 22:27:45'),(346,'1837463527',3,1000,'2011-11-01','10:00:00',NULL,'2016-01-11 22:28:15'),(347,'1837463527',3,1000,'2012-04-02','11:55:00',NULL,'2016-01-11 22:28:15'),(348,'1837463527',4,1000,'2012-04-02','11:55:00',NULL,'2016-01-11 22:28:15'),(349,'1837463527',5,1000,'2012-04-02','11:55:00',NULL,'2016-01-11 22:28:15'),(350,'1837463527',6,1000,'2012-04-02','11:55:00',NULL,'2016-01-11 22:28:15'),(351,'1837463527',7,1000,'2012-04-02','11:55:00',NULL,'2016-01-11 22:28:15'),(352,'1837463527',8,1000,'2012-04-02','11:55:00',NULL,'2016-01-11 22:28:15'),(353,'1837463527',10,1000,'2012-04-02','11:55:00',NULL,'2016-01-11 22:28:15'),(354,'1837463527',11,1000,'2012-04-02','11:55:00',NULL,'2016-01-11 22:28:15'),(355,'1837463527',12,1000,'2012-04-02','11:55:00',NULL,'2016-01-11 22:28:15'),(356,'1837463527',15,1000,'2012-04-02','11:55:00',NULL,'2016-01-11 22:28:15'),(357,'1837463527',16,1000,'2012-04-02','11:55:00',NULL,'2016-01-11 22:28:15'),(358,'1837463527',17,1000,'2012-04-02','11:55:00',NULL,'2016-01-11 22:28:15'),(359,'1837463527',18,1000,'2012-04-02','11:55:00',NULL,'2016-01-11 22:28:15'),(360,'1837463527',19,1000,'2012-04-02','11:55:00',NULL,'2016-01-11 22:28:15'),(361,'1837463527',20,1000,'2012-04-02','11:55:00',NULL,'2016-01-11 22:28:15'),(362,'1837463527',22,1000,'2012-04-02','11:55:00',NULL,'2016-01-11 22:28:15'),(363,'1837463527',23,1000,'2012-04-02','11:55:00',NULL,'2016-01-11 22:28:15'),(364,'1837463527',25,1000,'2012-04-02','11:55:00',NULL,'2016-01-11 22:28:15'),(365,'1837463527',26,1000,'2012-04-02','11:55:00',NULL,'2016-01-11 22:28:15'),(366,'1837463527',28,1000,'2012-04-02','11:55:00',NULL,'2016-01-11 22:28:15'),(367,'1837463527',29,1000,'2012-04-02','11:55:00',NULL,'2016-01-11 22:28:15'),(368,'1837463527',30,1000,'2012-04-02','11:55:00',NULL,'2016-01-11 22:28:15'),(369,'1837463527',31,1000,'2012-04-02','11:55:00',NULL,'2016-01-11 22:28:15'),(370,'1837463527',33,1000,'2012-04-02','11:55:00',NULL,'2016-01-11 22:28:15'),(371,'1837463527',34,1000,'2012-04-02','11:55:00',NULL,'2016-01-11 22:28:15'),(372,'1837463527',35,1000,'2012-04-02','11:55:00',NULL,'2016-01-11 22:28:15'),(373,'1837463527',37,1000,'2012-04-02','11:55:00',NULL,'2016-01-11 22:28:15'),(374,'1837463527',38,1000,'2012-04-02','11:55:00',NULL,'2016-01-11 22:28:15'),(375,'1837463527',39,1000,'2012-04-02','11:55:00',NULL,'2016-01-11 22:28:15'),(376,'1837463527',40,1000,'2012-04-02','11:55:00',NULL,'2016-01-11 22:28:15'),(377,'1837463527',41,1000,'2012-04-02','11:55:00',NULL,'2016-01-11 22:28:15'),(378,'1837463527',42,1000,'2012-04-02','11:55:00',NULL,'2016-01-11 22:28:15'),(379,'1837463527',43,1000,'2012-04-02','11:55:00',NULL,'2016-01-11 22:28:15'),(380,'1837463527',44,1000,'2012-04-02','11:55:00',NULL,'2016-01-11 22:28:15'),(381,'1837463527',45,1000,'2012-04-02','11:55:00',NULL,'2016-01-11 22:28:15'),(382,'1837463527',47,1000,'2012-04-02','11:55:00',NULL,'2016-01-11 22:28:15'),(383,'1837463527',48,1000,'2012-04-02','11:55:00',NULL,'2016-01-11 22:28:15'),(384,'1837463527',50,1000,'2012-04-02','11:55:00',NULL,'2016-01-11 22:28:15'),(385,'1837463527',51,1000,'2012-04-02','11:55:00',NULL,'2016-01-11 22:28:15'),(386,'1837463527',52,1000,'2012-04-02','11:55:00',NULL,'2016-01-11 22:28:15'),(387,'1837463527',53,1000,'2012-04-02','11:55:00',NULL,'2016-01-11 22:28:15'),(388,'1837463527',54,1000,'2012-04-02','11:55:00',NULL,'2016-01-11 22:28:15'),(389,'1837463527',55,1000,'2012-04-02','11:55:00',NULL,'2016-01-11 22:28:15'),(390,'1837463527',56,1000,'2012-04-02','11:55:00',NULL,'2016-01-11 22:28:15'),(391,'1837463527',57,1000,'2012-04-02','11:55:00',NULL,'2016-01-11 22:28:15'),(392,'1837463527',58,1000,'2012-04-02','11:55:00',NULL,'2016-01-11 22:28:15'),(393,'1837463527',59,1000,'2012-04-02','11:55:00',NULL,'2016-01-11 22:28:15'),(394,'1837463527',60,1000,'2012-04-02','11:55:00',NULL,'2016-01-11 22:28:15'),(395,'1837463527',61,1000,'2012-04-02','11:55:00',NULL,'2016-01-11 22:28:15'),(396,'1837463527',62,1000,'2012-04-02','11:55:00',NULL,'2016-01-11 22:28:15'),(397,'1837463527',63,1000,'2012-04-02','11:55:00',NULL,'2016-01-11 22:28:15'),(398,'1837463527',64,1000,'2012-04-02','11:55:00',NULL,'2016-01-11 22:28:15'),(399,'1837463527',65,1000,'2012-04-02','11:55:00',NULL,'2016-01-11 22:28:15'),(400,'1837463527',66,1000,'2012-04-02','11:55:00',NULL,'2016-01-11 22:28:15'),(401,'1837463527',67,1000,'2012-04-02','11:55:00',NULL,'2016-01-11 22:28:15'),(402,'1837463527',68,1000,'2012-04-02','11:55:00',NULL,'2016-01-11 22:28:15'),(403,'1837463527',69,1000,'2012-04-02','11:55:00',NULL,'2016-01-11 22:28:15'),(404,'1837463527',71,1000,'2012-04-02','11:55:00',NULL,'2016-01-11 22:28:15'),(405,'1837463527',72,1000,'2012-04-02','11:55:00',NULL,'2016-01-11 22:28:15'),(406,'1837463527',137,1000,'2012-04-02','11:55:00',NULL,'2016-01-11 22:28:15'),(407,'1837463527',138,1000,'2012-04-02','11:55:00',NULL,'2016-01-11 22:28:15'),(408,'1837463527',139,1000,'2012-04-02','11:55:00',NULL,'2016-01-11 22:28:15'),(409,'1837463527',140,1000,'2012-04-02','11:55:00',NULL,'2016-01-11 22:28:15'),(410,'1837463527',141,1000,'2012-04-02','11:55:00',NULL,'2016-01-11 22:28:15'),(411,'1837463527',142,1000,'2012-04-02','11:55:00',NULL,'2016-01-11 22:28:15'),(412,'1837463527',143,1000,'2012-04-02','11:55:00',NULL,'2016-01-11 22:28:15'),(413,'1837463527',144,1000,'2012-04-02','11:55:00',NULL,'2016-01-11 22:28:15'),(414,'1837463527',145,1000,'2012-04-02','11:55:00',NULL,'2016-01-11 22:28:15'),(415,'1837463527',146,1000,'2012-04-02','11:55:00',NULL,'2016-01-11 22:28:15'),(416,'1837463527',147,1000,'2012-04-02','11:55:00',NULL,'2016-01-11 22:28:15'),(417,'1837463527',3,1000,'2011-12-01','10:00:00',NULL,'2016-01-11 22:28:38'),(418,'1837463527',3,1000,'2012-05-02','11:55:00',NULL,'2016-01-11 22:28:38'),(419,'1837463527',4,1000,'2012-05-02','11:55:00',NULL,'2016-01-11 22:28:38'),(420,'1837463527',5,1000,'2012-05-02','11:55:00',NULL,'2016-01-11 22:28:38'),(421,'1837463527',6,1000,'2012-05-02','11:55:00',NULL,'2016-01-11 22:28:38'),(422,'1837463527',7,1000,'2012-05-02','11:55:00',NULL,'2016-01-11 22:28:38'),(423,'1837463527',8,1000,'2012-05-02','11:55:00',NULL,'2016-01-11 22:28:38'),(424,'1837463527',10,1000,'2012-05-02','11:55:00',NULL,'2016-01-11 22:28:38'),(425,'1837463527',11,1000,'2012-05-02','11:55:00',NULL,'2016-01-11 22:28:38'),(426,'1837463527',12,1000,'2012-05-02','11:55:00',NULL,'2016-01-11 22:28:38'),(427,'1837463527',15,1000,'2012-05-02','11:55:00',NULL,'2016-01-11 22:28:38'),(428,'1837463527',16,1000,'2012-05-02','11:55:00',NULL,'2016-01-11 22:28:38'),(429,'1837463527',17,1000,'2012-05-02','11:55:00',NULL,'2016-01-11 22:28:38'),(430,'1837463527',18,1000,'2012-05-02','11:55:00',NULL,'2016-01-11 22:28:38'),(431,'1837463527',19,1000,'2012-05-02','11:55:00',NULL,'2016-01-11 22:28:38'),(432,'1837463527',20,1000,'2012-05-02','11:55:00',NULL,'2016-01-11 22:28:38'),(433,'1837463527',22,1000,'2012-05-02','11:55:00',NULL,'2016-01-11 22:28:38'),(434,'1837463527',23,1000,'2012-05-02','11:55:00',NULL,'2016-01-11 22:28:38'),(435,'1837463527',25,1000,'2012-05-02','11:55:00',NULL,'2016-01-11 22:28:38'),(436,'1837463527',26,1000,'2012-05-02','11:55:00',NULL,'2016-01-11 22:28:38'),(437,'1837463527',28,1000,'2012-05-02','11:55:00',NULL,'2016-01-11 22:28:38'),(438,'1837463527',29,1000,'2012-05-02','11:55:00',NULL,'2016-01-11 22:28:38'),(439,'1837463527',30,1000,'2012-05-02','11:55:00',NULL,'2016-01-11 22:28:38'),(440,'1837463527',31,1000,'2012-05-02','11:55:00',NULL,'2016-01-11 22:28:38'),(441,'1837463527',33,1000,'2012-05-02','11:55:00',NULL,'2016-01-11 22:28:38'),(442,'1837463527',34,1000,'2012-05-02','11:55:00',NULL,'2016-01-11 22:28:38'),(443,'1837463527',35,1000,'2012-05-02','11:55:00',NULL,'2016-01-11 22:28:38'),(444,'1837463527',67,1000,'2012-05-02','11:55:00',NULL,'2016-01-11 22:28:38'),(445,'1837463527',68,1000,'2012-05-02','11:55:00',NULL,'2016-01-11 22:28:38'),(446,'1837463527',69,1000,'2012-05-02','11:55:00',NULL,'2016-01-11 22:28:38'),(447,'1837463527',71,1000,'2012-05-02','11:55:00',NULL,'2016-01-11 22:28:38'),(448,'1837463527',72,1000,'2012-05-02','11:55:00',NULL,'2016-01-11 22:28:38'),(449,'1837463527',137,1000,'2012-05-02','11:55:00',NULL,'2016-01-11 22:28:38'),(450,'1837463527',138,1000,'2012-05-02','11:55:00',NULL,'2016-01-11 22:28:38'),(451,'1837463527',139,1000,'2012-05-02','11:55:00',NULL,'2016-01-11 22:28:38'),(452,'1837463527',140,1000,'2012-05-02','11:55:00',NULL,'2016-01-11 22:28:38'),(453,'1837463527',141,1000,'2012-05-02','11:55:00',NULL,'2016-01-11 22:28:38'),(454,'1837463527',142,1000,'2012-05-02','11:55:00',NULL,'2016-01-11 22:28:38'),(455,'1837463527',143,1000,'2012-05-02','11:55:00',NULL,'2016-01-11 22:28:38'),(456,'1837463527',144,1000,'2012-05-02','11:55:00',NULL,'2016-01-11 22:28:38'),(457,'1837463527',145,1000,'2012-05-02','11:55:00',NULL,'2016-01-11 22:28:38'),(458,'1837463527',146,1000,'2012-05-02','11:55:00',NULL,'2016-01-11 22:28:38'),(459,'1837463527',147,1000,'2012-05-02','11:55:00',NULL,'2016-01-11 22:28:38'),(460,'1837463527',3,1000,'2011-12-01','10:00:00',NULL,'2016-01-11 22:29:03'),(461,'1837463527',3,1000,'2012-06-02','11:55:00',NULL,'2016-01-11 22:29:03'),(462,'1837463527',4,1000,'2012-06-02','11:55:00',NULL,'2016-01-11 22:29:03'),(463,'1837463527',5,1000,'2012-06-02','11:55:00',NULL,'2016-01-11 22:29:03'),(464,'1837463527',6,1000,'2012-06-02','11:55:00',NULL,'2016-01-11 22:29:03'),(465,'1837463527',7,1000,'2012-06-02','11:55:00',NULL,'2016-01-11 22:29:03'),(466,'1837463527',8,1000,'2012-06-02','11:55:00',NULL,'2016-01-11 22:29:03'),(467,'1837463527',10,1000,'2012-06-02','11:55:00',NULL,'2016-01-11 22:29:03'),(468,'1837463527',11,1000,'2012-06-02','11:55:00',NULL,'2016-01-11 22:29:03'),(469,'1837463527',12,1000,'2012-06-02','11:55:00',NULL,'2016-01-11 22:29:03'),(470,'1837463527',15,1000,'2012-06-02','11:55:00',NULL,'2016-01-11 22:29:03'),(471,'1837463527',16,1000,'2012-06-02','11:55:00',NULL,'2016-01-11 22:29:03'),(472,'1837463527',17,1000,'2012-06-02','11:55:00',NULL,'2016-01-11 22:29:03'),(473,'1837463527',18,1000,'2012-06-02','11:55:00',NULL,'2016-01-11 22:29:03'),(474,'1837463527',19,1000,'2012-06-02','11:55:00',NULL,'2016-01-11 22:29:03'),(475,'1837463527',20,1000,'2012-06-02','11:55:00',NULL,'2016-01-11 22:29:03'),(476,'1837463527',22,1000,'2012-06-02','11:55:00',NULL,'2016-01-11 22:29:03'),(477,'1837463527',23,1000,'2012-06-02','11:55:00',NULL,'2016-01-11 22:29:03'),(478,'1837463527',139,1000,'2012-05-01','10:00:00',NULL,'2016-01-13 21:14:28'),(479,'1837463527',139,1000,'2012-06-02','11:35:00',NULL,'2016-01-13 21:14:28'),(480,'1837463527',139,1000,'2012-06-03','16:25:00',NULL,'2016-01-13 21:14:28'),(481,'1837463527',139,1000,'2012-06-01','10:00:00',NULL,'2016-01-13 21:16:57');
/*!40000 ALTER TABLE `sesion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tratamiento`
--

DROP TABLE IF EXISTS `tratamiento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tratamiento` (
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
  KEY `FK_TRATAMIENTO_PERSONAL` (`id_personal`),
  CONSTRAINT `FK_TRATAMIENTO_HISTORIA` FOREIGN KEY (`id_paciente`) REFERENCES `historia` (`id_paciente`) ON UPDATE CASCADE,
  CONSTRAINT `FK_TRATAMIENTO_PERSONAL` FOREIGN KEY (`id_personal`) REFERENCES `personal` (`id_personal`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=148 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tratamiento`
--

LOCK TABLES `tratamiento` WRITE;
/*!40000 ALTER TABLE `tratamiento` DISABLE KEYS */;
INSERT INTO `tratamiento` VALUES (3,'1000000001','1823533946','Tratamiento Post Operatorio',12,0.00,0.00,'2016-01-11 22:17:16',NULL),(4,'1000000002','1823533946','Tratamiento Post Operatorio',10,0.00,0.00,'2016-01-11 22:17:16',NULL),(5,'1000000003','1823533946','Tratamiento Post Operatorio',15,0.00,0.00,'2016-01-11 22:17:16',NULL),(6,'1000000004','1823533946','Tratamiento Post Operatorio',10,0.00,0.00,'2016-01-11 22:17:16',NULL),(7,'1000000005','1823533946','Tratamiento Post Operatorio',10,0.00,0.00,'2016-01-11 22:17:16',NULL),(8,'1000000006','1823533946','Tratamiento Post Operatorio',10,0.00,0.00,'2016-01-11 22:17:16',NULL),(9,'1000000007','1823533946','Tratamiento Post Operatorio',10,0.00,0.00,'2016-01-11 22:17:16',NULL),(10,'1000000008','1823533946','Tratamiento Post Operatorio',12,0.00,0.00,'2016-01-11 22:17:16',NULL),(11,'1000000009','1823533946','Tratamiento Post Operatorio',10,0.00,0.00,'2016-01-11 22:17:16',NULL),(12,'1000000010','1823533946','Tratamiento Post Operatorio',10,0.00,0.00,'2016-01-11 22:17:16',NULL),(13,'1000000011','1823533946','Tratamiento Post Operatorio',12,0.00,0.00,'2016-01-11 22:17:16',NULL),(14,'1000000012','1823533946','Tratamiento Post Operatorio',9,0.00,0.00,'2016-01-11 22:17:16',NULL),(15,'1000000013','1823533946','Tratamiento Post Operatorio',10,0.00,0.00,'2016-01-11 22:17:16',NULL),(16,'1000000014','1823533946','Tratamiento Post Operatorio',9,0.00,0.00,'2016-01-11 22:17:16',NULL),(17,'1000000015','1823533946','Tratamiento Post Operatorio',15,0.00,0.00,'2016-01-11 22:17:16',NULL),(18,'1000000016','1823533946','Tratamiento Post Operatorio',10,0.00,0.00,'2016-01-11 22:17:16',NULL),(19,'1000000017','1823533946','Tratamiento Post Operatorio',10,0.00,0.00,'2016-01-11 22:17:16',NULL),(20,'1000000018','1823533946','Tratamiento Post Operatorio',12,0.00,0.00,'2016-01-11 22:17:16',NULL),(21,'1000000019','1823533946','Tratamiento Post Operatorio',10,0.00,0.00,'2016-01-11 22:17:16',NULL),(22,'1000000020','1823533946','Tratamiento Post Operatorio',12,0.00,0.00,'2016-01-11 22:17:16',NULL),(23,'1000000021','1823533946','Tratamiento Post Operatorio',15,0.00,0.00,'2016-01-11 22:17:16',NULL),(24,'1000000022','1823533946','Tratamiento Post Operatorio',10,0.00,0.00,'2016-01-11 22:17:16',NULL),(25,'1000000023','1823533946','Tratamiento Post Operatorio',15,0.00,0.00,'2016-01-11 22:17:16',NULL),(26,'1000000024','1823533946','Tratamiento Post Operatorio',9,0.00,0.00,'2016-01-11 22:17:16',NULL),(27,'1000000025','1823533946','Tratamiento Post Operatorio',9,0.00,0.00,'2016-01-11 22:17:16',NULL),(28,'1000000026','1823533946','Tratamiento Post Operatorio',10,0.00,0.00,'2016-01-11 22:17:16',NULL),(29,'1000000027','1823533946','Tratamiento Post Operatorio',10,0.00,0.00,'2016-01-11 22:17:16',NULL),(30,'1000000028','1823533946','Tratamiento Post Operatorio',10,0.00,0.00,'2016-01-11 22:17:16',NULL),(31,'1000000029','1823533946','Tratamiento Post Operatorio',10,0.00,0.00,'2016-01-11 22:17:16',NULL),(32,'1000000030','1823533946','Tratamiento Post Operatorio',12,0.00,0.00,'2016-01-11 22:17:16',NULL),(33,'1000000031','1823533946','Tratamiento Post Operatorio',10,0.00,0.00,'2016-01-11 22:17:16',NULL),(34,'1000000032','1823533946','Tratamiento Post Operatorio',9,0.00,0.00,'2016-01-11 22:17:16',NULL),(35,'1000000033','1823533946','Tratamiento Post Operatorio',10,0.00,0.00,'2016-01-11 22:17:16',NULL),(36,'1000000034','1823533946','Tratamiento Post Operatorio',10,0.00,0.00,'2016-01-11 22:17:16',NULL),(37,'1000000035','1823533946','Tratamiento Post Operatorio',10,0.00,0.00,'2016-01-11 22:17:16',NULL),(38,'1000000036','1823533946','Tratamiento Post Operatorio',15,0.00,0.00,'2016-01-11 22:17:16',NULL),(39,'1000000037','1823533946','Tratamiento Post Operatorio',10,0.00,0.00,'2016-01-11 22:17:16',NULL),(40,'1000000038','1823533946','Tratamiento Post Operatorio',10,0.00,0.00,'2016-01-11 22:17:16',NULL),(41,'1000000039','1823533946','Tratamiento Post Operatorio',9,0.00,0.00,'2016-01-11 22:17:16',NULL),(42,'1000000040','1823533946','Tratamiento Post Operatorio',10,0.00,0.00,'2016-01-11 22:17:16',NULL),(43,'1000000041','1823533946','Tratamiento Post Operatorio',10,0.00,0.00,'2016-01-11 22:17:16',NULL),(44,'1000000042','1823533946','Tratamiento Post Operatorio',10,0.00,0.00,'2016-01-11 22:17:16',NULL),(45,'1000000043','1823533946','Tratamiento Post Operatorio',10,0.00,0.00,'2016-01-11 22:17:16',NULL),(46,'1000000001','1837463527','Tratamiento Post Operatorio',12,0.00,0.00,'2016-01-11 22:19:32',NULL),(47,'1000000002','1837463527','Tratamiento Post Operatorio',12,0.00,0.00,'2016-01-11 22:19:32',NULL),(48,'1000000003','1837463527','Tratamiento Post Operatorio',12,0.00,0.00,'2016-01-11 22:19:32',NULL),(49,'1000000004','1837463527','Tratamiento Post Operatorio',12,0.00,0.00,'2016-01-11 22:19:32',NULL),(50,'1000000005','1837463527','Tratamiento Post Operatorio',12,0.00,0.00,'2016-01-11 22:19:32',NULL),(51,'1000000006','1837463527','Tratamiento Post Operatorio',12,0.00,0.00,'2016-01-11 22:19:32',NULL),(52,'1000000007','1837463527','Tratamiento Post Operatorio',12,0.00,0.00,'2016-01-11 22:19:32',NULL),(53,'1000000008','1837463527','Tratamiento Post Operatorio',12,0.00,0.00,'2016-01-11 22:19:32',NULL),(54,'1000000009','1837463527','Tratamiento Post Operatorio',12,0.00,0.00,'2016-01-11 22:19:32',NULL),(55,'1000000010','1837463527','Tratamiento Post Operatorio',12,0.00,0.00,'2016-01-11 22:19:32',NULL),(56,'1000000011','1837463527','Tratamiento Post Operatorio',12,0.00,0.00,'2016-01-11 22:19:32',NULL),(57,'1000000012','1837463527','Tratamiento Post Operatorio',12,0.00,0.00,'2016-01-11 22:19:32',NULL),(58,'1000000013','1837463527','Tratamiento Post Operatorio',12,0.00,0.00,'2016-01-11 22:19:32',NULL),(59,'1000000014','1837463527','Tratamiento Post Operatorio',12,0.00,0.00,'2016-01-11 22:19:32',NULL),(60,'1000000015','1837463527','Tratamiento Post Operatorio',12,0.00,0.00,'2016-01-11 22:19:32',NULL),(61,'1000000016','1837463527','Tratamiento Post Operatorio',12,0.00,0.00,'2016-01-11 22:19:32',NULL),(62,'1000000017','1837463527','Tratamiento Post Operatorio',12,0.00,0.00,'2016-01-11 22:19:32',NULL),(63,'1000000018','1837463527','Tratamiento Post Operatorio',12,0.00,0.00,'2016-01-11 22:19:32',NULL),(64,'1000000019','1837463527','Tratamiento Post Operatorio',12,0.00,0.00,'2016-01-11 22:19:32',NULL),(65,'1000000020','1837463527','Tratamiento Post Operatorio',12,0.00,0.00,'2016-01-11 22:19:32',NULL),(66,'1000000021','1837463527','Tratamiento Post Operatorio',12,0.00,0.00,'2016-01-11 22:19:32',NULL),(67,'1000000022','1837463527','Tratamiento Post Operatorio',12,0.00,0.00,'2016-01-11 22:19:32',NULL),(68,'1000000023','1837463527','Tratamiento Post Operatorio',12,0.00,0.00,'2016-01-11 22:19:32',NULL),(69,'1000000024','1837463527','Tratamiento Post Operatorio',12,0.00,0.00,'2016-01-11 22:19:32',NULL),(70,'1000000025','1837463527','Tratamiento Post Operatorio',12,0.00,0.00,'2016-01-11 22:19:32',NULL),(71,'1000000026','1837463527','Tratamiento Post Operatorio',12,0.00,0.00,'2016-01-11 22:19:32',NULL),(72,'1000000027','1837463527','Tratamiento Post Operatorio',12,0.00,0.00,'2016-01-11 22:19:32',NULL),(73,'1000000028','1837463527','Tratamiento Post Operatorio',12,0.00,0.00,'2016-01-11 22:19:32',NULL),(74,'1000000029','1837463527','Tratamiento Post Operatorio',12,0.00,0.00,'2016-01-11 22:19:32',NULL),(75,'1000000030','1837463527','Tratamiento Post Operatorio',12,0.00,0.00,'2016-01-11 22:19:32',NULL),(76,'1000000031','1837463527','Tratamiento Post Operatorio',12,0.00,0.00,'2016-01-11 22:19:32',NULL),(77,'1000000032','1837463527','Tratamiento Post Operatorio',12,0.00,0.00,'2016-01-11 22:19:32',NULL),(78,'1000000033','1837463527','Tratamiento Post Operatorio',12,0.00,0.00,'2016-01-11 22:19:32',NULL),(79,'1000000034','1837463527','Tratamiento Post Operatorio',12,0.00,0.00,'2016-01-11 22:19:32',NULL),(80,'1000000035','1837463527','Tratamiento Post Operatorio',12,0.00,0.00,'2016-01-11 22:19:32',NULL),(81,'1000000036','1837463527','Tratamiento Post Operatorio',12,0.00,0.00,'2016-01-11 22:19:32',NULL),(82,'1000000037','1837463527','Tratamiento Post Operatorio',12,0.00,0.00,'2016-01-11 22:19:32',NULL),(83,'1000000038','1837463527','Tratamiento Post Operatorio',12,0.00,0.00,'2016-01-11 22:19:32',NULL),(84,'1000000039','1837463527','Tratamiento Post Operatorio',12,0.00,0.00,'2016-01-11 22:19:32',NULL),(85,'1000000040','1837463527','Tratamiento Post Operatorio',12,0.00,0.00,'2016-01-11 22:19:32',NULL),(86,'1000000041','1837463527','Tratamiento Post Operatorio',12,0.00,0.00,'2016-01-11 22:19:32',NULL),(87,'1000000042','1837463527','Tratamiento Post Operatorio',12,0.00,0.00,'2016-01-11 22:19:32',NULL),(88,'1000000043','1837463527','Tratamiento Post Operatorio',12,0.00,0.00,'2016-01-11 22:19:32',NULL),(89,'1000000044','1837463527','Tratamiento Post Operatorio',12,0.00,0.00,'2016-01-11 22:19:32',NULL),(90,'1000000045','1837463527','Tratamiento Post Operatorio',12,0.00,0.00,'2016-01-11 22:19:32',NULL),(91,'1000000046','1837463527','Tratamiento Post Operatorio',12,0.00,0.00,'2016-01-11 22:19:32',NULL),(92,'1000000047','1837463527','Tratamiento Post Operatorio',12,0.00,0.00,'2016-01-11 22:19:32',NULL),(93,'1000000048','1837463527','Tratamiento Post Operatorio',12,0.00,0.00,'2016-01-11 22:19:32',NULL),(94,'1000000049','1837463527','Tratamiento Post Operatorio',12,0.00,0.00,'2016-01-11 22:19:32',NULL),(95,'1000000050','1837463527','Tratamiento Post Operatorio',12,0.00,0.00,'2016-01-11 22:19:32',NULL),(96,'1000000051','1837463527','Tratamiento Post Operatorio',12,0.00,0.00,'2016-01-11 22:19:32',NULL),(97,'1000000052','1837463527','Tratamiento Post Operatorio',12,0.00,0.00,'2016-01-11 22:19:32',NULL),(98,'1000000053','1837463527','Tratamiento Post Operatorio',12,0.00,0.00,'2016-01-11 22:19:32',NULL),(99,'1000000054','1837463527','Tratamiento Post Operatorio',12,0.00,0.00,'2016-01-11 22:19:32',NULL),(100,'1000000055','1837463527','Tratamiento Post Operatorio',12,0.00,0.00,'2016-01-11 22:19:32',NULL),(101,'1000000056','1837463527','Tratamiento Post Operatorio',12,0.00,0.00,'2016-01-11 22:19:32',NULL),(102,'1000000057','1837463527','Tratamiento Post Operatorio',12,0.00,0.00,'2016-01-11 22:19:32',NULL),(103,'1000000058','1837463527','Tratamiento Post Operatorio',12,0.00,0.00,'2016-01-11 22:19:32',NULL),(104,'1000000059','1837463527','Tratamiento Post Operatorio',12,0.00,0.00,'2016-01-11 22:19:32',NULL),(105,'1000000060','1837463527','Tratamiento Post Operatorio',12,0.00,0.00,'2016-01-11 22:19:32',NULL),(106,'1000000061','1837463527','Tratamiento Post Operatorio',12,0.00,0.00,'2016-01-11 22:19:32',NULL),(107,'1000000062','1837463527','Tratamiento Post Operatorio',12,0.00,0.00,'2016-01-11 22:19:32',NULL),(108,'1000000063','1837463527','Tratamiento Post Operatorio',12,0.00,0.00,'2016-01-11 22:19:32',NULL),(109,'1000000064','1837463527','Tratamiento Post Operatorio',12,0.00,0.00,'2016-01-11 22:19:32',NULL),(110,'1000000065','1837463527','Tratamiento Post Operatorio',12,0.00,0.00,'2016-01-11 22:19:32',NULL),(111,'1000000066','1837463527','Tratamiento Post Operatorio',12,0.00,0.00,'2016-01-11 22:19:32',NULL),(112,'1000000067','1837463527','Tratamiento Post Operatorio',12,0.00,0.00,'2016-01-11 22:19:32',NULL),(113,'1000000068','1837463527','Tratamiento Post Operatorio',12,0.00,0.00,'2016-01-11 22:19:32',NULL),(114,'1000000069','1837463527','Tratamiento Post Operatorio',12,0.00,0.00,'2016-01-11 22:19:32',NULL),(115,'1000000070','1837463527','Tratamiento Post Operatorio',12,0.00,0.00,'2016-01-11 22:19:32',NULL),(116,'1000000001','1837463527','Tratamiento Post Operatorio',12,0.00,0.00,'2016-01-11 22:19:32',NULL),(117,'1000000002','1837463527','Tratamiento Post Operatorio',10,0.00,0.00,'2016-01-11 22:19:32',NULL),(118,'1000000003','1837463527','Tratamiento Post Operatorio',15,0.00,0.00,'2016-01-11 22:19:32',NULL),(119,'1000000004','1837463527','Tratamiento Post Operatorio',10,0.00,0.00,'2016-01-11 22:19:32',NULL),(120,'1000000005','1837463527','Tratamiento Post Operatorio',10,0.00,0.00,'2016-01-11 22:19:32',NULL),(121,'1000000006','1837463527','Tratamiento Post Operatorio',10,0.00,0.00,'2016-01-11 22:19:32',NULL),(122,'1000000007','1837463527','Tratamiento Post Operatorio',10,0.00,0.00,'2016-01-11 22:19:32',NULL),(123,'1000000008','1837463527','Tratamiento Post Operatorio',12,0.00,0.00,'2016-01-11 22:19:32',NULL),(124,'1000000009','1837463527','Tratamiento Post Operatorio',10,0.00,0.00,'2016-01-11 22:19:32',NULL),(125,'1000000010','1837463527','Tratamiento Post Operatorio',10,0.00,0.00,'2016-01-11 22:19:32',NULL),(126,'1000000011','1837463527','Tratamiento Post Operatorio',12,0.00,0.00,'2016-01-11 22:19:32',NULL),(127,'1000000012','1837463527','Tratamiento Post Operatorio',9,0.00,0.00,'2016-01-11 22:19:32',NULL),(128,'1000000013','1837463527','Tratamiento Post Operatorio',10,0.00,0.00,'2016-01-11 22:19:32',NULL),(129,'1000000014','1837463527','Tratamiento Post Operatorio',9,0.00,0.00,'2016-01-11 22:19:32',NULL),(130,'1000000015','1837463527','Tratamiento Post Operatorio',15,0.00,0.00,'2016-01-11 22:19:32',NULL),(131,'1000000016','1837463527','Tratamiento Post Operatorio',10,0.00,0.00,'2016-01-11 22:19:32',NULL),(132,'1000000017','1837463527','Tratamiento Post Operatorio',10,0.00,0.00,'2016-01-11 22:19:32',NULL),(133,'1000000018','1837463527','Tratamiento Post Operatorio',12,0.00,0.00,'2016-01-11 22:19:32',NULL),(134,'1000000019','1837463527','Tratamiento Post Operatorio',10,0.00,0.00,'2016-01-11 22:19:32',NULL),(135,'1000000020','1837463527','Tratamiento Post Operatorio',12,0.00,0.00,'2016-01-11 22:19:32',NULL),(136,'1000000021','1837463527','Tratamiento Post Operatorio',15,0.00,0.00,'2016-01-11 22:19:32',NULL),(137,'1000000022','1837463527','Tratamiento Post Operatorio',10,0.00,0.00,'2016-01-11 22:19:32',NULL),(138,'1000000023','1837463527','Tratamiento Post Operatorio',15,0.00,0.00,'2016-01-11 22:19:32',NULL),(139,'1000000024','1837463527','Tratamiento Post Operatorio',9,0.00,0.00,'2016-01-11 22:19:32',NULL),(140,'1000000025','1837463527','Tratamiento Post Operatorio',9,0.00,0.00,'2016-01-11 22:19:32',NULL),(141,'1000000026','1837463527','Tratamiento Post Operatorio',10,0.00,0.00,'2016-01-11 22:19:32',NULL),(142,'1000000027','1837463527','Tratamiento Post Operatorio',10,0.00,0.00,'2016-01-11 22:19:32',NULL),(143,'1000000028','1837463527','Tratamiento Post Operatorio',10,0.00,0.00,'2016-01-11 22:19:32',NULL),(144,'1000000029','1837463527','Tratamiento Post Operatorio',10,0.00,0.00,'2016-01-11 22:19:32',NULL),(145,'1000000030','1837463527','Tratamiento Post Operatorio',12,0.00,0.00,'2016-01-11 22:19:32',NULL),(146,'1000000031','1823533946','Tratamiento Post Operatorio',10,0.00,0.00,'2016-01-11 22:19:32',NULL),(147,'1000000032','1823533946','Tratamiento Post Operatorio',9,0.00,0.00,'2016-01-11 22:19:32',NULL);
/*!40000 ALTER TABLE `tratamiento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
) ENGINE=InnoDB AUTO_INCREMENT=1001 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1000,'mediperbarica',1453328240,'0','eduardo','Eduardo','Villota','eduardouio7@gmail.com','2015-07-15 18:18:21');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-01-21 11:48:54
-- MySQL dump 10.13  Distrib 5.6.27, for Linux (x86_64)
--
-- Host: localhost    Database: gelvscom_mediperbarica
-- ------------------------------------------------------
-- Server version	5.6.27-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `antecedente`
--

DROP TABLE IF EXISTS `antecedente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `antecedente` (
  `id_antecedente` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `id_paciente` varchar(10) NOT NULL,
  `tipo` varchar(45) NOT NULL COMMENT 'solo poner como opciones (antedentes patologicos personales, quirurjicos,familiares)',
  `detalle` varchar(180) NOT NULL,
  `creado` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_antecedente`,`tipo`),
  KEY `FK_ANTECENDETE_HISTORIA` (`id_paciente`),
  CONSTRAINT `FK_ANTECENDETE_HISTORIA` FOREIGN KEY (`id_paciente`) REFERENCES `historia` (`id_paciente`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=149 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `antecedente`
--

LOCK TABLES `antecedente` WRITE;
/*!40000 ALTER TABLE `antecedente` DISABLE KEYS */;
INSERT INTO `antecedente` VALUES (1,'1710005750','Patológicos Personales','Hepatitis A','2015-07-13 18:57:27'),(2,'1710005750','Quirúrgicos','H Quimica\nCirujia De Colson','2015-07-13 18:58:19'),(3,'1710005750','Patológicos Familiares','Asmatica / Madre Con Multi Traumas/ Asim Dm','2015-07-13 18:59:25'),(4,'1704968388','Patológicos Personales','Hdt, Tta, Droup / Hipotiroidismo / Cirrocis Hepatica /','2015-07-13 19:06:41'),(5,'1704968388','Quirúrgicos','Amigdalatomia / Toreidemigtomia / Histereotomia /','2015-07-13 19:07:48'),(6,'1704968388','Alergias','Aines','2015-07-13 19:09:19'),(7,'1704968388','Patológicos Familiares','Padre Fallece Con Cancer Estomacal','2015-07-13 19:09:59'),(8,'0801916529','Quirúrgicos','Post Operatorio Lipoescultura','2015-07-13 19:20:09'),(11,'1000000001','Quìmicos','Alerjia a la penisilina','2016-01-11 22:12:20'),(12,'1000000002','Quìmicos','Alerjia a la penisilina','2016-01-11 22:12:20'),(13,'1000000003','Quìmicos','Alerjia a la penisilina','2016-01-11 22:12:20'),(14,'1000000004','Quìmicos','Alerjia a la penisilina','2016-01-11 22:12:20'),(15,'1000000043','Quìmicos','Alerjia a la penisilina','2016-01-11 22:12:20'),(16,'1000000044','Quìmicos','Alerjia a la penisilina','2016-01-11 22:12:20'),(17,'1000000045','Quìmicos','Alerjia a la penisilina','2016-01-11 22:12:20'),(18,'1000000046','Quìmicos','Alerjia a la penisilina','2016-01-11 22:12:20'),(19,'1000000047','Quìmicos','Alerjia a la penisilina','2016-01-11 22:12:20'),(20,'1000000048','Quìmicos','Alerjia a la penisilina','2016-01-11 22:12:20'),(21,'1000000049','Quìmicos','Alerjia a la penisilina','2016-01-11 22:12:20'),(22,'1000000050','Quìmicos','Alerjia a la penisilina','2016-01-11 22:12:20'),(23,'1000000051','Quìmicos','Alerjia a la penisilina','2016-01-11 22:12:20'),(24,'1000000052','Quìmicos','Alerjia a la penisilina Tipo 2','2016-01-11 22:12:20'),(25,'1000000053','Quìmicos','Alerjia a la penisilina','2016-01-11 22:12:20'),(26,'1000000054','Quìmicos','Alerjia a la penisilina','2016-01-11 22:12:20'),(28,'1000000056','Quìmicos','Alerjia a la penisilina','2016-01-11 22:12:20'),(29,'1000000057','Quìmicos','Alerjia a la penisilina','2016-01-11 22:12:20'),(30,'1000000058','Quìmicos','Alerjia a la penisilina','2016-01-11 22:12:20'),(31,'1000000059','Quìmicos','Alerjia a la penisilina','2016-01-11 22:12:20'),(32,'1000000060','Quìmicos','Alerjia a la penisilina','2016-01-11 22:12:20'),(33,'1000000061','Quìmicos','Alerjia a la penisilina','2016-01-11 22:12:20'),(34,'1000000062','Quìmicos','Alerjia a la penisilina','2016-01-11 22:12:20'),(35,'1000000063','Quìmicos','Alerjia a la penisilina','2016-01-11 22:12:20'),(36,'1000000064','Quìmicos','Alerjia a la penisilina','2016-01-11 22:12:20'),(37,'1000000065','Quìmicos','Alerjia a la penisilina','2016-01-11 22:12:20'),(38,'1000000066','Quìmicos','Alerjia a la penisilina','2016-01-11 22:12:20'),(39,'1000000067','Quìmicos','Alerjia a la penisilina','2016-01-11 22:12:20'),(40,'1000000068','Quìmicos','Alerjia a la penisilina','2016-01-11 22:12:20'),(41,'1000000069','Quìmicos','Alerjia a la penisilina','2016-01-11 22:12:20'),(42,'1000000070','Quìmicos','Alerjia a la penisilina','2016-01-11 22:12:20'),(43,'1000000001','Quìmicos','Operacion de Vesícula','2016-01-11 22:12:20'),(44,'1000000002','Quìmicos','Operacion de Vesícula','2016-01-11 22:12:20'),(45,'1000000003','Quìmicos','Operacion de Vesícula','2016-01-11 22:12:20'),(46,'1000000004','Quìmicos','Operacion de Vesícula','2016-01-11 22:12:20'),(47,'1000000043','Quìmicos','Operacion de Vesícula','2016-01-11 22:12:20'),(48,'1000000051','Quìmicos','Operacion de Vesícula','2016-01-11 22:12:20'),(49,'1000000052','Quìmicos','Operacion de Vesícula','2016-01-11 22:12:20'),(50,'1000000053','Quìmicos','Operacion de Vesícula','2016-01-11 22:12:20'),(51,'1000000054','Quìmicos','Operacion de Vesícula','2016-01-11 22:12:20'),(52,'1000000055','Quìmicos','Operacion de Vesícula','2016-01-11 22:12:20'),(53,'1000000056','Quìmicos','Operacion de Vesícula','2016-01-11 22:12:20'),(54,'1000000057','Quìmicos','Operacion de Vesícula','2016-01-11 22:12:20'),(55,'1000000058','Quìmicos','Operacion de Vesícula','2016-01-11 22:12:20'),(56,'1000000059','Quìmicos','Operacion de Vesícula','2016-01-11 22:12:20'),(57,'1000000060','Quìmicos','Operacion de Vesícula','2016-01-11 22:12:20'),(58,'1000000061','Quìmicos','Operacion de Vesícula','2016-01-11 22:12:20'),(59,'1000000062','Quìmicos','Operacion de Vesícula','2016-01-11 22:12:20'),(60,'1000000063','Quìmicos','Operacion de Vesícula','2016-01-11 22:12:20'),(61,'1000000064','Quìmicos','Operacion de Vesícula','2016-01-11 22:12:20'),(62,'1000000065','Quìmicos','Operacion de Vesícula','2016-01-11 22:12:20'),(63,'1000000066','Quìmicos','Operacion de Vesícula','2016-01-11 22:12:20'),(64,'1000000067','Quìmicos','Operacion de Vesícula','2016-01-11 22:12:20'),(65,'1000000068','Quìmicos','Operacion de Vesícula','2016-01-11 22:12:20'),(66,'1000000069','Quìmicos','Operacion de Vesícula','2016-01-11 22:12:20'),(67,'1000000070','Quìmicos','Operacion de Vesícula','2016-01-11 22:12:20'),(68,'1000000001','Quirúrgicos','Operacion Estética','2016-01-11 22:12:20'),(69,'1000000002','Quirúrgicos','Operacion Estética','2016-01-11 22:12:20'),(70,'1000000003','Quirúrgicos','Operacion Estética','2016-01-11 22:12:20'),(71,'1000000004','Quirúrgicos','Operacion Estética','2016-01-11 22:12:20'),(72,'1000000005','Quirúrgicos','Operacion Estética','2016-01-11 22:12:20'),(73,'1000000006','Quirúrgicos','Operacion Estética','2016-01-11 22:12:20'),(74,'1000000007','Quirúrgicos','Operacion Estética','2016-01-11 22:12:20'),(75,'1000000008','Quirúrgicos','Operacion Estética','2016-01-11 22:12:20'),(76,'1000000009','Quirúrgicos','Operacion Estética','2016-01-11 22:12:20'),(77,'1000000010','Quirúrgicos','Operacion Estética','2016-01-11 22:12:20'),(78,'1000000032','Quirúrgicos','Operacion Estética','2016-01-11 22:12:20'),(79,'1000000033','Quirúrgicos','Operacion Estética','2016-01-11 22:12:20'),(80,'1000000034','Quirúrgicos','Operacion Estética','2016-01-11 22:12:20'),(81,'1000000035','Quirúrgicos','Operacion Estética','2016-01-11 22:12:20'),(82,'1000000036','Quirúrgicos','Operacion Estética','2016-01-11 22:12:20'),(83,'1000000037','Quirúrgicos','Operacion Estética','2016-01-11 22:12:20'),(84,'1000000038','Quirúrgicos','Operacion Estética','2016-01-11 22:12:20'),(85,'1000000039','Quirúrgicos','Operacion Estética','2016-01-11 22:12:20'),(86,'1000000040','Quirúrgicos','Operacion Estética','2016-01-11 22:12:20'),(87,'1000000041','Quirúrgicos','Operacion Estética','2016-01-11 22:12:20'),(88,'1000000042','Quirúrgicos','Operacion Estética','2016-01-11 22:12:20'),(89,'1000000043','Quirúrgicos','Operacion Estética','2016-01-11 22:12:20'),(90,'1000000044','Quirúrgicos','Operacion Estética','2016-01-11 22:12:20'),(91,'1000000056','Quirúrgicos','Operacion Estética','2016-01-11 22:12:20'),(92,'1000000057','Quirúrgicos','Operacion Estética','2016-01-11 22:12:20'),(93,'1000000058','Quirúrgicos','Operacion Estética','2016-01-11 22:12:20'),(94,'1000000059','Quirúrgicos','Operacion Estética','2016-01-11 22:12:20'),(95,'1000000060','Quirúrgicos','Operacion Estética','2016-01-11 22:12:20'),(96,'1000000061','Quirúrgicos','Operacion Estética','2016-01-11 22:12:20'),(97,'1000000062','Quirúrgicos','Operacion Estética','2016-01-11 22:12:20'),(98,'1000000063','Quirúrgicos','Operacion Estética','2016-01-11 22:12:20'),(99,'1000000064','Quirúrgicos','Operacion Estética','2016-01-11 22:12:20'),(100,'1000000065','Quirúrgicos','Operacion Estética','2016-01-11 22:12:20'),(101,'1000000066','Quirúrgicos','Operacion Estética','2016-01-11 22:12:20'),(102,'1000000067','Quirúrgicos','Operacion Estética','2016-01-11 22:12:20'),(103,'1000000068','Quirúrgicos','Operacion Estética','2016-01-11 22:12:20'),(104,'1000000069','Quirúrgicos','Operacion Estética','2016-01-11 22:12:20'),(105,'1000000070','Quirúrgicos','Operacion Estética','2016-01-11 22:12:20'),(106,'1000000001','Patológico','Hepatitis A','2016-01-11 22:12:20'),(107,'1000000002','Patológico','Hepatitis A','2016-01-11 22:12:20'),(108,'1000000003','Patológico','Hepatitis A','2016-01-11 22:12:20'),(109,'1000000004','Patológico','Hepatitis A','2016-01-11 22:12:20'),(110,'1000000005','Patológico','Hepatitis A','2016-01-11 22:12:20'),(111,'1000000006','Patológico','Hepatitis A','2016-01-11 22:12:20'),(112,'1000000007','Patológico','Hepatitis A','2016-01-11 22:12:20'),(113,'1000000008','Patológico','Hepatitis A','2016-01-11 22:12:20'),(114,'1000000009','Patológico','Hepatitis A','2016-01-11 22:12:20'),(115,'1000000010','Patológico','Hepatitis A','2016-01-11 22:12:20'),(116,'1000000011','Patológico','Hepatitis A','2016-01-11 22:12:20'),(117,'1000000012','Patológico','Hepatitis A','2016-01-11 22:12:20'),(118,'1000000013','Patológico','Hepatitis A','2016-01-11 22:12:20'),(119,'1000000014','Patológico','Hepatitis A','2016-01-11 22:12:20'),(120,'1000000015','Patológico','Hepatitis A','2016-01-11 22:12:20'),(121,'1000000016','Patológico','Hepatitis A','2016-01-11 22:12:20'),(122,'1000000017','Patológico','Hepatitis A','2016-01-11 22:12:20'),(123,'1000000018','Patológico','Hepatitis A','2016-01-11 22:12:20'),(124,'1000000019','Patológico','Hepatitis A','2016-01-11 22:12:20'),(125,'1000000020','Patológico','Hepatitis A','2016-01-11 22:12:20'),(126,'1000000021','Patológico','Hepatitis A','2016-01-11 22:12:20'),(127,'1000000022','Patológico','Hepatitis A','2016-01-11 22:12:20'),(128,'1000000051','Patológico','Hepatitis A','2016-01-11 22:12:20'),(129,'1000000052','Patológico','Hepatitis A','2016-01-11 22:12:20'),(130,'1000000053','Patológico','Hepatitis A','2016-01-11 22:12:20'),(131,'1000000054','Patológico','Hepatitis A','2016-01-11 22:12:20'),(132,'1000000055','Patológico','Hepatitis A','2016-01-11 22:12:20'),(133,'1000000056','Patológico','Hepatitis A','2016-01-11 22:12:20'),(134,'1000000057','Patológico','Hepatitis A','2016-01-11 22:12:20'),(135,'1000000058','Patológico','Hepatitis A','2016-01-11 22:12:20'),(136,'1000000059','Patológico','Hepatitis A','2016-01-11 22:12:20'),(137,'1000000060','Patológico','Hepatitis A','2016-01-11 22:12:20'),(138,'1000000061','Patológico','Hepatitis A','2016-01-11 22:12:20'),(139,'1000000062','Patológico','Hepatitis A','2016-01-11 22:12:20'),(140,'1000000063','Patológico','Hepatitis A','2016-01-11 22:12:20'),(141,'1000000064','Patológico','Hepatitis A','2016-01-11 22:12:20'),(142,'1000000065','Patológico','Hepatitis A','2016-01-11 22:12:20'),(143,'1000000066','Patológico','Hepatitis A','2016-01-11 22:12:20'),(144,'1000000067','Patológico','Hepatitis A','2016-01-11 22:12:20'),(145,'1000000068','Patológico','Hepatitis A','2016-01-11 22:12:20'),(146,'1000000069','Patológico','Hepatitis A','2016-01-11 22:12:20'),(147,'1000000070','Patológico','Hepatitis A','2016-01-11 22:12:20'),(148,'1710005750','antecedente nuevo','detalle niebao','2016-01-21 20:28:00');
/*!40000 ALTER TABLE `antecedente` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER ANTECEDENTE_AFTER_INSERT
	AFTER INSERT ON antecedente FOR EACH ROW
	BEGIN
		  -- se ingresa en el log de actividades    
    INSERT INTO `log_user`
	(`accion`, `tabla`,`new_data`)
    VALUES(
    'insert',
    'antecedente',
            CONCAT(NEW.id_antecedente, ';' , NEW.id_paciente, ';' ,
			NEW.tipo, ';' ,NEW.detalle)
    );
	END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER ANTECEDENTE_AFTER_UPDATE
	AFTER UPDATE ON antecedente FOR EACH ROW
	BEGIN
		  -- se ingresa en el log de actividades    
    INSERT INTO `log_user`
	(`accion`, `tabla`, `old_data`,`new_data`)
    VALUES(
    'update',
    'antecedente',
            CONCAT(OLD.id_antecedente, ';' , OLD.id_paciente, ';' ,
			OLD.tipo, ';' ,OLD.detalle),
            CONCAT(NEW.id_antecedente, ';' , NEW.id_paciente, ';' ,
			NEW.tipo, ';' ,NEW.detalle)
    );
	END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER ANTECEDENTE_AFTER_DELETE
	AFTER DELETE ON antecedente FOR EACH ROW
	BEGIN
		  -- se ingresa en el log de actividades    
    INSERT INTO `log_user`
	(`accion`, `tabla`, `old_data`)
    VALUES(
    'delete',
    'antecedente',
            CONCAT(OLD.id_antecedente, ';' , OLD.id_paciente, ';' ,
			OLD.tipo, ';' ,OLD.detalle)
    );
	END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `ci_sessions`
--

DROP TABLE IF EXISTS `ci_sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ci_sessions` (
  `session_id` varchar(40) NOT NULL DEFAULT '0',
  `ip_address` varchar(45) NOT NULL DEFAULT '0',
  `user_agent` varchar(120) NOT NULL,
  `last_activity` int(10) unsigned NOT NULL DEFAULT '0',
  `user_data` text NOT NULL,
  PRIMARY KEY (`session_id`),
  KEY `last_activity_idx` (`last_activity`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ci_sessions`
--

LOCK TABLES `ci_sessions` WRITE;
/*!40000 ALTER TABLE `ci_sessions` DISABLE KEYS */;
INSERT INTO `ci_sessions` VALUES ('1d8b5536b0397df4c0f564fde76e53c4','192.168.0.110','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/47.0.2526.106 Safari/537.36',1453328240,'a:7:{s:9:\"user_data\";s:0:\"\";s:2:\"id\";s:4:\"1000\";s:8:\"username\";s:7:\"eduardo\";s:10:\"first_name\";s:7:\"Eduardo\";s:9:\"last_name\";s:7:\"Villota\";s:5:\"email\";s:21:\"eduardouio7@gmail.com\";s:8:\"logueado\";i:1;}'),('9038d4c403a1a05bfcd2e8b928006b05','192.168.0.110','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/47.0.2526.106 Safari/537.36',1453150229,'a:7:{s:9:\"user_data\";s:0:\"\";s:2:\"id\";s:4:\"1000\";s:8:\"username\";s:7:\"eduardo\";s:10:\"first_name\";s:7:\"Eduardo\";s:9:\"last_name\";s:7:\"Villota\";s:5:\"email\";s:21:\"eduardouio7@gmail.com\";s:8:\"logueado\";i:1;}'),('93c3ab3c4a99b68df4180ce468ea2962','192.168.0.110','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/47.0.2526.106 Safari/537.36',1452981814,'a:7:{s:9:\"user_data\";s:0:\"\";s:2:\"id\";s:4:\"1000\";s:8:\"username\";s:7:\"eduardo\";s:10:\"first_name\";s:7:\"Eduardo\";s:9:\"last_name\";s:7:\"Villota\";s:5:\"email\";s:21:\"eduardouio7@gmail.com\";s:8:\"logueado\";i:1;}'),('a967845b910dbc62c92258caac7ca452','192.168.0.110','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/47.0.2526.106 Safari/537.36',1453299522,'a:7:{s:9:\"user_data\";s:0:\"\";s:2:\"id\";s:4:\"1000\";s:8:\"username\";s:7:\"eduardo\";s:10:\"first_name\";s:7:\"Eduardo\";s:9:\"last_name\";s:7:\"Villota\";s:5:\"email\";s:21:\"eduardouio7@gmail.com\";s:8:\"logueado\";i:1;}');
/*!40000 ALTER TABLE `ci_sessions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cliente`
--

DROP TABLE IF EXISTS `cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cliente` (
  `id_cliente` char(13) NOT NULL,
  `nombres` varchar(40) NOT NULL,
  `telefono` varchar(10) NOT NULL,
  `direccion` varchar(120) NOT NULL,
  `creado` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_cliente`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cliente`
--

LOCK TABLES `cliente` WRITE;
/*!40000 ALTER TABLE `cliente` DISABLE KEYS */;
INSERT INTO `cliente` VALUES ('0896775410','Juan Lopez Obrador','0995987546','La floresta. Av. Humberto de angulo y 12 de Enero, caba blanca','2016-01-21 17:41:10'),('1711254011','Juan Pablo Segundo','0987805410','Av. Cristobal Colon e4-412 y Amazonas Edf Arista Piso 5','2016-01-21 18:02:10'),('7777777777','Luis Tumipanba','0998740124','la provicia de guano','2016-01-21 20:34:34');
/*!40000 ALTER TABLE `cliente` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER CLIENTE_AFTER_INSERT
	AFTER INSERT ON cliente FOR EACH ROW
	BEGIN
		  -- se ingresa en el log de actividades    
    INSERT INTO `log_user`
	(`accion`, `tabla`, `new_data`)
    VALUES(
    'insert',
    'cliente',
            CONCAT(NEW.id_cliente, ';' , NEW.nombres, ';' ,
			NEW.telefono, ';' ,NEW.direccion)
    );
	END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER CLIENTE_AFTER_UPDATE
	AFTER UPDATE ON cliente FOR EACH ROW
	BEGIN
		  -- se ingresa en el log de actividades    
    INSERT INTO `log_user`
	(`accion`, `tabla`, `old_data`, `new_data`)
    VALUES(
    'update',
    'cliente',
			CONCAT(OLD.id_cliente, ';' , OLD.nombres, ';' ,
			OLD.telefono, ';' ,OLD.direccion),
            CONCAT(NEW.id_cliente, ';' , NEW.nombres, ';' ,
			NEW.telefono, ';' ,NEW.direccion)
    );
	END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER CLIENTE_AFTER_DELETE
	AFTER DELETE ON cliente FOR EACH ROW
	BEGIN
		  -- se ingresa en el log de actividades    
    INSERT INTO `log_user`
	(`accion`, `tabla`, `old_data`)
    VALUES(
    'delete',
    'cliente',
            CONCAT(OLD.id_cliente, ';' , OLD.nombres, ';' ,
			OLD.telefono, ';' ,OLD.direccion)
    );
	END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `cobro`
--

DROP TABLE IF EXISTS `cobro`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cobro` (
  `id_cobro` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `id_factura` smallint(5) unsigned NOT NULL,
  `tipo` varchar(45) NOT NULL,
  `fecha` varchar(45) NOT NULL,
  `banco` varchar(45) DEFAULT NULL,
  `nro_cheque` varchar(45) DEFAULT NULL,
  `nro_deposito` varchar(45) DEFAULT NULL,
  `valor` varchar(45) NOT NULL,
  `registro` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_cobro`),
  UNIQUE KEY `id_factura` (`id_factura`),
  CONSTRAINT `FK_COBRO_FACTURA` FOREIGN KEY (`id_factura`) REFERENCES `factura` (`id_factura`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cobro`
--

LOCK TABLES `cobro` WRITE;
/*!40000 ALTER TABLE `cobro` DISABLE KEYS */;
/*!40000 ALTER TABLE `cobro` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER COBRO_AFTER_INSERT
	AFTER INSERT ON cobro FOR EACH ROW
	BEGIN
		  -- se ingresa en el log de actividades    
    INSERT INTO `log_user`
	(`accion`, `tabla`, `new_data`)
    VALUES(
    'insert',
    'cobro',
            CONCAT(NEW.tipo, ';' , NEW.fecha, ';' ,
			NEW.banco, ';' ,NEW.valor, ';' ,NEW.nro_deposito)
    );
	END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER COBRO_AFTER_UPDATE
	AFTER UPDATE ON cobro FOR EACH ROW
	BEGIN
		  -- se ingresa en el log de actividades    
    INSERT INTO `log_user`
	(`accion`, `tabla`, `old_data`, `new_data`)
    VALUES(
    'update',
    'cobro',
			CONCAT(OLD.tipo, ';' , OLD.fecha, ';' ,
			OLD.banco, ';' ,OLD.valor, ';' ,OLD.nro_deposito),
            CONCAT(NEW.tipo, ';' , NEW.fecha, ';' ,
			NEW.banco, ';' ,NEW.valor, ';' ,NEW.nro_deposito)
    );
	END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER COBRO_AFTER_DELETE
	AFTER DELETE ON cobro FOR EACH ROW
	BEGIN
		  -- se ingresa en el log de actividades    
    INSERT INTO `log_user`
	(`accion`, `tabla`, `old_data`)
    VALUES(
    'delete',
    'cobro',
			CONCAT(OLD.tipo, ';' , OLD.fecha, ';' ,
			OLD.banco, ';' ,OLD.valor, ';' ,OLD.nro_deposito)
    );
	END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `equipo`
--

DROP TABLE IF EXISTS `equipo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `equipo` (
  `id_equipo` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) DEFAULT NULL,
  `nro_serie` varchar(45) DEFAULT NULL,
  `marca` varchar(45) DEFAULT NULL,
  `modelo` varchar(45) DEFAULT NULL,
  `notas` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`id_equipo`)
) ENGINE=InnoDB AUTO_INCREMENT=2001 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `equipo`
--

LOCK TABLES `equipo` WRITE;
/*!40000 ALTER TABLE `equipo` DISABLE KEYS */;
INSERT INTO `equipo` VALUES (1000,'Camara Hiperbarica Nueva','1111111111','OXY','2011',NULL),(2000,'CAMARA NUEVA','222222','OXO','2012',NULL);
/*!40000 ALTER TABLE `equipo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `factura`
--

DROP TABLE IF EXISTS `factura`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
  CONSTRAINT `fk_factura_cliente` FOREIGN KEY (`id_cliente`) REFERENCES `cliente` (`id_cliente`) ON UPDATE CASCADE,
  CONSTRAINT `fk_factura_tratamiento` FOREIGN KEY (`id_tratamiento`) REFERENCES `tratamiento` (`id_tratamiento`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `factura`
--

LOCK TABLES `factura` WRITE;
/*!40000 ALTER TABLE `factura` DISABLE KEYS */;
/*!40000 ALTER TABLE `factura` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `historia`
--

DROP TABLE IF EXISTS `historia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
) ENGINE=InnoDB AUTO_INCREMENT=89 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `historia`
--

LOCK TABLES `historia` WRITE;
/*!40000 ALTER TABLE `historia` DISABLE KEYS */;
INSERT INTO `historia` VALUES (5,'0801916529','Shirley Quinoñez Prado','0000000000','1975-07-07','sinmail','Quito','','','','','','Infinito','1.30 H','2015-07-13 19:19:36'),(84,'0896775410','Juan Lopez Obrador','0995987546','1950-12-30','jlobruio7@andinanet.net','La floresta. Av. Humberto de angulo y 12 de Enero, caba blanca','Dr. Pers Erazo','092645684',NULL,NULL,NULL,NULL,NULL,'2016-01-21 17:41:10'),(13,'1000000000','David Villacres','0999875001','2011-01-01','juan@aol.com','La comuna',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2016-01-11 22:04:10'),(14,'1000000001','Maria Ceibos','0999875001','2011-01-01','juan@aol.com','La comuna',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2016-01-11 22:04:10'),(15,'1000000002','Vanessa Arce','0999875001','2011-01-01','juan@aol.com','La comuna',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2016-01-11 22:04:10'),(16,'1000000003','David Orellana','0999875001','2011-01-01','juan@aol.com','La comuna',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2016-01-11 22:04:10'),(17,'1000000004','Patricio Villacis','0999875001','2011-01-01','juan@aol.com','La comuna',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2016-01-11 22:04:10'),(18,'1000000005','Liliana Lugmania','0999875001','2011-01-01','juan@aol.com','La comuna',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2016-01-11 22:04:10'),(19,'1000000006','Galo Sinchiguano','0999875001','2011-01-01','juan@aol.com','La comuna',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2016-01-11 22:04:10'),(20,'1000000007','Marco Llumiquinga','0999875001','2011-01-01','juan@aol.com','La comuna',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2016-01-11 22:04:10'),(21,'1000000008','Armando Hoyos','0999875001','2011-01-01','juan@aol.com','La comuna',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2016-01-11 22:04:10'),(22,'1000000009','Armando Huilcapi','0999875001','2011-01-01','juan@aol.com','La comuna',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2016-01-11 22:04:10'),(23,'1000000010','Alexandra Caiza','0999875001','2011-01-01','juan@aol.com','La comuna',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2016-01-11 22:04:10'),(24,'1000000011','Karla Ortega','0999875001','2011-01-01','juan@aol.com','La comuna',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2016-01-11 22:04:10'),(25,'1000000012','Karen Villacorte','0999875001','2011-01-01','juan@aol.com','La comuna',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2016-01-11 22:04:10'),(26,'1000000013','Diana Morelos','0999875001','2011-01-01','juan@aol.com','La comuna',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2016-01-11 22:04:10'),(27,'1000000014','Benito Juarez','0999875001','2011-01-01','juan@aol.com','La comuna',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2016-01-11 22:04:10'),(28,'1000000015','Cristobal Meneses','0999875001','2011-01-01','juan@aol.com','La comuna',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2016-01-11 22:04:10'),(29,'1000000016','Gustavo Vaca Soto','0999875001','2011-01-01','juan@aol.com','La comuna',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2016-01-11 22:04:10'),(30,'1000000017','Andrea Lincango','0999875001','2011-01-01','juan@aol.com','La comuna',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2016-01-11 22:04:10'),(31,'1000000018','Pedro Navaja','0999875001','2011-01-01','juan@aol.com','La comuna',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2016-01-11 22:04:10'),(32,'1000000019','Manuel Lopez','0999875001','2011-01-01','juan@aol.com','La comuna',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2016-01-11 22:04:10'),(33,'1000000020','Sofia Chicaiza','0999875001','2011-01-01','juan@aol.com','La comuna',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2016-01-11 22:04:10'),(34,'1000000021','Marlene Montesdeoca','0999875001','2011-01-01','juan@aol.com','La comuna',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2016-01-11 22:04:10'),(35,'1000000022','Karina Davila','0999875001','2011-01-01','juan@aol.com','La comuna',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2016-01-11 22:04:10'),(36,'1000000023','Carmen Montenegro','0999875001','2011-01-01','juan@aol.com','La comuna',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2016-01-11 22:04:10'),(37,'1000000024','Aida Llumiquinga','0999875001','2011-01-01','juan@aol.com','La comuna',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2016-01-11 22:04:10'),(38,'1000000025','Luis Vaca','0999875001','2011-01-01','juan@aol.com','La comuna',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2016-01-11 22:04:10'),(39,'1000000026','Marco Guamani','0999875001','2011-01-01','juan@aol.com','La comuna',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2016-01-11 22:04:10'),(40,'1000000027','Jorge Nieto','0999875001','2011-01-01','juan@aol.com','La comuna',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2016-01-11 22:04:10'),(41,'1000000028','Jorge Villota','0999875001','2011-01-01','juan@aol.com','La comuna',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2016-01-11 22:04:10'),(42,'1000000029','Andrea Laica','0999875001','2011-01-01','juan@aol.com','La comuna',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2016-01-11 22:04:10'),(43,'1000000030','Adriana Lopez','0999875001','2011-01-01','juan@aol.com','La comuna',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2016-01-11 22:04:10'),(44,'1000000031','Paola Vega','0999875001','2011-01-01','juan@aol.com','La comuna',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2016-01-11 22:04:10'),(45,'1000000032','Clara Hernandez','0999875001','2011-01-01','juan@aol.com','La comuna',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2016-01-11 22:04:10'),(46,'1000000033','Cersar Hidalgo','0999875001','2011-01-01','juan@aol.com','La comuna',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2016-01-11 22:04:10'),(47,'1000000034','Juan Pablo Montenegro','0999875001','2011-01-01','juan@aol.com','La comuna',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2016-01-11 22:04:10'),(48,'1000000035','Luis Perez','0999875001','2011-01-01','juan@aol.com','La comuna',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2016-01-11 22:04:10'),(49,'1000000036','Paola Vasquez','0999875001','2011-01-01','juan@aol.com','La comuna',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2016-01-11 22:04:10'),(50,'1000000037','Adriana Montoya','0999875001','2011-01-01','juan@aol.com','La comuna',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2016-01-11 22:04:10'),(51,'1000000038','Juan Montoya','0999875001','2011-01-01','juan@aol.com','La comuna',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2016-01-11 22:04:10'),(52,'1000000039','Elena Vasquez','0999875001','2011-01-01','juan@aol.com','La comuna',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2016-01-11 22:04:10'),(53,'1000000040','Anibal Cañisares','0999875001','2011-01-01','juan@aol.com','La comuna',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2016-01-11 22:04:10'),(54,'1000000041','Manuela Olivos','0999875001','2011-01-01','juan@aol.com','La comuna',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2016-01-11 22:04:10'),(55,'1000000042','Juan Montalvo','0999875001','2011-01-01','juan@aol.com','La comuna',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2016-01-11 22:04:10'),(56,'1000000043','Pamela Hidalgo','0999875001','2011-01-01','juan@aol.com','La comuna',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2016-01-11 22:04:10'),(57,'1000000044','Stalin Cando','0999875001','2011-01-01','juan@aol.com','La comuna',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2016-01-11 22:04:10'),(58,'1000000045','Federico Gonzalez','0999875001','2011-01-01','juan@aol.com','La comuna',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2016-01-11 22:04:10'),(59,'1000000046','Pedro Pilay','0999875001','2011-01-01','juan@aol.com','La comuna',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2016-01-11 22:04:10'),(60,'1000000047','Patricia Obando','0999875001','2011-01-01','juan@aol.com','La comuna',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2016-01-11 22:04:10'),(61,'1000000048','Carlos Villota','0999875001','2011-01-01','juan@aol.com','La comuna',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2016-01-11 22:04:10'),(62,'1000000049','Adriana Recalde','0999875001','2011-01-01','juan@aol.com','La comuna',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2016-01-11 22:04:10'),(63,'1000000050','Vanesa Catagña','0999875001','2011-01-01','juan@aol.com','La comuna',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2016-01-11 22:04:10'),(64,'1000000051','Israles Villacres','0999875001','2011-01-01','juan@aol.com','La comuna',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2016-01-11 22:04:10'),(65,'1000000052','Amanda Toro','0999875001','2011-01-01','juan@aol.com','La comuna',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2016-01-11 22:04:10'),(66,'1000000053','Luis Armando Lopez','0999875001','2011-01-01','juan@aol.com','La comuna',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2016-01-11 22:04:10'),(67,'1000000054','Alfonso Armendaris','0999875001','2011-01-01','juan@aol.com','La comuna',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2016-01-11 22:04:10'),(68,'1000000055','Adrian Gutierres','0999875001','2011-01-01','juan@aol.com','La comuna',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2016-01-11 22:04:10'),(69,'1000000056','Rafael Lincango','0999875001','2011-01-01','juan@aol.com','La comuna',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2016-01-11 22:04:10'),(70,'1000000057','Juanita Guerra','0999875001','2011-01-01','juan@aol.com','La comuna',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2016-01-11 22:04:10'),(71,'1000000058','Lady Mueses','0999875001','2011-01-01','juan@aol.com','La comuna',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2016-01-11 22:04:10'),(72,'1000000059','Kimberly Sisalema','0999875001','2011-01-01','juan@aol.com','La comuna',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2016-01-11 22:04:10'),(73,'1000000060','Guadalupe Montenegro','0999875001','2011-01-01','juan@aol.com','La comuna',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2016-01-11 22:04:10'),(74,'1000000061','Cersar Pita','0999875001','2011-01-01','juan@aol.com','La comuna',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2016-01-11 22:04:10'),(75,'1000000062','Valerie Vaca','0999875001','2011-01-01','juan@aol.com','La comuna',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2016-01-11 22:04:10'),(76,'1000000063','Samantha Hidalgo','0999875001','2011-01-01','juan@aol.com','La comuna',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2016-01-11 22:04:10'),(77,'1000000064','Juan Correa','0999875001','2011-01-01','juan@aol.com','La comuna',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2016-01-11 22:04:10'),(78,'1000000065','Miriam Chango','0999875001','2011-01-01','juan@aol.com','La comuna',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2016-01-11 22:04:10'),(79,'1000000066','Liliana Chamorro','0999875001','2011-01-01','juan@aol.com','La comuna',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2016-01-11 22:04:10'),(80,'1000000067','Tatiana Moncayo','0999875001','2011-01-01','juan@aol.com','La comuna',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2016-01-11 22:04:10'),(81,'1000000068','Anibal Caceres','0999875001','2011-01-01','juan@aol.com','La comuna',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2016-01-11 22:04:10'),(82,'1000000069','Santiago Muzo','0999875001','2011-01-01','juan@aol.com','La comuna',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2016-01-11 22:04:10'),(83,'1000000070','Doris Montenegro','0999875001','2011-01-01','juan@aol.com','La comuna',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2016-01-11 22:04:10'),(12,'1111111111','Juan Ortega','098754152','2011-01-01','juan@aol.com','La comuna','',NULL,NULL,NULL,NULL,NULL,NULL,'2016-01-11 21:45:50'),(3,'1704968388','Pilar Patricia Arboleda Segovia','2803153','1957-06-11','sinmail','Quito','','','','','','Hidrodinamica Estobia : T/a 110/80 : Otras Cosas Mas: Una Cosa Adicional','Se Recomienda 25 Sesiones','2015-07-13 19:03:37'),(2,'1710005750','Granda Darquea Francisco Javier','0998648089','1977-03-02','sinmail','Torre San Isisdro','','','','','','Alguna Cosa','Camara Hiperbarica','2015-07-13 18:56:38'),(4,'1710019611','Jorge Yanez Romero','0992004511','1972-07-12','jorgeyanezjr@hotmail.com','Quito, Quiroz S95','Casa','02261747','','','','Algo Mas','30/60t30 2.75-3ama','2015-07-13 19:15:10'),(1,'1722919725','Eduardo Villota','0992936569','2011-02-01','eduardouio7@gmail.com','Quito, Colon E4-412 Y Amazonas','Eduardo Villota','','','','','90*100','Este Es El Manejo','2015-07-09 19:44:58'),(88,'7777777777','Luis Tumipanba','0998740124','1959-05-07','juanit@gmail.com','la provicia de guano',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2016-01-21 20:34:34');
/*!40000 ALTER TABLE `historia` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `HISTORIA_AFTER_INSERT` 
	AFTER INSERT ON `historia` FOR EACH ROW
BEGIN
	-- crea el registro para cliente, para facilitar la facturacion
	INSERT INTO `cliente`
	(`id_cliente`,`nombres`,`telefono`,`direccion`)
	VALUES
	(NEW.id_paciente, NEW.nombres,NEW.telefono,NEW.direccion);
    
    -- se ingresa en el log de actividades
    
    INSERT INTO `log_user`
	(`accion`, `tabla`, `new_data`)
    VALUES(
    'insert',
    'historia',
    CONCAT(NEW.id_paciente, NEW.nombres,NEW.telefono,NEW.direccion)
    );

END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER HISTORIA_AFTER_UPDATE
	AFTER UPDATE ON historia FOR EACH ROW
BEGIN
	    -- se ingresa en el log de actividades    
    INSERT INTO `log_user`
	(`accion`, `tabla`, `old_data`, `new_data`)
    VALUES(
    'update',
    'historia',
    CONCAT(OLD.id_paciente, ';' , OLD.nombres, ';' ,OLD.telefono, ';' ,OLD.direccion),
    CONCAT(NEW.id_paciente, ';' , NEW.nombres, ';' ,NEW.telefono, ';' ,NEW.direccion)
    );
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER HISTORIA_BEFORE_UPDATE
	BEFORE DELETE ON historia FOR EACH ROW
BEGIN
	    -- se ingresa en el log de actividades    
    INSERT INTO `log_user`
	(`accion`, `tabla`, `old_data`)
    VALUES(
    'update',
    'historia',
    CONCAT(OLD.id_paciente, ';' , OLD.nombres, ';' ,OLD.telefono, ';' ,OLD.direccion)
    );
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `log_user`
--

DROP TABLE IF EXISTS `log_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `log_user` (
  `id_log` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `accion` varchar(45) NOT NULL,
  `tabla` varchar(45) NOT NULL,
  `old_data` varchar(1000) DEFAULT NULL,
  `new_data` varchar(1000) DEFAULT NULL,
  `fecha` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_log`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `log_user`
--

LOCK TABLES `log_user` WRITE;
/*!40000 ALTER TABLE `log_user` DISABLE KEYS */;
INSERT INTO `log_user` VALUES (1,'insert','historia',NULL,'1711254011Juan Pablo0987805410Av. Cristobal Colon e4-412 y Amazonas Edf Arista Piso 5','2016-01-21 18:02:10'),(2,'update','historia','1000000007;MArco Llumiquinga;0999875001;La comuna','1000000007;Marco Llumiquinga;0999875001;La comuna','2016-01-21 18:15:04'),(3,'update','historia','1711254011;Juan Pablo;0987805410;Av. Cristobal Colon e4-412 y Amazonas Edf Arista Piso 5',NULL,'2016-01-21 18:49:30'),(4,'update','tratamiento','147;1000000032;9;Tratamiento Post Operatorio;0.00','147;1000000032;9;Tratamiento Post Operatorio Cascada;0.00','2016-01-21 20:13:01'),(5,'insert','tratamiento',NULL,'148;1722919725;9;Tratamientos de Prueba;200.00','2016-01-21 20:15:49'),(6,'update','tratamiento',NULL,'148;1722919725;9;Tratamientos de Prueba;200.00','2016-01-21 20:16:27'),(7,'delete','antecedente','27;1000000055;Quìmicos;Alerjia a la penisilina',NULL,'2016-01-21 20:26:55'),(8,'update','antecedente','24;1000000052;Quìmicos;Alerjia a la penisilina','24;1000000052;Quìmicos;Alerjia a la penisilina Tipo 2','2016-01-21 20:27:06'),(9,'insert','antecedente',NULL,'148;1710005750;antecedente nuevo;detalle niebao','2016-01-21 20:28:00'),(10,'insert','cliente',NULL,'1254007701;Luis Tumbao;022254541;Av. la gasca O-e 214 y Av. universitaria','2016-01-21 20:32:59'),(11,'update','cliente','1711254011;Juan Pablo;0987805410;Av. Cristobal Colon e4-412 y Amazonas Edf Arista Piso 5','1711254011;Juan Pablo Segundo;0987805410;Av. Cristobal Colon e4-412 y Amazonas Edf Arista Piso 5','2016-01-21 20:33:08'),(12,'delete','cliente','1254007701;Luis Tumbao;022254541;Av. la gasca O-e 214 y Av. universitaria',NULL,'2016-01-21 20:33:15'),(13,'insert','cliente',NULL,'7777777777;Luis Tumipanba;0998740124;la provicia de guano','2016-01-21 20:34:34'),(14,'insert','historia',NULL,'7777777777Luis Tumipanba0998740124la provicia de guano','2016-01-21 20:34:34'),(15,'insert','sesion',NULL,NULL,'2016-01-21 20:41:03'),(16,'update','sesion',NULL,'1837463527;139;2012-06-01;10:00:00;Notas adicionales','2016-01-21 20:41:27'),(17,'delete','sesion',NULL,NULL,'2016-01-21 20:41:34'),(18,'update','sesion',NULL,NULL,'2016-01-21 20:45:27');
/*!40000 ALTER TABLE `log_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `personal`
--

DROP TABLE IF EXISTS `personal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `personal`
--

LOCK TABLES `personal` WRITE;
/*!40000 ALTER TABLE `personal` DISABLE KEYS */;
INSERT INTO `personal` VALUES ('1823533946','Bolivar Hernandez','Medico Tratante','La Marsical, Colon y Amazonas','0238475646','0987547654','hernabdes2344@yahoo.es',NULL,'2015-07-22 21:23:03'),('1837463527','Dr. Ivan Cardenas','Medico Tratante','La Pulida calle e y Mariana de JEsus','0233322432','0987654326','ivandando@hotmail.com','Atienede de lunes a viernes','0000-00-00 00:00:00'),('1928661524','Dr. Juan Castro','Asistente','La Recoleta calle 25 de septiembre OE12-54','023453566','0986527853','jcastro@gmail.com','atiende solo sabados','0000-00-00 00:00:00');
/*!40000 ALTER TABLE `personal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sesion`
--

DROP TABLE IF EXISTS `sesion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
  CONSTRAINT `FK_SESION_EQUIPO` FOREIGN KEY (`id_equipo`) REFERENCES `equipo` (`id_equipo`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `FK_SESION_PERSONAL` FOREIGN KEY (`id_personal`) REFERENCES `personal` (`id_personal`) ON UPDATE CASCADE,
  CONSTRAINT `FK_SESION_TRATAMIENTO` FOREIGN KEY (`id_tratamiento`) REFERENCES `tratamiento` (`id_tratamiento`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=483 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sesion`
--

LOCK TABLES `sesion` WRITE;
/*!40000 ALTER TABLE `sesion` DISABLE KEYS */;
INSERT INTO `sesion` VALUES (1,'1837463527',3,1000,'2011-10-01 00:00:00',NULL,'2016-01-11 22:23:42'),(2,'1837463527',3,1000,'2011-10-01 00:00:00',NULL,'2016-01-11 22:23:55'),(3,'1837463527',3,1000,'2011-10-01 00:00:00',NULL,'2016-01-11 22:25:40'),(4,'1837463527',3,1000,'2011-11-02 00:00:00',NULL,'2016-01-11 22:25:40'),(5,'1837463527',4,1000,'2011-11-02 00:00:00',NULL,'2016-01-11 22:25:40'),(6,'1837463527',5,1000,'2011-11-02 00:00:00',NULL,'2016-01-11 22:25:40'),(7,'1837463527',6,1000,'2011-11-02 00:00:00',NULL,'2016-01-11 22:25:40'),(8,'1837463527',7,1000,'2011-11-02 00:00:00',NULL,'2016-01-11 22:25:40'),(9,'1837463527',8,1000,'2011-11-02 00:00:00',NULL,'2016-01-11 22:25:40'),(10,'1837463527',10,1000,'2011-11-02 00:00:00',NULL,'2016-01-11 22:25:40'),(11,'1837463527',11,1000,'2011-11-02 00:00:00',NULL,'2016-01-11 22:25:40'),(12,'1837463527',12,1000,'2011-11-02 00:00:00',NULL,'2016-01-11 22:25:40'),(13,'1837463527',15,1000,'2011-11-02 00:00:00',NULL,'2016-01-11 22:25:40'),(14,'1837463527',16,1000,'2011-11-02 00:00:00',NULL,'2016-01-11 22:25:40'),(15,'1837463527',17,1000,'2011-11-02 00:00:00',NULL,'2016-01-11 22:25:40'),(16,'1837463527',18,1000,'2011-11-02 00:00:00',NULL,'2016-01-11 22:25:40'),(17,'1837463527',19,1000,'2011-11-02 00:00:00',NULL,'2016-01-11 22:25:40'),(18,'1837463527',20,1000,'2011-11-02 00:00:00',NULL,'2016-01-11 22:25:40'),(19,'1837463527',22,1000,'2011-11-02 00:00:00',NULL,'2016-01-11 22:25:40'),(20,'1837463527',23,1000,'2011-11-02 00:00:00',NULL,'2016-01-11 22:25:40'),(21,'1837463527',25,1000,'2011-11-02 00:00:00',NULL,'2016-01-11 22:25:40'),(22,'1837463527',26,1000,'2011-11-02 00:00:00',NULL,'2016-01-11 22:25:40'),(23,'1837463527',28,1000,'2011-11-02 00:00:00',NULL,'2016-01-11 22:25:40'),(24,'1837463527',29,1000,'2011-11-02 00:00:00',NULL,'2016-01-11 22:25:40'),(25,'1837463527',30,1000,'2011-11-02 00:00:00',NULL,'2016-01-11 22:25:40'),(26,'1837463527',31,1000,'2011-11-02 00:00:00',NULL,'2016-01-11 22:25:40'),(27,'1837463527',33,1000,'2011-11-02 00:00:00',NULL,'2016-01-11 22:25:40'),(28,'1837463527',34,1000,'2011-11-02 00:00:00',NULL,'2016-01-11 22:25:40'),(29,'1837463527',35,1000,'2011-11-02 00:00:00',NULL,'2016-01-11 22:25:40'),(30,'1837463527',37,1000,'2011-11-02 00:00:00',NULL,'2016-01-11 22:25:40'),(31,'1837463527',38,1000,'2011-11-02 00:00:00',NULL,'2016-01-11 22:25:40'),(32,'1837463527',39,1000,'2011-11-02 00:00:00',NULL,'2016-01-11 22:25:40'),(33,'1837463527',40,1000,'2011-11-02 00:00:00',NULL,'2016-01-11 22:25:40'),(34,'1837463527',41,1000,'2011-11-02 00:00:00',NULL,'2016-01-11 22:25:40'),(35,'1837463527',42,1000,'2011-11-02 00:00:00',NULL,'2016-01-11 22:25:40'),(36,'1837463527',43,1000,'2011-11-02 00:00:00',NULL,'2016-01-11 22:25:40'),(37,'1837463527',44,1000,'2011-11-02 00:00:00',NULL,'2016-01-11 22:25:40'),(38,'1837463527',45,1000,'2011-11-02 00:00:00',NULL,'2016-01-11 22:25:40'),(39,'1837463527',47,1000,'2011-11-02 00:00:00',NULL,'2016-01-11 22:25:40'),(40,'1837463527',48,1000,'2011-11-02 00:00:00',NULL,'2016-01-11 22:25:40'),(41,'1837463527',50,1000,'2011-11-02 00:00:00',NULL,'2016-01-11 22:25:40'),(42,'1837463527',51,1000,'2011-11-02 00:00:00',NULL,'2016-01-11 22:25:40'),(43,'1837463527',52,1000,'2011-11-02 00:00:00',NULL,'2016-01-11 22:25:40'),(44,'1837463527',53,1000,'2011-11-02 00:00:00',NULL,'2016-01-11 22:25:40'),(45,'1837463527',54,1000,'2011-11-02 00:00:00',NULL,'2016-01-11 22:25:40'),(46,'1837463527',55,1000,'2011-11-02 00:00:00',NULL,'2016-01-11 22:25:40'),(47,'1837463527',56,1000,'2011-11-02 00:00:00',NULL,'2016-01-11 22:25:40'),(48,'1837463527',57,1000,'2011-11-02 00:00:00',NULL,'2016-01-11 22:25:40'),(49,'1837463527',58,1000,'2011-11-02 00:00:00',NULL,'2016-01-11 22:25:40'),(50,'1837463527',59,1000,'2011-11-02 00:00:00',NULL,'2016-01-11 22:25:40'),(51,'1837463527',60,1000,'2011-11-02 00:00:00',NULL,'2016-01-11 22:25:40'),(52,'1837463527',61,1000,'2011-11-02 00:00:00',NULL,'2016-01-11 22:25:40'),(53,'1837463527',62,1000,'2011-11-02 00:00:00',NULL,'2016-01-11 22:25:40'),(54,'1837463527',63,1000,'2011-11-02 00:00:00',NULL,'2016-01-11 22:25:40'),(55,'1837463527',64,1000,'2011-11-02 00:00:00',NULL,'2016-01-11 22:25:40'),(56,'1837463527',65,1000,'2011-11-02 00:00:00',NULL,'2016-01-11 22:25:40'),(57,'1837463527',66,1000,'2011-11-02 00:00:00',NULL,'2016-01-11 22:25:40'),(58,'1837463527',67,1000,'2011-11-02 00:00:00',NULL,'2016-01-11 22:25:40'),(59,'1837463527',68,1000,'2011-11-02 00:00:00',NULL,'2016-01-11 22:25:40'),(60,'1837463527',69,1000,'2011-11-02 00:00:00',NULL,'2016-01-11 22:25:40'),(61,'1837463527',71,1000,'2011-11-02 00:00:00',NULL,'2016-01-11 22:25:40'),(62,'1837463527',72,1000,'2011-11-02 00:00:00',NULL,'2016-01-11 22:25:40'),(63,'1837463527',74,1000,'2011-11-02 00:00:00',NULL,'2016-01-11 22:25:40'),(64,'1837463527',75,1000,'2011-11-02 00:00:00',NULL,'2016-01-11 22:25:40'),(65,'1837463527',76,1000,'2011-11-02 00:00:00',NULL,'2016-01-11 22:25:40'),(66,'1837463527',77,1000,'2011-11-02 00:00:00',NULL,'2016-01-11 22:25:40'),(67,'1837463527',78,1000,'2011-11-02 00:00:00',NULL,'2016-01-11 22:25:40'),(68,'1837463527',79,1000,'2011-11-02 00:00:00',NULL,'2016-01-11 22:25:40'),(69,'1837463527',80,1000,'2011-11-02 00:00:00',NULL,'2016-01-11 22:25:40'),(70,'1837463527',81,1000,'2011-11-02 00:00:00',NULL,'2016-01-11 22:25:40'),(71,'1837463527',84,1000,'2011-11-02 00:00:00',NULL,'2016-01-11 22:25:40'),(72,'1837463527',85,1000,'2011-11-02 00:00:00',NULL,'2016-01-11 22:25:40'),(73,'1837463527',86,1000,'2011-11-02 00:00:00',NULL,'2016-01-11 22:25:40'),(74,'1837463527',87,1000,'2011-11-02 00:00:00',NULL,'2016-01-11 22:25:40'),(75,'1837463527',88,1000,'2011-11-02 00:00:00',NULL,'2016-01-11 22:25:40'),(76,'1837463527',89,1000,'2011-11-02 00:00:00',NULL,'2016-01-11 22:25:40'),(77,'1837463527',90,1000,'2011-11-02 00:00:00',NULL,'2016-01-11 22:25:40'),(78,'1837463527',91,1000,'2011-11-02 00:00:00',NULL,'2016-01-11 22:25:40'),(79,'1837463527',92,1000,'2011-11-02 00:00:00',NULL,'2016-01-11 22:25:40'),(80,'1837463527',93,1000,'2011-11-02 00:00:00',NULL,'2016-01-11 22:25:40'),(81,'1837463527',95,1000,'2011-11-02 00:00:00',NULL,'2016-01-11 22:25:40'),(82,'1837463527',96,1000,'2011-11-02 00:00:00',NULL,'2016-01-11 22:25:40'),(83,'1837463527',97,1000,'2011-11-02 00:00:00',NULL,'2016-01-11 22:25:40'),(84,'1837463527',98,1000,'2011-11-02 00:00:00',NULL,'2016-01-11 22:25:40'),(85,'1837463527',99,1000,'2011-11-02 00:00:00',NULL,'2016-01-11 22:25:40'),(86,'1837463527',100,1000,'2011-11-02 00:00:00',NULL,'2016-01-11 22:25:40'),(87,'1837463527',101,1000,'2011-11-02 00:00:00',NULL,'2016-01-11 22:25:40'),(88,'1837463527',102,1000,'2011-11-02 00:00:00',NULL,'2016-01-11 22:25:40'),(89,'1837463527',103,1000,'2011-11-02 00:00:00',NULL,'2016-01-11 22:25:40'),(90,'1837463527',104,1000,'2011-11-02 00:00:00',NULL,'2016-01-11 22:25:40'),(91,'1837463527',105,1000,'2011-11-02 00:00:00',NULL,'2016-01-11 22:25:40'),(92,'1837463527',106,1000,'2011-11-02 00:00:00',NULL,'2016-01-11 22:25:40'),(93,'1837463527',107,1000,'2011-11-02 00:00:00',NULL,'2016-01-11 22:25:40'),(94,'1837463527',108,1000,'2011-11-02 00:00:00',NULL,'2016-01-11 22:25:40'),(95,'1837463527',109,1000,'2011-11-02 00:00:00',NULL,'2016-01-11 22:25:40'),(96,'1837463527',110,1000,'2011-11-02 00:00:00',NULL,'2016-01-11 22:25:40'),(97,'1837463527',111,1000,'2011-11-02 00:00:00',NULL,'2016-01-11 22:25:40'),(98,'1837463527',112,1000,'2011-11-02 00:00:00',NULL,'2016-01-11 22:25:40'),(99,'1837463527',113,1000,'2011-11-02 00:00:00',NULL,'2016-01-11 22:25:40'),(100,'1837463527',114,1000,'2011-11-02 00:00:00',NULL,'2016-01-11 22:25:40'),(101,'1837463527',115,1000,'2011-11-02 00:00:00',NULL,'2016-01-11 22:25:40'),(102,'1837463527',116,1000,'2011-11-02 00:00:00',NULL,'2016-01-11 22:25:40'),(103,'1837463527',117,1000,'2011-11-02 00:00:00',NULL,'2016-01-11 22:25:40'),(104,'1837463527',118,1000,'2011-11-02 00:00:00',NULL,'2016-01-11 22:25:40'),(105,'1837463527',119,1000,'2011-11-02 00:00:00',NULL,'2016-01-11 22:25:40'),(106,'1837463527',120,1000,'2011-11-02 00:00:00',NULL,'2016-01-11 22:25:40'),(107,'1837463527',121,1000,'2011-11-02 00:00:00',NULL,'2016-01-11 22:25:40'),(108,'1837463527',122,1000,'2011-11-02 00:00:00',NULL,'2016-01-11 22:25:40'),(109,'1837463527',123,1000,'2011-11-02 00:00:00',NULL,'2016-01-11 22:25:40'),(110,'1837463527',124,1000,'2011-11-02 00:00:00',NULL,'2016-01-11 22:25:40'),(111,'1837463527',125,1000,'2011-11-02 00:00:00',NULL,'2016-01-11 22:25:40'),(112,'1837463527',126,1000,'2011-11-02 00:00:00',NULL,'2016-01-11 22:25:40'),(113,'1837463527',127,1000,'2011-11-02 00:00:00',NULL,'2016-01-11 22:25:40'),(114,'1837463527',128,1000,'2011-11-02 00:00:00',NULL,'2016-01-11 22:25:40'),(115,'1837463527',129,1000,'2011-11-02 00:00:00',NULL,'2016-01-11 22:25:40'),(116,'1837463527',130,1000,'2011-11-02 00:00:00',NULL,'2016-01-11 22:25:40'),(117,'1837463527',131,1000,'2011-11-02 00:00:00',NULL,'2016-01-11 22:25:40'),(118,'1837463527',132,1000,'2011-11-02 00:00:00',NULL,'2016-01-11 22:25:40'),(119,'1837463527',133,1000,'2011-11-02 00:00:00',NULL,'2016-01-11 22:25:40'),(120,'1837463527',134,1000,'2011-11-02 00:00:00',NULL,'2016-01-11 22:25:40'),(121,'1837463527',135,1000,'2011-11-02 00:00:00',NULL,'2016-01-11 22:25:40'),(122,'1837463527',136,1000,'2011-11-02 00:00:00',NULL,'2016-01-11 22:25:40'),(123,'1837463527',137,1000,'2011-11-02 00:00:00',NULL,'2016-01-11 22:25:40'),(124,'1837463527',138,1000,'2011-11-02 00:00:00',NULL,'2016-01-11 22:25:40'),(125,'1837463527',139,1000,'2011-11-02 00:00:00',NULL,'2016-01-11 22:25:40'),(126,'1837463527',140,1000,'2011-11-02 00:00:00',NULL,'2016-01-11 22:25:40'),(127,'1837463527',141,1000,'2011-11-02 00:00:00',NULL,'2016-01-11 22:25:40'),(128,'1837463527',142,1000,'2011-11-02 00:00:00',NULL,'2016-01-11 22:25:40'),(129,'1837463527',143,1000,'2011-11-02 00:00:00',NULL,'2016-01-11 22:25:40'),(130,'1837463527',144,1000,'2011-11-02 00:00:00',NULL,'2016-01-11 22:25:40'),(131,'1837463527',145,1000,'2011-11-02 00:00:00',NULL,'2016-01-11 22:25:40'),(132,'1837463527',146,1000,'2011-11-02 00:00:00',NULL,'2016-01-11 22:25:40'),(133,'1837463527',147,1000,'2011-11-02 00:00:00',NULL,'2016-01-11 22:25:40'),(134,'1837463527',3,1000,'2011-10-01 00:00:00',NULL,'2016-01-11 22:27:10'),(135,'1837463527',3,1000,'2011-12-02 00:00:00',NULL,'2016-01-11 22:27:10'),(136,'1837463527',4,1000,'2011-12-02 00:00:00',NULL,'2016-01-11 22:27:10'),(137,'1837463527',5,1000,'2011-12-02 00:00:00',NULL,'2016-01-11 22:27:10'),(138,'1837463527',6,1000,'2011-12-02 00:00:00',NULL,'2016-01-11 22:27:10'),(139,'1837463527',7,1000,'2011-12-02 00:00:00',NULL,'2016-01-11 22:27:10'),(140,'1837463527',8,1000,'2011-12-02 00:00:00',NULL,'2016-01-11 22:27:10'),(141,'1837463527',10,1000,'2011-12-02 00:00:00',NULL,'2016-01-11 22:27:10'),(142,'1837463527',11,1000,'2011-12-02 00:00:00',NULL,'2016-01-11 22:27:10'),(143,'1837463527',12,1000,'2011-12-02 00:00:00',NULL,'2016-01-11 22:27:10'),(144,'1837463527',15,1000,'2011-12-02 00:00:00',NULL,'2016-01-11 22:27:10'),(145,'1837463527',16,1000,'2011-12-02 00:00:00',NULL,'2016-01-11 22:27:10'),(146,'1837463527',17,1000,'2011-12-02 00:00:00',NULL,'2016-01-11 22:27:10'),(147,'1837463527',18,1000,'2011-12-02 00:00:00',NULL,'2016-01-11 22:27:10'),(148,'1837463527',19,1000,'2011-12-02 00:00:00',NULL,'2016-01-11 22:27:10'),(149,'1837463527',20,1000,'2011-12-02 00:00:00',NULL,'2016-01-11 22:27:10'),(150,'1837463527',22,1000,'2011-12-02 00:00:00',NULL,'2016-01-11 22:27:10'),(151,'1837463527',23,1000,'2011-12-02 00:00:00',NULL,'2016-01-11 22:27:10'),(152,'1837463527',25,1000,'2011-12-02 00:00:00',NULL,'2016-01-11 22:27:10'),(153,'1837463527',26,1000,'2011-12-02 00:00:00',NULL,'2016-01-11 22:27:10'),(154,'1837463527',28,1000,'2011-12-02 00:00:00',NULL,'2016-01-11 22:27:10'),(155,'1837463527',29,1000,'2011-12-02 00:00:00',NULL,'2016-01-11 22:27:10'),(156,'1837463527',30,1000,'2011-12-02 00:00:00',NULL,'2016-01-11 22:27:10'),(157,'1837463527',31,1000,'2011-12-02 00:00:00',NULL,'2016-01-11 22:27:10'),(158,'1837463527',33,1000,'2011-12-02 00:00:00',NULL,'2016-01-11 22:27:10'),(159,'1837463527',34,1000,'2011-12-02 00:00:00',NULL,'2016-01-11 22:27:10'),(160,'1837463527',35,1000,'2011-12-02 00:00:00',NULL,'2016-01-11 22:27:10'),(161,'1837463527',37,1000,'2011-12-02 00:00:00',NULL,'2016-01-11 22:27:10'),(162,'1837463527',38,1000,'2011-12-02 00:00:00',NULL,'2016-01-11 22:27:10'),(163,'1837463527',39,1000,'2011-12-02 00:00:00',NULL,'2016-01-11 22:27:10'),(164,'1837463527',40,1000,'2011-12-02 00:00:00',NULL,'2016-01-11 22:27:10'),(165,'1837463527',41,1000,'2011-12-02 00:00:00',NULL,'2016-01-11 22:27:10'),(166,'1837463527',42,1000,'2011-12-02 00:00:00',NULL,'2016-01-11 22:27:10'),(167,'1837463527',43,1000,'2011-12-02 00:00:00',NULL,'2016-01-11 22:27:10'),(168,'1837463527',44,1000,'2011-12-02 00:00:00',NULL,'2016-01-11 22:27:10'),(169,'1837463527',45,1000,'2011-12-02 00:00:00',NULL,'2016-01-11 22:27:10'),(170,'1837463527',47,1000,'2011-12-02 00:00:00',NULL,'2016-01-11 22:27:10'),(171,'1837463527',48,1000,'2011-12-02 00:00:00',NULL,'2016-01-11 22:27:10'),(172,'1837463527',50,1000,'2011-12-02 00:00:00',NULL,'2016-01-11 22:27:10'),(173,'1837463527',51,1000,'2011-12-02 00:00:00',NULL,'2016-01-11 22:27:10'),(174,'1837463527',52,1000,'2011-12-02 00:00:00',NULL,'2016-01-11 22:27:10'),(175,'1837463527',53,1000,'2011-12-02 00:00:00',NULL,'2016-01-11 22:27:10'),(176,'1837463527',54,1000,'2011-12-02 00:00:00',NULL,'2016-01-11 22:27:10'),(177,'1837463527',55,1000,'2011-12-02 00:00:00',NULL,'2016-01-11 22:27:10'),(178,'1837463527',56,1000,'2011-12-02 00:00:00',NULL,'2016-01-11 22:27:10'),(179,'1837463527',57,1000,'2011-12-02 00:00:00',NULL,'2016-01-11 22:27:10'),(180,'1837463527',58,1000,'2011-12-02 00:00:00',NULL,'2016-01-11 22:27:10'),(181,'1837463527',59,1000,'2011-12-02 00:00:00',NULL,'2016-01-11 22:27:10'),(182,'1837463527',60,1000,'2011-12-02 00:00:00',NULL,'2016-01-11 22:27:10'),(183,'1837463527',61,1000,'2011-12-02 00:00:00',NULL,'2016-01-11 22:27:10'),(184,'1837463527',62,1000,'2011-12-02 00:00:00',NULL,'2016-01-11 22:27:10'),(185,'1837463527',63,1000,'2011-12-02 00:00:00',NULL,'2016-01-11 22:27:10'),(186,'1837463527',64,1000,'2011-12-02 00:00:00',NULL,'2016-01-11 22:27:10'),(187,'1837463527',65,1000,'2011-12-02 00:00:00',NULL,'2016-01-11 22:27:10'),(188,'1837463527',66,1000,'2011-12-02 00:00:00',NULL,'2016-01-11 22:27:10'),(189,'1837463527',67,1000,'2011-12-02 00:00:00',NULL,'2016-01-11 22:27:10'),(190,'1837463527',68,1000,'2011-12-02 00:00:00',NULL,'2016-01-11 22:27:10'),(191,'1837463527',69,1000,'2011-12-02 00:00:00',NULL,'2016-01-11 22:27:10'),(192,'1837463527',71,1000,'2011-12-02 00:00:00',NULL,'2016-01-11 22:27:10'),(193,'1837463527',72,1000,'2011-12-02 00:00:00',NULL,'2016-01-11 22:27:10'),(194,'1837463527',74,1000,'2011-12-02 00:00:00',NULL,'2016-01-11 22:27:10'),(195,'1837463527',75,1000,'2011-12-02 00:00:00',NULL,'2016-01-11 22:27:10'),(196,'1837463527',76,1000,'2011-12-02 00:00:00',NULL,'2016-01-11 22:27:10'),(197,'1837463527',77,1000,'2011-12-02 00:00:00',NULL,'2016-01-11 22:27:10'),(198,'1837463527',78,1000,'2011-12-02 00:00:00',NULL,'2016-01-11 22:27:10'),(199,'1837463527',79,1000,'2011-12-02 00:00:00',NULL,'2016-01-11 22:27:10'),(200,'1837463527',80,1000,'2011-12-02 00:00:00',NULL,'2016-01-11 22:27:10'),(201,'1837463527',81,1000,'2011-12-02 00:00:00',NULL,'2016-01-11 22:27:10'),(202,'1837463527',84,1000,'2011-12-02 00:00:00',NULL,'2016-01-11 22:27:10'),(203,'1837463527',85,1000,'2011-12-02 00:00:00',NULL,'2016-01-11 22:27:10'),(204,'1837463527',86,1000,'2011-12-02 00:00:00',NULL,'2016-01-11 22:27:10'),(205,'1837463527',87,1000,'2011-12-02 00:00:00',NULL,'2016-01-11 22:27:10'),(206,'1837463527',88,1000,'2011-12-02 00:00:00',NULL,'2016-01-11 22:27:10'),(207,'1837463527',89,1000,'2011-12-02 00:00:00',NULL,'2016-01-11 22:27:10'),(208,'1837463527',90,1000,'2011-12-02 00:00:00',NULL,'2016-01-11 22:27:10'),(209,'1837463527',91,1000,'2011-12-02 00:00:00',NULL,'2016-01-11 22:27:10'),(210,'1837463527',92,1000,'2011-12-02 00:00:00',NULL,'2016-01-11 22:27:10'),(211,'1837463527',93,1000,'2011-12-02 00:00:00',NULL,'2016-01-11 22:27:10'),(212,'1837463527',95,1000,'2011-12-02 00:00:00',NULL,'2016-01-11 22:27:10'),(213,'1837463527',96,1000,'2011-12-02 00:00:00',NULL,'2016-01-11 22:27:10'),(214,'1837463527',97,1000,'2011-12-02 00:00:00',NULL,'2016-01-11 22:27:10'),(215,'1837463527',98,1000,'2011-12-02 00:00:00',NULL,'2016-01-11 22:27:10'),(216,'1837463527',99,1000,'2011-12-02 00:00:00',NULL,'2016-01-11 22:27:10'),(217,'1837463527',100,1000,'2011-12-02 00:00:00',NULL,'2016-01-11 22:27:10'),(218,'1837463527',101,1000,'2011-12-02 00:00:00',NULL,'2016-01-11 22:27:10'),(219,'1837463527',102,1000,'2011-12-02 00:00:00',NULL,'2016-01-11 22:27:10'),(220,'1837463527',103,1000,'2011-12-02 00:00:00',NULL,'2016-01-11 22:27:10'),(221,'1837463527',104,1000,'2011-12-02 00:00:00',NULL,'2016-01-11 22:27:10'),(222,'1837463527',105,1000,'2011-12-02 00:00:00',NULL,'2016-01-11 22:27:10'),(223,'1837463527',106,1000,'2011-12-02 00:00:00',NULL,'2016-01-11 22:27:10'),(224,'1837463527',107,1000,'2011-12-02 00:00:00',NULL,'2016-01-11 22:27:10'),(225,'1837463527',108,1000,'2011-12-02 00:00:00',NULL,'2016-01-11 22:27:10'),(226,'1837463527',109,1000,'2011-12-02 00:00:00',NULL,'2016-01-11 22:27:10'),(227,'1837463527',110,1000,'2011-12-02 00:00:00',NULL,'2016-01-11 22:27:10'),(228,'1837463527',111,1000,'2011-12-02 00:00:00',NULL,'2016-01-11 22:27:10'),(229,'1837463527',112,1000,'2011-12-02 00:00:00',NULL,'2016-01-11 22:27:10'),(230,'1837463527',113,1000,'2011-12-02 00:00:00',NULL,'2016-01-11 22:27:10'),(231,'1837463527',114,1000,'2011-12-02 00:00:00',NULL,'2016-01-11 22:27:10'),(232,'1837463527',115,1000,'2011-12-02 00:00:00',NULL,'2016-01-11 22:27:10'),(233,'1837463527',116,1000,'2011-12-02 00:00:00',NULL,'2016-01-11 22:27:10'),(234,'1837463527',117,1000,'2011-12-02 00:00:00',NULL,'2016-01-11 22:27:10'),(235,'1837463527',131,1000,'2011-12-02 00:00:00',NULL,'2016-01-11 22:27:10'),(236,'1837463527',132,1000,'2011-12-02 00:00:00',NULL,'2016-01-11 22:27:10'),(237,'1837463527',133,1000,'2011-12-02 00:00:00',NULL,'2016-01-11 22:27:10'),(238,'1837463527',134,1000,'2011-12-02 00:00:00',NULL,'2016-01-11 22:27:10'),(239,'1837463527',135,1000,'2011-12-02 00:00:00',NULL,'2016-01-11 22:27:10'),(240,'1837463527',136,1000,'2011-12-02 00:00:00',NULL,'2016-01-11 22:27:10'),(241,'1837463527',137,1000,'2011-12-02 00:00:00',NULL,'2016-01-11 22:27:10'),(242,'1837463527',138,1000,'2011-12-02 00:00:00',NULL,'2016-01-11 22:27:10'),(243,'1837463527',139,1000,'2011-12-02 00:00:00',NULL,'2016-01-11 22:27:10'),(244,'1837463527',140,1000,'2011-12-02 00:00:00',NULL,'2016-01-11 22:27:10'),(245,'1837463527',141,1000,'2011-12-02 00:00:00',NULL,'2016-01-11 22:27:10'),(246,'1837463527',142,1000,'2011-12-02 00:00:00',NULL,'2016-01-11 22:27:10'),(247,'1837463527',143,1000,'2011-12-02 00:00:00',NULL,'2016-01-11 22:27:10'),(248,'1837463527',144,1000,'2011-12-02 00:00:00',NULL,'2016-01-11 22:27:10'),(249,'1837463527',145,1000,'2011-12-02 00:00:00',NULL,'2016-01-11 22:27:10'),(250,'1837463527',146,1000,'2011-12-02 00:00:00',NULL,'2016-01-11 22:27:10'),(251,'1837463527',147,1000,'2011-12-02 00:00:00',NULL,'2016-01-11 22:27:10'),(252,'1837463527',3,1000,'2011-11-01 00:00:00',NULL,'2016-01-11 22:27:45'),(253,'1837463527',3,1000,'2012-03-02 00:00:00',NULL,'2016-01-11 22:27:45'),(254,'1837463527',4,1000,'2012-03-02 00:00:00',NULL,'2016-01-11 22:27:45'),(255,'1837463527',5,1000,'2012-03-02 00:00:00',NULL,'2016-01-11 22:27:45'),(256,'1837463527',6,1000,'2012-03-02 00:00:00',NULL,'2016-01-11 22:27:45'),(257,'1837463527',7,1000,'2012-03-02 00:00:00',NULL,'2016-01-11 22:27:45'),(258,'1837463527',8,1000,'2012-03-02 00:00:00',NULL,'2016-01-11 22:27:45'),(259,'1837463527',10,1000,'2012-03-02 00:00:00',NULL,'2016-01-11 22:27:45'),(260,'1837463527',11,1000,'2012-03-02 00:00:00',NULL,'2016-01-11 22:27:45'),(261,'1837463527',12,1000,'2012-03-02 00:00:00',NULL,'2016-01-11 22:27:45'),(262,'1837463527',15,1000,'2012-03-02 00:00:00',NULL,'2016-01-11 22:27:45'),(263,'1837463527',16,1000,'2012-03-02 00:00:00',NULL,'2016-01-11 22:27:45'),(264,'1837463527',17,1000,'2012-03-02 00:00:00',NULL,'2016-01-11 22:27:45'),(265,'1837463527',18,1000,'2012-03-02 00:00:00',NULL,'2016-01-11 22:27:45'),(266,'1837463527',19,1000,'2012-03-02 00:00:00',NULL,'2016-01-11 22:27:45'),(267,'1837463527',20,1000,'2012-03-02 00:00:00',NULL,'2016-01-11 22:27:45'),(268,'1837463527',22,1000,'2012-03-02 00:00:00',NULL,'2016-01-11 22:27:45'),(269,'1837463527',23,1000,'2012-03-02 00:00:00',NULL,'2016-01-11 22:27:45'),(270,'1837463527',25,1000,'2012-03-02 00:00:00',NULL,'2016-01-11 22:27:45'),(271,'1837463527',26,1000,'2012-03-02 00:00:00',NULL,'2016-01-11 22:27:45'),(272,'1837463527',28,1000,'2012-03-02 00:00:00',NULL,'2016-01-11 22:27:45'),(273,'1837463527',29,1000,'2012-03-02 00:00:00',NULL,'2016-01-11 22:27:45'),(274,'1837463527',30,1000,'2012-03-02 00:00:00',NULL,'2016-01-11 22:27:45'),(275,'1837463527',31,1000,'2012-03-02 00:00:00',NULL,'2016-01-11 22:27:45'),(276,'1837463527',33,1000,'2012-03-02 00:00:00',NULL,'2016-01-11 22:27:45'),(277,'1837463527',34,1000,'2012-03-02 00:00:00',NULL,'2016-01-11 22:27:45'),(278,'1837463527',35,1000,'2012-03-02 00:00:00',NULL,'2016-01-11 22:27:45'),(279,'1837463527',37,1000,'2012-03-02 00:00:00',NULL,'2016-01-11 22:27:45'),(280,'1837463527',38,1000,'2012-03-02 00:00:00',NULL,'2016-01-11 22:27:45'),(281,'1837463527',39,1000,'2012-03-02 00:00:00',NULL,'2016-01-11 22:27:45'),(282,'1837463527',40,1000,'2012-03-02 00:00:00',NULL,'2016-01-11 22:27:45'),(283,'1837463527',41,1000,'2012-03-02 00:00:00',NULL,'2016-01-11 22:27:45'),(284,'1837463527',42,1000,'2012-03-02 00:00:00',NULL,'2016-01-11 22:27:45'),(285,'1837463527',43,1000,'2012-03-02 00:00:00',NULL,'2016-01-11 22:27:45'),(286,'1837463527',44,1000,'2012-03-02 00:00:00',NULL,'2016-01-11 22:27:45'),(287,'1837463527',45,1000,'2012-03-02 00:00:00',NULL,'2016-01-11 22:27:45'),(288,'1837463527',47,1000,'2012-03-02 00:00:00',NULL,'2016-01-11 22:27:45'),(289,'1837463527',48,1000,'2012-03-02 00:00:00',NULL,'2016-01-11 22:27:45'),(290,'1837463527',50,1000,'2012-03-02 00:00:00',NULL,'2016-01-11 22:27:45'),(291,'1837463527',51,1000,'2012-03-02 00:00:00',NULL,'2016-01-11 22:27:45'),(292,'1837463527',52,1000,'2012-03-02 00:00:00',NULL,'2016-01-11 22:27:45'),(293,'1837463527',53,1000,'2012-03-02 00:00:00',NULL,'2016-01-11 22:27:45'),(294,'1837463527',54,1000,'2012-03-02 00:00:00',NULL,'2016-01-11 22:27:45'),(295,'1837463527',55,1000,'2012-03-02 00:00:00',NULL,'2016-01-11 22:27:45'),(296,'1837463527',56,1000,'2012-03-02 00:00:00',NULL,'2016-01-11 22:27:45'),(297,'1837463527',57,1000,'2012-03-02 00:00:00',NULL,'2016-01-11 22:27:45'),(298,'1837463527',58,1000,'2012-03-02 00:00:00',NULL,'2016-01-11 22:27:45'),(299,'1837463527',59,1000,'2012-03-02 00:00:00',NULL,'2016-01-11 22:27:45'),(300,'1837463527',60,1000,'2012-03-02 00:00:00',NULL,'2016-01-11 22:27:45'),(301,'1837463527',61,1000,'2012-03-02 00:00:00',NULL,'2016-01-11 22:27:45'),(302,'1837463527',62,1000,'2012-03-02 00:00:00',NULL,'2016-01-11 22:27:45'),(303,'1837463527',63,1000,'2012-03-02 00:00:00',NULL,'2016-01-11 22:27:45'),(304,'1837463527',64,1000,'2012-03-02 00:00:00',NULL,'2016-01-11 22:27:45'),(305,'1837463527',65,1000,'2012-03-02 00:00:00',NULL,'2016-01-11 22:27:45'),(306,'1837463527',66,1000,'2012-03-02 00:00:00',NULL,'2016-01-11 22:27:45'),(307,'1837463527',67,1000,'2012-03-02 00:00:00',NULL,'2016-01-11 22:27:45'),(308,'1837463527',68,1000,'2012-03-02 00:00:00',NULL,'2016-01-11 22:27:45'),(309,'1837463527',69,1000,'2012-03-02 00:00:00',NULL,'2016-01-11 22:27:45'),(310,'1837463527',71,1000,'2012-03-02 00:00:00',NULL,'2016-01-11 22:27:45'),(311,'1837463527',72,1000,'2012-03-02 00:00:00',NULL,'2016-01-11 22:27:45'),(312,'1837463527',74,1000,'2012-03-02 00:00:00',NULL,'2016-01-11 22:27:45'),(313,'1837463527',75,1000,'2012-03-02 00:00:00',NULL,'2016-01-11 22:27:45'),(314,'1837463527',76,1000,'2012-03-02 00:00:00',NULL,'2016-01-11 22:27:45'),(315,'1837463527',77,1000,'2012-03-02 00:00:00',NULL,'2016-01-11 22:27:45'),(316,'1837463527',78,1000,'2012-03-02 00:00:00',NULL,'2016-01-11 22:27:45'),(317,'1837463527',79,1000,'2012-03-02 00:00:00',NULL,'2016-01-11 22:27:45'),(318,'1837463527',80,1000,'2012-03-02 00:00:00',NULL,'2016-01-11 22:27:45'),(319,'1837463527',81,1000,'2012-03-02 00:00:00',NULL,'2016-01-11 22:27:45'),(320,'1837463527',84,1000,'2012-03-02 00:00:00',NULL,'2016-01-11 22:27:45'),(321,'1837463527',85,1000,'2012-03-02 00:00:00',NULL,'2016-01-11 22:27:45'),(322,'1837463527',86,1000,'2012-03-02 00:00:00',NULL,'2016-01-11 22:27:45'),(323,'1837463527',87,1000,'2012-03-02 00:00:00',NULL,'2016-01-11 22:27:45'),(324,'1837463527',88,1000,'2012-03-02 00:00:00',NULL,'2016-01-11 22:27:45'),(325,'1837463527',89,1000,'2012-03-02 00:00:00',NULL,'2016-01-11 22:27:45'),(326,'1837463527',90,1000,'2012-03-02 00:00:00',NULL,'2016-01-11 22:27:45'),(327,'1837463527',91,1000,'2012-03-02 00:00:00',NULL,'2016-01-11 22:27:45'),(328,'1837463527',92,1000,'2012-03-02 00:00:00',NULL,'2016-01-11 22:27:45'),(329,'1837463527',93,1000,'2012-03-02 00:00:00',NULL,'2016-01-11 22:27:45'),(330,'1837463527',95,1000,'2012-03-02 00:00:00',NULL,'2016-01-11 22:27:45'),(331,'1837463527',96,1000,'2012-03-02 00:00:00',NULL,'2016-01-11 22:27:45'),(332,'1837463527',97,1000,'2012-03-02 00:00:00',NULL,'2016-01-11 22:27:45'),(333,'1837463527',98,1000,'2012-03-02 00:00:00',NULL,'2016-01-11 22:27:45'),(334,'1837463527',99,1000,'2012-03-02 00:00:00',NULL,'2016-01-11 22:27:45'),(335,'1837463527',137,1000,'2012-03-02 00:00:00',NULL,'2016-01-11 22:27:45'),(336,'1837463527',138,1000,'2012-03-02 00:00:00',NULL,'2016-01-11 22:27:45'),(337,'1837463527',139,1000,'2012-03-02 00:00:00',NULL,'2016-01-11 22:27:45'),(338,'1837463527',140,1000,'2012-03-02 00:00:00',NULL,'2016-01-11 22:27:45'),(339,'1837463527',141,1000,'2012-03-02 00:00:00',NULL,'2016-01-11 22:27:45'),(340,'1837463527',142,1000,'2012-03-02 00:00:00',NULL,'2016-01-11 22:27:45'),(341,'1837463527',143,1000,'2012-03-02 00:00:00',NULL,'2016-01-11 22:27:45'),(342,'1837463527',144,1000,'2012-03-02 00:00:00',NULL,'2016-01-11 22:27:45'),(343,'1837463527',145,1000,'2012-03-02 00:00:00',NULL,'2016-01-11 22:27:45'),(344,'1837463527',146,1000,'2012-03-02 00:00:00',NULL,'2016-01-11 22:27:45'),(345,'1837463527',147,1000,'2012-03-02 00:00:00',NULL,'2016-01-11 22:27:45'),(346,'1837463527',3,1000,'2011-11-01 00:00:00',NULL,'2016-01-11 22:28:15'),(347,'1837463527',3,1000,'2012-04-02 00:00:00',NULL,'2016-01-11 22:28:15'),(348,'1837463527',4,1000,'2012-04-02 00:00:00',NULL,'2016-01-11 22:28:15'),(349,'1837463527',5,1000,'2012-04-02 00:00:00',NULL,'2016-01-11 22:28:15'),(350,'1837463527',6,1000,'2012-04-02 00:00:00',NULL,'2016-01-11 22:28:15'),(351,'1837463527',7,1000,'2012-04-02 00:00:00',NULL,'2016-01-11 22:28:15'),(352,'1837463527',8,1000,'2012-04-02 00:00:00',NULL,'2016-01-11 22:28:15'),(353,'1837463527',10,1000,'2012-04-02 00:00:00',NULL,'2016-01-11 22:28:15'),(354,'1837463527',11,1000,'2012-04-02 00:00:00',NULL,'2016-01-11 22:28:15'),(355,'1837463527',12,1000,'2012-04-02 00:00:00',NULL,'2016-01-11 22:28:15'),(356,'1837463527',15,1000,'2012-04-02 00:00:00',NULL,'2016-01-11 22:28:15'),(357,'1837463527',16,1000,'2012-04-02 00:00:00',NULL,'2016-01-11 22:28:15'),(358,'1837463527',17,1000,'2012-04-02 00:00:00',NULL,'2016-01-11 22:28:15'),(359,'1837463527',18,1000,'2012-04-02 00:00:00',NULL,'2016-01-11 22:28:15'),(360,'1837463527',19,1000,'2012-04-02 00:00:00',NULL,'2016-01-11 22:28:15'),(361,'1837463527',20,1000,'2012-04-02 00:00:00',NULL,'2016-01-11 22:28:15'),(362,'1837463527',22,1000,'2012-04-02 00:00:00',NULL,'2016-01-11 22:28:15'),(363,'1837463527',23,1000,'2012-04-02 00:00:00',NULL,'2016-01-11 22:28:15'),(364,'1837463527',25,1000,'2012-04-02 00:00:00',NULL,'2016-01-11 22:28:15'),(365,'1837463527',26,1000,'2012-04-02 00:00:00',NULL,'2016-01-11 22:28:15'),(366,'1837463527',28,1000,'2012-04-02 00:00:00',NULL,'2016-01-11 22:28:15'),(367,'1837463527',29,1000,'2012-04-02 00:00:00',NULL,'2016-01-11 22:28:15'),(368,'1837463527',30,1000,'2012-04-02 00:00:00',NULL,'2016-01-11 22:28:15'),(369,'1837463527',31,1000,'2012-04-02 00:00:00',NULL,'2016-01-11 22:28:15'),(370,'1837463527',33,1000,'2012-04-02 00:00:00',NULL,'2016-01-11 22:28:15'),(371,'1837463527',34,1000,'2012-04-02 00:00:00',NULL,'2016-01-11 22:28:15'),(372,'1837463527',35,1000,'2012-04-02 00:00:00',NULL,'2016-01-11 22:28:15'),(373,'1837463527',37,1000,'2012-04-02 00:00:00',NULL,'2016-01-11 22:28:15'),(374,'1837463527',38,1000,'2012-04-02 00:00:00',NULL,'2016-01-11 22:28:15'),(375,'1837463527',39,1000,'2012-04-02 00:00:00',NULL,'2016-01-11 22:28:15'),(376,'1837463527',40,1000,'2012-04-02 00:00:00',NULL,'2016-01-11 22:28:15'),(377,'1837463527',41,1000,'2012-04-02 00:00:00',NULL,'2016-01-11 22:28:15'),(378,'1837463527',42,1000,'2012-04-02 00:00:00',NULL,'2016-01-11 22:28:15'),(379,'1837463527',43,1000,'2012-04-02 00:00:00',NULL,'2016-01-11 22:28:15'),(380,'1837463527',44,1000,'2012-04-02 00:00:00',NULL,'2016-01-11 22:28:15'),(381,'1837463527',45,1000,'2012-04-02 00:00:00',NULL,'2016-01-11 22:28:15'),(382,'1837463527',47,1000,'2012-04-02 00:00:00',NULL,'2016-01-11 22:28:15'),(383,'1837463527',48,1000,'2012-04-02 00:00:00',NULL,'2016-01-11 22:28:15'),(384,'1837463527',50,1000,'2012-04-02 00:00:00',NULL,'2016-01-11 22:28:15'),(385,'1837463527',51,1000,'2012-04-02 00:00:00',NULL,'2016-01-11 22:28:15'),(386,'1837463527',52,1000,'2012-04-02 00:00:00',NULL,'2016-01-11 22:28:15'),(387,'1837463527',53,1000,'2012-04-02 00:00:00',NULL,'2016-01-11 22:28:15'),(388,'1837463527',54,1000,'2012-04-02 00:00:00',NULL,'2016-01-11 22:28:15'),(389,'1837463527',55,1000,'2012-04-02 00:00:00',NULL,'2016-01-11 22:28:15'),(390,'1837463527',56,1000,'2012-04-02 00:00:00',NULL,'2016-01-11 22:28:15'),(391,'1837463527',57,1000,'2012-04-02 00:00:00',NULL,'2016-01-11 22:28:15'),(392,'1837463527',58,1000,'2012-04-02 00:00:00',NULL,'2016-01-11 22:28:15'),(393,'1837463527',59,1000,'2012-04-02 00:00:00',NULL,'2016-01-11 22:28:15'),(394,'1837463527',60,1000,'2012-04-02 00:00:00',NULL,'2016-01-11 22:28:15'),(395,'1837463527',61,1000,'2012-04-02 00:00:00',NULL,'2016-01-11 22:28:15'),(396,'1837463527',62,1000,'2012-04-02 00:00:00',NULL,'2016-01-11 22:28:15'),(397,'1837463527',63,1000,'2012-04-02 00:00:00',NULL,'2016-01-11 22:28:15'),(398,'1837463527',64,1000,'2012-04-02 00:00:00',NULL,'2016-01-11 22:28:15'),(399,'1837463527',65,1000,'2012-04-02 00:00:00',NULL,'2016-01-11 22:28:15'),(400,'1837463527',66,1000,'2012-04-02 00:00:00',NULL,'2016-01-11 22:28:15'),(401,'1837463527',67,1000,'2012-04-02 00:00:00',NULL,'2016-01-11 22:28:15'),(402,'1837463527',68,1000,'2012-04-02 00:00:00',NULL,'2016-01-11 22:28:15'),(403,'1837463527',69,1000,'2012-04-02 00:00:00',NULL,'2016-01-11 22:28:15'),(404,'1837463527',71,1000,'2012-04-02 00:00:00',NULL,'2016-01-11 22:28:15'),(405,'1837463527',72,1000,'2012-04-02 00:00:00',NULL,'2016-01-11 22:28:15'),(406,'1837463527',137,1000,'2012-04-02 00:00:00',NULL,'2016-01-11 22:28:15'),(407,'1837463527',138,1000,'2012-04-02 00:00:00',NULL,'2016-01-11 22:28:15'),(408,'1837463527',139,1000,'2012-04-02 00:00:00',NULL,'2016-01-11 22:28:15'),(409,'1837463527',140,1000,'2012-04-02 00:00:00',NULL,'2016-01-11 22:28:15'),(410,'1837463527',141,1000,'2012-04-02 00:00:00',NULL,'2016-01-11 22:28:15'),(411,'1837463527',142,1000,'2012-04-02 00:00:00',NULL,'2016-01-11 22:28:15'),(412,'1837463527',143,1000,'2012-04-02 00:00:00',NULL,'2016-01-11 22:28:15'),(413,'1837463527',144,1000,'2012-04-02 00:00:00',NULL,'2016-01-11 22:28:15'),(414,'1837463527',145,1000,'2012-04-02 00:00:00',NULL,'2016-01-11 22:28:15'),(415,'1837463527',146,1000,'2012-04-02 00:00:00',NULL,'2016-01-11 22:28:15'),(416,'1837463527',147,1000,'2012-04-02 00:00:00',NULL,'2016-01-11 22:28:15'),(417,'1837463527',3,1000,'2011-12-01 00:00:00',NULL,'2016-01-11 22:28:38'),(418,'1837463527',3,1000,'2012-05-02 00:00:00',NULL,'2016-01-11 22:28:38'),(419,'1837463527',4,1000,'2012-05-02 00:00:00',NULL,'2016-01-11 22:28:38'),(420,'1837463527',5,1000,'2012-05-02 00:00:00',NULL,'2016-01-11 22:28:38'),(421,'1837463527',6,1000,'2012-05-02 00:00:00',NULL,'2016-01-11 22:28:38'),(422,'1837463527',7,1000,'2012-05-02 00:00:00',NULL,'2016-01-11 22:28:38'),(423,'1837463527',8,1000,'2012-05-02 00:00:00',NULL,'2016-01-11 22:28:38'),(424,'1837463527',10,1000,'2012-05-02 00:00:00',NULL,'2016-01-11 22:28:38'),(425,'1837463527',11,1000,'2012-05-02 00:00:00',NULL,'2016-01-11 22:28:38'),(426,'1837463527',12,1000,'2012-05-02 00:00:00',NULL,'2016-01-11 22:28:38'),(427,'1837463527',15,1000,'2012-05-02 00:00:00',NULL,'2016-01-11 22:28:38'),(428,'1837463527',16,1000,'2012-05-02 00:00:00',NULL,'2016-01-11 22:28:38'),(429,'1837463527',17,1000,'2012-05-02 00:00:00',NULL,'2016-01-11 22:28:38'),(430,'1837463527',18,1000,'2012-05-02 00:00:00',NULL,'2016-01-11 22:28:38'),(431,'1837463527',19,1000,'2012-05-02 00:00:00',NULL,'2016-01-11 22:28:38'),(432,'1837463527',20,1000,'2012-05-02 00:00:00',NULL,'2016-01-11 22:28:38'),(433,'1837463527',22,1000,'2012-05-02 00:00:00',NULL,'2016-01-11 22:28:38'),(434,'1837463527',23,1000,'2012-05-02 00:00:00',NULL,'2016-01-11 22:28:38'),(435,'1837463527',25,1000,'2012-05-02 00:00:00',NULL,'2016-01-11 22:28:38'),(436,'1837463527',26,1000,'2012-05-02 00:00:00',NULL,'2016-01-11 22:28:38'),(437,'1837463527',28,1000,'2012-05-02 00:00:00',NULL,'2016-01-11 22:28:38'),(438,'1837463527',29,1000,'2012-05-02 00:00:00',NULL,'2016-01-11 22:28:38'),(439,'1837463527',30,1000,'2012-05-02 00:00:00',NULL,'2016-01-11 22:28:38'),(440,'1837463527',31,1000,'2012-05-02 00:00:00',NULL,'2016-01-11 22:28:38'),(441,'1837463527',33,1000,'2012-05-02 00:00:00',NULL,'2016-01-11 22:28:38'),(442,'1837463527',34,1000,'2012-05-02 00:00:00',NULL,'2016-01-11 22:28:38'),(443,'1837463527',35,1000,'2012-05-02 00:00:00',NULL,'2016-01-11 22:28:38'),(444,'1837463527',67,1000,'2012-05-02 00:00:00',NULL,'2016-01-11 22:28:38'),(445,'1837463527',68,1000,'2012-05-02 00:00:00',NULL,'2016-01-11 22:28:38'),(446,'1837463527',69,1000,'2012-05-02 00:00:00',NULL,'2016-01-11 22:28:38'),(447,'1837463527',71,1000,'2012-05-02 00:00:00',NULL,'2016-01-11 22:28:38'),(448,'1837463527',72,1000,'2012-05-02 00:00:00',NULL,'2016-01-11 22:28:38'),(449,'1837463527',137,1000,'2012-05-02 00:00:00',NULL,'2016-01-11 22:28:38'),(450,'1837463527',138,1000,'2012-05-02 00:00:00',NULL,'2016-01-11 22:28:38'),(451,'1837463527',139,1000,'2012-05-02 00:00:00',NULL,'2016-01-11 22:28:38'),(452,'1837463527',140,1000,'2012-05-02 00:00:00',NULL,'2016-01-11 22:28:38'),(453,'1837463527',141,1000,'2012-05-02 00:00:00',NULL,'2016-01-11 22:28:38'),(454,'1837463527',142,1000,'2012-05-02 00:00:00',NULL,'2016-01-11 22:28:38'),(455,'1837463527',143,1000,'2012-05-02 00:00:00',NULL,'2016-01-11 22:28:38'),(456,'1837463527',144,1000,'2012-05-02 00:00:00',NULL,'2016-01-11 22:28:38'),(457,'1837463527',145,1000,'2012-05-02 00:00:00',NULL,'2016-01-11 22:28:38'),(458,'1837463527',146,1000,'2012-05-02 00:00:00',NULL,'2016-01-11 22:28:38'),(459,'1837463527',147,1000,'2012-05-02 00:00:00',NULL,'2016-01-11 22:28:38'),(460,'1837463527',3,1000,'2011-12-01 00:00:00',NULL,'2016-01-11 22:29:03'),(461,'1837463527',3,1000,'2012-06-02 00:00:00',NULL,'2016-01-11 22:29:03'),(462,'1837463527',4,1000,'2012-06-02 00:00:00',NULL,'2016-01-11 22:29:03'),(463,'1837463527',5,1000,'2012-06-02 00:00:00',NULL,'2016-01-11 22:29:03'),(464,'1837463527',6,1000,'2012-06-02 00:00:00',NULL,'2016-01-11 22:29:03'),(465,'1837463527',7,1000,'2012-06-02 00:00:00',NULL,'2016-01-11 22:29:03'),(466,'1837463527',8,1000,'2012-06-02 00:00:00',NULL,'2016-01-11 22:29:03'),(467,'1837463527',10,1000,'2012-06-02 00:00:00',NULL,'2016-01-11 22:29:03'),(468,'1837463527',11,1000,'2012-06-02 00:00:00',NULL,'2016-01-11 22:29:03'),(469,'1837463527',12,1000,'2012-06-02 00:00:00',NULL,'2016-01-11 22:29:03'),(470,'1837463527',15,1000,'2012-06-02 00:00:00',NULL,'2016-01-11 22:29:03'),(471,'1837463527',16,1000,'2012-06-02 00:00:00',NULL,'2016-01-11 22:29:03'),(472,'1837463527',17,1000,'2012-06-02 00:00:00',NULL,'2016-01-11 22:29:03'),(473,'1837463527',18,1000,'2012-06-02 00:00:00',NULL,'2016-01-11 22:29:03'),(474,'1837463527',19,1000,'2012-06-02 00:00:00',NULL,'2016-01-11 22:29:03'),(475,'1837463527',20,1000,'2012-06-02 00:00:00',NULL,'2016-01-11 22:29:03'),(476,'1837463527',22,1000,'2012-06-02 00:00:00',NULL,'2016-01-11 22:29:03'),(478,'1837463527',139,1000,'2012-05-01 00:00:00',NULL,'2016-01-13 21:14:28'),(479,'1837463527',139,1000,'2012-06-02 00:00:00',NULL,'2016-01-13 21:14:28'),(480,'1837463527',139,1000,'2012-06-03 00:00:00',NULL,'2016-01-13 21:14:28'),(481,'1837463527',139,1000,'2012-06-01 00:00:00','Notas adicionales','2016-01-13 21:16:57'),(482,'1837463527',139,1000,'2015-04-05 00:00:00',NULL,'2016-01-21 20:41:03');
/*!40000 ALTER TABLE `sesion` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER SESION_AFTER_INSERT
	AFTER INSERT ON sesion FOR EACH ROW
	BEGIN
		  -- se ingresa en el log de actividades    
    INSERT INTO `log_user`
	(`accion`, `tabla`, `new_data`)
    VALUES(
    'insert',
    'sesion',
            CONCAT(NEW.id_personal, ';' , NEW.id_tratamiento, ';' ,
			NEW.fecha, ';' ,NEW.hora, ';' ,NEW.notas)
    );
	END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER SESION_AFTER_UPDATE
	AFTER UPDATE ON sesion FOR EACH ROW
	BEGIN
		  -- se ingresa en el log de actividades    
    INSERT INTO `log_user`
	(`accion`, `tabla`, `old_data`, `new_data`)
    VALUES(
    'update',
    'sesion',
			CONCAT(OLD.id_personal, ';' , OLD.id_tratamiento, ';' ,
			OLD.fecha, ';' ,OLD.hora, ';' ,OLD.notas),
            CONCAT(NEW.id_personal, ';' , NEW.id_tratamiento, ';' ,
			NEW.fecha, ';' ,NEW.hora, ';' ,NEW.notas)
    );
	END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER SESION_AFTER_DELETE
	AFTER DELETE ON sesion FOR EACH ROW
	BEGIN
		  -- se ingresa en el log de actividades    
    INSERT INTO `log_user`
	(`accion`, `tabla`, `old_data`)
    VALUES(
    'delete',
    'sesion',
			CONCAT(OLD.id_personal, ';' , OLD.id_tratamiento, ';' ,
			OLD.fecha, ';' ,OLD.hora, ';' ,OLD.notas)
    );
	END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `tratamiento`
--

DROP TABLE IF EXISTS `tratamiento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
  CONSTRAINT `FK_TRATAMIENTO_HISTORIA` FOREIGN KEY (`id_paciente`) REFERENCES `historia` (`id_paciente`) ON UPDATE CASCADE,
  CONSTRAINT `FK_TRATAMIENTO_PERSONAL` FOREIGN KEY (`id_personal`) REFERENCES `personal` (`id_personal`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=148 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tratamiento`
--

LOCK TABLES `tratamiento` WRITE;
/*!40000 ALTER TABLE `tratamiento` DISABLE KEYS */;
INSERT INTO `tratamiento` VALUES (3,'1000000001','1823533946','Tratamiento Post Operatorio',12,0.00,0.00,'2016-01-11 22:17:16',NULL),(4,'1000000002','1823533946','Tratamiento Post Operatorio',10,0.00,0.00,'2016-01-11 22:17:16',NULL),(5,'1000000003','1823533946','Tratamiento Post Operatorio',15,0.00,0.00,'2016-01-11 22:17:16',NULL),(6,'1000000004','1823533946','Tratamiento Post Operatorio',10,0.00,0.00,'2016-01-11 22:17:16',NULL),(7,'1000000005','1823533946','Tratamiento Post Operatorio',10,0.00,0.00,'2016-01-11 22:17:16',NULL),(8,'1000000006','1823533946','Tratamiento Post Operatorio',10,0.00,0.00,'2016-01-11 22:17:16',NULL),(9,'1000000007','1823533946','Tratamiento Post Operatorio',10,0.00,0.00,'2016-01-11 22:17:16',NULL),(10,'1000000008','1823533946','Tratamiento Post Operatorio',12,0.00,0.00,'2016-01-11 22:17:16',NULL),(11,'1000000009','1823533946','Tratamiento Post Operatorio',10,0.00,0.00,'2016-01-11 22:17:16',NULL),(12,'1000000010','1823533946','Tratamiento Post Operatorio',10,0.00,0.00,'2016-01-11 22:17:16',NULL),(13,'1000000011','1823533946','Tratamiento Post Operatorio',12,0.00,0.00,'2016-01-11 22:17:16',NULL),(14,'1000000012','1823533946','Tratamiento Post Operatorio',9,0.00,0.00,'2016-01-11 22:17:16',NULL),(15,'1000000013','1823533946','Tratamiento Post Operatorio',10,0.00,0.00,'2016-01-11 22:17:16',NULL),(16,'1000000014','1823533946','Tratamiento Post Operatorio',9,0.00,0.00,'2016-01-11 22:17:16',NULL),(17,'1000000015','1823533946','Tratamiento Post Operatorio',15,0.00,0.00,'2016-01-11 22:17:16',NULL),(18,'1000000016','1823533946','Tratamiento Post Operatorio',10,0.00,0.00,'2016-01-11 22:17:16',NULL),(19,'1000000017','1823533946','Tratamiento Post Operatorio',10,0.00,0.00,'2016-01-11 22:17:16',NULL),(20,'1000000018','1823533946','Tratamiento Post Operatorio',12,0.00,0.00,'2016-01-11 22:17:16',NULL),(21,'1000000019','1823533946','Tratamiento Post Operatorio',10,0.00,0.00,'2016-01-11 22:17:16',NULL),(22,'1000000020','1823533946','Tratamiento Post Operatorio',12,0.00,0.00,'2016-01-11 22:17:16',NULL),(23,'1000000021','1823533946','Tratamiento Post Operatorio',15,0.00,0.00,'2016-01-11 22:17:16',NULL),(24,'1000000022','1823533946','Tratamiento Post Operatorio',10,0.00,0.00,'2016-01-11 22:17:16',NULL),(25,'1000000023','1823533946','Tratamiento Post Operatorio',15,0.00,0.00,'2016-01-11 22:17:16',NULL),(26,'1000000024','1823533946','Tratamiento Post Operatorio',9,0.00,0.00,'2016-01-11 22:17:16',NULL),(27,'1000000025','1823533946','Tratamiento Post Operatorio',9,0.00,0.00,'2016-01-11 22:17:16',NULL),(28,'1000000026','1823533946','Tratamiento Post Operatorio',10,0.00,0.00,'2016-01-11 22:17:16',NULL),(29,'1000000027','1823533946','Tratamiento Post Operatorio',10,0.00,0.00,'2016-01-11 22:17:16',NULL),(30,'1000000028','1823533946','Tratamiento Post Operatorio',10,0.00,0.00,'2016-01-11 22:17:16',NULL),(31,'1000000029','1823533946','Tratamiento Post Operatorio',10,0.00,0.00,'2016-01-11 22:17:16',NULL),(32,'1000000030','1823533946','Tratamiento Post Operatorio',12,0.00,0.00,'2016-01-11 22:17:16',NULL),(33,'1000000031','1823533946','Tratamiento Post Operatorio',10,0.00,0.00,'2016-01-11 22:17:16',NULL),(34,'1000000032','1823533946','Tratamiento Post Operatorio',9,0.00,0.00,'2016-01-11 22:17:16',NULL),(35,'1000000033','1823533946','Tratamiento Post Operatorio',10,0.00,0.00,'2016-01-11 22:17:16',NULL),(36,'1000000034','1823533946','Tratamiento Post Operatorio',10,0.00,0.00,'2016-01-11 22:17:16',NULL),(37,'1000000035','1823533946','Tratamiento Post Operatorio',10,0.00,0.00,'2016-01-11 22:17:16',NULL),(38,'1000000036','1823533946','Tratamiento Post Operatorio',15,0.00,0.00,'2016-01-11 22:17:16',NULL),(39,'1000000037','1823533946','Tratamiento Post Operatorio',10,0.00,0.00,'2016-01-11 22:17:16',NULL),(40,'1000000038','1823533946','Tratamiento Post Operatorio',10,0.00,0.00,'2016-01-11 22:17:16',NULL),(41,'1000000039','1823533946','Tratamiento Post Operatorio',9,0.00,0.00,'2016-01-11 22:17:16',NULL),(42,'1000000040','1823533946','Tratamiento Post Operatorio',10,0.00,0.00,'2016-01-11 22:17:16',NULL),(43,'1000000041','1823533946','Tratamiento Post Operatorio',10,0.00,0.00,'2016-01-11 22:17:16',NULL),(44,'1000000042','1823533946','Tratamiento Post Operatorio',10,0.00,0.00,'2016-01-11 22:17:16',NULL),(45,'1000000043','1823533946','Tratamiento Post Operatorio',10,0.00,0.00,'2016-01-11 22:17:16',NULL),(46,'1000000001','1837463527','Tratamiento Post Operatorio',12,0.00,0.00,'2016-01-11 22:19:32',NULL),(47,'1000000002','1837463527','Tratamiento Post Operatorio',12,0.00,0.00,'2016-01-11 22:19:32',NULL),(48,'1000000003','1837463527','Tratamiento Post Operatorio',12,0.00,0.00,'2016-01-11 22:19:32',NULL),(49,'1000000004','1837463527','Tratamiento Post Operatorio',12,0.00,0.00,'2016-01-11 22:19:32',NULL),(50,'1000000005','1837463527','Tratamiento Post Operatorio',12,0.00,0.00,'2016-01-11 22:19:32',NULL),(51,'1000000006','1837463527','Tratamiento Post Operatorio',12,0.00,0.00,'2016-01-11 22:19:32',NULL),(52,'1000000007','1837463527','Tratamiento Post Operatorio',12,0.00,0.00,'2016-01-11 22:19:32',NULL),(53,'1000000008','1837463527','Tratamiento Post Operatorio',12,0.00,0.00,'2016-01-11 22:19:32',NULL),(54,'1000000009','1837463527','Tratamiento Post Operatorio',12,0.00,0.00,'2016-01-11 22:19:32',NULL),(55,'1000000010','1837463527','Tratamiento Post Operatorio',12,0.00,0.00,'2016-01-11 22:19:32',NULL),(56,'1000000011','1837463527','Tratamiento Post Operatorio',12,0.00,0.00,'2016-01-11 22:19:32',NULL),(57,'1000000012','1837463527','Tratamiento Post Operatorio',12,0.00,0.00,'2016-01-11 22:19:32',NULL),(58,'1000000013','1837463527','Tratamiento Post Operatorio',12,0.00,0.00,'2016-01-11 22:19:32',NULL),(59,'1000000014','1837463527','Tratamiento Post Operatorio',12,0.00,0.00,'2016-01-11 22:19:32',NULL),(60,'1000000015','1837463527','Tratamiento Post Operatorio',12,0.00,0.00,'2016-01-11 22:19:32',NULL),(61,'1000000016','1837463527','Tratamiento Post Operatorio',12,0.00,0.00,'2016-01-11 22:19:32',NULL),(62,'1000000017','1837463527','Tratamiento Post Operatorio',12,0.00,0.00,'2016-01-11 22:19:32',NULL),(63,'1000000018','1837463527','Tratamiento Post Operatorio',12,0.00,0.00,'2016-01-11 22:19:32',NULL),(64,'1000000019','1837463527','Tratamiento Post Operatorio',12,0.00,0.00,'2016-01-11 22:19:32',NULL),(65,'1000000020','1837463527','Tratamiento Post Operatorio',12,0.00,0.00,'2016-01-11 22:19:32',NULL),(66,'1000000021','1837463527','Tratamiento Post Operatorio',12,0.00,0.00,'2016-01-11 22:19:32',NULL),(67,'1000000022','1837463527','Tratamiento Post Operatorio',12,0.00,0.00,'2016-01-11 22:19:32',NULL),(68,'1000000023','1837463527','Tratamiento Post Operatorio',12,0.00,0.00,'2016-01-11 22:19:32',NULL),(69,'1000000024','1837463527','Tratamiento Post Operatorio',12,0.00,0.00,'2016-01-11 22:19:32',NULL),(70,'1000000025','1837463527','Tratamiento Post Operatorio',12,0.00,0.00,'2016-01-11 22:19:32',NULL),(71,'1000000026','1837463527','Tratamiento Post Operatorio',12,0.00,0.00,'2016-01-11 22:19:32',NULL),(72,'1000000027','1837463527','Tratamiento Post Operatorio',12,0.00,0.00,'2016-01-11 22:19:32',NULL),(73,'1000000028','1837463527','Tratamiento Post Operatorio',12,0.00,0.00,'2016-01-11 22:19:32',NULL),(74,'1000000029','1837463527','Tratamiento Post Operatorio',12,0.00,0.00,'2016-01-11 22:19:32',NULL),(75,'1000000030','1837463527','Tratamiento Post Operatorio',12,0.00,0.00,'2016-01-11 22:19:32',NULL),(76,'1000000031','1837463527','Tratamiento Post Operatorio',12,0.00,0.00,'2016-01-11 22:19:32',NULL),(77,'1000000032','1837463527','Tratamiento Post Operatorio',12,0.00,0.00,'2016-01-11 22:19:32',NULL),(78,'1000000033','1837463527','Tratamiento Post Operatorio',12,0.00,0.00,'2016-01-11 22:19:32',NULL),(79,'1000000034','1837463527','Tratamiento Post Operatorio',12,0.00,0.00,'2016-01-11 22:19:32',NULL),(80,'1000000035','1837463527','Tratamiento Post Operatorio',12,0.00,0.00,'2016-01-11 22:19:32',NULL),(81,'1000000036','1837463527','Tratamiento Post Operatorio',12,0.00,0.00,'2016-01-11 22:19:32',NULL),(82,'1000000037','1837463527','Tratamiento Post Operatorio',12,0.00,0.00,'2016-01-11 22:19:32',NULL),(83,'1000000038','1837463527','Tratamiento Post Operatorio',12,0.00,0.00,'2016-01-11 22:19:32',NULL),(84,'1000000039','1837463527','Tratamiento Post Operatorio',12,0.00,0.00,'2016-01-11 22:19:32',NULL),(85,'1000000040','1837463527','Tratamiento Post Operatorio',12,0.00,0.00,'2016-01-11 22:19:32',NULL),(86,'1000000041','1837463527','Tratamiento Post Operatorio',12,0.00,0.00,'2016-01-11 22:19:32',NULL),(87,'1000000042','1837463527','Tratamiento Post Operatorio',12,0.00,0.00,'2016-01-11 22:19:32',NULL),(88,'1000000043','1837463527','Tratamiento Post Operatorio',12,0.00,0.00,'2016-01-11 22:19:32',NULL),(89,'1000000044','1837463527','Tratamiento Post Operatorio',12,0.00,0.00,'2016-01-11 22:19:32',NULL),(90,'1000000045','1837463527','Tratamiento Post Operatorio',12,0.00,0.00,'2016-01-11 22:19:32',NULL),(91,'1000000046','1837463527','Tratamiento Post Operatorio',12,0.00,0.00,'2016-01-11 22:19:32',NULL),(92,'1000000047','1837463527','Tratamiento Post Operatorio',12,0.00,0.00,'2016-01-11 22:19:32',NULL),(93,'1000000048','1837463527','Tratamiento Post Operatorio',12,0.00,0.00,'2016-01-11 22:19:32',NULL),(94,'1000000049','1837463527','Tratamiento Post Operatorio',12,0.00,0.00,'2016-01-11 22:19:32',NULL),(95,'1000000050','1837463527','Tratamiento Post Operatorio',12,0.00,0.00,'2016-01-11 22:19:32',NULL),(96,'1000000051','1837463527','Tratamiento Post Operatorio',12,0.00,0.00,'2016-01-11 22:19:32',NULL),(97,'1000000052','1837463527','Tratamiento Post Operatorio',12,0.00,0.00,'2016-01-11 22:19:32',NULL),(98,'1000000053','1837463527','Tratamiento Post Operatorio',12,0.00,0.00,'2016-01-11 22:19:32',NULL),(99,'1000000054','1837463527','Tratamiento Post Operatorio',12,0.00,0.00,'2016-01-11 22:19:32',NULL),(100,'1000000055','1837463527','Tratamiento Post Operatorio',12,0.00,0.00,'2016-01-11 22:19:32',NULL),(101,'1000000056','1837463527','Tratamiento Post Operatorio',12,0.00,0.00,'2016-01-11 22:19:32',NULL),(102,'1000000057','1837463527','Tratamiento Post Operatorio',12,0.00,0.00,'2016-01-11 22:19:32',NULL),(103,'1000000058','1837463527','Tratamiento Post Operatorio',12,0.00,0.00,'2016-01-11 22:19:32',NULL),(104,'1000000059','1837463527','Tratamiento Post Operatorio',12,0.00,0.00,'2016-01-11 22:19:32',NULL),(105,'1000000060','1837463527','Tratamiento Post Operatorio',12,0.00,0.00,'2016-01-11 22:19:32',NULL),(106,'1000000061','1837463527','Tratamiento Post Operatorio',12,0.00,0.00,'2016-01-11 22:19:32',NULL),(107,'1000000062','1837463527','Tratamiento Post Operatorio',12,0.00,0.00,'2016-01-11 22:19:32',NULL),(108,'1000000063','1837463527','Tratamiento Post Operatorio',12,0.00,0.00,'2016-01-11 22:19:32',NULL),(109,'1000000064','1837463527','Tratamiento Post Operatorio',12,0.00,0.00,'2016-01-11 22:19:32',NULL),(110,'1000000065','1837463527','Tratamiento Post Operatorio',12,0.00,0.00,'2016-01-11 22:19:32',NULL),(111,'1000000066','1837463527','Tratamiento Post Operatorio',12,0.00,0.00,'2016-01-11 22:19:32',NULL),(112,'1000000067','1837463527','Tratamiento Post Operatorio',12,0.00,0.00,'2016-01-11 22:19:32',NULL),(113,'1000000068','1837463527','Tratamiento Post Operatorio',12,0.00,0.00,'2016-01-11 22:19:32',NULL),(114,'1000000069','1837463527','Tratamiento Post Operatorio',12,0.00,0.00,'2016-01-11 22:19:32',NULL),(115,'1000000070','1837463527','Tratamiento Post Operatorio',12,0.00,0.00,'2016-01-11 22:19:32',NULL),(116,'1000000001','1837463527','Tratamiento Post Operatorio',12,0.00,0.00,'2016-01-11 22:19:32',NULL),(117,'1000000002','1837463527','Tratamiento Post Operatorio',10,0.00,0.00,'2016-01-11 22:19:32',NULL),(118,'1000000003','1837463527','Tratamiento Post Operatorio',15,0.00,0.00,'2016-01-11 22:19:32',NULL),(119,'1000000004','1837463527','Tratamiento Post Operatorio',10,0.00,0.00,'2016-01-11 22:19:32',NULL),(120,'1000000005','1837463527','Tratamiento Post Operatorio',10,0.00,0.00,'2016-01-11 22:19:32',NULL),(121,'1000000006','1837463527','Tratamiento Post Operatorio',10,0.00,0.00,'2016-01-11 22:19:32',NULL),(122,'1000000007','1837463527','Tratamiento Post Operatorio',10,0.00,0.00,'2016-01-11 22:19:32',NULL),(123,'1000000008','1837463527','Tratamiento Post Operatorio',12,0.00,0.00,'2016-01-11 22:19:32',NULL),(124,'1000000009','1837463527','Tratamiento Post Operatorio',10,0.00,0.00,'2016-01-11 22:19:32',NULL),(125,'1000000010','1837463527','Tratamiento Post Operatorio',10,0.00,0.00,'2016-01-11 22:19:32',NULL),(126,'1000000011','1837463527','Tratamiento Post Operatorio',12,0.00,0.00,'2016-01-11 22:19:32',NULL),(127,'1000000012','1837463527','Tratamiento Post Operatorio',9,0.00,0.00,'2016-01-11 22:19:32',NULL),(128,'1000000013','1837463527','Tratamiento Post Operatorio',10,0.00,0.00,'2016-01-11 22:19:32',NULL),(129,'1000000014','1837463527','Tratamiento Post Operatorio',9,0.00,0.00,'2016-01-11 22:19:32',NULL),(130,'1000000015','1837463527','Tratamiento Post Operatorio',15,0.00,0.00,'2016-01-11 22:19:32',NULL),(131,'1000000016','1837463527','Tratamiento Post Operatorio',10,0.00,0.00,'2016-01-11 22:19:32',NULL),(132,'1000000017','1837463527','Tratamiento Post Operatorio',10,0.00,0.00,'2016-01-11 22:19:32',NULL),(133,'1000000018','1837463527','Tratamiento Post Operatorio',12,0.00,0.00,'2016-01-11 22:19:32',NULL),(134,'1000000019','1837463527','Tratamiento Post Operatorio',10,0.00,0.00,'2016-01-11 22:19:32',NULL),(135,'1000000020','1837463527','Tratamiento Post Operatorio',12,0.00,0.00,'2016-01-11 22:19:32',NULL),(136,'1000000021','1837463527','Tratamiento Post Operatorio',15,0.00,0.00,'2016-01-11 22:19:32',NULL),(137,'1000000022','1837463527','Tratamiento Post Operatorio',10,0.00,0.00,'2016-01-11 22:19:32',NULL),(138,'1000000023','1837463527','Tratamiento Post Operatorio',15,0.00,0.00,'2016-01-11 22:19:32',NULL),(139,'1000000024','1837463527','Tratamiento Post Operatorio',9,0.00,0.00,'2016-01-11 22:19:32',NULL),(140,'1000000025','1837463527','Tratamiento Post Operatorio',9,0.00,0.00,'2016-01-11 22:19:32',NULL),(141,'1000000026','1837463527','Tratamiento Post Operatorio',10,0.00,0.00,'2016-01-11 22:19:32',NULL),(142,'1000000027','1837463527','Tratamiento Post Operatorio',10,0.00,0.00,'2016-01-11 22:19:32',NULL),(143,'1000000028','1837463527','Tratamiento Post Operatorio',10,0.00,0.00,'2016-01-11 22:19:32',NULL),(144,'1000000029','1837463527','Tratamiento Post Operatorio',10,0.00,0.00,'2016-01-11 22:19:32',NULL),(145,'1000000030','1837463527','Tratamiento Post Operatorio',12,0.00,0.00,'2016-01-11 22:19:32',NULL),(146,'1000000031','1823533946','Tratamiento Post Operatorio',10,0.00,0.00,'2016-01-11 22:19:32',NULL),(147,'1000000032','1823533946','Tratamiento Post Operatorio Cascada',9,0.00,0.00,'2016-01-11 22:19:32',NULL);
/*!40000 ALTER TABLE `tratamiento` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER TRATAMIENTOS_AFTER_INSERT
	AFTER INSERT ON tratamiento FOR EACH ROW
	BEGIN
		  -- se ingresa en el log de actividades    
    INSERT INTO `log_user`
	(`accion`, `tabla`, `new_data`)
    VALUES(
    'insert',
    'tratamiento',
    CONCAT(NEW.id_tratamiento, ';' , NEW.id_paciente, ';' ,
			NEW.nro_sesiones, ';' ,NEW.motivo_tratamiento, ';' 
            ,NEW.costo)
    );
	END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER TRATAMIENTOS_AFTER_UPDATE
	AFTER UPDATE ON tratamiento FOR EACH ROW
	BEGIN
		  -- se ingresa en el log de actividades    
    INSERT INTO `log_user`
	(`accion`, `tabla`, `old_data`, `new_data`)
    VALUES(
    'update',
    'tratamiento',
    CONCAT(OLD.id_tratamiento, ';' , OLD.id_paciente, ';' ,
			OLD.nro_sesiones, ';' ,OLD.motivo_tratamiento, ';' 
            ,OLD.costo),
            CONCAT(NEW.id_tratamiento, ';' , NEW.id_paciente, ';' ,
			NEW.nro_sesiones, ';' ,NEW.motivo_tratamiento, ';' 
            ,NEW.costo)
    );
	END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER TRATAMIENTOS_AFTER_DELETE
	AFTER DELETE ON tratamiento FOR EACH ROW
	BEGIN
		  -- se ingresa en el log de actividades    
    INSERT INTO `log_user`
	(`accion`, `tabla`, `new_data`)
    VALUES(
    'delete',
    'tratamiento',
    CONCAT(OLD.id_tratamiento, ';' , OLD.id_paciente, ';' ,
			OLD.nro_sesiones, ';' ,OLD.motivo_tratamiento, ';' 
            ,OLD.costo)
    );
	END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
) ENGINE=InnoDB AUTO_INCREMENT=1001 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1000,'mediperbarica',1453328240,'0','eduardo','Eduardo','Villota','eduardouio7@gmail.com','2015-07-15 18:18:21');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-01-21 17:26:20
