-- MySQL dump 10.13  Distrib 5.5.18, for osx10.6 (i386)
--
-- Host: us-cdbr-east-02.cleardb.com    Database: heroku_65dfe35aa936704
-- ------------------------------------------------------
-- Server version	5.5.24-log

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
-- Table structure for table `activity_streams`
--

DROP TABLE IF EXISTS `activity_streams`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `activity_streams` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `agency_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `care_recipient_id` int(11) DEFAULT NULL,
  `stream_type` varchar(255) DEFAULT NULL,
  `label` varchar(255) DEFAULT NULL,
  `reference_id` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1601 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `activity_streams`
--

LOCK TABLES `activity_streams` WRITE;
/*!40000 ALTER TABLE `activity_streams` DISABLE KEYS */;
INSERT INTO `activity_streams` VALUES (1391,1,21,131,'check_in','Matt Bowersox checked in with Mark Hopkins',1291,'2013-02-06 20:03:21','2013-02-06 20:03:21'),(1401,11,11,11,'check_in','Tim Suski checked in with Jeff Sternberg',1301,'2013-02-06 20:04:50','2013-02-06 20:04:50'),(1411,1,1,111,'check_in','Noah Lively checked in with Frankenstein Woopthereitis',1311,'2013-02-06 21:57:51','2013-02-06 21:57:51'),(1421,1,1,111,'check_in','Noah Lively checked in with Frankenstein Woopthereitis',1321,'2013-02-06 21:58:09','2013-02-06 21:58:09'),(1431,1,1,111,'check_in','Noah Lively checked in with Frankenstein Woopthereitis',1331,'2013-02-06 22:01:04','2013-02-06 22:01:04'),(1441,1,1,111,'check_out','Noah Lively checked out with Frankenstein Woopthereitis',1331,'2013-02-06 22:01:39','2013-02-06 22:01:39'),(1451,1,1,111,'check_in','Noah Lively checked in with Frankenstein Woopthereitis',1341,'2013-02-06 22:01:53','2013-02-06 22:01:53'),(1461,1,1,111,'data','Noah Lively added data for Frankenstein Woopthereitis',1341,'2013-02-06 22:02:00','2013-02-06 22:02:00'),(1471,11,11,91,'check_in','Tim Suski checked in with Alissa Godwin',1351,'2013-02-06 22:14:55','2013-02-06 22:14:55'),(1481,11,11,91,'data','Tim Suski added data for Alissa Godwin',1351,'2013-02-06 22:16:26','2013-02-06 22:16:26'),(1491,11,11,91,'data','Tim Suski added data for Alissa Godwin',1351,'2013-02-06 22:28:00','2013-02-06 22:28:00'),(1501,11,11,91,'photo','Tim Suski added a photo for Alissa Godwin',481,'2013-02-06 22:28:54','2013-02-06 22:28:54'),(1511,11,11,91,'check_out','Tim Suski checked out with Alissa Godwin',1351,'2013-02-06 22:30:55','2013-02-06 22:30:55'),(1521,11,11,91,'check_in','Tim Suski checked in with Alissa Godwin',1361,'2013-02-07 01:05:04','2013-02-07 01:05:04'),(1531,11,11,91,'photo','Tim Suski added a photo for Alissa Godwin',491,'2013-02-07 01:08:40','2013-02-07 01:08:40'),(1541,11,11,91,'data','Tim Suski added data for Alissa Godwin',1361,'2013-02-07 01:15:01','2013-02-07 01:15:01'),(1551,11,11,91,'data','Tim Suski added data for Alissa Godwin',1361,'2013-02-07 01:15:07','2013-02-07 01:15:07'),(1561,11,11,91,'check_out','Tim Suski checked out with Alissa Godwin',1361,'2013-02-07 01:15:13','2013-02-07 01:15:13'),(1571,1,21,81,'check_in','Matt Bowersox checked in with Jason Blue Watch',1371,'2013-02-07 02:25:05','2013-02-07 02:25:05'),(1581,1,21,81,'check_out','Matt Bowersox checked out with Jason Blue Watch',1371,'2013-02-07 02:42:03','2013-02-07 02:42:03'),(1591,1,21,21,'check_in','Matt Bowersox checked in with Kathy Johnson',1381,'2013-02-07 18:20:35','2013-02-07 18:20:35');
/*!40000 ALTER TABLE `activity_streams` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `agencies`
--

DROP TABLE IF EXISTS `agencies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `agencies` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `location_id` int(11) DEFAULT NULL,
  `administrative_contact` varchar(255) DEFAULT NULL,
  `website` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `bio` text,
  `phone` varchar(255) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `subscription_tier_id` int(11) DEFAULT NULL,
  `next_billing_date` date DEFAULT NULL,
  `monthly_price_override` decimal(11,2) DEFAULT NULL,
  `logo_file_name` varchar(255) DEFAULT NULL,
  `logo_content_type` varchar(255) DEFAULT NULL,
  `logo_file_size` int(11) DEFAULT NULL,
  `logo_updated_at` datetime DEFAULT NULL,
  `billing_location_id` int(11) DEFAULT NULL,
  `overtime_multiplier` decimal(11,2) DEFAULT '1.50',
  `account_number` int(11) DEFAULT NULL,
  `braintree_customer_id` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `agencies`
--

LOCK TABLES `agencies` WRITE;
/*!40000 ALTER TABLE `agencies` DISABLE KEYS */;
INSERT INTO `agencies` VALUES (1,'Boomr Test Agency',NULL,'','','','2012-12-08 01:21:38','2013-01-18 07:46:38','','',NULL,11,NULL,NULL,'','',NULL,NULL,NULL,1.50,5789712,NULL),(11,'Good Life Companions',41,'Kathy Fielding','','katej.fielding@gmail.com','2012-12-27 19:04:58','2013-01-16 17:28:21','','8316462046',1,1,NULL,NULL,'','',NULL,NULL,0,1.50,1183540,NULL);
/*!40000 ALTER TABLE `agencies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `agency_invoice_payments`
--

DROP TABLE IF EXISTS `agency_invoice_payments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `agency_invoice_payments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `agency_invoice_id` int(11) DEFAULT NULL,
  `payment_method` varchar(255) DEFAULT NULL,
  `amount` decimal(11,2) DEFAULT '0.00',
  `date` datetime DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `token` varchar(255) DEFAULT NULL,
  `notes` text,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `agency_invoice_payments`
--

LOCK TABLES `agency_invoice_payments` WRITE;
/*!40000 ALTER TABLE `agency_invoice_payments` DISABLE KEYS */;
/*!40000 ALTER TABLE `agency_invoice_payments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `agency_invoice_rows`
--

DROP TABLE IF EXISTS `agency_invoice_rows`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `agency_invoice_rows` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `agency_invoice_id` int(11) DEFAULT NULL,
  `label` varchar(255) DEFAULT NULL,
  `quantity` int(11) DEFAULT '1',
  `unit_price` decimal(11,2) DEFAULT '0.00',
  `notes` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `agency_invoice_rows`
--

LOCK TABLES `agency_invoice_rows` WRITE;
/*!40000 ALTER TABLE `agency_invoice_rows` DISABLE KEYS */;
/*!40000 ALTER TABLE `agency_invoice_rows` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `agency_invoices`
--

DROP TABLE IF EXISTS `agency_invoices`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `agency_invoices` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `agency_id` int(11) DEFAULT NULL,
  `total` decimal(11,2) DEFAULT '0.00',
  `invoice_date` date DEFAULT NULL,
  `due_date` date DEFAULT NULL,
  `auto_billing_date` date DEFAULT NULL,
  `notes` text,
  `status` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `agency_invoices`
--

LOCK TABLES `agency_invoices` WRITE;
/*!40000 ALTER TABLE `agency_invoices` DISABLE KEYS */;
/*!40000 ALTER TABLE `agency_invoices` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `care_recipients`
--

DROP TABLE IF EXISTS `care_recipients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `care_recipients` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(255) DEFAULT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  `dob` datetime DEFAULT NULL,
  `default_location_id` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `profile_photo_file_name` varchar(255) DEFAULT NULL,
  `profile_photo_content_type` varchar(255) DEFAULT NULL,
  `profile_photo_file_size` int(11) DEFAULT NULL,
  `profile_photo_updated_at` datetime DEFAULT NULL,
  `agency_id` int(11) DEFAULT NULL,
  `default_bill_rate` decimal(11,2) DEFAULT '0.00',
  `middle_name` varchar(255) DEFAULT NULL,
  `gender` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `sms` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=161 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `care_recipients`
--

LOCK TABLES `care_recipients` WRITE;
/*!40000 ALTER TABLE `care_recipients` DISABLE KEYS */;
INSERT INTO `care_recipients` VALUES (1,'Mitch','Harcourt','1940-12-05 00:00:00',11,'2012-12-06 18:55:05','2013-02-05 05:16:19','25152c20.jpeg','image/jpeg',450248,'2013-02-05 05:16:18',11,30.00,NULL,NULL,NULL,NULL),(11,'Jeff','Sternberg','1970-12-03 08:00:00',21,'2012-12-08 01:21:25','2013-02-06 20:03:00','22b4e390.jpeg','image/jpeg',74017,'2013-02-05 05:15:36',11,35.00,NULL,NULL,'',NULL),(21,'Kathy','Johnson','2013-02-06 08:00:00',31,'2012-12-08 23:38:03','2013-02-07 00:41:27','person-silhouette.jpeg','image/jpeg',2677,'2013-01-01 01:22:34',11,22.50,NULL,NULL,'',NULL),(31,'Kathy','Fielding','1945-01-12 07:00:00',41,'2012-12-12 01:17:00','2013-02-01 22:00:12','241d7740.jpeg','image/jpeg',339668,'2013-02-01 22:00:11',11,0.00,NULL,NULL,NULL,NULL),(41,'George','Washington','1933-12-11 08:00:00',51,'2012-12-30 01:39:12','2013-01-01 01:22:37','washington.jpeg','image/jpeg',3825,'2013-01-01 01:22:37',1,66.00,NULL,NULL,NULL,NULL),(51,'Thomas','Edison','1900-10-09 08:00:00',61,'2012-12-30 01:40:22','2013-01-01 01:22:38','edison.jpeg','image/jpeg',7374,'2013-01-01 01:22:38',1,49.00,NULL,NULL,NULL,NULL),(61,'Shaquille','O\'Neal','1972-03-04 08:00:00',71,'2012-12-30 01:42:17','2013-01-01 01:22:40','shaq.jpeg','image/jpeg',5896,'2013-01-01 01:22:39',1,97.00,NULL,NULL,NULL,NULL),(71,'Michael','Jackson','1985-08-10 07:00:00',NULL,'2013-01-05 05:36:33','2013-01-05 05:36:33','IMG_0099.jpg','image/jpeg',2673408,'2013-01-05 05:36:31',1,26.00,NULL,NULL,NULL,NULL),(81,'Jason','Blue Watch','1957-01-28 08:00:00',91,'2013-01-29 02:15:01','2013-02-05 05:15:46','23afb250.jpeg','image/jpeg',3625139,'2013-02-05 05:15:43',1,19.45,NULL,NULL,'8316462046',NULL),(91,'Alissa','Godwin','1986-06-15 07:00:00',101,'2013-01-29 18:06:42','2013-02-01 21:57:22','1e5d1380.jpeg','image/jpeg',348627,'2013-02-01 21:57:20',11,20.00,NULL,NULL,'8583548931',NULL),(101,'Matt','Peabody','1970-01-31 08:00:00',111,'2013-02-01 00:23:02','2013-02-01 00:23:02',NULL,NULL,NULL,NULL,1,20.00,NULL,NULL,'8316462046',NULL),(111,'Frankenstein','Woopthereitis','1977-01-31 08:00:00',121,'2013-02-01 00:29:07','2013-02-01 05:17:30','2685a990.jpeg','image/jpeg',235868,'2013-02-01 05:17:28',1,22.00,NULL,NULL,'',NULL),(121,'Jimmy','Timmy','1992-02-06 08:00:00',131,'2013-02-06 19:56:35','2013-02-06 19:56:35',NULL,NULL,NULL,NULL,1,25.00,NULL,NULL,'',NULL),(131,'Mark','Hopkins','1990-02-06 08:00:00',141,'2013-02-06 20:01:55','2013-02-06 20:01:55',NULL,NULL,NULL,NULL,1,22.00,NULL,NULL,'',NULL),(141,'Julie','Watson','2013-02-06 08:00:00',151,'2013-02-07 01:38:05','2013-02-07 01:38:05',NULL,NULL,NULL,NULL,1,20.00,NULL,NULL,'',NULL),(151,'Ron','Roberts','1913-02-07 08:00:00',161,'2013-02-07 18:50:26','2013-02-07 18:50:26',NULL,NULL,NULL,NULL,1,45.00,NULL,NULL,'8316462046',NULL);
/*!40000 ALTER TABLE `care_recipients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `care_recipients_locations`
--

DROP TABLE IF EXISTS `care_recipients_locations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `care_recipients_locations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `care_recipient_id` int(11) DEFAULT NULL,
  `location_id` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=141 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `care_recipients_locations`
--

LOCK TABLES `care_recipients_locations` WRITE;
/*!40000 ALTER TABLE `care_recipients_locations` DISABLE KEYS */;
INSERT INTO `care_recipients_locations` VALUES (1,1,11,'2012-12-06 18:55:05','2012-12-06 18:55:05'),(11,1,1,'2012-12-06 18:55:05','2012-12-06 18:55:05'),(21,11,21,'2012-12-08 01:21:25','2012-12-08 01:21:25'),(31,31,41,'2012-12-12 01:17:48','2012-12-12 01:17:48'),(41,21,NULL,'2012-12-12 01:46:35','2012-12-12 01:46:35'),(51,81,91,'2013-01-29 02:15:01','2013-01-29 02:15:01'),(61,91,101,'2013-01-29 18:06:42','2013-01-29 18:06:42'),(71,101,111,'2013-02-01 00:23:02','2013-02-01 00:23:02'),(81,111,121,'2013-02-01 00:29:07','2013-02-01 00:29:07'),(91,121,131,'2013-02-06 19:56:35','2013-02-06 19:56:35'),(101,131,141,'2013-02-06 20:01:55','2013-02-06 20:01:55'),(111,21,31,'2013-02-07 00:41:27','2013-02-07 00:41:27'),(121,141,151,'2013-02-07 01:38:05','2013-02-07 01:38:05'),(131,151,161,'2013-02-07 18:50:26','2013-02-07 18:50:26');
/*!40000 ALTER TABLE `care_recipients_locations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `care_recipients_users`
--

DROP TABLE IF EXISTS `care_recipients_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `care_recipients_users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `care_recipient_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=221 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `care_recipients_users`
--

LOCK TABLES `care_recipients_users` WRITE;
/*!40000 ALTER TABLE `care_recipients_users` DISABLE KEYS */;
INSERT INTO `care_recipients_users` VALUES (1,1,21,'2012-12-06 18:55:05','2012-12-06 18:55:05'),(11,1,11,'2012-12-06 18:55:05','2012-12-06 18:55:05'),(21,1,1,'2012-12-06 18:55:05','2012-12-06 18:55:05'),(31,11,11,'2012-12-08 01:21:25','2012-12-08 01:21:25'),(41,31,21,'2012-12-12 01:17:48','2012-12-12 01:17:48'),(51,21,21,'2012-12-12 01:50:54','2012-12-12 01:50:54'),(61,61,1,'2012-12-30 02:02:08','2012-12-30 02:02:08'),(71,51,1,'2012-12-30 02:02:14','2012-12-30 02:02:14'),(81,41,1,'2012-12-30 02:02:18','2012-12-30 02:02:18'),(91,11,1,'2012-12-30 02:02:26','2012-12-30 02:02:26'),(101,51,21,'2013-01-25 02:01:59','2013-01-25 02:01:59'),(111,31,11,'2013-01-28 21:57:52','2013-01-28 21:57:52'),(121,81,21,'2013-01-29 02:15:15','2013-01-29 02:15:15'),(131,71,1,'2013-01-29 06:52:37','2013-01-29 06:52:37'),(141,91,11,'2013-01-29 18:06:42','2013-01-29 18:06:42'),(151,31,1,'2013-01-31 03:46:32','2013-01-31 03:46:32'),(161,101,1,'2013-02-01 00:27:13','2013-02-01 00:27:13'),(171,111,1,'2013-02-01 00:35:44','2013-02-01 00:35:44'),(181,111,21,'2013-02-03 01:26:16','2013-02-03 01:26:16'),(191,121,21,'2013-02-06 19:57:05','2013-02-06 19:57:05'),(201,131,21,'2013-02-06 20:02:03','2013-02-06 20:02:03'),(211,151,21,'2013-02-07 18:50:34','2013-02-07 18:50:34');
/*!40000 ALTER TABLE `care_recipients_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `caregiver_tasks`
--

DROP TABLE IF EXISTS `caregiver_tasks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `caregiver_tasks` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `label` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `weight` int(11) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=251 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `caregiver_tasks`
--

LOCK TABLES `caregiver_tasks` WRITE;
/*!40000 ALTER TABLE `caregiver_tasks` DISABLE KEYS */;
INSERT INTO `caregiver_tasks` VALUES (71,'Medication Reminders','2013-01-04 22:48:08','2013-01-04 22:48:08',0),(81,'Bathin/Shower/Bed/Bath','2013-01-04 22:48:08','2013-01-04 22:48:08',0),(91,'Assist with Toileting','2013-01-04 22:48:08','2013-01-04 22:48:08',0),(101,'Incontinent Care','2013-01-04 22:48:08','2013-01-04 22:48:08',0),(111,'Skin Care','2013-01-04 22:48:08','2013-01-04 22:48:08',0),(121,'Oral Care','2013-01-04 22:48:08','2013-01-04 22:48:08',0),(131,'Dressing','2013-01-04 22:48:08','2013-01-04 22:48:08',0),(141,'Ambulation/Exercises','2013-01-04 22:48:08','2013-01-04 22:48:08',0),(151,'Meal Prep','2013-01-04 22:48:08','2013-01-04 22:48:08',0),(161,'Errands/Shopping','2013-01-04 22:48:08','2013-01-04 22:48:08',0),(171,'Vacuum/Dust','2013-01-04 22:48:08','2013-01-04 22:48:08',0),(181,'Clean Bathroom','2013-01-04 22:48:08','2013-01-04 22:48:08',0),(191,'Clean Kitchen','2013-01-04 22:48:08','2013-01-04 22:48:08',0),(201,'Laundry','2013-01-04 22:48:08','2013-01-04 22:48:08',0),(211,'Linen Change','2013-01-04 22:48:08','2013-01-04 22:48:08',0),(221,'Transportation','2013-01-04 22:48:08','2013-01-04 22:48:08',0),(231,'Safety Measures','2013-01-04 22:48:08','2013-01-04 22:48:08',0),(241,'Socialization','2013-01-04 22:48:08','2013-01-04 22:48:08',0);
/*!40000 ALTER TABLE `caregiver_tasks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `check_ins`
--

DROP TABLE IF EXISTS `check_ins`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `check_ins` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `latitude` decimal(11,8) DEFAULT NULL,
  `longitude` decimal(11,8) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `in_out` tinyint(1) DEFAULT NULL,
  `visit_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1731 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `check_ins`
--

LOCK TABLES `check_ins` WRITE;
/*!40000 ALTER TABLE `check_ins` DISABLE KEYS */;
INSERT INTO `check_ins` VALUES (1481,11,32.81438828,-117.26982117,'2013-02-06 14:58:46','2013-02-06 14:58:46',1,1051),(1491,11,32.81444550,-117.26982880,'2013-02-06 15:08:41','2013-02-06 15:08:41',0,1051),(1501,11,32.81440735,-117.27001953,'2013-02-06 15:23:41','2013-02-06 15:23:41',1,1191),(1511,11,32.81067657,-117.26661682,'2013-02-06 15:52:46','2013-02-06 15:52:46',0,1191),(1521,11,32.81063080,-117.26659393,'2013-02-06 16:04:28','2013-02-06 16:04:28',1,1251),(1531,11,32.81076813,-117.26672363,'2013-02-06 16:10:39','2013-02-06 16:10:39',0,1251),(1541,21,37.78583527,-122.40641785,'2013-02-06 16:39:00','2013-02-06 16:39:00',1,1261),(1551,11,32.81438065,-117.26973724,'2013-02-06 16:58:32','2013-02-06 16:58:32',1,1271),(1561,11,32.81444168,-117.26982880,'2013-02-06 17:30:05','2013-02-06 17:30:05',0,1271),(1571,21,37.46668243,-122.16780090,'2013-02-06 17:39:57','2013-02-06 17:39:57',1,1281),(1581,21,37.46661377,-122.16734314,'2013-02-06 17:48:43','2013-02-06 17:48:43',0,1281),(1591,21,36.98166656,-121.95502472,'2013-02-06 20:03:20','2013-02-06 20:03:20',1,1291),(1601,11,32.81442261,-117.26974487,'2013-02-06 20:04:50','2013-02-06 20:04:50',1,1301),(1611,1,37.78583527,-122.40641785,'2013-02-06 21:57:50','2013-02-06 21:57:50',1,1311),(1621,1,37.78583527,-122.40641785,'2013-02-06 21:58:08','2013-02-06 21:58:08',1,1321),(1631,1,37.78583527,-122.40641785,'2013-02-06 22:01:04','2013-02-06 22:01:04',1,1331),(1641,1,37.78583527,-122.40641785,'2013-02-06 22:01:39','2013-02-06 22:01:39',0,1331),(1651,1,37.78583527,-122.40641785,'2013-02-06 22:01:53','2013-02-06 22:01:53',1,1341),(1661,11,32.81059647,-117.26675415,'2013-02-06 22:14:55','2013-02-06 22:14:55',1,1351),(1671,11,32.81071854,-117.26644897,'2013-02-06 22:30:54','2013-02-06 22:30:54',0,1351),(1681,11,32.81090927,-117.26648712,'2013-02-07 01:05:04','2013-02-07 01:05:04',1,1361),(1691,11,32.81069946,-117.26663208,'2013-02-07 01:15:13','2013-02-07 01:15:13',0,1361),(1701,21,37.46666718,-122.16780853,'2013-02-07 02:25:05','2013-02-07 02:25:05',1,1371),(1711,21,37.46670532,-122.16769409,'2013-02-07 02:42:03','2013-02-07 02:42:03',0,1371),(1721,21,37.78583527,-122.40641785,'2013-02-07 18:20:35','2013-02-07 18:20:35',1,1381);
/*!40000 ALTER TABLE `check_ins` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `client_invoice_batches`
--

DROP TABLE IF EXISTS `client_invoice_batches`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `client_invoice_batches` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `agency_id` int(11) DEFAULT NULL,
  `guid` varchar(255) DEFAULT NULL,
  `start_date` datetime DEFAULT NULL,
  `end_date` datetime DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=251 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `client_invoice_batches`
--

LOCK TABLES `client_invoice_batches` WRITE;
/*!40000 ALTER TABLE `client_invoice_batches` DISABLE KEYS */;
INSERT INTO `client_invoice_batches` VALUES (221,11,'a81e3040-52af-0130-3382-12313d141deb','2013-01-01 00:00:00','2013-02-07 07:59:59','2013-02-06 17:22:07','2013-02-06 17:22:07'),(231,1,'d89574a0-52b2-0130-bbe9-22000a1f82ae','2013-02-01 00:00:00','2013-02-07 07:59:59','2013-02-06 17:44:57','2013-02-06 17:44:57'),(241,1,'a17fa2b0-52b3-0130-bbe9-22000a1f82ae','2013-02-01 00:00:00','2013-02-07 07:59:59','2013-02-06 17:50:34','2013-02-06 17:50:34');
/*!40000 ALTER TABLE `client_invoice_batches` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `client_invoice_line_items`
--

DROP TABLE IF EXISTS `client_invoice_line_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `client_invoice_line_items` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `care_recipient_id` int(11) DEFAULT NULL,
  `pay_status` int(11) DEFAULT NULL,
  `hours` decimal(11,2) DEFAULT '0.00',
  `bill_rate` decimal(11,2) DEFAULT '0.00',
  `adjustments` decimal(11,2) DEFAULT '0.00',
  `original_bill_rate` decimal(11,2) DEFAULT '0.00',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `client_invoice_id` int(11) DEFAULT NULL,
  `visit_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=281 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `client_invoice_line_items`
--

LOCK TABLES `client_invoice_line_items` WRITE;
/*!40000 ALTER TABLE `client_invoice_line_items` DISABLE KEYS */;
INSERT INTO `client_invoice_line_items` VALUES (271,81,NULL,0.08,19.45,0.00,19.45,'2013-02-06 17:50:34','2013-02-06 17:50:34',211,1281);
/*!40000 ALTER TABLE `client_invoice_line_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `client_invoices`
--

DROP TABLE IF EXISTS `client_invoices`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `client_invoices` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `care_recipient_id` int(11) DEFAULT NULL,
  `invoice_number` int(11) DEFAULT NULL,
  `notes` text,
  `due_date` datetime DEFAULT NULL,
  `invoice_date` datetime DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `agency_id` int(11) DEFAULT NULL,
  `status` varchar(255) DEFAULT 'pending',
  `exported` tinyint(1) DEFAULT '0',
  `client_invoice_batch_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=221 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `client_invoices`
--

LOCK TABLES `client_invoices` WRITE;
/*!40000 ALTER TABLE `client_invoices` DISABLE KEYS */;
INSERT INTO `client_invoices` VALUES (211,81,1,NULL,'2013-02-06 00:00:00','2013-02-06 00:00:00','2013-02-06 17:50:34','2013-02-07 18:33:57',1,'pending',1,241);
/*!40000 ALTER TABLE `client_invoices` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `locations`
--

DROP TABLE IF EXISTS `locations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `locations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `street` varchar(255) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `state` varchar(255) DEFAULT NULL,
  `zip` varchar(255) DEFAULT NULL,
  `latitude` decimal(11,8) DEFAULT NULL,
  `longitude` decimal(11,8) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `outside_photo_file_name` varchar(255) DEFAULT NULL,
  `outside_photo_content_type` varchar(255) DEFAULT NULL,
  `outside_photo_file_size` int(11) DEFAULT NULL,
  `outside_photo_updated_at` datetime DEFAULT NULL,
  `agency_id` int(11) DEFAULT NULL,
  `line2` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=171 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `locations`
--

LOCK TABLES `locations` WRITE;
/*!40000 ALTER TABLE `locations` DISABLE KEYS */;
INSERT INTO `locations` VALUES (1,'2372 Eastwood Dr','Roseville','CA','95747',38.78092100,-121.36040000,'2012-12-06 18:52:59','2012-12-27 19:05:00',NULL,NULL,NULL,NULL,11,NULL),(11,'6349 Watt Ave','North Highlands','CA','95660',38.68279420,-121.38300220,'2012-12-06 18:54:25','2012-12-27 19:05:00',NULL,NULL,NULL,NULL,11,NULL),(21,'5632 La Jolla Blvd.','La Jolla','CA','92037',32.81453010,-117.27003530,'2012-12-07 16:48:56','2012-12-27 19:04:59',NULL,NULL,NULL,NULL,11,NULL),(31,'660 Menlo Oaks Drive','Menlo Park','CA','94025',37.46655100,-122.16776700,'2012-12-08 23:36:38','2012-12-27 19:04:59',NULL,NULL,NULL,NULL,11,NULL),(41,'22 Lower Ragsdale, Suite B','Monterey','CA','93940',36.57384100,-121.80999100,'2012-12-12 01:15:00','2012-12-27 19:04:59',NULL,NULL,NULL,NULL,11,NULL),(51,'2386 Eastwood Dr','Roseville','CA','95747',38.78112140,-121.36027850,'2012-12-30 01:39:04','2012-12-30 01:39:04',NULL,NULL,NULL,NULL,1,''),(61,'980 9th St','Sacramento','CA','95814',38.58096600,-121.49469100,'2012-12-30 01:39:58','2012-12-30 01:39:58',NULL,NULL,NULL,NULL,1,'16th Floor'),(71,'6525 Boulder Road','Granite Bay','CA','95746',38.77425700,-121.14030200,'2012-12-30 01:41:58','2012-12-30 01:41:58',NULL,NULL,NULL,NULL,1,''),(81,'5370 La Jolla Blvd.','La Jolla','CA','92037',32.81045790,-117.26656700,'2013-01-27 20:15:39','2013-01-27 20:15:39',NULL,NULL,NULL,NULL,NULL,NULL),(91,'670 Menlo Oaks Drive','Menlo Park','CA','94025',37.46678000,-122.16765300,'2013-01-29 02:15:01','2013-01-29 02:15:01',NULL,NULL,NULL,NULL,NULL,NULL),(101,'5370 La Jolla Blvd.','La Jolla','CA','92037',32.81045790,-117.26656700,'2013-01-29 18:06:42','2013-01-29 18:06:42',NULL,NULL,NULL,NULL,NULL,NULL),(111,'3360 Scott Street, #1234567897877876667676','San Francisco','CA','94123',37.80103500,-122.44104900,'2013-02-01 00:23:02','2013-02-01 00:23:02',NULL,NULL,NULL,NULL,NULL,NULL),(121,'799 Market Street','San Francisco','CA','94103',37.78564700,-122.40526500,'2013-02-01 00:29:07','2013-02-01 00:29:07',NULL,NULL,NULL,NULL,NULL,NULL),(131,'870 bay street','Santa Cruz','CA','',36.96357940,-122.03572470,'2013-02-06 19:56:35','2013-02-06 19:56:35',NULL,NULL,NULL,NULL,NULL,NULL),(141,'820 Bay Avenue','Capitola','CA','',36.98217000,-121.95513100,'2013-02-06 20:01:55','2013-02-06 20:01:55',NULL,NULL,NULL,NULL,NULL,NULL),(151,'750 Castro Street','Mountain View','CA','',37.38753280,-122.08305900,'2013-02-07 01:38:05','2013-02-07 01:38:05',NULL,NULL,NULL,NULL,NULL,NULL),(161,'22 Lower Ragsdale','Monterey','CA','',36.57384100,-121.80999100,'2013-02-07 18:50:26','2013-02-07 18:50:26',NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `locations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notes`
--

DROP TABLE IF EXISTS `notes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `notes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `care_recipient_id` int(11) DEFAULT NULL,
  `note` text,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `visit_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=221 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notes`
--

LOCK TABLES `notes` WRITE;
/*!40000 ALTER TABLE `notes` DISABLE KEYS */;
INSERT INTO `notes` VALUES (1,11,1,'This is noah, checking in for mitch.','2012-12-06 19:13:42','2012-12-06 19:13:42',NULL),(11,11,1,'Test','2012-12-06 23:31:37','2012-12-06 23:31:37',NULL),(21,1,1,'This is a test from my iPhone','2012-12-06 23:45:50','2012-12-06 23:45:50',NULL),(31,1,1,'This is a note added from the Current Session tab','2012-12-06 23:46:13','2012-12-06 23:46:13',21),(41,1,1,'This is awesome!','2012-12-07 03:00:44','2012-12-07 03:00:44',NULL),(51,1,1,'I love notes','2012-12-07 03:00:59','2012-12-07 03:00:59',31),(61,1,1,'Test ','2012-12-08 22:38:50','2012-12-08 22:38:50',NULL),(71,1,1,'This is a new check in','2012-12-08 22:48:42','2012-12-08 22:48:42',131),(81,1,1,'This is a new check in','2012-12-08 22:50:36','2012-12-08 22:50:36',141),(91,21,1,'Here at the house, door was open','2012-12-08 23:42:45','2012-12-08 23:42:45',161),(101,1,1,'Me and Kailey','2012-12-09 03:49:21','2012-12-09 03:49:21',171),(111,11,11,'Testing notes','2012-12-09 18:21:12','2012-12-09 18:21:12',181),(121,21,31,'Here I am, everything is great','2012-12-12 05:48:35','2012-12-12 05:48:35',261),(131,1,1,'Test','2012-12-30 00:43:17','2012-12-30 00:43:17',271),(141,1,1,'God bless mitch','2012-12-30 01:35:46','2012-12-30 01:35:46',291),(151,11,11,'Test','2012-12-31 01:37:30','2012-12-31 01:37:30',341),(161,11,11,'Test again','2012-12-31 21:39:15','2012-12-31 21:39:15',351),(171,11,11,'Test','2013-01-02 00:34:54','2013-01-02 00:34:54',361),(181,11,11,'Test','2013-01-02 04:51:53','2013-01-02 04:51:53',381),(191,11,11,'Hi','2013-01-02 04:51:54','2013-01-02 04:51:54',401),(201,11,11,'Hi','2013-01-02 04:51:54','2013-01-02 04:51:54',411),(211,1,1,'','2013-01-05 22:22:21','2013-01-05 22:22:21',491);
/*!40000 ALTER TABLE `notes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth_access_grants`
--

DROP TABLE IF EXISTS `oauth_access_grants`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oauth_access_grants` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `resource_owner_id` int(11) NOT NULL,
  `application_id` int(11) NOT NULL,
  `token` varchar(255) NOT NULL,
  `expires_in` int(11) NOT NULL,
  `redirect_uri` varchar(255) NOT NULL,
  `created_at` datetime NOT NULL,
  `revoked_at` datetime DEFAULT NULL,
  `scopes` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_oauth_access_grants_on_token` (`token`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth_access_grants`
--

LOCK TABLES `oauth_access_grants` WRITE;
/*!40000 ALTER TABLE `oauth_access_grants` DISABLE KEYS */;
/*!40000 ALTER TABLE `oauth_access_grants` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth_access_tokens`
--

DROP TABLE IF EXISTS `oauth_access_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oauth_access_tokens` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `resource_owner_id` int(11) DEFAULT NULL,
  `application_id` int(11) NOT NULL,
  `token` varchar(255) NOT NULL,
  `refresh_token` varchar(255) DEFAULT NULL,
  `expires_in` int(11) DEFAULT NULL,
  `revoked_at` datetime DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `scopes` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_oauth_access_tokens_on_token` (`token`),
  UNIQUE KEY `index_oauth_access_tokens_on_refresh_token` (`refresh_token`),
  KEY `index_oauth_access_tokens_on_resource_owner_id` (`resource_owner_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2511 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth_access_tokens`
--

LOCK TABLES `oauth_access_tokens` WRITE;
/*!40000 ALTER TABLE `oauth_access_tokens` DISABLE KEYS */;
INSERT INTO `oauth_access_tokens` VALUES (1,1,1,'1434230e72247a45d5984dcf8dc11a6ada841c886b9ba0362d91f030b7af26a8','a1f1fb6e4b264e1c6d3d0753e83f9bf2680bebd3b333508b2f5eef6ede7e8be7',7200,'2012-11-08 22:34:37','2012-10-10 14:36:28','public'),(11,1,1,'f13333e3454b0fd29836a9f91804360b9b42c38cf24d2695706b045857e56f6c','f50c725012563ac9696621ea49db4fd92ceb0633b22cd9596c13093d478268c6',7200,'2012-11-08 22:34:37','2012-10-10 14:51:58','public'),(21,1,1,'67b8bd471087b1a0838ae86d94610646cadb457ecf72357ad7acbeaad4a84141','6bf807d904ebe2f6f7d0d4e65433c24c34210cb105d738ff494b3ef9dbfb5d4e',7200,'2012-12-30 02:06:06','2012-11-08 22:34:37','public'),(31,1,1,'c4ddf7337136380de426ebf04c8bfbba117db9eca52c3845ab363a6819856cf3','b55968284a2696bc717e6a628fa51f72c623eb76cbf9a0500cb9dfdfd2a1277d',7200,'2012-11-15 23:51:57','2012-11-08 23:58:53','public'),(41,1,1,'01203b483e72727d2085d52570ed3e38cc2763e89318ba351038ff62259fce26','46e5a72b454f7d7f422e94730a6cb417b2e0c4c6122350694b7db72c3b296a58',7200,'2012-11-15 23:51:57','2012-11-09 00:14:53','public'),(51,21,1,'e0ad6600f02f451beb5e7747c5ffae59d54e8c147db5b7f72ebeebf1483e45a5','4ae1cef73551af9944261d599aa818984ee16f609ff07502e0a36027d9481b31',7200,'2012-11-09 16:50:06','2012-11-09 01:14:26','public'),(61,11,1,'983c43a416b1b85f0469e46c01282f3801df922fc3cb9732b0bed271940dbc28','9dfae452620308e76a03d455a0b8b0348623664a829c4ae965259a0c67e348fa',7200,'2012-11-10 20:49:16','2012-11-09 01:19:50','public'),(71,21,1,'2e5225ca4871fe3f1160ec4f4e75aea88bbf0985bfd3d392783668d1c5a785a4','74ab1d4a36f4086d2fd2c60c31b3a7a7e3e82ad538f50f1b46a0af781ddedc48',7200,NULL,'2012-11-09 16:50:06','public'),(81,11,1,'0a84e3fafcf0595b88830b661f37d39da1cb79d3d44b3eea3c37145516ca0f9c','a6604f497f7afa11ad452759561a06d3457992e310c5a38272368857da39db68',7200,'2012-12-06 23:30:46','2012-11-10 20:49:16','public'),(91,1,1,'12396a2b657b737a9f134519b86c3ae4558b421147372eede974b499c56bbe06','6e509d0b7d79096bec21f61df3e67a27569b023f15889eb0bc0b40668dea21d9',7200,'2012-12-08 22:30:43','2012-11-15 23:51:57','public'),(101,1,1,'e19924f43151e6b7e8d0e0232dfc9174ed63f8e1eeafebbf55aca63c9d503e73','90b69134c033df6fb9d9ec8663d5609dfdaf4abed6da486e0921f92512096153',7200,'2012-12-08 22:24:19','2012-12-06 18:59:24','public'),(111,11,1,'07d1ca1daf8728a903c72d78f5b179d819ee8382cf9ffc3df06243b4873ed71d','51692bfe1ca58e3fdfe560d709f33017c328d05a8b49a581010d05d713e243c7',7200,'2012-12-06 23:30:46','2012-12-06 19:00:09','public'),(121,11,1,'5ca3da40b4605e2bdf69798a3424607aa58e27ee22e018e3032a021065f319c1','d1b46851c17e72c28abd8fbde1a21f434dea56c69ec0165ce347444bcccb6334',7200,NULL,'2012-12-06 23:30:46','public'),(131,11,1,'fa80b520cd5d211e8278e002d2e43680ebfc3fa6f2a975edc8d22b1b6a32c78e','e4555a32a5dcac397187616122bcb0cbd1ffef3465cc471ecc942ef79f86d810',7200,NULL,'2012-12-06 23:31:11','public'),(141,1,1,'898632346335d0ed62a628933056fae4f5f9bc5b548b0ad946f7f78ae3019ec3','78e274ae952c81d528c49f0a91931a94fee60713412cf41b978a7b46a4684035',7200,'2012-12-07 03:05:30','2012-12-06 23:45:28','public'),(151,1,1,'6b64ff967807e32eacde04481f73159fd48059f28f34f9bdc0a2e4743b850266','77a263d2e4ec04faef248aafe3d064666cb9a98ce977c09e7ee551b90185ba95',7200,'2012-12-07 03:05:30','2012-12-07 03:00:24','public'),(161,1,1,'6a05949ac6f6305194117e32652b099b7d61d9646018dc9a9219500f2bae9c14','90a2ea112807a7b945f06392216ed666360d850685bd136e718693c175951f58',7200,'2012-12-08 22:16:33','2012-12-07 03:05:30','public'),(171,1,1,'5238b7f4c6b6fda3bdaf3eb38648ec7be086bf566f4caea98398feba4f1bbf29','ae64978eecdbead7843ac0c01d154318b1b72211703b4d40c265ec5afc6f74c6',7200,'2012-12-07 21:53:19','2012-12-07 03:05:50','public'),(181,21,1,'5b442475c0d0c378956ab688614991ad87c43a406c40e1bc9743c3a2a6094427','d2a48cd9dae00e8f52a964c12dff08173954e221429288be518e36afcd2ba027',7200,NULL,'2012-12-07 03:35:48','public'),(191,21,1,'d7c59c5f11dfb51749f73145a6004321e528285c386eab0d0778738d9bd711f2','f51dec5046dcd32908a116a89fa4c195ca85521a20c2834aca4f310f4701a277',7200,NULL,'2012-12-07 03:35:48','public'),(201,21,1,'de7a3f6f9ff94cb27f6d08bd7e6489764a05886149b1e45714aa6fb85cd9fc35','6151c4d4e6608e8dfaaf3b780b87278528a5836691b4d9d9298ecfa03d6e9496',7200,NULL,'2012-12-07 03:35:48','public'),(211,21,1,'25eaec0ec7903142fcd4e90d915c18bdfc58a61dbaade59e64561f8dc2bf11c6','4632833d5bbd81c072b3eb27a2becd501d3c3481159b9fa9db3a390f4e88fa73',7200,NULL,'2012-12-07 03:35:49','public'),(221,21,1,'5d940f87af7859a0c3df09023794602f1411af136b1baf075d72fcad371ca29d','4a54b25acf88b6e0d98a2377e1b4f1c230d2452c50e93a893fa53c716ec17b2e',7200,NULL,'2012-12-07 03:59:47','public'),(231,21,1,'b6c2863309b4a1ad6d442f46cb191cbee3dab2714e9253717b2c7d7b8f24a3c6','86c0769128a926cf18d75763f9eeff64a0ca7bc49fdd7fa8dd1fa8cd144594d7',7200,'2012-12-07 18:30:32','2012-12-07 03:59:48','public'),(241,21,1,'a4278ed3f78eadd44d685a03c56cac7bfcb150a1d1f3ccaefc3d6e5311aeaf2e','e4a28daff34218153e1ff962c64a0269e9d9da3cd39ba5fcaf0c70f57c893f20',7200,'2012-12-07 18:30:32','2012-12-07 03:59:50','public'),(251,11,1,'0e114b0b76008d7376b2208c1dc20a80ff80213cf1ea303ebb466c3d22e3ef14','610893b4cace97008da24f5f803dcc67bfab985fbcfea4464fd1aa5e8bc6c35e',7200,NULL,'2012-12-07 15:24:27','public'),(261,11,1,'f1b041619843e59d463a37c51915ae4e585f074497f4011ae25b6decf884172c','469a56bb67c5919692bcb5ed8576edf67fd9048c5d541e361182adf6aff8aa3e',7200,NULL,'2012-12-07 15:24:27','public'),(271,21,1,'3c51409324a078413f69af48f999da5fb2053f83a1217d2e675d0bb421375c04','f3ab89c3902e758824888e776e6801deb9203db0157e43f6f16ae3bce9573803',7200,NULL,'2012-12-07 18:30:32','public'),(281,21,1,'904fe1e1896ab301c6dec7e618f17192b8b9409551dfcbaff0dada25377a1be3','444aba121eca8dc24cc77c1bea5950d889915d0ae8d5fdd22c7f7fec4ea4224a',7200,'2013-01-25 19:38:19','2012-12-07 18:30:48','public'),(291,21,1,'e49a033fec2c4a564f148591026c53cfb64c6a9f8abc8c1bc72774bfae609a36','970ab64a09efd5ebc7a794dbc3d6f5d52a3e4a876bab6970b7c7dbe778b74c69',7200,'2013-01-21 04:02:12','2012-12-07 18:31:08','public'),(301,21,1,'d0e1b9b8acab289bc9b06a4287ffa03b67c4ab8ab19fd3e42a44c8eb8796a43c','19280238ac0de00a7617b96ac6254d7f951afbff2131970ef00870e608bc0815',7200,'2013-01-19 04:49:58','2012-12-07 18:31:15','public'),(311,21,1,'6b68d1d9b1ceee5bdfeaffc23f2d5e1010155d7ab2670746f77bb3c92dbdaac2','8d8f115faad91e887fc329a7dc011444e6fbb6e6ec0781ab89f527e4b7447ff8',7200,'2012-12-22 18:25:56','2012-12-07 18:31:16','public'),(321,21,1,'638c44518bd02afbff6e722652021be4e977a47c51a68e20a8de40e0e62d90b9','bb06d5c54ae203e03d58522edafb12408057c6b97eccf8b8a9a1214611debefc',7200,'2013-01-04 20:44:25','2012-12-07 18:31:16','public'),(331,21,1,'4741fc37c9142e088d341f15a5f90f010ed5ac56ae63849f7789f9fb71b03645','96a69b0531ee918029c7cf7e087c4160a4b0bafee046d9977bc14d4fbaac90c1',7200,'2012-12-12 01:06:38','2012-12-07 18:31:32','public'),(341,21,1,'fcc1d33554f3af326038ee6787f64eda375896e99d079c382cf8bf0c29ae5815','a0b71f80edac4e4ce80c3410759099bd89de76545dd146b98d1d259282a77fc1',7200,'2012-12-12 02:04:32','2012-12-07 18:31:32','public'),(351,1,1,'90a600210da3b8af4eba4f86632a69623955acf6419baa404e7696c2e8218e14','e635ed7bcb5e9f3768d8b48275ef363ad8c6db3ed9e8a0af7525b9d710520ac4',7200,'2012-12-07 21:53:19','2012-12-07 19:24:04','public'),(361,1,1,'707ce2e75d9d615082b4e53c8a0b1b3bf04404f9f14d16185eef10eabff97d2e','f1cbbc9045ef98ab74d8db473ee2d2aedccae3633bf4e4b7c87c99e67be9fe3c',7200,'2012-12-08 22:10:48','2012-12-07 21:53:19','public'),(371,1,1,'d246fb838e0a77777f939aade491bbbab5326f0d2e16125e1fb7fa65c0b2e384','6b7e3d10708d6833e3ad00d20a3520e1bbe83b8c59c423f1aa9cdd4247389a0d',7200,'2012-12-08 22:10:48','2012-12-08 21:42:48','public'),(381,1,1,'04f9eae6df2dc9ebb3e9dccc42039d7f5b7d8cebbc1ecb77c5cd67075b9b7645','60f33fea9ba5055705ad7f4ece3fa3f79aa35812ca02c70ae43a4f5615852aa8',7200,'2012-12-08 22:08:04','2012-12-08 22:03:43','public'),(391,1,1,'270e435a0fee7d4f6d5e97b87e8ff0cc8116df81b7fcc269d3acdb5385a68bd5','6ed84de737557c4e7fe336685c77b5b120d61cced455e74f8528cbfbbe51234b',7200,'2012-12-08 22:16:32','2012-12-08 22:10:48','public'),(401,1,1,'848c59e136109c60e3b857fa952b8ef9dcef63615ee64d6abe9c7f4e619b8ce6','61a8fba9734f072ee4de48b423b31c797e0fd9a30536b40e2af6f6320239ac37',7200,'2012-12-08 22:20:58','2012-12-08 22:16:33','public'),(411,1,1,'e77996a69ba4762bb643f9ccd9f5443c2e9802e893d14080f04a010aab72a377','48d7da7717a0deb880677e6fcfbb0c5653ea0455b5e855bd0ba1e355079ac18c',7200,'2012-12-08 22:24:19','2012-12-08 22:19:30','public'),(421,1,1,'2e7f6dc96e7ae98e69eb5946bd9d5d9739a616f0318eac7b3d0cd4924c102a44','b7d6f4966c2b51aa095a193c41eb855cc0de99efad2f95e0c23b16df9c1af941',7200,'2012-12-08 22:28:30','2012-12-08 22:24:19','public'),(431,1,1,'71a9878a2146b15875fa398c5a67e8daa6b3439eb20f528e13741e537efcc122','be6beb972014db417b2399ff81d3b7571fda828a900814dc2c5c04bd1d63b89a',7200,'2012-12-08 22:30:43','2012-12-08 22:26:40','public'),(441,1,1,'397ef4a945829bffa0ff82ed9fcec96c9323912047ed4a097520d064470c5a56','b499d54cd01f4cbb3a3c3d0805ebeaf8c19c766a50ab1b138d0232b85afcd4a8',7200,'2012-12-09 03:48:48','2012-12-08 22:30:43','public'),(451,1,1,'db7f788a11e782d24434423eed462ae9fa32b9315717771604e482005e91893c','c21a71edd137ef44a30bd1a468590c2816ebd97e75f0768523cac525d8d8d92b',7200,'2012-12-08 22:56:00','2012-12-08 22:47:47','public'),(461,21,1,'0efef5699e38696034d6194099bf51659e308630b10472f6c37a930831877284','b538962b759a749b6f35167ce8a08494970092ce4558bb0ded5618868087301e',7200,'2012-12-12 01:06:38','2012-12-08 23:41:45','public'),(471,1,1,'3509d9e20ab5ae9ded857a40ae77e8dee0847f20a77694d63aaeed0cb8485ae4','08453ec603595607ed1724703f0d842005ca2b18b6630c9d4196ad1a74e4c19a',7200,'2012-12-11 00:54:46','2012-12-09 03:48:48','public'),(481,1,1,'7880635ada4acba239ed47cc57d99ed0f03fbf987c76194c5381a597faffa96e','d7eaa2f665f79a837bc356f82510ec89c979a1c1e03ecf881675348a93640c76',7200,'2012-12-11 01:36:26','2012-12-09 03:48:48','public'),(491,1,1,'74831210485f15d939c28339f0fe47ee7cfc8b7330050785939c20e6e1f6ced7','b5177ccdc51f7824006a3c8836b5e473760aee345c39be6e2b96cc116d867961',7200,'2012-12-30 02:00:23','2012-12-09 03:48:48','public'),(501,1,1,'71c0f6fb0d1bbd04147a2dcae1b9e7eb18289ef5a4a07a2636c3da854808e0e6','78fa4d354c4496aface7bcf104e8acf74920fdac3552c673d0029bbff480a8a0',7200,'2012-12-11 00:54:46','2012-12-09 03:48:48','public'),(511,11,1,'29450d656f755dc3982d80c09cdaa399fffdae472b0983b03bf5d5cbc4081025','7b7ec45bdb965b7b09b610da87dbdac61592c3ab66c8564d74fbffc7991958ac',7200,NULL,'2012-12-09 18:18:36','public'),(521,11,1,'7b57b8fa01a2a69da137567da0885161e8025e2aa781fd3d8fe4051b6e484573','bbe52b8ad53a1369a087b7dcf0da9029de8077993203b4bfd9c9278437c59ac4',7200,NULL,'2012-12-09 18:18:36','public'),(531,11,1,'321eeff354eaf62e6660bbb0f263b0572f69009846cae75667c13d7f1c89aee4','429368e13fd82d987c3aedb3289c3eda8195f4dcb0f2f3757151fee63d39ce1e',7200,NULL,'2012-12-09 18:18:37','public'),(541,11,1,'5de4304d287b5af384f17332323ccbdf58c9899d94a4f45764ba69e70ab7c014','77ecf4391417f42c964638b1bf6cb9e5964da819428efc9b4e206b4315842b4f',7200,NULL,'2012-12-09 18:18:37','public'),(551,11,1,'6feaa2a8859669bce4301900451f0f4a646bd1fe3b355e87d0ca46cfcd34504e','b0653d3e6f861b73e06c024948b5a0a9e7ef1b59bc95cc5f3addaf67ac09875e',7200,NULL,'2012-12-09 18:18:37','public'),(561,11,1,'55d1fde4c7941624d7cfe66e746120a03c0446d3108e9e5b9891751a518ca5dc','cd638b17fbf210a239db5475d11641dee5a3ae5dc1db00161c4618f4c67fce71',7200,NULL,'2012-12-09 18:18:37','public'),(571,11,1,'d7711d851bdc8d1d8ea03a1f12f30cc830e6e4d88c04a717cbff9db781807237','9d701b51d28a5cc302c201f1399ec13d8252c0932f1662413ea2b2ac050003f7',7200,'2012-12-18 23:00:33','2012-12-09 18:18:38','public'),(581,11,1,'06987339613b33907dc3b069e3fc3d03d156d14288bb3f6c88d6799059fe4be8','a022ea5cdc028e19dadaa9e6f7a0bee22d312019964059e911eeb41dabaaa171',7200,'2012-12-19 22:31:35','2012-12-09 18:18:38','public'),(591,11,1,'7247bc222a2c465f9c44d2f4509a4124d2ce214f87a4f6c78b65df2ed1b9e3e0','8d2de671fa5209ac815d284f8c1656c59cce781a9359d152e5da7cd66e5b5533',7200,NULL,'2012-12-09 18:18:38','public'),(601,11,1,'80b184629d2c857185c8652eff059fd8bc4a8a09f08d7463b147b202a98904bf','d15941670cac40a1232a37215c3367a77cfce8ae154a34d1758d7165acab9e3c',7200,NULL,'2012-12-09 18:18:38','public'),(611,11,1,'7bf9487fbf9e5fab0785e1cd4b99a594484fe33f6f73474c7264c8fc7e06a936','744480387d40c66d70e1e491ec287d44596ea36f83b15c884af991c8e5f78136',7200,NULL,'2012-12-09 18:18:38','public'),(621,11,1,'4127cde3315254978390165d26768ed475f88a1bbd7f9193885dff3e60471457','90a2a5d1478292935fd2e69d0307ffe9ea6edaf12896dabf5b17e6617a4746f3',7200,'2012-12-12 05:45:14','2012-12-09 18:18:39','public'),(631,11,1,'08fe1c7c415dc5d7bb0248c176e647d133dcaac626e65e348298dfff335fa823','3212cfb9c090513382e795aa9bf40e6e95303f1040b3ffa3883b9212f7ddf549',7200,'2012-12-12 05:45:14','2012-12-09 18:18:39','public'),(641,1,1,'27530863558fced69dfb32547a44fc5b45431693ce69aac8500144e28011c0df','b91017a58560f3b627c7f478ce32df479beedacae7368e72a4a22a1f452b46f8',7200,'2012-12-11 01:36:26','2012-12-11 00:54:46','public'),(651,1,1,'32fedb58563bb001e5ff7fa2755a7d49e615e6ade269aed407c2c7040b1c491f','44a409d6fdbb4a42abbd5e62d77d5515d7489c023f16172f5ca74b3402fd29f4',7200,'2012-12-14 20:31:03','2012-12-11 01:36:27','public'),(661,21,1,'e48a9dec47f4f519dfbb7b704ff1a6a90e190bebda8260cd449885a1b3efa2e3','728664fe6d40d6fd809943a0d64ac25203c4ab0880f3d58cd7a0958ac6193741',7200,'2012-12-12 02:04:32','2012-12-12 01:06:38','public'),(671,21,1,'ef3aa92379528923a664aeb20b7fd5c70cf6707e0910871c179677e45c684074','499113608673e93c227caf2a1d0cf666e71fdff981dd3edb48aeabd3f494bb6f',7200,'2012-12-12 02:00:18','2012-12-12 01:47:28','public'),(681,1,1,'872775c2f6ff8027dc6073fb5f5b3d853214476db97b4371fbe05fd0f54f17ac','f38bc86da6c13d9d760cc90121ae05cc6811a30d6ce613e65c2b81599b1a53fe',7200,'2012-12-14 20:31:03','2012-12-12 01:50:05','public'),(691,21,1,'5881cfc4e5a50d5d013643aa585ccee2296b50025cc521793fe137571be6085c','f1ff423387624bfbf974cf6c322fe2daddaa150e67e5478232d15f9540f7875e',7200,'2012-12-12 01:58:55','2012-12-12 01:55:01','public'),(701,21,1,'058a6619fd50b83b180e59d0ba3382ac835299f6529d69c4d98e47cc726781fc','9b55257f82282bc0b87678e1b06998bb4cc0db9ae200b91ada41eb78d312d89a',7200,'2012-12-18 20:11:51','2012-12-12 02:04:32','public'),(711,11,1,'9fec2bda3d5764297610f6527fb8f572dd24f38a90851d6075a1f4321e213cca','02807a71b9dfa1a5987063111640db378a7764ab6674ddb76a721c35db84b12d',7200,'2012-12-18 23:00:33','2012-12-12 05:45:15','public'),(721,21,1,'c63ce35254eb76f0ce4290b59920d57ba0137eefbb72f89defba942cb657c856','a60ddb9df8596ccaffbcbde2108796fb50e898b5e979a9fc7e42a458a4fe7ce7',7200,'2012-12-18 20:11:51','2012-12-12 05:47:21','public'),(731,1,1,'b4fa2f886d06179fedfbb1a8c2830f89d378914f1d70f2d3a971d44c35237fd8','9bcb496fe9eb22206f71ef21bba4a2e728c0d09a48649b0ece5d0d71c2c41923',7200,'2012-12-30 00:50:52','2012-12-14 20:31:03','public'),(741,21,1,'f7b2ae645991fe4aae9167fb44c78b7a63db9fd4214679f00ff5186dc7d13ee8','8b25ca4f6851d67fabf25401b9269b68aa4cd80273271e8d7656fc1ad5bd045c',7200,'2012-12-22 18:25:56','2012-12-18 20:11:51','public'),(751,11,1,'e3745f5d34662a14e8488252cbe4292874e142fc62b4c45aaa1ddb74ead758ca','185c6cd78a8552fe5446c333ddb4eb0df1f88399a58dd91789ee6d2218190090',7200,'2012-12-19 22:31:35','2012-12-18 23:00:33','public'),(761,11,1,'bbd8dcabb7e4c2238e9c044e5eab6aa5a09a7cb9439b6b8a2eade8ccf3f18b71','a8e773f20ba8ff9dfd6c39763e2134f8d49f5d289c1b8c9510d7bb67abfae2d4',7200,'2013-01-25 19:44:13','2012-12-19 22:31:35','public'),(771,21,1,'050c682117d5a424586e481d4f156aa8c58b6aee1159a81ca891cf3a4156a611','c2c4781cab15dbd80a04994f31df501801468e812e5be0fade2a14426a93643a',7200,'2013-01-04 05:27:10','2012-12-22 18:25:57','public'),(781,1,1,'fa083863f101baa275682b80d12691ce1b368f671446a5ea57d192fefd929ed6','5b6f4838686d45497a7f565d4c27703e1585d19eb56938c45b396abb029b5eb4',7200,'2012-12-30 00:43:03','2012-12-24 15:24:36','public'),(791,1,1,'16f890c72ab92c4b2644dfd7a87566fc72c47c34f447b4b1ba19fb3402c21346','cf5c3a7caa5b80321443d109a216ebfce485ed235e8602cf40b25025f66a10da',7200,'2012-12-30 00:43:02','2012-12-30 00:41:02','public'),(801,1,1,'32d07cbee8e074ae8b06f9a5e12b2007bb5764d6b23512dfc7ba692bcf20fe2b','e9b7150be697ebd3bbc3932fe8a52a058cfd7f6c9be37d2485f731e420b139c0',7200,'2012-12-30 00:50:52','2012-12-30 00:43:03','public'),(811,1,1,'bb0640cf0391a6bb2ca13416c14fc70125ab42b0b933ce5f521404496beffce9','314fa1b90353ca6db4d3b630c1e61f407e247e883718a864b0f7bd2ded050816',7200,'2012-12-30 02:00:22','2012-12-30 00:50:52','public'),(821,1,1,'2e1e5105a186050480bbc6dba9c2a75f510d6eb8cf5bc02606bc9cb15cdbc355','58d5e061d96ebb368d27743965bcdfa49e31fc6e168ffca49d51d7d48b36cb8f',7200,'2012-12-30 01:57:25','2012-12-30 01:17:52','public'),(831,1,1,'a5fe18f39db38218cfc60c102805635379110a7b8f52cec81ee2fa5d53842a66','add81638484413c7f2c4b84134089e978f2b6091edcc1de64b93b8bcd1628f8f',7200,'2012-12-30 01:55:47','2012-12-30 01:22:08','public'),(841,1,1,'29e5614a46e2e0439b2c17b52d606dbf1e5178f9eebb3315c35720c4bbb0feb4','4d9ec54b5230f459ec15074e5f626fdafc79a54a22316ddc3e16c99e2b3a3981',7200,'2012-12-30 01:53:37','2012-12-30 01:28:47','public'),(851,1,1,'1ec3bb721f5f83983b258a9888d2bc90f305170ad692a0c498cf1719d8a33bb4','4518f75b46d9f7aa02e03ade37437ec884de4e0401252bba9f9429fd249df5bf',7200,'2012-12-30 02:06:06','2012-12-30 02:00:23','public'),(861,1,1,'702b59b501909a6197b04c62fb9386911ecc71c6f7958cf7982f92aaa89db3c3','bc40a88460d443540588760c4986fa432edcdaa554b2fe9ea92e1b5e1fb953bf',7200,'2012-12-30 03:17:15','2012-12-30 02:06:06','public'),(871,1,1,'8492ce662a82eb0c401bf552569dd8c0421243559f298f2a0da0e44e031fd1cd','6ddf437c23060a2b7b72b0b63585429fc6827ac050f3d966ab349d49de7e1059',7200,'2012-12-30 03:22:13','2012-12-30 03:17:15','public'),(881,1,1,'e5cc4e20ae978c00d34f908559e9865834d7fc96de2abad1b1c150d8ba3eefd3','d042bb8ce8e94d39544e9c63a27e8761d1102e9f7e10de92440eb270ebff4d88',7200,'2012-12-30 03:24:51','2012-12-30 03:22:13','public'),(891,1,1,'06a1cad601cfd6f7dacf07d1b68b2c9e5ceadcb976c9ad8e5bb0498dceab47fb','45ef5ff0843106c56242fb366ca81d91996061a882f5e6e4e3a98f18a802c142',7200,'2012-12-30 03:33:26','2012-12-30 03:24:51','public'),(901,1,1,'7b7eab63ebd628d6ec913f4cc276c72376ace8976931b20a0bfdf575a209eb0d','928178cf3cc247019cecbd7cbd2109ac09c767e5a869e21062122f61b15c88b1',7200,'2012-12-30 03:40:09','2012-12-30 03:33:26','public'),(911,1,1,'c05c888486f2314e992bac30e3029eed4b14002787102a674f855a012963ab43','f9a8a1ef923954347e3a215a1e2500475ce1b106158f99d59dcd71c283a43853',7200,'2012-12-31 00:13:38','2012-12-30 03:40:09','public'),(921,1,1,'7f9d0093bcb1ae341fe67b801ad7f3339f844480064a20fc6c5067d31edc8702','17c6188fe4b250df8692b0a2727ce4d1ed33d6c4ab1ec6b7e542a4de4ff98fa5',7200,'2012-12-31 00:13:38','2012-12-30 23:56:13','public'),(931,1,1,'49d6cdcd14d7d3704f62d2e734ce1d17ed06c683c7455c43e77834e57c11dcbf','c08d367bdd647f8ab31c894625d91f1aad9d231926645f35460a3865ea39fa1b',7200,'2012-12-31 00:15:35','2012-12-31 00:13:38','public'),(941,1,1,'75d72c270fa7d83f0023e487273c7ab5de9d002ad903e126cf4c656ec61b1e81','6fa4f8ddeb020c6dd26aadb78e723c74885fcbd57faac8e71f56fdad7903a6d5',7200,'2012-12-31 00:29:55','2012-12-31 00:15:35','public'),(951,1,1,'d55dab42ee2892ba0f1ac39d60ee1f753d627064e2f6fa66b7fd630fbae23b47','ed3ba0a3a7869f39ae09b753d508ba98b8ce21059620d5319d21e4d72e90c681',7200,'2013-01-04 22:28:45','2012-12-31 00:29:56','public'),(961,11,1,'f31d26652f1cb8d90123af1b6331c62afc09ae17775d1a531ab7abcd5318c4ec','f0ae870014affa490ff6044067d649c9da99af75781b4cf51d6c1a5e6a8b248a',7200,'2013-01-18 17:21:09','2012-12-31 01:35:03','public'),(971,11,1,'2d1b1bc501f96e55751a71e5b9c7504e55bfe2046cec545dea6128fedc5cb09d','70bdb8f88ec1d3d7ba3760f90bb5880d861fbbaf63caaee2d694fe3b2ba93808',7200,'2012-12-31 21:38:57','2012-12-31 01:35:03','public'),(981,11,1,'20d5d784f585e02d22b92245e896fcfa6972cf87f3ffdb763b507125d28fd097','5aa0de64cbebb8588cb49964fda6ee725f733df390425d3485e5917d99ff3702',7200,'2013-01-24 21:09:20','2012-12-31 01:35:03','public'),(991,11,1,'9c91513da19f4a980e979a29fdbfa413b54fba41dbd76ee1e0352c9be590ef0d','0d043327a0344111295ba820071a9cac81c57faa7da2a5e63f94c1934678f788',7200,'2012-12-31 21:38:57','2012-12-31 01:35:04','public'),(1001,11,1,'cd8623887b43a9c3f837c09ccb95c2a072faf65160627a669fb0725bafbe7249','74f6453e4d8a4ef7d3b5201b4ff3587fd21cdd0437a96a1d00715d0daa8f219e',7200,'2013-01-04 18:19:52','2012-12-31 21:38:57','public'),(1011,11,1,'679dcd2f80854c9f7ca763ef7a66ef8588618b133b2ea126626d29444dfb0c2b','7a476d1d9c100bdd2b7d2af2ce6681d6c19c499b239eedfd162c9a53dd68cd25',7200,'2013-01-04 18:13:41','2013-01-02 00:34:25','public'),(1021,11,1,'78c9bee344dccb41d5093f48b0595b7959c40f54e86936c16d64303073eb0446','5ac249f962601bc1fb9bb44ff7d817f706e3ba984339198843d0e0e108b0fb6f',7200,'2013-01-04 18:13:41','2013-01-02 04:51:51','public'),(1031,21,1,'f11be48204faf4a93da4c7f07d9f91df2493f85b716ea5181dbbb7bbdb9d0b9d','57cc69396ab119421434b4ee089bd2edc1552a804abaf1ab0a4866a4e8fbcce5',7200,'2013-01-04 05:27:10','2013-01-04 00:44:32','public'),(1041,21,1,'dee11cd71efe6853e166c6b0d61f291eec088470978d33ca8899290620b0a18f','6ad778e6e1d94e0ce69101c46b25fbccf59b90c6d3a98c92038ef6f0d8451d17',7200,'2013-01-04 20:44:25','2013-01-04 05:27:10','public'),(1051,11,1,'8c47ee4a7ff572a9825e0c1845cc49a75f580cb2eb97cfb66dfc20491b6d623c','7c1c2de3d7615497cf923aebfc08615b6939c41d817a1f11b0c8de8918867842',7200,'2013-01-04 18:19:52','2013-01-04 18:13:41','public'),(1061,11,1,'3f6fe7727cf712bf73c0c95cc214d766adc282df9eb69a5249b708aee893287e','82a2c69442183782c6aa280fa1a55a72b852b104e19a5f43f0e302e19b446b5d',7200,'2013-01-11 23:33:51','2013-01-04 18:19:52','public'),(1071,21,1,'8a27a3c3f796b2740c7e8e10c147755de1e8f760d233d6f77419e5b03ca61695','c560a7ddb199a96061047489f623bb9094b175cc8ddb58497bcc15e23f598a1b',7200,'2013-01-18 07:42:56','2013-01-04 20:44:25','public'),(1081,1,1,'f0a7df089f22121ada20b660639eefcff10c9eccc604b7d5d57ad36b9dd7397a','4f321baac06fe7fd1dc03b334e669aa4c358aac7cff99084252789fb9cdca1ad',7200,'2013-01-04 22:28:44','2013-01-04 21:54:02','public'),(1091,1,1,'d8b1a87a2265cab4bff8dbb81437bc7a75547bdcca3167338b6de4d2c8bd024e','f240ff8b7ff0ac80923947c065ac4da893af1d68ba724e538a104a9040e0ae16',7200,'2013-01-05 21:11:24','2013-01-04 22:28:45','public'),(1101,1,1,'f20396255cb070dbb155a5f593cb081ee4084b7f0c89df4bbbbcb4139b30ccea','a21f7df55f779fcaa24b722e5e471df97df8b322d5f8277716f6729a574cd243',7200,'2013-01-05 21:11:24','2013-01-04 22:45:53','public'),(1111,1,1,'e665c70a8bfef512cb14d4efabb63a06f96e65439cdace8e3b82da60083a1394','1feaa3fd36662e6ec6abc8df9bdb28257383792aa8f852699b301cf318be8e6b',7200,'2013-01-04 22:49:41','2013-01-04 22:45:57','public'),(1121,21,1,'13f190df4e1f95d5189008a78ea93497e615787429780efd2efd475daea34d2b','539d4d81c8017bf11dc9890a98a0939a3f1ff45a930b6ce1345ca84b82f6653f',7200,'2013-01-16 14:42:47','2013-01-05 05:54:13','public'),(1131,1,1,'80fdc627478f14959a7bde39bb63ba9df2184ecb984326da2fc3d9e5c2acce60','ec11444597012483fcee096f22cf8506f195b9a31b7b8b68a81d05872d722658',7200,'2013-01-05 21:27:41','2013-01-05 21:11:24','public'),(1141,1,1,'d2b9f146359c6e025c3c04ae664a6c7c0390b1dc92cf0b2f91b797fc97fbc006','3634af12830b229d697709481df49ba3126a0b469e5dcad8213cbb583593f18b',7200,'2013-01-05 21:30:28','2013-01-05 21:27:41','public'),(1151,1,1,'5fa3d55328cd469fb8710318b9fa00b0a0c9db6f3ae248f1729968d1f9191b6a','78bfc1f285fb513cc736d871fd2924af3ad5bd314b9e7c64319a754e866812c3',7200,'2013-01-05 21:31:58','2013-01-05 21:30:28','public'),(1161,1,1,'6fbfe0504ec1d0ca10aee88bb60418f6a683f1c29a9edf3d80787276396825da','2f03604481bc1c565a09e248f7d8b8d50c39cf0c77078b8ecee4bd37503da115',7200,'2013-01-05 22:06:37','2013-01-05 21:31:59','public'),(1171,1,1,'a78da10b65ddbedf831da3a651d654c7c6588a8da7c8a6a7051db56a903f1fc2','f05346efc8f880676bd2e861efa61673b3ef581927e70337b8a4f9e99030504e',7200,'2013-01-05 22:18:15','2013-01-05 22:06:37','public'),(1181,1,1,'0aa4a148388ea9c905441a063f3e34b658de199d3d6e3d5ea4f258d272b8ff3d','4687a03a6e174d0ef941af3ec04453f216d797264ffef1ebd560aa68581b1ed6',7200,'2013-01-05 22:22:03','2013-01-05 22:18:15','public'),(1191,1,1,'20ba0df00ed01c7f0a056154a93e8730ba552c41a09059a3fb2acb3fac0aee4e','8c18563cfb3afaf5f2d70535f8784630cf3ae3d58971e78e4a241674e9e8ed52',7200,'2013-01-29 16:36:00','2013-01-05 22:22:03','public'),(1201,21,1,'ee0801be746e8717d0d16fc9b03fdc8f4ce4d0e1b50489c688e40276a41ecbe0','a69bb30f01ea26bb369d71e264178dade1ca709315b04142298090ea3a0c868e',7200,'2013-01-11 01:34:51','2013-01-10 01:20:30','public'),(1211,21,1,'1bdc0584423de9302e09729ef85c89373b35dd171439be68cb5535698c91c81d','daeae9bee30acd6780ff64e6706a3c14e2cb9f0aa793aed0f304efbe3a791386',7200,'2013-01-11 01:34:51','2013-01-10 01:20:33','public'),(1221,21,1,'ca913c909cedcddb0c7a2fb482acbca227160786a389790a8b53bc9556728276','563518b8fb5d6caf5b007e4e8372e95632bcddffc4929c2801569e3944097cd3',7200,'2013-01-16 14:42:47','2013-01-11 01:34:51','public'),(1231,11,1,'9ca0aedb0912ba386a3a9952f49c314dad62a56a4974ee8ebc0a3ecac3804638','816f3e18cffeca1c0f172508142c78405079e09b0376871fffab7146b3ddb448',7200,'2013-01-11 23:33:51','2013-01-11 14:41:50','public'),(1241,11,1,'43e5f5a2cc18774ac1972ab82b4079f82f887985712343ebe23d816008346630','649298b8ca971e1ad0de9520cd9156a80cb26c68b0042251ba2384c5b2cea5be',7200,'2013-01-18 17:21:09','2013-01-11 23:33:52','public'),(1251,21,1,'b11eae08541e5b203b316359e0530c9a7afadfe9f71e5c781e595ee8be00b2f9','dd7738a119d9d7b1f50ba15cd419d1402c8308ef564ec7f906ff02a4be4d1303',7200,'2013-01-18 07:42:56','2013-01-16 14:42:48','public'),(1261,21,1,'5ffccf075a7a0a57c2c7fc7ccb1cdfd6b188f7bd50491ec446ef4fe398e0f0d5','5e7947b5afc7df7635e961d1c303e600ada78d05beb610653ec9e65725d44028',7200,'2013-01-19 04:49:58','2013-01-18 07:42:56','public'),(1271,11,1,'21febc856a7fc0c33c2f6b3b54e7ff2486b371267329a99cfbe7ace79d40e3fd','fbfa71c381278cacab5cf9216db8b931f40c926ae73be77fea26d7e4047d226b',7200,'2013-01-24 21:09:19','2013-01-18 17:21:09','public'),(1281,1,1,'183097664e8941cb11a6cb9882a6b9962d0b4226cb78a4749864f45c5fc579a2','a7b3b49b7a7e5cd8346c6837e54c0d2168c0892a76b8c700e8d4ee4745a9db11',7200,'2013-01-29 01:28:59','2013-01-18 23:05:50','public'),(1291,21,1,'df32fcede9deed19782a3dfaaf47a4e7e4d5a64c535dda8389772f4660d0438b','8a9539b8f15718043ebd5b12f2ce32a674c1e7f7e08ddbb2fe33e88c2995c009',7200,'2013-01-21 04:02:12','2013-01-19 04:49:58','public'),(1301,21,1,'3e43d1038685c01b458d8f4e4c61cd6d73eb002e5d132881c21cfa942b3d6712','454f85804de2b51c9509b659878e9616ea5a74db463577a775e5f58230bb08ef',7200,'2013-01-25 19:38:19','2013-01-21 04:02:13','public'),(1311,11,1,'3fb589686a84d81b90cd49ea2e129ed4a7503bffa1a2a4b5371392f0f194503a','316d71a81b6943222404f61a6b456d235539617b278e4f01df9926cb269e0fdd',7200,'2013-01-25 19:44:13','2013-01-24 21:09:20','public'),(1321,21,1,'0d01fe691292a1aa2aaf1bb4119e9d8a45ae4095b57f8507ebc2ca235b97d976','b04c82f573be3da6de902b6e8f0af06bdee5a4f65f302a8dcdd5ea8d2510eaba',7200,NULL,'2013-01-25 19:38:19','public'),(1331,11,1,'1e78afe9bf4f503818bebf2149901d1e1e1a99f97021b501b6e0f3add565e905','97a0e370674519b5f388dc623a7224ea8ef04d9dd7161f097f3e4adfdbcd9867',7200,NULL,'2013-01-25 19:44:13','public'),(1341,11,1,'c1d31b4d95838750ccb6a7ec83140f6d3a085a68bacb7b11841ee77d5d3deb63','17a81322accb0aa821fec9a85d744b0f962a694ae301b03bfd4786f755e4e6aa',7200,'2013-01-27 03:12:56','2013-01-25 21:01:37','public'),(1351,21,1,'2fb02ea9f48e6a6d271002334f4afa18d2713d57a69ec190d1de350fea659abc','065f5270974778d2e7392152bed9cccce425634a1afdf868c459942b69810e3b',7200,NULL,'2013-01-25 23:24:11','public'),(1361,21,1,'ea6ceb0f35dd52b849b44c271d5f2af9bbf96724c71d960002ac7c401eb459c5','465c5d395a55f71473a44cb9099a203542886305d8943f42afa6910f37177850',7200,'2013-01-28 18:42:23','2013-01-26 05:57:43','public'),(1371,21,1,'3b4d434803fc61055406ade2376bacc6caff7f0d1fecc5f3aa570ef3b9b00d29','5ac1fa8c21c81f245a8453051c284d4fc329d1eb9725e749500fce523e549123',7200,'2013-01-28 06:36:24','2013-01-26 05:57:44','public'),(1381,11,1,'9e0480d9afb8250337b665d4139c8ad7a013ad30f87867c0d2ca8a8b453cbafb','e29b15ceefa8046da615b83ff529422a5a2f482ca7f6df5bd5454729b378ca4c',7200,'2013-01-27 03:12:56','2013-01-26 05:58:21','public'),(1391,11,1,'295bc895237111afa60d936f43472d251f94378513c37a363e6e7fc6a02b729c','c714ed2bac4a293ef3d8c0eb6c1e810a3a913b9a5e63f6ebcfdbad4e77b37caf',7200,NULL,'2013-01-27 03:12:56','public'),(1401,11,1,'16aea083cec870bd25187dac79623acab04b38c93a2cbadb66ecebdda01c5199','707517af2b97e83384b8464dc258b465148034bdae417e417d20738fbfd67ee6',7200,NULL,'2013-01-27 21:40:30','public'),(1411,11,1,'00b27fb620ad9607313fe0b0832cca1fbd92012673c0bb3a1a8730bcbcde398a','9670fabc12b031d24eee8ef2208a1fd030bcc1e3f6995f3cada349d601b29b53',7200,NULL,'2013-01-27 22:12:19','public'),(1421,21,1,'49332737766146d23d57cb7d2c5ccf2c7a4f6abd4d3d88d4ef3b3e7128cf33cc','9f3978f632d9093b97e20010741aa9dd914b1a356837fa7aed9f786bcc46e4be',7200,'2013-01-28 06:36:24','2013-01-28 00:48:26','public'),(1431,21,1,'d2f862a2bc173e62275b51f5f8d8b5fed527b696d6b85352a49193a42a75548b','0f343cf4233cbb9e193fa199411439f7689f3fef805b8e4aed180682e48e553c',7200,'2013-01-28 18:42:23','2013-01-28 06:36:24','public'),(1441,11,1,'944881e4134788a755030fb41c1ab92b6eae7cf8dd5033906eb242e647442303','6d287a94c45aa137f386eefb17009c4d3967b9a4b34a4cb0530c76936e6dd352',7200,NULL,'2013-01-28 16:53:33','public'),(1451,11,1,'84ee970ded76724eeb96a33b54cd0603d0db58ad8445f7535cd9ff18b327a610','88874f236813bee524f86dab8839dbcdc417c8a1ff499466a56b0f258f5b6f3f',7200,NULL,'2013-01-28 16:57:46','public'),(1461,21,1,'e07ba218046b326fc1375bffa2484e90563e2a7d61598c29827a20a1f1cc4c3f','fea6967a2ebe10a7b547d583ab84a6eba076774c2f5540b1c2e9656d3e1f41bd',7200,'2013-02-07 17:03:55','2013-01-28 18:42:23','public'),(1471,11,1,'3b464dd90be21c14bfe359122aacdb4fb833e2755e558d2099aebb6a51d6b4b7','822f5c40aa9933616bf5947358bf6f41e026c77debc1926af8483f42dae5286f',7200,NULL,'2013-01-28 20:05:06','public'),(1481,11,1,'8ee1620eb557c63019f8d7ebf57d5be584ae85bf2307e17dfd92864626a541bc','768aa323441bf6dbbc6503a349d8f111db2c0993be6e137d88af7a6ebec14593',7200,NULL,'2013-01-28 20:12:00','public'),(1491,11,1,'6e309f979b6db5fb7ab63636db36e05274f3bffce9721316e1b01407257e975c','0c5f575e13373f630cb3567df5ec6e90531587b8509915e762cbeb2356823761',7200,NULL,'2013-01-28 21:54:33','public'),(1501,1,1,'d5ca279473d833624cd830ae8b979b16017ac606d3cb8827be54343bf18ce096','6131867e29158b7de43b967410ab66ef4a9984d8c5653530e2ac9be2388a749e',7200,'2013-01-29 01:28:59','2013-01-28 22:09:07','public'),(1511,11,1,'fb8426238419e15d41c77660cf53a7a5ecac593a777defdb7c2a7020d9ec40bb','54f8fd7e3555c61a71f887b5a751e62318b9c4f63f497ad6365c8f8660f8e0ab',7200,'2013-01-31 03:43:29','2013-01-28 23:07:43','public'),(1521,21,1,'48d2c93d587b4f03e68c11cfcbbde923cc313a038a0ba77858c6acd73a333460','dcb3f5fa3ebe9d6e277e48d20ba702f2120e7851f046f6ca51853696969a0e3b',7200,'2013-02-07 17:02:46','2013-01-28 23:21:09','public'),(1531,21,1,'da485b52f8e3ac7d6cba126bbfa311c0b58be9726eeaa9557dd8d23d19e4c1d9','c96e089f927e33b34f22ba18d1ea6895f3960a7fc03ba7907eece5b1d6fbf797',7200,'2013-01-29 00:00:13','2013-01-28 23:21:11','public'),(1541,21,1,'d6daf80de3f25486ef4f267e72f38b6cac4d188f4479e38ea96babefdd975285','4f50087967048536b0828aba40dd3b551b250ef1589f2069237b190e6db5d1d2',7200,'2013-01-29 07:04:59','2013-01-29 01:18:37','public'),(1551,1,1,'63829aa5bf312b134abeda35f636852c214e2753e04102e1850b4ee7e81291ca','749f3050f985fcc043005a723955b54e7ccaa5aa2408546456e9d4c9195cb736',7200,'2013-01-29 06:15:22','2013-01-29 01:28:59','public'),(1561,21,1,'66f14251592dd59a2e162d3fee3b5b1c159c8d9ff9663b1c0b1b0d9dd1ad6a18','7fc94138dae89f392927c451139939f3da2d57ddf6f701acf9bc5c3aa2e0c301',7200,'2013-01-29 07:04:59','2013-01-29 01:56:27','public'),(1571,1,1,'96c120847f2e5ea5cb2aea5925428eb082ecd24c534dc43d790d744c51899e67','252f41fd1e9fc0d82a0ee183193061a6aec101f011072f994fa3e2e07e0a2460',7200,'2013-01-29 06:15:22','2013-01-29 01:59:29','public'),(1581,1,1,'6b9011d379012857f879a8de0de63c0d2ae6a3f42bf2f426413b214e9765c59c','260fd33803c58be91fcc16110fc4fff01b5ad3085bc175098f65c6ba81876092',7200,'2013-01-29 16:36:00','2013-01-29 06:15:22','public'),(1591,1,1,'f307e198d0034b8295d37239e2a336693b5a99ce4d0e57600722af231e9822a4','13dc1cc6499a636cafc8318c1d42f62e88531593eff7ff8dc106a3e54c6b63fa',7200,'2013-01-29 06:51:41','2013-01-29 06:19:29','public'),(1601,1,1,'3d07178d98655b6deb34c3cacac085d7f11ff8e8a0b2f14ba1bd1ed947ac8d47','90d6c17d810491f53ee59f0d9a3d5e955cb28e21dfd0d4c11561d9f61ff3df04',7200,'2013-01-29 06:47:14','2013-01-29 06:44:29','public'),(1611,21,1,'98c3abd716095ed7522b2072c17a1af71117e327449c2358a8116c63a728e1a8','b397757f62554460f95b494648f06f2ba4a54feef5a3748e46edddf985960388',7200,'2013-02-07 01:35:20','2013-01-29 07:04:59','public'),(1621,21,1,'5435f447f11852bf47cb1ccebe08c1ab2a5042371112772861f72620d5db85b7','9fbb380b9612880ddb9bb6d9c462bd45d68215441b914480b4b3450990d1ecd6',7200,'2013-02-01 00:14:03','2013-01-29 07:32:39','public'),(1631,1,1,'94fdedcd12e5510f512aae0f72e500f04096437225626db539e2029102cd2c3f','342ca3eaa94a2bd35d20d12751d187e5626fbf39a6459030765a7fd5be105460',7200,'2013-02-01 00:29:25','2013-01-29 16:36:00','public'),(1641,11,1,'32c7e039799cdf28debebbfbacaec7d35900bced5325c948fb7a2644f01a7274','c094afb7ddf6ff31f4b1d7c41ede8e473529816dc57e31ad6926abeccee5aee7',7200,'2013-01-31 03:43:26','2013-01-29 18:05:12','public'),(1651,11,1,'960c600ed9469fecbd8dec432011da392371d091589977d6b2c2a8ab9e1b575a','dcc48aafe2fc056690a61b03379a14d7ba4ac3e7d2c935c693d926f37dc3453c',7200,NULL,'2013-01-31 03:43:29','public'),(1661,11,1,'32bb98244871508036a69b5c804c6290a29f4f15632085e2c2a5fcf81cfb5d2d','e0520a1e185f8e5d1830bea8fcc9cb97f1c394c6aad00feefa8cdb9647b926fd',7200,'2013-02-05 04:41:10','2013-01-31 23:42:05','public'),(1671,21,1,'4072e393649c5bdce5e0e56e8f3402d233fc0473ba993849ed7c80be691c79d7','ea4ca1a6ecce27502e8773ed8223dfe00571a518e7b555dac4dbc17181eec42f',7200,'2013-02-01 00:14:03','2013-02-01 00:06:19','public'),(1681,21,1,'2a91fa1d47dd9c053cd0acea12cbd27f85c68da69f1acddc472ae0e0756cd343','c06c289fe58796d7df75a8a5811e93a05e95baa91aacd0909e8be5062af1b1cf',7200,'2013-02-06 16:41:00','2013-02-01 00:14:03','public'),(1691,11,1,'044f1e6847ffcef617150cf1296bd6d572332a0c3a8e64aa14a49155c3fcbdbf','9d1e38bfecf5039ef7f3472a4f471168299ada4d268f0feb8918b3acafdcd19e',7200,'2013-02-04 19:29:49','2013-02-01 00:15:34','public'),(1701,1,1,'72de8ae094443d5ce26b1a2e70903036cccc52c0bdeb800963f94b3ee6f73190','07807349a0429f226fc7a66f2edfb98768f1d09c24326e3cfd14ecd678c76855',7200,'2013-02-01 00:29:25','2013-02-01 00:21:57','public'),(1711,1,1,'678ed28ae694d6da23df36ac5889c1c7d8fa9b867a8b47b025f8192cca30d555','1e80c2d2496efcb65e6a771934be4a5073634f65c5717a15a47677153377a66d',7200,'2013-02-01 00:34:38','2013-02-01 00:29:25','public'),(1721,1,1,'578f6e1c4beeace7cd5bf9e2460e99beca37668d6f49d5436940e16f5d7c6ba8','6e49e5103144e8a2a8a9e4ec0f4f09056b84028580ea9773d378bede50f3eaa8',7200,'2013-02-01 00:37:33','2013-02-01 00:34:38','public'),(1731,1,1,'c6604e0364c444141328d9e25f2cd1ca68f712cda2048a4dc4dd420469b36df5','0c298e070cf08d97ffe3bc765a451222bc27cb7acdd4e974cb37b4cb06ccb497',7200,'2013-02-01 00:39:37','2013-02-01 00:37:34','public'),(1741,1,1,'4120a0a634042a30df495a7e9c1531a9e5c4f93dcc7435c06d6185db647a67f6','c858d22d0ec9cd1002a15068ef398a8b2ba25fd40e84f48c194c22105028b293',7200,'2013-02-01 00:41:27','2013-02-01 00:39:37','public'),(1751,1,1,'d8b20afdd85d658698b1940dd18368f2cb4d37d6c841bc6f6cb7f5c55abf4312','96c00f0fcdc4443682af2fd8a0a91b43e61f03b5b0c9f925634e116de297d223',7200,'2013-02-01 00:47:50','2013-02-01 00:41:27','public'),(1761,1,1,'fbfe770d62b3e9f1fdce4dc55239e39c76b2e31161de500bc71a91f84eaad98c','fde7b473a8471afbbb7aaff3a83b1941a34b92e2dd866434bf63743cc9059e89',7200,'2013-02-01 01:04:13','2013-02-01 00:47:50','public'),(1771,1,1,'7b6766e36faff78d7218d772ec72de7d18d56f62a5e26fee65da186f3863d52d','671b8c36f40a8db99da6ca2025dc20a57d556712f060d193da2852aadbb56ec1',7200,'2013-02-01 01:16:51','2013-02-01 01:04:13','public'),(1781,1,1,'9f23875d0ae1dbfbef766b40433af53de4e068d5b56cfb88a3b0a60aff93a4d3','0f9c8fb3da7d2e27ab91c60d87036299c7517c869f5743b72f1f1efd9324544b',7200,'2013-02-01 01:29:37','2013-02-01 01:16:51','public'),(1791,1,1,'991d4c29ff9254f1b369053fb8e37d09c484ea9d535739a52dbf123456ee2416','60a45077dc17d6c1772e41c375a639a4fbc1c44c82e8695b5f43e40d574142fc',7200,'2013-02-01 01:40:38','2013-02-01 01:22:51','public'),(1801,1,1,'3500051dd6df791ccc687ae4c800419f966ff6ca4ce26ecaae0fb2a76d6608f9','04d638fc21349240641ffa100950eb293b095bafb217f5dbd1b60499b4131cbe',7200,'2013-02-01 02:06:11','2013-02-01 01:40:39','public'),(1811,1,1,'3b9346b70a1a1d419bab0c67fe9c8b7d7164890095e3c7235bad2de42f4ddbdd','3efa71505f957062ccd62438c5a8b23a91759fa13e5eb2ff7bc755ec36dc6aaa',7200,'2013-02-01 01:53:40','2013-02-01 01:50:14','public'),(1821,1,1,'cb289665bb2213caf13f27870e8284300d05a2306ad12d385c3c3b5438720a74','7533cd9aa628402136ded09c3a15cb1f38d2f85da5991e665cfbba7566368322',7200,'2013-02-01 02:47:30','2013-02-01 02:06:11','public'),(1831,1,1,'fbff6c3f91b6fb358c1d6a86da5d563bde7481083df0c3396ad32a4c316477f5','52403bdb0884cf7e94999e6f3a1e2d4e87bb97702332f1efccdc237973798c11',7200,'2013-02-01 02:46:35','2013-02-01 02:27:05','public'),(1841,1,1,'c4996ad29e1f28bf3ff27a2a4ae30d3aa636c0188d3ebe014cb2a0ba3016ec59','861612a2f135725379230f81272d25b953975f5ebc79e08e26a1bcdfc516da1c',7200,'2013-02-01 02:48:33','2013-02-01 02:47:30','public'),(1851,1,1,'3cf9ff0333a5b3114f93cf21b9a0fb034549aa7d4b0a26e31ff38e48f857f404','43f1c01b4347443d26a1d3f0623ecea00ed3a1bd9990027896073bb9954a0488',7200,'2013-02-01 02:49:34','2013-02-01 02:48:33','public'),(1861,1,1,'905f5ce2215a70f81ef4b35da2f61b19bde01cdb3e57aabc14f8b9b26ebecc45','9479ce21647c262f8b69ce02d1caa80afb403ebad26aae447d244f4719d8b488',7200,'2013-02-01 02:51:13','2013-02-01 02:49:34','public'),(1871,1,1,'1831a9e2885545b11cc9d38956587261ef1a29b4e669893cb5937076bd8abe90','1611205e9293a449e00de264111a87fca681760317415377f07aab8181c20f64',7200,'2013-02-01 02:52:18','2013-02-01 02:51:13','public'),(1881,1,1,'c056cced7ddb3aab51e76870dabecb6e1900d43bdc2eb5777da15c222fe54261','bf7facc04cd79d3b3306cf361888fb83f08549085182c1d0aa71d80dbd012c15',7200,'2013-02-01 02:55:38','2013-02-01 02:52:18','public'),(1891,1,1,'a0d5b4dce933d7a529fd4ca2e52b2e6828460d9c3b67d6e6956c387a6931fbe1','ddc532027ac62da8b17bddc42b8958d3eb11333952060ebc967d0be1212f73dc',7200,'2013-02-01 02:59:32','2013-02-01 02:55:39','public'),(1901,1,1,'b0ebee86c4242b3916bec0942074a1f8822cf9b58b53be3a1431329656ce0e64','e09eb15fe2a0a8b12931c385e3a5b9a4ddda832b45cee3b271ef7144058715f2',7200,'2013-02-01 03:05:03','2013-02-01 02:59:32','public'),(1911,1,1,'4b749a9821d898c382bf8dcd9b01703ef7ace69d3fd73459920bbb2df20052b8','a552215ec4f9b47cb63718d661f510e53320f620f2d0aca5071fab1624056927',7200,'2013-02-01 03:06:31','2013-02-01 03:05:03','public'),(1921,1,1,'fd29efeea0e7f852b13f9640c526c52b78a45f8187d357991f515a4faae738e4','beadaec0cf9a0a14f8d4d16a87bd8aef34fd362067a095ced7f7735b628b387d',7200,'2013-02-01 03:07:39','2013-02-01 03:06:31','public'),(1931,1,1,'7d48260b16d9bbf95c6169509731b364053763fef5d10519d093df03a502b486','e7da43149571e394bb0606fc8b55d45c558633e355c42d2e40c3ded4fc6098f1',7200,'2013-02-01 03:10:16','2013-02-01 03:07:39','public'),(1941,1,1,'17b03807d2c74612575ecba93eb21c71a2699cc0babcf1535ca5f2013588edb8','e783e08dace327a96399f2ee576b8be1626a4f29db5eae77b2a03811a4fc5e88',7200,'2013-02-01 03:14:00','2013-02-01 03:10:16','public'),(1951,1,1,'989b53ea993e9af47473e2d7e45ea647298904e8fc71a5f4c60e4d2b0781d0fe','1cf70c638ce15dc0be2d3e0e01e13e6de7beb14c242826f3bfdc94362ab171d4',7200,'2013-02-01 03:15:00','2013-02-01 03:14:00','public'),(1961,1,1,'f010101b55e0577849ccf5d97a4c9ec9c92a6c37e418b1c15930517642119a1e','099c155b1d0b09a050d891a910513ffcc52c67a8b72aaaf55c0912376f9c2e77',7200,'2013-02-01 03:17:05','2013-02-01 03:15:00','public'),(1971,1,1,'eb6b9a10556aeadaeceaf570f1fcdc481c1b7575f38d3f257aad99bcf8593339','bf733d6dcafba22ab739c26c9fbabd73255b6d5ff64d6c8381cf47febed2ccd1',7200,'2013-02-01 03:18:03','2013-02-01 03:17:05','public'),(1981,1,1,'914b7324bbbac79dd464ddcc68402bd44a8b85cb4ca0f3a03c522f032dc7ef35','f09458e8eb28f41b7324779a682a0625a505766b0d170745f59e8f240a86b495',7200,'2013-02-01 03:21:12','2013-02-01 03:18:03','public'),(1991,1,1,'3f2b7360969cc28e15301f17e7b6f4b1484c1dc83970b4275c5913ad18e03d26','7ec62c71b64ce843dfcfaddb93e06783542141330c7b05cb767fa749af4c6985',7200,'2013-02-01 16:53:23','2013-02-01 03:21:13','public'),(2001,1,1,'d2afc58bf2726c90cd51365902d2a2673cf0195913fff281386d95d23386e2a8','195328edf0b90f6ac12ac381d2662bc2c135d721b1fe4928bec5c8a7c0948a2b',7200,'2013-02-01 16:53:23','2013-02-01 03:29:30','public'),(2011,21,1,'d38ca10e6c744fd7a35dd11523543c8288eae1bb063bab0af37321776c101ba6','6243c7cf25690e5adb211893506882adbc3bc61693af06103eb98476a2347504',7200,'2013-02-05 23:44:56','2013-02-01 05:24:14','public'),(2021,21,1,'d8c1736425d90764feb1beeacb0dcedb40f922b03521c4fbd8601b74032bf13c','0417e14e7a62fe218554d8d26bfe070128f4d55b21d5144c393f311d044c0ad9',7200,'2013-02-05 05:21:29','2013-02-01 05:24:15','public'),(2031,21,1,'2115830605b759032118d77fa326b25306919183305ac745d97a9ae872538f20','e49c4c6f8d59371cdb53e6c1baf4f065416dd8802aa9406513b098aacdd782af',7200,'2013-02-05 05:10:56','2013-02-01 05:24:16','public'),(2041,21,1,'4e50db9dd1404fa440f6b479b53b56dea5e9634a5148fb5a9a7b70eef0344161','69b217c355879359c2010203692fe202f2512f38f4bf9e5a7be4fbe0d327afac',7200,'2013-02-05 04:05:45','2013-02-01 05:24:17','public'),(2051,1,1,'fc9924d4aef68996a851d1d313eef073d4de7ed054e2d4b0349de0b64c4944d4','8a9a3c09e2a06d46c8d32261d2cafc89519a133fd7044f91664384bd61bb7a1a',7200,'2013-02-01 22:12:10','2013-02-01 16:53:23','public'),(2061,11,1,'57799f7a32c779caaf067df8ef85fd3eb11d55c9b563712ce4a35a0647adcc24','fb8c7d6942bc5a015827e893a18522aee63e0d3cd771bb75e60ebcbe33deaa42',7200,'2013-02-03 01:53:26','2013-02-01 21:56:06','public'),(2071,21,1,'d3e0dbe3c5c6fc46860f832d18e61a5afeb8ff986fe2bc85f2d31efcb076db65','13a71339fdb2921e59af30ef9d6af937dd2485971cc187e1423efae81668f218',7200,'2013-02-05 04:05:45','2013-02-01 22:11:45','public'),(2081,1,1,'57e42fa9403a3fe76761afcb77d546639d544ec4825f6ca8ea9eb99af9eb8d36','bfbd613c8478a8e1a786f5a54bc0bb1634d5e27db83a454c2bd871c069f59edc',7200,'2013-02-02 02:24:32','2013-02-01 22:12:11','public'),(2091,11,1,'b16b25df161dedf3235362c95ecbcdd0655136d6a511e82ec1b566958b06b539','a9cf2c7394d4b9cafdbf087ad16da017f61dbbbed1b8c8a5ed8aac48085b6adf',7200,'2013-02-03 01:53:26','2013-02-01 22:14:38','public'),(2101,1,1,'385c2302d33a27ec29c97c6324c68ea3437d967bbd96ee1757566217166e6fb6','5e1feab71393e5ef91036dc916e4927accabd9dbe90ed79af80dd72a3fdee6c6',7200,'2013-02-03 01:19:26','2013-02-02 02:24:32','public'),(2111,1,1,'b6fb3df4e1a2b5b2edc0b4096fb6950490ea8ad29c59cee2f6024be6963c1b1d','bf86a076252e283a406d40a5e14134c151cb956a719ff6ee20acbae6b0479de3',7200,'2013-02-06 21:57:22','2013-02-03 01:19:27','public'),(2121,11,1,'6d5a1609101b3bfc4f4737fc7c8b0a01cd5880f05a0b64825382269dd0aee04d','bc9f3ec084d67b994037a89c20653d122e75fcfee87b63aefb7760db63376660',7200,'2013-02-04 19:29:49','2013-02-03 01:53:26','public'),(2131,11,1,'b3b0bfe871932ff137e7bd8879558a4ef7ee0ab67980769d64a2cd68ee0ff7a8','4dfabc78f57a6bfcd19d5318f2ad9bd3d8aabd61fd721c75f7390af99a5074b3',7200,'2013-02-05 04:41:10','2013-02-04 19:29:49','public'),(2141,21,1,'4f04d6e5e4f7db79143876b6639a73b2f0d0a351ec52e6b4fc073590ac20bc64','425a8061aba30e522cb5bcec06cfdae6ec99da24e54f21337f58aec3fd668c07',7200,'2013-02-05 05:10:56','2013-02-05 04:05:45','public'),(2151,11,1,'c0430e8ca86f73d2ecceb410132535b2f435f0d21497826ea3347b3b78df1f93','237d08e077b2a78e360de008f584e6d5dae9520238ae9e4094c7d594c94d01b1',7200,'2013-02-06 16:38:20','2013-02-05 04:41:10','public'),(2161,21,1,'0ba79999cffb0195c2e643e7f7e04c6121330b975612ab68355ce0fb24e9309c','323fe2447098a280e8fba0b47815d2dd01396918a83233454599675b9b6c64bc',7200,'2013-02-05 05:21:29','2013-02-05 05:10:56','public'),(2171,21,1,'53d55948c886620752bb8ea79475308fb6e5694f573f5e59fd3adeffe66a5bdb','8bde372cad5e5c45bf521d73578814e2c900156c5b19d5b4a9843ae382557fa0',7200,'2013-02-05 23:44:55','2013-02-05 05:21:29','public'),(2181,11,1,'4ae01cdb8480704b4ece8f0c3a05e3eb71db6553be98c0917793b19e7d642ab2','32beb1732495cbefaf038d2404b0ecbdceacf66f73a689a3aec20f667773828e',7200,'2013-02-06 16:37:43','2013-02-05 07:23:36','public'),(2191,11,1,'0d2eb06818497e6ecd55ea12198e672e3dd3e8bba964facd27bc1c76a227798a','21d789fe5af656921443beacc54f2ae45d1b5a1454f66a4a3dd87c5ea1a4479d',7200,'2013-02-06 16:03:44','2013-02-05 07:26:15','public'),(2201,11,1,'d8e96b25df63260550a7fbeb849864e5c0f5bd8deeb46d6d49a5af6903dda873','e2c310c5d98c158e69d4ef194dd5fc90d17deacf71564d193c43017030b2b9f4',7200,'2013-02-06 14:57:31','2013-02-05 23:06:14','public'),(2211,11,1,'2c90e90fc52e141c683352e4e7ab52e21a00507df54760be0d736eed13ca6dcc','03085069924ec6ecbbd25cc0f3f6aa458f296f1c09a2b2a3e79202868cfea379',7200,'2013-02-06 15:23:08','2013-02-05 23:06:14','public'),(2221,21,1,'5e235345f0e4fd5beab4f41e6fbee30b10cc04807b2f91dad2eb378144a7ffd6','487becd7d74cf7b550c300c1ea2ff9ae7d3ff1771ebf5a52ff4e59905a59fefd',7200,'2013-02-06 16:39:45','2013-02-05 23:44:56','public'),(2231,11,1,'d1fb1d2e2e1e04b46ea86df2b9061e60933c2869e0c2e3cd065326d6cf8ce2eb','e47d8b2f6fb54a05b1a7763ae7a49f5632dad9b544f2a4dcd23d71f799121abb',7200,'2013-02-06 14:57:31','2013-02-05 23:46:20','public'),(2241,11,1,'9d132799d13257759ebb5b39806058b210af82f39d73fe2f63465068fdee2d50','b4ce29f7cf2f538a15b5d571f77085421e96e53b9d6a712ebbb78151594b7671',7200,'2013-02-06 15:23:08','2013-02-06 14:57:32','public'),(2251,11,1,'034b5e1098fc131c0810351db953ba35d7d7cc4af71fb5b1309d0e1a85da6736','e0f4ca7a7227f4d0c911b560d64e0faa47a8b2efbccc0271423e27631072eb57',7200,'2013-02-06 16:03:44','2013-02-06 15:23:08','public'),(2261,11,1,'96ed6216c4ee33d906a8c08c383038dc377fad3e4db375ff7cfec48ac706a923','21fd22d833ba3cebfe283182d8f86dc016fc0603f09246084cbbd04f194c541a',7200,'2013-02-06 16:37:43','2013-02-06 16:03:44','public'),(2271,11,1,'7373490b34da790d71526f9e64b38cb46c16fca948797ebacbff8cf3c7a5f524','1e669f21dfe86d3c8c0f1becf5ded8c2854336c7143617af8c588db673879b94',7200,'2013-02-06 16:35:18','2013-02-06 16:11:02','public'),(2281,11,1,'82bb3794d6df2ea42b43fe0c597247d0487b339c1a46c36bfaf3d6e72704ea89','31e61b1a22a484837678d9e655256dd7f4bcd714031f77b9a0c8212cd0b8c048',7200,'2013-02-06 16:33:20','2013-02-06 16:15:45','public'),(2291,11,1,'251cd7f02a0debd2a1e14dd1b2ba337f3f3fd7cc8ccc4ce15ed35738e6e5ff5d','fa8fb6573f4bb255fbf8f073dd031a903d684470c000a12fa05a8572bf380f8f',7200,'2013-02-06 16:32:30','2013-02-06 16:20:05','public'),(2301,11,1,'569fca9f361e403310132ee19b9a871e1e7c90ba8ab84b49a22df28e6d8440eb','5107011b296c032189127eb8022dcd8c8b84020a3b93260c6e31586752d2739a',7200,'2013-02-06 16:38:20','2013-02-06 16:37:43','public'),(2311,11,1,'e458c696e92ca7d5c058af8f729a57927cfa7a4c7e4e936f94b8066a1aa21f0e','b984b4b6562babc474dd1032aadcc5ee32262bf82b686cd223adc5fa5cf4467c',7200,'2013-02-07 01:04:40','2013-02-06 16:38:20','public'),(2321,21,1,'cbde5f489e69e4435d3d97b74df63e82d86efeaee3e410083b8f156286beb814','11bbd2b429fd656e7fdb812dfb77d4416b8f8f040f1a402ef55aa044bd3e5a07',7200,'2013-02-06 16:39:45','2013-02-06 16:38:44','public'),(2331,21,1,'d658b1baf5417db427935c1ef0e52e835dfe5f6fe6005d609e386ca852801ced','93aa83adc00406f488c908b38ff8f80eeea18845f805545352786a5a09efe07e',7200,'2013-02-06 16:41:00','2013-02-06 16:39:45','public'),(2341,21,1,'f22c87cd9c98da831d7b55a36d177cc645a023bdad68362ef3db2743a50f5a24','779e0d1245b1ac6c18a797b1f80df1bfffcd1ab3303b9a7f4d56eb9bda2be568',7200,'2013-02-06 17:45:44','2013-02-06 16:41:00','public'),(2351,11,1,'c9fe7df7e5218fda6b01a48f6c5b83d2ed77c809c133cf8037374b8c8276452b','fa276e89b7b82e3ff9c4c3b5f8a9935fd8cc48576cd9de0fa6c2c82486cdea0a',7200,'2013-02-06 22:14:30','2013-02-06 16:56:22','public'),(2361,21,1,'4607dc104a63ef09c9c20a2d8ec813fb149040ba93d8a56086fc61aeb81b628c','079637d20ac8a6547af34056f7aa311b9009ef89cd252945e427d6a0ceb3039b',7200,'2013-02-06 18:35:30','2013-02-06 17:39:32','public'),(2371,21,1,'23c599d010bf7c9da6aa7377f1e4807a422a2e7e11475e3c8f70b8ff537665b4','c86fbefd1f1b85dc0b4f2f3aaa066d59ce4ebb725a19da21f0aebf61e4638d77',7200,'2013-02-07 01:35:20','2013-02-06 18:06:47','public'),(2381,11,1,'b22a01513fde48ebd5ebc4a5a5e34e9f7b7d5f63de9f39d857ed108d81a9743f','284bef9bf3a263a81ea98303650b88068d41f4687644f525a7a9893c29716028',7200,'2013-02-06 22:14:30','2013-02-06 18:14:44','public'),(2391,1,1,'7ce4a39d2d79530a080575e6e8a1328a400725915dfa47fb792384e59d32bc36','66f4840cd8d38647cfeb31371c786b32c9a95bc8d99609598056a52d63956afe',7200,'2013-02-06 21:57:22','2013-02-06 21:48:32','public'),(2401,1,1,'ee03ebd9223b4da81aa05b0205f039a43df16fa82d4550c995b186a05ab95a79','1876e3ceead25baf9ebae4e922e7fd6b14c8d425f997f7e69952afc2d587c44b',7200,'2013-02-07 16:57:48','2013-02-06 21:57:22','public'),(2411,11,1,'6903f8f20740e5a15cb12bcbf627e2203dcdd0519440e8dc888a80b1a0e93c7f','1684611fd3a4d753238f390963125bb912d18fc469b843a576e041b046f0cec3',7200,'2013-02-07 01:04:40','2013-02-06 22:14:30','public'),(2421,11,1,'b4de9ccbb49f32e4d9904fbbf89f194b7b86ed8b3739625136cd2cc495ec7d9d','2bbe9f8fbb93e8b9ad2c3bc12af76d2e5f05b031b180f44538c8bc7060596c86',7200,NULL,'2013-02-07 01:04:40','public'),(2431,21,1,'f7e9c43c46093d5a1e19dd6cc6a426ef35633d6689eddb251f9c187e03a00deb','5ca941d5f65754c1dc04fdfe5f90611894dcfa96da1f44d2f503bf2c88855fcc',7200,'2013-02-07 17:01:49','2013-02-07 01:35:20','public'),(2441,1,1,'7cf21b0b886e4d9178748a3c7a249e49566e40e79a762f4f52137076d81fc1be','f6739d6ad2cf5158b0b962f348f0b95807b8758aa30f81490e7695601392f664',7200,NULL,'2013-02-07 16:57:48','public'),(2451,21,1,'fb36746446a72c0dee91cf8ee87bacfdf269f62b46ed3dc8776ab72d9f2fd36f','0014ceadacee7c93a087b0fd2599515a76bde19b97a31d0fe86e326ea02fea3d',7200,'2013-02-07 17:01:49','2013-02-07 16:58:05','public'),(2461,21,1,'e985d25df99e60fef56846df1848acafac92c6036391a8a8f9aabcaa28f6388a','6e679da928a2036507fc5f4ddac83c60e4288f73e7dbdd514f11170b60ef4a4b',7200,'2013-02-07 17:02:46','2013-02-07 17:01:49','public'),(2471,21,1,'fd58c03f4ef350c3fcee82639f2e7d2e900abbd4d0cbc63efb84e6444143ff64','89a11e5eda5ab6b9a0e1e24e5e5e93cd900147eb4158fdc486a5fe90840da1dc',7200,'2013-02-07 17:03:55','2013-02-07 17:02:46','public'),(2481,21,1,'073a75a73cb22ec0dd16bf3e59ac2571fac82a7b4a5e56539cf28e9c31911a64','00484615ef40680036b20ff10b6f1b74c508a6fc0ab78a366cbe543f2c7a89d4',7200,NULL,'2013-02-07 17:03:55','public'),(2491,21,1,'a5ca02cdde667a4fb59cef398bb4ac5be7c01fefb39592a05d1d456216ab90fd','e70d8e11dc877236a10cba50d6135562c971b1489e04191b1735f64bf59b37a8',7200,NULL,'2013-02-07 18:20:19','public'),(2501,11,1,'af7cb9d682fe0ab8d70c589e138c61c395523764cc09f74ceb17efaa63e6a5c1','daaf21dff73e87cada77d2c876e18c957fadd9beeec62d1098da400d5dc2eee3',7200,NULL,'2013-02-07 18:21:49','public');
/*!40000 ALTER TABLE `oauth_access_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth_applications`
--

DROP TABLE IF EXISTS `oauth_applications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oauth_applications` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `uid` varchar(255) NOT NULL,
  `secret` varchar(255) NOT NULL,
  `redirect_uri` varchar(255) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_oauth_applications_on_uid` (`uid`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth_applications`
--

LOCK TABLES `oauth_applications` WRITE;
/*!40000 ALTER TABLE `oauth_applications` DISABLE KEYS */;
INSERT INTO `oauth_applications` VALUES (1,'Boomr App','8cd24b771e68bd2cee4e409921808b0cdccc0402d2ee0d006d36c2239a43486c','cf01026ab0f16b725c6e328910d24b906b06a4569a59a14d78134adc0e75f36c','http://app.boomr.com','2012-10-10 14:23:03','2012-10-10 14:23:03');
/*!40000 ALTER TABLE `oauth_applications` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `observations`
--

DROP TABLE IF EXISTS `observations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `observations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `label` varchar(255) DEFAULT NULL,
  `weight` int(11) DEFAULT '0',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=231 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `observations`
--

LOCK TABLES `observations` WRITE;
/*!40000 ALTER TABLE `observations` DISABLE KEYS */;
INSERT INTO `observations` VALUES (1,'3lb weight gain in 24 hrs ',0,'2013-01-31 23:17:57','2013-01-31 23:17:57'),(11,'5lb weight gain in 1 week ',0,'2013-01-31 23:18:07','2013-01-31 23:18:07'),(21,'Shortness of breath',0,'2013-01-31 23:18:15','2013-01-31 23:18:15'),(31,'New swelling or weakness in extremities',0,'2013-01-31 23:18:29','2013-01-31 23:18:29'),(41,'Water pill not working',0,'2013-01-31 23:18:40','2013-01-31 23:18:40'),(51,'Persistent cough',0,'2013-01-31 23:18:54','2013-01-31 23:18:54'),(61,'Green colored mucus',0,'2013-01-31 23:19:07','2013-01-31 23:19:07'),(71,'Fever or chills ',0,'2013-01-31 23:19:16','2013-01-31 23:19:16'),(81,'Difficulty breathing',0,'2013-01-31 23:19:27','2013-01-31 23:19:27'),(91,'Chest pain or tightness ',0,'2013-01-31 23:19:37','2013-01-31 23:19:37'),(101,'Fatigue ',0,'2013-01-31 23:19:45','2013-01-31 23:19:45'),(111,'Increased or irregular heartbeat',0,'2013-01-31 23:19:56','2013-01-31 23:19:56'),(121,'Sweating ',0,'2013-01-31 23:20:04','2013-01-31 23:20:04'),(131,'Nausea',0,'2013-01-31 23:20:12','2013-01-31 23:20:12'),(141,'Blood sugar of 200 mg/dL or greater',0,'2013-01-31 23:20:48','2013-01-31 23:20:48'),(151,'Blood sugar 70 mg/dL or less',0,'2013-01-31 23:21:00','2013-01-31 23:21:00'),(161,'Sore or wound not healing',0,'2013-01-31 23:21:13','2013-01-31 23:21:13'),(171,'Poor vision',0,'2013-01-31 23:21:24','2013-01-31 23:21:24'),(181,'Poor Balance',0,'2013-01-31 23:21:43','2013-01-31 23:21:43'),(191,'Incontinence ',0,'2013-01-31 23:21:56','2013-01-31 23:21:56'),(201,'Improper use of assistive devices',0,'2013-01-31 23:22:07','2013-01-31 23:22:07'),(211,'Abnormal gait',0,'2013-01-31 23:22:16','2013-01-31 23:22:16'),(221,'Polypharmacy',0,'2013-01-31 23:22:26','2013-01-31 23:22:26');
/*!40000 ALTER TABLE `observations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `patient_statuses`
--

DROP TABLE IF EXISTS `patient_statuses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `patient_statuses` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `label` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `weight` int(11) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=191 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `patient_statuses`
--

LOCK TABLES `patient_statuses` WRITE;
/*!40000 ALTER TABLE `patient_statuses` DISABLE KEYS */;
INSERT INTO `patient_statuses` VALUES (71,'Alert','2013-01-04 22:48:07','2013-01-04 22:48:07',0),(81,'Oriented','2013-01-04 22:48:07','2013-01-04 22:48:07',0),(91,'Forgetful','2013-01-04 22:48:07','2013-01-04 22:48:07',0),(101,'Confused','2013-01-04 22:48:07','2013-01-04 22:48:07',0),(111,'Lethargic','2013-01-04 22:48:07','2013-01-04 22:48:07',0),(121,'Agitated','2013-01-04 22:48:07','2013-01-04 22:48:07',0),(131,'Anxious/Restless','2013-01-04 22:48:08','2013-01-04 22:48:08',0),(141,'Cooperative','2013-01-04 22:48:08','2013-01-04 22:48:08',0),(151,'Combative','2013-01-04 22:48:08','2013-01-04 22:48:08',0),(161,'Hard of Hearing','2013-01-04 22:48:08','2013-01-04 22:48:08',0),(171,'Poor Vision','2013-01-04 22:48:08','2013-01-04 22:48:08',0),(181,'Emergency','2013-01-04 22:48:08','2013-01-04 22:48:08',0);
/*!40000 ALTER TABLE `patient_statuses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payroll_batches`
--

DROP TABLE IF EXISTS `payroll_batches`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `payroll_batches` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `agency_id` int(11) DEFAULT NULL,
  `batch_date` datetime DEFAULT NULL,
  `notes` text,
  `period_start` date DEFAULT NULL,
  `period_end` date DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `status` varchar(255) DEFAULT 'pending',
  `exported` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payroll_batches`
--

LOCK TABLES `payroll_batches` WRITE;
/*!40000 ALTER TABLE `payroll_batches` DISABLE KEYS */;
/*!40000 ALTER TABLE `payroll_batches` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payroll_line_items`
--

DROP TABLE IF EXISTS `payroll_line_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `payroll_line_items` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `payroll_batch_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `pay_status` int(11) NOT NULL DEFAULT '0',
  `regular_hours_worked` decimal(11,2) DEFAULT '0.00',
  `overtime_hours_worked` decimal(11,2) DEFAULT '0.00',
  `overtime_rate` decimal(11,2) DEFAULT '0.00',
  `pay_rate` decimal(11,2) DEFAULT '0.00',
  `original_pay_rate` decimal(11,2) DEFAULT '0.00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payroll_line_items`
--

LOCK TABLES `payroll_line_items` WRITE;
/*!40000 ALTER TABLE `payroll_line_items` DISABLE KEYS */;
/*!40000 ALTER TABLE `payroll_line_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `photos`
--

DROP TABLE IF EXISTS `photos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `photos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `care_recipient_id` int(11) DEFAULT NULL,
  `note_id` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `photo_file_name` varchar(255) DEFAULT NULL,
  `photo_content_type` varchar(255) DEFAULT NULL,
  `photo_file_size` int(11) DEFAULT NULL,
  `photo_updated_at` datetime DEFAULT NULL,
  `visit_id` int(11) DEFAULT NULL,
  `caption` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=501 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `photos`
--

LOCK TABLES `photos` WRITE;
/*!40000 ALTER TABLE `photos` DISABLE KEYS */;
INSERT INTO `photos` VALUES (1,1,NULL,NULL,'2012-12-06 19:05:01','2012-12-06 19:05:01','Photo_on_12-27-11_at_9.54_PM.jpg','image/jpeg',161863,'2012-12-06 19:05:00',NULL,NULL),(11,1,1,NULL,'2012-12-08 22:04:13','2012-12-08 22:04:13','14ef01e0.jpeg','image/jpeg',53566,'2012-12-08 22:04:11',61,NULL),(21,1,1,NULL,'2012-12-08 22:19:42','2012-12-08 22:19:42','1a9afa00.jpeg','image/jpeg',53566,'2012-12-08 22:19:41',91,NULL),(31,1,1,NULL,'2012-12-08 22:21:21','2012-12-08 22:21:21','f81bd00.jpeg','image/jpeg',227522,'2012-12-08 22:21:19',101,NULL),(41,1,1,81,'2012-12-08 22:50:41','2012-12-08 22:50:41','f7e2c50.jpeg','image/jpeg',4282425,'2012-12-08 22:50:36',141,NULL),(51,1,1,NULL,'2012-12-08 22:51:29','2012-12-08 22:51:29','de4bbf0.jpeg','image/jpeg',150959,'2012-12-08 22:51:28',141,NULL),(61,21,1,91,'2012-12-08 23:42:49','2012-12-08 23:42:49','f8e7ac0.jpeg','image/jpeg',4427160,'2012-12-08 23:42:45',161,NULL),(71,1,1,101,'2012-12-09 03:49:21','2012-12-09 03:49:21','5dc600.jpeg','image/jpeg',249805,'2012-12-09 03:49:21',171,NULL),(81,11,11,111,'2012-12-09 18:21:19','2012-12-09 18:21:19','e2c4b40.jpeg','image/jpeg',2531145,'2012-12-09 18:21:13',181,NULL),(91,11,11,NULL,'2012-12-09 18:23:25','2012-12-09 18:23:25','e2f7fa0.jpeg','image/jpeg',3551024,'2012-12-09 18:23:23',181,NULL),(101,11,NULL,NULL,'2012-12-09 18:24:59','2012-12-09 18:24:59','33f290.jpeg','image/jpeg',2723979,'2012-12-09 18:24:57',NULL,NULL),(111,21,31,NULL,'2013-01-05 06:08:18','2013-01-05 06:08:18','25a3a4d0.jpeg','image/jpeg',3769482,'2013-01-05 06:08:12',441,NULL),(121,21,31,NULL,'2013-01-05 06:10:15','2013-01-05 06:10:15','259da9c0.jpeg','image/jpeg',3769482,'2013-01-05 06:10:11',451,NULL),(131,21,NULL,NULL,'2013-01-05 06:14:33','2013-01-05 06:14:33','20c53630.jpeg','image/jpeg',4968032,'2013-01-05 06:14:24',NULL,NULL),(141,21,31,NULL,'2013-01-10 01:21:51','2013-01-10 01:21:51','232b4740.jpeg','image/jpeg',375095,'2013-01-10 01:21:50',501,NULL),(151,11,11,NULL,'2013-01-11 14:45:59','2013-01-11 14:45:59','259f6dd0.jpeg','image/jpeg',872447,'2013-01-11 14:45:58',521,NULL),(161,1,NULL,NULL,'2013-01-29 06:43:42','2013-01-29 06:43:42',NULL,NULL,NULL,NULL,NULL,NULL),(171,11,NULL,NULL,'2013-02-01 00:18:39','2013-02-01 00:18:39',NULL,NULL,NULL,NULL,NULL,NULL),(181,11,NULL,NULL,'2013-02-01 00:19:13','2013-02-01 00:19:13',NULL,NULL,NULL,NULL,NULL,NULL),(191,1,111,NULL,'2013-02-01 01:17:35','2013-02-01 01:17:35','16b73fc0.jpeg','image/jpeg',845903,'2013-02-01 01:17:33',751,NULL),(201,1,1,NULL,'2013-02-01 01:23:25','2013-02-01 01:23:25','23c61330.jpeg','image/jpeg',222117,'2013-02-01 01:23:23',761,NULL),(211,1,NULL,NULL,'2013-02-01 01:24:13','2013-02-01 01:24:13','280390c0.jpeg','image/jpeg',3917676,'2013-02-01 01:24:05',NULL,NULL),(221,1,NULL,NULL,'2013-02-01 01:25:42','2013-02-01 01:25:42','1f003300.jpeg','image/jpeg',549137,'2013-02-01 01:25:40',NULL,NULL),(231,1,111,NULL,'2013-02-01 01:30:26','2013-02-01 01:30:26','b64b530.jpeg','image/jpeg',789839,'2013-02-01 01:30:20',771,NULL),(241,1,111,NULL,'2013-02-01 01:30:59','2013-02-01 01:30:59','1ef6ca70.jpeg','image/jpeg',845903,'2013-02-01 01:30:52',771,NULL),(251,1,111,NULL,'2013-02-01 01:41:09','2013-02-01 01:41:09','16ba8a00.jpeg','image/jpeg',845903,'2013-02-01 01:41:07',781,NULL),(261,1,111,NULL,'2013-02-01 01:41:46','2013-02-01 01:41:46','a5256a0.jpeg','image/jpeg',102254,'2013-02-01 01:41:44',781,NULL),(271,1,1,NULL,'2013-02-01 01:50:55','2013-02-01 01:50:55','26aa0bc0.jpeg','image/jpeg',235868,'2013-02-01 01:50:53',791,NULL),(281,1,1,NULL,'2013-02-01 01:51:23','2013-02-01 01:51:23','269295c0.jpeg','image/jpeg',1735582,'2013-02-01 01:51:19',791,NULL),(291,1,1,NULL,'2013-02-01 03:30:01','2013-02-01 03:30:01','2257bac0.jpeg','image/jpeg',239354,'2013-02-01 03:29:59',831,NULL),(301,1,1,NULL,'2013-02-01 03:30:43','2013-02-01 03:30:43','2686dab0.jpeg','image/jpeg',3409952,'2013-02-01 03:30:36',831,NULL),(311,1,1,NULL,'2013-02-01 16:54:35','2013-02-01 16:54:35','233d9c60.jpeg','image/jpeg',224719,'2013-02-01 16:54:33',851,NULL),(321,11,91,NULL,'2013-02-01 22:01:46','2013-02-01 22:01:46','24266c50.jpeg','image/jpeg',3434960,'2013-02-01 22:01:42',861,NULL),(331,11,91,NULL,'2013-02-01 22:02:45','2013-02-01 22:02:45','24164b60.jpeg','image/jpeg',2647024,'2013-02-01 22:02:39',861,NULL),(341,21,31,NULL,'2013-02-01 22:38:56','2013-02-01 22:38:56','24965970.jpeg','image/jpeg',3284365,'2013-02-01 22:38:52',871,NULL),(351,21,31,NULL,'2013-02-01 22:46:04','2013-02-01 22:46:04','24b6ee30.jpeg','image/jpeg',3551402,'2013-02-01 22:46:00',871,NULL),(361,21,31,NULL,'2013-02-01 22:49:22','2013-02-01 22:49:22','1f553ae0.jpeg','image/jpeg',3174763,'2013-02-01 22:49:15',871,NULL),(371,1,1,NULL,'2013-02-02 02:26:30','2013-02-02 02:26:30','233a2c40.jpeg','image/jpeg',4300822,'2013-02-02 02:26:18',881,NULL),(381,21,81,NULL,'2013-02-05 04:07:28','2013-02-05 04:07:28','229ee290.jpeg','image/jpeg',4668969,'2013-02-05 04:07:22',901,NULL),(391,21,81,NULL,'2013-02-05 04:11:20','2013-02-05 04:11:20','20514960.jpeg','image/jpeg',3920169,'2013-02-05 04:11:13',901,NULL),(401,11,91,NULL,'2013-02-05 23:08:12','2013-02-05 23:08:12','249b6f90.jpeg','image/jpeg',3434960,'2013-02-05 23:07:51',941,NULL),(411,11,91,NULL,'2013-02-05 23:09:45','2013-02-05 23:09:45','24a12230.jpeg','image/jpeg',3434960,'2013-02-05 23:09:32',941,NULL),(421,11,91,NULL,'2013-02-05 23:54:18','2013-02-05 23:54:18','2191bf50.jpeg','image/jpeg',3434960,'2013-02-05 23:54:03',961,NULL),(431,11,11,NULL,'2013-02-06 14:58:51','2013-02-06 14:58:51','238221e0.jpeg','image/jpeg',2647024,'2013-02-06 14:58:46',1051,NULL),(441,11,11,NULL,'2013-02-06 15:04:30','2013-02-06 15:04:30','238e1390.jpeg','image/jpeg',4200077,'2013-02-06 15:04:11',1051,NULL),(451,11,11,NULL,'2013-02-06 15:42:24','2013-02-06 15:42:24','22988be0.jpeg','image/jpeg',3052511,'2013-02-06 15:42:15',1191,NULL),(461,11,91,NULL,'2013-02-06 16:04:30','2013-02-06 16:04:30','24966b50.jpeg','image/jpeg',872447,'2013-02-06 16:04:28',1251,NULL),(471,11,11,NULL,'2013-02-06 17:21:35','2013-02-06 17:21:35','2164a020.jpeg','image/jpeg',2647024,'2013-02-06 17:21:29',1271,NULL),(481,11,91,NULL,'2013-02-06 22:28:51','2013-02-06 22:28:51','2414a020.jpeg','image/jpeg',2647024,'2013-02-06 22:28:37',1351,NULL),(491,11,91,NULL,'2013-02-07 01:08:36','2013-02-07 01:08:36','1dd73400.jpeg','image/jpeg',3434960,'2013-02-07 01:08:19',1361,NULL);
/*!40000 ALTER TABLE `photos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `roles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(40) DEFAULT NULL,
  `authorizable_type` varchar(40) DEFAULT NULL,
  `authorizable_id` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (1,'administrator',NULL,NULL,'2012-09-14 00:30:38','2012-09-14 00:30:38'),(11,'caregiver',NULL,NULL,'2012-11-26 17:24:11','2012-11-26 17:24:11'),(21,'agency_staff',NULL,NULL,'2012-12-31 20:11:44','2012-12-31 20:11:44'),(31,'agency_administrator',NULL,NULL,'2012-12-31 20:48:34','2012-12-31 20:48:34');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles_users`
--

DROP TABLE IF EXISTS `roles_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `roles_users` (
  `user_id` int(11) DEFAULT NULL,
  `role_id` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles_users`
--

LOCK TABLES `roles_users` WRITE;
/*!40000 ALTER TABLE `roles_users` DISABLE KEYS */;
INSERT INTO `roles_users` VALUES (1,1,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(21,1,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(11,1,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1,11,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(11,11,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(21,11,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(31,21,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1,21,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(11,21,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(21,21,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1,31,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(11,31,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(21,31,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(31,31,'0000-00-00 00:00:00','0000-00-00 00:00:00');
/*!40000 ALTER TABLE `roles_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `schema_migrations`
--

DROP TABLE IF EXISTS `schema_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `schema_migrations` (
  `version` varchar(255) NOT NULL,
  UNIQUE KEY `unique_schema_migrations` (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `schema_migrations`
--

LOCK TABLES `schema_migrations` WRITE;
/*!40000 ALTER TABLE `schema_migrations` DISABLE KEYS */;
INSERT INTO `schema_migrations` VALUES ('20120906225853'),('20120906231215'),('20120906231518'),('20120907224913'),('20120914001648'),('20120914003439'),('20120914004314'),('20120914004507'),('20120914004519'),('20120914004607'),('20120914023625'),('20121115005927'),('20121115220755'),('20121115222424'),('20121115223748'),('20121115230238'),('20121115231848'),('20121116181744'),('20121121164057'),('20121128175329'),('20121128175359'),('20121128185235'),('20121206162844'),('20121206183920'),('20121206220200'),('20121206220218'),('20121206220913'),('20121206224255'),('20121207213153'),('20121207221103'),('20121211004326'),('20121215172318'),('20121215181749'),('20121215182313'),('20121218214046'),('20121218214114'),('20121218214148'),('20121221005642'),('20121221011000'),('20121221011018'),('20121221011916'),('20121221012105'),('20121221012243'),('20121221012621'),('20121224171220'),('20130107165526'),('20130110223908'),('20130110225032'),('20130110230035'),('20130110233154'),('20130111011824'),('20130116160106'),('20130117223419'),('20130117230404'),('20130117231548'),('20130117233704'),('20130117233929'),('20130117234017'),('20130117234634'),('20130118011010'),('20130118234010'),('20130122002549'),('20130124232826'),('20130124234047'),('20130124235932'),('20130125000413'),('20130125000449'),('20130125072049'),('20130125073446'),('20130125193657'),('20130129225114'),('20130129232048'),('20130129233949'),('20130130011428'),('20130201232401'),('20130204214206'),('20130204214633'),('20130205003853'),('20130205232756'),('20130206000536'),('20130206002348'),('20130206004913');
/*!40000 ALTER TABLE `schema_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subscription_tiers`
--

DROP TABLE IF EXISTS `subscription_tiers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `subscription_tiers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `label` varchar(255) DEFAULT NULL,
  `monthly_fee` decimal(11,2) DEFAULT '0.00',
  `max_users` int(11) DEFAULT '0',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `description` text,
  `visible` tinyint(1) DEFAULT '1',
  `active` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subscription_tiers`
--

LOCK TABLES `subscription_tiers` WRITE;
/*!40000 ALTER TABLE `subscription_tiers` DISABLE KEYS */;
INSERT INTO `subscription_tiers` VALUES (1,'Free Subscription',0.00,10,'2012-12-27 19:08:34','2013-01-17 23:36:07',NULL,0,1),(11,'Starter Package ',25.00,5,'2012-12-27 19:10:59','2012-12-27 19:10:59',NULL,1,1),(21,'Small-Business Package',100.00,25,'2012-12-27 19:11:17','2012-12-27 19:11:17',NULL,1,1),(31,'Medium-Business Package',350.00,100,'2012-12-27 19:11:53','2012-12-27 19:11:53',NULL,1,1),(41,'Big-Business Package',600.00,200,'2012-12-27 19:12:12','2012-12-27 19:12:12',NULL,1,1);
/*!40000 ALTER TABLE `subscription_tiers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(255) NOT NULL DEFAULT '',
  `encrypted_password` varchar(255) NOT NULL DEFAULT '',
  `first_name` varchar(255) DEFAULT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  `date_of_birth` datetime DEFAULT NULL,
  `gender` varchar(255) DEFAULT NULL,
  `reset_password_token` varchar(255) DEFAULT NULL,
  `reset_password_sent_at` datetime DEFAULT NULL,
  `remember_created_at` datetime DEFAULT NULL,
  `sign_in_count` int(11) DEFAULT '0',
  `current_sign_in_at` datetime DEFAULT NULL,
  `last_sign_in_at` datetime DEFAULT NULL,
  `current_sign_in_ip` varchar(255) DEFAULT NULL,
  `last_sign_in_ip` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `profile_photo_file_name` varchar(255) DEFAULT NULL,
  `profile_photo_content_type` varchar(255) DEFAULT NULL,
  `profile_photo_file_size` int(11) DEFAULT NULL,
  `profile_photo_updated_at` datetime DEFAULT NULL,
  `agency_id` int(11) DEFAULT NULL,
  `settings` text,
  `default_pay_rate` decimal(11,2) DEFAULT '0.00',
  `middle_name` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `sms` varchar(255) DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT '1',
  `deleted` tinyint(1) DEFAULT '0',
  `location_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_users_on_email` (`email`),
  UNIQUE KEY `index_users_on_reset_password_token` (`reset_password_token`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'noah@boomr.com','$2a$10$h1dAMz5mPcNq13TnMioF.egYJuR8YxIGwn1/RMZDZqtYwRuvUaK8u','Noah','Lively','1983-09-08 00:00:00','M',NULL,NULL,NULL,38,'2013-02-07 01:21:33','2013-02-06 22:01:28','66.60.178.106','66.60.178.106','2012-09-14 00:23:30','2013-02-07 01:21:33','1e09ae70.jpeg','image/jpeg',231305,'2013-02-01 01:53:04',1,'--- !map:ActiveSupport::HashWithIndifferentAccess {}\n\n',19.00,'Gardner','(916) 220-4717','(916) 220-4715',1,0,NULL),(11,'tim@boomr.com','$2a$10$WZ7s6O9roRQlli/itPw05ODvGBc8UJ5e/FWQrw41Te00jpI5Tb3DC','Tim','Suski',NULL,'M',NULL,NULL,NULL,33,'2013-02-06 16:06:11','2013-02-04 21:14:54','66.60.178.106','24.94.28.74','2012-11-09 01:12:12','2013-02-06 22:01:21','2401ec50.jpeg','image/jpeg',2990287,'2013-02-01 22:00:02',11,'--- !map:ActiveSupport::HashWithIndifferentAccess {}\n\n',22.00,'James','8583548931','',1,0,81),(21,'matt@boomr.com','$2a$10$6LwFo0FHa6/Kn74y.2RTYeQImWfV3rOz.2jG/dW9n5kgZ4Xl4pS2u','Matt','Bowersox',NULL,'M',NULL,NULL,'2013-01-06 20:13:20',34,'2013-02-07 18:30:27','2013-02-07 02:28:37','173.13.178.157','98.207.152.57','2012-11-09 01:12:33','2013-02-07 18:30:27','24af42c0.jpeg','image/jpeg',348133,'2013-02-01 22:14:04',1,'--- !map:ActiveSupport::HashWithIndifferentAccess {}\n\n',21.00,'','','',1,0,NULL),(31,'katej.fielding@gmail.com','$2a$10$Tn5wodbaNxkHQYj9FOZf5eH4n1BlpaHQIcNCi4MF00RXfSuJgKg/W','Kathy','Fielding',NULL,'',NULL,NULL,'2013-01-11 00:07:44',14,'2013-01-14 18:36:21','2013-01-14 17:28:46','66.60.178.106','66.60.178.106','2012-12-27 19:04:08','2013-01-14 18:36:21',NULL,NULL,NULL,NULL,11,'--- !map:ActiveSupport::HashWithIndifferentAccess {}\n\n',18.00,'','','',1,0,NULL);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `visits`
--

DROP TABLE IF EXISTS `visits`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `visits` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `in_time` datetime DEFAULT NULL,
  `out_time` datetime DEFAULT NULL,
  `approved` tinyint(1) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `care_recipient_id` int(11) DEFAULT NULL,
  `location_id` int(11) DEFAULT NULL,
  `agency_id` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `bill_rate` decimal(11,2) DEFAULT '0.00',
  `pay_rate` decimal(11,2) DEFAULT '0.00',
  `approved_by_user_id` int(11) DEFAULT NULL,
  `payroll_line_item_id` int(11) DEFAULT NULL,
  `billable` tinyint(1) NOT NULL DEFAULT '1',
  `break_minutes` int(11) DEFAULT '0',
  `duration_minutes` int(11) DEFAULT '0',
  `billable_duration_minutes` int(11) DEFAULT '0',
  `guid` varchar(255) DEFAULT NULL,
  `client_invoice_line_item_id` int(11) DEFAULT NULL,
  `adjustments` decimal(11,2) DEFAULT '0.00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1391 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `visits`
--

LOCK TABLES `visits` WRITE;
/*!40000 ALTER TABLE `visits` DISABLE KEYS */;
INSERT INTO `visits` VALUES (971,'2013-01-15 21:00:00','2013-01-16 03:36:00',1,11,91,101,11,'2013-02-06 05:33:21','2013-02-06 17:58:01',20.00,22.00,NULL,NULL,1,0,395,395,'a45050f0-524c-0130-a61d-12313d2fe86e',NULL,0.00),(981,'2013-01-15 16:00:00','2013-01-15 19:00:00',1,11,91,101,11,'2013-02-06 14:48:16','2013-02-06 17:58:00',20.00,22.00,NULL,NULL,1,0,180,180,'2a115660-529a-0130-a61d-12313d2fe86e',NULL,0.00),(991,'2013-01-17 12:00:00','2013-01-15 17:00:00',0,11,11,21,11,'2013-02-06 14:50:22','2013-02-06 14:50:22',35.00,22.00,NULL,NULL,1,0,-2580,-2580,'74ef83c0-529a-0130-3382-12313d141deb',NULL,0.00),(1001,'2013-01-17 18:00:00','2013-01-17 21:00:00',0,11,31,91,11,'2013-02-06 14:52:37','2013-02-06 14:52:37',0.00,22.00,NULL,NULL,1,0,180,180,'c5d00fc0-529a-0130-a61d-12313d2fe86e',NULL,0.00),(1011,'2013-01-18 13:00:00','2013-01-18 17:00:00',0,11,91,81,11,'2013-02-06 14:53:15','2013-02-06 14:53:15',20.00,22.00,NULL,NULL,1,0,240,240,'dc524640-529a-0130-a61d-12313d2fe86e',NULL,0.00),(1021,'2013-01-18 21:00:00','2013-01-19 02:00:00',0,11,11,21,11,'2013-02-06 14:54:09','2013-02-06 14:54:09',35.00,22.00,NULL,NULL,1,0,300,300,'fc348140-529a-0130-a61d-12313d2fe86e',NULL,0.00),(1031,'2013-01-19 15:00:00','2013-01-19 19:00:00',0,11,31,91,11,'2013-02-06 14:55:23','2013-02-06 14:55:23',0.00,22.00,NULL,NULL,1,0,240,240,'2864f190-529b-0130-3382-12313d141deb',NULL,0.00),(1041,'2013-01-20 16:00:00','2013-01-20 21:00:00',0,11,91,81,11,'2013-02-06 14:57:20','2013-02-06 14:57:20',20.00,22.00,NULL,NULL,1,0,300,300,'6df74f70-529b-0130-a61d-12313d2fe86e',NULL,0.00),(1051,'2013-02-06 14:58:46','2013-02-06 15:08:41',NULL,11,11,21,11,'2013-02-06 14:58:46','2013-02-06 15:08:41',35.00,22.00,NULL,NULL,1,0,10,10,'a13a0b80-529b-0130-a61d-12313d2fe86e',NULL,0.00),(1061,'2013-01-20 21:00:00','2013-01-21 00:00:00',0,11,31,91,11,'2013-02-06 14:59:04','2013-02-06 14:59:04',0.00,22.00,NULL,NULL,1,0,180,180,'ac3fd420-529b-0130-a61d-12313d2fe86e',NULL,0.00),(1071,'2013-01-21 17:00:00','2013-01-21 22:00:00',0,11,11,21,11,'2013-02-06 14:59:50','2013-02-06 14:59:50',35.00,22.00,NULL,NULL,1,0,300,300,'c77ec070-529b-0130-3382-12313d141deb',NULL,0.00),(1081,'2013-02-03 12:00:00','2013-02-03 16:00:00',1,11,91,101,11,'2013-02-06 15:05:42','2013-02-06 17:34:41',20.00,22.00,NULL,NULL,1,0,240,240,'99566510-529c-0130-a61d-12313d2fe86e',NULL,0.00),(1091,'2013-02-03 15:00:00','2013-02-03 19:00:00',1,11,11,21,11,'2013-02-06 15:06:14','2013-02-06 17:56:58',35.00,22.00,NULL,NULL,1,0,240,240,'ac87d170-529c-0130-3382-12313d141deb',NULL,0.00),(1101,'2013-02-03 16:00:00','2013-02-03 21:00:00',1,21,31,91,11,'2013-02-06 15:07:36','2013-02-07 01:03:05',0.00,21.00,NULL,NULL,1,0,300,300,'dd32d540-529c-0130-3382-12313d141deb',NULL,0.00),(1111,'2013-02-03 16:00:00','2013-02-03 21:00:00',1,21,11,21,11,'2013-02-06 15:11:51','2013-02-07 01:02:44',35.00,21.00,NULL,NULL,1,0,300,300,'75676d10-529d-0130-3382-12313d141deb',NULL,0.00),(1121,'2013-02-03 21:00:00','2013-02-04 00:00:00',1,11,91,101,11,'2013-02-06 15:12:24','2013-02-07 01:03:06',20.00,22.00,NULL,NULL,1,0,180,180,'88ee2af0-529d-0130-a61d-12313d2fe86e',NULL,0.00),(1131,'2013-02-04 12:00:00','2013-02-04 16:00:00',0,1,1,11,11,'2013-02-06 15:13:15','2013-02-06 15:13:15',30.00,19.00,NULL,NULL,1,0,240,240,'a794e280-529d-0130-3382-12313d141deb',NULL,0.00),(1141,'2013-02-04 19:00:00','2013-02-04 23:00:00',1,11,91,101,11,'2013-02-06 15:13:46','2013-02-06 17:55:44',20.00,22.00,NULL,NULL,1,0,240,240,'b9b5b5e0-529d-0130-3382-12313d141deb',NULL,0.00),(1151,'2013-02-04 22:00:00','2013-02-05 02:00:00',0,11,91,81,11,'2013-02-06 15:19:49','2013-02-06 15:19:49',20.00,22.00,NULL,NULL,1,0,240,240,'9208f050-529e-0130-a61d-12313d2fe86e',NULL,0.00),(1161,'2013-02-05 13:00:00','2013-02-05 16:15:00',0,21,21,51,11,'2013-02-06 15:20:36','2013-02-06 15:20:36',22.50,21.00,NULL,NULL,1,0,195,195,'ae1533b0-529e-0130-3382-12313d141deb',NULL,0.00),(1171,'2013-02-05 17:00:00','2013-02-05 21:15:00',0,11,11,21,11,'2013-02-06 15:21:26','2013-02-06 15:21:26',35.00,22.00,NULL,NULL,1,0,255,255,'cc665050-529e-0130-3382-12313d141deb',NULL,0.00),(1181,'2013-02-05 18:00:00','2013-02-05 22:00:00',0,1,1,71,11,'2013-02-06 15:22:15','2013-02-06 15:22:15',30.00,19.00,NULL,NULL,1,0,240,240,'e915f170-529e-0130-a61d-12313d2fe86e',NULL,0.00),(1191,'2013-02-06 15:23:41','2013-02-06 15:52:46',NULL,11,11,21,11,'2013-02-06 15:23:41','2013-02-06 15:52:46',35.00,22.00,NULL,NULL,1,0,30,30,'1c5b5480-529f-0130-3382-12313d141deb',NULL,0.00),(1201,'2013-02-04 14:00:00','2013-02-04 18:00:00',0,21,21,91,11,'2013-02-06 15:25:26','2013-02-06 15:25:26',22.50,21.00,NULL,NULL,1,0,240,240,'5b0e0170-529f-0130-a61d-12313d2fe86e',NULL,0.00),(1211,'2013-02-04 19:00:00','2013-02-04 22:00:00',0,1,1,11,11,'2013-02-06 15:26:48','2013-02-06 15:26:48',30.00,19.00,NULL,NULL,1,0,180,180,'8c2c88b0-529f-0130-a61d-12313d2fe86e',NULL,0.00),(1221,'2013-02-05 17:00:00','2013-02-05 22:00:00',0,11,91,101,11,'2013-02-06 15:27:52','2013-02-06 15:27:52',20.00,22.00,NULL,NULL,1,0,300,300,'b24eea00-529f-0130-a61d-12313d2fe86e',NULL,0.00),(1231,'2013-02-05 21:00:00','2013-02-06 00:00:00',0,21,11,21,11,'2013-02-06 15:28:45','2013-02-06 15:28:45',35.00,21.00,NULL,NULL,1,0,180,180,'d1f0e730-529f-0130-3382-12313d141deb',NULL,0.00),(1241,'2013-02-05 22:00:00','2013-02-06 01:00:00',0,1,21,91,11,'2013-02-06 15:40:35','2013-02-06 15:40:35',22.50,19.00,NULL,NULL,1,0,180,180,'78e923d0-52a1-0130-a61d-12313d2fe86e',NULL,0.00),(1251,'2013-02-06 16:04:28','2013-02-06 16:10:39',NULL,11,91,101,11,'2013-02-06 16:04:28','2013-02-06 16:10:39',20.00,22.00,NULL,NULL,1,0,5,5,'cf294710-52a4-0130-a61d-12313d2fe86e',NULL,0.00),(1261,'2013-02-06 16:39:00',NULL,NULL,21,111,121,1,'2013-02-06 16:39:00','2013-02-06 16:39:00',22.00,21.00,NULL,NULL,1,0,0,0,'a1f7d230-52a9-0130-3382-12313d141deb',NULL,0.00),(1271,'2013-02-06 16:58:32','2013-02-06 17:30:05',1,11,11,21,11,'2013-02-06 16:58:32','2013-02-06 17:51:09',35.00,22.00,NULL,NULL,1,0,30,30,'5c96fbe0-52ac-0130-3382-12313d141deb',NULL,0.00),(1281,'2013-02-06 17:39:55','2013-02-06 17:48:43',1,21,81,91,1,'2013-02-06 17:39:56','2013-02-06 17:50:46',19.45,21.00,NULL,NULL,1,0,5,5,'257e4a30-52b2-0130-6d64-123138092e6e',271,0.00),(1291,'2013-02-06 20:03:18',NULL,NULL,21,131,141,1,'2013-02-06 20:03:20','2013-02-06 20:03:20',22.00,21.00,NULL,NULL,1,0,0,0,'2d977560-52c6-0130-02b8-1231381a9963',NULL,0.00),(1301,'2013-02-06 20:04:46',NULL,NULL,11,11,21,11,'2013-02-06 20:04:49','2013-02-06 20:04:49',35.00,22.00,NULL,NULL,1,0,0,0,'62e3e390-52c6-0130-33d9-1231381092b9',NULL,0.00),(1311,'2013-02-06 21:57:48',NULL,NULL,1,111,121,1,'2013-02-06 21:57:49','2013-02-06 21:57:49',22.00,19.00,NULL,NULL,1,0,0,0,'2bf859b0-52d6-0130-6c4b-12313b0333bc',NULL,0.00),(1321,'2013-02-06 21:58:07',NULL,NULL,1,111,121,1,'2013-02-06 21:58:08','2013-02-06 21:58:08',22.00,19.00,NULL,NULL,1,0,0,0,'3760d370-52d6-0130-881a-22000a918b55',NULL,0.00),(1331,'2013-02-06 22:01:02','2013-02-06 22:01:39',NULL,1,111,121,1,'2013-02-06 22:01:03','2013-02-06 22:01:39',22.00,19.00,NULL,NULL,1,0,0,0,'9f7f4f10-52d6-0130-5e5c-12313920956b',NULL,0.00),(1341,'2013-02-06 22:01:53',NULL,NULL,1,111,121,1,'2013-02-06 22:01:53','2013-02-06 22:01:53',22.00,19.00,NULL,NULL,1,0,0,0,'bd375b70-52d6-0130-5e5c-12313920956b',NULL,0.00),(1351,'2013-02-06 22:14:55','2013-02-06 22:30:54',NULL,11,91,101,11,'2013-02-06 22:14:55','2013-02-06 22:30:54',20.00,22.00,NULL,NULL,1,0,15,15,'8f489180-52d8-0130-5e5c-12313920956b',NULL,0.00),(1361,'2013-02-07 01:05:02','2013-02-07 01:15:13',NULL,11,91,101,11,'2013-02-07 01:05:04','2013-02-07 01:15:13',20.00,22.00,NULL,NULL,1,0,10,10,'54351af0-52f0-0130-e0d5-123139183019',NULL,0.00),(1371,'2013-02-07 02:25:03','2013-02-07 02:42:03',1,21,81,91,1,'2013-02-07 02:25:04','2013-02-07 02:43:52',19.45,21.00,NULL,NULL,1,0,15,15,'8170d9c0-52fb-0130-1283-12313d1a667a',NULL,0.00),(1381,'2013-02-07 18:20:33',NULL,NULL,21,21,31,1,'2013-02-07 18:20:35','2013-02-07 18:20:35',22.50,21.00,NULL,NULL,1,0,0,0,'fd264ae0-5380-0130-7a55-123139081f32',NULL,0.00);
/*!40000 ALTER TABLE `visits` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `visits_caregiver_tasks`
--

DROP TABLE IF EXISTS `visits_caregiver_tasks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `visits_caregiver_tasks` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `visit_id` int(11) DEFAULT NULL,
  `caregiver_task_id` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1861 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `visits_caregiver_tasks`
--

LOCK TABLES `visits_caregiver_tasks` WRITE;
/*!40000 ALTER TABLE `visits_caregiver_tasks` DISABLE KEYS */;
INSERT INTO `visits_caregiver_tasks` VALUES (1301,981,231,'2013-02-06 14:48:16','2013-02-06 14:48:16'),(1311,981,221,'2013-02-06 14:48:16','2013-02-06 14:48:16'),(1321,981,211,'2013-02-06 14:48:16','2013-02-06 14:48:16'),(1331,991,241,'2013-02-06 14:50:22','2013-02-06 14:50:22'),(1341,991,231,'2013-02-06 14:50:22','2013-02-06 14:50:22'),(1351,1051,141,'2013-02-06 14:58:46','2013-02-06 14:58:46'),(1361,1051,91,'2013-02-06 14:58:46','2013-02-06 14:58:46'),(1371,1051,191,'2013-02-06 14:58:46','2013-02-06 14:58:46'),(1381,1051,131,'2013-02-06 14:58:46','2013-02-06 14:58:46'),(1391,1051,201,'2013-02-06 15:02:53','2013-02-06 15:02:53'),(1401,1051,211,'2013-02-06 15:02:53','2013-02-06 15:02:53'),(1411,1191,231,'2013-02-06 15:23:41','2013-02-06 15:23:41'),(1421,1191,111,'2013-02-06 15:23:41','2013-02-06 15:23:41'),(1431,1191,241,'2013-02-06 15:23:41','2013-02-06 15:23:41'),(1441,1191,221,'2013-02-06 15:23:41','2013-02-06 15:23:41'),(1451,1191,201,'2013-02-06 15:41:14','2013-02-06 15:41:14'),(1461,1191,211,'2013-02-06 15:41:14','2013-02-06 15:41:14'),(1471,1191,151,'2013-02-06 15:41:14','2013-02-06 15:41:14'),(1481,1251,141,'2013-02-06 16:04:28','2013-02-06 16:04:28'),(1491,1251,91,'2013-02-06 16:04:28','2013-02-06 16:04:28'),(1501,1251,191,'2013-02-06 16:04:28','2013-02-06 16:04:28'),(1511,1251,131,'2013-02-06 16:04:28','2013-02-06 16:04:28'),(1521,1261,181,'2013-02-06 16:39:00','2013-02-06 16:39:00'),(1531,1271,141,'2013-02-06 16:58:32','2013-02-06 16:58:32'),(1541,1271,91,'2013-02-06 16:58:32','2013-02-06 16:58:32'),(1551,1271,81,'2013-02-06 16:58:32','2013-02-06 16:58:32'),(1561,1271,101,'2013-02-06 17:12:43','2013-02-06 17:12:43'),(1571,1271,201,'2013-02-06 17:12:43','2013-02-06 17:12:43'),(1581,1281,91,'2013-02-06 17:39:57','2013-02-06 17:39:57'),(1591,1281,141,'2013-02-06 17:39:57','2013-02-06 17:39:57'),(1601,1281,81,'2013-02-06 17:39:57','2013-02-06 17:39:57'),(1611,1291,141,'2013-02-06 20:03:20','2013-02-06 20:03:20'),(1621,1291,91,'2013-02-06 20:03:20','2013-02-06 20:03:20'),(1631,1291,81,'2013-02-06 20:03:20','2013-02-06 20:03:20'),(1641,1301,141,'2013-02-06 20:04:50','2013-02-06 20:04:50'),(1651,1301,91,'2013-02-06 20:04:50','2013-02-06 20:04:50'),(1661,1311,81,'2013-02-06 21:57:50','2013-02-06 21:57:50'),(1671,1321,81,'2013-02-06 21:58:08','2013-02-06 21:58:08'),(1681,1331,81,'2013-02-06 22:01:03','2013-02-06 22:01:03'),(1691,1341,81,'2013-02-06 22:01:53','2013-02-06 22:01:53'),(1701,1341,91,'2013-02-06 22:01:53','2013-02-06 22:01:53'),(1711,1351,141,'2013-02-06 22:14:55','2013-02-06 22:14:55'),(1721,1351,91,'2013-02-06 22:14:55','2013-02-06 22:14:55'),(1731,1351,81,'2013-02-06 22:14:55','2013-02-06 22:14:55'),(1741,1351,131,'2013-02-06 22:16:26','2013-02-06 22:16:26'),(1751,1351,201,'2013-02-06 22:28:00','2013-02-06 22:28:00'),(1761,1351,211,'2013-02-06 22:28:00','2013-02-06 22:28:00'),(1771,1361,141,'2013-02-07 01:05:04','2013-02-07 01:05:04'),(1781,1361,91,'2013-02-07 01:05:04','2013-02-07 01:05:04'),(1791,1361,81,'2013-02-07 01:05:04','2013-02-07 01:05:04'),(1801,1361,161,'2013-02-07 01:15:01','2013-02-07 01:15:01'),(1811,1361,131,'2013-02-07 01:15:01','2013-02-07 01:15:01'),(1821,1371,181,'2013-02-07 02:25:04','2013-02-07 02:25:04'),(1831,1371,131,'2013-02-07 02:25:04','2013-02-07 02:25:04'),(1841,1381,91,'2013-02-07 18:20:35','2013-02-07 18:20:35'),(1851,1381,181,'2013-02-07 18:20:35','2013-02-07 18:20:35');
/*!40000 ALTER TABLE `visits_caregiver_tasks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `visits_observations`
--

DROP TABLE IF EXISTS `visits_observations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `visits_observations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `visit_id` int(11) DEFAULT NULL,
  `observation_id` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=881 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `visits_observations`
--

LOCK TABLES `visits_observations` WRITE;
/*!40000 ALTER TABLE `visits_observations` DISABLE KEYS */;
INSERT INTO `visits_observations` VALUES (421,981,221,'2013-02-06 14:48:16','2013-02-06 14:48:16'),(431,981,211,'2013-02-06 14:48:16','2013-02-06 14:48:16'),(441,991,201,'2013-02-06 14:48:16','2013-02-06 14:50:22'),(451,991,221,'2013-02-06 14:50:22','2013-02-06 14:50:22'),(461,991,211,'2013-02-06 14:50:22','2013-02-06 14:50:22'),(471,991,201,'2013-02-06 14:50:22','2013-02-06 14:50:22'),(481,991,191,'2013-02-06 14:50:22','2013-02-06 14:50:22'),(491,1051,11,'2013-02-06 14:58:46','2013-02-06 14:58:46'),(501,1051,91,'2013-02-06 14:58:46','2013-02-06 14:58:46'),(511,1051,81,'2013-02-06 14:58:46','2013-02-06 14:58:46'),(521,1191,21,'2013-02-06 15:23:41','2013-02-06 15:23:41'),(531,1191,171,'2013-02-06 15:23:41','2013-02-06 15:23:41'),(541,1191,181,'2013-02-06 15:23:41','2013-02-06 15:23:41'),(551,1191,211,'2013-02-06 15:41:23','2013-02-06 15:41:23'),(561,1191,11,'2013-02-06 15:41:23','2013-02-06 15:41:23'),(571,1251,81,'2013-02-06 16:04:28','2013-02-06 16:04:28'),(581,1251,141,'2013-02-06 16:04:28','2013-02-06 16:04:28'),(591,1251,151,'2013-02-06 16:04:28','2013-02-06 16:04:28'),(601,1271,91,'2013-02-06 16:58:32','2013-02-06 16:58:32'),(611,1271,141,'2013-02-06 16:58:32','2013-02-06 16:58:32'),(621,1271,61,'2013-02-06 17:12:54','2013-02-06 17:12:54'),(631,1271,201,'2013-02-06 17:12:54','2013-02-06 17:12:54'),(641,1281,1,'2013-02-06 17:39:57','2013-02-06 17:39:57'),(651,1281,211,'2013-02-06 17:39:57','2013-02-06 17:39:57'),(661,1281,11,'2013-02-06 17:39:57','2013-02-06 17:39:57'),(671,1291,1,'2013-02-06 20:03:20','2013-02-06 20:03:20'),(681,1291,11,'2013-02-06 20:03:20','2013-02-06 20:03:20'),(691,1291,211,'2013-02-06 20:03:20','2013-02-06 20:03:20'),(701,1341,151,'2013-02-06 22:01:59','2013-02-06 22:01:59'),(711,1341,211,'2013-02-06 22:01:59','2013-02-06 22:01:59'),(721,1351,1,'2013-02-06 22:14:55','2013-02-06 22:14:55'),(731,1351,11,'2013-02-06 22:14:55','2013-02-06 22:14:55'),(741,1351,211,'2013-02-06 22:14:55','2013-02-06 22:14:55'),(751,1361,141,'2013-02-07 01:05:04','2013-02-07 01:05:04'),(761,1361,91,'2013-02-07 01:05:04','2013-02-07 01:05:04'),(771,1371,1,'2013-02-07 02:25:05','2013-02-07 02:25:05'),(781,1371,11,'2013-02-07 02:25:05','2013-02-07 02:25:05'),(791,1371,211,'2013-02-07 02:25:05','2013-02-07 02:25:05'),(801,1371,151,'2013-02-07 02:25:05','2013-02-07 02:25:05'),(811,1371,91,'2013-02-07 02:25:05','2013-02-07 02:25:05'),(821,1371,141,'2013-02-07 02:25:05','2013-02-07 02:25:05'),(831,1371,81,'2013-02-07 02:25:05','2013-02-07 02:25:05'),(841,1371,51,'2013-02-07 02:25:05','2013-02-07 02:25:05'),(851,1371,221,'2013-02-07 02:25:05','2013-02-07 02:25:05'),(861,1371,181,'2013-02-07 02:25:05','2013-02-07 02:25:05'),(871,1371,31,'2013-02-07 02:25:05','2013-02-07 02:25:05');
/*!40000 ALTER TABLE `visits_observations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `visits_patient_statuses`
--

DROP TABLE IF EXISTS `visits_patient_statuses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `visits_patient_statuses` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `visit_id` int(11) DEFAULT NULL,
  `patient_status_id` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1561 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `visits_patient_statuses`
--

LOCK TABLES `visits_patient_statuses` WRITE;
/*!40000 ALTER TABLE `visits_patient_statuses` DISABLE KEYS */;
INSERT INTO `visits_patient_statuses` VALUES (1081,981,181,'2013-02-06 14:48:16','2013-02-06 14:48:16'),(1091,991,181,'2013-02-06 14:50:22','2013-02-06 14:50:22'),(1101,1051,121,'2013-02-06 14:58:46','2013-02-06 14:58:46'),(1111,1051,131,'2013-02-06 14:58:46','2013-02-06 14:58:46'),(1121,1051,151,'2013-02-06 14:58:46','2013-02-06 14:58:46'),(1131,1051,141,'2013-02-06 15:03:05','2013-02-06 15:03:05'),(1141,1051,81,'2013-02-06 15:03:05','2013-02-06 15:03:05'),(1151,1191,91,'2013-02-06 15:23:41','2013-02-06 15:23:41'),(1161,1191,161,'2013-02-06 15:23:41','2013-02-06 15:23:41'),(1171,1191,131,'2013-02-06 15:41:18','2013-02-06 15:41:18'),(1181,1191,71,'2013-02-06 15:41:18','2013-02-06 15:41:18'),(1191,1251,141,'2013-02-06 16:04:28','2013-02-06 16:04:28'),(1201,1251,101,'2013-02-06 16:04:28','2013-02-06 16:04:28'),(1211,1251,151,'2013-02-06 16:04:28','2013-02-06 16:04:28'),(1221,1261,131,'2013-02-06 16:39:00','2013-02-06 16:39:00'),(1231,1271,151,'2013-02-06 16:58:32','2013-02-06 16:58:32'),(1241,1271,101,'2013-02-06 16:58:32','2013-02-06 16:58:32'),(1251,1271,111,'2013-02-06 17:12:49','2013-02-06 17:12:49'),(1261,1271,81,'2013-02-06 17:12:49','2013-02-06 17:12:49'),(1271,1281,131,'2013-02-06 17:39:57','2013-02-06 17:39:57'),(1281,1281,71,'2013-02-06 17:39:57','2013-02-06 17:39:57'),(1291,1281,121,'2013-02-06 17:39:57','2013-02-06 17:39:57'),(1301,1291,121,'2013-02-06 20:03:20','2013-02-06 20:03:20'),(1311,1291,71,'2013-02-06 20:03:20','2013-02-06 20:03:20'),(1321,1291,131,'2013-02-06 20:03:20','2013-02-06 20:03:20'),(1331,1301,101,'2013-02-06 20:04:50','2013-02-06 20:04:50'),(1341,1301,151,'2013-02-06 20:04:50','2013-02-06 20:04:50'),(1351,1311,151,'2013-02-06 21:57:50','2013-02-06 21:57:50'),(1361,1311,101,'2013-02-06 21:57:50','2013-02-06 21:57:50'),(1371,1321,151,'2013-02-06 21:58:08','2013-02-06 21:58:08'),(1381,1321,101,'2013-02-06 21:58:08','2013-02-06 21:58:08'),(1391,1331,151,'2013-02-06 22:01:04','2013-02-06 22:01:04'),(1401,1331,101,'2013-02-06 22:01:04','2013-02-06 22:01:04'),(1411,1341,101,'2013-02-06 22:01:53','2013-02-06 22:01:53'),(1421,1351,121,'2013-02-06 22:14:55','2013-02-06 22:14:55'),(1431,1351,131,'2013-02-06 22:14:55','2013-02-06 22:14:55'),(1441,1351,151,'2013-02-06 22:14:55','2013-02-06 22:14:55'),(1451,1361,141,'2013-02-07 01:05:04','2013-02-07 01:05:04'),(1461,1361,111,'2013-02-07 01:15:07','2013-02-07 01:15:07'),(1471,1361,81,'2013-02-07 01:15:07','2013-02-07 01:15:07'),(1481,1371,121,'2013-02-07 02:25:04','2013-02-07 02:25:04'),(1491,1371,71,'2013-02-07 02:25:04','2013-02-07 02:25:04'),(1501,1371,131,'2013-02-07 02:25:05','2013-02-07 02:25:05'),(1511,1371,151,'2013-02-07 02:25:05','2013-02-07 02:25:05'),(1521,1371,181,'2013-02-07 02:25:05','2013-02-07 02:25:05'),(1531,1371,101,'2013-02-07 02:25:05','2013-02-07 02:25:05'),(1541,1371,141,'2013-02-07 02:25:05','2013-02-07 02:25:05'),(1551,1381,141,'2013-02-07 18:20:35','2013-02-07 18:20:35');
/*!40000 ALTER TABLE `visits_patient_statuses` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2013-02-07 11:09:54
