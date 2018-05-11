-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: localhost    Database: saa
-- ------------------------------------------------------
-- Server version	5.5.59

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
-- Table structure for table `academia`
--

DROP TABLE IF EXISTS `academia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `academia` (
  `idAcademia` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`idAcademia`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `academia`
--

LOCK TABLES `academia` WRITE;
/*!40000 ALTER TABLE `academia` DISABLE KEYS */;
INSERT INTO `academia` VALUES (1,'Computo Estadistico'),(2,'Fundamentos de la Estad¡stica'),(3,'Matem ticas Avanzadas'),(4,'Matem ticas B sicas'),(5,'Metodolog¡a de la Investigaci¢n y Consultor¡a'),(6,'Metodolog¡a Estad¡stica I'),(7,'Metodolog¡a Estad¡stica II'),(8,'Modelaci¢n Estad¡stica'),(9,'Servicio Social y Experiencia Recepcional'),(10,'Ciencia de Datos'),(11,'Fundamentos de la Estad¡stica'),(12,'Matem ticas'),(13,'Metodolog¡a Estad¡stica'),(14,'Servicio Social y Experiencia Recepcional'),(15,'Algoritmos y Programaci¢n'),(16,'Arquitectura de Computadoras'),(17,'Entorno Social'),(18,'Ingenier¡a de Software'),(19,'Integraci¢n'),(20,'Inteligencia Artificial'),(21,'Matem ticas'),(22,'Redes'),(23,'Servicio Social y Experiencia Recepcional'),(24,'Sistemas de Informaci¢n'),(25,'Software de Base'),(26,'Administraci¢n y Proceso de Software'),(27,'Modelado y An lisis de Software'),(28,'Servicio Social'),(29,'Sistemas y Tecnolog¡as Web'),(30,'Desarrollo'),(31,'Arquitectura y Sistemas'),(32,'Investigaci¢n y Profesionalismo'),(33,'Programaci¢n'),(34,'Seguridad'),(35,'Servicio de Red'),(36,'Sistema de Informaci¢n y Conocimiento');
/*!40000 ALTER TABLE `academia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `academico`
--

DROP TABLE IF EXISTS `academico`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `academico` (
  `idAcademico` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) DEFAULT NULL,
  `apellido` varchar(45) DEFAULT NULL,
  `coordinador` tinyint(1) DEFAULT NULL,
  `idAcademia` int(11) DEFAULT NULL,
  PRIMARY KEY (`idAcademico`),
  KEY `idAcademia` (`idAcademia`),
  CONSTRAINT `academico_ibfk_1` FOREIGN KEY (`idAcademia`) REFERENCES `academia` (`idAcademia`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `academico`
--

LOCK TABLES `academico` WRITE;
/*!40000 ALTER TABLE `academico` DISABLE KEYS */;
/*!40000 ALTER TABLE `academico` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `asuntos`
--

DROP TABLE IF EXISTS `asuntos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `asuntos` (
  `nombreAcademico` varchar(60) DEFAULT NULL,
  `asunto` varchar(100) DEFAULT NULL,
  `idMinuta` int(11) DEFAULT NULL,
  KEY `idMinuta` (`idMinuta`),
  CONSTRAINT `asuntos_ibfk_1` FOREIGN KEY (`idMinuta`) REFERENCES `minuta` (`idMinuta`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `asuntos`
--

LOCK TABLES `asuntos` WRITE;
/*!40000 ALTER TABLE `asuntos` DISABLE KEYS */;
/*!40000 ALTER TABLE `asuntos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `junta`
--

DROP TABLE IF EXISTS `junta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `junta` (
  `idJunta` int(11) NOT NULL AUTO_INCREMENT,
  `idAcademia` int(11) DEFAULT NULL,
  `fechaHora` datetime DEFAULT NULL,
  `lugar` varchar(45) DEFAULT NULL,
  `organizador` varchar(45) DEFAULT NULL,
  `objetivo` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`idJunta`),
  KEY `idAcademia` (`idAcademia`),
  CONSTRAINT `junta_ibfk_1` FOREIGN KEY (`idAcademia`) REFERENCES `academia` (`idAcademia`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `junta`
--

LOCK TABLES `junta` WRITE;
/*!40000 ALTER TABLE `junta` DISABLE KEYS */;
/*!40000 ALTER TABLE `junta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `minuta`
--

DROP TABLE IF EXISTS `minuta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `minuta` (
  `idMinuta` int(11) NOT NULL AUTO_INCREMENT,
  `idJunta` int(11) DEFAULT NULL,
  `tema` varchar(100) DEFAULT NULL,
  `nombreCoordiandor` varchar(60) DEFAULT NULL,
  PRIMARY KEY (`idMinuta`),
  KEY `idJunta` (`idJunta`),
  CONSTRAINT `minuta_ibfk_1` FOREIGN KEY (`idJunta`) REFERENCES `junta` (`idJunta`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `minuta`
--

LOCK TABLES `minuta` WRITE;
/*!40000 ALTER TABLE `minuta` DISABLE KEYS */;
/*!40000 ALTER TABLE `minuta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `participantes`
--

DROP TABLE IF EXISTS `participantes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `participantes` (
  `nombreParticipante` varchar(60) DEFAULT NULL,
  `asistio` tinyint(4) DEFAULT NULL,
  `idMinuta` int(11) DEFAULT NULL,
  KEY `idMinuta` (`idMinuta`),
  CONSTRAINT `participantes_ibfk_1` FOREIGN KEY (`idMinuta`) REFERENCES `minuta` (`idMinuta`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `participantes`
--

LOCK TABLES `participantes` WRITE;
/*!40000 ALTER TABLE `participantes` DISABLE KEYS */;
/*!40000 ALTER TABLE `participantes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'saa'
--

--
-- Dumping routines for database 'saa'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-05-11 12:35:44
