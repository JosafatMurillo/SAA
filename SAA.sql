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
  `nombre` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idAcademia`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `academia`
--

LOCK TABLES `academia` WRITE;
/*!40000 ALTER TABLE `academia` DISABLE KEYS */;
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
  `nrc` int(11) DEFAULT NULL,
  `nombre` varchar(45) DEFAULT NULL,
  `apellido` varchar(45) DEFAULT NULL,
  `direccion` varchar(100) DEFAULT NULL,
  `telefono` varchar(50) DEFAULT NULL,
  `coordinador` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`idAcademico`),
  KEY `nrc` (`nrc`),
  CONSTRAINT `academico_ibfk_1` FOREIGN KEY (`nrc`) REFERENCES `ee` (`nrc`)
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
-- Table structure for table `ee`
--

DROP TABLE IF EXISTS `ee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ee` (
  `nrc` int(11) NOT NULL AUTO_INCREMENT,
  `idAcademia` int(11) DEFAULT NULL,
  `nombre` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`nrc`),
  KEY `idAcademia` (`idAcademia`),
  CONSTRAINT `ee_ibfk_1` FOREIGN KEY (`idAcademia`) REFERENCES `academia` (`idAcademia`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ee`
--

LOCK TABLES `ee` WRITE;
/*!40000 ALTER TABLE `ee` DISABLE KEYS */;
/*!40000 ALTER TABLE `ee` ENABLE KEYS */;
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
  `nombreCoordinador` varchar(45) DEFAULT NULL,
  `nombreParticipante` varchar(45) DEFAULT NULL,
  `asuntoParticipante` varchar(100) DEFAULT NULL,
  `nombresParticipantes` varchar(45) DEFAULT NULL,
  `noAsistieronParticipantes` varchar(45) DEFAULT NULL,
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

-- Dump completed on 2018-04-11 11:14:34
