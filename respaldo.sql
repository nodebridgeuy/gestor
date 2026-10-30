-- MariaDB dump 10.19  Distrib 10.4.32-MariaDB, for Win64 (AMD64)
--
-- Host: localhost    Database: sigsm
-- ------------------------------------------------------
-- Server version	10.4.32-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Current Database: `sigsm`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `sigsm` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci */;

USE `sigsm`;

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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
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
  `debe_cambiar_clave` tinyint(1) NOT NULL DEFAULT 0,
  `cedula` varchar(8) DEFAULT NULL,
  PRIMARY KEY (`id_funcionario`),
  UNIQUE KEY `nombre` (`nombre`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `uq_funcionario_cedula` (`cedula`),
  KEY `fk_funcionario_rol` (`id_rol`),
  CONSTRAINT `fk_funcionario_rol` FOREIGN KEY (`id_rol`) REFERENCES `rol` (`id_rol`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `funcionario`
--

LOCK TABLES `funcionario` WRITE;
/*!40000 ALTER TABLE `funcionario` DISABLE KEYS */;
INSERT INTO `funcionario` VALUES (1,'admin','$2y$10$6eo3h4S3ZkkpdWE5hCZ0Zu.42NZG7zJsDhk5vMfLsk1eimanMN8qG',1,1,NULL,0,'12345672'),(2,'leo','$2y$10$64GYYydpCJIVvNmpNrpBfOKQbN/kP49OaGGnUiUr4iGPxQCnJGUUO',2,1,'leo@gmail.com',0,NULL);
/*!40000 ALTER TABLE `funcionario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `intento_login`
--

DROP TABLE IF EXISTS `intento_login`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `intento_login` (
  `id_intento` int(11) NOT NULL AUTO_INCREMENT,
  `usuario` varchar(50) NOT NULL,
  `ip` varchar(45) NOT NULL,
  `fecha` datetime NOT NULL,
  PRIMARY KEY (`id_intento`),
  KEY `idx_intento_fecha` (`fecha`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `intento_login`
--

LOCK TABLES `intento_login` WRITE;
/*!40000 ALTER TABLE `intento_login` DISABLE KEYS */;
/*!40000 ALTER TABLE `intento_login` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
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
INSERT INTO `sincronizacion` VALUES ('encuestas','2026-10-30 17:59:30','2026-10-30 17:59:30',NULL);
/*!40000 ALTER TABLE `sincronizacion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `solicitud_clave`
--

DROP TABLE IF EXISTS `solicitud_clave`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `solicitud_clave` (
  `id_solicitud` int(11) NOT NULL AUTO_INCREMENT,
  `id_funcionario` int(11) NOT NULL,
  `fecha` datetime NOT NULL,
  `atendida` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id_solicitud`),
  KEY `idx_solicitud_pendiente` (`atendida`,`id_funcionario`),
  KEY `fk_solicitud_funcionario` (`id_funcionario`),
  CONSTRAINT `fk_solicitud_funcionario` FOREIGN KEY (`id_funcionario`) REFERENCES `funcionario` (`id_funcionario`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `solicitud_clave`
--

LOCK TABLES `solicitud_clave` WRITE;
/*!40000 ALTER TABLE `solicitud_clave` DISABLE KEYS */;
INSERT INTO `solicitud_clave` VALUES (1,2,'2026-10-30 21:08:57',1);
/*!40000 ALTER TABLE `solicitud_clave` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'sigsm'
--

--
-- Current Database: `portal_informativo`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `portal_informativo` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci */;

USE `portal_informativo`;

--
-- Table structure for table `categorias`
--

DROP TABLE IF EXISTS `categorias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `categorias` (
  `id_categoria` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  PRIMARY KEY (`id_categoria`),
  UNIQUE KEY `nombre` (`nombre`)
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categorias`
--

LOCK TABLES `categorias` WRITE;
/*!40000 ALTER TABLE `categorias` DISABLE KEYS */;
INSERT INTO `categorias` VALUES (24,'Anestesiología'),(5,'Cardiología'),(6,'Centro cardiovascular'),(25,'Cirugía plástica y quemados'),(26,'Cirugía vascular periférica'),(7,'Clínica médica A'),(8,'Clínica médica B'),(9,'Clínica médica C'),(23,'Depto. Clínico de cirugía'),(10,'Dermatología'),(4,'Dpto. Clínico de medicina'),(2,'Emergencia'),(11,'Endocrinología'),(12,'Gastroenterología'),(13,'Geriatría'),(27,'Ginecotocológica B'),(14,'Hematología'),(39,'Hemoterapia'),(40,'Imagenología'),(15,'Infectología'),(16,'Medicina física, rehabilitación y medicina del deporte'),(38,'Medicina Nuclear'),(17,'Nefrología'),(3,'Neonatología'),(28,'Neurocirugía'),(18,'Neurología'),(29,'Odontología'),(30,'Oftalmología'),(19,'Oncología'),(31,'Otorrinolaringología'),(20,'Psiquiatría'),(32,'Quirúrgica A'),(33,'Quirúrgica B'),(34,'Quirúrgica F'),(37,'Radioterapia'),(36,'Traumatología y ortopedia de adultos'),(21,'U.E. Autoinmunes sistémicas'),(1,'Unidad de Cuidados Paliativos'),(22,'Unidad de tabaquismo'),(35,'Urología');
/*!40000 ALTER TABLE `categorias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `documentos`
--

DROP TABLE IF EXISTS `documentos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `documentos` (
  `id_documento` int(11) NOT NULL AUTO_INCREMENT,
  `id_externo` int(11) DEFAULT NULL,
  `titulo` varchar(150) NOT NULL,
  `ruta_archivo` varchar(255) NOT NULL,
  `fecha_subida` datetime DEFAULT current_timestamp(),
  `categoria_id` int(11) NOT NULL,
  PRIMARY KEY (`id_documento`),
  UNIQUE KEY `ruta_archivo` (`ruta_archivo`),
  UNIQUE KEY `id_externo` (`id_externo`),
  KEY `idx_documentos_categoria` (`categoria_id`),
  CONSTRAINT `documentos_ibfk_1` FOREIGN KEY (`categoria_id`) REFERENCES `categorias` (`id_categoria`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=245 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `documentos`
--

LOCK TABLES `documentos` WRITE;
/*!40000 ALTER TABLE `documentos` DISABLE KEYS */;
INSERT INTO `documentos` VALUES (1,NULL,'Guía general de Unidad de Cuidados Paliativos 1','unidad-de-cuidados-paliativos/guia-general-de-unidad-de-cuidados-paliativos-1.pdf','2026-10-24 23:09:17',1),(2,NULL,'Guía general de Unidad de Cuidados Paliativos 2','unidad-de-cuidados-paliativos/guia-general-de-unidad-de-cuidados-paliativos-2.pdf','2026-10-24 23:09:17',1),(3,NULL,'Guía general de Unidad de Cuidados Paliativos 3','unidad-de-cuidados-paliativos/guia-general-de-unidad-de-cuidados-paliativos-3.pdf','2026-10-24 23:09:17',1),(4,NULL,'Guía general de Emergencia 1','emergencia/guia-general-de-emergencia-1.pdf','2026-10-24 23:09:17',2),(5,NULL,'Guía general de Emergencia 2','emergencia/guia-general-de-emergencia-2.pdf','2026-10-24 23:09:17',2),(6,NULL,'Guía general de Emergencia 3','emergencia/guia-general-de-emergencia-3.pdf','2026-10-24 23:09:17',2),(7,NULL,'Guía general de Neonatología 1','neonatologia/guia-general-de-neonatologia-1.pdf','2026-10-24 23:09:17',3),(8,NULL,'Guía general de Neonatología 2','neonatologia/guia-general-de-neonatologia-2.pdf','2026-10-24 23:09:17',3),(9,NULL,'Guía general de Neonatología 3','neonatologia/guia-general-de-neonatologia-3.pdf','2026-10-24 23:09:17',3),(10,NULL,'Guía general de Dpto. Clínico de medicina 1','dpto-clinico-de-medicina/guia-general-de-dpto-clinico-de-medicina-1.pdf','2026-10-24 23:09:17',4),(11,NULL,'Guía general de Dpto. Clínico de medicina 2','dpto-clinico-de-medicina/guia-general-de-dpto-clinico-de-medicina-2.pdf','2026-10-24 23:09:17',4),(12,NULL,'Guía general de Dpto. Clínico de medicina 3','dpto-clinico-de-medicina/guia-general-de-dpto-clinico-de-medicina-3.pdf','2026-10-24 23:09:17',4),(13,NULL,'Indicaciones ecocardiograma con dobutamina','cardiologia/indicaciones-ecocardiograma-con-dobutamina.pdf','2026-10-24 23:09:17',5),(14,NULL,'Indicaciones para pacientes en tratamiento con warfarina','cardiologia/indicaciones-para-pacientes-en-tratamiento-con-warfarina.pdf','2026-10-24 23:09:17',5),(15,NULL,'Indicaciones ecocardiograma transesofágico','cardiologia/indicaciones-ecocardiograma-transesofagico.pdf','2026-10-24 23:09:17',5),(16,NULL,'Guía general de Centro cardiovascular 1','centro-cardiovascular/guia-general-de-centro-cardiovascular-1.pdf','2026-10-24 23:09:17',6),(17,NULL,'Guía general de Centro cardiovascular 2','centro-cardiovascular/guia-general-de-centro-cardiovascular-2.pdf','2026-10-24 23:09:17',6),(18,NULL,'Guía general de Centro cardiovascular 3','centro-cardiovascular/guia-general-de-centro-cardiovascular-3.pdf','2026-10-24 23:09:17',6),(19,NULL,'Guía general de Clínica médica A 1','clinica-medica-a/guia-general-de-clinica-medica-a-1.pdf','2026-10-24 23:09:17',7),(20,NULL,'Guía general de Clínica médica A 2','clinica-medica-a/guia-general-de-clinica-medica-a-2.pdf','2026-10-24 23:09:17',7),(21,NULL,'Guía general de Clínica médica A 3','clinica-medica-a/guia-general-de-clinica-medica-a-3.pdf','2026-10-24 23:09:17',7),(22,NULL,'Guía general de Clínica médica B 1','clinica-medica-b/guia-general-de-clinica-medica-b-1.pdf','2026-10-24 23:09:17',8),(23,NULL,'Guía general de Clínica médica B 2','clinica-medica-b/guia-general-de-clinica-medica-b-2.pdf','2026-10-24 23:09:17',8),(24,NULL,'Guía general de Clínica médica B 3','clinica-medica-b/guia-general-de-clinica-medica-b-3.pdf','2026-10-24 23:09:17',8),(25,NULL,'Guía general de Clínica médica C 1','clinica-medica-c/guia-general-de-clinica-medica-c-1.pdf','2026-10-24 23:09:17',9),(26,NULL,'Guía general de Clínica médica C 2','clinica-medica-c/guia-general-de-clinica-medica-c-2.pdf','2026-10-24 23:09:17',9),(27,NULL,'Guía general de Clínica médica C 3','clinica-medica-c/guia-general-de-clinica-medica-c-3.pdf','2026-10-24 23:09:17',9),(28,NULL,'Guía general de Dermatología 1','dermatologia/guia-general-de-dermatologia-1.pdf','2026-10-24 23:09:17',10),(29,NULL,'Guía general de Dermatología 2','dermatologia/guia-general-de-dermatologia-2.pdf','2026-10-24 23:09:17',10),(30,NULL,'Guía general de Dermatología 3','dermatologia/guia-general-de-dermatologia-3.pdf','2026-10-24 23:09:17',10),(31,NULL,'Guía general de Endocrinología 1','endocrinologia/guia-general-de-endocrinologia-1.pdf','2026-10-24 23:09:17',11),(32,NULL,'Guía general de Endocrinología 2','endocrinologia/guia-general-de-endocrinologia-2.pdf','2026-10-24 23:09:17',11),(33,NULL,'Guía general de Endocrinología 3','endocrinologia/guia-general-de-endocrinologia-3.pdf','2026-10-24 23:09:17',11),(34,NULL,'Pauta para pacientes ostomizados (7 páginas)','gastroenterologia/pauta-para-pacientes-ostomizados-7-paginas.pdf','2026-10-24 23:09:17',12),(35,NULL,'Guía general de Gastroenterología 2','gastroenterologia/guia-general-de-gastroenterologia-2.pdf','2026-10-24 23:09:17',12),(36,NULL,'Guía general de Gastroenterología 3','gastroenterologia/guia-general-de-gastroenterologia-3.pdf','2026-10-24 23:09:17',12),(37,NULL,'Guía general de Geriatría 1','geriatria/guia-general-de-geriatria-1.pdf','2026-10-24 23:09:17',13),(38,NULL,'Guía general de Geriatría 2','geriatria/guia-general-de-geriatria-2.pdf','2026-10-24 23:09:17',13),(39,NULL,'Guía general de Geriatría 3','geriatria/guia-general-de-geriatria-3.pdf','2026-10-24 23:09:17',13),(40,NULL,'Guía general de Hematología 1','hematologia/guia-general-de-hematologia-1.pdf','2026-10-24 23:09:17',14),(41,NULL,'Guía general de Hematología 2','hematologia/guia-general-de-hematologia-2.pdf','2026-10-24 23:09:17',14),(42,NULL,'Guía general de Hematología 3','hematologia/guia-general-de-hematologia-3.pdf','2026-10-24 23:09:17',14),(43,NULL,'Guía general de Infectología 1','infectologia/guia-general-de-infectologia-1.pdf','2026-10-24 23:09:17',15),(44,NULL,'Guía general de Infectología 2','infectologia/guia-general-de-infectologia-2.pdf','2026-10-24 23:09:17',15),(45,NULL,'Guía general de Infectología 3','infectologia/guia-general-de-infectologia-3.pdf','2026-10-24 23:09:17',15),(46,NULL,'Guía general de Medicina física, rehabilitación y medicina del deporte 1','medicina-fisica-rehabilitacion-y-medicina-del-deporte/guia-general-de-medicina-fisica-rehabilitacion-y-medicina-del-deporte-1.pdf','2026-10-24 23:09:17',16),(47,NULL,'Guía general de Medicina física, rehabilitación y medicina del deporte 2','medicina-fisica-rehabilitacion-y-medicina-del-deporte/guia-general-de-medicina-fisica-rehabilitacion-y-medicina-del-deporte-2.pdf','2026-10-24 23:09:17',16),(48,NULL,'Guía general de Medicina física, rehabilitación y medicina del deporte 3','medicina-fisica-rehabilitacion-y-medicina-del-deporte/guia-general-de-medicina-fisica-rehabilitacion-y-medicina-del-deporte-3.pdf','2026-10-24 23:09:17',16),(49,NULL,'Guía general de Nefrología 1','nefrologia/guia-general-de-nefrologia-1.pdf','2026-10-24 23:09:17',17),(50,NULL,'Guía general de Nefrología 2','nefrologia/guia-general-de-nefrologia-2.pdf','2026-10-24 23:09:17',17),(51,NULL,'Guía general de Nefrología 3','nefrologia/guia-general-de-nefrologia-3.pdf','2026-10-24 23:09:17',17),(52,NULL,'Guía general de Neurología 1','neurologia/guia-general-de-neurologia-1.pdf','2026-10-24 23:09:17',18),(53,NULL,'Guía general de Neurología 2','neurologia/guia-general-de-neurologia-2.pdf','2026-10-24 23:09:17',18),(54,NULL,'Guía general de Neurología 3','neurologia/guia-general-de-neurologia-3.pdf','2026-10-24 23:09:17',18),(55,NULL,'Guía general de Oncología 1','oncologia/guia-general-de-oncologia-1.pdf','2026-10-24 23:09:17',19),(56,NULL,'Guía general de Oncología 2','oncologia/guia-general-de-oncologia-2.pdf','2026-10-24 23:09:17',19),(57,NULL,'Guía general de Oncología 3','oncologia/guia-general-de-oncologia-3.pdf','2026-10-24 23:09:17',19),(58,NULL,'Guía general de Psiquiatría 1','psiquiatria/guia-general-de-psiquiatria-1.pdf','2026-10-24 23:09:17',20),(59,NULL,'Guía general de Psiquiatría 2','psiquiatria/guia-general-de-psiquiatria-2.pdf','2026-10-24 23:09:17',20),(60,NULL,'Guía general de Psiquiatría 3','psiquiatria/guia-general-de-psiquiatria-3.pdf','2026-10-24 23:09:17',20),(61,NULL,'Guía general de U.E. Autoinmunes sistémicas 1','u-e-autoinmunes-sistemicas/guia-general-de-u-e-autoinmunes-sistemicas-1.pdf','2026-10-24 23:09:17',21),(62,NULL,'Guía general de U.E. Autoinmunes sistémicas 2','u-e-autoinmunes-sistemicas/guia-general-de-u-e-autoinmunes-sistemicas-2.pdf','2026-10-24 23:09:17',21),(63,NULL,'Guía general de U.E. Autoinmunes sistémicas 3','u-e-autoinmunes-sistemicas/guia-general-de-u-e-autoinmunes-sistemicas-3.pdf','2026-10-24 23:09:17',21),(64,NULL,'Guía general de Unidad de tabaquismo 1','unidad-de-tabaquismo/guia-general-de-unidad-de-tabaquismo-1.pdf','2026-10-24 23:09:17',22),(65,NULL,'Guía general de Unidad de tabaquismo 2','unidad-de-tabaquismo/guia-general-de-unidad-de-tabaquismo-2.pdf','2026-10-24 23:09:17',22),(66,NULL,'Guía general de Unidad de tabaquismo 3','unidad-de-tabaquismo/guia-general-de-unidad-de-tabaquismo-3.pdf','2026-10-24 23:09:17',22),(67,NULL,'Guía general de Depto. Clínico de cirugía 1','depto-clinico-de-cirugia/guia-general-de-depto-clinico-de-cirugia-1.pdf','2026-10-24 23:09:17',23),(68,NULL,'Guía general de Depto. Clínico de cirugía 2','depto-clinico-de-cirugia/guia-general-de-depto-clinico-de-cirugia-2.pdf','2026-10-24 23:09:17',23),(69,NULL,'Guía general de Depto. Clínico de cirugía 3','depto-clinico-de-cirugia/guia-general-de-depto-clinico-de-cirugia-3.pdf','2026-10-24 23:09:17',23),(70,NULL,'Guía general de Anestesiología 1','anestesiologia/guia-general-de-anestesiologia-1.pdf','2026-10-24 23:09:17',24),(71,NULL,'Guía general de Anestesiología 2','anestesiologia/guia-general-de-anestesiologia-2.pdf','2026-10-24 23:09:17',24),(72,NULL,'Guía general de Anestesiología 3','anestesiologia/guia-general-de-anestesiologia-3.pdf','2026-10-24 23:09:17',24),(73,NULL,'Guía general de Cirugía plástica y quemados 1','cirugia-plastica-y-quemados/guia-general-de-cirugia-plastica-y-quemados-1.pdf','2026-10-24 23:09:17',25),(74,NULL,'Guía general de Cirugía plástica y quemados 2','cirugia-plastica-y-quemados/guia-general-de-cirugia-plastica-y-quemados-2.pdf','2026-10-24 23:09:17',25),(75,NULL,'Guía general de Cirugía plástica y quemados 3','cirugia-plastica-y-quemados/guia-general-de-cirugia-plastica-y-quemados-3.pdf','2026-10-24 23:09:17',25),(76,NULL,'Guía general de Cirugía vascular periférica 1','cirugia-vascular-periferica/guia-general-de-cirugia-vascular-periferica-1.pdf','2026-10-24 23:09:17',26),(77,NULL,'Guía general de Cirugía vascular periférica 2','cirugia-vascular-periferica/guia-general-de-cirugia-vascular-periferica-2.pdf','2026-10-24 23:09:17',26),(78,NULL,'Guía general de Cirugía vascular periférica 3','cirugia-vascular-periferica/guia-general-de-cirugia-vascular-periferica-3.pdf','2026-10-24 23:09:17',26),(79,NULL,'Indicaciones de interrupción voluntaria del embarazo','ginecotocologica-b/indicaciones-de-interrupcion-voluntaria-del-embarazo.pdf','2026-10-24 23:09:17',27),(80,NULL,'Guía general de Ginecotocológica B 2','ginecotocologica-b/guia-general-de-ginecotocologica-b-2.pdf','2026-10-24 23:09:17',27),(81,NULL,'Guía general de Ginecotocológica B 3','ginecotocologica-b/guia-general-de-ginecotocologica-b-3.pdf','2026-10-24 23:09:17',27),(82,NULL,'Guía general de Neurocirugía 1','neurocirugia/guia-general-de-neurocirugia-1.pdf','2026-10-24 23:09:17',28),(83,NULL,'Guía general de Neurocirugía 2','neurocirugia/guia-general-de-neurocirugia-2.pdf','2026-10-24 23:09:17',28),(84,NULL,'Guía general de Neurocirugía 3','neurocirugia/guia-general-de-neurocirugia-3.pdf','2026-10-24 23:09:17',28),(85,NULL,'Guía general de Odontología 1','odontologia/guia-general-de-odontologia-1.pdf','2026-10-24 23:09:17',29),(86,NULL,'Guía general de Odontología 2','odontologia/guia-general-de-odontologia-2.pdf','2026-10-24 23:09:17',29),(87,NULL,'Guía general de Odontología 3','odontologia/guia-general-de-odontologia-3.pdf','2026-10-24 23:09:17',29),(88,NULL,'Guía general de Oftalmología 1','oftalmologia/guia-general-de-oftalmologia-1.pdf','2026-10-24 23:09:17',30),(89,NULL,'Guía general de Oftalmología 2','oftalmologia/guia-general-de-oftalmologia-2.pdf','2026-10-24 23:09:17',30),(90,NULL,'Guía general de Oftalmología 3','oftalmologia/guia-general-de-oftalmologia-3.pdf','2026-10-24 23:09:17',30),(91,NULL,'Guía general de Otorrinolaringología 1','otorrinolaringologia/guia-general-de-otorrinolaringologia-1.pdf','2026-10-24 23:09:17',31),(92,NULL,'Guía general de Otorrinolaringología 2','otorrinolaringologia/guia-general-de-otorrinolaringologia-2.pdf','2026-10-24 23:09:17',31),(93,NULL,'Guía general de Otorrinolaringología 3','otorrinolaringologia/guia-general-de-otorrinolaringologia-3.pdf','2026-10-24 23:09:17',31),(94,NULL,'Guía general de Quirúrgica A 1','quirurgica-a/guia-general-de-quirurgica-a-1.pdf','2026-10-24 23:09:17',32),(95,NULL,'Guía general de Quirúrgica A 2','quirurgica-a/guia-general-de-quirurgica-a-2.pdf','2026-10-24 23:09:17',32),(96,NULL,'Guía general de Quirúrgica A 3','quirurgica-a/guia-general-de-quirurgica-a-3.pdf','2026-10-24 23:09:17',32),(97,NULL,'Guía general de Quirúrgica B 1','quirurgica-b/guia-general-de-quirurgica-b-1.pdf','2026-10-24 23:09:17',33),(98,NULL,'Guía general de Quirúrgica B 2','quirurgica-b/guia-general-de-quirurgica-b-2.pdf','2026-10-24 23:09:17',33),(99,NULL,'Guía general de Quirúrgica B 3','quirurgica-b/guia-general-de-quirurgica-b-3.pdf','2026-10-24 23:09:17',33),(100,NULL,'Guía general de Quirúrgica F 1','quirurgica-f/guia-general-de-quirurgica-f-1.pdf','2026-10-24 23:09:17',34),(101,NULL,'Guía general de Quirúrgica F 2','quirurgica-f/guia-general-de-quirurgica-f-2.pdf','2026-10-24 23:09:17',34),(102,NULL,'Guía general de Quirúrgica F 3','quirurgica-f/guia-general-de-quirurgica-f-3.pdf','2026-10-24 23:09:17',34),(103,NULL,'Prostatectomía radical (indicaciones e información para el paciente)','urologia/prostatectomia-radical-indicaciones-e-informacion-para-el-paciente.pdf','2026-10-24 23:09:17',35),(104,NULL,'Guía general de Urología 2','urologia/guia-general-de-urologia-2.pdf','2026-10-24 23:09:17',35),(105,NULL,'Guía general de Urología 3','urologia/guia-general-de-urologia-3.pdf','2026-10-24 23:09:17',35),(106,NULL,'Guía general de Traumatología y ortopedia de adultos 1','traumatologia-y-ortopedia-de-adultos/guia-general-de-traumatologia-y-ortopedia-de-adultos-1.pdf','2026-10-24 23:09:17',36),(107,NULL,'Guía general de Traumatología y ortopedia de adultos 2','traumatologia-y-ortopedia-de-adultos/guia-general-de-traumatologia-y-ortopedia-de-adultos-2.pdf','2026-10-24 23:09:17',36),(108,NULL,'Guía general de Traumatología y ortopedia de adultos 3','traumatologia-y-ortopedia-de-adultos/guia-general-de-traumatologia-y-ortopedia-de-adultos-3.pdf','2026-10-24 23:09:17',36),(109,NULL,'Guía general de Radioterapia 1','radioterapia/guia-general-de-radioterapia-1.pdf','2026-10-24 23:09:17',37),(110,NULL,'Guía general de Radioterapia 2','radioterapia/guia-general-de-radioterapia-2.pdf','2026-10-24 23:09:17',37),(111,NULL,'Guía general de Radioterapia 3','radioterapia/guia-general-de-radioterapia-3.pdf','2026-10-24 23:09:17',37),(112,NULL,'Estudios diagnósticos con pertecneciato','medicina-nuclear/estudios-diagnosticos-con-pertecneciato.pdf','2026-10-24 23:09:17',38),(113,NULL,'Información sobre Centellograma de perfusión miocárdica','medicina-nuclear/informacion-sobre-centellograma-de-perfusion-miocardica.pdf','2026-10-24 23:09:17',38),(114,NULL,'Guía general de Medicina Nuclear 3','medicina-nuclear/guia-general-de-medicina-nuclear-3.pdf','2026-10-24 23:09:17',38),(115,NULL,'Guía general de Hemoterapia 1','hemoterapia/guia-general-de-hemoterapia-1.pdf','2026-10-24 23:09:17',39),(116,NULL,'Guía general de Hemoterapia 2','hemoterapia/guia-general-de-hemoterapia-2.pdf','2026-10-24 23:09:17',39),(117,NULL,'Guía general de Hemoterapia 3','hemoterapia/guia-general-de-hemoterapia-3.pdf','2026-10-24 23:09:17',39),(118,NULL,'Preparación para estudios imagenológicos','imagenologia/preparacion-para-estudios-imagenologicos.pdf','2026-10-24 23:09:17',40),(119,NULL,'Guía general de Imagenología 2','imagenologia/guia-general-de-imagenologia-2.pdf','2026-10-24 23:09:17',40),(120,NULL,'Guía general de Imagenología 3','imagenologia/guia-general-de-imagenologia-3.pdf','2026-10-24 23:09:17',40);
/*!40000 ALTER TABLE `documentos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `encuestas`
--

DROP TABLE IF EXISTS `encuestas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `encuestas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_externo` int(11) NOT NULL,
  `titulo` varchar(150) NOT NULL,
  `descripcion` varchar(500) DEFAULT NULL,
  `sector` varchar(100) NOT NULL,
  `preguntas` mediumtext NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_externo` (`id_externo`),
  KEY `idx_encuestas_sector` (`sector`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `encuestas`
--

LOCK TABLES `encuestas` WRITE;
/*!40000 ALTER TABLE `encuestas` DISABLE KEYS */;
/*!40000 ALTER TABLE `encuestas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `respuestas`
--

DROP TABLE IF EXISTS `respuestas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `respuestas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uuid` char(36) NOT NULL,
  `encuesta_externo` int(11) DEFAULT NULL,
  `respuestas_json` mediumtext DEFAULT NULL,
  `clasificacion` varchar(20) DEFAULT NULL,
  `lugar` varchar(50) DEFAULT NULL,
  `profesional` varchar(50) DEFAULT NULL,
  `comentario` varchar(255) DEFAULT NULL,
  `fecha` datetime DEFAULT current_timestamp(),
  `sincronizado` tinyint(1) NOT NULL DEFAULT 0,
  `fecha_sincronizado` datetime DEFAULT NULL,
  `ip_hash` char(64) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uuid` (`uuid`),
  KEY `idx_respuestas_pendientes` (`sincronizado`,`id`),
  KEY `idx_respuestas_ip` (`ip_hash`,`fecha`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `respuestas`
--

LOCK TABLES `respuestas` WRITE;
/*!40000 ALTER TABLE `respuestas` DISABLE KEYS */;
INSERT INTO `respuestas` VALUES (1,'e5ea1625-f218-4942-a84b-102dfce9c92a',NULL,NULL,'regular','lab3','profesional3','prueba desde el supuesto portal de xaamp','2026-10-24 23:13:26',1,'2026-10-28 21:21:29','937dc91c9659af6ed839eb72aa8412c481ba239ee7c7f85e3eee7ef8122d8129'),(2,'212c3fd5-f25a-427f-8b9d-86beb1742337',NULL,NULL,'regular','lab5','profesional3','jkasd','2026-10-25 01:29:57',1,'2026-10-28 21:21:29','937dc91c9659af6ed839eb72aa8412c481ba239ee7c7f85e3eee7ef8122d8129'),(3,'c5d7a919-228f-40bb-a6df-5efe598e5c4c',NULL,NULL,'buena','lab2','profesional3','prueba de que el gestor ya esta funcionando en localhost','2026-10-25 16:59:32',1,'2026-10-28 21:21:29','937dc91c9659af6ed839eb72aa8412c481ba239ee7c7f85e3eee7ef8122d8129'),(4,'b00ece97-7140-4293-a202-1dc65c2b098d',1,'[{\"pregunta_id\":1,\"pregunta\":\"papita pal loro\",\"tipo\":\"escala\",\"valor\":\"3\"}]',NULL,NULL,NULL,NULL,'2026-10-28 21:21:25',1,'2026-10-28 21:21:29','4bb80d02e4fe81c91cf7d36d11455062d40da5e16ba7f8c0b523dbe1f5b6f718'),(5,'fb185cfe-9007-4108-b70c-72ab7894ceb6',3,'[{\"pregunta_id\":4,\"pregunta\":\"cuantos años tenes dea\",\"tipo\":\"texto\",\"valor\":\"prueba en vivo\"},{\"pregunta_id\":5,\"pregunta\":\"satisfaccion\",\"tipo\":\"escala\",\"valor\":\"5\"}]',NULL,NULL,NULL,NULL,'2026-10-28 21:43:21',1,'2026-10-28 21:43:28','4bb80d02e4fe81c91cf7d36d11455062d40da5e16ba7f8c0b523dbe1f5b6f718');
/*!40000 ALTER TABLE `respuestas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'portal_informativo'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-10-30 18:03:42
