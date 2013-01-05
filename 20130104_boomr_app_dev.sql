-- MySQL dump 10.13  Distrib 5.5.27, for osx10.7 (i386)
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
) ENGINE=InnoDB AUTO_INCREMENT=281 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `activity_streams`
--

LOCK TABLES `activity_streams` WRITE;
/*!40000 ALTER TABLE `activity_streams` DISABLE KEYS */;
INSERT INTO `activity_streams` VALUES (1,11,1,1,'check_in','Noah Lively checked in',NULL,'2012-12-11 00:57:13','2012-12-27 19:04:58'),(11,11,1,1,'check_in','Noah Lively checked in',NULL,'2012-12-11 00:57:18','2012-12-27 19:04:58'),(21,11,1,1,'check_in','Noah Lively checked in with Mitch Harcourt',NULL,'2012-12-11 01:36:33','2012-12-27 19:04:58'),(31,11,1,1,'check_out','Noah Lively checked out with Mitch Harcourt',NULL,'2012-12-11 01:36:42','2012-12-27 19:04:58'),(41,11,21,1,'check_in','Matt Bowersox checked in with Mitch Harcourt',NULL,'2012-12-12 01:57:33','2012-12-27 19:04:58'),(51,11,21,1,'check_out','Matt Bowersox checked out with Mitch Harcourt',NULL,'2012-12-12 01:57:36','2012-12-27 19:04:58'),(61,11,21,31,'check_in','Matt Bowersox checked in with Kathy Fielding',NULL,'2012-12-12 01:57:49','2012-12-27 19:04:58'),(71,11,11,11,'check_in','Tim Suski checked in with Jeff Sternberg',NULL,'2012-12-12 05:45:27','2012-12-27 19:04:58'),(81,11,11,11,'check_out','Tim Suski checked out with Jeff Sternberg',NULL,'2012-12-12 05:45:41','2012-12-27 19:04:58'),(91,11,21,31,'check_in','Matt Bowersox checked in with Kathy Fielding',NULL,'2012-12-12 05:47:47','2012-12-27 19:04:58'),(101,11,21,31,'note','Matt Bowersox added a note',NULL,'2012-12-12 05:48:35','2012-12-27 19:04:58'),(111,11,21,31,'check_out','Matt Bowersox checked out with Kathy Fielding',NULL,'2012-12-12 05:49:00','2012-12-27 19:04:58'),(121,1,1,1,'check_in','Noah Lively checked in with Mitch Harcourt',NULL,'2012-12-30 00:43:17','2012-12-30 00:43:17'),(131,1,1,1,'check_in','Noah Lively checked in with Mitch Harcourt',NULL,'2012-12-30 00:51:06','2012-12-30 00:51:06'),(141,1,1,1,'check_in','Noah Lively checked in with Mitch Harcourt',NULL,'2012-12-30 01:35:46','2012-12-30 01:35:46'),(151,1,1,1,'check_in','Noah Lively checked in with Mitch Harcourt',NULL,'2012-12-30 03:30:13','2012-12-30 03:30:13'),(161,11,11,11,'check_in','Tim Suski checked in with Jeff Sternberg',NULL,'2012-12-31 01:37:31','2012-12-31 01:37:31'),(171,11,11,11,'check_in','Tim Suski checked in with Jeff Sternberg',NULL,'2012-12-31 21:39:15','2012-12-31 21:39:15'),(181,11,11,11,'check_out','Tim Suski checked out with Jeff Sternberg',NULL,'2012-12-31 21:39:27','2012-12-31 21:39:27'),(191,11,11,11,'check_in','Tim Suski checked in with Jeff Sternberg',NULL,'2013-01-02 00:34:54','2013-01-02 00:34:54'),(201,11,11,11,'check_out','Tim Suski checked out with Jeff Sternberg',NULL,'2013-01-02 00:36:45','2013-01-02 00:36:45'),(211,11,11,11,'check_in','Tim Suski checked in with Jeff Sternberg',NULL,'2013-01-02 04:51:52','2013-01-02 04:51:52'),(221,11,11,11,'check_in','Tim Suski checked in with Jeff Sternberg',NULL,'2013-01-02 04:51:53','2013-01-02 04:51:53'),(231,11,11,11,'check_in','Tim Suski checked in with Jeff Sternberg',NULL,'2013-01-02 04:51:53','2013-01-02 04:51:53'),(241,11,11,11,'check_in','Tim Suski checked in with Jeff Sternberg',NULL,'2013-01-02 04:51:54','2013-01-02 04:51:54'),(251,11,11,11,'check_in','Tim Suski checked in with Jeff Sternberg',NULL,'2013-01-02 04:51:54','2013-01-02 04:51:54'),(261,11,11,11,'check_out','Tim Suski checked out with Jeff Sternberg',NULL,'2013-01-02 04:52:05','2013-01-02 04:52:05'),(271,1,1,1,'check_in','Noah Lively checked in with Mitch Harcourt',NULL,'2013-01-04 22:49:57','2013-01-04 22:49:57');
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
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `agencies`
--

LOCK TABLES `agencies` WRITE;
/*!40000 ALTER TABLE `agencies` DISABLE KEYS */;
INSERT INTO `agencies` VALUES (1,'Boomr Test Agency',NULL,'','','','2012-12-08 01:21:38','2012-12-27 19:34:07','','',NULL,NULL,NULL,NULL,'','',NULL,NULL,NULL),(11,'Good Life Companions',41,'Kathy Fielding','','katej.fielding@gmail.com','2012-12-27 19:04:58','2012-12-27 19:12:31','','8316462046',1,1,NULL,NULL,'','',NULL,NULL,0);
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
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=71 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `care_recipients`
--

LOCK TABLES `care_recipients` WRITE;
/*!40000 ALTER TABLE `care_recipients` DISABLE KEYS */;
INSERT INTO `care_recipients` VALUES (1,'Mitch','Harcourt','1940-12-05 00:00:00',11,'2012-12-06 18:55:05','2013-01-01 01:22:33','images.jpg','image/jpeg',5927,'2013-01-01 01:22:32',11,30.00),(11,'Jeff','Sternberg','1970-12-04 00:00:00',21,'2012-12-08 01:21:25','2013-01-01 01:22:34','jeff-sternberg.jpg','image/jpeg',10113,'2013-01-01 01:22:33',11,35.00),(21,'Kathy','Johnson',NULL,31,'2012-12-08 23:38:03','2013-01-01 01:22:35','person-silhouette.jpeg','image/jpeg',2677,'2013-01-01 01:22:34',11,22.50),(31,'Kathy','Fielding','1945-01-12 07:00:00',41,'2012-12-12 01:17:00','2013-01-01 01:22:37','person-silhouette.jpeg','image/jpeg',2677,'2013-01-01 01:22:35',11,0.00),(41,'George','Washington','1933-12-11 08:00:00',51,'2012-12-30 01:39:12','2013-01-01 01:22:37','washington.jpeg','image/jpeg',3825,'2013-01-01 01:22:37',1,66.00),(51,'Thomas','Edison','1900-10-09 08:00:00',61,'2012-12-30 01:40:22','2013-01-01 01:22:38','edison.jpeg','image/jpeg',7374,'2013-01-01 01:22:38',1,49.00),(61,'Shaquille','O\'Neal','1972-03-04 08:00:00',71,'2012-12-30 01:42:17','2013-01-01 01:22:40','shaq.jpeg','image/jpeg',5896,'2013-01-01 01:22:39',1,97.00);
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
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `care_recipients_locations`
--

LOCK TABLES `care_recipients_locations` WRITE;
/*!40000 ALTER TABLE `care_recipients_locations` DISABLE KEYS */;
INSERT INTO `care_recipients_locations` VALUES (1,1,11,'2012-12-06 18:55:05','2012-12-06 18:55:05'),(11,1,1,'2012-12-06 18:55:05','2012-12-06 18:55:05'),(21,11,21,'2012-12-08 01:21:25','2012-12-08 01:21:25'),(31,31,41,'2012-12-12 01:17:48','2012-12-12 01:17:48'),(41,21,NULL,'2012-12-12 01:46:35','2012-12-12 01:46:35');
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
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `care_recipients_users`
--

LOCK TABLES `care_recipients_users` WRITE;
/*!40000 ALTER TABLE `care_recipients_users` DISABLE KEYS */;
INSERT INTO `care_recipients_users` VALUES (1,1,21,'2012-12-06 18:55:05','2012-12-06 18:55:05'),(11,1,11,'2012-12-06 18:55:05','2012-12-06 18:55:05'),(21,1,1,'2012-12-06 18:55:05','2012-12-06 18:55:05'),(31,11,11,'2012-12-08 01:21:25','2012-12-08 01:21:25'),(41,31,21,'2012-12-12 01:17:48','2012-12-12 01:17:48'),(51,21,21,'2012-12-12 01:50:54','2012-12-12 01:50:54'),(61,61,1,'2012-12-30 02:02:08','2012-12-30 02:02:08'),(71,51,1,'2012-12-30 02:02:14','2012-12-30 02:02:14'),(81,41,1,'2012-12-30 02:02:18','2012-12-30 02:02:18'),(91,11,1,'2012-12-30 02:02:26','2012-12-30 02:02:26');
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
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=251 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `caregiver_tasks`
--

LOCK TABLES `caregiver_tasks` WRITE;
/*!40000 ALTER TABLE `caregiver_tasks` DISABLE KEYS */;
INSERT INTO `caregiver_tasks` VALUES (71,'Medication Reminders','2013-01-04 22:48:08','2013-01-04 22:48:08'),(81,'Bathin/Shower/Bed/Bath','2013-01-04 22:48:08','2013-01-04 22:48:08'),(91,'Assist with Toileting','2013-01-04 22:48:08','2013-01-04 22:48:08'),(101,'Incontinent Care','2013-01-04 22:48:08','2013-01-04 22:48:08'),(111,'Skin Care','2013-01-04 22:48:08','2013-01-04 22:48:08'),(121,'Oral Care','2013-01-04 22:48:08','2013-01-04 22:48:08'),(131,'Dressing','2013-01-04 22:48:08','2013-01-04 22:48:08'),(141,'Ambulation/Exercises','2013-01-04 22:48:08','2013-01-04 22:48:08'),(151,'Meal Prep','2013-01-04 22:48:08','2013-01-04 22:48:08'),(161,'Errands/Shopping','2013-01-04 22:48:08','2013-01-04 22:48:08'),(171,'Vacuum/Dust','2013-01-04 22:48:08','2013-01-04 22:48:08'),(181,'Clean Bathroom','2013-01-04 22:48:08','2013-01-04 22:48:08'),(191,'Clean Kitchen','2013-01-04 22:48:08','2013-01-04 22:48:08'),(201,'Laundry','2013-01-04 22:48:08','2013-01-04 22:48:08'),(211,'Linen Change','2013-01-04 22:48:08','2013-01-04 22:48:08'),(221,'Transportation','2013-01-04 22:48:08','2013-01-04 22:48:08'),(231,'Safety Measures','2013-01-04 22:48:08','2013-01-04 22:48:08'),(241,'Socialization','2013-01-04 22:48:08','2013-01-04 22:48:08');
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
) ENGINE=InnoDB AUTO_INCREMENT=711 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `check_ins`
--

LOCK TABLES `check_ins` WRITE;
/*!40000 ALTER TABLE `check_ins` DISABLE KEYS */;
INSERT INTO `check_ins` VALUES (171,11,37.78583527,-122.40641785,'2012-12-06 19:13:42','2012-12-06 19:13:42',1,1),(181,11,37.78583527,-122.40641785,'2012-12-06 23:31:37','2012-12-06 23:31:37',1,11),(191,1,38.68267441,-121.38351440,'2012-12-06 23:45:50','2012-12-06 23:45:50',1,21),(201,1,38.68327332,-121.38351440,'2012-12-07 03:00:44','2012-12-07 03:00:44',1,31),(211,1,38.68296814,-121.38341522,'2012-12-07 03:05:58','2012-12-07 03:05:58',1,41),(221,1,37.78583527,-122.40641785,'2012-12-07 19:24:24','2012-12-07 19:24:24',1,51),(231,1,37.78583527,-122.40641785,'2012-12-08 22:03:56','2012-12-08 22:03:56',1,61),(241,1,38.68270874,-121.38312531,'2012-12-08 22:10:58','2012-12-08 22:10:58',1,71),(251,1,38.68243027,-121.38301086,'2012-12-08 22:16:51','2012-12-08 22:16:51',1,81),(261,1,37.78583527,-122.40641785,'2012-12-08 22:19:34','2012-12-08 22:19:34',1,91),(271,1,38.68243408,-121.38301849,'2012-12-08 22:21:05','2012-12-08 22:21:05',1,101),(281,1,38.68272018,-121.38340759,'2012-12-08 22:22:09','2012-12-08 22:22:09',0,101),(291,1,38.68272018,-121.38340759,'2012-12-08 22:22:22','2012-12-08 22:22:22',0,101),(301,1,38.68251419,-121.38299561,'2012-12-08 22:26:47','2012-12-08 22:26:47',1,111),(311,1,38.68251419,-121.38299561,'2012-12-08 22:26:52','2012-12-08 22:26:52',0,111),(321,1,38.68263245,-121.38355255,'2012-12-08 22:38:50','2012-12-08 22:38:50',1,121),(331,1,38.68232727,-121.38339233,'2012-12-08 22:44:07','2012-12-08 22:44:07',0,121),(341,1,38.68267441,-121.38330841,'2012-12-08 22:48:42','2012-12-08 22:48:42',1,131),(351,1,38.68269730,-121.38317871,'2012-12-08 22:50:36','2012-12-08 22:50:36',1,141),(361,21,37.36627197,-122.07999420,'2012-12-08 23:42:00','2012-12-08 23:42:00',1,151),(371,21,37.36651611,-122.08038330,'2012-12-08 23:42:05','2012-12-08 23:42:05',0,151),(381,21,37.36633682,-122.08029938,'2012-12-08 23:42:45','2012-12-08 23:42:45',1,161),(391,21,37.36634064,-122.08018494,'2012-12-08 23:43:27','2012-12-08 23:43:27',0,161),(401,1,38.54319763,-121.34026337,'2012-12-09 03:49:21','2012-12-09 03:49:21',1,171),(411,1,38.54320145,-121.34027100,'2012-12-09 03:50:00','2012-12-09 03:50:00',0,171),(421,11,32.81076813,-117.26673126,'2012-12-09 18:21:12','2012-12-09 18:21:12',1,181),(431,1,38.68258667,-121.38298798,'2012-12-11 00:54:57','2012-12-11 00:54:57',1,191),(441,1,38.68268585,-121.38335419,'2012-12-11 00:57:13','2012-12-11 00:57:13',1,201),(451,1,38.68268585,-121.38335419,'2012-12-11 00:57:18','2012-12-11 00:57:18',1,211),(461,1,38.68257523,-121.38298035,'2012-12-11 01:36:33','2012-12-11 01:36:33',1,221),(471,1,38.68257523,-121.38298035,'2012-12-11 01:36:42','2012-12-11 01:36:42',0,221),(481,21,37.78583527,-122.40641785,'2012-12-12 01:57:32','2012-12-12 01:57:32',1,231),(491,21,37.78583527,-122.40641785,'2012-12-12 01:57:36','2012-12-12 01:57:36',0,231),(501,21,37.78583527,-122.40641785,'2012-12-12 01:57:49','2012-12-12 01:57:49',1,241),(511,11,32.81067276,-117.26660919,'2012-12-12 05:45:26','2012-12-12 05:45:26',1,251),(521,11,32.81066895,-117.26661682,'2012-12-12 05:45:41','2012-12-12 05:45:41',0,251),(531,21,36.61650085,-121.84247589,'2012-12-12 05:47:47','2012-12-12 05:47:47',1,261),(541,21,36.61650085,-121.84247589,'2012-12-12 05:49:00','2012-12-12 05:49:00',0,261),(551,1,37.78583527,-122.40641785,'2012-12-30 00:43:17','2012-12-30 00:43:17',1,271),(561,1,37.78583527,-122.40641785,'2012-12-30 00:51:05','2012-12-30 00:51:05',1,281),(571,1,37.78583527,-122.40641785,'2012-12-30 01:35:46','2012-12-30 01:35:46',1,291),(581,1,37.78583527,-122.40641785,'2012-12-30 03:30:13','2012-12-30 03:30:13',1,331),(591,11,32.81064224,-117.26667023,'2012-12-31 01:37:30','2012-12-31 01:37:30',1,341),(601,11,32.74739456,-117.20578003,'2012-12-31 21:39:14','2012-12-31 21:39:14',1,351),(611,11,32.74739456,-117.20578003,'2012-12-31 21:39:27','2012-12-31 21:39:27',0,351),(621,11,32.81047821,-117.26679230,'2013-01-02 00:34:54','2013-01-02 00:34:54',1,361),(631,11,32.81063080,-117.26664734,'2013-01-02 00:36:45','2013-01-02 00:36:45',0,361),(641,11,32.81063461,-117.26666260,'2013-01-02 04:51:52','2013-01-02 04:51:52',1,371),(651,11,32.81062317,-117.26666260,'2013-01-02 04:51:53','2013-01-02 04:51:53',1,381),(661,11,32.81063843,-117.26667786,'2013-01-02 04:51:53','2013-01-02 04:51:53',1,391),(671,11,32.81063843,-117.26667786,'2013-01-02 04:51:54','2013-01-02 04:51:54',1,401),(681,11,32.81063843,-117.26667786,'2013-01-02 04:51:54','2013-01-02 04:51:54',1,411),(691,11,32.81064224,-117.26667786,'2013-01-02 04:52:05','2013-01-02 04:52:05',0,411),(701,1,37.78583527,-122.40641785,'2013-01-04 22:49:57','2013-01-04 22:49:57',1,431);
/*!40000 ALTER TABLE `check_ins` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=81 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `locations`
--

LOCK TABLES `locations` WRITE;
/*!40000 ALTER TABLE `locations` DISABLE KEYS */;
INSERT INTO `locations` VALUES (1,'2372 Eastwood Dr','Roseville','CA','95747',38.78092100,-121.36040000,'2012-12-06 18:52:59','2012-12-27 19:05:00',NULL,NULL,NULL,NULL,11,NULL),(11,'6349 Watt Ave','North Highlands','CA','95660',38.68279420,-121.38300220,'2012-12-06 18:54:25','2012-12-27 19:05:00',NULL,NULL,NULL,NULL,11,NULL),(21,'5632 La Jolla Blvd.','La Jolla','CA','92037',32.81453010,-117.27003530,'2012-12-07 16:48:56','2012-12-27 19:04:59',NULL,NULL,NULL,NULL,11,NULL),(31,'660 Menlo Oaks Drive','Menlo Park','CA','94025',37.46655100,-122.16776700,'2012-12-08 23:36:38','2012-12-27 19:04:59',NULL,NULL,NULL,NULL,11,NULL),(41,'22 Lower Ragsdale, Suite B','Monterey','CA','93940',36.57384100,-121.80999100,'2012-12-12 01:15:00','2012-12-27 19:04:59',NULL,NULL,NULL,NULL,11,NULL),(51,'2386 Eastwood Dr','Roseville','CA','95747',38.78112140,-121.36027850,'2012-12-30 01:39:04','2012-12-30 01:39:04',NULL,NULL,NULL,NULL,1,''),(61,'980 9th St','Sacramento','CA','95814',38.58096600,-121.49469100,'2012-12-30 01:39:58','2012-12-30 01:39:58',NULL,NULL,NULL,NULL,1,'16th Floor'),(71,'6525 Boulder Road','Granite Bay','CA','95746',38.77425700,-121.14030200,'2012-12-30 01:41:58','2012-12-30 01:41:58',NULL,NULL,NULL,NULL,1,'');
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
) ENGINE=InnoDB AUTO_INCREMENT=211 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notes`
--

LOCK TABLES `notes` WRITE;
/*!40000 ALTER TABLE `notes` DISABLE KEYS */;
INSERT INTO `notes` VALUES (1,11,1,'This is noah, checking in for mitch.','2012-12-06 19:13:42','2012-12-06 19:13:42',NULL),(11,11,1,'Test','2012-12-06 23:31:37','2012-12-06 23:31:37',NULL),(21,1,1,'This is a test from my iPhone','2012-12-06 23:45:50','2012-12-06 23:45:50',NULL),(31,1,1,'This is a note added from the Current Session tab','2012-12-06 23:46:13','2012-12-06 23:46:13',21),(41,1,1,'This is awesome!','2012-12-07 03:00:44','2012-12-07 03:00:44',NULL),(51,1,1,'I love notes','2012-12-07 03:00:59','2012-12-07 03:00:59',31),(61,1,1,'Test ','2012-12-08 22:38:50','2012-12-08 22:38:50',NULL),(71,1,1,'This is a new check in','2012-12-08 22:48:42','2012-12-08 22:48:42',131),(81,1,1,'This is a new check in','2012-12-08 22:50:36','2012-12-08 22:50:36',141),(91,21,1,'Here at the house, door was open','2012-12-08 23:42:45','2012-12-08 23:42:45',161),(101,1,1,'Me and Kailey','2012-12-09 03:49:21','2012-12-09 03:49:21',171),(111,11,11,'Testing notes','2012-12-09 18:21:12','2012-12-09 18:21:12',181),(121,21,31,'Here I am, everything is great','2012-12-12 05:48:35','2012-12-12 05:48:35',261),(131,1,1,'Test','2012-12-30 00:43:17','2012-12-30 00:43:17',271),(141,1,1,'God bless mitch','2012-12-30 01:35:46','2012-12-30 01:35:46',291),(151,11,11,'Test','2012-12-31 01:37:30','2012-12-31 01:37:30',341),(161,11,11,'Test again','2012-12-31 21:39:15','2012-12-31 21:39:15',351),(171,11,11,'Test','2013-01-02 00:34:54','2013-01-02 00:34:54',361),(181,11,11,'Test','2013-01-02 04:51:53','2013-01-02 04:51:53',381),(191,11,11,'Hi','2013-01-02 04:51:54','2013-01-02 04:51:54',401),(201,11,11,'Hi','2013-01-02 04:51:54','2013-01-02 04:51:54',411);
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
) ENGINE=InnoDB AUTO_INCREMENT=1121 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth_access_tokens`
--

LOCK TABLES `oauth_access_tokens` WRITE;
/*!40000 ALTER TABLE `oauth_access_tokens` DISABLE KEYS */;
INSERT INTO `oauth_access_tokens` VALUES (1,1,1,'1434230e72247a45d5984dcf8dc11a6ada841c886b9ba0362d91f030b7af26a8','a1f1fb6e4b264e1c6d3d0753e83f9bf2680bebd3b333508b2f5eef6ede7e8be7',7200,'2012-11-08 22:34:37','2012-10-10 14:36:28','public'),(11,1,1,'f13333e3454b0fd29836a9f91804360b9b42c38cf24d2695706b045857e56f6c','f50c725012563ac9696621ea49db4fd92ceb0633b22cd9596c13093d478268c6',7200,'2012-11-08 22:34:37','2012-10-10 14:51:58','public'),(21,1,1,'67b8bd471087b1a0838ae86d94610646cadb457ecf72357ad7acbeaad4a84141','6bf807d904ebe2f6f7d0d4e65433c24c34210cb105d738ff494b3ef9dbfb5d4e',7200,'2012-12-30 02:06:06','2012-11-08 22:34:37','public'),(31,1,1,'c4ddf7337136380de426ebf04c8bfbba117db9eca52c3845ab363a6819856cf3','b55968284a2696bc717e6a628fa51f72c623eb76cbf9a0500cb9dfdfd2a1277d',7200,'2012-11-15 23:51:57','2012-11-08 23:58:53','public'),(41,1,1,'01203b483e72727d2085d52570ed3e38cc2763e89318ba351038ff62259fce26','46e5a72b454f7d7f422e94730a6cb417b2e0c4c6122350694b7db72c3b296a58',7200,'2012-11-15 23:51:57','2012-11-09 00:14:53','public'),(51,21,1,'e0ad6600f02f451beb5e7747c5ffae59d54e8c147db5b7f72ebeebf1483e45a5','4ae1cef73551af9944261d599aa818984ee16f609ff07502e0a36027d9481b31',7200,'2012-11-09 16:50:06','2012-11-09 01:14:26','public'),(61,11,1,'983c43a416b1b85f0469e46c01282f3801df922fc3cb9732b0bed271940dbc28','9dfae452620308e76a03d455a0b8b0348623664a829c4ae965259a0c67e348fa',7200,'2012-11-10 20:49:16','2012-11-09 01:19:50','public'),(71,21,1,'2e5225ca4871fe3f1160ec4f4e75aea88bbf0985bfd3d392783668d1c5a785a4','74ab1d4a36f4086d2fd2c60c31b3a7a7e3e82ad538f50f1b46a0af781ddedc48',7200,NULL,'2012-11-09 16:50:06','public'),(81,11,1,'0a84e3fafcf0595b88830b661f37d39da1cb79d3d44b3eea3c37145516ca0f9c','a6604f497f7afa11ad452759561a06d3457992e310c5a38272368857da39db68',7200,'2012-12-06 23:30:46','2012-11-10 20:49:16','public'),(91,1,1,'12396a2b657b737a9f134519b86c3ae4558b421147372eede974b499c56bbe06','6e509d0b7d79096bec21f61df3e67a27569b023f15889eb0bc0b40668dea21d9',7200,'2012-12-08 22:30:43','2012-11-15 23:51:57','public'),(101,1,1,'e19924f43151e6b7e8d0e0232dfc9174ed63f8e1eeafebbf55aca63c9d503e73','90b69134c033df6fb9d9ec8663d5609dfdaf4abed6da486e0921f92512096153',7200,'2012-12-08 22:24:19','2012-12-06 18:59:24','public'),(111,11,1,'07d1ca1daf8728a903c72d78f5b179d819ee8382cf9ffc3df06243b4873ed71d','51692bfe1ca58e3fdfe560d709f33017c328d05a8b49a581010d05d713e243c7',7200,'2012-12-06 23:30:46','2012-12-06 19:00:09','public'),(121,11,1,'5ca3da40b4605e2bdf69798a3424607aa58e27ee22e018e3032a021065f319c1','d1b46851c17e72c28abd8fbde1a21f434dea56c69ec0165ce347444bcccb6334',7200,NULL,'2012-12-06 23:30:46','public'),(131,11,1,'fa80b520cd5d211e8278e002d2e43680ebfc3fa6f2a975edc8d22b1b6a32c78e','e4555a32a5dcac397187616122bcb0cbd1ffef3465cc471ecc942ef79f86d810',7200,NULL,'2012-12-06 23:31:11','public'),(141,1,1,'898632346335d0ed62a628933056fae4f5f9bc5b548b0ad946f7f78ae3019ec3','78e274ae952c81d528c49f0a91931a94fee60713412cf41b978a7b46a4684035',7200,'2012-12-07 03:05:30','2012-12-06 23:45:28','public'),(151,1,1,'6b64ff967807e32eacde04481f73159fd48059f28f34f9bdc0a2e4743b850266','77a263d2e4ec04faef248aafe3d064666cb9a98ce977c09e7ee551b90185ba95',7200,'2012-12-07 03:05:30','2012-12-07 03:00:24','public'),(161,1,1,'6a05949ac6f6305194117e32652b099b7d61d9646018dc9a9219500f2bae9c14','90a2ea112807a7b945f06392216ed666360d850685bd136e718693c175951f58',7200,'2012-12-08 22:16:33','2012-12-07 03:05:30','public'),(171,1,1,'5238b7f4c6b6fda3bdaf3eb38648ec7be086bf566f4caea98398feba4f1bbf29','ae64978eecdbead7843ac0c01d154318b1b72211703b4d40c265ec5afc6f74c6',7200,'2012-12-07 21:53:19','2012-12-07 03:05:50','public'),(181,21,1,'5b442475c0d0c378956ab688614991ad87c43a406c40e1bc9743c3a2a6094427','d2a48cd9dae00e8f52a964c12dff08173954e221429288be518e36afcd2ba027',7200,NULL,'2012-12-07 03:35:48','public'),(191,21,1,'d7c59c5f11dfb51749f73145a6004321e528285c386eab0d0778738d9bd711f2','f51dec5046dcd32908a116a89fa4c195ca85521a20c2834aca4f310f4701a277',7200,NULL,'2012-12-07 03:35:48','public'),(201,21,1,'de7a3f6f9ff94cb27f6d08bd7e6489764a05886149b1e45714aa6fb85cd9fc35','6151c4d4e6608e8dfaaf3b780b87278528a5836691b4d9d9298ecfa03d6e9496',7200,NULL,'2012-12-07 03:35:48','public'),(211,21,1,'25eaec0ec7903142fcd4e90d915c18bdfc58a61dbaade59e64561f8dc2bf11c6','4632833d5bbd81c072b3eb27a2becd501d3c3481159b9fa9db3a390f4e88fa73',7200,NULL,'2012-12-07 03:35:49','public'),(221,21,1,'5d940f87af7859a0c3df09023794602f1411af136b1baf075d72fcad371ca29d','4a54b25acf88b6e0d98a2377e1b4f1c230d2452c50e93a893fa53c716ec17b2e',7200,NULL,'2012-12-07 03:59:47','public'),(231,21,1,'b6c2863309b4a1ad6d442f46cb191cbee3dab2714e9253717b2c7d7b8f24a3c6','86c0769128a926cf18d75763f9eeff64a0ca7bc49fdd7fa8dd1fa8cd144594d7',7200,'2012-12-07 18:30:32','2012-12-07 03:59:48','public'),(241,21,1,'a4278ed3f78eadd44d685a03c56cac7bfcb150a1d1f3ccaefc3d6e5311aeaf2e','e4a28daff34218153e1ff962c64a0269e9d9da3cd39ba5fcaf0c70f57c893f20',7200,'2012-12-07 18:30:32','2012-12-07 03:59:50','public'),(251,11,1,'0e114b0b76008d7376b2208c1dc20a80ff80213cf1ea303ebb466c3d22e3ef14','610893b4cace97008da24f5f803dcc67bfab985fbcfea4464fd1aa5e8bc6c35e',7200,NULL,'2012-12-07 15:24:27','public'),(261,11,1,'f1b041619843e59d463a37c51915ae4e585f074497f4011ae25b6decf884172c','469a56bb67c5919692bcb5ed8576edf67fd9048c5d541e361182adf6aff8aa3e',7200,NULL,'2012-12-07 15:24:27','public'),(271,21,1,'3c51409324a078413f69af48f999da5fb2053f83a1217d2e675d0bb421375c04','f3ab89c3902e758824888e776e6801deb9203db0157e43f6f16ae3bce9573803',7200,NULL,'2012-12-07 18:30:32','public'),(281,21,1,'904fe1e1896ab301c6dec7e618f17192b8b9409551dfcbaff0dada25377a1be3','444aba121eca8dc24cc77c1bea5950d889915d0ae8d5fdd22c7f7fec4ea4224a',7200,NULL,'2012-12-07 18:30:48','public'),(291,21,1,'e49a033fec2c4a564f148591026c53cfb64c6a9f8abc8c1bc72774bfae609a36','970ab64a09efd5ebc7a794dbc3d6f5d52a3e4a876bab6970b7c7dbe778b74c69',7200,NULL,'2012-12-07 18:31:08','public'),(301,21,1,'d0e1b9b8acab289bc9b06a4287ffa03b67c4ab8ab19fd3e42a44c8eb8796a43c','19280238ac0de00a7617b96ac6254d7f951afbff2131970ef00870e608bc0815',7200,NULL,'2012-12-07 18:31:15','public'),(311,21,1,'6b68d1d9b1ceee5bdfeaffc23f2d5e1010155d7ab2670746f77bb3c92dbdaac2','8d8f115faad91e887fc329a7dc011444e6fbb6e6ec0781ab89f527e4b7447ff8',7200,'2012-12-22 18:25:56','2012-12-07 18:31:16','public'),(321,21,1,'638c44518bd02afbff6e722652021be4e977a47c51a68e20a8de40e0e62d90b9','bb06d5c54ae203e03d58522edafb12408057c6b97eccf8b8a9a1214611debefc',7200,'2013-01-04 20:44:25','2012-12-07 18:31:16','public'),(331,21,1,'4741fc37c9142e088d341f15a5f90f010ed5ac56ae63849f7789f9fb71b03645','96a69b0531ee918029c7cf7e087c4160a4b0bafee046d9977bc14d4fbaac90c1',7200,'2012-12-12 01:06:38','2012-12-07 18:31:32','public'),(341,21,1,'fcc1d33554f3af326038ee6787f64eda375896e99d079c382cf8bf0c29ae5815','a0b71f80edac4e4ce80c3410759099bd89de76545dd146b98d1d259282a77fc1',7200,'2012-12-12 02:04:32','2012-12-07 18:31:32','public'),(351,1,1,'90a600210da3b8af4eba4f86632a69623955acf6419baa404e7696c2e8218e14','e635ed7bcb5e9f3768d8b48275ef363ad8c6db3ed9e8a0af7525b9d710520ac4',7200,'2012-12-07 21:53:19','2012-12-07 19:24:04','public'),(361,1,1,'707ce2e75d9d615082b4e53c8a0b1b3bf04404f9f14d16185eef10eabff97d2e','f1cbbc9045ef98ab74d8db473ee2d2aedccae3633bf4e4b7c87c99e67be9fe3c',7200,'2012-12-08 22:10:48','2012-12-07 21:53:19','public'),(371,1,1,'d246fb838e0a77777f939aade491bbbab5326f0d2e16125e1fb7fa65c0b2e384','6b7e3d10708d6833e3ad00d20a3520e1bbe83b8c59c423f1aa9cdd4247389a0d',7200,'2012-12-08 22:10:48','2012-12-08 21:42:48','public'),(381,1,1,'04f9eae6df2dc9ebb3e9dccc42039d7f5b7d8cebbc1ecb77c5cd67075b9b7645','60f33fea9ba5055705ad7f4ece3fa3f79aa35812ca02c70ae43a4f5615852aa8',7200,'2012-12-08 22:08:04','2012-12-08 22:03:43','public'),(391,1,1,'270e435a0fee7d4f6d5e97b87e8ff0cc8116df81b7fcc269d3acdb5385a68bd5','6ed84de737557c4e7fe336685c77b5b120d61cced455e74f8528cbfbbe51234b',7200,'2012-12-08 22:16:32','2012-12-08 22:10:48','public'),(401,1,1,'848c59e136109c60e3b857fa952b8ef9dcef63615ee64d6abe9c7f4e619b8ce6','61a8fba9734f072ee4de48b423b31c797e0fd9a30536b40e2af6f6320239ac37',7200,'2012-12-08 22:20:58','2012-12-08 22:16:33','public'),(411,1,1,'e77996a69ba4762bb643f9ccd9f5443c2e9802e893d14080f04a010aab72a377','48d7da7717a0deb880677e6fcfbb0c5653ea0455b5e855bd0ba1e355079ac18c',7200,'2012-12-08 22:24:19','2012-12-08 22:19:30','public'),(421,1,1,'2e7f6dc96e7ae98e69eb5946bd9d5d9739a616f0318eac7b3d0cd4924c102a44','b7d6f4966c2b51aa095a193c41eb855cc0de99efad2f95e0c23b16df9c1af941',7200,'2012-12-08 22:28:30','2012-12-08 22:24:19','public'),(431,1,1,'71a9878a2146b15875fa398c5a67e8daa6b3439eb20f528e13741e537efcc122','be6beb972014db417b2399ff81d3b7571fda828a900814dc2c5c04bd1d63b89a',7200,'2012-12-08 22:30:43','2012-12-08 22:26:40','public'),(441,1,1,'397ef4a945829bffa0ff82ed9fcec96c9323912047ed4a097520d064470c5a56','b499d54cd01f4cbb3a3c3d0805ebeaf8c19c766a50ab1b138d0232b85afcd4a8',7200,'2012-12-09 03:48:48','2012-12-08 22:30:43','public'),(451,1,1,'db7f788a11e782d24434423eed462ae9fa32b9315717771604e482005e91893c','c21a71edd137ef44a30bd1a468590c2816ebd97e75f0768523cac525d8d8d92b',7200,'2012-12-08 22:56:00','2012-12-08 22:47:47','public'),(461,21,1,'0efef5699e38696034d6194099bf51659e308630b10472f6c37a930831877284','b538962b759a749b6f35167ce8a08494970092ce4558bb0ded5618868087301e',7200,'2012-12-12 01:06:38','2012-12-08 23:41:45','public'),(471,1,1,'3509d9e20ab5ae9ded857a40ae77e8dee0847f20a77694d63aaeed0cb8485ae4','08453ec603595607ed1724703f0d842005ca2b18b6630c9d4196ad1a74e4c19a',7200,'2012-12-11 00:54:46','2012-12-09 03:48:48','public'),(481,1,1,'7880635ada4acba239ed47cc57d99ed0f03fbf987c76194c5381a597faffa96e','d7eaa2f665f79a837bc356f82510ec89c979a1c1e03ecf881675348a93640c76',7200,'2012-12-11 01:36:26','2012-12-09 03:48:48','public'),(491,1,1,'74831210485f15d939c28339f0fe47ee7cfc8b7330050785939c20e6e1f6ced7','b5177ccdc51f7824006a3c8836b5e473760aee345c39be6e2b96cc116d867961',7200,'2012-12-30 02:00:23','2012-12-09 03:48:48','public'),(501,1,1,'71c0f6fb0d1bbd04147a2dcae1b9e7eb18289ef5a4a07a2636c3da854808e0e6','78fa4d354c4496aface7bcf104e8acf74920fdac3552c673d0029bbff480a8a0',7200,'2012-12-11 00:54:46','2012-12-09 03:48:48','public'),(511,11,1,'29450d656f755dc3982d80c09cdaa399fffdae472b0983b03bf5d5cbc4081025','7b7ec45bdb965b7b09b610da87dbdac61592c3ab66c8564d74fbffc7991958ac',7200,NULL,'2012-12-09 18:18:36','public'),(521,11,1,'7b57b8fa01a2a69da137567da0885161e8025e2aa781fd3d8fe4051b6e484573','bbe52b8ad53a1369a087b7dcf0da9029de8077993203b4bfd9c9278437c59ac4',7200,NULL,'2012-12-09 18:18:36','public'),(531,11,1,'321eeff354eaf62e6660bbb0f263b0572f69009846cae75667c13d7f1c89aee4','429368e13fd82d987c3aedb3289c3eda8195f4dcb0f2f3757151fee63d39ce1e',7200,NULL,'2012-12-09 18:18:37','public'),(541,11,1,'5de4304d287b5af384f17332323ccbdf58c9899d94a4f45764ba69e70ab7c014','77ecf4391417f42c964638b1bf6cb9e5964da819428efc9b4e206b4315842b4f',7200,NULL,'2012-12-09 18:18:37','public'),(551,11,1,'6feaa2a8859669bce4301900451f0f4a646bd1fe3b355e87d0ca46cfcd34504e','b0653d3e6f861b73e06c024948b5a0a9e7ef1b59bc95cc5f3addaf67ac09875e',7200,NULL,'2012-12-09 18:18:37','public'),(561,11,1,'55d1fde4c7941624d7cfe66e746120a03c0446d3108e9e5b9891751a518ca5dc','cd638b17fbf210a239db5475d11641dee5a3ae5dc1db00161c4618f4c67fce71',7200,NULL,'2012-12-09 18:18:37','public'),(571,11,1,'d7711d851bdc8d1d8ea03a1f12f30cc830e6e4d88c04a717cbff9db781807237','9d701b51d28a5cc302c201f1399ec13d8252c0932f1662413ea2b2ac050003f7',7200,'2012-12-18 23:00:33','2012-12-09 18:18:38','public'),(581,11,1,'06987339613b33907dc3b069e3fc3d03d156d14288bb3f6c88d6799059fe4be8','a022ea5cdc028e19dadaa9e6f7a0bee22d312019964059e911eeb41dabaaa171',7200,'2012-12-19 22:31:35','2012-12-09 18:18:38','public'),(591,11,1,'7247bc222a2c465f9c44d2f4509a4124d2ce214f87a4f6c78b65df2ed1b9e3e0','8d2de671fa5209ac815d284f8c1656c59cce781a9359d152e5da7cd66e5b5533',7200,NULL,'2012-12-09 18:18:38','public'),(601,11,1,'80b184629d2c857185c8652eff059fd8bc4a8a09f08d7463b147b202a98904bf','d15941670cac40a1232a37215c3367a77cfce8ae154a34d1758d7165acab9e3c',7200,NULL,'2012-12-09 18:18:38','public'),(611,11,1,'7bf9487fbf9e5fab0785e1cd4b99a594484fe33f6f73474c7264c8fc7e06a936','744480387d40c66d70e1e491ec287d44596ea36f83b15c884af991c8e5f78136',7200,NULL,'2012-12-09 18:18:38','public'),(621,11,1,'4127cde3315254978390165d26768ed475f88a1bbd7f9193885dff3e60471457','90a2a5d1478292935fd2e69d0307ffe9ea6edaf12896dabf5b17e6617a4746f3',7200,'2012-12-12 05:45:14','2012-12-09 18:18:39','public'),(631,11,1,'08fe1c7c415dc5d7bb0248c176e647d133dcaac626e65e348298dfff335fa823','3212cfb9c090513382e795aa9bf40e6e95303f1040b3ffa3883b9212f7ddf549',7200,'2012-12-12 05:45:14','2012-12-09 18:18:39','public'),(641,1,1,'27530863558fced69dfb32547a44fc5b45431693ce69aac8500144e28011c0df','b91017a58560f3b627c7f478ce32df479beedacae7368e72a4a22a1f452b46f8',7200,'2012-12-11 01:36:26','2012-12-11 00:54:46','public'),(651,1,1,'32fedb58563bb001e5ff7fa2755a7d49e615e6ade269aed407c2c7040b1c491f','44a409d6fdbb4a42abbd5e62d77d5515d7489c023f16172f5ca74b3402fd29f4',7200,'2012-12-14 20:31:03','2012-12-11 01:36:27','public'),(661,21,1,'e48a9dec47f4f519dfbb7b704ff1a6a90e190bebda8260cd449885a1b3efa2e3','728664fe6d40d6fd809943a0d64ac25203c4ab0880f3d58cd7a0958ac6193741',7200,'2012-12-12 02:04:32','2012-12-12 01:06:38','public'),(671,21,1,'ef3aa92379528923a664aeb20b7fd5c70cf6707e0910871c179677e45c684074','499113608673e93c227caf2a1d0cf666e71fdff981dd3edb48aeabd3f494bb6f',7200,'2012-12-12 02:00:18','2012-12-12 01:47:28','public'),(681,1,1,'872775c2f6ff8027dc6073fb5f5b3d853214476db97b4371fbe05fd0f54f17ac','f38bc86da6c13d9d760cc90121ae05cc6811a30d6ce613e65c2b81599b1a53fe',7200,'2012-12-14 20:31:03','2012-12-12 01:50:05','public'),(691,21,1,'5881cfc4e5a50d5d013643aa585ccee2296b50025cc521793fe137571be6085c','f1ff423387624bfbf974cf6c322fe2daddaa150e67e5478232d15f9540f7875e',7200,'2012-12-12 01:58:55','2012-12-12 01:55:01','public'),(701,21,1,'058a6619fd50b83b180e59d0ba3382ac835299f6529d69c4d98e47cc726781fc','9b55257f82282bc0b87678e1b06998bb4cc0db9ae200b91ada41eb78d312d89a',7200,'2012-12-18 20:11:51','2012-12-12 02:04:32','public'),(711,11,1,'9fec2bda3d5764297610f6527fb8f572dd24f38a90851d6075a1f4321e213cca','02807a71b9dfa1a5987063111640db378a7764ab6674ddb76a721c35db84b12d',7200,'2012-12-18 23:00:33','2012-12-12 05:45:15','public'),(721,21,1,'c63ce35254eb76f0ce4290b59920d57ba0137eefbb72f89defba942cb657c856','a60ddb9df8596ccaffbcbde2108796fb50e898b5e979a9fc7e42a458a4fe7ce7',7200,'2012-12-18 20:11:51','2012-12-12 05:47:21','public'),(731,1,1,'b4fa2f886d06179fedfbb1a8c2830f89d378914f1d70f2d3a971d44c35237fd8','9bcb496fe9eb22206f71ef21bba4a2e728c0d09a48649b0ece5d0d71c2c41923',7200,'2012-12-30 00:50:52','2012-12-14 20:31:03','public'),(741,21,1,'f7b2ae645991fe4aae9167fb44c78b7a63db9fd4214679f00ff5186dc7d13ee8','8b25ca4f6851d67fabf25401b9269b68aa4cd80273271e8d7656fc1ad5bd045c',7200,'2012-12-22 18:25:56','2012-12-18 20:11:51','public'),(751,11,1,'e3745f5d34662a14e8488252cbe4292874e142fc62b4c45aaa1ddb74ead758ca','185c6cd78a8552fe5446c333ddb4eb0df1f88399a58dd91789ee6d2218190090',7200,'2012-12-19 22:31:35','2012-12-18 23:00:33','public'),(761,11,1,'bbd8dcabb7e4c2238e9c044e5eab6aa5a09a7cb9439b6b8a2eade8ccf3f18b71','a8e773f20ba8ff9dfd6c39763e2134f8d49f5d289c1b8c9510d7bb67abfae2d4',7200,NULL,'2012-12-19 22:31:35','public'),(771,21,1,'050c682117d5a424586e481d4f156aa8c58b6aee1159a81ca891cf3a4156a611','c2c4781cab15dbd80a04994f31df501801468e812e5be0fade2a14426a93643a',7200,'2013-01-04 05:27:10','2012-12-22 18:25:57','public'),(781,1,1,'fa083863f101baa275682b80d12691ce1b368f671446a5ea57d192fefd929ed6','5b6f4838686d45497a7f565d4c27703e1585d19eb56938c45b396abb029b5eb4',7200,'2012-12-30 00:43:03','2012-12-24 15:24:36','public'),(791,1,1,'16f890c72ab92c4b2644dfd7a87566fc72c47c34f447b4b1ba19fb3402c21346','cf5c3a7caa5b80321443d109a216ebfce485ed235e8602cf40b25025f66a10da',7200,'2012-12-30 00:43:02','2012-12-30 00:41:02','public'),(801,1,1,'32d07cbee8e074ae8b06f9a5e12b2007bb5764d6b23512dfc7ba692bcf20fe2b','e9b7150be697ebd3bbc3932fe8a52a058cfd7f6c9be37d2485f731e420b139c0',7200,'2012-12-30 00:50:52','2012-12-30 00:43:03','public'),(811,1,1,'bb0640cf0391a6bb2ca13416c14fc70125ab42b0b933ce5f521404496beffce9','314fa1b90353ca6db4d3b630c1e61f407e247e883718a864b0f7bd2ded050816',7200,'2012-12-30 02:00:22','2012-12-30 00:50:52','public'),(821,1,1,'2e1e5105a186050480bbc6dba9c2a75f510d6eb8cf5bc02606bc9cb15cdbc355','58d5e061d96ebb368d27743965bcdfa49e31fc6e168ffca49d51d7d48b36cb8f',7200,'2012-12-30 01:57:25','2012-12-30 01:17:52','public'),(831,1,1,'a5fe18f39db38218cfc60c102805635379110a7b8f52cec81ee2fa5d53842a66','add81638484413c7f2c4b84134089e978f2b6091edcc1de64b93b8bcd1628f8f',7200,'2012-12-30 01:55:47','2012-12-30 01:22:08','public'),(841,1,1,'29e5614a46e2e0439b2c17b52d606dbf1e5178f9eebb3315c35720c4bbb0feb4','4d9ec54b5230f459ec15074e5f626fdafc79a54a22316ddc3e16c99e2b3a3981',7200,'2012-12-30 01:53:37','2012-12-30 01:28:47','public'),(851,1,1,'1ec3bb721f5f83983b258a9888d2bc90f305170ad692a0c498cf1719d8a33bb4','4518f75b46d9f7aa02e03ade37437ec884de4e0401252bba9f9429fd249df5bf',7200,'2012-12-30 02:06:06','2012-12-30 02:00:23','public'),(861,1,1,'702b59b501909a6197b04c62fb9386911ecc71c6f7958cf7982f92aaa89db3c3','bc40a88460d443540588760c4986fa432edcdaa554b2fe9ea92e1b5e1fb953bf',7200,'2012-12-30 03:17:15','2012-12-30 02:06:06','public'),(871,1,1,'8492ce662a82eb0c401bf552569dd8c0421243559f298f2a0da0e44e031fd1cd','6ddf437c23060a2b7b72b0b63585429fc6827ac050f3d966ab349d49de7e1059',7200,'2012-12-30 03:22:13','2012-12-30 03:17:15','public'),(881,1,1,'e5cc4e20ae978c00d34f908559e9865834d7fc96de2abad1b1c150d8ba3eefd3','d042bb8ce8e94d39544e9c63a27e8761d1102e9f7e10de92440eb270ebff4d88',7200,'2012-12-30 03:24:51','2012-12-30 03:22:13','public'),(891,1,1,'06a1cad601cfd6f7dacf07d1b68b2c9e5ceadcb976c9ad8e5bb0498dceab47fb','45ef5ff0843106c56242fb366ca81d91996061a882f5e6e4e3a98f18a802c142',7200,'2012-12-30 03:33:26','2012-12-30 03:24:51','public'),(901,1,1,'7b7eab63ebd628d6ec913f4cc276c72376ace8976931b20a0bfdf575a209eb0d','928178cf3cc247019cecbd7cbd2109ac09c767e5a869e21062122f61b15c88b1',7200,'2012-12-30 03:40:09','2012-12-30 03:33:26','public'),(911,1,1,'c05c888486f2314e992bac30e3029eed4b14002787102a674f855a012963ab43','f9a8a1ef923954347e3a215a1e2500475ce1b106158f99d59dcd71c283a43853',7200,'2012-12-31 00:13:38','2012-12-30 03:40:09','public'),(921,1,1,'7f9d0093bcb1ae341fe67b801ad7f3339f844480064a20fc6c5067d31edc8702','17c6188fe4b250df8692b0a2727ce4d1ed33d6c4ab1ec6b7e542a4de4ff98fa5',7200,'2012-12-31 00:13:38','2012-12-30 23:56:13','public'),(931,1,1,'49d6cdcd14d7d3704f62d2e734ce1d17ed06c683c7455c43e77834e57c11dcbf','c08d367bdd647f8ab31c894625d91f1aad9d231926645f35460a3865ea39fa1b',7200,'2012-12-31 00:15:35','2012-12-31 00:13:38','public'),(941,1,1,'75d72c270fa7d83f0023e487273c7ab5de9d002ad903e126cf4c656ec61b1e81','6fa4f8ddeb020c6dd26aadb78e723c74885fcbd57faac8e71f56fdad7903a6d5',7200,'2012-12-31 00:29:55','2012-12-31 00:15:35','public'),(951,1,1,'d55dab42ee2892ba0f1ac39d60ee1f753d627064e2f6fa66b7fd630fbae23b47','ed3ba0a3a7869f39ae09b753d508ba98b8ce21059620d5319d21e4d72e90c681',7200,'2013-01-04 22:28:45','2012-12-31 00:29:56','public'),(961,11,1,'f31d26652f1cb8d90123af1b6331c62afc09ae17775d1a531ab7abcd5318c4ec','f0ae870014affa490ff6044067d649c9da99af75781b4cf51d6c1a5e6a8b248a',7200,NULL,'2012-12-31 01:35:03','public'),(971,11,1,'2d1b1bc501f96e55751a71e5b9c7504e55bfe2046cec545dea6128fedc5cb09d','70bdb8f88ec1d3d7ba3760f90bb5880d861fbbaf63caaee2d694fe3b2ba93808',7200,'2012-12-31 21:38:57','2012-12-31 01:35:03','public'),(981,11,1,'20d5d784f585e02d22b92245e896fcfa6972cf87f3ffdb763b507125d28fd097','5aa0de64cbebb8588cb49964fda6ee725f733df390425d3485e5917d99ff3702',7200,NULL,'2012-12-31 01:35:03','public'),(991,11,1,'9c91513da19f4a980e979a29fdbfa413b54fba41dbd76ee1e0352c9be590ef0d','0d043327a0344111295ba820071a9cac81c57faa7da2a5e63f94c1934678f788',7200,'2012-12-31 21:38:57','2012-12-31 01:35:04','public'),(1001,11,1,'cd8623887b43a9c3f837c09ccb95c2a072faf65160627a669fb0725bafbe7249','74f6453e4d8a4ef7d3b5201b4ff3587fd21cdd0437a96a1d00715d0daa8f219e',7200,'2013-01-04 18:19:52','2012-12-31 21:38:57','public'),(1011,11,1,'679dcd2f80854c9f7ca763ef7a66ef8588618b133b2ea126626d29444dfb0c2b','7a476d1d9c100bdd2b7d2af2ce6681d6c19c499b239eedfd162c9a53dd68cd25',7200,'2013-01-04 18:13:41','2013-01-02 00:34:25','public'),(1021,11,1,'78c9bee344dccb41d5093f48b0595b7959c40f54e86936c16d64303073eb0446','5ac249f962601bc1fb9bb44ff7d817f706e3ba984339198843d0e0e108b0fb6f',7200,'2013-01-04 18:13:41','2013-01-02 04:51:51','public'),(1031,21,1,'f11be48204faf4a93da4c7f07d9f91df2493f85b716ea5181dbbb7bbdb9d0b9d','57cc69396ab119421434b4ee089bd2edc1552a804abaf1ab0a4866a4e8fbcce5',7200,'2013-01-04 05:27:10','2013-01-04 00:44:32','public'),(1041,21,1,'dee11cd71efe6853e166c6b0d61f291eec088470978d33ca8899290620b0a18f','6ad778e6e1d94e0ce69101c46b25fbccf59b90c6d3a98c92038ef6f0d8451d17',7200,'2013-01-04 20:44:25','2013-01-04 05:27:10','public'),(1051,11,1,'8c47ee4a7ff572a9825e0c1845cc49a75f580cb2eb97cfb66dfc20491b6d623c','7c1c2de3d7615497cf923aebfc08615b6939c41d817a1f11b0c8de8918867842',7200,'2013-01-04 18:19:52','2013-01-04 18:13:41','public'),(1061,11,1,'3f6fe7727cf712bf73c0c95cc214d766adc282df9eb69a5249b708aee893287e','82a2c69442183782c6aa280fa1a55a72b852b104e19a5f43f0e302e19b446b5d',7200,NULL,'2013-01-04 18:19:52','public'),(1071,21,1,'8a27a3c3f796b2740c7e8e10c147755de1e8f760d233d6f77419e5b03ca61695','c560a7ddb199a96061047489f623bb9094b175cc8ddb58497bcc15e23f598a1b',7200,NULL,'2013-01-04 20:44:25','public'),(1081,1,1,'f0a7df089f22121ada20b660639eefcff10c9eccc604b7d5d57ad36b9dd7397a','4f321baac06fe7fd1dc03b334e669aa4c358aac7cff99084252789fb9cdca1ad',7200,'2013-01-04 22:28:44','2013-01-04 21:54:02','public'),(1091,1,1,'d8b1a87a2265cab4bff8dbb81437bc7a75547bdcca3167338b6de4d2c8bd024e','f240ff8b7ff0ac80923947c065ac4da893af1d68ba724e538a104a9040e0ae16',7200,NULL,'2013-01-04 22:28:45','public'),(1101,1,1,'f20396255cb070dbb155a5f593cb081ee4084b7f0c89df4bbbbcb4139b30ccea','a21f7df55f779fcaa24b722e5e471df97df8b322d5f8277716f6729a574cd243',7200,NULL,'2013-01-04 22:45:53','public'),(1111,1,1,'e665c70a8bfef512cb14d4efabb63a06f96e65439cdace8e3b82da60083a1394','1feaa3fd36662e6ec6abc8df9bdb28257383792aa8f852699b301cf318be8e6b',7200,'2013-01-04 22:49:41','2013-01-04 22:45:57','public');
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
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=191 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `patient_statuses`
--

LOCK TABLES `patient_statuses` WRITE;
/*!40000 ALTER TABLE `patient_statuses` DISABLE KEYS */;
INSERT INTO `patient_statuses` VALUES (71,'Alert','2013-01-04 22:48:07','2013-01-04 22:48:07'),(81,'Oriented','2013-01-04 22:48:07','2013-01-04 22:48:07'),(91,'Forgetful','2013-01-04 22:48:07','2013-01-04 22:48:07'),(101,'Confused','2013-01-04 22:48:07','2013-01-04 22:48:07'),(111,'Lethargic','2013-01-04 22:48:07','2013-01-04 22:48:07'),(121,'Agitated','2013-01-04 22:48:07','2013-01-04 22:48:07'),(131,'Anxious/Restless','2013-01-04 22:48:08','2013-01-04 22:48:08'),(141,'Cooperative','2013-01-04 22:48:08','2013-01-04 22:48:08'),(151,'Combative','2013-01-04 22:48:08','2013-01-04 22:48:08'),(161,'Hard of Hearing','2013-01-04 22:48:08','2013-01-04 22:48:08'),(171,'Poor Vision','2013-01-04 22:48:08','2013-01-04 22:48:08'),(181,'Emergency','2013-01-04 22:48:08','2013-01-04 22:48:08');
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
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
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
  `care_recipient_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `bill_rate` decimal(11,2) DEFAULT NULL,
  `pay_rate` decimal(11,2) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `pay_status` int(11) NOT NULL DEFAULT '0',
  `original_bill_rate` decimal(11,2) DEFAULT NULL,
  `original_pay_rate` decimal(11,2) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
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
) ENGINE=InnoDB AUTO_INCREMENT=111 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `photos`
--

LOCK TABLES `photos` WRITE;
/*!40000 ALTER TABLE `photos` DISABLE KEYS */;
INSERT INTO `photos` VALUES (1,1,NULL,NULL,'2012-12-06 19:05:01','2012-12-06 19:05:01','Photo_on_12-27-11_at_9.54_PM.jpg','image/jpeg',161863,'2012-12-06 19:05:00',NULL,NULL),(11,1,1,NULL,'2012-12-08 22:04:13','2012-12-08 22:04:13','14ef01e0.jpeg','image/jpeg',53566,'2012-12-08 22:04:11',61,NULL),(21,1,1,NULL,'2012-12-08 22:19:42','2012-12-08 22:19:42','1a9afa00.jpeg','image/jpeg',53566,'2012-12-08 22:19:41',91,NULL),(31,1,1,NULL,'2012-12-08 22:21:21','2012-12-08 22:21:21','f81bd00.jpeg','image/jpeg',227522,'2012-12-08 22:21:19',101,NULL),(41,1,1,81,'2012-12-08 22:50:41','2012-12-08 22:50:41','f7e2c50.jpeg','image/jpeg',4282425,'2012-12-08 22:50:36',141,NULL),(51,1,1,NULL,'2012-12-08 22:51:29','2012-12-08 22:51:29','de4bbf0.jpeg','image/jpeg',150959,'2012-12-08 22:51:28',141,NULL),(61,21,1,91,'2012-12-08 23:42:49','2012-12-08 23:42:49','f8e7ac0.jpeg','image/jpeg',4427160,'2012-12-08 23:42:45',161,NULL),(71,1,1,101,'2012-12-09 03:49:21','2012-12-09 03:49:21','5dc600.jpeg','image/jpeg',249805,'2012-12-09 03:49:21',171,NULL),(81,11,11,111,'2012-12-09 18:21:19','2012-12-09 18:21:19','e2c4b40.jpeg','image/jpeg',2531145,'2012-12-09 18:21:13',181,NULL),(91,11,11,NULL,'2012-12-09 18:23:25','2012-12-09 18:23:25','e2f7fa0.jpeg','image/jpeg',3551024,'2012-12-09 18:23:23',181,NULL),(101,11,NULL,NULL,'2012-12-09 18:24:59','2012-12-09 18:24:59','33f290.jpeg','image/jpeg',2723979,'2012-12-09 18:24:57',NULL,NULL);
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
INSERT INTO `schema_migrations` VALUES ('20120906225853'),('20120906231215'),('20120906231518'),('20120907224913'),('20120914001648'),('20120914003439'),('20120914004314'),('20120914004507'),('20120914004519'),('20120914004607'),('20120914023625'),('20121115005927'),('20121115220755'),('20121115222424'),('20121115223748'),('20121115230238'),('20121115231848'),('20121116181744'),('20121121164057'),('20121128175329'),('20121128175359'),('20121128185235'),('20121206162844'),('20121206183920'),('20121206220200'),('20121206220218'),('20121206220913'),('20121206224255'),('20121207213153'),('20121207221103'),('20121211004326'),('20121215172318'),('20121215181749'),('20121215182313'),('20121218214046'),('20121218214114'),('20121218214148'),('20121221005642'),('20121221011000'),('20121221011018'),('20121221011916'),('20121221012105'),('20121221012243'),('20121221012621'),('20121224171220');
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
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subscription_tiers`
--

LOCK TABLES `subscription_tiers` WRITE;
/*!40000 ALTER TABLE `subscription_tiers` DISABLE KEYS */;
INSERT INTO `subscription_tiers` VALUES (1,'Free Subscription',0.00,10,'2012-12-27 19:08:34','2012-12-27 19:08:34'),(11,'Starter Package ',25.00,5,'2012-12-27 19:10:59','2012-12-27 19:10:59'),(21,'Small-Business Package',100.00,25,'2012-12-27 19:11:17','2012-12-27 19:11:17'),(31,'Medium-Business Package',350.00,100,'2012-12-27 19:11:53','2012-12-27 19:11:53'),(41,'Big-Business Package',600.00,200,'2012-12-27 19:12:12','2012-12-27 19:12:12');
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
INSERT INTO `users` VALUES (1,'noah@boomr.com','$2a$10$h1dAMz5mPcNq13TnMioF.egYJuR8YxIGwn1/RMZDZqtYwRuvUaK8u','Noah','Lively','1983-09-08 00:00:00','M',NULL,NULL,NULL,22,'2013-01-04 22:46:48','2013-01-02 00:19:46','66.60.178.106','66.60.178.106','2012-09-14 00:23:30','2013-01-04 22:46:48','Photo_on_3-16-12_at_7.31_AM.jpg','image/jpeg',275922,'2013-01-01 01:22:24',1,'--- !map:ActiveSupport::HashWithIndifferentAccess {}\n\n',19.00,'Gardner','(916) 220-4717','(916) 220-4715'),(11,'tim@boomr.com','$2a$10$WZ7s6O9roRQlli/itPw05ODvGBc8UJ5e/FWQrw41Te00jpI5Tb3DC','Tim','Suski',NULL,'M',NULL,NULL,NULL,20,'2013-01-03 00:09:46','2013-01-02 03:04:38','24.94.28.74','24.94.28.74','2012-11-09 01:12:12','2013-01-03 00:09:46','tim.jpg','image/jpeg',44748,'2013-01-01 01:22:27',11,'--- !map:ActiveSupport::HashWithIndifferentAccess {}\n\n',22.00,'','',''),(21,'matt@boomr.com','$2a$10$6LwFo0FHa6/Kn74y.2RTYeQImWfV3rOz.2jG/dW9n5kgZ4Xl4pS2u','Matt','Bowersox',NULL,'M',NULL,NULL,NULL,10,'2013-01-03 23:19:53','2012-12-27 18:51:32','98.207.152.57','173.13.178.157','2012-11-09 01:12:33','2013-01-03 23:19:53','matt.jpg','image/jpeg',115743,'2013-01-01 01:22:29',1,'--- !map:ActiveSupport::HashWithIndifferentAccess {}\n\n',21.00,'','',''),(31,'katej.fielding@gmail.com','$2a$10$Tn5wodbaNxkHQYj9FOZf5eH4n1BlpaHQIcNCi4MF00RXfSuJgKg/W','Kathy','Fielding',NULL,'',NULL,NULL,NULL,1,'2012-12-27 19:05:52','2012-12-27 19:05:52','173.13.178.157','173.13.178.157','2012-12-27 19:04:08','2012-12-30 03:04:03',NULL,NULL,NULL,NULL,NULL,'--- !map:ActiveSupport::HashWithIndifferentAccess {}\n\n',18.00,'','','');
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
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=441 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `visits`
--

LOCK TABLES `visits` WRITE;
/*!40000 ALTER TABLE `visits` DISABLE KEYS */;
INSERT INTO `visits` VALUES (1,'2012-12-06 19:13:42',NULL,NULL,11,1,11,11,'2012-12-06 19:13:42','2012-12-27 19:04:59',33.00,14.00,NULL,NULL,1,0,0,0,NULL),(11,'2012-12-06 23:31:37',NULL,NULL,11,1,11,11,'2012-12-06 23:31:37','2012-12-27 19:04:59',33.00,14.00,NULL,NULL,1,0,0,0,NULL),(21,'2012-12-06 23:45:50',NULL,NULL,1,1,11,11,'2012-12-06 23:45:50','2012-12-27 19:04:59',33.00,14.00,NULL,NULL,1,0,0,0,NULL),(31,'2012-12-07 03:00:44',NULL,NULL,1,1,11,11,'2012-12-07 03:00:44','2012-12-27 19:04:59',33.00,14.00,NULL,NULL,1,0,0,0,NULL),(41,'2012-12-07 03:05:58',NULL,NULL,1,1,11,11,'2012-12-07 03:05:58','2012-12-27 19:04:59',33.00,14.00,NULL,NULL,1,0,0,0,NULL),(51,'2012-12-07 19:24:24',NULL,NULL,1,1,1,11,'2012-12-07 19:24:24','2012-12-27 19:04:59',33.00,14.00,NULL,NULL,1,0,0,0,NULL),(61,'2012-12-08 22:03:56',NULL,NULL,1,1,11,11,'2012-12-08 22:03:56','2012-12-27 19:04:59',NULL,NULL,NULL,NULL,1,0,0,0,NULL),(71,'2012-12-08 22:10:58',NULL,NULL,1,1,11,11,'2012-12-08 22:10:58','2012-12-27 19:04:59',NULL,NULL,NULL,NULL,1,0,0,0,NULL),(81,'2012-12-08 22:16:51',NULL,NULL,1,1,1,11,'2012-12-08 22:16:51','2012-12-27 19:04:59',NULL,NULL,NULL,NULL,1,0,0,0,NULL),(91,'2012-12-08 22:19:34',NULL,NULL,1,1,1,11,'2012-12-08 22:19:34','2012-12-27 19:04:59',NULL,NULL,NULL,NULL,1,0,0,0,NULL),(101,'2012-12-08 22:21:05','2012-12-08 22:22:22',NULL,1,1,1,11,'2012-12-08 22:21:05','2013-01-02 00:20:24',30.00,19.00,NULL,NULL,1,0,0,0,NULL),(111,'2012-12-08 22:26:47','2012-12-08 22:26:52',NULL,1,1,1,11,'2012-12-08 22:26:47','2013-01-02 00:20:27',30.00,19.00,NULL,NULL,1,0,0,0,NULL),(121,'2012-12-08 22:38:50','2012-12-08 22:44:07',NULL,1,1,1,11,'2012-12-08 22:38:50','2013-01-02 00:20:28',30.00,19.00,NULL,NULL,1,0,5,5,NULL),(131,'2012-12-08 22:48:42',NULL,NULL,1,1,1,11,'2012-12-08 22:48:42','2012-12-27 19:04:58',NULL,NULL,NULL,NULL,1,0,0,0,NULL),(141,'2012-12-08 22:50:36',NULL,NULL,1,1,1,11,'2012-12-08 22:50:36','2012-12-27 19:04:58',NULL,NULL,NULL,NULL,1,0,0,0,NULL),(151,'2012-12-08 23:42:00','2012-12-08 23:42:05',NULL,21,1,11,11,'2012-12-08 23:42:00','2012-12-27 19:04:58',NULL,NULL,NULL,NULL,1,0,0,0,NULL),(161,'2012-12-08 23:42:45','2012-12-08 23:43:27',NULL,21,1,11,11,'2012-12-08 23:42:45','2012-12-27 19:04:58',NULL,NULL,NULL,NULL,1,0,0,0,NULL),(171,'2012-12-09 03:49:21','2012-12-09 03:50:00',NULL,1,1,11,11,'2012-12-09 03:49:21','2012-12-27 19:04:58',NULL,NULL,NULL,NULL,1,0,0,0,NULL),(181,'2012-12-09 18:21:12',NULL,NULL,11,11,21,11,'2012-12-09 18:21:12','2012-12-27 19:04:58',35.00,NULL,NULL,NULL,1,0,0,0,NULL),(191,'2012-12-11 00:54:57',NULL,NULL,1,1,11,11,'2012-12-11 00:54:57','2012-12-27 19:04:58',NULL,NULL,NULL,NULL,1,0,0,0,NULL),(201,'2012-12-11 00:57:13',NULL,NULL,1,1,11,11,'2012-12-11 00:57:13','2012-12-27 19:04:58',NULL,NULL,NULL,NULL,1,0,0,0,NULL),(211,'2012-12-11 00:57:18',NULL,NULL,1,1,11,11,'2012-12-11 00:57:18','2012-12-27 19:04:58',NULL,NULL,NULL,NULL,1,0,0,0,NULL),(221,'2012-12-11 01:36:33','2012-12-11 01:36:42',NULL,1,1,11,11,'2012-12-11 01:36:33','2012-12-27 19:04:58',NULL,NULL,NULL,NULL,1,0,0,0,NULL),(231,'2012-12-12 01:57:32','2012-12-12 01:57:35',NULL,21,1,11,11,'2012-12-12 01:57:32','2012-12-27 19:04:58',NULL,NULL,NULL,NULL,1,0,0,0,NULL),(241,'2012-12-12 01:57:49',NULL,NULL,21,31,41,11,'2012-12-12 01:57:49','2012-12-27 19:04:58',0.00,NULL,NULL,NULL,1,0,0,0,NULL),(251,'2012-12-12 05:45:26','2012-12-12 05:45:40',NULL,11,11,21,11,'2012-12-12 05:45:26','2012-12-27 19:04:58',35.00,NULL,NULL,NULL,1,0,0,0,NULL),(261,'2012-12-12 05:47:47','2012-12-12 05:49:00',NULL,21,31,41,11,'2012-12-12 05:47:47','2012-12-27 19:04:58',0.00,NULL,NULL,NULL,1,0,0,0,NULL),(271,'2012-12-30 00:43:17',NULL,NULL,1,1,11,1,'2012-12-30 00:43:17','2012-12-30 00:43:17',NULL,NULL,NULL,NULL,1,0,0,0,NULL),(281,'2012-12-30 00:51:05',NULL,NULL,1,1,11,1,'2012-12-30 00:51:05','2012-12-30 00:51:05',NULL,NULL,NULL,NULL,1,0,0,0,NULL),(291,'2012-12-30 01:35:46',NULL,NULL,1,1,11,1,'2012-12-30 01:35:46','2012-12-30 01:35:46',NULL,NULL,NULL,NULL,1,0,0,0,NULL),(301,'2012-12-29 03:00:00','2012-12-29 06:20:00',0,1,61,NULL,1,'2012-12-30 03:02:43','2012-12-30 03:02:57',97.00,22.00,NULL,NULL,1,0,200,200,''),(311,'2012-12-29 15:15:00','2012-12-29 16:25:00',0,1,41,51,1,'2012-12-30 03:04:55','2012-12-30 03:04:55',66.00,19.00,NULL,NULL,1,0,70,70,''),(321,'2012-12-28 00:25:00','2012-12-28 00:50:00',0,1,51,61,1,'2012-12-30 03:25:44','2012-12-30 03:25:44',49.00,19.00,NULL,NULL,1,0,25,25,''),(331,'2012-12-30 03:30:13',NULL,NULL,1,1,11,1,'2012-12-30 03:30:13','2012-12-30 03:30:13',NULL,19.00,NULL,NULL,1,0,0,0,NULL),(341,'2012-12-31 01:37:30',NULL,NULL,11,11,21,11,'2012-12-31 01:37:30','2012-12-31 01:37:30',35.00,22.00,NULL,NULL,1,0,0,0,NULL),(351,'2012-12-31 21:39:14','2012-12-31 21:39:27',1,11,11,21,11,'2012-12-31 21:39:14','2013-01-01 19:23:57',35.00,22.00,NULL,NULL,1,0,0,0,NULL),(361,'2013-01-02 00:34:54','2013-01-02 00:36:45',NULL,11,11,21,11,'2013-01-02 00:34:54','2013-01-02 00:36:45',35.00,22.00,NULL,NULL,1,0,0,0,NULL),(371,'2013-01-02 04:51:52',NULL,NULL,11,11,21,11,'2013-01-02 04:51:52','2013-01-02 04:51:52',35.00,22.00,NULL,NULL,1,0,0,0,NULL),(381,'2013-01-02 04:51:53',NULL,NULL,11,11,21,11,'2013-01-02 04:51:53','2013-01-02 04:51:53',35.00,22.00,NULL,NULL,1,0,0,0,NULL),(391,'2013-01-02 04:51:53',NULL,NULL,11,11,21,11,'2013-01-02 04:51:53','2013-01-02 04:51:53',35.00,22.00,NULL,NULL,1,0,0,0,NULL),(401,'2013-01-02 04:51:54',NULL,NULL,11,11,21,11,'2013-01-02 04:51:54','2013-01-02 04:51:54',35.00,22.00,NULL,NULL,1,0,0,0,NULL),(411,'2013-01-02 04:51:54','2013-01-02 04:52:05',1,11,11,21,11,'2013-01-02 04:51:54','2013-01-04 00:31:27',35.00,22.00,NULL,NULL,1,0,0,0,NULL),(421,'2013-01-04 21:54:23',NULL,NULL,1,1,11,1,'2013-01-04 21:54:23','2013-01-04 21:54:23',30.00,19.00,NULL,NULL,1,0,0,0,NULL),(431,'2013-01-04 22:49:57','2013-01-05 05:05:00',0,1,1,11,1,'2013-01-04 22:49:57','2013-01-05 03:06:45',30.00,19.00,NULL,NULL,1,0,375,375,'dcde61f0-3912-0130-1a2c-1231381d8ba4');
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
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `visits_caregiver_tasks`
--

LOCK TABLES `visits_caregiver_tasks` WRITE;
/*!40000 ALTER TABLE `visits_caregiver_tasks` DISABLE KEYS */;
INSERT INTO `visits_caregiver_tasks` VALUES (1,431,111,'2013-01-04 22:49:57','2013-01-04 22:49:57'),(11,431,241,'2013-01-04 22:49:57','2013-01-04 22:49:57');
/*!40000 ALTER TABLE `visits_caregiver_tasks` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `visits_patient_statuses`
--

LOCK TABLES `visits_patient_statuses` WRITE;
/*!40000 ALTER TABLE `visits_patient_statuses` DISABLE KEYS */;
INSERT INTO `visits_patient_statuses` VALUES (1,431,141,'2013-01-04 22:49:57','2013-01-04 22:49:57');
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

-- Dump completed on 2013-01-04 19:25:55
