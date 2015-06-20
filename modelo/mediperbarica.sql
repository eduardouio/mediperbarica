-- MySQL dump 10.13  Distrib 5.5.43, for debian-linux-gnu (x86_64)
--
-- Host: 127.0.0.1    Database: gelvscom_mediperbarica
-- ------------------------------------------------------
-- Server version 5.5.43-0ubuntu0.14.04.1

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
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `antecedente`
--

LOCK TABLES `antecedente` WRITE;
/*!40000 ALTER TABLE `antecedente` DISABLE KEYS */;
INSERT INTO `antecedente` VALUES (1,'1998444444','Alerjia al Frio','Se tiene alregjia al frio cuando no esta haceido mucho sol','2015-05-03 04:14:04'),(2,'1998444444','Alerjia a PEnicilina','Sufre la alerjia desde el 2015','2015-05-03 04:14:04'),(3,'1700000987','Operacion de los rinones','se le operaron los rinines hace tres anios','2015-05-03 04:16:20'),(4,'1700000987','alerjia a los calmates','no se que mas poner','2015-05-03 04:16:20'),(5,'1722919725','alerjia al calor','le quema mucho y casi se muere','2015-05-03 04:16:20'),(6,'1722919725','alerjia a no banarse','no puede vivir sin banarse','2015-05-03 04:16:20'),(7,'1722919725','Alerjia a nada','no tiene alerjia a nada','2015-05-03 04:16:20'),(8,'1722919725','Nuevosss','Nuevdosss','2015-05-03 07:06:35'),(9,'1722919725','Kdsghj','Kjhgdsdfghjkl','2015-05-03 07:07:03'),(10,'1709720369','Primer Antecedente','Asjsjs Sjsjjs','2015-05-03 07:18:04'),(11,'1709720369','Claustrofoboa','Tiene Clautrofobia A 3 Minoas','2015-05-03 07:32:42'),(12,'1709720369','Tiene Frio','Que Mal','2015-05-03 07:33:37'),(13,'1522288811','Almenos','3stamos En A','2015-05-03 07:46:25'),(14,'1522288811','Segundo Antecedente','Este Es El Sugndo Anelemd','2015-05-03 07:47:29'),(15,'1522288811','Tercera','Detalle Del Tercer Anecedente A Ginasl','2015-05-03 07:48:08'),(16,'1522288811','Cuanrto Antecedete','Este Es El Cuardo Antecedee','2015-05-03 07:48:24'),(17,'1726355555','Alergia Al Polen','Le Produce Mucosidad En Exseso','2015-05-03 07:51:02'),(18,'1522288811','Mi Lals','Alslasas','2015-05-03 07:52:48'),(19,'8700001101','Primera','Segunda','2015-05-03 08:26:06'),(20,'8700001101','Cuarta','Tererea','2015-05-03 08:26:13'),(21,'9520001111','Primer Antecedente Chocho','Este Es El Pimer Antecedente Del Chpc','2015-05-03 21:54:19'),(22,'7653234567','Malals','Lsallsa','2015-05-03 23:23:15'),(23,'1726355555','Operacion De Pacreas','Tiene Una Operacion Que Le Fue Practicada Hace Un Anio','2015-05-03 23:28:55'),(24,'1230002222','Alerjia La Frio','Tiene Alerjia Al Frio','2015-05-04 00:11:46'),(25,'1726355555','Frio Execidos','Klslksd','2015-05-04 17:02:57'),(26,'9876543651','Medicamenteo','Alergias A Los Medcamentos Con Trigleceridos Com Azucas','2015-05-11 13:22:58'),(27,'1816200091','Prier Antecedente','Este Es El Primer Antecedente','2015-05-11 19:53:07'),(28,'1816200091','Sedunfo Antecehatfa','Este Son Los Detaeles Del Segunrto Antecdesnre','2015-05-11 19:54:42'),(29,'8154578944','Cmo Se Limpia','Xomoa De Alsajs','2015-05-11 20:44:42'),(30,'1816200091','Tercer Antecedente','Detalle Del Tercer Antecedente Editado Al Final','2015-05-12 04:06:43'),(31,'1816200091','Cuarto Antecedente','Detalle Del Cuasrto Ntndeca','2015-05-12 04:08:02'),(32,'1816200091','Quinto Atecedente','Detalle Del Quinfo Atecedente','2015-05-12 04:08:47'),(33,'1816200091','Ultimo','Este El Sl Ultimo Antecedente','2015-05-12 04:12:44');
/*!40000 ALTER TABLE `antecedente` ENABLE KEYS */;
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
  `mail` varchar(45) DEFAULT NULL,
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
INSERT INTO `cliente` VALUES ('0300925005',' Ruth Cárdenas','2432020',NULL,'Mariana De Jesús Y Nuño De Valderrama','2015-03-19 21:42:27'),('0400498283',' Josefina Carrasco','2543222',NULL,'Valparaiso N1260 Y Castro','2015-03-19 21:42:27'),('0400570354',' Rosario Orbe','3340915',NULL,'Golondrinas  E19-48 Y El Quinde','2015-03-19 21:42:27'),('0501976815',' Mónica Salgado','2477829',NULL,'Carcelén Calle Modesto Chavez Oe3-733 Y Alberto Einstein','2015-03-19 21:42:27'),('0519293011',' Sharon Alejandra Castro Moren','2330720',NULL,'Calle Latacunga Casa 3 Y Riobamba','2015-03-19 21:42:27'),('0602424806',' Ana María Kellendonk','2691648',NULL,'Ciudadela Del Ejército','2015-03-19 21:42:27'),('0602485203',' MARIA ESTHER CASTILLO MUÑOS','2921307',NULL,'JORGE EDRON Y JOSE ARIZAGA','2015-03-19 21:42:27'),('0602485204',' María Esther Castillo Muños','2921307',NULL,'Sin Datos','2015-03-19 21:42:27'),('0671367803',' Beatriz Cecilia Proaño','2385995',NULL,'Sangolqui, San José Del Valle','2015-03-19 21:42:27'),('0702502998',' Verónica Arteaga','2469000',NULL,'Urb. Las Bromelias Calle 2 E16-34 Y Membrillos','2015-03-19 21:42:27'),('0702875444',' Pamela Pinto','2253017',NULL,'Eloy Alfaro Y Gaspar De Villarroel','2015-03-19 21:42:27'),('0908570823','Betty Alicia Echeverria Morla','6036024',NULL,'Cumbaya. Francisco De Orellana 111','2015-03-19 21:42:27'),('0914422142',' Lila Cárdenas','2270572',NULL,'Av. El Parque 158 Y Calle 6Ta','2015-03-19 21:42:27'),('1000616019',' Magdalena Uvidia','2249108',NULL,'Calle 5 N44-92 Y Av El Parque','2015-03-19 21:42:27'),('1001136678',' Elizabeth Vera','2520384',NULL,'Lizarazu N23 Y La Gasca','2015-03-19 21:42:27'),('1002111746',' Karla Vidal Romo','6038163',NULL,'Cumbaya','2015-03-19 21:42:27'),('1002332649',' Ana María Fiallo','2251351',NULL,'Av. 6 De Diciembre Y La Niña','2015-03-19 21:42:27'),('1100341872',' Camila Torres','2466456',NULL,'Pasaje José Puerta 211 Y Av. Eloy Alfaro','2015-03-19 21:42:27'),('1100775863',' Guisela Paladines Remirez','2445864',NULL,'Seymur 4351 Y Tomas De Berlanga','2015-03-19 21:42:27'),('1111111111',' Patricia Vaca','2417350',NULL,'Sin Datos','2015-03-19 21:42:27'),('1212121212',' María Daniela Ricaurte','2259009',NULL,'Las Azucenas N 467-69 Y Eloy Alfaro','2015-03-19 21:42:27'),('1306898444',' Miriam Garcia','2416659',NULL,'Urabá De Carcelén','2015-03-19 21:42:27'),('1612125523',' Cristine Fredericks','2228571',NULL,'Pasaje Diego Herrera N° 146 Y Santa Rosa','2015-03-19 21:42:27'),('1702735174',' Patricia Darquea','2448842',NULL,'Mañosca 812','2015-03-19 21:42:27'),('1702963420',' Esperanza Escobar','2443154',NULL,'Edmundo Carvajal Pasaje B Casa 45','2015-03-19 21:42:27'),('1703843191',' Raquel Acevedo','3540343',NULL,'Tumbaco Norberto Salazar','2015-03-19 21:42:27'),('1704060981',' Sandra Susana Basante','2251351',NULL,'Nuñes De Vela E3-37','2015-03-19 21:42:27'),('1704558695',' Betty Palacio','3263939',NULL,'Colinas Del Pichincha','2015-03-19 21:42:27'),('1704973401',' Jeovanna Arboleda','2860947',NULL,'San Rafael Vía Al Tingo','2015-03-19 21:42:27'),('1705028056',' Ivon Fabara','2977600',NULL,'Av. Eloy Alfaro N36-25','2015-03-19 21:42:27'),('1705403713',' Elsa Moreno','2352575',NULL,'Pusuqui 643','2015-03-19 21:42:27'),('1706023627',' MONICA PATRICIA GUZMAN','2440253',NULL,'JERONIMO LEYTON  N S 53 127 Y LA GASCA','2015-03-19 21:42:27'),('1706539382',' María  Isabel Saenz','2557290',NULL,'San Juan Alto Cumbaya','2015-03-19 21:42:27'),('1706625900',' María Eugenia Valencia','2475709',NULL,'Los Olmos 251 Y <Miguel Angel Cumbaya','2015-03-19 21:42:27'),('1707241988',' Vicky Redin','2407648',NULL,'Sebastian Guarderas Oe2-69 Y Manuel De La Peña','2015-03-19 21:42:27'),('1707244462',' Mónica Arellano','2261292',NULL,'Cochapata E12-83','2015-03-19 21:42:27'),('1707246326','Millicent Chiriboga Hurtado','2419613',NULL,'Pasaje Be1534 Por El Colegio Sek','2015-03-19 21:42:27'),('1707298269',' Sandra Borja','2408744',NULL,'Rafael Ramos E1-14','2015-03-19 21:42:27'),('1707349518',' Margarita Aviles','3340617',NULL,'Monteserrin Edificio Belmonte','2015-03-19 21:42:27'),('1707738702',' Paola Andrade','2556619',NULL,'Av. 12 De Octubre 26-25','2015-03-19 21:42:27'),('1708089550',' Pamela Mata','2921465',NULL,'Los Naranjos E16-183','2015-03-19 21:42:27'),('1708349665',' Miriam Velasco','2240377',NULL,'Finlandia 3613 Y Suecia','2015-03-19 21:42:27'),('1708483357',' Paulina Reyes','2897081',NULL,'Urb. La Campiña','2015-03-19 21:42:27'),('1708591993',' María Eucaris Pelaez Alzate','2812328',NULL,'Norte De La Ciudad','2015-03-19 21:42:27'),('1708671282',' Doris Gordón','2422672',NULL,'La Puntilla Mzd11 Carapungo','2015-03-19 21:42:27'),('1709242539',' Macarena Reinoso','2270483',NULL,'Portugal 600 Y 6 De Diciembre','2015-03-19 21:42:27'),('1709340465',' MARIA ENITH CARPIO MENDIETA','2330023',NULL,'SANGOLQUI CALLE 10 DE AGOSTO N° 33','2015-03-19 21:42:27'),('1709626640',' Fernando Espinoza','2688130',NULL,'Enrique Garcés Cabrera S18-85','2015-03-19 21:42:27'),('1709720369',' MARIA FERNANDA SALAZAR TORRES','3265417',NULL,'LOS ALAMOS Y GUAYACANES EDF. MURO DEP. 20','2015-03-19 21:42:27'),('1709866105',' Rocio Flores','3354515',NULL,'El Bosque Alta Vista Iñaquito','2015-03-19 21:42:27'),('1710134899',' Karolina Ayala Villavicencio','2434152',NULL,'Condominios El Inca Bloque 73 Dep. 3A','2015-03-19 21:42:27'),('1710190503',' Patricia Carrasco','2584974',NULL,'Rios N959 Y Oriente','2015-03-19 21:42:27'),('1711164069',' María Jervis','2458022',NULL,'Av. Gaspar De Villarroel Y Abascal','2015-03-19 21:42:27'),('1711264133',' María Campoverde','2807995',NULL,'Urb. Balcon Del Norte Lote 105','2015-03-19 21:42:27'),('1712125523',' Cristine Fredericks','2228571',NULL,'Pasaje Diego Herrera N° 146 Y Santa Rosa','2015-03-19 21:42:27'),('1712248770',' Lucia Rubio Ruiz','2424129',NULL,'Conjunto Ramada Del <<<<Pinar 3 Casa 6','2015-03-19 21:42:27'),('1712646197',' Ibeth Alpala','3823094',NULL,'Panamericana Norte El Olivar 2','2015-03-19 21:42:27'),('1713091815',' Ma. De Los Angeles Carrasco','2531517',NULL,'Oe 8 B Y Antonio Reyes San Carlos','2015-03-19 21:42:27'),('1713101501',' Laura Rodriguez','2268433',NULL,'Otilones N40-498 Y Camilo Gallegos','2015-03-19 21:42:27'),('1713767323',' Ana Llaguno','2494836',NULL,'El Condado José María Guerrero N68-106 E Ignacio De Loyola','2015-03-19 21:42:27'),('1714328729',' Alexandra Shauri','2482685',NULL,'José Ponce Martinez N73-76','2015-03-19 21:42:27'),('1714357579',' Gabriela Aguilera','2338461',NULL,'Av. Imbabura Y El Inca Sangolqui','2015-03-19 21:42:27'),('1714821913',' Nataly Cevallos','2231516',NULL,'Av. Universitaria Oe7-157','2015-03-19 21:42:27'),('1716024565',' Gabriela Elizabeth Muñoz Real','2530410',NULL,'Amazonas N28 17 Y Alemania','2015-03-19 21:42:27'),('1716720204',' Andrea Vaca','2476675',NULL,'Agua Clara Y Los Arroyos','2015-03-19 21:42:27'),('1722919725','Eduardo Vinicio Villota Montenegro','22226906',NULL,'Av. Colon E4-412','2015-03-19 21:42:27'),('1801407477',' Ivan Villacís','99442503',NULL,'Panamericana Orte Km. 9 Y Medio','2015-03-19 21:42:27'),('1803287877','Santiago Rodriguea Ballesteros','2252199',NULL,'Cochapata Y Abascal Edif. Alcazar 2000','2015-03-19 21:42:27');
/*!40000 ALTER TABLE `cliente` ENABLE KEYS */;
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
  `subtotal` decimal(6,2) DEFAULT NULL,
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
  `direccion_familiar` varchar(50) DEFAULT NULL,
  `creado` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_paciente`),
  UNIQUE KEY `id_historia` (`id_historia`)
) ENGINE=InnoDB AUTO_INCREMENT=180 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `historia`
--

LOCK TABLES `historia` WRITE;
/*!40000 ALTER TABLE `historia` DISABLE KEYS */;
INSERT INTO `historia` VALUES (54,'','17','','0000-00-00','','',NULL,NULL,NULL,NULL,NULL,NULL,'2015-03-27 19:53:13'),(1,'0400498283',' Josefina Carrasco','2543222','1987-03-18','','Valparaiso N1260 Y Castro',NULL,NULL,NULL,NULL,NULL,NULL,'2015-03-19 22:26:31'),(2,'0400570354',' Rosario Orbe','3340915','1972-12-31','','Golondrinas  E19-48 Y El Quinde',NULL,NULL,NULL,NULL,NULL,NULL,'2015-03-19 22:26:31'),(172,'0400876543','Panfilo Mueses Mueses','8765432345','2010-02-02','panfilo@hma.com','La Comuna','Eduardo Villota','','eduardouio7@gmail.com','kimberly mueses','0927266262','','2015-05-02 13:59:36'),(3,'0501976815',' Mónica Salgado','2477829','1999-01-21','','Carcelén Calle Modesto Chavez Oe3-733 Y Alberto Einstein',NULL,NULL,NULL,NULL,NULL,NULL,'2015-03-19 22:26:31'),(4,'051929301',' Sharon Alejandra Castro Moreno','2330720','1961-01-02','','Calle Latacunga Casa 3 Y Riobamba',NULL,NULL,NULL,NULL,NULL,NULL,'2015-03-19 22:26:31'),(5,'0602424806',' Ana María Kellendonk','2691648','1976-09-06','','Ciudadela Del Ejército',NULL,NULL,NULL,NULL,NULL,NULL,'2015-03-19 22:26:31'),(6,'0602485203',' María Esther Castillo Muños','2921307','2000-01-01','','Sin Datos',NULL,NULL,NULL,NULL,NULL,NULL,'2015-03-19 22:26:31'),(7,'0671367803',' Beatriz Cecilia Proaño','2385995','2001-04-12','','Sangolqui, San José Del Valle',NULL,NULL,NULL,NULL,NULL,NULL,'2015-03-19 22:26:31'),(8,'0702502998',' Verónica Arteaga','2469000','1961-01-03','','Urb. Las Bromelias Calle 2 E16-34 Y Membrillos',NULL,NULL,NULL,'Juan Garcia','023231231','La Gasca','2015-03-19 22:26:31'),(9,'0702875444',' Pamela Pinto','2253017','1976-09-07','','Eloy Alfaro Y Gaspar De Villarroel',NULL,NULL,NULL,NULL,NULL,NULL,'2015-03-19 22:26:31'),(10,'0908570823','Betty Alicia Echeverria Morla','6036024','2000-01-02','','Cumbaya. Francisco De Orellana 111',NULL,NULL,NULL,NULL,NULL,NULL,'2015-03-19 22:26:31'),(11,'0914422142',' Lila Cárdenas','2270572','2001-04-13','','Av. El Parque 158 Y Calle 6Ta',NULL,NULL,NULL,NULL,NULL,NULL,'2015-03-19 22:26:31'),(170,'0988887655','La Poblacion De Mexico','0976543234','2010-02-02','ejejje@ksjsco.com','La Comuna','','','','','','vive en la indienca','2015-05-02 13:26:46'),(12,'1000616019',' Magdalena Uvidia','2249108','1961-01-04','','Calle 5 N44-92 Y Av El Parque',NULL,NULL,NULL,NULL,NULL,NULL,'2015-03-19 22:26:31'),(13,'1001136678',' Elizabeth Vera','2520384','1976-09-08','','Lizarazu N23 Y La Gasca',NULL,NULL,NULL,NULL,NULL,NULL,'2015-03-19 22:26:31'),(14,'1002111746',' Karla Vidal Romo','6038163','2000-01-03','','Cumbaya',NULL,NULL,NULL,'Pedro Pilay','03112872','Latacunga','2015-03-19 22:26:31'),(15,'1002332649',' Ana María Fiallo','2251351','2001-04-14','','Av. 6 De Diciembre Y La Niña',NULL,NULL,NULL,NULL,NULL,NULL,'2015-03-19 22:26:31'),(68,'1004567354','Kimbery Mueses','0983764647','2011-01-07','kimbo@outlook.com','La Comuna',NULL,NULL,NULL,NULL,NULL,NULL,'2015-04-17 04:33:10'),(70,'1004567366','Kimbery Mueses','0983764647','2011-01-07','kimbo@outlook.com','La Comuna',NULL,NULL,NULL,NULL,NULL,NULL,'2015-04-17 04:36:40'),(69,'1004567399','Kimbery Mueses','0983764647','2011-01-07','kimbo@outlook.com','La Comuna',NULL,NULL,NULL,NULL,NULL,NULL,'2015-04-17 04:34:08'),(16,'1100341872',' Camila Torres','2466456','1961-01-05','','Pasaje José Puerta 211 Y Av. Eloy Alfaro',NULL,NULL,NULL,NULL,NULL,NULL,'2015-03-19 22:26:31'),(17,'1100775863',' Guisela Paladines Remirez','2445864','1976-09-09','','Seymur 4351 Y Tomas De Berlanga',NULL,NULL,NULL,NULL,NULL,NULL,'2015-03-19 22:26:31'),(18,'1111111111',' Patricia Vaca','2417350','2000-01-04','','Sin Datos',NULL,NULL,NULL,NULL,NULL,NULL,'2015-03-19 22:26:31'),(19,'1212121212',' María Daniela Ricaurte','2259009','2001-04-15','','Las Azucenas N 467-69 Y Eloy Alfaro',NULL,NULL,NULL,NULL,NULL,NULL,'2015-03-19 22:26:31'),(77,'1222222222','Historia de Ejemplo','1234565432','0000-00-00','','',NULL,NULL,NULL,NULL,NULL,NULL,'2015-04-17 04:45:10'),(76,'1223401255','Kimberly S Mueses','0983764647','2011-01-07','kimbo@outlook.com','La Comuna',NULL,NULL,NULL,NULL,NULL,NULL,'2015-04-17 04:44:41'),(67,'1224567354','Kimbery Mueses','0983764647','2011-01-07','kimbo@outlook.com','La Comuna',NULL,NULL,NULL,NULL,NULL,NULL,'2015-04-17 04:29:45'),(174,'1230002222','Alf Grenger','0976677777','1990-06-05','Alf@alf.com','La Comuna De Sabra Latina','Medico Referente','0752345675','Elian@kkkd.com','Referencia Familiar','0857898765','Las Casas 22-3 Lalslsllss','2015-05-03 02:02:24'),(90,'12322123u3','Ediatdod dkdkdk dkdk','9988287887','2013-08-27','jdjd@fks.com','kdkdkssldkdjddjdldjd',NULL,NULL,NULL,NULL,NULL,NULL,'2015-04-25 03:21:40'),(151,'1234432111','skjdhdhdhdhdhdh','9876543234','1980-02-28','ramonalcides957@hotmail.es','fghjhgfdsdfghgfdsdfghgfdsadfgh',NULL,NULL,NULL,NULL,NULL,NULL,'2015-04-30 06:01:36'),(91,'1234560000','Edjhaksjhd askdjhakjhasdk k','0987654323','2014-10-30','eduados@ha.com','qwiuyqwqw qwqjhgwjq qjvwjqhgqw',NULL,NULL,NULL,NULL,NULL,NULL,'2015-04-27 20:33:08'),(83,'1234565432','Algo Con Alguien','9865452678','2015-12-31','dwjfhjhf@jhdj.com','direcosososos',NULL,NULL,NULL,NULL,NULL,NULL,'2015-04-17 05:01:31'),(85,'1234565456','Ediadkhd dkjsks','937euo7272','2015-12-31','ramonalcides957@hotmail.es','Elkjlaskdjlajsdlakjsdlkajsd',NULL,NULL,NULL,NULL,NULL,NULL,'2015-04-24 01:49:52'),(102,'1234566543','eeeeeeeeeeeeeeeeeeeeeeee','2222222222','2015-04-30','edulala@llal','las casas e333333',NULL,NULL,NULL,NULL,NULL,NULL,'2015-04-28 05:23:10'),(66,'1234567354','Kimbery Mueses','0983764647','2011-01-07','kimbo@outlook.com','La Comuna',NULL,NULL,NULL,NULL,NULL,NULL,'2015-04-17 04:28:55'),(65,'1234567654','Kimbery Mueses','0983764647','2011-01-07','kimbo@outlook.com','La Comuna',NULL,NULL,NULL,NULL,NULL,NULL,'2015-04-17 04:27:46'),(158,'1234567765','Ddddddd D D  D   Sssss','0876543234','1991-02-27','Eduaraias@hma.com','A Direccion De Mi Casa',NULL,NULL,NULL,NULL,NULL,NULL,'2015-04-30 17:38:29'),(103,'1234567876','Datos de Entrada','0226363535','1987-09-09','eduardo@sln-ec.com','Estae es el registro de fuego',NULL,NULL,NULL,NULL,NULL,NULL,'2015-04-29 02:45:39'),(154,'1234567898','--- SELECT','0222010101','2015-04-30','ramonalcides957@hotmail.es','qUITONS SNSNS',NULL,NULL,NULL,NULL,NULL,NULL,'2015-04-30 15:03:25'),(86,'1243234323','Eduardo Villot','0232031020','2015-12-31','eduardo@dkdkdk.com','Quiro, 1722919191',NULL,NULL,NULL,NULL,NULL,NULL,'2015-04-25 02:51:44'),(20,'1306898444',' Miriam Garcia','2416659','1961-01-06','','Urabá De Carcelén',NULL,NULL,NULL,'Juan Oso','09873548','Av. 10 de Agosto y Juan Loen Mera','2015-03-19 22:26:31'),(177,'1522288811','Sksjssjnjsnd Fjnkjfhiudf Kasdksh','0836377773','2005-11-24','Algo@kdfkhfd.vm','La Casas De Lasd Casda,','Mediakcl Ce Ee','0929282828','Laksjljd@gaism.com','Mendiaasdd ,Asdkhn','0983736888','Quislsk Asjdkjahsd','2015-05-03 02:07:39'),(21,'1612125523',' Cristine Fredericks','2228571','1976-09-10','','Pasaje Diego Herrera N° 146 Y Santa Rosa',NULL,NULL,NULL,NULL,NULL,NULL,'2015-03-19 22:26:31'),(55,'17','','','0000-00-00','','',NULL,NULL,NULL,NULL,NULL,NULL,'2015-03-27 19:53:36'),(161,'1700000076','Mariano Suarez Veintimlla Ddddd','0992936569','1931-03-12','ramSSSSSonalcides957@hotmail.es','La Comuna De Santa Clasra','DR MANUEL OBRADOR','0987654323','MANUE/lllll@GMAIL.COM','JSJSJSJSJS JSJSJSJ','9876543234','CIUADA DE GAMIALAB','2015-04-30 18:02:54'),(57,'1700000111','Elian Villota Catagña','022226906','0000-00-00','elianuio@gmail.com','Quito, Av. Colon E4-412 y Amazonas',NULL,NULL,NULL,'Eduardo Villota','0992936569','La comuna, Calle 12 de Octubre','2015-03-27 22:10:03'),(160,'1700000987','Eduardo Villota','023203161','2019-11-12','ramonalcides957@hotmail.es','La Comuna',NULL,NULL,NULL,NULL,NULL,NULL,'2015-04-30 18:01:33'),(162,'1702227645','Eduaujd','0986543234','2014-01-28','ramonalcides957@hotmail.es','Akaja Aja Aj Aja Ja Ja',NULL,NULL,NULL,NULL,NULL,NULL,'2015-04-30 18:28:57'),(22,'1702735174',' Patricia Darquea','2448842','2000-01-05','','Mañosca 812',NULL,NULL,NULL,NULL,NULL,NULL,'2015-03-19 22:26:31'),(23,'1702963420',' Esperanza Escobar','2443154','2001-04-16','','Edmundo Carvajal Pasaje B Casa 45',NULL,NULL,NULL,NULL,NULL,NULL,'2015-03-19 22:26:31'),(24,'1703843191',' Raquel Acevedo','3540343','2002-07-27','','Tumbaco Norberto Salazar',NULL,NULL,NULL,NULL,NULL,NULL,'2015-03-19 22:26:31'),(25,'1704060981',' Sandra Susana Basante','2251351','2003-11-06','','Nuñes De Vela E3-37',NULL,NULL,NULL,NULL,NULL,NULL,'2015-03-19 22:26:31'),(53,'1704244670','Gustavo Vaca Soto','0992724510','1988-01-06','gusvac@gmail.com','Quito, Colon E4-412 y Amazonas',NULL,NULL,NULL,NULL,NULL,NULL,'2015-03-27 19:37:27'),(26,'1704558695',' Betty Palacio','3263939','2005-02-15','','Colinas Del Pichincha',NULL,NULL,NULL,NULL,NULL,NULL,'2015-03-19 22:26:31'),(27,'1704973401',' Jeovanna Arboleda','2860947','2006-05-28','','San Rafael Vía Al Tingo',NULL,NULL,NULL,NULL,NULL,NULL,'2015-03-19 22:26:31'),(28,'1705028056',' Ivon Fabara','2977600','1982-04-12','','Av. Eloy Alfaro N36-25',NULL,NULL,NULL,NULL,NULL,NULL,'2015-03-19 22:26:31'),(29,'1705403713',' Elsa Moreno','2352575','1991-01-01','','Pusuqui 643',NULL,NULL,NULL,NULL,NULL,NULL,'2015-03-19 22:26:31'),(30,'1706023627',' MONICA PATRICIA GUZMAN','2440253','1999-09-22','','JERONIMO LEYTON  N S 53 127 Y LA GASCA',NULL,NULL,NULL,NULL,NULL,NULL,'2015-03-19 22:26:31'),(31,'1706539382',' María  Isabel Saenz','2557290','1999-09-23','','San Juan Alto Cumbaya',NULL,NULL,NULL,NULL,NULL,NULL,'2015-03-19 22:26:31'),(32,'1706625900',' María Eugenia Valencia','2475709','1999-09-24','','Los Olmos 251 Y <Miguel Angel Cumbaya',NULL,NULL,NULL,NULL,NULL,NULL,'2015-03-19 22:26:31'),(33,'1707241988',' Vicky Redin','2407648','1999-09-25','','Sebastian Guarderas Oe2-69 Y Manuel De La Peña',NULL,NULL,NULL,NULL,NULL,NULL,'2015-03-19 22:26:31'),(34,'1707244462',' Mónica Arellano','2261292','1999-09-26','','Cochapata E12-83',NULL,NULL,NULL,NULL,NULL,NULL,'2015-03-19 22:26:31'),(35,'1707246326','Millicent Chiriboga Hurtado','2419613','1999-09-27','','Pasaje Be1534 Por El Colegio Sek',NULL,NULL,NULL,NULL,NULL,NULL,'2015-03-19 22:26:31'),(36,'1707298269',' Sandra Borja','2408744','1999-09-28','','Rafael Ramos E1-14',NULL,NULL,NULL,NULL,NULL,NULL,'2015-03-19 22:26:31'),(37,'1707349518',' Margarita Aviles','3340617','1999-09-29','','Monteserrin Edificio Belmonte',NULL,NULL,NULL,NULL,NULL,NULL,'2015-03-19 22:26:31'),(38,'1707738702',' Paola Andrade','2556619','1999-09-30','','Av. 12 De Octubre 26-25',NULL,NULL,NULL,NULL,NULL,NULL,'2015-03-19 22:26:31'),(39,'1708089550',' Pamela Mata','2921465','1999-10-01','','Los Naranjos E16-183',NULL,NULL,NULL,NULL,NULL,NULL,'2015-03-19 22:26:31'),(40,'1708349665',' Miriam Velasco','2240377','1999-10-02','','Finlandia 3613 Y Suecia',NULL,NULL,NULL,NULL,NULL,NULL,'2015-03-19 22:26:31'),(41,'1708483357',' Paulina Reyes','2897081','1999-10-03','','Urb. La Campiña',NULL,NULL,NULL,NULL,NULL,NULL,'2015-03-19 22:26:31'),(42,'1708591993',' María Eucaris Pelaez Alzate','2812328','1999-10-04','','Norte De La Ciudad',NULL,NULL,NULL,NULL,NULL,NULL,'2015-03-19 22:26:31'),(43,'1708671282',' Doris Gordón','2422672','1999-10-05','','La Puntilla Mzd11 Carapungo',NULL,NULL,NULL,NULL,NULL,NULL,'2015-03-19 22:26:31'),(44,'1709242539',' Macarena Reinoso','2270483','1999-10-06','','Portugal 600 Y 6 De Diciembre',NULL,NULL,NULL,NULL,NULL,NULL,'2015-03-19 22:26:31'),(45,'1709340465',' MARIA ENITH CARPIO MENDIETA','2330023','1999-10-07','','SANGOLQUI CALLE 10 DE AGOSTO N° 33',NULL,NULL,NULL,NULL,NULL,NULL,'2015-03-19 22:26:31'),(46,'1709626640',' Fernando Espinoza','2688130','1999-10-08','','Enrique Garcés Cabrera S18-85',NULL,NULL,NULL,NULL,NULL,NULL,'2015-03-19 22:26:31'),(47,'1709720369',' Maria Fernanda Salazar Torres','3265417','1999-10-09','eduatd@gsjja.com','Los Alamos Y Guayacanes Edf. Muro Dep. 20','','','','','','','2015-03-19 22:26:31'),(48,'1709866105',' Rocio Flores','3354515','1999-10-10','','El Bosque Alta Vista Iñaquito',NULL,NULL,NULL,NULL,NULL,NULL,'2015-03-19 22:26:31'),(49,'1710134899',' Karolina Ayala Villavicencio','2434152','1999-10-11','','Condominios El Inca Bloque 73 Dep. 3A',NULL,NULL,NULL,NULL,NULL,NULL,'2015-03-19 22:26:31'),(50,'1710190503',' Patricia Carrasco','2584974','1999-10-12','','Rios N959 Y Oriente',NULL,NULL,NULL,NULL,NULL,NULL,'2015-03-19 22:26:31'),(51,'1711164069',' María Jervis','2458022','1999-10-13','','Av. Gaspar De Villarroel Y Abascal',NULL,NULL,NULL,NULL,NULL,NULL,'2015-03-19 22:26:31'),(156,'1711938025','marco llumiquinga','0992927845','1970-12-28','cadm2014@hotmail.com','quito sangolqui','richar catañia soto palacios',NULL,NULL,NULL,NULL,NULL,'2015-04-30 16:36:03'),(153,'1716154100','Elaianal.cocmc','0384747474','2010-02-03','ramonalcides957@hotmail.es','Quito, 12 de Agosto',NULL,NULL,NULL,NULL,NULL,NULL,'2015-04-30 14:34:00'),(101,'1717171771','Estamossssss','1234565432','1999-01-01','eeeee@hhhmoc.com','Guayaquil, Av. Francisco de Orellana S/N y Justino',NULL,NULL,NULL,NULL,NULL,NULL,'2015-04-28 05:21:55'),(56,'172','','','0000-00-00','','',NULL,NULL,NULL,NULL,NULL,NULL,'2015-03-27 19:53:59'),(96,'1722818272','Elian Funkencio','0976546789','2014-10-29','eduardo@dkdhd.com','Elian enstra en al acidad',NULL,NULL,NULL,NULL,NULL,NULL,'2015-04-28 04:49:21'),(84,'1722818725','Eduavdosdsd','45654345','2015-12-31','3dkahdld@fmao.com','Edasasasass',NULL,NULL,NULL,NULL,NULL,NULL,'2015-04-24 01:40:44'),(72,'1722900000','Kimbery Mueses %\'\'\'','0983764647','2011-01-07','kimbo@outlook.com','La Comuna',NULL,NULL,NULL,NULL,NULL,NULL,'2015-04-17 04:40:45'),(73,'1722900111','Kimbery Mueses %\'\'\'','0983764647','2011-01-07','kimbo@outlook.com','La Comuna',NULL,NULL,NULL,NULL,NULL,NULL,'2015-04-17 04:41:35'),(74,'1722900112','Kimbery Mueses %\'\'\'','0983764647','2011-01-07','kimbo@outlook.com','La Comuna',NULL,NULL,NULL,NULL,NULL,NULL,'2015-04-17 04:41:41'),(75,'1722901234','Kimbery Mueses %\'\'\'','0983764647','2011-01-07','kimbo@outlook.com','La Comuna',NULL,NULL,NULL,NULL,NULL,NULL,'2015-04-17 04:41:47'),(52,'1722919725','Eduardo Vinicio Villota Montenegro','0992936569','1987-07-01','eduardouio7@gmail.com','Av. Colon E4-412 Y Amazonas','','','','Jorge Elian Villota Catagña','023203161','','2015-03-27 19:28:18'),(71,'1722919777','Kimbery Mueses %\'\'\'','0983764647','2011-01-07','kimbo@outlook.com','La Comuna',NULL,NULL,NULL,NULL,NULL,NULL,'2015-04-17 04:37:39'),(58,'1723377873','Alexandra Catagña','023202161','0000-00-00','vane-ewa@hotmail.com','La comuna',NULL,NULL,NULL,NULL,NULL,NULL,'2015-04-01 23:24:17'),(93,'1724527385','Richard Catagña','3801608','1994-11-21','alex32846@gmail.com','la comuna',NULL,NULL,NULL,NULL,NULL,NULL,'2015-04-28 02:52:17'),(176,'1726355555','Elian Villalalal','0234494949','1980-01-29','Algo@lglg.vom','Qurioj Ajajaj Aja Ja Ja Aj Jajjajjajaj','Lalamnns Slajaysba','0393643456','Elalsl@fkfkf.com','Alajasnsjssjsjsj','0982454323','Allalsalshaj Kajskjas','2015-05-03 02:06:07'),(95,'1729282727','Eduardl gunckenoe Ass','9865433456','2015-11-30','eduard@djdgd.com',':A coa,iabs kga sahgsaa',NULL,NULL,NULL,NULL,NULL,NULL,'2015-04-28 04:48:06'),(159,'1792119444','Prcuserve Ecuador Sa','0987654323','2014-07-09','ramonalcides957@hotmail.es','Av 12 De Octubre Y La Gasca',NULL,NULL,NULL,NULL,NULL,NULL,'2015-04-30 17:41:10'),(163,'1794244670','Gustavo Vaca','0992724510','1985-07-17','gusvac@gmail.com','Quito, La Colon',NULL,NULL,NULL,NULL,NULL,NULL,'2015-04-30 22:45:05'),(147,'1797173337','Roberto Guama','0987654323','2014-11-29','roberto@sln-ec.com','Quito, 12 de noviembre del 2014',NULL,NULL,NULL,'Marco Guamani','0987654323','Quito Av. Republica','2015-04-29 17:22:43'),(166,'1800086543','Prueba De Creacion De Contacto','099e345678','2015-07-16','estamos@jga.com','La Comuba Altas',NULL,NULL,NULL,NULL,NULL,NULL,'2015-05-02 12:52:44'),(179,'1816200091','El Ultimo De L Comarcja','0965345678','2010-02-02','cadm2009@hotmail.com','La Comina','Se Anade Medico','','','','','','2015-05-11 19:12:07'),(94,'1817543456','Finkendicio Vellinto','0929282625','2014-10-29','eduardo@gmailc.oma','Quito, 27 de Feveksjs sjss ss',NULL,NULL,NULL,NULL,NULL,NULL,'2015-04-28 04:47:35'),(100,'1818181818','El nombre de funvion','9876543456','1999-09-09','eeieiei@g.v','Guayaquil, Av. Francisco de Orellana S/N y Justino',NULL,NULL,NULL,NULL,NULL,NULL,'2015-04-28 05:20:48'),(173,'1877221111','Alf Cruger','0992262528','1960-06-07','asdluand@dkd.com','Estados Unicos','El Papa De Afl','0876543456','dassssan@in.com','Asssmmmmm','0987654345','Sashhas Laskjlaskjd Lasjdlkajsd','2015-05-03 02:00:57'),(150,'1919191919','kjhgfdfghjklkjhgfddfghjkl','1234543234','2011-03-02','ramonalcides957@hotmail.es','kjhgfdfghjklfdfghjk',NULL,NULL,NULL,NULL,NULL,NULL,'2015-04-30 05:57:47'),(152,'1929191919','Eduardo Villoya','0992827262','1964-07-16','ramonalcides957@hotmail.es','Registro ingresado en la oficina de Quito',NULL,NULL,NULL,NULL,NULL,NULL,'2015-04-30 14:32:42'),(62,'1982635008','Funkencio Algo','9843456890','1987-11-01','funkencio123@gmail.cm','Quito',NULL,NULL,NULL,'',NULL,NULL,'2015-04-16 04:35:01'),(63,'1982635108','Funkencio Algo','9843456890','1987-11-01','funke1ncio123@gmail.cm','Quito',NULL,NULL,NULL,'',NULL,NULL,'2015-04-16 04:38:27'),(59,'1982635348','Funkencio Algo','9843456890','1987-11-01','funkencio@gmail.cm','Quito',NULL,NULL,NULL,'',NULL,NULL,'2015-04-16 04:31:51'),(175,'1998444444','Kjhgfsdfghjk Jhgfddfghj Jgfd','0876534567','2010-02-02','Algo@jd.com','La Sls Slshhs Hsh','Sksksks Smsks Sks Sk','0976543123','Sjshs@gmal.com','Familiad Dlskskskks Skksk','0788644441','Lsll Clclccll Docmanj','2015-05-03 02:03:38'),(89,'2345657654','Eduskj akjahskjhas askjh','2654765434','2011-09-28','dkdjdj@dkdd.colm',',jsndkjshdkjshd sdsdsdsd',NULL,NULL,NULL,NULL,NULL,NULL,'2015-04-25 03:05:59'),(82,'2345671111','','','0000-00-00','','',NULL,NULL,NULL,NULL,NULL,NULL,'2015-04-17 04:55:06'),(78,'2345676543','','','0000-00-00','','',NULL,NULL,NULL,NULL,NULL,NULL,'2015-04-17 04:48:59'),(81,'2345676977','','','0000-00-00','','',NULL,NULL,NULL,NULL,NULL,NULL,'2015-04-17 04:54:20'),(80,'2345676988','','','0000-00-00','','',NULL,NULL,NULL,NULL,NULL,NULL,'2015-04-17 04:53:13'),(79,'2345676999','','','0000-00-00','','',NULL,NULL,NULL,NULL,NULL,NULL,'2015-04-17 04:50:42'),(88,'4499222020','dfsdfnbhg jhgjhg','9387656788','2015-12-31','jdjd@kff.com','edd djsbjdsbjd sjh sjhd',NULL,NULL,NULL,NULL,NULL,NULL,'2015-04-25 03:02:59'),(109,'5555555555','los nombres del 5','0555555555','2015-11-30','fkjf@fkfjf.om','55555555555555555555555555555',NULL,NULL,NULL,NULL,NULL,NULL,'2015-04-29 03:54:35'),(105,'6666666666','Seis Seis Seis','0666666666','1996-06-06','66666@hotmail.com','El Numero Malo','','','','marco llumiquinga','0999282625','','2015-04-29 02:50:46'),(104,'7161615151','Registro de Fuego 2','9899999999','1987-07-01','mery_123@hotmail.com','este  es el ultimo registro que hago con este metodo',NULL,NULL,NULL,NULL,NULL,NULL,'2015-04-29 02:47:59'),(148,'7222424242','Maria Acosta','0993833028','2014-11-30','mari123@hotmail.com','La Comuna y 12 de Agosto','Dr. Aguinaga Roberto','0239383930','raguinaga@mediperbarica.com','Teresa Acosta','023201515','Quito, la gasca y 12 de octubre','2015-04-29 20:51:59'),(146,'7262225525','Anita Guambugete','0993937355','1998-09-29','operaciones@sln-ec.com','Av republica del Salvador y Purtugar=l',NULL,NULL,NULL,NULL,NULL,NULL,'2015-04-29 17:15:34'),(149,'7432378322','Eduardo Vinicio Fulanito Mill Ddddd','8765434567','2014-11-30','mil@fulanito.com','Quito , La Gasca','Dr. Referente','8765432345','ferefrnee@referente.com','familiar PAciente','8765433456','Direccion del fmiliae','2015-04-29 20:55:36'),(157,'7653234567','elelelelel','9764334567','1990-02-06','sssss@gma.coma','Eliana a anananana aa ana a na na',NULL,NULL,NULL,NULL,NULL,NULL,'2015-04-30 17:36:21'),(107,'7654345678','Datos que se esta intenatdo guardada','9865432345','2015-12-31','jsjsjjs@g.g','Esta esl adireccion de gueelelelele',NULL,NULL,NULL,NULL,NULL,NULL,'2015-04-29 03:43:59'),(106,'7654567876','FUEGO MATYUSTA','8765434567','1897-08-12','EDUADJD@SGDD.COM','SJSJS ESTE ESRA COB CON AGADA',NULL,NULL,NULL,NULL,NULL,NULL,'2015-04-29 03:03:01'),(121,'7777775555','Nombre Demos','0987654345','1987-02-01','vane-ewa@hotmail.com','La comuna palo alto',NULL,NULL,NULL,NULL,NULL,NULL,'2015-04-29 04:56:28'),(108,'7777777777','Eduardo Intenta','0777777777','2015-10-30','Emaua@dkdjd.com','777777777777777777777777777777777777',NULL,NULL,NULL,NULL,NULL,NULL,'2015-04-29 03:52:20'),(169,'7885434567','Marco Lluminajah','0976543234','2010-02-02','manrod@kaha.com','Quito En La Comja',NULL,NULL,NULL,NULL,NULL,NULL,'2015-05-02 13:02:14'),(178,'8154578944','Delvalloe Fres','9654567890','2011-03-02','delvalle@kdjd.vom','La Comuna','Medina Ricardo',NULL,'MEdina@JAHS.COM','Jsjsjsjsjsjsj','Ssjsjsjjsj','En Su Casa','2015-05-04 00:20:01'),(87,'8171717171','Estamos en Latacunag','0239384829','2015-12-31','eduard@mail.com','Latacunga, q12 de kahs skahs',NULL,NULL,NULL,NULL,NULL,NULL,'2015-04-25 02:56:04'),(99,'8654567898','ultima Historis','9876543456','2014-10-29','eduardo@kjjs.vom','av las mercedes y la colon',NULL,NULL,NULL,NULL,NULL,NULL,'2015-04-28 05:19:27'),(164,'8700001101','Kimberly Mueses','0999826261','2011-01-07','kimbo@gmail.com','Quiro La Comuna',NULL,NULL,NULL,NULL,NULL,NULL,'2015-05-02 01:37:18'),(155,'8765432234','\';sHOW DATABASES \';; --','0292828288','2015-04-30','ramonalcides957@hotmail.es','qUITO DE MI VIFA',NULL,NULL,NULL,NULL,NULL,NULL,'2015-04-30 15:04:36'),(168,'8765567890','Elian Villota','0965432345','2011-03-02','elian@jja.com','La Comuna',NULL,NULL,NULL,NULL,NULL,NULL,'2015-05-02 13:00:18'),(92,'8888888888','Eduardo Ocho','8888888888','2015-12-31','8888@98888.com','88888888888888888888888888888888888888',NULL,NULL,NULL,NULL,NULL,NULL,'2015-04-27 21:16:22'),(98,'9098765400','Historia Nueva','0192725253','1987-01-02','historia@nueva.com','Esta es la Historia nueva qe se ha creado usando las nuevas validacioes',NULL,NULL,NULL,NULL,NULL,NULL,'2015-04-28 05:18:29'),(97,'9098765434','Historia Nueva','0192725253','1987-01-02','historia@nueva.com','Esta es la Historia nueva qe se ha creado usando las nuevas validacioes',NULL,NULL,NULL,NULL,NULL,NULL,'2015-04-28 05:16:08'),(171,'9520001111','Chocho Loco','0935432345','2010-02-02','chocho@gmao.com','La Comuna De Santa Clara De San Millan','lukas de la cmna','9876543456','alado del chocho','Eduardo Villota','','','2015-05-02 13:51:57'),(167,'9765445332','Contacto Del Final De La List','0745678965','2011-03-02','lista@final.com','La Comuna De Chiquitongue',NULL,NULL,NULL,NULL,NULL,NULL,'2015-05-02 12:59:26'),(165,'9800098765','Celular Lg','0999765432','2011-03-02','eduardouio7@fkaja.com','La Comuna Alta Sector Sabta Clara',NULL,NULL,NULL,NULL,NULL,NULL,'2015-05-02 12:50:38'),(129,'9876543001','Nombre Demos','0987654345','1987-09-09','vane-ewa@hotmail.com','La comuna palo alto',NULL,NULL,NULL,NULL,NULL,NULL,'2015-04-29 05:43:23'),(133,'9876543002','Nombre Demos','0987654345','2015-04-07','vane-ewa@hotmail.com','La comuna palo alto',NULL,NULL,NULL,NULL,NULL,NULL,'2015-04-29 05:47:58'),(132,'9876543009','Nombre Demos','0987654345','2015-04-01','vane-ewa@hotmail.com','La comuna palo alto',NULL,NULL,NULL,NULL,NULL,NULL,'2015-04-29 05:45:35'),(123,'9876543092','Nombre Demos','0987654345','1999-09-09','vane-ewa@hotmail.com','La comuna palo alto',NULL,NULL,NULL,NULL,NULL,NULL,'2015-04-29 05:01:33'),(120,'9876543099','Nombre Demos','0987654345','1987-09-09','vane-ewa@hotmail.com','La comuna palo alto',NULL,NULL,NULL,NULL,NULL,NULL,'2015-04-29 04:56:04'),(111,'9876543111','Nombre Demos','0987654345','2015-04-14','vane-ewa@hotmail.com','La comuna palo alto',NULL,NULL,NULL,NULL,NULL,NULL,'2015-04-29 04:08:09'),(142,'9876543193','Nombre Demos','0987654345','2015-04-01','vane-ewa@hotmail.com','La comuna palo alto',NULL,NULL,NULL,NULL,NULL,NULL,'2015-04-29 06:28:28'),(141,'9876543211','Nombre Demos','0987654345','2015-04-14','vane-ewa@hotmail.com','La comuna palo alto',NULL,NULL,NULL,NULL,NULL,NULL,'2015-04-29 06:26:23'),(114,'9876543222','Nombre Demos','0987654345','2015-03-31','vane-ewa@hotmail.com','La comuna palo alto',NULL,NULL,NULL,NULL,NULL,NULL,'2015-04-29 04:10:59'),(145,'9876543444','Elian Villota Catagna','099296573','2011-07-01','elianuio@gmail.com','La Comuna Susuchina y 12 de Agosto',NULL,NULL,NULL,'Eduardo Villota','0992936560','Quito, La Comuna y 12 de Agosto','2015-04-29 06:33:21'),(144,'9876543498','Nombre Demos','0987654345','2015-04-01','vane-ewa@hotmail.com','La comuna palo alto',NULL,NULL,NULL,NULL,NULL,NULL,'2015-04-29 06:31:22'),(140,'9876543522','Nombre Demos Codeignoter','0987654345','2015-04-01','vane-ewa@hotmail.com','La comuna palo alto',NULL,NULL,NULL,NULL,NULL,NULL,'2015-04-29 06:24:11'),(138,'9876543535','Nombre Demos','0987654345','2015-04-08','vane-ewa@hotmail.com','La comuna palo alto',NULL,NULL,NULL,NULL,NULL,NULL,'2015-04-29 05:54:04'),(124,'9876543543','Nombre Demos','0987654345','2015-04-08','vane-ewa@hotmail.com','La comuna palo alto',NULL,NULL,NULL,NULL,NULL,NULL,'2015-04-29 05:23:12'),(127,'9876543563','Nombre Demos','0987654345','1987-09-09','vane-ewa@hotmail.com','La comuna palo alto',NULL,NULL,NULL,NULL,NULL,NULL,'2015-04-29 05:42:33'),(137,'9876543591','Nombre Demos','0987654345','2015-04-15','vane-ewa@hotmail.com','La comuna palo alto',NULL,NULL,NULL,NULL,NULL,NULL,'2015-04-29 05:53:10'),(118,'9876543622','Nombre Demos','0987654345','2015-03-31','vane-ewa@hotmail.com','La comuna palo alto',NULL,NULL,NULL,NULL,NULL,NULL,'2015-04-29 04:16:59'),(115,'9876543633','Nombre Demos','0987654345','2015-03-31','vane-ewa@hotmail.com','La comuna palo alto',NULL,NULL,NULL,NULL,NULL,NULL,'2015-04-29 04:11:20'),(139,'9876543636','Nombre Demos','0987654345','2015-03-31','vane-ewa@hotmail.com','La comuna palo alto',NULL,NULL,NULL,NULL,NULL,NULL,'2015-04-29 06:16:26'),(143,'9876543651','Nombre Demos','0987654345','2015-04-22','vane-ewa@hotmail.com','La comuna palo alto',NULL,NULL,NULL,NULL,NULL,NULL,'2015-04-29 06:29:01'),(134,'9876543666','Juan Carlos Gomes Y Cifuentes','0987654345','2015-03-31','vane-ewa@hotmail.com','La Comuna Palo Alto','','','','','','','2015-04-29 05:48:45'),(131,'9876543701','Nombre Demos','0987654345','1987-09-09','vane-ewa@hotmail.com','La comuna palo alto',NULL,NULL,NULL,NULL,NULL,NULL,'2015-04-29 05:44:38'),(128,'9876543714','Nombre Demos','0987654345','1987-08-09','vane-ewa@hotmail.com','La comuna palo alto',NULL,NULL,NULL,NULL,NULL,NULL,'2015-04-29 05:42:59'),(136,'9876543760','Nombre Demos','0987654345','2015-03-31','vane-ewa@hotmail.com','La comuna palo alto',NULL,NULL,NULL,NULL,NULL,NULL,'2015-04-29 05:52:34'),(116,'9876543765','Nombre Demos','0987654345','2015-04-13','vane-ewa@hotmail.com','La comuna palo alto',NULL,NULL,NULL,NULL,NULL,NULL,'2015-04-29 04:12:27'),(135,'9876543776','Nombre Demos','0987654345','2015-04-08','vane-ewa@hotmail.com','La comuna palo alto',NULL,NULL,NULL,NULL,NULL,NULL,'2015-04-29 05:50:07'),(117,'9876543777','Nombre Demos','0987654345','2015-04-07','vane-ewa@hotmail.com','La comuna palo alto',NULL,NULL,NULL,NULL,NULL,NULL,'2015-04-29 04:14:05'),(126,'9876543876','Nombre Demos','0987654345','1987-02-02','vane-ewa@hotmail.com','La comuna palo alto',NULL,NULL,NULL,NULL,NULL,NULL,'2015-04-29 05:37:27'),(122,'9876543888','Nombre Demos','0987654345','1987-09-09','vane-ewa@hotmail.com','La comuna palo alto',NULL,NULL,NULL,NULL,NULL,NULL,'2015-04-29 05:00:44'),(130,'9876543986','Nombre Demos','0987654345','1992-09-09','vane-ewa@hotmail.com','La comuna palo alto',NULL,NULL,NULL,NULL,NULL,NULL,'2015-04-29 05:44:08'),(125,'9876543987','Nombre Demos','0987654345','1987-01-01','vane-ewa@hotmail.com','La comuna palo alto',NULL,NULL,NULL,NULL,NULL,NULL,'2015-04-29 05:36:48'),(112,'9876543988','Nombre Demos','0987654345','2015-03-31','vane-ewa@hotmail.com','La comuna palo alto',NULL,NULL,NULL,NULL,NULL,NULL,'2015-04-29 04:09:22'),(113,'9876543999','Nombre Demos','0987654345','2015-03-31','vane-ewa@hotmail.com','La comuna palo alto',NULL,NULL,NULL,NULL,NULL,NULL,'2015-04-29 04:10:01'),(119,'9876543eee','Nombre Demos','0987654345','1987-09-09','vane-ewa@hotmail.com','La comuna palo alto',NULL,NULL,NULL,NULL,NULL,NULL,'2015-04-29 04:54:15'),(110,'9999999111','nueve y tres unos','0987654323','2014-05-30','eidd@fkjf.vom','lkjhgfdsdfiofdsxcvbn',NULL,NULL,NULL,NULL,NULL,NULL,'2015-04-29 04:03:07');
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
INSERT INTO `personal` VALUES ('','','','','','','','2015-03-20 21:41:54'),('100000000','Dr. Pablo Lopez','Av. Colon oe97-12 entre 9 de Octubre y 10 de Agosto','0239864831','0983652816','pablito@gmail.com','Atiende los fines de semana','2015-03-19 21:18:38'),('1722919725','Eduardo Vinicio Villota Montenegro','Quito, Av. 12 de Agosto y Humberto Alboronz','022226906','0992936569','eduardouio7@gmail.com','Solo trabaja los fines de semana','2015-03-20 21:41:50'),('200000000','Dr. Jacinto Enriquez','Av. 12 de Octubre y Abram Lincon','0238765174','0987635191','jacintoenruquez@gmail.com','atiende en horario diurno','2015-03-19 21:18:38'),('300000000','Dr. Juanito Perez','Av. Patria 0e-12 y Av. Amazonas Edf. Algo Piso 100 Dep 300','0231982619','0987639729','juanitop@gmail.com','Doctor solo antiente en la tarde y noche','2015-03-19 21:18:38');
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
  `fecha` date NOT NULL,
  `hora` time NOT NULL,
  `notas` varchar(450) DEFAULT NULL,
  `creado` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_sesion`,`id_tratamiento`),
  UNIQUE KEY `id_sesion` (`id_sesion`),
  KEY `FK_SESION_TRATAMIENTO` (`id_tratamiento`),
  KEY `FK_SESION_PERSONAL_idx` (`id_personal`),
  CONSTRAINT `FK_SESION_PERSONAL` FOREIGN KEY (`id_personal`) REFERENCES `personal` (`id_personal`) ON UPDATE CASCADE,
  CONSTRAINT `FK_SESION_TRATAMIENTO` FOREIGN KEY (`id_tratamiento`) REFERENCES `tratamiento` (`id_tratamiento`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sesion`
--

LOCK TABLES `sesion` WRITE;
/*!40000 ALTER TABLE `sesion` DISABLE KEYS */;
INSERT INTO `sesion` VALUES (1,'',2,'2014-03-25','23:42:00',NULL,'2015-03-26 04:42:11');
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
  `examen_fisico` varchar(360) NOT NULL,
  `manejo` varchar(180) DEFAULT NULL,
  `nro_sesiones` smallint(6) NOT NULL,
  `costo` decimal(4,2) NOT NULL DEFAULT '0.00',
  `creado` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `notas` varchar(360) DEFAULT NULL,
  PRIMARY KEY (`id_tratamiento`),
  KEY `FK_TRATAMIENTO_HISTORIA` (`id_paciente`),
  KEY `FK_TRATAMIENTO_PERSONAL` (`id_personal`),
  CONSTRAINT `FK_TRATAMIENTO_HISTORIA` FOREIGN KEY (`id_paciente`) REFERENCES `historia` (`id_paciente`) ON UPDATE CASCADE,
  CONSTRAINT `FK_TRATAMIENTO_PERSONAL` FOREIGN KEY (`id_personal`) REFERENCES `personal` (`id_personal`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tratamiento`
--

LOCK TABLES `tratamiento` WRITE;
/*!40000 ALTER TABLE `tratamiento` DISABLE KEYS */;
INSERT INTO `tratamiento` VALUES (2,'0400498283','200000000','Taratamiento de preba','10/10','Eduardo Villota',12,0.00,'0000-00-00 00:00:00',''),(3,'0908570823','300000000','Tratamiento para la mejora de la pierna operada','Passed','Eduardo Villota',12,0.00,'2015-03-26 04:57:58','El paciente necesita que se le confirmen las citas una hora antes'),(4,'1704973401','100000000','Recuperacion Post Operatoria','Passes pero con problemas','Aquiles Chango',6,0.00,'2015-03-26 04:57:58',NULL),(5,'1002111746','200000000','Asma','Examen muestra nivel de asma medio','Que diablos es el manejo',12,0.00,'2015-03-26 05:03:43',NULL),(6,'1002332649','200000000','Preparación física ','PASSED','Eduardo Villota',7,0.00,'2015-03-26 05:05:59',NULL),(7,'1002332649','300000000','Preparacion fisica','PASSED','Manejo de preparación fisica',4,0.00,'2015-03-26 05:05:59',NULL);
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
  `last_login` datetime NOT NULL,
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
INSERT INTO `user` VALUES (1000,'mediperbarica','0000-00-00 00:00:00','mediperbarica','Richard','Catagna','mediperbarica@gmail.com','2015-03-19 21:47:44');
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

-- Dump completed on 2015-06-20 15:21:32
