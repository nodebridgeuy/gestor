-- MariaDB dump 10.19  Distrib 10.4.32-MariaDB, for Win64 (AMD64)
--
-- Host: localhost    Database: sigsm
-- ------------------------------------------------------
-- Server version	10.4.32-MariaDB

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
-- Table structure for table `ambulancia`
--

DROP TABLE IF EXISTS `ambulancia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ambulancia` (
  `id_ambulancia` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) NOT NULL,
  `conductor` varchar(80) DEFAULT NULL,
  `estado` enum('disponible','en_camino','llego_destino','volviendo','fuera_servicio') NOT NULL DEFAULT 'disponible',
  `fecha_estado` datetime NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id_ambulancia`),
  UNIQUE KEY `nombre` (`nombre`),
  KEY `idx_ambulancia_estado` (`estado`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ambulancia`
--

LOCK TABLES `ambulancia` WRITE;
/*!40000 ALTER TABLE `ambulancia` DISABLE KEYS */;
/*!40000 ALTER TABLE `ambulancia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categoria`
--

DROP TABLE IF EXISTS `categoria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `categoria` (
  `id_categoria` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  PRIMARY KEY (`id_categoria`),
  UNIQUE KEY `nombre` (`nombre`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categoria`
--

LOCK TABLES `categoria` WRITE;
/*!40000 ALTER TABLE `categoria` DISABLE KEYS */;
INSERT INTO `categoria` VALUES (24,'Anestesiología'),(5,'Cardiología'),(6,'Centro cardiovascular'),(25,'Cirugía plástica y quemados'),(26,'Cirugía vascular periférica'),(7,'Clínica médica A'),(8,'Clínica médica B'),(9,'Clínica médica C'),(23,'Depto. Clínico de cirugía'),(10,'Dermatología'),(4,'Dpto. Clínico de medicina'),(2,'Emergencia'),(11,'Endocrinología'),(12,'Gastroenterología'),(13,'Geriatría'),(27,'Ginecotocológica B'),(14,'Hematología'),(39,'Hemoterapia'),(40,'Imagenología'),(15,'Infectología'),(16,'Medicina física, rehabilitación y medicina del deporte'),(38,'Medicina Nuclear'),(17,'Nefrología'),(3,'Neonatología'),(28,'Neurocirugía'),(18,'Neurología'),(29,'Odontología'),(30,'Oftalmología'),(19,'Oncología'),(31,'Otorrinolaringología'),(20,'Psiquiatría'),(32,'Quirúrgica A'),(33,'Quirúrgica B'),(34,'Quirúrgica F'),(37,'Radioterapia'),(36,'Traumatología y ortopedia de adultos'),(21,'U.E. Autoinmunes sistémicas'),(1,'Unidad de Cuidados Paliativos'),(22,'Unidad de tabaquismo'),(35,'Urología');
/*!40000 ALTER TABLE `categoria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `documento`
--

DROP TABLE IF EXISTS `documento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `documento` (
  `id_documento` int(11) NOT NULL AUTO_INCREMENT,
  `titulo_documento` varchar(150) NOT NULL,
  `id_categoria` int(11) NOT NULL,
  `id_funcionario` int(11) NOT NULL,
  `ruta_archivo` varchar(255) NOT NULL,
  `nombre_original` varchar(255) NOT NULL,
  `tamano` int(11) NOT NULL DEFAULT 0,
  `es_guia_general` tinyint(1) NOT NULL DEFAULT 0,
  `estado_portal` tinyint(1) NOT NULL DEFAULT 0,
  `fecha_subida` datetime NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id_documento`),
  UNIQUE KEY `ruta_archivo` (`ruta_archivo`),
  KEY `idx_documento_guia` (`es_guia_general`),
  KEY `idx_documento_categoria` (`id_categoria`),
  KEY `idx_documento_fecha` (`fecha_subida`),
  KEY `fk_documento_funcionario` (`id_funcionario`),
  CONSTRAINT `fk_documento_categoria` FOREIGN KEY (`id_categoria`) REFERENCES `categoria` (`id_categoria`),
  CONSTRAINT `fk_documento_funcionario` FOREIGN KEY (`id_funcionario`) REFERENCES `funcionario` (`id_funcionario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `documento`
--

LOCK TABLES `documento` WRITE;
/*!40000 ALTER TABLE `documento` DISABLE KEYS */;
/*!40000 ALTER TABLE `documento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `encuesta`
--

DROP TABLE IF EXISTS `encuesta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `encuesta` (
  `id_encuesta` int(11) NOT NULL AUTO_INCREMENT,
  `titulo_encuesta` varchar(150) NOT NULL,
  `descripcion` varchar(500) DEFAULT NULL,
  `id_sector` int(11) NOT NULL,
  `id_funcionario` int(11) NOT NULL,
  `activa` tinyint(1) NOT NULL DEFAULT 0,
  `estado_portal` tinyint(1) NOT NULL DEFAULT 0,
  `fecha_creacion` datetime NOT NULL DEFAULT current_timestamp(),
  `fecha_modificacion` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id_encuesta`),
  UNIQUE KEY `uq_encuesta_sector_titulo` (`id_sector`,`titulo_encuesta`),
  KEY `idx_encuesta_titulo` (`titulo_encuesta`),
  KEY `fk_encuesta_id_funcionario` (`id_funcionario`),
  CONSTRAINT `fk_encuesta_id_funcionario` FOREIGN KEY (`id_funcionario`) REFERENCES `funcionario` (`id_funcionario`),
  CONSTRAINT `fk_encuesta_id_sector` FOREIGN KEY (`id_sector`) REFERENCES `sector` (`id_sector`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `encuesta`
--

LOCK TABLES `encuesta` WRITE;
/*!40000 ALTER TABLE `encuesta` DISABLE KEYS */;
/*!40000 ALTER TABLE `encuesta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `funcionario`
--

DROP TABLE IF EXISTS `funcionario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `funcionario` (
  `id_funcionario` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) NOT NULL,
  `contrasena` varchar(255) NOT NULL,
  `id_rol` int(11) NOT NULL,
  `activo` tinyint(1) NOT NULL DEFAULT 1,
  `email` varchar(70) DEFAULT NULL,
  PRIMARY KEY (`id_funcionario`),
  UNIQUE KEY `nombre` (`nombre`),
  UNIQUE KEY `email` (`email`),
  KEY `fk_funcionario_rol` (`id_rol`),
  CONSTRAINT `fk_funcionario_rol` FOREIGN KEY (`id_rol`) REFERENCES `rol` (`id_rol`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `funcionario`
--

LOCK TABLES `funcionario` WRITE;
/*!40000 ALTER TABLE `funcionario` DISABLE KEYS */;
INSERT INTO `funcionario` VALUES (1,'admin','$2y$10$6eo3h4S3ZkkpdWE5hCZ0Zu.42NZG7zJsDhk5vMfLsk1eimanMN8qG',1,1,NULL);
/*!40000 ALTER TABLE `funcionario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pregunta`
--

DROP TABLE IF EXISTS `pregunta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pregunta` (
  `id_pregunta` int(11) NOT NULL AUTO_INCREMENT,
  `id_encuesta` int(11) NOT NULL,
  `texto_pregunta` varchar(255) NOT NULL,
  `tipo` enum('escala','opcion','texto') NOT NULL DEFAULT 'escala',
  `opciones` text DEFAULT NULL,
  `obligatoria` tinyint(1) NOT NULL DEFAULT 1,
  `orden` smallint(6) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id_pregunta`),
  KEY `idx_pregunta_encuesta` (`id_encuesta`,`orden`),
  CONSTRAINT `fk_pregunta_id_encuesta` FOREIGN KEY (`id_encuesta`) REFERENCES `encuesta` (`id_encuesta`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pregunta`
--

LOCK TABLES `pregunta` WRITE;
/*!40000 ALTER TABLE `pregunta` DISABLE KEYS */;
/*!40000 ALTER TABLE `pregunta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `respuesta_detalle`
--

DROP TABLE IF EXISTS `respuesta_detalle`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `respuesta_detalle` (
  `id_detalle` int(11) NOT NULL AUTO_INCREMENT,
  `id_respuesta` int(11) NOT NULL,
  `id_pregunta` int(11) DEFAULT NULL,
  `texto_pregunta` varchar(255) NOT NULL,
  `tipo` varchar(10) NOT NULL,
  `valor` varchar(500) NOT NULL,
  PRIMARY KEY (`id_detalle`),
  KEY `idx_detalle_respuesta` (`id_respuesta`),
  KEY `fk_detalle_id_pregunta` (`id_pregunta`),
  CONSTRAINT `fk_detalle_id_pregunta` FOREIGN KEY (`id_pregunta`) REFERENCES `pregunta` (`id_pregunta`) ON DELETE SET NULL,
  CONSTRAINT `fk_detalle_id_respuesta` FOREIGN KEY (`id_respuesta`) REFERENCES `respuesta_encuesta` (`id_respuesta`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `respuesta_detalle`
--

LOCK TABLES `respuesta_detalle` WRITE;
/*!40000 ALTER TABLE `respuesta_detalle` DISABLE KEYS */;
/*!40000 ALTER TABLE `respuesta_detalle` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `respuesta_encuesta`
--

DROP TABLE IF EXISTS `respuesta_encuesta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `respuesta_encuesta` (
  `id_respuesta` int(11) NOT NULL AUTO_INCREMENT,
  `uuid` char(36) NOT NULL,
  `clasificacion` varchar(20) DEFAULT NULL,
  `lugar` varchar(50) DEFAULT NULL,
  `profesional` varchar(50) DEFAULT NULL,
  `comentario` varchar(255) DEFAULT NULL,
  `fecha_portal` datetime NOT NULL,
  `fecha_recibida` datetime NOT NULL DEFAULT current_timestamp(),
  `id_encuesta` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_respuesta`),
  UNIQUE KEY `uuid` (`uuid`),
  KEY `idx_respuesta_fecha` (`fecha_portal`),
  KEY `idx_respuesta_encuesta` (`id_encuesta`),
  CONSTRAINT `fk_respuesta_id_encuesta` FOREIGN KEY (`id_encuesta`) REFERENCES `encuesta` (`id_encuesta`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `respuesta_encuesta`
--

LOCK TABLES `respuesta_encuesta` WRITE;
/*!40000 ALTER TABLE `respuesta_encuesta` DISABLE KEYS */;
/*!40000 ALTER TABLE `respuesta_encuesta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rol`
--

DROP TABLE IF EXISTS `rol`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rol` (
  `id_rol` int(11) NOT NULL,
  `nombre_rol` varchar(40) NOT NULL,
  PRIMARY KEY (`id_rol`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rol`
--

LOCK TABLES `rol` WRITE;
/*!40000 ALTER TABLE `rol` DISABLE KEYS */;
INSERT INTO `rol` VALUES (1,'Administrador'),(2,'Funcionario');
/*!40000 ALTER TABLE `rol` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sector`
--

DROP TABLE IF EXISTS `sector`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sector` (
  `id_sector` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_sector` varchar(60) NOT NULL,
  PRIMARY KEY (`id_sector`),
  UNIQUE KEY `nombre_sector` (`nombre_sector`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sector`
--

LOCK TABLES `sector` WRITE;
/*!40000 ALTER TABLE `sector` DISABLE KEYS */;
INSERT INTO `sector` VALUES (3,'Admisiones'),(1,'Enfermería'),(4,'Mantenimiento'),(2,'Servicio web');
/*!40000 ALTER TABLE `sector` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sincronizacion`
--

DROP TABLE IF EXISTS `sincronizacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sincronizacion` (
  `clave` varchar(40) NOT NULL,
  `ultimo_intento` datetime DEFAULT NULL,
  `ultimo_exito` datetime DEFAULT NULL,
  `ultimo_error` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`clave`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sincronizacion`
--

LOCK TABLES `sincronizacion` WRITE;
/*!40000 ALTER TABLE `sincronizacion` DISABLE KEYS */;
INSERT INTO `sincronizacion` VALUES ('encuestas',NULL,NULL,NULL);
/*!40000 ALTER TABLE `sincronizacion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'sigsm'
--

--
-- Dumping routines for database 'sigsm'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-10-29 13:08:51
