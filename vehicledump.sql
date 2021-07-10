-- MariaDB dump 10.17  Distrib 10.5.5-MariaDB, for Linux (x86_64)
--
-- Host: 127.0.0.1    Database: TESTING
-- ------------------------------------------------------
-- Server version	8.0.21

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
-- Table structure for table `BIKE`
--

DROP TABLE IF EXISTS `BIKE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `BIKE` (
  `Vehicle_id` varchar(255) NOT NULL,
  PRIMARY KEY (`Vehicle_id`),
  CONSTRAINT `Bike_ibfk_1` FOREIGN KEY (`Vehicle_id`) REFERENCES `VEHICLE` (`Vehicle_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `BIKE`
--

LOCK TABLES `BIKE` WRITE;
/*!40000 ALTER TABLE `BIKE` DISABLE KEYS */;
INSERT INTO `BIKE` VALUES ('EF46E2304');
/*!40000 ALTER TABLE `BIKE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CAR`
--

DROP TABLE IF EXISTS `CAR`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CAR` (
  `Vehicle_id` varchar(255) NOT NULL,
  `Car_Type` varchar(255) NOT NULL,
  `Fuel` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`Vehicle_id`),
  UNIQUE KEY `Vehicle_id` (`Vehicle_id`),
  CONSTRAINT `CAR_ibfk_1` FOREIGN KEY (`Vehicle_id`) REFERENCES `VEHICLE` (`Vehicle_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CAR`
--

LOCK TABLES `CAR` WRITE;
/*!40000 ALTER TABLE `CAR` DISABLE KEYS */;
INSERT INTO `CAR` VALUES ('BT12J0527','sedan','petrol'),('CN38T9419','sedan','diesel'),('HO99U2208','sedan','diesel'),('IR92T9816','sedan','petrol'),('JB96E9889','sedan','petrol'),('JF00L9809','hatchback','petrol'),('LM09E4920','hatchback','petrol'),('PP25A2128','hatchback','diesel'),('YM02F4753','SUV','petrol');
/*!40000 ALTER TABLE `CAR` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CLEANER`
--

DROP TABLE IF EXISTS `CLEANER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CLEANER` (
  `Agency_id` int NOT NULL,
  `Cleaner_id` int NOT NULL,
  `Name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`Agency_id`,`Cleaner_id`),
  UNIQUE KEY `Cleaner_id` (`Cleaner_id`),
  CONSTRAINT `CLEANER_ibfk_1` FOREIGN KEY (`Agency_id`) REFERENCES `CLEANING_AGENCY` (`Registration_number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CLEANER`
--

LOCK TABLES `CLEANER` WRITE;
/*!40000 ALTER TABLE `CLEANER` DISABLE KEYS */;
INSERT INTO `CLEANER` VALUES (12337,243,'Ram mohan'),(12337,247,'Riya gupta'),(18159,123,'Eddy Frank'),(18159,125,'Emily williams'),(18159,213,'John'),(113834,112,'sneha arora'),(113834,132,'riya chakraborty'),(113834,212,'Tathagato roy'),(171602,221,'Siya roy'),(171602,223,'Elsa paul');
/*!40000 ALTER TABLE `CLEANER` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CLEANING_AGENCY`
--

DROP TABLE IF EXISTS `CLEANING_AGENCY`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CLEANING_AGENCY` (
  `Registration_number` int NOT NULL,
  `Name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`Registration_number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CLEANING_AGENCY`
--

LOCK TABLES `CLEANING_AGENCY` WRITE;
/*!40000 ALTER TABLE `CLEANING_AGENCY` DISABLE KEYS */;
INSERT INTO `CLEANING_AGENCY` VALUES (12337,'Enim Etiam Ltd'),(18159,'Maecenas LLC'),(113834,'Amet PC'),(171602,'Congue A Incorporated');
/*!40000 ALTER TABLE `CLEANING_AGENCY` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CLEANING_AGENCY_CONTACT`
--

DROP TABLE IF EXISTS `CLEANING_AGENCY_CONTACT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CLEANING_AGENCY_CONTACT` (
  `Contact_number` bigint NOT NULL,
  `Registration_number` int NOT NULL,
  PRIMARY KEY (`Contact_number`,`Registration_number`),
  KEY `Registration_number` (`Registration_number`),
  CONSTRAINT `CLEANING_AGENCY_CONTACT_ibfk_1` FOREIGN KEY (`Registration_number`) REFERENCES `CLEANING_AGENCY` (`Registration_number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CLEANING_AGENCY_CONTACT`
--

LOCK TABLES `CLEANING_AGENCY_CONTACT` WRITE;
/*!40000 ALTER TABLE `CLEANING_AGENCY_CONTACT` DISABLE KEYS */;
INSERT INTO `CLEANING_AGENCY_CONTACT` VALUES (8734112233,12337),(9920231344,12337),(9347869898,18159),(9932353566,18159),(9778891219,113834),(9922131356,113834);
/*!40000 ALTER TABLE `CLEANING_AGENCY_CONTACT` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CONTRACTS`
--

DROP TABLE IF EXISTS `CONTRACTS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CONTRACTS` (
  `Manager_id` int NOT NULL,
  `Cleaning_Agency_id` int NOT NULL,
  PRIMARY KEY (`Manager_id`,`Cleaning_Agency_id`),
  KEY `Cleaning_Agency_id` (`Cleaning_Agency_id`),
  CONSTRAINT `CONTRACTS_ibfk_1` FOREIGN KEY (`Manager_id`) REFERENCES `MANAGER` (`Manager_id`) ON DELETE CASCADE,
  CONSTRAINT `CONTRACTS_ibfk_2` FOREIGN KEY (`Cleaning_Agency_id`) REFERENCES `CLEANING_AGENCY` (`Registration_number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CONTRACTS`
--

LOCK TABLES `CONTRACTS` WRITE;
/*!40000 ALTER TABLE `CONTRACTS` DISABLE KEYS */;
INSERT INTO `CONTRACTS` VALUES (527,12337),(527,18159);
/*!40000 ALTER TABLE `CONTRACTS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CUSTOMER`
--

DROP TABLE IF EXISTS `CUSTOMER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CUSTOMER` (
  `Aadhar_number` bigint NOT NULL,
  `First_name` varchar(255) NOT NULL,
  `Last_name` varchar(255) DEFAULT NULL,
  `Email` varchar(255) DEFAULT NULL,
  `Address` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`Aadhar_number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CUSTOMER`
--

LOCK TABLES `CUSTOMER` WRITE;
/*!40000 ALTER TABLE `CUSTOMER` DISABLE KEYS */;
INSERT INTO `CUSTOMER` VALUES (121275323599,'Burke','Day','ante.ipsum@sagittisfelisDonec.ca','Ap #423-1959 Molestie Street'),(126207266699,'Silas','Case','Fusce.aliquam@interdum.org','P.O. Box 120, 7463 Massa Ave'),(201251929199,'Curran','Joyce','Phasellus@mattis.org','P.O. Box 722, 5469 Nam Road'),(222369836799,'Daphne','Lester','metus@tinciduntvehicula.org','P.O. Box 440, 6446 Quis, Street'),(223956744199,'Lenore','Pearson','Sed.nulla.ante@dolor.co.uk','Ap #853-5888 Est. St.'),(525375480699,'Kasper','Campbell','Maecenas.iaculis.aliquet@nisinibh.ca','2137 Phasellus St.'),(621827692199,'Stone','Garner','est.vitae@Quisqueimperdieterat.com','P.O. Box 331, 9268 Fusce St.'),(624604992499,'Deacon','Beasley','Class.aptent.taciti@Quisque.com','P.O. Box 691, 8449 Donec Road'),(727902571299,'Maisie','Langley','at@Fuscefermentum.ca','496-784 Neque. Av.'),(923200969299,'Raya','Giles','hendrerit.a@etmagnis.edu','Ap #908-2237 Placerat, Rd.');
/*!40000 ALTER TABLE `CUSTOMER` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CUSTOMER_CONTACT`
--

DROP TABLE IF EXISTS `CUSTOMER_CONTACT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CUSTOMER_CONTACT` (
  `Contact_number` bigint NOT NULL,
  `Aadhar_number` bigint NOT NULL,
  PRIMARY KEY (`Contact_number`,`Aadhar_number`),
  KEY `Aadhar_number` (`Aadhar_number`),
  CONSTRAINT `CUSTOMER_CONTACT_ibfk_1` FOREIGN KEY (`Aadhar_number`) REFERENCES `CUSTOMER` (`Aadhar_number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CUSTOMER_CONTACT`
--

LOCK TABLES `CUSTOMER_CONTACT` WRITE;
/*!40000 ALTER TABLE `CUSTOMER_CONTACT` DISABLE KEYS */;
INSERT INTO `CUSTOMER_CONTACT` VALUES (8899112233,121275323599),(8888899999,126207266699),(9810101044,201251929199),(4343569898,223956744199),(2222444456,624604992499),(9922445566,727902571299);
/*!40000 ALTER TABLE `CUSTOMER_CONTACT` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `EMPLOYEE`
--

DROP TABLE IF EXISTS `EMPLOYEE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `EMPLOYEE` (
  `Employee_id` int NOT NULL,
  `First_name` varchar(255) NOT NULL,
  `Last_name` varchar(255) DEFAULT NULL,
  `Salary` int DEFAULT NULL,
  `Pan_number` varchar(255) NOT NULL,
  `Hours` int DEFAULT NULL COMMENT 'Number of working hours',
  PRIMARY KEY (`Employee_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `EMPLOYEE`
--

LOCK TABLES `EMPLOYEE` WRITE;
/*!40000 ALTER TABLE `EMPLOYEE` DISABLE KEYS */;
INSERT INTO `EMPLOYEE` VALUES (349,'Preston','Zimmerman',23318,'QLG58SLP7WW',5),(437,'Jennifer','Payne',15876,'RGK24HZH6HJ',7),(439,'Abel','Banks',44299,'SUT46KXR4CA',10),(460,'Danielle','Rivers',38696,'VCN62BMG5TS',8),(494,'Alden','Lyons',24880,'KYQ95PQS6NX',7),(527,'Alden','Zamora',14946,'HAV73PHH0YF',10),(666,'Felix','Reed',33859,'CAE80RSX1LZ',4),(692,'Aquila','Mcgowan',34886,'HQZ99DUK9AW',7),(835,'Judah','Dixon',37688,'ODY52OCC6BQ',10),(966,'Caesar','Foreman',18052,'DBC96QXQ1YK',8);
/*!40000 ALTER TABLE `EMPLOYEE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `EMPLOYEE_HAS_VOUCHER`
--

DROP TABLE IF EXISTS `EMPLOYEE_HAS_VOUCHER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `EMPLOYEE_HAS_VOUCHER` (
  `Employee_id` int NOT NULL,
  `Voucher_number` int NOT NULL,
  PRIMARY KEY (`Employee_id`,`Voucher_number`),
  KEY `Voucher_number` (`Voucher_number`),
  CONSTRAINT `EMPLOYEE_HAS_VOUCHER_ibfk_1` FOREIGN KEY (`Employee_id`) REFERENCES `EMPLOYEE` (`Employee_id`) ON DELETE CASCADE,
  CONSTRAINT `EMPLOYEE_HAS_VOUCHER_ibfk_2` FOREIGN KEY (`Voucher_number`) REFERENCES `VOUCHER` (`Voucher_number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `EMPLOYEE_HAS_VOUCHER`
--

LOCK TABLES `EMPLOYEE_HAS_VOUCHER` WRITE;
/*!40000 ALTER TABLE `EMPLOYEE_HAS_VOUCHER` DISABLE KEYS */;
INSERT INTO `EMPLOYEE_HAS_VOUCHER` VALUES (460,91301),(439,91971),(460,91971),(835,91971),(437,92050),(439,92050),(439,92310),(527,92310);
/*!40000 ALTER TABLE `EMPLOYEE_HAS_VOUCHER` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `FACTORY`
--

DROP TABLE IF EXISTS `FACTORY`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `FACTORY` (
  `Registration_number` bigint NOT NULL,
  `Building_number` int DEFAULT NULL,
  `Locality` varchar(255) DEFAULT NULL,
  `City` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`Registration_number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FACTORY`
--

LOCK TABLES `FACTORY` WRITE;
/*!40000 ALTER TABLE `FACTORY` DISABLE KEYS */;
INSERT INTO `FACTORY` VALUES (11881287799,1752,'Sicilia','Nicolosi'),(13290890399,579,'Leinster','Dublin'),(15267374799,419,'Wie','Vienna'),(25384975599,1855,'Alsace','Mulhouse'),(44612526399,401,'Khyber Pakhtoonkhwa','Karak'),(54543807999,972,'Gye','Seoul'),(78394283599,277,'RM','San Miguel'),(93582876899,1822,'Victoria','Warrnambool'),(94762035499,343,'AMU','Zeya'),(96214035299,456,'SS','Hastings');
/*!40000 ALTER TABLE `FACTORY` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `FACTORY_CONTACT`
--

DROP TABLE IF EXISTS `FACTORY_CONTACT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `FACTORY_CONTACT` (
  `Contact_number` bigint NOT NULL,
  `Registration_number` bigint NOT NULL,
  PRIMARY KEY (`Contact_number`,`Registration_number`),
  KEY `Registration_number` (`Registration_number`),
  CONSTRAINT `FACTORY_CONTACT_ibfk_1` FOREIGN KEY (`Registration_number`) REFERENCES `FACTORY` (`Registration_number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FACTORY_CONTACT`
--

LOCK TABLES `FACTORY_CONTACT` WRITE;
/*!40000 ALTER TABLE `FACTORY_CONTACT` DISABLE KEYS */;
INSERT INTO `FACTORY_CONTACT` VALUES (8779112233,25384975599),(9932445566,25384975599),(9343569898,78394283599),(9922444456,78394283599),(9920201044,93582876899),(9778899999,96214035299);
/*!40000 ALTER TABLE `FACTORY_CONTACT` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `MANAGER`
--

DROP TABLE IF EXISTS `MANAGER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `MANAGER` (
  `Manager_id` int NOT NULL,
  `start_date` date DEFAULT NULL COMMENT 'Date on which he was promoted',
  PRIMARY KEY (`Manager_id`),
  CONSTRAINT `MANAGER_ibfk_1` FOREIGN KEY (`Manager_id`) REFERENCES `EMPLOYEE` (`Employee_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `MANAGER`
--

LOCK TABLES `MANAGER` WRITE;
/*!40000 ALTER TABLE `MANAGER` DISABLE KEYS */;
INSERT INTO `MANAGER` VALUES (527,'2018-06-14');
/*!40000 ALTER TABLE `MANAGER` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PURCHASES_VEHICLE_FROM`
--

DROP TABLE IF EXISTS `PURCHASES_VEHICLE_FROM`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PURCHASES_VEHICLE_FROM` (
  `Factory_id` bigint NOT NULL,
  `Manager_id` int DEFAULT NULL,
  PRIMARY KEY (`Factory_id`),
  KEY `Manager_id` (`Manager_id`),
  CONSTRAINT `PURCHASES_VEHICLE_FROM_ibfk_1` FOREIGN KEY (`Factory_id`) REFERENCES `FACTORY` (`Registration_number`),
  CONSTRAINT `PURCHASES_VEHICLE_FROM_ibfk_2` FOREIGN KEY (`Manager_id`) REFERENCES `MANAGER` (`Manager_id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PURCHASES_VEHICLE_FROM`
--

LOCK TABLES `PURCHASES_VEHICLE_FROM` WRITE;
/*!40000 ALTER TABLE `PURCHASES_VEHICLE_FROM` DISABLE KEYS */;
INSERT INTO `PURCHASES_VEHICLE_FROM` VALUES (11881287799,527),(25384975599,527),(44612526399,527),(78394283599,527),(96214035299,527);
/*!40000 ALTER TABLE `PURCHASES_VEHICLE_FROM` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SALE`
--

DROP TABLE IF EXISTS `SALE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SALE` (
  `Sale_id` int NOT NULL AUTO_INCREMENT,
  `Vehicle_id` varchar(255) DEFAULT NULL,
  `Customer_Aadhar_no` bigint NOT NULL,
  `Service_Center_id` int DEFAULT NULL,
  `SalesPerson_id` int DEFAULT NULL,
  `Sale_price` int NOT NULL,
  `Profit` int DEFAULT NULL,
  `Date` datetime DEFAULT NULL,
  `Payment_type` varchar(255) NOT NULL,
  PRIMARY KEY (`Sale_id`),
  UNIQUE KEY `Customer_Aadhar_no` (`Customer_Aadhar_no`),
  UNIQUE KEY `Vehicle_id` (`Vehicle_id`),
  KEY `Service_Center_id` (`Service_Center_id`),
  KEY `SalesPerson_id` (`SalesPerson_id`),
  CONSTRAINT `SALE_ibfk_1` FOREIGN KEY (`Vehicle_id`) REFERENCES `VEHICLE` (`Vehicle_id`),
  CONSTRAINT `SALE_ibfk_2` FOREIGN KEY (`Customer_Aadhar_no`) REFERENCES `CUSTOMER` (`Aadhar_number`),
  CONSTRAINT `SALE_ibfk_3` FOREIGN KEY (`Service_Center_id`) REFERENCES `SERVICE_CENTER` (`Center_id`),
  CONSTRAINT `SALE_ibfk_4` FOREIGN KEY (`SalesPerson_id`) REFERENCES `SALESPERSON` (`SalesPerson_id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SALE`
--

LOCK TABLES `SALE` WRITE;
/*!40000 ALTER TABLE `SALE` DISABLE KEYS */;
INSERT INTO `SALE` VALUES (1,'BT12J0527',121275323599,368,437,800000,45000,'2020-11-06 05:52:49','CARD');
/*!40000 ALTER TABLE `SALE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SALESPERSON`
--

DROP TABLE IF EXISTS `SALESPERSON`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SALESPERSON` (
  `SalesPerson_id` int NOT NULL,
  `Reporter_id` int DEFAULT NULL,
  PRIMARY KEY (`SalesPerson_id`),
  KEY `Reporter_id` (`Reporter_id`),
  CONSTRAINT `SALESPERSON_ibfk_1` FOREIGN KEY (`SalesPerson_id`) REFERENCES `EMPLOYEE` (`Employee_id`)  ON DELETE CASCADE,
  CONSTRAINT `SALESPERSON_ibfk_2` FOREIGN KEY (`Reporter_id`) REFERENCES `SALESPERSON` (`SalesPerson_id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SALESPERSON`
--

LOCK TABLES `SALESPERSON` WRITE;
/*!40000 ALTER TABLE `SALESPERSON` DISABLE KEYS */;
INSERT INTO `SALESPERSON` VALUES (437,NULL),(966,NULL),(835,437),(439,460),(349,494),(666,692),(460,835),(494,966),(692,966);
/*!40000 ALTER TABLE `SALESPERSON` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SERVICE_CENTER`
--

DROP TABLE IF EXISTS `SERVICE_CENTER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SERVICE_CENTER` (
  `Center_id` int NOT NULL,
  `Name` varchar(255) DEFAULT NULL,
  `Address` varchar(255) NOT NULL,
  PRIMARY KEY (`Center_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SERVICE_CENTER`
--

LOCK TABLES `SERVICE_CENTER` WRITE;
/*!40000 ALTER TABLE `SERVICE_CENTER` DISABLE KEYS */;
INSERT INTO `SERVICE_CENTER` VALUES (368,'Sit Amet Company','4027 At Street'),(462,'Nulla Corporation','Ap #615-9014 Vel Rd.'),(792,'Ornare Inc.','P.O. Box 350, 665 Vivamus Rd.'),(1589,'Sapien Cursus Industries','6300 In Avenue'),(2347,'Pede Blandit Limited','1400 Arcu. Avenue'),(3294,'Cum Sociis Natoque LLP','466-458 Magnis Avenue'),(6717,'Pellentesque Sed Dictum Associates','Ap #190-8851 Aliquet Ave'),(11837,'Nunc Sollicitudin Commodo Associates','930-8830 Sed St.'),(12570,'Tristique Industries','Ap #400-6291 A St.'),(19648,'Nunc Mauris LLC','P.O. Box 672, 3675 Elementum, Ave');
/*!40000 ALTER TABLE `SERVICE_CENTER` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SUPPLIES`
--

DROP TABLE IF EXISTS `SUPPLIES`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SUPPLIES` (
  `Vehicle_id` varchar(255) NOT NULL,
  `Factory_id` bigint DEFAULT NULL,
  `Date` datetime DEFAULT NULL,
  `Price` int DEFAULT NULL,
  PRIMARY KEY (`Vehicle_id`),
  KEY `Factory_id` (`Factory_id`),
  CONSTRAINT `SUPPLIES_ibfk_1` FOREIGN KEY (`Vehicle_id`) REFERENCES `VEHICLE` (`Vehicle_id`),
  CONSTRAINT `SUPPLIES_ibfk_2` FOREIGN KEY (`Factory_id`) REFERENCES `FACTORY` (`Registration_number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SUPPLIES`
--

LOCK TABLES `SUPPLIES` WRITE;
/*!40000 ALTER TABLE `SUPPLIES` DISABLE KEYS */;
INSERT INTO `SUPPLIES` VALUES ('BT12J0527',96214035299,'2019-02-21 01:57:29',755000),('CN38T9419',25384975599,'2020-06-11 02:12:25',765000),('EF46E2304',11881287799,'2019-11-21 04:27:20',175000),('HO99U2208',78394283599,'2020-02-26 04:58:38',200000),('IR92T9816',78394283599,'2020-04-13 03:07:20',422000),('JB96E9889',96214035299,'2020-10-05 04:12:29',823400),('JF00L9809',25384975599,'2020-02-23 05:47:21',450000),('LM09E4920',25384975599,'2020-02-23 01:07:20',320056),('PP25A2128',44612526399,'2020-03-07 01:09:20',450000),('YM02F4753',44612526399,'2020-05-02 03:27:30',350000);
/*!40000 ALTER TABLE `SUPPLIES` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `VEHICLE`
--

DROP TABLE IF EXISTS `VEHICLE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `VEHICLE` (
  `Vehicle_id` varchar(255) NOT NULL,
  `Model_name` varchar(255) NOT NULL,
  `Passenger_capacity` int DEFAULT NULL,
  PRIMARY KEY (`Vehicle_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `VEHICLE`
--

LOCK TABLES `VEHICLE` WRITE;
/*!40000 ALTER TABLE `VEHICLE` DISABLE KEYS */;
INSERT INTO `VEHICLE` VALUES ('BT12J0527','Swift Dzire',4),('CN38T9419','Hyundai Verna',5),('EF46E2304','Royal Enfield Classic 350',2),('HO99U2208','Honda City',4),('IR92T9816','Swift Dzire',4),('JB96E9889','Honda City',4),('JF00L9809','Hyundai Creta',4),('LM09E4920','i20',4),('PP25A2128','Hyundai Creta',4),('YM02F4753','Ford Ecosport',6);
/*!40000 ALTER TABLE `VEHICLE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `VOUCHER`
--

DROP TABLE IF EXISTS `VOUCHER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `VOUCHER` (
  `Voucher_number` int NOT NULL,
  `Type` varchar(255) DEFAULT NULL,
  `Valid_date` datetime DEFAULT NULL,
  PRIMARY KEY (`Voucher_number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `VOUCHER`
--

LOCK TABLES `VOUCHER` WRITE;
/*!40000 ALTER TABLE `VOUCHER` DISABLE KEYS */;
INSERT INTO `VOUCHER` VALUES (90170,'BigBazar','2020-11-06 05:52:49'),(91301,'Mc Donalds','2020-10-07 11:48:07'),(91971,'Dominos','2020-10-23 01:07:20'),(92050,'Dominos','2021-06-19 04:58:38'),(92310,'Dominos','2021-05-17 17:08:38'),(96620,'Burger King','2021-01-23 12:39:22');
/*!40000 ALTER TABLE `VOUCHER` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-10-08 20:55:09
