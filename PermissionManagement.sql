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
-- Table structure for table `AuthorityIncharge`
--

DROP TABLE IF EXISTS `AuthorityIncharge`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `AuthorityIncharge` (
  `authority_id` int(11) NOT NULL AUTO_INCREMENT,
  `auth_lab_id` int(11) NOT NULL,
  `auth_user_id` int(11) NOT NULL,
  `date_of_join` date NOT NULL,
  `date_of_complete` date NOT NULL,
  `auth_status` enum('active','inactive') NOT NULL DEFAULT 'active',
  PRIMARY KEY (`authority_id`),
  KEY `auth_lab_id` (`auth_lab_id`),
  KEY `auth_user_id` (`auth_user_id`),
  CONSTRAINT `AuthorityIncharge_ibfk_1` FOREIGN KEY (`auth_lab_id`) REFERENCES `Lab` (`lab_id`),
  CONSTRAINT `AuthorityIncharge_ibfk_2` FOREIGN KEY (`auth_user_id`) REFERENCES `User` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AuthorityIncharge`
--

LOCK TABLES `AuthorityIncharge` WRITE;
/*!40000 ALTER TABLE `AuthorityIncharge` DISABLE KEYS */;
/*!40000 ALTER TABLE `AuthorityIncharge` ENABLE KEYS */;
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
  `room_number` varchar(10) NOT NULL,
  `lab_dept` varchar(30) NOT NULL DEFAULT 'CSE',
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
INSERT INTO `Lab` VALUES (1,'software system laboratory','itl302','CSE',40,40),(2,'network system laboratory','itl301','CSE',40,40);
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
  PRIMARY KEY (`event_id`),
  KEY `student_rollno` (`student_rollno`),
  KEY `booked_lab_id` (`lab_id`),
  CONSTRAINT `Permission_ibfk_1` FOREIGN KEY (`student_rollno`) REFERENCES `Student` (`rollno`),
  CONSTRAINT `Permission_ibfk_2` FOREIGN KEY (`lab_id`) REFERENCES `Lab` (`lab_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Permission`
--

LOCK TABLES `Permission` WRITE;
/*!40000 ALTER TABLE `Permission` DISABLE KEYS */;
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
  `student_id` int(11) NOT NULL,
  PRIMARY KEY (`rollno`),
  KEY `student_id` (`student_id`),
  CONSTRAINT `Student_ibfk_1` FOREIGN KEY (`student_id`) REFERENCES `User` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Student`
--

LOCK TABLES `Student` WRITE;
/*!40000 ALTER TABLE `Student` DISABLE KEYS */;
/*!40000 ALTER TABLE `Student` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `StudentLabAdmin`
--

DROP TABLE IF EXISTS `StudentLabAdmin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `StudentLabAdmin` (
  `student_admin_rollno` varchar(10) NOT NULL,
  `admin_lab_id` int(11) NOT NULL,
  `date_of_start` date NOT NULL,
  `date_of_end` date NOT NULL,
  `status` enum('active','inactive') NOT NULL DEFAULT 'active',
  KEY `admin_lab_id` (`admin_lab_id`),
  KEY `student_admin_rollno` (`student_admin_rollno`),
  CONSTRAINT `StudentLabAdmin_ibfk_1` FOREIGN KEY (`admin_lab_id`) REFERENCES `Lab` (`lab_id`),
  CONSTRAINT `StudentLabAdmin_ibfk_2` FOREIGN KEY (`student_admin_rollno`) REFERENCES `Student` (`rollno`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `StudentLabAdmin`
--

LOCK TABLES `StudentLabAdmin` WRITE;
/*!40000 ALTER TABLE `StudentLabAdmin` DISABLE KEYS */;
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
INSERT INTO `User` VALUES (1,'Mithun Kumar','mithun','mithun_m170348ca@nitc.ac.in','9931591228','CSE','student'),(2,'Lokeshvar Kumar','lokeshvar','lokeshvar_m170364ca@nitc.ac.in','8210363742','CSE','student_lab_admin'),(3,'Sanjib Kumar Giri','sanjib','sanjib_m170564ca@nitc.ac.in','9853591944','CSE','student'),(4,'Rupesh Kumar Sahu','rupesh','rupesh_m170345ca@nitc.ac.in','8984679161','CSE','student_lab_admin'),(5,'Jayaraj P','J123','notavailablenow','1234567890','CSE','faculty_incharge'),(7,'Biju Francis','B123','notavailablenow1','12345678901','CSE','staff_incharge'),(8,'Sumesh TA','S123','notavailablenow3','1234567891','CSE','faculty_incharge'),(9,'Ajayachandran V R','A123','notavailablenow4','12345678902','CSE','staff_incharge');
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

-- Dump completed on 2019-03-08 14:06:27
