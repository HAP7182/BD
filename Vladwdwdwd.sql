-- MySQL dump 10.13  Distrib 8.0.31, for Win64 (x86_64)
--
-- Host: localhost    Database: mydb
-- ------------------------------------------------------
-- Server version	8.0.31

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
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categories` (
  `section_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `preview_img` varchar(45) NOT NULL,
  PRIMARY KEY (`section_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES (1,'Обувь','1'),(2,'Кроссовки','2');
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `image`
--

DROP TABLE IF EXISTS `image`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `image` (
  `image_id` int NOT NULL AUTO_INCREMENT,
  `href` varchar(45) NOT NULL,
  `alt` varchar(45) NOT NULL,
  PRIMARY KEY (`image_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `image`
--

LOCK TABLES `image` WRITE;
/*!40000 ALTER TABLE `image` DISABLE KEYS */;
INSERT INTO `image` VALUES (1,'ссылка','картинка'),(2,'ссылка','картинка');
/*!40000 ALTER TABLE `image` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `main_categories`
--

DROP TABLE IF EXISTS `main_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `main_categories` (
  `main_categories_id` int NOT NULL AUTO_INCREMENT,
  `categories_section_id` int NOT NULL,
  `product_id` int NOT NULL,
  PRIMARY KEY (`main_categories_id`,`categories_section_id`,`product_id`),
  KEY `fk_main_categories_categories_idx` (`categories_section_id`),
  KEY `fk_main_categories_product1_idx` (`product_id`),
  CONSTRAINT `fk_main_categories_categories` FOREIGN KEY (`categories_section_id`) REFERENCES `categories` (`section_id`),
  CONSTRAINT `fk_main_categories_product1` FOREIGN KEY (`product_id`) REFERENCES `product` (`product_id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `main_categories`
--

LOCK TABLES `main_categories` WRITE;
/*!40000 ALTER TABLE `main_categories` DISABLE KEYS */;
INSERT INTO `main_categories` VALUES (1,1,167),(2,1,168),(3,1,169),(4,1,170),(5,1,171),(6,1,172),(7,1,173),(8,1,174),(9,1,175),(10,1,176),(11,1,177),(12,1,178),(13,1,179);
/*!40000 ALTER TABLE `main_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `main_product_image`
--

DROP TABLE IF EXISTS `main_product_image`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `main_product_image` (
  `main_product_image_id` int NOT NULL AUTO_INCREMENT,
  `product_id` int NOT NULL,
  `image_id` int NOT NULL,
  PRIMARY KEY (`main_product_image_id`,`product_id`,`image_id`),
  KEY `fk_main_product_image_product1_idx` (`product_id`),
  KEY `fk_main_product_image_image1_idx` (`image_id`),
  CONSTRAINT `fk_main_product_image_image1` FOREIGN KEY (`image_id`) REFERENCES `image` (`image_id`),
  CONSTRAINT `fk_main_product_image_product1` FOREIGN KEY (`product_id`) REFERENCES `product` (`product_id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `main_product_image`
--

LOCK TABLES `main_product_image` WRITE;
/*!40000 ALTER TABLE `main_product_image` DISABLE KEYS */;
INSERT INTO `main_product_image` VALUES (1,167,1),(2,168,1),(3,169,1),(4,170,1),(5,171,1),(6,172,1),(7,173,1),(8,174,1),(9,175,1),(10,176,1),(11,177,1),(12,178,1),(13,179,1);
/*!40000 ALTER TABLE `main_product_image` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product` (
  `product_id` int NOT NULL AUTO_INCREMENT,
  `heading` varchar(45) NOT NULL,
  `price` double NOT NULL,
  `status` tinyint NOT NULL,
  `full_price` double NOT NULL,
  `promo_price` float DEFAULT NULL,
  `descripiton` varchar(45) NOT NULL,
  PRIMARY KEY (`product_id`)
) ENGINE=InnoDB AUTO_INCREMENT=180 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES (167,'Кроссовки 1',5000,1,6000,4500,'Описание кроссовок'),(168,'Кроссовки 2',5000,1,6000,4500,'Описание кроссовок'),(169,'Кроссовки 3',5000,1,6000,4500,'Описание кроссовок'),(170,'Кроссовки 4',5000,1,6000,4500,'Описание кроссовок'),(171,'Кроссовки 5',5000,0,6000,4500,'Описание кроссовок'),(172,'Кроссовки 6',5000,0,6000,4500,'Описание кроссовок'),(173,'Кроссовки 7',5000,1,6000,4500,'Описание кроссовок'),(174,'Кроссовки 8',10000,1,11000,9000,'Описание кроссовок'),(175,'Кроссовки 9',10000,1,11000,9000,'Описание кроссовок'),(176,'Кроссовки 10',10000,1,11000,9000,'Описание кроссовок'),(177,'Кроссовки 11',10000,0,11000,9000,'Описание кроссовок'),(178,'Кроссовки 12',10000,1,11000,9000,'Описание кроссовок'),(179,'Кроссовки 13',10000,1,11000,9000,'Описание кроссовок');
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `secondary_product_category`
--

DROP TABLE IF EXISTS `secondary_product_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `secondary_product_category` (
  `secondary_product_category_id` int NOT NULL AUTO_INCREMENT,
  `categories_section_id` int NOT NULL,
  `product_id` int NOT NULL,
  PRIMARY KEY (`secondary_product_category_id`,`categories_section_id`,`product_id`),
  KEY `fk_secondary_product_category_categories1_idx` (`categories_section_id`),
  KEY `fk_secondary_product_category_product1_idx` (`product_id`),
  CONSTRAINT `fk_secondary_product_category_categories1` FOREIGN KEY (`categories_section_id`) REFERENCES `categories` (`section_id`),
  CONSTRAINT `fk_secondary_product_category_product1` FOREIGN KEY (`product_id`) REFERENCES `product` (`product_id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `secondary_product_category`
--

LOCK TABLES `secondary_product_category` WRITE;
/*!40000 ALTER TABLE `secondary_product_category` DISABLE KEYS */;
INSERT INTO `secondary_product_category` VALUES (1,2,167),(2,2,168),(3,2,169),(4,2,170),(5,2,171),(6,2,172),(7,2,173),(8,2,174),(9,2,175),(10,2,176),(11,2,177),(12,2,178),(13,2,179);
/*!40000 ALTER TABLE `secondary_product_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `secondary_product_image`
--

DROP TABLE IF EXISTS `secondary_product_image`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `secondary_product_image` (
  `secondary_product_image_id` int NOT NULL AUTO_INCREMENT,
  `product_id` int NOT NULL,
  `image_id` int NOT NULL,
  PRIMARY KEY (`secondary_product_image_id`,`product_id`,`image_id`),
  KEY `fk_secondary_product_image_product1_idx` (`product_id`),
  KEY `fk_secondary_product_image_image1_idx` (`image_id`),
  CONSTRAINT `fk_secondary_product_image_image` FOREIGN KEY (`image_id`) REFERENCES `image` (`image_id`) ON DELETE CASCADE,
  CONSTRAINT `fk_secondary_product_image_product` FOREIGN KEY (`product_id`) REFERENCES `product` (`product_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=105 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `secondary_product_image`
--

LOCK TABLES `secondary_product_image` WRITE;
/*!40000 ALTER TABLE `secondary_product_image` DISABLE KEYS */;
INSERT INTO `secondary_product_image` VALUES (92,167,2),(93,168,2),(94,169,2),(95,170,2),(96,171,2),(97,172,2),(98,173,2),(99,174,2),(100,175,2),(101,176,2),(102,177,2),(103,178,2),(104,179,2);
/*!40000 ALTER TABLE `secondary_product_image` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-10-21 22:18:44
