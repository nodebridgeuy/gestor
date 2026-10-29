-- MariaDB dump 10.19  Distrib 10.4.32-MariaDB, for Win64 (AMD64)
--
-- Host: localhost    Database: portal_informativo
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
) ENGINE=InnoDB AUTO_INCREMENT=81 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
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
) ENGINE=InnoDB AUTO_INCREMENT=241 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `documentos`
--

LOCK TABLES `documentos` WRITE;
/*!40000 ALTER TABLE `documentos` DISABLE KEYS */;
INSERT INTO `documentos` VALUES (1,NULL,'Guía general de Unidad de Cuidados Paliativos 1','unidad-de-cuidados-paliativos/guia-general-de-unidad-de-cuidados-paliativos-1.pdf','2026-10-29 12:40:28',1),(2,NULL,'Guía general de Unidad de Cuidados Paliativos 2','unidad-de-cuidados-paliativos/guia-general-de-unidad-de-cuidados-paliativos-2.pdf','2026-10-29 12:40:28',1),(3,NULL,'Guía general de Unidad de Cuidados Paliativos 3','unidad-de-cuidados-paliativos/guia-general-de-unidad-de-cuidados-paliativos-3.pdf','2026-10-29 12:40:28',1),(4,NULL,'Guía general de Emergencia 1','emergencia/guia-general-de-emergencia-1.pdf','2026-10-29 12:40:28',2),(5,NULL,'Guía general de Emergencia 2','emergencia/guia-general-de-emergencia-2.pdf','2026-10-29 12:40:28',2),(6,NULL,'Guía general de Emergencia 3','emergencia/guia-general-de-emergencia-3.pdf','2026-10-29 12:40:28',2),(7,NULL,'Guía general de Neonatología 1','neonatologia/guia-general-de-neonatologia-1.pdf','2026-10-29 12:40:28',3),(8,NULL,'Guía general de Neonatología 2','neonatologia/guia-general-de-neonatologia-2.pdf','2026-10-29 12:40:28',3),(9,NULL,'Guía general de Neonatología 3','neonatologia/guia-general-de-neonatologia-3.pdf','2026-10-29 12:40:28',3),(10,NULL,'Guía general de Dpto. Clínico de medicina 1','dpto-clinico-de-medicina/guia-general-de-dpto-clinico-de-medicina-1.pdf','2026-10-29 12:40:28',4),(11,NULL,'Guía general de Dpto. Clínico de medicina 2','dpto-clinico-de-medicina/guia-general-de-dpto-clinico-de-medicina-2.pdf','2026-10-29 12:40:28',4),(12,NULL,'Guía general de Dpto. Clínico de medicina 3','dpto-clinico-de-medicina/guia-general-de-dpto-clinico-de-medicina-3.pdf','2026-10-29 12:40:28',4),(13,NULL,'Indicaciones ecocardiograma con dobutamina','cardiologia/indicaciones-ecocardiograma-con-dobutamina.pdf','2026-10-29 12:40:28',5),(14,NULL,'Indicaciones para pacientes en tratamiento con warfarina','cardiologia/indicaciones-para-pacientes-en-tratamiento-con-warfarina.pdf','2026-10-29 12:40:28',5),(15,NULL,'Indicaciones ecocardiograma transesofágico','cardiologia/indicaciones-ecocardiograma-transesofagico.pdf','2026-10-29 12:40:28',5),(16,NULL,'Guía general de Centro cardiovascular 1','centro-cardiovascular/guia-general-de-centro-cardiovascular-1.pdf','2026-10-29 12:40:28',6),(17,NULL,'Guía general de Centro cardiovascular 2','centro-cardiovascular/guia-general-de-centro-cardiovascular-2.pdf','2026-10-29 12:40:28',6),(18,NULL,'Guía general de Centro cardiovascular 3','centro-cardiovascular/guia-general-de-centro-cardiovascular-3.pdf','2026-10-29 12:40:28',6),(19,NULL,'Guía general de Clínica médica A 1','clinica-medica-a/guia-general-de-clinica-medica-a-1.pdf','2026-10-29 12:40:28',7),(20,NULL,'Guía general de Clínica médica A 2','clinica-medica-a/guia-general-de-clinica-medica-a-2.pdf','2026-10-29 12:40:28',7),(21,NULL,'Guía general de Clínica médica A 3','clinica-medica-a/guia-general-de-clinica-medica-a-3.pdf','2026-10-29 12:40:28',7),(22,NULL,'Guía general de Clínica médica B 1','clinica-medica-b/guia-general-de-clinica-medica-b-1.pdf','2026-10-29 12:40:28',8),(23,NULL,'Guía general de Clínica médica B 2','clinica-medica-b/guia-general-de-clinica-medica-b-2.pdf','2026-10-29 12:40:28',8),(24,NULL,'Guía general de Clínica médica B 3','clinica-medica-b/guia-general-de-clinica-medica-b-3.pdf','2026-10-29 12:40:28',8),(25,NULL,'Guía general de Clínica médica C 1','clinica-medica-c/guia-general-de-clinica-medica-c-1.pdf','2026-10-29 12:40:28',9),(26,NULL,'Guía general de Clínica médica C 2','clinica-medica-c/guia-general-de-clinica-medica-c-2.pdf','2026-10-29 12:40:28',9),(27,NULL,'Guía general de Clínica médica C 3','clinica-medica-c/guia-general-de-clinica-medica-c-3.pdf','2026-10-29 12:40:28',9),(28,NULL,'Guía general de Dermatología 1','dermatologia/guia-general-de-dermatologia-1.pdf','2026-10-29 12:40:28',10),(29,NULL,'Guía general de Dermatología 2','dermatologia/guia-general-de-dermatologia-2.pdf','2026-10-29 12:40:28',10),(30,NULL,'Guía general de Dermatología 3','dermatologia/guia-general-de-dermatologia-3.pdf','2026-10-29 12:40:28',10),(31,NULL,'Guía general de Endocrinología 1','endocrinologia/guia-general-de-endocrinologia-1.pdf','2026-10-29 12:40:28',11),(32,NULL,'Guía general de Endocrinología 2','endocrinologia/guia-general-de-endocrinologia-2.pdf','2026-10-29 12:40:28',11),(33,NULL,'Guía general de Endocrinología 3','endocrinologia/guia-general-de-endocrinologia-3.pdf','2026-10-29 12:40:28',11),(34,NULL,'Pauta para pacientes ostomizados (7 páginas)','gastroenterologia/pauta-para-pacientes-ostomizados-7-paginas.pdf','2026-10-29 12:40:28',12),(35,NULL,'Guía general de Gastroenterología 2','gastroenterologia/guia-general-de-gastroenterologia-2.pdf','2026-10-29 12:40:28',12),(36,NULL,'Guía general de Gastroenterología 3','gastroenterologia/guia-general-de-gastroenterologia-3.pdf','2026-10-29 12:40:28',12),(37,NULL,'Guía general de Geriatría 1','geriatria/guia-general-de-geriatria-1.pdf','2026-10-29 12:40:28',13),(38,NULL,'Guía general de Geriatría 2','geriatria/guia-general-de-geriatria-2.pdf','2026-10-29 12:40:28',13),(39,NULL,'Guía general de Geriatría 3','geriatria/guia-general-de-geriatria-3.pdf','2026-10-29 12:40:28',13),(40,NULL,'Guía general de Hematología 1','hematologia/guia-general-de-hematologia-1.pdf','2026-10-29 12:40:28',14),(41,NULL,'Guía general de Hematología 2','hematologia/guia-general-de-hematologia-2.pdf','2026-10-29 12:40:28',14),(42,NULL,'Guía general de Hematología 3','hematologia/guia-general-de-hematologia-3.pdf','2026-10-29 12:40:28',14),(43,NULL,'Guía general de Infectología 1','infectologia/guia-general-de-infectologia-1.pdf','2026-10-29 12:40:28',15),(44,NULL,'Guía general de Infectología 2','infectologia/guia-general-de-infectologia-2.pdf','2026-10-29 12:40:28',15),(45,NULL,'Guía general de Infectología 3','infectologia/guia-general-de-infectologia-3.pdf','2026-10-29 12:40:28',15),(46,NULL,'Guía general de Medicina física, rehabilitación y medicina del deporte 1','medicina-fisica-rehabilitacion-y-medicina-del-deporte/guia-general-de-medicina-fisica-rehabilitacion-y-medicina-del-deporte-1.pdf','2026-10-29 12:40:28',16),(47,NULL,'Guía general de Medicina física, rehabilitación y medicina del deporte 2','medicina-fisica-rehabilitacion-y-medicina-del-deporte/guia-general-de-medicina-fisica-rehabilitacion-y-medicina-del-deporte-2.pdf','2026-10-29 12:40:28',16),(48,NULL,'Guía general de Medicina física, rehabilitación y medicina del deporte 3','medicina-fisica-rehabilitacion-y-medicina-del-deporte/guia-general-de-medicina-fisica-rehabilitacion-y-medicina-del-deporte-3.pdf','2026-10-29 12:40:28',16),(49,NULL,'Guía general de Nefrología 1','nefrologia/guia-general-de-nefrologia-1.pdf','2026-10-29 12:40:28',17),(50,NULL,'Guía general de Nefrología 2','nefrologia/guia-general-de-nefrologia-2.pdf','2026-10-29 12:40:28',17),(51,NULL,'Guía general de Nefrología 3','nefrologia/guia-general-de-nefrologia-3.pdf','2026-10-29 12:40:28',17),(52,NULL,'Guía general de Neurología 1','neurologia/guia-general-de-neurologia-1.pdf','2026-10-29 12:40:28',18),(53,NULL,'Guía general de Neurología 2','neurologia/guia-general-de-neurologia-2.pdf','2026-10-29 12:40:28',18),(54,NULL,'Guía general de Neurología 3','neurologia/guia-general-de-neurologia-3.pdf','2026-10-29 12:40:28',18),(55,NULL,'Guía general de Oncología 1','oncologia/guia-general-de-oncologia-1.pdf','2026-10-29 12:40:28',19),(56,NULL,'Guía general de Oncología 2','oncologia/guia-general-de-oncologia-2.pdf','2026-10-29 12:40:28',19),(57,NULL,'Guía general de Oncología 3','oncologia/guia-general-de-oncologia-3.pdf','2026-10-29 12:40:28',19),(58,NULL,'Guía general de Psiquiatría 1','psiquiatria/guia-general-de-psiquiatria-1.pdf','2026-10-29 12:40:28',20),(59,NULL,'Guía general de Psiquiatría 2','psiquiatria/guia-general-de-psiquiatria-2.pdf','2026-10-29 12:40:28',20),(60,NULL,'Guía general de Psiquiatría 3','psiquiatria/guia-general-de-psiquiatria-3.pdf','2026-10-29 12:40:28',20),(61,NULL,'Guía general de U.E. Autoinmunes sistémicas 1','u-e-autoinmunes-sistemicas/guia-general-de-u-e-autoinmunes-sistemicas-1.pdf','2026-10-29 12:40:28',21),(62,NULL,'Guía general de U.E. Autoinmunes sistémicas 2','u-e-autoinmunes-sistemicas/guia-general-de-u-e-autoinmunes-sistemicas-2.pdf','2026-10-29 12:40:28',21),(63,NULL,'Guía general de U.E. Autoinmunes sistémicas 3','u-e-autoinmunes-sistemicas/guia-general-de-u-e-autoinmunes-sistemicas-3.pdf','2026-10-29 12:40:28',21),(64,NULL,'Guía general de Unidad de tabaquismo 1','unidad-de-tabaquismo/guia-general-de-unidad-de-tabaquismo-1.pdf','2026-10-29 12:40:28',22),(65,NULL,'Guía general de Unidad de tabaquismo 2','unidad-de-tabaquismo/guia-general-de-unidad-de-tabaquismo-2.pdf','2026-10-29 12:40:28',22),(66,NULL,'Guía general de Unidad de tabaquismo 3','unidad-de-tabaquismo/guia-general-de-unidad-de-tabaquismo-3.pdf','2026-10-29 12:40:28',22),(67,NULL,'Guía general de Depto. Clínico de cirugía 1','depto-clinico-de-cirugia/guia-general-de-depto-clinico-de-cirugia-1.pdf','2026-10-29 12:40:28',23),(68,NULL,'Guía general de Depto. Clínico de cirugía 2','depto-clinico-de-cirugia/guia-general-de-depto-clinico-de-cirugia-2.pdf','2026-10-29 12:40:28',23),(69,NULL,'Guía general de Depto. Clínico de cirugía 3','depto-clinico-de-cirugia/guia-general-de-depto-clinico-de-cirugia-3.pdf','2026-10-29 12:40:28',23),(70,NULL,'Guía general de Anestesiología 1','anestesiologia/guia-general-de-anestesiologia-1.pdf','2026-10-29 12:40:28',24),(71,NULL,'Guía general de Anestesiología 2','anestesiologia/guia-general-de-anestesiologia-2.pdf','2026-10-29 12:40:28',24),(72,NULL,'Guía general de Anestesiología 3','anestesiologia/guia-general-de-anestesiologia-3.pdf','2026-10-29 12:40:28',24),(73,NULL,'Guía general de Cirugía plástica y quemados 1','cirugia-plastica-y-quemados/guia-general-de-cirugia-plastica-y-quemados-1.pdf','2026-10-29 12:40:28',25),(74,NULL,'Guía general de Cirugía plástica y quemados 2','cirugia-plastica-y-quemados/guia-general-de-cirugia-plastica-y-quemados-2.pdf','2026-10-29 12:40:28',25),(75,NULL,'Guía general de Cirugía plástica y quemados 3','cirugia-plastica-y-quemados/guia-general-de-cirugia-plastica-y-quemados-3.pdf','2026-10-29 12:40:28',25),(76,NULL,'Guía general de Cirugía vascular periférica 1','cirugia-vascular-periferica/guia-general-de-cirugia-vascular-periferica-1.pdf','2026-10-29 12:40:28',26),(77,NULL,'Guía general de Cirugía vascular periférica 2','cirugia-vascular-periferica/guia-general-de-cirugia-vascular-periferica-2.pdf','2026-10-29 12:40:28',26),(78,NULL,'Guía general de Cirugía vascular periférica 3','cirugia-vascular-periferica/guia-general-de-cirugia-vascular-periferica-3.pdf','2026-10-29 12:40:28',26),(79,NULL,'Indicaciones de interrupción voluntaria del embarazo','ginecotocologica-b/indicaciones-de-interrupcion-voluntaria-del-embarazo.pdf','2026-10-29 12:40:28',27),(80,NULL,'Guía general de Ginecotocológica B 2','ginecotocologica-b/guia-general-de-ginecotocologica-b-2.pdf','2026-10-29 12:40:28',27),(81,NULL,'Guía general de Ginecotocológica B 3','ginecotocologica-b/guia-general-de-ginecotocologica-b-3.pdf','2026-10-29 12:40:28',27),(82,NULL,'Guía general de Neurocirugía 1','neurocirugia/guia-general-de-neurocirugia-1.pdf','2026-10-29 12:40:28',28),(83,NULL,'Guía general de Neurocirugía 2','neurocirugia/guia-general-de-neurocirugia-2.pdf','2026-10-29 12:40:28',28),(84,NULL,'Guía general de Neurocirugía 3','neurocirugia/guia-general-de-neurocirugia-3.pdf','2026-10-29 12:40:28',28),(85,NULL,'Guía general de Odontología 1','odontologia/guia-general-de-odontologia-1.pdf','2026-10-29 12:40:28',29),(86,NULL,'Guía general de Odontología 2','odontologia/guia-general-de-odontologia-2.pdf','2026-10-29 12:40:28',29),(87,NULL,'Guía general de Odontología 3','odontologia/guia-general-de-odontologia-3.pdf','2026-10-29 12:40:28',29),(88,NULL,'Guía general de Oftalmología 1','oftalmologia/guia-general-de-oftalmologia-1.pdf','2026-10-29 12:40:28',30),(89,NULL,'Guía general de Oftalmología 2','oftalmologia/guia-general-de-oftalmologia-2.pdf','2026-10-29 12:40:28',30),(90,NULL,'Guía general de Oftalmología 3','oftalmologia/guia-general-de-oftalmologia-3.pdf','2026-10-29 12:40:28',30),(91,NULL,'Guía general de Otorrinolaringología 1','otorrinolaringologia/guia-general-de-otorrinolaringologia-1.pdf','2026-10-29 12:40:28',31),(92,NULL,'Guía general de Otorrinolaringología 2','otorrinolaringologia/guia-general-de-otorrinolaringologia-2.pdf','2026-10-29 12:40:28',31),(93,NULL,'Guía general de Otorrinolaringología 3','otorrinolaringologia/guia-general-de-otorrinolaringologia-3.pdf','2026-10-29 12:40:28',31),(94,NULL,'Guía general de Quirúrgica A 1','quirurgica-a/guia-general-de-quirurgica-a-1.pdf','2026-10-29 12:40:28',32),(95,NULL,'Guía general de Quirúrgica A 2','quirurgica-a/guia-general-de-quirurgica-a-2.pdf','2026-10-29 12:40:28',32),(96,NULL,'Guía general de Quirúrgica A 3','quirurgica-a/guia-general-de-quirurgica-a-3.pdf','2026-10-29 12:40:28',32),(97,NULL,'Guía general de Quirúrgica B 1','quirurgica-b/guia-general-de-quirurgica-b-1.pdf','2026-10-29 12:40:28',33),(98,NULL,'Guía general de Quirúrgica B 2','quirurgica-b/guia-general-de-quirurgica-b-2.pdf','2026-10-29 12:40:28',33),(99,NULL,'Guía general de Quirúrgica B 3','quirurgica-b/guia-general-de-quirurgica-b-3.pdf','2026-10-29 12:40:28',33),(100,NULL,'Guía general de Quirúrgica F 1','quirurgica-f/guia-general-de-quirurgica-f-1.pdf','2026-10-29 12:40:28',34),(101,NULL,'Guía general de Quirúrgica F 2','quirurgica-f/guia-general-de-quirurgica-f-2.pdf','2026-10-29 12:40:28',34),(102,NULL,'Guía general de Quirúrgica F 3','quirurgica-f/guia-general-de-quirurgica-f-3.pdf','2026-10-29 12:40:28',34),(103,NULL,'Prostatectomía radical (indicaciones e información para el paciente)','urologia/prostatectomia-radical-indicaciones-e-informacion-para-el-paciente.pdf','2026-10-29 12:40:28',35),(104,NULL,'Guía general de Urología 2','urologia/guia-general-de-urologia-2.pdf','2026-10-29 12:40:28',35),(105,NULL,'Guía general de Urología 3','urologia/guia-general-de-urologia-3.pdf','2026-10-29 12:40:28',35),(106,NULL,'Guía general de Traumatología y ortopedia de adultos 1','traumatologia-y-ortopedia-de-adultos/guia-general-de-traumatologia-y-ortopedia-de-adultos-1.pdf','2026-10-29 12:40:28',36),(107,NULL,'Guía general de Traumatología y ortopedia de adultos 2','traumatologia-y-ortopedia-de-adultos/guia-general-de-traumatologia-y-ortopedia-de-adultos-2.pdf','2026-10-29 12:40:28',36),(108,NULL,'Guía general de Traumatología y ortopedia de adultos 3','traumatologia-y-ortopedia-de-adultos/guia-general-de-traumatologia-y-ortopedia-de-adultos-3.pdf','2026-10-29 12:40:28',36),(109,NULL,'Guía general de Radioterapia 1','radioterapia/guia-general-de-radioterapia-1.pdf','2026-10-29 12:40:28',37),(110,NULL,'Guía general de Radioterapia 2','radioterapia/guia-general-de-radioterapia-2.pdf','2026-10-29 12:40:28',37),(111,NULL,'Guía general de Radioterapia 3','radioterapia/guia-general-de-radioterapia-3.pdf','2026-10-29 12:40:28',37),(112,NULL,'Estudios diagnósticos con pertecneciato','medicina-nuclear/estudios-diagnosticos-con-pertecneciato.pdf','2026-10-29 12:40:28',38),(113,NULL,'Información sobre Centellograma de perfusión miocárdica','medicina-nuclear/informacion-sobre-centellograma-de-perfusion-miocardica.pdf','2026-10-29 12:40:28',38),(114,NULL,'Guía general de Medicina Nuclear 3','medicina-nuclear/guia-general-de-medicina-nuclear-3.pdf','2026-10-29 12:40:28',38),(115,NULL,'Guía general de Hemoterapia 1','hemoterapia/guia-general-de-hemoterapia-1.pdf','2026-10-29 12:40:28',39),(116,NULL,'Guía general de Hemoterapia 2','hemoterapia/guia-general-de-hemoterapia-2.pdf','2026-10-29 12:40:28',39),(117,NULL,'Guía general de Hemoterapia 3','hemoterapia/guia-general-de-hemoterapia-3.pdf','2026-10-29 12:40:28',39),(118,NULL,'Preparación para estudios imagenológicos','imagenologia/preparacion-para-estudios-imagenologicos.pdf','2026-10-29 12:40:28',40),(119,NULL,'Guía general de Imagenología 2','imagenologia/guia-general-de-imagenologia-2.pdf','2026-10-29 12:40:28',40),(120,NULL,'Guía general de Imagenología 3','imagenologia/guia-general-de-imagenologia-3.pdf','2026-10-29 12:40:28',40);
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `respuestas`
--

LOCK TABLES `respuestas` WRITE;
/*!40000 ALTER TABLE `respuestas` DISABLE KEYS */;
/*!40000 ALTER TABLE `respuestas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'portal_informativo'
--

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

-- Dump completed on 2026-10-29 13:09:21
