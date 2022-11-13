-- MariaDB dump 10.19  Distrib 10.4.27-MariaDB, for Win64 (AMD64)
--
-- Host: 127.0.0.1    Database: funcionarios
-- ------------------------------------------------------
-- Server version	10.4.27-MariaDB

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
-- Table structure for table `estados_civil`
--

DROP TABLE IF EXISTS `estados_civil`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `estados_civil` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `estado` varchar(45) NOT NULL,
  `descripcion` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estados_civil`
--

LOCK TABLES `estados_civil` WRITE;
/*!40000 ALTER TABLE `estados_civil` DISABLE KEYS */;
/*!40000 ALTER TABLE `estados_civil` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `estados_formacion`
--

DROP TABLE IF EXISTS `estados_formacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `estados_formacion` (
  `id` int(11) NOT NULL,
  `nombre` varchar(45) NOT NULL,
  `estado` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estados_formacion`
--

LOCK TABLES `estados_formacion` WRITE;
/*!40000 ALTER TABLE `estados_formacion` DISABLE KEYS */;
/*!40000 ALTER TABLE `estados_formacion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `formaciones_academicas`
--

DROP TABLE IF EXISTS `formaciones_academicas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `formaciones_academicas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `funcionarios_id` int(11) NOT NULL,
  `universidades_id` int(11) NOT NULL,
  `estados_formacion_id` int(11) NOT NULL,
  `niveles_educativos_id` int(11) NOT NULL,
  `formacion` varchar(45) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_formaciones_academicas_funcionarios1_idx` (`funcionarios_id`),
  KEY `fk_formaciones_academicas_universidades1_idx` (`universidades_id`),
  KEY `fk_formaciones_academicas_estados_formacion1_idx` (`estados_formacion_id`),
  KEY `fk_formaciones_academicas_niveles_educativos1_idx` (`niveles_educativos_id`),
  CONSTRAINT `fk_formaciones_academicas_estados_formacion1` FOREIGN KEY (`estados_formacion_id`) REFERENCES `estados_formacion` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_formaciones_academicas_funcionarios1` FOREIGN KEY (`funcionarios_id`) REFERENCES `funcionarios` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_formaciones_academicas_niveles_educativos1` FOREIGN KEY (`niveles_educativos_id`) REFERENCES `niveles_educativos` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_formaciones_academicas_universidades1` FOREIGN KEY (`universidades_id`) REFERENCES `universidades` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `formaciones_academicas`
--

LOCK TABLES `formaciones_academicas` WRITE;
/*!40000 ALTER TABLE `formaciones_academicas` DISABLE KEYS */;
/*!40000 ALTER TABLE `formaciones_academicas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `funcionarios`
--

DROP TABLE IF EXISTS `funcionarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `funcionarios` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `numero_identificacion` varchar(45) NOT NULL,
  `nombres` varchar(45) NOT NULL,
  `apellidos` varchar(45) NOT NULL,
  `sexo` char(2) DEFAULT NULL,
  `direccion` varchar(45) DEFAULT NULL,
  `telefono` varchar(45) NOT NULL,
  `fecha_nacimiento` date DEFAULT NULL,
  `fecha_creacion` datetime DEFAULT current_timestamp(),
  `fecha_actualizacion` datetime DEFAULT current_timestamp(),
  `funcionarioscol` varchar(45) DEFAULT 'NOW()',
  `tipos_identificacion_id` int(11) NOT NULL,
  `estados_civil_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `numero_identificacion_UNIQUE` (`numero_identificacion`),
  KEY `fk_funcionarios_tipos_identificacion_idx` (`tipos_identificacion_id`),
  KEY `fk_funcionarios_estados_civil1_idx` (`estados_civil_id`),
  CONSTRAINT `fk_funcionarios_estados_civil1` FOREIGN KEY (`estados_civil_id`) REFERENCES `estados_civil` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_funcionarios_tipos_identificacion` FOREIGN KEY (`tipos_identificacion_id`) REFERENCES `tipos_identificacion` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `funcionarios`
--

LOCK TABLES `funcionarios` WRITE;
/*!40000 ALTER TABLE `funcionarios` DISABLE KEYS */;
/*!40000 ALTER TABLE `funcionarios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grupo_familiares`
--

DROP TABLE IF EXISTS `grupo_familiares`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `grupo_familiares` (
  `id` int(11) NOT NULL,
  `nombre` varchar(45) NOT NULL,
  `funcionarios_id` int(11) NOT NULL,
  `parentescos_id` int(11) NOT NULL,
  `telefono` varchar(45) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_grupo_familiares_funcionarios1_idx` (`funcionarios_id`),
  KEY `fk_grupo_familiares_parentescos1_idx` (`parentescos_id`),
  CONSTRAINT `fk_grupo_familiares_funcionarios1` FOREIGN KEY (`funcionarios_id`) REFERENCES `funcionarios` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_grupo_familiares_parentescos1` FOREIGN KEY (`parentescos_id`) REFERENCES `parentescos` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grupo_familiares`
--

LOCK TABLES `grupo_familiares` WRITE;
/*!40000 ALTER TABLE `grupo_familiares` DISABLE KEYS */;
/*!40000 ALTER TABLE `grupo_familiares` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `niveles_educativos`
--

DROP TABLE IF EXISTS `niveles_educativos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `niveles_educativos` (
  `id` int(11) NOT NULL,
  `nombre` varchar(45) NOT NULL,
  `nivel` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `niveles_educativos`
--

LOCK TABLES `niveles_educativos` WRITE;
/*!40000 ALTER TABLE `niveles_educativos` DISABLE KEYS */;
/*!40000 ALTER TABLE `niveles_educativos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `parentescos`
--

DROP TABLE IF EXISTS `parentescos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `parentescos` (
  `id` int(11) NOT NULL,
  `parentesco` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `parentescos`
--

LOCK TABLES `parentescos` WRITE;
/*!40000 ALTER TABLE `parentescos` DISABLE KEYS */;
/*!40000 ALTER TABLE `parentescos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipos_identificacion`
--

DROP TABLE IF EXISTS `tipos_identificacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tipos_identificacion` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) NOT NULL,
  `descripcion` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipos_identificacion`
--

LOCK TABLES `tipos_identificacion` WRITE;
/*!40000 ALTER TABLE `tipos_identificacion` DISABLE KEYS */;
/*!40000 ALTER TABLE `tipos_identificacion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `universidades`
--

DROP TABLE IF EXISTS `universidades`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `universidades` (
  `id` int(11) NOT NULL,
  `nombre` varchar(45) NOT NULL,
  `telefono` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `universidades`
--

LOCK TABLES `universidades` WRITE;
/*!40000 ALTER TABLE `universidades` DISABLE KEYS */;
/*!40000 ALTER TABLE `universidades` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-11-13  0:11:37
