-- MySQL dump 10.13  Distrib 8.0.40, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: horizontravels
-- ------------------------------------------------------
-- Server version	8.0.19

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
-- Table structure for table `bookings`
--

DROP TABLE IF EXISTS `bookings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bookings` (
  `booking_id` int NOT NULL AUTO_INCREMENT,
  `userID` int NOT NULL,
  `destination_id` int NOT NULL,
  `total_price` decimal(10,2) NOT NULL,
  `class` enum('Economy','Business') NOT NULL,
  `fromdate` date NOT NULL,
  `todate` date NOT NULL,
  `seat` varchar(45) NOT NULL,
  `booking_date` date NOT NULL,
  PRIMARY KEY (`booking_id`),
  KEY `userID` (`userID`),
  KEY `destination_id` (`destination_id`),
  CONSTRAINT `bookings_ibfk_1` FOREIGN KEY (`userID`) REFERENCES `users` (`UserID`),
  CONSTRAINT `bookings_ibfk_2` FOREIGN KEY (`destination_id`) REFERENCES `destinations` (`destination_id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bookings`
--

LOCK TABLES `bookings` WRITE;
/*!40000 ALTER TABLE `bookings` DISABLE KEYS */;
INSERT INTO `bookings` VALUES (14,2,7,400.00,'Business','2025-04-30','2025-05-07','','2025-04-26'),(18,1,17,200.00,'Business','2025-05-13','2025-05-20','','2025-04-27'),(19,1,10,100.00,'Economy','2025-05-09','2025-05-12','','2025-04-28'),(20,1,3,100.00,'Economy','2025-07-10','2025-07-17','','2025-04-28'),(21,1,20,200.00,'Business','2025-08-15','2025-08-22','','2025-04-28'),(22,1,11,75.00,'Economy','2025-07-24','2025-07-31','','2025-04-28'),(23,1,10,200.00,'Business','2025-05-06','2025-05-13','','2025-04-29'),(24,4,7,100.00,'Economy','2025-05-02','2025-05-09','','2025-04-29'),(25,2,15,200.00,'Economy','2025-05-07','2025-05-14','','2025-04-29'),(26,2,1,200.00,'Business','2025-05-07','2025-05-08','','2025-04-29');
/*!40000 ALTER TABLE `bookings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `destinations`
--

DROP TABLE IF EXISTS `destinations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `destinations` (
  `destination_id` int NOT NULL AUTO_INCREMENT,
  `departure` varchar(100) NOT NULL,
  `arrival` varchar(100) NOT NULL,
  `departure_time` time NOT NULL,
  `arrival_time` time NOT NULL,
  `economy_price` decimal(10,2) NOT NULL,
  `business_price` decimal(10,2) NOT NULL,
  PRIMARY KEY (`destination_id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `destinations`
--

LOCK TABLES `destinations` WRITE;
/*!40000 ALTER TABLE `destinations` DISABLE KEYS */;
INSERT INTO `destinations` VALUES (1,'Newcastle','Bristol','17:45:00','19:00:00',90.00,180.00),(2,'Bristol','Newcastle','09:00:00','10:15:00',90.00,180.00),(3,'Cardiff','Edinburgh','07:00:00','08:30:00',90.00,180.00),(4,'Bristol','Manchester','12:30:00','13:30:00',80.00,160.00),(5,'Manchester','Bristol','13:20:00','14:20:00',80.00,160.00),(6,'Bristol','London','07:40:00','08:20:00',80.00,160.00),(7,'London','Manchester','13:00:00','14:00:00',100.00,200.00),(8,'Manchester','Glasgow','12:20:00','13:30:00',100.00,200.00),(9,'Bristol','Glasgow','08:40:00','09:45:00',110.00,220.00),(10,'Glasgow','Newcastle','14:30:00','15:45:00',100.00,200.00),(11,'Newcastle','Manchester','16:15:00','17:05:00',100.00,200.00),(12,'Manchester','Bristol','18:25:00','19:30:00',80.00,160.00),(13,'Bristol','Manchester','06:20:00','07:20:00',80.00,160.00),(14,'Portsmouth','Dundee','12:00:00','14:00:00',120.00,240.00),(15,'Dundee','Portsmouth','10:00:00','12:00:00',120.00,240.00),(16,'Edinburgh','Cardiff','18:30:00','20:00:00',100.00,200.00),(17,'Southampton','Manchester','12:00:00','13:30:00',100.00,200.00),(18,'Manchester','Southampton','19:00:00','20:30:00',90.00,180.00),(19,'Birmingham','Newcastle','17:00:00','17:45:00',100.00,200.00),(20,'Newcastle','Birmingham','07:00:00','07:45:00',100.00,200.00),(21,'Aberdeen','Portsmouth','08:00:00','09:30:00',100.00,200.00);
/*!40000 ALTER TABLE `destinations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `UserID` int NOT NULL AUTO_INCREMENT,
  `Password` varchar(255) NOT NULL,
  `Email` varchar(255) NOT NULL,
  `UserRole` enum('standard','admin') DEFAULT 'standard',
  PRIMARY KEY (`UserID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'scrypt:32768:8:1$bKpeybq3i2cTCwXF$390244b1ddfcc1306a9cc714ca392db3b088c0e15bbc7210e7851804b8feb00cb441ea9ec4006ac6de4e36099652fea3d9ee432f01c52fbfe77fabe105768036','imaan.mohammed@hotlook.com','standard'),(2,'scrypt:32768:8:1$u1FI0BVLNusNLedQ$15895b3d2dae3baa8212e254477132ddc0f757da79971f34ef11417b88d65d743f70bac6d2899023c9a2160fea24ff6c5aa042662c33add5fd3216b2d0a2b519','admin.admin@admin.com','admin'),(4,'scrypt:32768:8:1$AVMbA5C7D3hfD3em$f974da37f83a92dc4ba255f071ff9c152dfe45737d27ac3f0e7ec10a10bcfe9b00e7d5562730d32a59a3d9881c2393a65547939c61b8877e1266f1759693e0dc','user@standarduser.com','standard');
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

-- Dump completed on 2025-04-29 18:10:04
