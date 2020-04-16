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
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=77 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add assignment',1,'add_assignment'),(2,'Can change assignment',1,'change_assignment'),(3,'Can delete assignment',1,'delete_assignment'),(4,'Can view assignment',1,'view_assignment'),(5,'Can add assist',2,'add_assist'),(6,'Can change assist',2,'change_assist'),(7,'Can delete assist',2,'delete_assist'),(8,'Can view assist',2,'view_assist'),(9,'Can add comment',3,'add_comment'),(10,'Can change comment',3,'change_comment'),(11,'Can delete comment',3,'delete_comment'),(12,'Can view comment',3,'view_comment'),(13,'Can add course',4,'add_course'),(14,'Can change course',4,'change_course'),(15,'Can delete course',4,'delete_course'),(16,'Can view course',4,'view_course'),(17,'Can add department',5,'add_department'),(18,'Can change department',5,'change_department'),(19,'Can delete department',5,'delete_department'),(20,'Can view department',5,'view_department'),(21,'Can add enroll',6,'add_enroll'),(22,'Can change enroll',6,'change_enroll'),(23,'Can delete enroll',6,'delete_enroll'),(24,'Can view enroll',6,'view_enroll'),(25,'Can add faculty',7,'add_faculty'),(26,'Can change faculty',7,'change_faculty'),(27,'Can delete faculty',7,'delete_faculty'),(28,'Can view faculty',7,'view_faculty'),(29,'Can add major in',8,'add_majorin'),(30,'Can change major in',8,'change_majorin'),(31,'Can delete major in',8,'delete_majorin'),(32,'Can view major in',8,'view_majorin'),(33,'Can add post',9,'add_post'),(34,'Can change post',9,'change_post'),(35,'Can delete post',9,'delete_post'),(36,'Can view post',9,'view_post'),(37,'Can add pre requisites',10,'add_prerequisites'),(38,'Can change pre requisites',10,'change_prerequisites'),(39,'Can delete pre requisites',10,'delete_prerequisites'),(40,'Can view pre requisites',10,'view_prerequisites'),(41,'Can add section',11,'add_section'),(42,'Can change section',11,'change_section'),(43,'Can delete section',11,'delete_section'),(44,'Can view section',11,'view_section'),(45,'Can add student',12,'add_student'),(46,'Can change student',12,'change_student'),(47,'Can delete student',12,'delete_student'),(48,'Can view student',12,'view_student'),(49,'Can add teach',13,'add_teach'),(50,'Can change teach',13,'change_teach'),(51,'Can delete teach',13,'delete_teach'),(52,'Can view teach',13,'view_teach'),(53,'Can add log entry',14,'add_logentry'),(54,'Can change log entry',14,'change_logentry'),(55,'Can delete log entry',14,'delete_logentry'),(56,'Can view log entry',14,'view_logentry'),(57,'Can add permission',15,'add_permission'),(58,'Can change permission',15,'change_permission'),(59,'Can delete permission',15,'delete_permission'),(60,'Can view permission',15,'view_permission'),(61,'Can add group',16,'add_group'),(62,'Can change group',16,'change_group'),(63,'Can delete group',16,'delete_group'),(64,'Can view group',16,'view_group'),(65,'Can add user',17,'add_user'),(66,'Can change user',17,'change_user'),(67,'Can delete user',17,'delete_user'),(68,'Can view user',17,'view_user'),(69,'Can add content type',18,'add_contenttype'),(70,'Can change content type',18,'change_contenttype'),(71,'Can delete content type',18,'delete_contenttype'),(72,'Can view content type',18,'view_contenttype'),(73,'Can add session',19,'add_session'),(74,'Can change session',19,'change_session'),(75,'Can delete session',19,'delete_session'),(76,'Can view session',19,'view_session');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$180000$CdYb6pCQ22wK$YItStmcxDhkkto6gCxzFGpHxPioakmDVrkKYwNBETr0=','2020-04-16 17:25:30.324997',1,'root','','','root@nittany.edu',1,1,'2020-04-15 14:43:32.190021');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_groups`
--

LOCK TABLES `auth_user_groups` WRITE;
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
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
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2020-04-16 17:16:34.853834','7','ih5431@nittany.edu comments that \"Test Commentin post14',1,'[{\"added\": {}}]',3,1);
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (14,'admin','logentry'),(16,'auth','group'),(15,'auth','permission'),(17,'auth','user'),(18,'contenttypes','contenttype'),(1,'nittanypath','assignment'),(2,'nittanypath','assist'),(3,'nittanypath','comment'),(4,'nittanypath','course'),(5,'nittanypath','department'),(6,'nittanypath','enroll'),(7,'nittanypath','faculty'),(8,'nittanypath','majorin'),(9,'nittanypath','post'),(10,'nittanypath','prerequisites'),(11,'nittanypath','section'),(12,'nittanypath','student'),(13,'nittanypath','teach'),(19,'sessions','session');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2020-04-15 14:41:47.777030'),(2,'auth','0001_initial','2020-04-15 14:41:47.918052'),(3,'admin','0001_initial','2020-04-15 14:41:48.198053'),(4,'admin','0002_logentry_remove_auto_add','2020-04-15 14:41:48.274509'),(5,'admin','0003_logentry_add_action_flag_choices','2020-04-15 14:41:48.297547'),(6,'contenttypes','0002_remove_content_type_name','2020-04-15 14:41:48.395152'),(7,'auth','0002_alter_permission_name_max_length','2020-04-15 14:41:48.435118'),(8,'auth','0003_alter_user_email_max_length','2020-04-15 14:41:48.483262'),(9,'auth','0004_alter_user_username_opts','2020-04-15 14:41:48.501417'),(10,'auth','0005_alter_user_last_login_null','2020-04-15 14:41:48.540865'),(11,'auth','0006_require_contenttypes_0002','2020-04-15 14:41:48.545063'),(12,'auth','0007_alter_validators_add_error_messages','2020-04-15 14:41:48.566867'),(13,'auth','0008_alter_user_username_max_length','2020-04-15 14:41:48.618873'),(14,'auth','0009_alter_user_last_name_max_length','2020-04-15 14:41:48.670482'),(15,'auth','0010_alter_group_name_max_length','2020-04-15 14:41:48.723217'),(16,'auth','0011_update_proxy_permissions','2020-04-15 14:41:48.763444'),(17,'sessions','0001_initial','2020-04-15 14:41:48.785577');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('jp9k8lhxcmwly06r81zc88z1m09jqxxy','MmNkNzBiMWNiZTY4ZTI3ZmEzNDA4Yzg0MWU1OGJkNmEyNTY4Y2M1ODp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIxODhkNTRjZjRlOTMzOTJlZjAyYjVhOTRmODI0NjM5M2M3M2EwNDkyIn0=','2020-04-30 17:25:30.333396');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
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

-- Dump completed on 2020-04-17  2:39:25
