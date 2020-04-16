-- MySQL dump 10.16  Distrib 10.1.37-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: nittanypath
-- ------------------------------------------------------
-- Server version	10.1.37-MariaDB-0+deb9u1

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
-- Table structure for table `assignment`
--

DROP TABLE IF EXISTS `assignment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `assignment` (
  `assi_id` int(11) NOT NULL AUTO_INCREMENT,
  `topic` varchar(45) NOT NULL,
  `creator_id` varchar(40) NOT NULL,
  `content` varchar(500) NOT NULL,
  `section_id` int(11) NOT NULL,
  PRIMARY KEY (`assi_id`),
  KEY `fk_assignment_1_idx` (`creator_id`),
  KEY `assi_section_fk_idx` (`section_id`),
  CONSTRAINT `assi_faculty_1` FOREIGN KEY (`creator_id`) REFERENCES `faculty` (`fac_email_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `assi_section_fk` FOREIGN KEY (`section_id`) REFERENCES `section` (`section_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `assignment`
--

LOCK TABLES `assignment` WRITE;
/*!40000 ALTER TABLE `assignment` DISABLE KEYS */;
INSERT INTO `assignment` VALUES (3,'Homework','rr82@nittany.edu','Just make a database by sqlite3',1),(4,'Homework','gb44@nittany.edu','Please practice with Kaggle',2),(5,'Homework','dc80@nittany.edu','Try make an app with Flutter',3);
/*!40000 ALTER TABLE `assignment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `assist`
--

DROP TABLE IF EXISTS `assist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `assist` (
  `student_id` varchar(40) NOT NULL,
  `section_id` int(11) NOT NULL,
  `semester` varchar(45) NOT NULL,
  PRIMARY KEY (`student_id`,`section_id`,`semester`),
  KEY `assist_section_fk_idx` (`section_id`),
  CONSTRAINT `assist_section_fk` FOREIGN KEY (`section_id`) REFERENCES `section` (`section_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_assist_1` FOREIGN KEY (`student_id`) REFERENCES `student` (`stu_email_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `assist`
--

LOCK TABLES `assist` WRITE;
/*!40000 ALTER TABLE `assist` DISABLE KEYS */;
INSERT INTO `assist` VALUES ('ih5431@nittany.edu',1,'2020'),('ih5431@nittany.edu',2,'2020'),('ih5431@nittany.edu',3,'2020');
/*!40000 ALTER TABLE `assist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comment`
--

DROP TABLE IF EXISTS `comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `comment` (
  `com_id` int(11) NOT NULL AUTO_INCREMENT,
  `post_id` int(11) NOT NULL,
  `reviewer_id` varchar(40) DEFAULT NULL,
  `review_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `content` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`com_id`),
  KEY `fk_comment_1_idx` (`post_id`),
  CONSTRAINT `fk_comment_1` FOREIGN KEY (`post_id`) REFERENCES `post` (`post_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comment`
--

LOCK TABLES `comment` WRITE;
/*!40000 ALTER TABLE `comment` DISABLE KEYS */;
INSERT INTO `comment` VALUES (7,14,'ih5431@nittany.edu','2020-04-16 09:16:25','Test Comment');
/*!40000 ALTER TABLE `comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `course`
--

DROP TABLE IF EXISTS `course`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `course` (
  `course_id` varchar(40) NOT NULL,
  `c_name` varchar(45) NOT NULL,
  `c_department` varchar(40) NOT NULL,
  `drop_deadline` datetime DEFAULT NULL,
  `c_description` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`course_id`),
  KEY `course_dep_fk_idx` (`c_department`),
  CONSTRAINT `course_dep_fk` FOREIGN KEY (`c_department`) REFERENCES `department` (`dep_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `course`
--

LOCK TABLES `course` WRITE;
/*!40000 ALTER TABLE `course` DISABLE KEYS */;
INSERT INTO `course` VALUES ('CMPSC431W','DBMS','1','2020-05-10 18:00:00','3 Credit Course'),('CMPSC475','Applications Programming','1','2020-05-10 18:00:00','3 Credit Course.'),('CMPSC497','Introduction to Data Mining','1','2020-05-10 18:00:00','3 Credit Course.');
/*!40000 ALTER TABLE `course` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `department`
--

DROP TABLE IF EXISTS `department`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `department` (
  `dep_id` varchar(40) NOT NULL,
  `dep_name` varchar(45) NOT NULL,
  PRIMARY KEY (`dep_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `department`
--

LOCK TABLES `department` WRITE;
/*!40000 ALTER TABLE `department` DISABLE KEYS */;
INSERT INTO `department` VALUES ('1','Computer Science');
/*!40000 ALTER TABLE `department` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `enroll`
--

DROP TABLE IF EXISTS `enroll`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `enroll` (
  `student_id` varchar(40) NOT NULL,
  `section_id` int(11) NOT NULL,
  `grade` float DEFAULT NULL,
  PRIMARY KEY (`student_id`,`section_id`),
  KEY `enroll_section_fk_idx` (`section_id`),
  CONSTRAINT `enroll_section_fk` FOREIGN KEY (`section_id`) REFERENCES `section` (`section_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_enroll_student` FOREIGN KEY (`student_id`) REFERENCES `student` (`stu_email_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `enroll`
--

LOCK TABLES `enroll` WRITE;
/*!40000 ALTER TABLE `enroll` DISABLE KEYS */;
INSERT INTO `enroll` VALUES ('ih5431@nittany.edu',1,97),('ih5431@nittany.edu',2,NULL),('ih5431@nittany.edu',3,76);
/*!40000 ALTER TABLE `enroll` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `faculty`
--

DROP TABLE IF EXISTS `faculty`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `faculty` (
  `fac_email_id` varchar(40) NOT NULL,
  `fac_name` varchar(45) DEFAULT NULL,
  `department_id` varchar(40) NOT NULL,
  `office` varchar(45) DEFAULT NULL,
  `title` varchar(45) DEFAULT NULL,
  `age` int(10) unsigned zerofill NOT NULL,
  `gender` char(5) DEFAULT 'M',
  `home_address` varchar(45) DEFAULT NULL,
  `login_password` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`fac_email_id`),
  KEY `faculty_dep_fk_idx` (`department_id`),
  CONSTRAINT `faculty_dep_fk` FOREIGN KEY (`department_id`) REFERENCES `department` (`dep_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `faculty`
--

LOCK TABLES `faculty` WRITE;
/*!40000 ALTER TABLE `faculty` DISABLE KEYS */;
INSERT INTO `faculty` VALUES ('dc80@nittany.edu','Dr Deshawn Cox','1','187, Building 7','Professor',0000000051,'M',NULL,'e710c8b05f252015399650c8e04e29a0'),('gb44@nittany.edu','Dr Gil Bell','1','284, Building 7','Professor',0000000052,'M',NULL,'8d02afab8c3c7b98884106b6d24d75cd'),('rr82@nittany.edu','Dr Russell Richardson','1','168, Building 7','Head',0000000053,'M',NULL,'d1d58ae5702bc51d459ec74a3d694ab2');
/*!40000 ALTER TABLE `faculty` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `major_in`
--

DROP TABLE IF EXISTS `major_in`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `major_in` (
  `student_id` varchar(40) NOT NULL,
  `dept_id` varchar(40) NOT NULL,
  PRIMARY KEY (`student_id`,`dept_id`),
  KEY `major_in_dep_fk_idx` (`dept_id`),
  CONSTRAINT `fk_major_in_student` FOREIGN KEY (`student_id`) REFERENCES `student` (`stu_email_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `major_in_dep_fk` FOREIGN KEY (`dept_id`) REFERENCES `department` (`dep_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `major_in`
--

LOCK TABLES `major_in` WRITE;
/*!40000 ALTER TABLE `major_in` DISABLE KEYS */;
INSERT INTO `major_in` VALUES ('ih5431@nittany.edu','1');
/*!40000 ALTER TABLE `major_in` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `post`
--

DROP TABLE IF EXISTS `post`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `post` (
  `post_id` int(11) NOT NULL AUTO_INCREMENT,
  `poster_id` varchar(40) NOT NULL,
  `post_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `post_content` varchar(200) DEFAULT NULL,
  `course_id` varchar(40) NOT NULL,
  PRIMARY KEY (`post_id`),
  KEY `fk_post_1_idx` (`course_id`),
  CONSTRAINT `fk_post_1` FOREIGN KEY (`course_id`) REFERENCES `course` (`course_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `post`
--

LOCK TABLES `post` WRITE;
/*!40000 ALTER TABLE `post` DISABLE KEYS */;
INSERT INTO `post` VALUES (13,'rr82@nittany.edu','2020-04-16 10:13:24','Hello World','CMPSC431W'),(14,'rr82@nittany.edu','2020-04-16 10:28:17','Test Data','CMPSC431W');
/*!40000 ALTER TABLE `post` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pre-requisites`
--

DROP TABLE IF EXISTS `pre-requisites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pre-requisites` (
  `pre_id` varchar(40) NOT NULL,
  `Course_id` varchar(40) NOT NULL,
  KEY `fk_pre-requisites_1_idx` (`Course_id`),
  KEY `fk_pre-requisites_2_idx` (`pre_id`),
  CONSTRAINT `fk_pre-requisites_1` FOREIGN KEY (`Course_id`) REFERENCES `course` (`course_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_pre-requisites_2` FOREIGN KEY (`pre_id`) REFERENCES `course` (`course_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pre-requisites`
--

LOCK TABLES `pre-requisites` WRITE;
/*!40000 ALTER TABLE `pre-requisites` DISABLE KEYS */;
/*!40000 ALTER TABLE `pre-requisites` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `section`
--

DROP TABLE IF EXISTS `section`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `section` (
  `section_id` int(11) NOT NULL AUTO_INCREMENT,
  `section_number` varchar(45) NOT NULL,
  `course_id` varchar(40) NOT NULL,
  PRIMARY KEY (`section_id`),
  KEY `fk_section_1_idx` (`course_id`),
  CONSTRAINT `fk_section_1` FOREIGN KEY (`course_id`) REFERENCES `course` (`course_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `section`
--

LOCK TABLES `section` WRITE;
/*!40000 ALTER TABLE `section` DISABLE KEYS */;
INSERT INTO `section` VALUES (1,'1','CMPSC431W'),(2,'2','CMPSC497'),(3,'1','CMPSC475');
/*!40000 ALTER TABLE `section` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student`
--

DROP TABLE IF EXISTS `student`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `student` (
  `stu_email_id` varchar(40) NOT NULL,
  `stu_name` varchar(45) NOT NULL,
  `major` varchar(45) NOT NULL,
  `age` int(10) unsigned zerofill NOT NULL,
  `gender` char(5) DEFAULT 'M',
  `home_address` varchar(45) DEFAULT NULL,
  `login_password` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`stu_email_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student`
--

LOCK TABLES `student` WRITE;
/*!40000 ALTER TABLE `student` DISABLE KEYS */;
INSERT INTO `student` VALUES ('ih5431@nittany.edu','Isobel Hudson','CMPSC',0000000020,'F','9408 Anderson Court,Penrose,Colorado,81240','496a66f7b0668bb161e11ec4ed76148d');
/*!40000 ALTER TABLE `student` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `teach`
--

DROP TABLE IF EXISTS `teach`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `teach` (
  `faculty_id` varchar(40) NOT NULL,
  `section_id` int(11) NOT NULL,
  `semester` varchar(45) NOT NULL,
  `announcement` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`faculty_id`,`section_id`,`semester`),
  KEY `teach_section_fk_idx` (`section_id`),
  CONSTRAINT `teach_faculty_fk` FOREIGN KEY (`faculty_id`) REFERENCES `faculty` (`fac_email_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `teach_section_fk` FOREIGN KEY (`section_id`) REFERENCES `section` (`section_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `teach`
--

LOCK TABLES `teach` WRITE;
/*!40000 ALTER TABLE `teach` DISABLE KEYS */;
INSERT INTO `teach` VALUES ('dc80@nittany.edu',3,'2020',''),('gb44@nittany.edu',2,'2020',''),('rr82@nittany.edu',1,'2020','');
/*!40000 ALTER TABLE `teach` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-04-17  2:40:53
