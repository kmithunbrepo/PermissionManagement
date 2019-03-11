-- MySQL dump 10.13  Distrib 5.7.25, for Linux (x86_64)
--
-- Host: localhost    Database: PermissionManagement
-- ------------------------------------------------------
-- Server version	5.7.25-0ubuntu0.18.04.2

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
-- Table structure for table `Authority`
--

DROP TABLE IF EXISTS `Authority`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Authority` (
  `authority_id` int(11) NOT NULL AUTO_INCREMENT,
  `lab_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `join_date` date NOT NULL,
  `leave_date` date DEFAULT NULL,
  `status` enum('active','inactive') NOT NULL DEFAULT 'active',
  PRIMARY KEY (`authority_id`),
  KEY `Authority_ibfk_1` (`lab_id`),
  KEY `Authority_ibfk_2` (`user_id`),
  CONSTRAINT `Authority_ibfk_1` FOREIGN KEY (`lab_id`) REFERENCES `Lab` (`lab_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `Authority_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `User` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Authority`
--

LOCK TABLES `Authority` WRITE;
/*!40000 ALTER TABLE `Authority` DISABLE KEYS */;
INSERT INTO `Authority` VALUES (1,1,5,'2000-01-01',NULL,'active'),(2,1,7,'2000-01-01',NULL,'active'),(3,2,8,'1999-02-01',NULL,'active'),(4,2,9,'1999-02-01',NULL,'active'),(5,1,2,'2018-09-15',NULL,'active'),(7,1,4,'2018-09-17',NULL,'active'),(8,2,6,'2018-11-17',NULL,'active');
/*!40000 ALTER TABLE `Authority` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Lab`
--

DROP TABLE IF EXISTS `Lab`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Lab` (
  `lab_id` int(11) NOT NULL AUTO_INCREMENT,
  `lab_name` varchar(30) NOT NULL,
  `lab` varchar(10) NOT NULL,
  `room_number` varchar(10) NOT NULL,
  `dept` varchar(10) NOT NULL DEFAULT 'csed',
  `max_capacity` int(11) NOT NULL DEFAULT '40',
  `availability` int(11) NOT NULL DEFAULT '40',
  PRIMARY KEY (`lab_id`),
  UNIQUE KEY `lab_name` (`lab_name`),
  UNIQUE KEY `room_number` (`room_number`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Lab`
--

LOCK TABLES `Lab` WRITE;
/*!40000 ALTER TABLE `Lab` DISABLE KEYS */;
INSERT INTO `Lab` VALUES (1,'network system laboratory','nsl','itl301','cse',40,38),(2,'software system laboratory','ssl','itl302','cse',40,39);
/*!40000 ALTER TABLE `Lab` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Permission`
--

DROP TABLE IF EXISTS `Permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Permission` (
  `event_id` int(11) NOT NULL AUTO_INCREMENT,
  `start_datetime` datetime NOT NULL,
  `end_datetime` datetime NOT NULL,
  `purpose` varchar(1000) NOT NULL,
  `student_rollno` varchar(10) NOT NULL,
  `student_name` varchar(50) NOT NULL,
  `raised_datetime` datetime NOT NULL,
  `response_datetime` datetime DEFAULT NULL,
  `status` enum('pending','lab_admin','faculty_incharge','approved','declined') NOT NULL DEFAULT 'lab_admin',
  `lab_id` int(11) NOT NULL,
  `max_audience` int(11) NOT NULL,
  `dept` varchar(10) NOT NULL DEFAULT 'cse',
  PRIMARY KEY (`event_id`),
  KEY `student_rollno` (`student_rollno`),
  KEY `booked_lab_id` (`lab_id`),
  CONSTRAINT `Permission_ibfk_1` FOREIGN KEY (`student_rollno`) REFERENCES `Student` (`rollno`),
  CONSTRAINT `Permission_ibfk_2` FOREIGN KEY (`lab_id`) REFERENCES `Lab` (`lab_id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Permission`
--

LOCK TABLES `Permission` WRITE;
/*!40000 ALTER TABLE `Permission` DISABLE KEYS */;
INSERT INTO `Permission` VALUES (1,'2019-03-11 12:00:00','2019-03-11 16:00:00','Get in touch with Linux','m170348ca','mithun kumar','2019-03-10 15:37:36','2019-03-10 16:05:59','approved',1,30,'cse'),(2,'2019-03-12 11:00:00','2019-03-12 14:00:00','Learn Basic of C++','m170364ca','lokeshvar kumar','2019-03-10 15:39:04','2019-03-10 23:41:04','approved',2,35,'cse'),(3,'2019-03-16 14:00:00','2019-03-16 17:00:00','Blockchain Introduction','m170345ca','rupesh kumar sahu','2019-03-10 15:40:20','2019-03-11 17:17:37','pending',1,39,'cse'),(4,'2019-03-17 13:00:00','2019-03-17 15:00:00','Android Workshop','m170564ca','sanjib kumar giri','2019-03-10 15:42:30','2019-03-10 22:54:37','declined',2,23,'cse'),(5,'2019-03-15 11:11:00','2019-03-18 16:00:00','Android','m170348ca','mithun kumar','2019-03-10 22:52:26','2019-03-10 22:55:12','approved',2,15,'cse'),(6,'2019-03-14 04:04:00','2020-03-11 14:21:00','Sanjib    hiii','m170348ca','mithun kumar','2019-03-10 23:26:23','2019-03-11 10:27:45','approved',2,111,'cse'),(7,'2019-03-12 12:00:00','2019-03-12 16:00:00','learning c','m170348ca','mithun kumar','2019-03-11 11:51:38','2019-03-11 12:00:24','declined',2,15,'cse'),(8,'2019-03-14 12:00:00','2019-03-14 14:00:00','Intro to CPP','m170345ca','rupesh kumar sahu','2019-03-11 13:12:37','2019-03-11 14:35:02','approved',1,38,'cse'),(9,'2019-03-16 13:10:00','2019-03-17 16:00:00','Github workshop','m170364ca','lokeshvar kumar','2019-03-11 13:56:59','2019-03-11 14:06:43','approved',2,21,'cse'),(10,'2019-03-12 16:00:00','2019-03-12 19:00:00','Intro to MySQL','m170345ca','rupesh kumar sahu','2019-03-11 18:48:13',NULL,'lab_admin',1,38,'cse'),(11,'2019-03-11 19:48:00','2019-03-12 19:48:00','Intro to JSP','m170564ca','sanjib kumar giri','2019-03-11 19:48:33','2019-03-11 19:49:19','pending',1,10,'cse');
/*!40000 ALTER TABLE `Permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Student`
--

DROP TABLE IF EXISTS `Student`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Student` (
  `rollno` varchar(10) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`rollno`),
  KEY `student_id` (`user_id`),
  CONSTRAINT `Student_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `User` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Student`
--

LOCK TABLES `Student` WRITE;
/*!40000 ALTER TABLE `Student` DISABLE KEYS */;
INSERT INTO `Student` VALUES ('m170348ca',1),('m170364ca',2),('m170564ca',3),('m170345ca',4),('m170363ca',6);
/*!40000 ALTER TABLE `Student` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `StudentLabAdmin`
--

DROP TABLE IF EXISTS `StudentLabAdmin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `StudentLabAdmin` (
  `student_lab_admin_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `lab_id` int(11) NOT NULL,
  `join_date` date NOT NULL,
  `leave_date` date DEFAULT NULL,
  `status` enum('active','inactive') NOT NULL DEFAULT 'active',
  PRIMARY KEY (`student_lab_admin_id`),
  KEY `admin_lab_id` (`lab_id`),
  KEY `StudentLabAdmin_ibfk_1` (`user_id`),
  CONSTRAINT `StudentLabAdmin_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `User` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `StudentLabAdmin_ibfk_2` FOREIGN KEY (`lab_id`) REFERENCES `Lab` (`lab_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `StudentLabAdmin`
--

LOCK TABLES `StudentLabAdmin` WRITE;
/*!40000 ALTER TABLE `StudentLabAdmin` DISABLE KEYS */;
INSERT INTO `StudentLabAdmin` VALUES (1,2,1,'2018-09-15',NULL,'active'),(2,4,1,'2018-09-17',NULL,'active'),(3,6,2,'2018-11-17',NULL,'active');
/*!40000 ALTER TABLE `StudentLabAdmin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `User`
--

DROP TABLE IF EXISTS `User`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `User` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `mobile` varchar(11) DEFAULT NULL,
  `dept` varchar(30) NOT NULL DEFAULT 'CSE',
  `type` enum('student','faculty_incharge','staff_incharge','student_lab_admin') NOT NULL DEFAULT 'student',
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `mobile` (`mobile`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `User`
--

LOCK TABLES `User` WRITE;
/*!40000 ALTER TABLE `User` DISABLE KEYS */;
INSERT INTO `User` VALUES (1,'mithun kumar','mithun','mithun_m170348ca@nitc.ac.in','9931591228','cse','student'),(2,'lokeshvar kumar','lokeshvar','lokeshvar_m170364ca@nitc.ac.in','8210363742','cse','student_lab_admin'),(3,'sanjib kumar giri','sanjib','sanjib_m170564ca@nitc.ac.in','9853591944','cse','student'),(4,'rupesh kumar sahu','rupesh','rupesh_m170345ca@nitc.ac.in','8984679161','cse','student_lab_admin'),(5,'jayraj p','J123','notavailablenow','1234567890','cse','faculty_incharge'),(6,'pankaj kumar saini','pankaj','pankaj_m170363ca@nitc.ac.in','9876543210','cse','student'),(7,'biju francis','B123','notavailablenow1','12345678901','cse','staff_incharge'),(8,'Sumesh TA','S123','notavailablenow3','1234567891','cse','faculty_incharge'),(9,'Ajayachandran V R','A123','notavailablenow4','12345678902','cse','staff_incharge');
/*!40000 ALTER TABLE `User` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-03-11 19:53:53
