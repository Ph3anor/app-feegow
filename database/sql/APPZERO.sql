-- MySQL dump 10.13  Distrib 8.0.36, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: APPZERO
-- ------------------------------------------------------
-- Server version	8.0.39-0ubuntu0.24.04.2

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
-- Table structure for table `employees`
--

DROP TABLE IF EXISTS `employees`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employees` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `cpf` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `full_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `birth_date` date NOT NULL,
  `has_comorbidity` tinyint(1) NOT NULL DEFAULT '0',
  `first_dose_date` date DEFAULT NULL,
  `second_dose_date` date DEFAULT NULL,
  `third_dose_date` date DEFAULT NULL,
  `vaccine_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `employees_cpf_unique` (`cpf`),
  KEY `employees_vaccine_id_foreign` (`vaccine_id`),
  CONSTRAINT `employees_vaccine_id_foreign` FOREIGN KEY (`vaccine_id`) REFERENCES `vaccines` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=110 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employees`
--

LOCK TABLES `employees` WRITE;
/*!40000 ALTER TABLE `employees` DISABLE KEYS */;
INSERT INTO `employees` VALUES (3,'34567890122','John Doe','1990-01-01',0,'2024-07-09','2024-09-09','2024-09-09',1,NULL,'2024-10-14 11:20:23'),(4,'79889745205','Verna Eichmann','1976-04-09',0,'2023-11-19','2024-08-02','2024-02-03',3,'2024-10-13 15:36:25','2024-10-13 15:36:25'),(5,'09908050129','Ima Hettinger','2001-08-01',1,'2023-11-03','2023-12-12',NULL,1,'2024-10-13 15:36:25','2024-10-13 15:36:25'),(6,'05869591049','Ethelyn Kuhlman MD','2002-09-21',0,'2023-12-22','2023-10-30','2024-10-08',1,'2024-10-13 15:36:25','2024-10-13 15:36:25'),(7,'13806907302','Jennie Jacobi','1985-05-10',1,'2023-12-23','2024-02-11',NULL,3,'2024-10-13 15:36:25','2024-10-13 15:36:25'),(8,'47228874882','Mrs. Melody Gerhold III','1977-03-12',1,'2024-02-12','2024-05-09','2024-08-17',2,'2024-10-13 15:36:25','2024-10-13 15:36:25'),(9,'41516539556','Sabina Glover','1996-10-03',0,'2024-09-15','2024-04-13',NULL,1,'2024-10-13 15:36:25','2024-10-13 15:36:25'),(10,'73291219731','Tatyana Daniel','1985-06-28',0,'2024-04-03','2024-09-06','2024-01-08',2,'2024-10-13 15:36:25','2024-10-13 15:36:25'),(11,'34104923864','Isabel Jast','2003-08-10',0,'2023-12-02','2024-02-28','2024-04-07',3,'2024-10-13 15:36:25','2024-10-13 15:36:25'),(12,'48106601820','Lacey Morissette','2004-05-30',1,'2023-11-08','2024-05-29','2024-02-20',3,'2024-10-13 15:36:25','2024-10-13 15:36:25'),(13,'33306392062','Dr. Mike Hartmann','1988-11-20',0,'2024-03-12','2024-03-03',NULL,2,'2024-10-13 15:36:25','2024-10-13 15:36:25'),(14,'94698521711','Percy Wuckert','1983-05-02',0,'2024-05-19','2024-04-03',NULL,3,'2024-10-13 15:36:25','2024-10-13 15:36:25'),(15,'51248352354','Sven Boehm','1992-11-18',0,'2024-01-12','2024-04-08','2023-11-11',3,'2024-10-13 15:36:25','2024-10-13 15:36:25'),(16,'80741700192','Narciso Rowe','1978-03-17',1,'2024-04-11','2023-11-25','2024-04-22',3,'2024-10-13 15:36:25','2024-10-13 15:36:25'),(17,'03588515818','Mrs. Mellie Hand','1996-07-08',1,'2024-09-27','2023-10-18',NULL,1,'2024-10-13 15:36:25','2024-10-13 15:36:25'),(18,'83858064997','Kian O\'Kon','1993-11-04',0,'2024-03-16','2024-09-20','2024-08-13',3,'2024-10-13 15:36:25','2024-10-13 15:36:25'),(19,'85076973207','Ottis King DDS','2001-07-19',0,'2024-04-03','2024-02-01',NULL,2,'2024-10-13 15:36:25','2024-10-13 15:36:25'),(20,'52565200595','Ms. Calista Padberg DDS','1981-05-09',1,'2024-10-05','2024-05-26',NULL,2,'2024-10-13 15:36:25','2024-10-13 15:36:25'),(21,'69102268926','D\'angelo Morissette','1989-07-13',1,'2024-03-08','2024-05-19','2024-01-03',1,'2024-10-13 15:36:25','2024-10-13 15:36:25'),(22,'84349966996','Arden Hermann','1979-12-29',1,'2023-11-18','2024-07-20','2024-08-30',2,'2024-10-13 15:36:25','2024-10-13 15:36:25'),(23,'17653614309','Zane Shanahan','1993-06-28',0,'2024-10-01','2024-05-31','2023-11-29',3,'2024-10-13 15:36:26','2024-10-13 15:36:26'),(24,'50638634870','Amelia Douglas','1997-06-30',0,'2024-08-05','2024-05-18',NULL,2,'2024-10-13 15:36:26','2024-10-13 15:36:26'),(25,'69442114916','Elisa Cruickshank','2002-04-13',1,'2024-05-17','2024-09-09',NULL,1,'2024-10-13 15:36:26','2024-10-13 15:36:26'),(26,'81916351544','Lauretta Auer','1996-04-14',0,'2024-09-16','2024-08-04','2024-09-20',3,'2024-10-13 15:36:26','2024-10-13 15:36:26'),(27,'00423884907','Mrs. Stephany Hickle PhD','2001-01-31',0,'2024-04-20','2023-11-23',NULL,3,'2024-10-13 15:36:26','2024-10-13 15:36:26'),(28,'66486200635','Mrs. Clementina Leffler','1983-12-31',0,'2024-07-29','2024-01-26','2024-08-05',3,'2024-10-13 15:36:26','2024-10-13 15:36:26'),(29,'37464797056','Dr. Neha Johnston DVM','2004-07-31',1,'2024-06-05','2023-12-02',NULL,3,'2024-10-13 15:36:26','2024-10-13 15:36:26'),(30,'70242387229','Dr. David Thiel II','1980-12-23',0,'2024-09-24','2024-01-02','2024-10-08',3,'2024-10-13 15:36:26','2024-10-13 15:36:26'),(31,'43429605784','Damion Schmidt','1986-09-13',0,'2024-01-20','2023-11-30',NULL,2,'2024-10-13 15:36:26','2024-10-13 15:36:26'),(32,'91477814066','Ms. Sheila Hahn V','1973-09-09',0,'2023-11-18','2024-09-26','2024-06-30',3,'2024-10-13 15:36:26','2024-10-13 15:36:26'),(33,'82366878285','Allene Roberts','1983-02-20',0,'2024-06-07','2024-09-11','2024-03-07',3,'2024-10-13 15:36:26','2024-10-13 15:36:26'),(34,'00446578604','Viviane Sawayn','1971-11-08',0,'2024-02-14','2024-08-04',NULL,2,'2024-10-13 15:36:26','2024-10-13 15:36:26'),(35,'11689020637','Markus Gibson','1986-10-14',0,'2024-04-20','2024-03-10','2023-10-23',1,'2024-10-13 15:36:26','2024-10-13 15:36:26'),(36,'06279627646','Dr. Trudie Gorczany PhD','1978-10-11',1,'2024-05-18','2023-11-29','2024-07-14',3,'2024-10-13 15:36:26','2024-10-13 15:36:26'),(37,'47345021273','Dr. Nico Streich Sr.','1996-07-14',0,'2024-05-02','2024-04-07','2024-06-06',2,'2024-10-13 15:36:26','2024-10-13 15:36:26'),(38,'91885760644','Elroy Orn','1977-12-25',1,'2023-10-29','2023-10-13',NULL,3,'2024-10-13 15:36:26','2024-10-13 15:36:26'),(39,'05650487623','Ms. Lauryn Tillman','1996-09-26',0,'2024-09-18','2023-11-22','2024-08-02',1,'2024-10-13 15:36:26','2024-10-13 15:36:26'),(40,'83473549095','Dr. Colten Thompson','1990-01-09',0,'2024-05-02','2024-09-17','2024-10-06',3,'2024-10-13 15:36:26','2024-10-13 15:36:26'),(41,'66649051946','Delores McLaughlin','1994-02-15',0,'2023-12-28','2024-10-12',NULL,2,'2024-10-13 15:36:26','2024-10-13 15:36:26'),(42,'81626257849','Bruce Hackett','1972-01-26',0,'2024-09-12','2024-07-05',NULL,1,'2024-10-13 15:36:26','2024-10-13 15:36:26'),(43,'80158396133','Elfrieda Waters','1983-09-19',1,'2024-06-11','2023-12-30','2024-08-24',2,'2024-10-13 15:36:26','2024-10-13 15:36:26'),(44,'91280123548','Leonardo Powlowski','2000-03-20',0,'2024-02-03','2024-04-04',NULL,3,'2024-10-13 15:36:26','2024-10-13 15:36:26'),(45,'79168473735','Miss Alexanne Rice MD','1995-07-20',0,'2024-01-24','2023-11-08',NULL,2,'2024-10-13 15:36:26','2024-10-13 15:36:26'),(46,'44224707508','Gerardo Wilkinson','2005-10-17',0,'2024-05-15','2024-09-14','2023-11-03',1,'2024-10-13 15:36:26','2024-10-13 15:36:26'),(47,'18069101196','Dr. Preston Kunze','1985-03-28',0,'2024-05-21','2024-02-08',NULL,2,'2024-10-13 15:36:26','2024-10-13 15:36:26'),(48,'67244004421','Tara Gusikowski Sr.','1990-06-24',1,'2024-07-26','2023-10-26','2024-02-01',3,'2024-10-13 15:36:26','2024-10-13 15:36:26'),(49,'36841922839','Alberto Farrell','1975-02-02',0,'2024-07-28','2024-04-01',NULL,1,'2024-10-13 15:36:26','2024-10-13 15:36:26'),(50,'33091770969','Andrew Kulas PhD','1990-09-22',0,'2024-08-12','2023-11-03',NULL,1,'2024-10-13 15:36:26','2024-10-13 15:36:26'),(51,'12881536194','Krystel Orn','1975-01-23',1,'2024-03-03','2024-05-06','2024-03-02',3,'2024-10-13 15:36:26','2024-10-13 15:36:26'),(52,'01107908568','Afton Dooley','1994-08-15',1,'2024-10-12','2024-07-12',NULL,2,'2024-10-13 15:36:26','2024-10-13 15:36:26'),(53,'29044677961','Prof. Kolby Heller V','1997-04-20',0,'2024-04-23','2024-04-28',NULL,1,'2024-10-13 15:36:26','2024-10-13 15:36:26'),(54,'07145151819','Lizeth Kutch','1983-05-17',1,'2024-05-04','2024-07-05',NULL,1,'2024-10-13 15:36:26','2024-10-13 15:36:26'),(55,'36996479581','Duane Davis','2000-03-06',0,'2024-03-12','2023-11-05',NULL,1,'2024-10-13 15:36:26','2024-10-13 15:36:26'),(56,'91242220979','Lamar Hermiston','2000-12-06',0,'2023-11-20','2023-11-14',NULL,2,'2024-10-13 15:36:26','2024-10-13 15:36:26'),(57,'44521128171','Erik Boehm I','1980-11-04',1,'2024-08-14','2024-03-12',NULL,2,'2024-10-13 15:36:26','2024-10-13 15:36:26'),(58,'39273577921','Garry Rippin','1987-04-02',1,'2024-03-11','2024-01-12','2024-03-16',1,'2024-10-13 15:36:26','2024-10-13 15:36:26'),(59,'07651042076','Haylee Nicolas','2006-01-10',1,'2024-02-06','2024-02-20','2024-02-21',2,'2024-10-13 15:36:26','2024-10-13 15:36:26'),(60,'45930053705','Hailie Waelchi','1970-06-21',0,'2024-08-12','2024-05-09',NULL,3,'2024-10-13 15:36:26','2024-10-13 15:36:26'),(61,'20846189082','Prof. Lillian Hahn Sr.','2005-04-21',1,'2024-04-11','2024-07-22',NULL,3,'2024-10-13 15:36:26','2024-10-13 15:36:26'),(62,'76001332990','Jules Schneider Jr.','1987-03-30',0,'2024-01-10','2024-09-17','2024-04-12',1,'2024-10-13 15:36:26','2024-10-13 15:36:26'),(63,'08227146687','Dr. Caleb Weimann PhD','1995-09-07',0,'2024-05-19','2023-12-23','2024-02-16',3,'2024-10-13 15:36:26','2024-10-13 15:36:26'),(64,'18057675600','Ms. Cortney Kutch','2005-03-22',0,'2024-03-09','2024-03-04',NULL,3,'2024-10-13 15:36:26','2024-10-13 15:36:26'),(65,'54447112628','Prof. Elwin Koss DDS','1998-04-25',0,'2024-09-08','2024-07-19','2024-10-10',1,'2024-10-13 15:36:26','2024-10-13 15:36:26'),(66,'76634136984','Ms. Kelli Oberbrunner','1992-02-06',0,'2024-09-15','2024-01-21',NULL,2,'2024-10-13 15:36:26','2024-10-13 15:36:26'),(67,'27821809435','Micah Dicki','1979-03-26',0,'2024-04-09','2024-07-03','2023-11-08',3,'2024-10-13 15:36:26','2024-10-13 15:36:26'),(68,'71315290995','Dr. Branson Schimmel','1982-08-02',1,'2024-06-27','2024-05-10','2023-10-24',3,'2024-10-13 15:36:26','2024-10-13 15:36:26'),(69,'56577238247','Prof. Lisa Ratke Sr.','1995-08-25',0,'2024-09-18','2024-07-05','2024-10-01',3,'2024-10-13 15:36:26','2024-10-13 15:36:26'),(70,'43408609445','Kyla Quitzon','1970-11-05',0,'2024-07-24','2024-08-01',NULL,2,'2024-10-13 15:36:26','2024-10-13 15:36:26'),(71,'12270457850','Mrs. Krista Koepp','1971-03-04',0,'2024-08-20','2024-05-10','2024-06-21',3,'2024-10-13 15:36:26','2024-10-13 15:36:26'),(72,'68986236406','Dr. Lily Morar','2002-06-06',0,'2024-04-18','2023-11-09',NULL,2,'2024-10-13 15:36:26','2024-10-13 15:36:26'),(73,'77883886560','Yvonne Lueilwitz','1980-09-18',0,'2024-02-05','2023-12-08','2024-07-04',3,'2024-10-13 15:36:26','2024-10-13 15:36:26'),(74,'82888864189','Gaylord Ward','1976-04-11',1,'2024-05-17','2024-07-26',NULL,2,'2024-10-13 15:36:26','2024-10-13 15:36:26'),(75,'59492130408','Ms. Lois Sanford DVM','1998-04-27',0,'2024-01-31','2023-10-23','2023-10-15',2,'2024-10-13 15:36:26','2024-10-13 15:36:26'),(76,'17481682557','Prof. Ethan Beier','1993-05-26',0,'2024-06-20','2023-12-09',NULL,2,'2024-10-13 15:36:26','2024-10-13 15:36:26'),(77,'15278795679','Cora Mraz','1988-09-27',0,'2024-06-02','2024-07-11',NULL,2,'2024-10-13 15:36:26','2024-10-13 15:36:26'),(78,'21696954652','Lila Stehr PhD','1973-10-19',0,'2024-09-27','2024-09-28','2023-10-19',2,'2024-10-13 15:36:26','2024-10-13 15:36:26'),(79,'81130274429','Marcos Schinner','1985-07-23',1,'2023-11-22','2024-04-02',NULL,3,'2024-10-13 15:36:26','2024-10-13 15:36:26'),(80,'14013646156','Kirstin Trantow','1985-02-14',0,'2024-06-04','2024-09-23','2023-10-26',2,'2024-10-13 15:36:26','2024-10-13 15:36:26'),(81,'07595331727','Khalil Rutherford II','1979-04-19',0,'2024-04-27','2024-06-27','2024-01-31',3,'2024-10-13 15:36:26','2024-10-13 15:36:26'),(82,'15408273523','Margot Shanahan IV','2002-02-05',1,'2023-10-14','2024-04-15',NULL,1,'2024-10-13 15:36:26','2024-10-13 15:36:26'),(83,'28527857117','Ms. Jannie Braun','1997-02-15',1,'2024-02-01','2024-06-26',NULL,3,'2024-10-13 15:36:26','2024-10-13 15:36:26'),(84,'11261931123','Prof. Nelson Wilderman','1977-01-25',1,'2024-01-25','2024-10-13',NULL,1,'2024-10-13 15:36:26','2024-10-13 15:36:26'),(85,'64167073150','Joanny Waelchi DVM','1981-07-07',0,'2023-11-20','2024-02-05',NULL,1,'2024-10-13 15:36:26','2024-10-13 15:36:26'),(86,'59495930977','Willie Grant','1986-09-21',0,'2024-08-11','2024-02-23','2024-07-12',2,'2024-10-13 15:36:26','2024-10-13 15:36:26'),(87,'14533154776','Miss Nelle Wiegand','1977-01-19',0,'2024-06-18','2024-10-01',NULL,3,'2024-10-13 15:36:26','2024-10-13 15:36:26'),(88,'08813152182','Mr. Elijah Stiedemann','1992-10-22',0,'2024-07-25','2024-05-16','2024-01-23',1,'2024-10-13 15:36:26','2024-10-13 15:36:26'),(89,'34313404548','Ms. Danika Brekke Jr.','1989-07-10',0,'2024-03-02','2024-07-07',NULL,3,'2024-10-13 15:36:26','2024-10-13 15:36:26'),(90,'34394349626','Emilia Turcotte','1989-03-07',1,'2024-04-04','2024-08-02',NULL,3,'2024-10-13 15:36:26','2024-10-13 15:36:26'),(91,'30354993169','Vicky Bode','1999-07-10',0,'2024-03-23','2024-07-27','2024-03-02',1,'2024-10-13 15:36:26','2024-10-13 15:36:26'),(92,'90419529652','Mr. Ephraim Hill I','1975-02-16',1,'2024-02-23','2024-03-17',NULL,2,'2024-10-13 15:36:26','2024-10-13 15:36:26'),(93,'56865329406','Claire Shields','1998-02-27',0,'2024-10-10','2024-02-07','2024-03-02',1,'2024-10-13 15:36:26','2024-10-13 15:36:26'),(94,'63817747464','Roxanne Konopelski','1980-11-07',0,'2023-11-28','2024-07-17','2024-09-16',3,'2024-10-13 15:36:26','2024-10-13 15:36:26'),(95,'36605360454','Brandi Koelpin MD','1972-02-10',0,'2024-01-10','2024-10-11',NULL,2,'2024-10-13 15:36:26','2024-10-13 15:36:26'),(96,'50879459292','Henriette Fadel','1978-04-17',1,'2024-04-17','2024-03-09','2024-05-17',3,'2024-10-13 15:36:26','2024-10-13 15:36:26'),(97,'25512724016','Ms. Trisha Medhurst I','1996-12-16',1,'2024-05-20','2024-01-26','2024-07-27',1,'2024-10-13 15:36:26','2024-10-13 15:36:26'),(98,'20567049057','Adrain Olson III','1998-11-02',0,'2024-03-30','2024-05-04',NULL,3,'2024-10-13 15:36:26','2024-10-13 15:36:26'),(99,'33500483696','Alexane Zemlak','1973-09-23',1,'2024-09-09','2024-07-02',NULL,1,'2024-10-13 15:36:26','2024-10-13 15:36:26'),(100,'94038053240','Belle Dietrich','1999-10-25',0,'2024-07-27','2024-10-12',NULL,3,'2024-10-13 15:36:26','2024-10-13 15:36:26'),(101,'35511081638','Alan Fisher','2005-02-04',0,'2024-03-25','2024-09-17','2024-09-16',1,'2024-10-13 15:36:26','2024-10-13 15:36:26'),(102,'60333551783','Janis Kuphal','2006-10-04',0,'2023-12-31','2024-04-18','2024-06-12',2,'2024-10-13 15:36:26','2024-10-13 15:36:26'),(103,'21164209786','Fletcher Spencer','1983-03-05',1,'2024-05-13','2024-01-05','2023-10-28',2,'2024-10-13 15:36:26','2024-10-13 15:36:26'),(104,'05602362983','John Doe1','1990-01-01',0,'2024-07-09','2024-09-09',NULL,1,'2024-10-14 11:07:40','2024-10-14 11:07:40'),(105,'05602362982','John Doe1','1990-01-01',0,'2024-07-09','2024-09-09',NULL,1,'2024-10-14 11:07:58','2024-10-14 11:07:58'),(109,'05602362934','John Doe1','1990-01-01',0,'2024-07-09','2024-09-09',NULL,1,'2024-10-14 12:27:05','2024-10-14 12:27:05');
/*!40000 ALTER TABLE `employees` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-10-14  0:35:01
/*
-- Query: SELECT * FROM APPZERO.employees
LIMIT 0, 1000

-- Date: 2024-10-14 00:37
*/
INSERT INTO `` (`id`,`cpf`,`full_name`,`birth_date`,`has_comorbidity`,`first_dose_date`,`second_dose_date`,`third_dose_date`,`vaccine_id`,`created_at`,`updated_at`) VALUES (3,'34567890122','John Doe','1990-01-01',0,'2024-07-09','2024-09-09','2024-09-09',1,NULL,'2024-10-14 08:20:23');
INSERT INTO `` (`id`,`cpf`,`full_name`,`birth_date`,`has_comorbidity`,`first_dose_date`,`second_dose_date`,`third_dose_date`,`vaccine_id`,`created_at`,`updated_at`) VALUES (4,'79889745205','Verna Eichmann','1976-04-09',0,'2023-11-19','2024-08-02','2024-02-03',3,'2024-10-13 12:36:25','2024-10-13 12:36:25');
INSERT INTO `` (`id`,`cpf`,`full_name`,`birth_date`,`has_comorbidity`,`first_dose_date`,`second_dose_date`,`third_dose_date`,`vaccine_id`,`created_at`,`updated_at`) VALUES (5,'09908050129','Ima Hettinger','2001-08-01',1,'2023-11-03','2023-12-12',NULL,1,'2024-10-13 12:36:25','2024-10-13 12:36:25');
INSERT INTO `` (`id`,`cpf`,`full_name`,`birth_date`,`has_comorbidity`,`first_dose_date`,`second_dose_date`,`third_dose_date`,`vaccine_id`,`created_at`,`updated_at`) VALUES (6,'05869591049','Ethelyn Kuhlman MD','2002-09-21',0,'2023-12-22','2023-10-30','2024-10-08',1,'2024-10-13 12:36:25','2024-10-13 12:36:25');
INSERT INTO `` (`id`,`cpf`,`full_name`,`birth_date`,`has_comorbidity`,`first_dose_date`,`second_dose_date`,`third_dose_date`,`vaccine_id`,`created_at`,`updated_at`) VALUES (7,'13806907302','Jennie Jacobi','1985-05-10',1,'2023-12-23','2024-02-11',NULL,3,'2024-10-13 12:36:25','2024-10-13 12:36:25');
INSERT INTO `` (`id`,`cpf`,`full_name`,`birth_date`,`has_comorbidity`,`first_dose_date`,`second_dose_date`,`third_dose_date`,`vaccine_id`,`created_at`,`updated_at`) VALUES (8,'47228874882','Mrs. Melody Gerhold III','1977-03-12',1,'2024-02-12','2024-05-09','2024-08-17',2,'2024-10-13 12:36:25','2024-10-13 12:36:25');
INSERT INTO `` (`id`,`cpf`,`full_name`,`birth_date`,`has_comorbidity`,`first_dose_date`,`second_dose_date`,`third_dose_date`,`vaccine_id`,`created_at`,`updated_at`) VALUES (9,'41516539556','Sabina Glover','1996-10-03',0,'2024-09-15','2024-04-13',NULL,1,'2024-10-13 12:36:25','2024-10-13 12:36:25');
INSERT INTO `` (`id`,`cpf`,`full_name`,`birth_date`,`has_comorbidity`,`first_dose_date`,`second_dose_date`,`third_dose_date`,`vaccine_id`,`created_at`,`updated_at`) VALUES (10,'73291219731','Tatyana Daniel','1985-06-28',0,'2024-04-03','2024-09-06','2024-01-08',2,'2024-10-13 12:36:25','2024-10-13 12:36:25');
INSERT INTO `` (`id`,`cpf`,`full_name`,`birth_date`,`has_comorbidity`,`first_dose_date`,`second_dose_date`,`third_dose_date`,`vaccine_id`,`created_at`,`updated_at`) VALUES (11,'34104923864','Isabel Jast','2003-08-10',0,'2023-12-02','2024-02-28','2024-04-07',3,'2024-10-13 12:36:25','2024-10-13 12:36:25');
INSERT INTO `` (`id`,`cpf`,`full_name`,`birth_date`,`has_comorbidity`,`first_dose_date`,`second_dose_date`,`third_dose_date`,`vaccine_id`,`created_at`,`updated_at`) VALUES (12,'48106601820','Lacey Morissette','2004-05-30',1,'2023-11-08','2024-05-29','2024-02-20',3,'2024-10-13 12:36:25','2024-10-13 12:36:25');
INSERT INTO `` (`id`,`cpf`,`full_name`,`birth_date`,`has_comorbidity`,`first_dose_date`,`second_dose_date`,`third_dose_date`,`vaccine_id`,`created_at`,`updated_at`) VALUES (13,'33306392062','Dr. Mike Hartmann','1988-11-20',0,'2024-03-12','2024-03-03',NULL,2,'2024-10-13 12:36:25','2024-10-13 12:36:25');
INSERT INTO `` (`id`,`cpf`,`full_name`,`birth_date`,`has_comorbidity`,`first_dose_date`,`second_dose_date`,`third_dose_date`,`vaccine_id`,`created_at`,`updated_at`) VALUES (14,'94698521711','Percy Wuckert','1983-05-02',0,'2024-05-19','2024-04-03',NULL,3,'2024-10-13 12:36:25','2024-10-13 12:36:25');
INSERT INTO `` (`id`,`cpf`,`full_name`,`birth_date`,`has_comorbidity`,`first_dose_date`,`second_dose_date`,`third_dose_date`,`vaccine_id`,`created_at`,`updated_at`) VALUES (15,'51248352354','Sven Boehm','1992-11-18',0,'2024-01-12','2024-04-08','2023-11-11',3,'2024-10-13 12:36:25','2024-10-13 12:36:25');
INSERT INTO `` (`id`,`cpf`,`full_name`,`birth_date`,`has_comorbidity`,`first_dose_date`,`second_dose_date`,`third_dose_date`,`vaccine_id`,`created_at`,`updated_at`) VALUES (16,'80741700192','Narciso Rowe','1978-03-17',1,'2024-04-11','2023-11-25','2024-04-22',3,'2024-10-13 12:36:25','2024-10-13 12:36:25');
INSERT INTO `` (`id`,`cpf`,`full_name`,`birth_date`,`has_comorbidity`,`first_dose_date`,`second_dose_date`,`third_dose_date`,`vaccine_id`,`created_at`,`updated_at`) VALUES (17,'03588515818','Mrs. Mellie Hand','1996-07-08',1,'2024-09-27','2023-10-18',NULL,1,'2024-10-13 12:36:25','2024-10-13 12:36:25');
INSERT INTO `` (`id`,`cpf`,`full_name`,`birth_date`,`has_comorbidity`,`first_dose_date`,`second_dose_date`,`third_dose_date`,`vaccine_id`,`created_at`,`updated_at`) VALUES (18,'83858064997','Kian O\'Kon','1993-11-04',0,'2024-03-16','2024-09-20','2024-08-13',3,'2024-10-13 12:36:25','2024-10-13 12:36:25');
INSERT INTO `` (`id`,`cpf`,`full_name`,`birth_date`,`has_comorbidity`,`first_dose_date`,`second_dose_date`,`third_dose_date`,`vaccine_id`,`created_at`,`updated_at`) VALUES (19,'85076973207','Ottis King DDS','2001-07-19',0,'2024-04-03','2024-02-01',NULL,2,'2024-10-13 12:36:25','2024-10-13 12:36:25');
INSERT INTO `` (`id`,`cpf`,`full_name`,`birth_date`,`has_comorbidity`,`first_dose_date`,`second_dose_date`,`third_dose_date`,`vaccine_id`,`created_at`,`updated_at`) VALUES (20,'52565200595','Ms. Calista Padberg DDS','1981-05-09',1,'2024-10-05','2024-05-26',NULL,2,'2024-10-13 12:36:25','2024-10-13 12:36:25');
INSERT INTO `` (`id`,`cpf`,`full_name`,`birth_date`,`has_comorbidity`,`first_dose_date`,`second_dose_date`,`third_dose_date`,`vaccine_id`,`created_at`,`updated_at`) VALUES (21,'69102268926','D\'angelo Morissette','1989-07-13',1,'2024-03-08','2024-05-19','2024-01-03',1,'2024-10-13 12:36:25','2024-10-13 12:36:25');
INSERT INTO `` (`id`,`cpf`,`full_name`,`birth_date`,`has_comorbidity`,`first_dose_date`,`second_dose_date`,`third_dose_date`,`vaccine_id`,`created_at`,`updated_at`) VALUES (22,'84349966996','Arden Hermann','1979-12-29',1,'2023-11-18','2024-07-20','2024-08-30',2,'2024-10-13 12:36:25','2024-10-13 12:36:25');
INSERT INTO `` (`id`,`cpf`,`full_name`,`birth_date`,`has_comorbidity`,`first_dose_date`,`second_dose_date`,`third_dose_date`,`vaccine_id`,`created_at`,`updated_at`) VALUES (23,'17653614309','Zane Shanahan','1993-06-28',0,'2024-10-01','2024-05-31','2023-11-29',3,'2024-10-13 12:36:26','2024-10-13 12:36:26');
INSERT INTO `` (`id`,`cpf`,`full_name`,`birth_date`,`has_comorbidity`,`first_dose_date`,`second_dose_date`,`third_dose_date`,`vaccine_id`,`created_at`,`updated_at`) VALUES (24,'50638634870','Amelia Douglas','1997-06-30',0,'2024-08-05','2024-05-18',NULL,2,'2024-10-13 12:36:26','2024-10-13 12:36:26');
INSERT INTO `` (`id`,`cpf`,`full_name`,`birth_date`,`has_comorbidity`,`first_dose_date`,`second_dose_date`,`third_dose_date`,`vaccine_id`,`created_at`,`updated_at`) VALUES (25,'69442114916','Elisa Cruickshank','2002-04-13',1,'2024-05-17','2024-09-09',NULL,1,'2024-10-13 12:36:26','2024-10-13 12:36:26');
INSERT INTO `` (`id`,`cpf`,`full_name`,`birth_date`,`has_comorbidity`,`first_dose_date`,`second_dose_date`,`third_dose_date`,`vaccine_id`,`created_at`,`updated_at`) VALUES (26,'81916351544','Lauretta Auer','1996-04-14',0,'2024-09-16','2024-08-04','2024-09-20',3,'2024-10-13 12:36:26','2024-10-13 12:36:26');
INSERT INTO `` (`id`,`cpf`,`full_name`,`birth_date`,`has_comorbidity`,`first_dose_date`,`second_dose_date`,`third_dose_date`,`vaccine_id`,`created_at`,`updated_at`) VALUES (27,'00423884907','Mrs. Stephany Hickle PhD','2001-01-31',0,'2024-04-20','2023-11-23',NULL,3,'2024-10-13 12:36:26','2024-10-13 12:36:26');
INSERT INTO `` (`id`,`cpf`,`full_name`,`birth_date`,`has_comorbidity`,`first_dose_date`,`second_dose_date`,`third_dose_date`,`vaccine_id`,`created_at`,`updated_at`) VALUES (28,'66486200635','Mrs. Clementina Leffler','1983-12-31',0,'2024-07-29','2024-01-26','2024-08-05',3,'2024-10-13 12:36:26','2024-10-13 12:36:26');
INSERT INTO `` (`id`,`cpf`,`full_name`,`birth_date`,`has_comorbidity`,`first_dose_date`,`second_dose_date`,`third_dose_date`,`vaccine_id`,`created_at`,`updated_at`) VALUES (29,'37464797056','Dr. Neha Johnston DVM','2004-07-31',1,'2024-06-05','2023-12-02',NULL,3,'2024-10-13 12:36:26','2024-10-13 12:36:26');
INSERT INTO `` (`id`,`cpf`,`full_name`,`birth_date`,`has_comorbidity`,`first_dose_date`,`second_dose_date`,`third_dose_date`,`vaccine_id`,`created_at`,`updated_at`) VALUES (30,'70242387229','Dr. David Thiel II','1980-12-23',0,'2024-09-24','2024-01-02','2024-10-08',3,'2024-10-13 12:36:26','2024-10-13 12:36:26');
INSERT INTO `` (`id`,`cpf`,`full_name`,`birth_date`,`has_comorbidity`,`first_dose_date`,`second_dose_date`,`third_dose_date`,`vaccine_id`,`created_at`,`updated_at`) VALUES (31,'43429605784','Damion Schmidt','1986-09-13',0,'2024-01-20','2023-11-30',NULL,2,'2024-10-13 12:36:26','2024-10-13 12:36:26');
INSERT INTO `` (`id`,`cpf`,`full_name`,`birth_date`,`has_comorbidity`,`first_dose_date`,`second_dose_date`,`third_dose_date`,`vaccine_id`,`created_at`,`updated_at`) VALUES (32,'91477814066','Ms. Sheila Hahn V','1973-09-09',0,'2023-11-18','2024-09-26','2024-06-30',3,'2024-10-13 12:36:26','2024-10-13 12:36:26');
INSERT INTO `` (`id`,`cpf`,`full_name`,`birth_date`,`has_comorbidity`,`first_dose_date`,`second_dose_date`,`third_dose_date`,`vaccine_id`,`created_at`,`updated_at`) VALUES (33,'82366878285','Allene Roberts','1983-02-20',0,'2024-06-07','2024-09-11','2024-03-07',3,'2024-10-13 12:36:26','2024-10-13 12:36:26');
INSERT INTO `` (`id`,`cpf`,`full_name`,`birth_date`,`has_comorbidity`,`first_dose_date`,`second_dose_date`,`third_dose_date`,`vaccine_id`,`created_at`,`updated_at`) VALUES (34,'00446578604','Viviane Sawayn','1971-11-08',0,'2024-02-14','2024-08-04',NULL,2,'2024-10-13 12:36:26','2024-10-13 12:36:26');
INSERT INTO `` (`id`,`cpf`,`full_name`,`birth_date`,`has_comorbidity`,`first_dose_date`,`second_dose_date`,`third_dose_date`,`vaccine_id`,`created_at`,`updated_at`) VALUES (35,'11689020637','Markus Gibson','1986-10-14',0,'2024-04-20','2024-03-10','2023-10-23',1,'2024-10-13 12:36:26','2024-10-13 12:36:26');
INSERT INTO `` (`id`,`cpf`,`full_name`,`birth_date`,`has_comorbidity`,`first_dose_date`,`second_dose_date`,`third_dose_date`,`vaccine_id`,`created_at`,`updated_at`) VALUES (36,'06279627646','Dr. Trudie Gorczany PhD','1978-10-11',1,'2024-05-18','2023-11-29','2024-07-14',3,'2024-10-13 12:36:26','2024-10-13 12:36:26');
INSERT INTO `` (`id`,`cpf`,`full_name`,`birth_date`,`has_comorbidity`,`first_dose_date`,`second_dose_date`,`third_dose_date`,`vaccine_id`,`created_at`,`updated_at`) VALUES (37,'47345021273','Dr. Nico Streich Sr.','1996-07-14',0,'2024-05-02','2024-04-07','2024-06-06',2,'2024-10-13 12:36:26','2024-10-13 12:36:26');
INSERT INTO `` (`id`,`cpf`,`full_name`,`birth_date`,`has_comorbidity`,`first_dose_date`,`second_dose_date`,`third_dose_date`,`vaccine_id`,`created_at`,`updated_at`) VALUES (38,'91885760644','Elroy Orn','1977-12-25',1,'2023-10-29','2023-10-13',NULL,3,'2024-10-13 12:36:26','2024-10-13 12:36:26');
INSERT INTO `` (`id`,`cpf`,`full_name`,`birth_date`,`has_comorbidity`,`first_dose_date`,`second_dose_date`,`third_dose_date`,`vaccine_id`,`created_at`,`updated_at`) VALUES (39,'05650487623','Ms. Lauryn Tillman','1996-09-26',0,'2024-09-18','2023-11-22','2024-08-02',1,'2024-10-13 12:36:26','2024-10-13 12:36:26');
INSERT INTO `` (`id`,`cpf`,`full_name`,`birth_date`,`has_comorbidity`,`first_dose_date`,`second_dose_date`,`third_dose_date`,`vaccine_id`,`created_at`,`updated_at`) VALUES (40,'83473549095','Dr. Colten Thompson','1990-01-09',0,'2024-05-02','2024-09-17','2024-10-06',3,'2024-10-13 12:36:26','2024-10-13 12:36:26');
INSERT INTO `` (`id`,`cpf`,`full_name`,`birth_date`,`has_comorbidity`,`first_dose_date`,`second_dose_date`,`third_dose_date`,`vaccine_id`,`created_at`,`updated_at`) VALUES (41,'66649051946','Delores McLaughlin','1994-02-15',0,'2023-12-28','2024-10-12',NULL,2,'2024-10-13 12:36:26','2024-10-13 12:36:26');
INSERT INTO `` (`id`,`cpf`,`full_name`,`birth_date`,`has_comorbidity`,`first_dose_date`,`second_dose_date`,`third_dose_date`,`vaccine_id`,`created_at`,`updated_at`) VALUES (42,'81626257849','Bruce Hackett','1972-01-26',0,'2024-09-12','2024-07-05',NULL,1,'2024-10-13 12:36:26','2024-10-13 12:36:26');
INSERT INTO `` (`id`,`cpf`,`full_name`,`birth_date`,`has_comorbidity`,`first_dose_date`,`second_dose_date`,`third_dose_date`,`vaccine_id`,`created_at`,`updated_at`) VALUES (43,'80158396133','Elfrieda Waters','1983-09-19',1,'2024-06-11','2023-12-30','2024-08-24',2,'2024-10-13 12:36:26','2024-10-13 12:36:26');
INSERT INTO `` (`id`,`cpf`,`full_name`,`birth_date`,`has_comorbidity`,`first_dose_date`,`second_dose_date`,`third_dose_date`,`vaccine_id`,`created_at`,`updated_at`) VALUES (44,'91280123548','Leonardo Powlowski','2000-03-20',0,'2024-02-03','2024-04-04',NULL,3,'2024-10-13 12:36:26','2024-10-13 12:36:26');
INSERT INTO `` (`id`,`cpf`,`full_name`,`birth_date`,`has_comorbidity`,`first_dose_date`,`second_dose_date`,`third_dose_date`,`vaccine_id`,`created_at`,`updated_at`) VALUES (45,'79168473735','Miss Alexanne Rice MD','1995-07-20',0,'2024-01-24','2023-11-08',NULL,2,'2024-10-13 12:36:26','2024-10-13 12:36:26');
INSERT INTO `` (`id`,`cpf`,`full_name`,`birth_date`,`has_comorbidity`,`first_dose_date`,`second_dose_date`,`third_dose_date`,`vaccine_id`,`created_at`,`updated_at`) VALUES (46,'44224707508','Gerardo Wilkinson','2005-10-17',0,'2024-05-15','2024-09-14','2023-11-03',1,'2024-10-13 12:36:26','2024-10-13 12:36:26');
INSERT INTO `` (`id`,`cpf`,`full_name`,`birth_date`,`has_comorbidity`,`first_dose_date`,`second_dose_date`,`third_dose_date`,`vaccine_id`,`created_at`,`updated_at`) VALUES (47,'18069101196','Dr. Preston Kunze','1985-03-28',0,'2024-05-21','2024-02-08',NULL,2,'2024-10-13 12:36:26','2024-10-13 12:36:26');
INSERT INTO `` (`id`,`cpf`,`full_name`,`birth_date`,`has_comorbidity`,`first_dose_date`,`second_dose_date`,`third_dose_date`,`vaccine_id`,`created_at`,`updated_at`) VALUES (48,'67244004421','Tara Gusikowski Sr.','1990-06-24',1,'2024-07-26','2023-10-26','2024-02-01',3,'2024-10-13 12:36:26','2024-10-13 12:36:26');
INSERT INTO `` (`id`,`cpf`,`full_name`,`birth_date`,`has_comorbidity`,`first_dose_date`,`second_dose_date`,`third_dose_date`,`vaccine_id`,`created_at`,`updated_at`) VALUES (49,'36841922839','Alberto Farrell','1975-02-02',0,'2024-07-28','2024-04-01',NULL,1,'2024-10-13 12:36:26','2024-10-13 12:36:26');
INSERT INTO `` (`id`,`cpf`,`full_name`,`birth_date`,`has_comorbidity`,`first_dose_date`,`second_dose_date`,`third_dose_date`,`vaccine_id`,`created_at`,`updated_at`) VALUES (50,'33091770969','Andrew Kulas PhD','1990-09-22',0,'2024-08-12','2023-11-03',NULL,1,'2024-10-13 12:36:26','2024-10-13 12:36:26');
INSERT INTO `` (`id`,`cpf`,`full_name`,`birth_date`,`has_comorbidity`,`first_dose_date`,`second_dose_date`,`third_dose_date`,`vaccine_id`,`created_at`,`updated_at`) VALUES (51,'12881536194','Krystel Orn','1975-01-23',1,'2024-03-03','2024-05-06','2024-03-02',3,'2024-10-13 12:36:26','2024-10-13 12:36:26');
INSERT INTO `` (`id`,`cpf`,`full_name`,`birth_date`,`has_comorbidity`,`first_dose_date`,`second_dose_date`,`third_dose_date`,`vaccine_id`,`created_at`,`updated_at`) VALUES (52,'01107908568','Afton Dooley','1994-08-15',1,'2024-10-12','2024-07-12',NULL,2,'2024-10-13 12:36:26','2024-10-13 12:36:26');
INSERT INTO `` (`id`,`cpf`,`full_name`,`birth_date`,`has_comorbidity`,`first_dose_date`,`second_dose_date`,`third_dose_date`,`vaccine_id`,`created_at`,`updated_at`) VALUES (53,'29044677961','Prof. Kolby Heller V','1997-04-20',0,'2024-04-23','2024-04-28',NULL,1,'2024-10-13 12:36:26','2024-10-13 12:36:26');
INSERT INTO `` (`id`,`cpf`,`full_name`,`birth_date`,`has_comorbidity`,`first_dose_date`,`second_dose_date`,`third_dose_date`,`vaccine_id`,`created_at`,`updated_at`) VALUES (54,'07145151819','Lizeth Kutch','1983-05-17',1,'2024-05-04','2024-07-05',NULL,1,'2024-10-13 12:36:26','2024-10-13 12:36:26');
INSERT INTO `` (`id`,`cpf`,`full_name`,`birth_date`,`has_comorbidity`,`first_dose_date`,`second_dose_date`,`third_dose_date`,`vaccine_id`,`created_at`,`updated_at`) VALUES (55,'36996479581','Duane Davis','2000-03-06',0,'2024-03-12','2023-11-05',NULL,1,'2024-10-13 12:36:26','2024-10-13 12:36:26');
INSERT INTO `` (`id`,`cpf`,`full_name`,`birth_date`,`has_comorbidity`,`first_dose_date`,`second_dose_date`,`third_dose_date`,`vaccine_id`,`created_at`,`updated_at`) VALUES (56,'91242220979','Lamar Hermiston','2000-12-06',0,'2023-11-20','2023-11-14',NULL,2,'2024-10-13 12:36:26','2024-10-13 12:36:26');
INSERT INTO `` (`id`,`cpf`,`full_name`,`birth_date`,`has_comorbidity`,`first_dose_date`,`second_dose_date`,`third_dose_date`,`vaccine_id`,`created_at`,`updated_at`) VALUES (57,'44521128171','Erik Boehm I','1980-11-04',1,'2024-08-14','2024-03-12',NULL,2,'2024-10-13 12:36:26','2024-10-13 12:36:26');
INSERT INTO `` (`id`,`cpf`,`full_name`,`birth_date`,`has_comorbidity`,`first_dose_date`,`second_dose_date`,`third_dose_date`,`vaccine_id`,`created_at`,`updated_at`) VALUES (58,'39273577921','Garry Rippin','1987-04-02',1,'2024-03-11','2024-01-12','2024-03-16',1,'2024-10-13 12:36:26','2024-10-13 12:36:26');
INSERT INTO `` (`id`,`cpf`,`full_name`,`birth_date`,`has_comorbidity`,`first_dose_date`,`second_dose_date`,`third_dose_date`,`vaccine_id`,`created_at`,`updated_at`) VALUES (59,'07651042076','Haylee Nicolas','2006-01-10',1,'2024-02-06','2024-02-20','2024-02-21',2,'2024-10-13 12:36:26','2024-10-13 12:36:26');
INSERT INTO `` (`id`,`cpf`,`full_name`,`birth_date`,`has_comorbidity`,`first_dose_date`,`second_dose_date`,`third_dose_date`,`vaccine_id`,`created_at`,`updated_at`) VALUES (60,'45930053705','Hailie Waelchi','1970-06-21',0,'2024-08-12','2024-05-09',NULL,3,'2024-10-13 12:36:26','2024-10-13 12:36:26');
INSERT INTO `` (`id`,`cpf`,`full_name`,`birth_date`,`has_comorbidity`,`first_dose_date`,`second_dose_date`,`third_dose_date`,`vaccine_id`,`created_at`,`updated_at`) VALUES (61,'20846189082','Prof. Lillian Hahn Sr.','2005-04-21',1,'2024-04-11','2024-07-22',NULL,3,'2024-10-13 12:36:26','2024-10-13 12:36:26');
INSERT INTO `` (`id`,`cpf`,`full_name`,`birth_date`,`has_comorbidity`,`first_dose_date`,`second_dose_date`,`third_dose_date`,`vaccine_id`,`created_at`,`updated_at`) VALUES (62,'76001332990','Jules Schneider Jr.','1987-03-30',0,'2024-01-10','2024-09-17','2024-04-12',1,'2024-10-13 12:36:26','2024-10-13 12:36:26');
INSERT INTO `` (`id`,`cpf`,`full_name`,`birth_date`,`has_comorbidity`,`first_dose_date`,`second_dose_date`,`third_dose_date`,`vaccine_id`,`created_at`,`updated_at`) VALUES (63,'08227146687','Dr. Caleb Weimann PhD','1995-09-07',0,'2024-05-19','2023-12-23','2024-02-16',3,'2024-10-13 12:36:26','2024-10-13 12:36:26');
INSERT INTO `` (`id`,`cpf`,`full_name`,`birth_date`,`has_comorbidity`,`first_dose_date`,`second_dose_date`,`third_dose_date`,`vaccine_id`,`created_at`,`updated_at`) VALUES (64,'18057675600','Ms. Cortney Kutch','2005-03-22',0,'2024-03-09','2024-03-04',NULL,3,'2024-10-13 12:36:26','2024-10-13 12:36:26');
INSERT INTO `` (`id`,`cpf`,`full_name`,`birth_date`,`has_comorbidity`,`first_dose_date`,`second_dose_date`,`third_dose_date`,`vaccine_id`,`created_at`,`updated_at`) VALUES (65,'54447112628','Prof. Elwin Koss DDS','1998-04-25',0,'2024-09-08','2024-07-19','2024-10-10',1,'2024-10-13 12:36:26','2024-10-13 12:36:26');
INSERT INTO `` (`id`,`cpf`,`full_name`,`birth_date`,`has_comorbidity`,`first_dose_date`,`second_dose_date`,`third_dose_date`,`vaccine_id`,`created_at`,`updated_at`) VALUES (66,'76634136984','Ms. Kelli Oberbrunner','1992-02-06',0,'2024-09-15','2024-01-21',NULL,2,'2024-10-13 12:36:26','2024-10-13 12:36:26');
INSERT INTO `` (`id`,`cpf`,`full_name`,`birth_date`,`has_comorbidity`,`first_dose_date`,`second_dose_date`,`third_dose_date`,`vaccine_id`,`created_at`,`updated_at`) VALUES (67,'27821809435','Micah Dicki','1979-03-26',0,'2024-04-09','2024-07-03','2023-11-08',3,'2024-10-13 12:36:26','2024-10-13 12:36:26');
INSERT INTO `` (`id`,`cpf`,`full_name`,`birth_date`,`has_comorbidity`,`first_dose_date`,`second_dose_date`,`third_dose_date`,`vaccine_id`,`created_at`,`updated_at`) VALUES (68,'71315290995','Dr. Branson Schimmel','1982-08-02',1,'2024-06-27','2024-05-10','2023-10-24',3,'2024-10-13 12:36:26','2024-10-13 12:36:26');
INSERT INTO `` (`id`,`cpf`,`full_name`,`birth_date`,`has_comorbidity`,`first_dose_date`,`second_dose_date`,`third_dose_date`,`vaccine_id`,`created_at`,`updated_at`) VALUES (69,'56577238247','Prof. Lisa Ratke Sr.','1995-08-25',0,'2024-09-18','2024-07-05','2024-10-01',3,'2024-10-13 12:36:26','2024-10-13 12:36:26');
INSERT INTO `` (`id`,`cpf`,`full_name`,`birth_date`,`has_comorbidity`,`first_dose_date`,`second_dose_date`,`third_dose_date`,`vaccine_id`,`created_at`,`updated_at`) VALUES (70,'43408609445','Kyla Quitzon','1970-11-05',0,'2024-07-24','2024-08-01',NULL,2,'2024-10-13 12:36:26','2024-10-13 12:36:26');
INSERT INTO `` (`id`,`cpf`,`full_name`,`birth_date`,`has_comorbidity`,`first_dose_date`,`second_dose_date`,`third_dose_date`,`vaccine_id`,`created_at`,`updated_at`) VALUES (71,'12270457850','Mrs. Krista Koepp','1971-03-04',0,'2024-08-20','2024-05-10','2024-06-21',3,'2024-10-13 12:36:26','2024-10-13 12:36:26');
INSERT INTO `` (`id`,`cpf`,`full_name`,`birth_date`,`has_comorbidity`,`first_dose_date`,`second_dose_date`,`third_dose_date`,`vaccine_id`,`created_at`,`updated_at`) VALUES (72,'68986236406','Dr. Lily Morar','2002-06-06',0,'2024-04-18','2023-11-09',NULL,2,'2024-10-13 12:36:26','2024-10-13 12:36:26');
INSERT INTO `` (`id`,`cpf`,`full_name`,`birth_date`,`has_comorbidity`,`first_dose_date`,`second_dose_date`,`third_dose_date`,`vaccine_id`,`created_at`,`updated_at`) VALUES (73,'77883886560','Yvonne Lueilwitz','1980-09-18',0,'2024-02-05','2023-12-08','2024-07-04',3,'2024-10-13 12:36:26','2024-10-13 12:36:26');
INSERT INTO `` (`id`,`cpf`,`full_name`,`birth_date`,`has_comorbidity`,`first_dose_date`,`second_dose_date`,`third_dose_date`,`vaccine_id`,`created_at`,`updated_at`) VALUES (74,'82888864189','Gaylord Ward','1976-04-11',1,'2024-05-17','2024-07-26',NULL,2,'2024-10-13 12:36:26','2024-10-13 12:36:26');
INSERT INTO `` (`id`,`cpf`,`full_name`,`birth_date`,`has_comorbidity`,`first_dose_date`,`second_dose_date`,`third_dose_date`,`vaccine_id`,`created_at`,`updated_at`) VALUES (75,'59492130408','Ms. Lois Sanford DVM','1998-04-27',0,'2024-01-31','2023-10-23','2023-10-15',2,'2024-10-13 12:36:26','2024-10-13 12:36:26');
INSERT INTO `` (`id`,`cpf`,`full_name`,`birth_date`,`has_comorbidity`,`first_dose_date`,`second_dose_date`,`third_dose_date`,`vaccine_id`,`created_at`,`updated_at`) VALUES (76,'17481682557','Prof. Ethan Beier','1993-05-26',0,'2024-06-20','2023-12-09',NULL,2,'2024-10-13 12:36:26','2024-10-13 12:36:26');
INSERT INTO `` (`id`,`cpf`,`full_name`,`birth_date`,`has_comorbidity`,`first_dose_date`,`second_dose_date`,`third_dose_date`,`vaccine_id`,`created_at`,`updated_at`) VALUES (77,'15278795679','Cora Mraz','1988-09-27',0,'2024-06-02','2024-07-11',NULL,2,'2024-10-13 12:36:26','2024-10-13 12:36:26');
INSERT INTO `` (`id`,`cpf`,`full_name`,`birth_date`,`has_comorbidity`,`first_dose_date`,`second_dose_date`,`third_dose_date`,`vaccine_id`,`created_at`,`updated_at`) VALUES (78,'21696954652','Lila Stehr PhD','1973-10-19',0,'2024-09-27','2024-09-28','2023-10-19',2,'2024-10-13 12:36:26','2024-10-13 12:36:26');
INSERT INTO `` (`id`,`cpf`,`full_name`,`birth_date`,`has_comorbidity`,`first_dose_date`,`second_dose_date`,`third_dose_date`,`vaccine_id`,`created_at`,`updated_at`) VALUES (79,'81130274429','Marcos Schinner','1985-07-23',1,'2023-11-22','2024-04-02',NULL,3,'2024-10-13 12:36:26','2024-10-13 12:36:26');
INSERT INTO `` (`id`,`cpf`,`full_name`,`birth_date`,`has_comorbidity`,`first_dose_date`,`second_dose_date`,`third_dose_date`,`vaccine_id`,`created_at`,`updated_at`) VALUES (80,'14013646156','Kirstin Trantow','1985-02-14',0,'2024-06-04','2024-09-23','2023-10-26',2,'2024-10-13 12:36:26','2024-10-13 12:36:26');
INSERT INTO `` (`id`,`cpf`,`full_name`,`birth_date`,`has_comorbidity`,`first_dose_date`,`second_dose_date`,`third_dose_date`,`vaccine_id`,`created_at`,`updated_at`) VALUES (81,'07595331727','Khalil Rutherford II','1979-04-19',0,'2024-04-27','2024-06-27','2024-01-31',3,'2024-10-13 12:36:26','2024-10-13 12:36:26');
INSERT INTO `` (`id`,`cpf`,`full_name`,`birth_date`,`has_comorbidity`,`first_dose_date`,`second_dose_date`,`third_dose_date`,`vaccine_id`,`created_at`,`updated_at`) VALUES (82,'15408273523','Margot Shanahan IV','2002-02-05',1,'2023-10-14','2024-04-15',NULL,1,'2024-10-13 12:36:26','2024-10-13 12:36:26');
INSERT INTO `` (`id`,`cpf`,`full_name`,`birth_date`,`has_comorbidity`,`first_dose_date`,`second_dose_date`,`third_dose_date`,`vaccine_id`,`created_at`,`updated_at`) VALUES (83,'28527857117','Ms. Jannie Braun','1997-02-15',1,'2024-02-01','2024-06-26',NULL,3,'2024-10-13 12:36:26','2024-10-13 12:36:26');
INSERT INTO `` (`id`,`cpf`,`full_name`,`birth_date`,`has_comorbidity`,`first_dose_date`,`second_dose_date`,`third_dose_date`,`vaccine_id`,`created_at`,`updated_at`) VALUES (84,'11261931123','Prof. Nelson Wilderman','1977-01-25',1,'2024-01-25','2024-10-13',NULL,1,'2024-10-13 12:36:26','2024-10-13 12:36:26');
INSERT INTO `` (`id`,`cpf`,`full_name`,`birth_date`,`has_comorbidity`,`first_dose_date`,`second_dose_date`,`third_dose_date`,`vaccine_id`,`created_at`,`updated_at`) VALUES (85,'64167073150','Joanny Waelchi DVM','1981-07-07',0,'2023-11-20','2024-02-05',NULL,1,'2024-10-13 12:36:26','2024-10-13 12:36:26');
INSERT INTO `` (`id`,`cpf`,`full_name`,`birth_date`,`has_comorbidity`,`first_dose_date`,`second_dose_date`,`third_dose_date`,`vaccine_id`,`created_at`,`updated_at`) VALUES (86,'59495930977','Willie Grant','1986-09-21',0,'2024-08-11','2024-02-23','2024-07-12',2,'2024-10-13 12:36:26','2024-10-13 12:36:26');
INSERT INTO `` (`id`,`cpf`,`full_name`,`birth_date`,`has_comorbidity`,`first_dose_date`,`second_dose_date`,`third_dose_date`,`vaccine_id`,`created_at`,`updated_at`) VALUES (87,'14533154776','Miss Nelle Wiegand','1977-01-19',0,'2024-06-18','2024-10-01',NULL,3,'2024-10-13 12:36:26','2024-10-13 12:36:26');
INSERT INTO `` (`id`,`cpf`,`full_name`,`birth_date`,`has_comorbidity`,`first_dose_date`,`second_dose_date`,`third_dose_date`,`vaccine_id`,`created_at`,`updated_at`) VALUES (88,'08813152182','Mr. Elijah Stiedemann','1992-10-22',0,'2024-07-25','2024-05-16','2024-01-23',1,'2024-10-13 12:36:26','2024-10-13 12:36:26');
INSERT INTO `` (`id`,`cpf`,`full_name`,`birth_date`,`has_comorbidity`,`first_dose_date`,`second_dose_date`,`third_dose_date`,`vaccine_id`,`created_at`,`updated_at`) VALUES (89,'34313404548','Ms. Danika Brekke Jr.','1989-07-10',0,'2024-03-02','2024-07-07',NULL,3,'2024-10-13 12:36:26','2024-10-13 12:36:26');
INSERT INTO `` (`id`,`cpf`,`full_name`,`birth_date`,`has_comorbidity`,`first_dose_date`,`second_dose_date`,`third_dose_date`,`vaccine_id`,`created_at`,`updated_at`) VALUES (90,'34394349626','Emilia Turcotte','1989-03-07',1,'2024-04-04','2024-08-02',NULL,3,'2024-10-13 12:36:26','2024-10-13 12:36:26');
INSERT INTO `` (`id`,`cpf`,`full_name`,`birth_date`,`has_comorbidity`,`first_dose_date`,`second_dose_date`,`third_dose_date`,`vaccine_id`,`created_at`,`updated_at`) VALUES (91,'30354993169','Vicky Bode','1999-07-10',0,'2024-03-23','2024-07-27','2024-03-02',1,'2024-10-13 12:36:26','2024-10-13 12:36:26');
INSERT INTO `` (`id`,`cpf`,`full_name`,`birth_date`,`has_comorbidity`,`first_dose_date`,`second_dose_date`,`third_dose_date`,`vaccine_id`,`created_at`,`updated_at`) VALUES (92,'90419529652','Mr. Ephraim Hill I','1975-02-16',1,'2024-02-23','2024-03-17',NULL,2,'2024-10-13 12:36:26','2024-10-13 12:36:26');
INSERT INTO `` (`id`,`cpf`,`full_name`,`birth_date`,`has_comorbidity`,`first_dose_date`,`second_dose_date`,`third_dose_date`,`vaccine_id`,`created_at`,`updated_at`) VALUES (93,'56865329406','Claire Shields','1998-02-27',0,'2024-10-10','2024-02-07','2024-03-02',1,'2024-10-13 12:36:26','2024-10-13 12:36:26');
INSERT INTO `` (`id`,`cpf`,`full_name`,`birth_date`,`has_comorbidity`,`first_dose_date`,`second_dose_date`,`third_dose_date`,`vaccine_id`,`created_at`,`updated_at`) VALUES (94,'63817747464','Roxanne Konopelski','1980-11-07',0,'2023-11-28','2024-07-17','2024-09-16',3,'2024-10-13 12:36:26','2024-10-13 12:36:26');
INSERT INTO `` (`id`,`cpf`,`full_name`,`birth_date`,`has_comorbidity`,`first_dose_date`,`second_dose_date`,`third_dose_date`,`vaccine_id`,`created_at`,`updated_at`) VALUES (95,'36605360454','Brandi Koelpin MD','1972-02-10',0,'2024-01-10','2024-10-11',NULL,2,'2024-10-13 12:36:26','2024-10-13 12:36:26');
INSERT INTO `` (`id`,`cpf`,`full_name`,`birth_date`,`has_comorbidity`,`first_dose_date`,`second_dose_date`,`third_dose_date`,`vaccine_id`,`created_at`,`updated_at`) VALUES (96,'50879459292','Henriette Fadel','1978-04-17',1,'2024-04-17','2024-03-09','2024-05-17',3,'2024-10-13 12:36:26','2024-10-13 12:36:26');
INSERT INTO `` (`id`,`cpf`,`full_name`,`birth_date`,`has_comorbidity`,`first_dose_date`,`second_dose_date`,`third_dose_date`,`vaccine_id`,`created_at`,`updated_at`) VALUES (97,'25512724016','Ms. Trisha Medhurst I','1996-12-16',1,'2024-05-20','2024-01-26','2024-07-27',1,'2024-10-13 12:36:26','2024-10-13 12:36:26');
INSERT INTO `` (`id`,`cpf`,`full_name`,`birth_date`,`has_comorbidity`,`first_dose_date`,`second_dose_date`,`third_dose_date`,`vaccine_id`,`created_at`,`updated_at`) VALUES (98,'20567049057','Adrain Olson III','1998-11-02',0,'2024-03-30','2024-05-04',NULL,3,'2024-10-13 12:36:26','2024-10-13 12:36:26');
INSERT INTO `` (`id`,`cpf`,`full_name`,`birth_date`,`has_comorbidity`,`first_dose_date`,`second_dose_date`,`third_dose_date`,`vaccine_id`,`created_at`,`updated_at`) VALUES (99,'33500483696','Alexane Zemlak','1973-09-23',1,'2024-09-09','2024-07-02',NULL,1,'2024-10-13 12:36:26','2024-10-13 12:36:26');
INSERT INTO `` (`id`,`cpf`,`full_name`,`birth_date`,`has_comorbidity`,`first_dose_date`,`second_dose_date`,`third_dose_date`,`vaccine_id`,`created_at`,`updated_at`) VALUES (100,'94038053240','Belle Dietrich','1999-10-25',0,'2024-07-27','2024-10-12',NULL,3,'2024-10-13 12:36:26','2024-10-13 12:36:26');
INSERT INTO `` (`id`,`cpf`,`full_name`,`birth_date`,`has_comorbidity`,`first_dose_date`,`second_dose_date`,`third_dose_date`,`vaccine_id`,`created_at`,`updated_at`) VALUES (101,'35511081638','Alan Fisher','2005-02-04',0,'2024-03-25','2024-09-17','2024-09-16',1,'2024-10-13 12:36:26','2024-10-13 12:36:26');
INSERT INTO `` (`id`,`cpf`,`full_name`,`birth_date`,`has_comorbidity`,`first_dose_date`,`second_dose_date`,`third_dose_date`,`vaccine_id`,`created_at`,`updated_at`) VALUES (102,'60333551783','Janis Kuphal','2006-10-04',0,'2023-12-31','2024-04-18','2024-06-12',2,'2024-10-13 12:36:26','2024-10-13 12:36:26');
INSERT INTO `` (`id`,`cpf`,`full_name`,`birth_date`,`has_comorbidity`,`first_dose_date`,`second_dose_date`,`third_dose_date`,`vaccine_id`,`created_at`,`updated_at`) VALUES (103,'21164209786','Fletcher Spencer','1983-03-05',1,'2024-05-13','2024-01-05','2023-10-28',2,'2024-10-13 12:36:26','2024-10-13 12:36:26');
INSERT INTO `` (`id`,`cpf`,`full_name`,`birth_date`,`has_comorbidity`,`first_dose_date`,`second_dose_date`,`third_dose_date`,`vaccine_id`,`created_at`,`updated_at`) VALUES (104,'05602362983','John Doe1','1990-01-01',0,'2024-07-09','2024-09-09',NULL,1,'2024-10-14 08:07:40','2024-10-14 08:07:40');
INSERT INTO `` (`id`,`cpf`,`full_name`,`birth_date`,`has_comorbidity`,`first_dose_date`,`second_dose_date`,`third_dose_date`,`vaccine_id`,`created_at`,`updated_at`) VALUES (105,'05602362982','John Doe1','1990-01-01',0,'2024-07-09','2024-09-09',NULL,1,'2024-10-14 08:07:58','2024-10-14 08:07:58');
INSERT INTO `` (`id`,`cpf`,`full_name`,`birth_date`,`has_comorbidity`,`first_dose_date`,`second_dose_date`,`third_dose_date`,`vaccine_id`,`created_at`,`updated_at`) VALUES (109,'05602362934','John Doe1','1990-01-01',0,'2024-07-09','2024-09-09',NULL,1,'2024-10-14 09:27:05','2024-10-14 09:27:05');


-- MySQL dump 10.13  Distrib 8.0.36, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: APPZERO
-- ------------------------------------------------------
-- Server version	8.0.39-0ubuntu0.24.04.2

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
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `migrations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (23,'2024_10_09_102242_create_vaccines_table',1),(24,'2024_10_09_102312_create_employees_table',1);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-10-14  0:35:02


/*
-- Query: SELECT * FROM APPZERO.migrations
LIMIT 0, 1000

-- Date: 2024-10-14 00:39
*/
INSERT INTO `` (`id`,`migration`,`batch`) VALUES (23,'2024_10_09_102242_create_vaccines_table',1);
INSERT INTO `` (`id`,`migration`,`batch`) VALUES (24,'2024_10_09_102312_create_employees_table',1);


-- MySQL dump 10.13  Distrib 8.0.36, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: APPZERO
-- ------------------------------------------------------
-- Server version	8.0.39-0ubuntu0.24.04.2

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
-- Table structure for table `vaccines`
--

DROP TABLE IF EXISTS `vaccines`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vaccines` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiry_date` date NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vaccines`
--

LOCK TABLES `vaccines` WRITE;
/*!40000 ALTER TABLE `vaccines` DISABLE KEYS */;
INSERT INTO `vaccines` VALUES (1,'Pfizer-BioNTech','B1234','2025-10-13',NULL,NULL),(2,'Moderna','M5678','2025-10-13',NULL,NULL),(3,'AstraZeneca','A9876','2025-10-13',NULL,NULL),(4,'345saq1gfsdgd2e','T123','2026-02-02','2024-10-14 11:25:01','2024-10-14 11:28:10'),(5,'345saqgfsdde','T123','2026-02-02','2024-10-14 11:28:18','2024-10-14 11:28:18'),(6,'A14312','T11231223','2026-02-02','2024-10-14 12:14:43','2024-10-14 12:14:43'),(7,'A14312','T11231223','2026-02-02','2024-10-14 12:19:09','2024-10-14 12:19:09'),(8,'A14312','T11231223','2026-02-02','2024-10-14 12:21:50','2024-10-14 12:21:50'),(9,'Teste','T11231223','2026-02-02','2024-10-14 12:23:29','2024-10-14 12:23:29');
/*!40000 ALTER TABLE `vaccines` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-10-14  0:35:01


/*
-- Query: SELECT * FROM APPZERO.vaccines
LIMIT 0, 1000

-- Date: 2024-10-14 00:40
*/
INSERT INTO `` (`id`,`name`,`batch`,`expiry_date`,`created_at`,`updated_at`) VALUES (1,'Pfizer-BioNTech','B1234','2025-10-13',NULL,NULL);
INSERT INTO `` (`id`,`name`,`batch`,`expiry_date`,`created_at`,`updated_at`) VALUES (2,'Moderna','M5678','2025-10-13',NULL,NULL);
INSERT INTO `` (`id`,`name`,`batch`,`expiry_date`,`created_at`,`updated_at`) VALUES (3,'AstraZeneca','A9876','2025-10-13',NULL,NULL);
INSERT INTO `` (`id`,`name`,`batch`,`expiry_date`,`created_at`,`updated_at`) VALUES (4,'345saq1gfsdgd2e','T123','2026-02-02','2024-10-14 08:25:01','2024-10-14 08:28:10');
INSERT INTO `` (`id`,`name`,`batch`,`expiry_date`,`created_at`,`updated_at`) VALUES (5,'345saqgfsdde','T123','2026-02-02','2024-10-14 08:28:18','2024-10-14 08:28:18');
INSERT INTO `` (`id`,`name`,`batch`,`expiry_date`,`created_at`,`updated_at`) VALUES (6,'A14312','T11231223','2026-02-02','2024-10-14 09:14:43','2024-10-14 09:14:43');
INSERT INTO `` (`id`,`name`,`batch`,`expiry_date`,`created_at`,`updated_at`) VALUES (7,'A14312','T11231223','2026-02-02','2024-10-14 09:19:09','2024-10-14 09:19:09');
INSERT INTO `` (`id`,`name`,`batch`,`expiry_date`,`created_at`,`updated_at`) VALUES (8,'A14312','T11231223','2026-02-02','2024-10-14 09:21:50','2024-10-14 09:21:50');
INSERT INTO `` (`id`,`name`,`batch`,`expiry_date`,`created_at`,`updated_at`) VALUES (9,'Teste','T11231223','2026-02-02','2024-10-14 09:23:29','2024-10-14 09:23:29');
