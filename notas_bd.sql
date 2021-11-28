CREATE DATABASE  IF NOT EXISTS `notas_tp` /*!40100 DEFAULT CHARACTER SET utf8 */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `notas_tp`;
-- MySQL dump 10.13  Distrib 8.0.26, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: notas_tp
-- ------------------------------------------------------
-- Server version	8.0.26

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `categorys`
--

DROP TABLE IF EXISTS `categorys`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categorys` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categorys`
--

LOCK TABLES `categorys` WRITE;
/*!40000 ALTER TABLE `categorys` DISABLE KEYS */;
INSERT INTO `categorys` VALUES (1,'musica'),(2,'hogar'),(3,'futbol'),(4,'computacion'),(5,'muebles'),(6,'danza'),(7,'zapatillas'),(8,'jardin'),(9,'viajes'),(10,'camping');
/*!40000 ALTER TABLE `categorys` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notes`
--

DROP TABLE IF EXISTS `notes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `notes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modifed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `description` varchar(255) NOT NULL,
  `delete` tinyint(1) NOT NULL DEFAULT '0',
  `users_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_Notes_Users_idx` (`users_id`),
  CONSTRAINT `fk_Notes_Users` FOREIGN KEY (`users_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notes`
--

LOCK TABLES `notes` WRITE;
/*!40000 ALTER TABLE `notes` DISABLE KEYS */;
INSERT INTO `notes` VALUES (1,'primera nota','2021-09-03 02:56:19','2021-09-03 02:56:19','descripcion de la primer nota',0,1),(2,'segunda nota','2021-09-03 02:56:19','2021-09-03 02:56:19','descripcion de la segunda nota',0,2),(3,'tercera nota','2021-09-03 02:56:19','2021-09-03 02:56:19','descripcion de la tercera nota',0,3),(4,'cuarta nota','2021-09-03 02:56:19','2021-09-03 02:56:19','descripcion de la cuarta nota',0,4),(5,'quinta nota','2021-09-03 02:56:19','2021-09-03 02:56:19','descripcion de la quinta nota',0,2),(6,'sexta nota','2021-09-03 02:56:19','2021-09-03 02:56:19','descripcion de la sexya nota',0,6),(7,'septima nota','2021-09-03 02:56:19','2021-09-03 02:56:19','descripcion de la septima nota',0,7),(8,'octava nota','2021-09-03 02:56:19','2021-09-03 02:56:19','descripcion de la octava nota',0,8),(9,'novena nota','2021-09-03 02:56:19','2021-09-03 02:56:19','descripcion de la novena nota',0,9),(10,'decima nota','2021-09-03 02:56:19','2021-09-03 02:56:19','descripcion de la decima nota',0,1),(11,'undecima nota','2021-09-03 02:56:19','2021-09-03 02:56:19','descripcion de la undecima nota',0,10);
/*!40000 ALTER TABLE `notes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notes_category`
--

DROP TABLE IF EXISTS `notes_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `notes_category` (
  `id` int NOT NULL AUTO_INCREMENT,
  `notes_id` int NOT NULL,
  `categorys_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_notes_category_categorys_idx` (`categorys_id`),
  KEY `fk_notes_category_notes_idx` (`notes_id`),
  CONSTRAINT `fk_notes_category_categorys` FOREIGN KEY (`categorys_id`) REFERENCES `categorys` (`id`),
  CONSTRAINT `fk_notes_category_notes` FOREIGN KEY (`notes_id`) REFERENCES `notes` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notes_category`
--

LOCK TABLES `notes_category` WRITE;
/*!40000 ALTER TABLE `notes_category` DISABLE KEYS */;
INSERT INTO `notes_category` VALUES (1,1,1),(2,1,2),(3,2,3),(4,2,4),(5,3,5),(6,4,6),(7,4,7),(8,5,8),(9,6,9),(10,7,10),(11,8,10),(12,8,5),(13,8,2),(14,9,5),(15,9,5),(16,10,7);
/*!40000 ALTER TABLE `notes_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'juan','juan@gmail.com'),(2,'pedro','pedro@gmail.com'),(3,'diego','diego@gmail.com'),(4,'eric','ericMena@gmail.com'),(5,'robert','roberLean@gmail.com'),(6,'ezequiel','eze@gmail.com'),(7,'gonzalo','gonza@gmail.com'),(8,'emanuel','emanuel@gmail.com'),(9,'michelle','michelle@gmail.com'),(10,'nico','nico@gmail.com');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-09-03  0:09:35
