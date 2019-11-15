-- MySQL dump 10.13  Distrib 8.0.17, for Win64 (x86_64)
--
-- Host: localhost    Database: avali8
-- ------------------------------------------------------
-- Server version	8.0.17

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `adonis_schema`
--

DROP TABLE IF EXISTS `adonis_schema`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `adonis_schema` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `batch` int(11) DEFAULT NULL,
  `migration_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `adonis_schema`
--

LOCK TABLES `adonis_schema` WRITE;
/*!40000 ALTER TABLE `adonis_schema` DISABLE KEYS */;
INSERT INTO `adonis_schema` VALUES (1,'1503250034279_user',1,'2019-11-03 21:27:38'),(2,'1571017786101_create_permissions_table',1,'2019-11-03 21:27:39'),(3,'1571017786120_create_roles_table',1,'2019-11-03 21:27:39'),(4,'1571017786130_create_permission_role_table',1,'2019-11-03 21:27:40'),(5,'1571017786140_create_permission_user_table',1,'2019-11-03 21:27:40'),(6,'1571017786146_create_role_user_table',1,'2019-11-03 21:27:41'),(7,'1572464834443_exam_schema',1,'2019-11-03 21:27:41'),(8,'1572569635574_user_make_exam_schema',1,'2019-11-03 21:27:42'),(9,'1572609994516_token',1,'2019-11-03 21:27:43'),(10,'1572811269719_badge_schema',1,'2019-11-03 21:27:43'),(11,'1572815313530_user_has_badge_schema',1,'2019-11-03 21:27:44'),(12,'1571862825457_question_schema',2,'2019-11-03 21:28:02'),(13,'1571865548231_alternative_schema',3,'2019-11-03 21:29:17');
/*!40000 ALTER TABLE `adonis_schema` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `alternatives`
--

DROP TABLE IF EXISTS `alternatives`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `alternatives` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `question_id` int(10) unsigned DEFAULT NULL,
  `a` varchar(500) DEFAULT NULL,
  `b` varchar(500) DEFAULT NULL,
  `c` varchar(500) DEFAULT NULL,
  `d` varchar(500) DEFAULT NULL,
  `right_alternative` enum('a','b','c','d') NOT NULL,
  `selected_alternative` enum('a','b','c','d') DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `alternatives_question_id_foreign` (`question_id`),
  CONSTRAINT `alternatives_question_id_foreign` FOREIGN KEY (`question_id`) REFERENCES `questions` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `alternatives`
--

LOCK TABLES `alternatives` WRITE;
/*!40000 ALTER TABLE `alternatives` DISABLE KEYS */;
INSERT INTO `alternatives` VALUES (5,5,'blabla1','blabla2','blabla3','blabla4','a',NULL,'2019-11-03 21:47:27','2019-11-03 21:47:27'),(6,6,'blabla1','blabla2','blabla3','blabla4','a',NULL,'2019-11-03 21:47:27','2019-11-03 21:47:27'),(7,7,'blabla1','blabla2','blabla3','blabla4','a',NULL,'2019-11-03 21:47:27','2019-11-03 21:47:27'),(8,8,'blabla1','blabla2','blabla3','blabla4','a',NULL,'2019-11-03 21:47:27','2019-11-03 21:47:27');
/*!40000 ALTER TABLE `alternatives` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `badges`
--

DROP TABLE IF EXISTS `badges`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `badges` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned DEFAULT NULL,
  `exam_id` int(10) unsigned DEFAULT NULL,
  `name` varchar(150) NOT NULL,
  `score` enum('1','2','3') NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `exam_id` (`exam_id`),
  CONSTRAINT `badges_exam_id_foreign` FOREIGN KEY (`exam_id`) REFERENCES `exams` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `badges_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `badges`
--

LOCK TABLES `badges` WRITE;
/*!40000 ALTER TABLE `badges` DISABLE KEYS */;
INSERT INTO `badges` VALUES (5,2,5,'test','3','2019-11-03 21:47:27','2019-11-03 21:47:27');
/*!40000 ALTER TABLE `badges` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exams`
--

DROP TABLE IF EXISTS `exams`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `exams` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned DEFAULT NULL,
  `name` varchar(500) NOT NULL,
  `area` varchar(100) NOT NULL,
  `difficulty` enum('easy','medium','hard') DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `exams_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exams`
--

LOCK TABLES `exams` WRITE;
/*!40000 ALTER TABLE `exams` DISABLE KEYS */;
INSERT INTO `exams` VALUES (5,2,'Python','blabla','hard','2019-11-03 21:47:27','2019-11-03 21:47:27');
/*!40000 ALTER TABLE `exams` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `permission_role`
--

DROP TABLE IF EXISTS `permission_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `permission_role` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `permission_id` int(10) unsigned DEFAULT NULL,
  `role_id` int(10) unsigned DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `permission_role_permission_id_index` (`permission_id`),
  KEY `permission_role_role_id_index` (`role_id`),
  CONSTRAINT `permission_role_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `permission_role_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `permission_role`
--

LOCK TABLES `permission_role` WRITE;
/*!40000 ALTER TABLE `permission_role` DISABLE KEYS */;
/*!40000 ALTER TABLE `permission_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `permission_user`
--

DROP TABLE IF EXISTS `permission_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `permission_user` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `permission_id` int(10) unsigned DEFAULT NULL,
  `user_id` int(10) unsigned DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `permission_user_permission_id_index` (`permission_id`),
  KEY `permission_user_user_id_index` (`user_id`),
  CONSTRAINT `permission_user_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `permission_user_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `permission_user`
--

LOCK TABLES `permission_user` WRITE;
/*!40000 ALTER TABLE `permission_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `permission_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `permissions`
--

DROP TABLE IF EXISTS `permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `permissions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `slug` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `permissions_slug_unique` (`slug`),
  UNIQUE KEY `permissions_name_unique` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `permissions`
--

LOCK TABLES `permissions` WRITE;
/*!40000 ALTER TABLE `permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `questions`
--

DROP TABLE IF EXISTS `questions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `questions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned DEFAULT NULL,
  `exam_id` int(10) unsigned DEFAULT NULL,
  `description` varchar(500) NOT NULL,
  `area` varchar(100) NOT NULL,
  `difficulty` enum('easy','medium','hard') NOT NULL,
  `is_right` tinyint(1) DEFAULT NULL,
  `score` int(10) unsigned NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `questions_description_unique` (`description`),
  KEY `user_id` (`user_id`),
  KEY `exam_id` (`exam_id`),
  CONSTRAINT `questions_exam_id_foreign` FOREIGN KEY (`exam_id`) REFERENCES `exams` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `questions_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `questions`
--

LOCK TABLES `questions` WRITE;
/*!40000 ALTER TABLE `questions` DISABLE KEYS */;
INSERT INTO `questions` VALUES (5,2,5,'blabla142','blabla','hard',NULL,1,'2019-11-03 21:47:27','2019-11-03 21:47:27'),(6,2,5,'bsdlddaddddbla12','blabla2','hard',NULL,1,'2019-11-03 21:47:27','2019-11-03 21:47:27'),(7,2,5,'bsdlddaddddbla122','blabla3','hard',NULL,1,'2019-11-03 21:47:27','2019-11-03 21:47:27'),(8,2,5,'bsdlddaddddbla121','blabla4','hard',NULL,1,'2019-11-03 21:47:27','2019-11-03 21:47:27');
/*!40000 ALTER TABLE `questions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role_user`
--

DROP TABLE IF EXISTS `role_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `role_user` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `role_id` int(10) unsigned DEFAULT NULL,
  `user_id` int(10) unsigned DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `role_user_role_id_index` (`role_id`),
  KEY `role_user_user_id_index` (`user_id`),
  CONSTRAINT `role_user_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE,
  CONSTRAINT `role_user_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role_user`
--

LOCK TABLES `role_user` WRITE;
/*!40000 ALTER TABLE `role_user` DISABLE KEYS */;
INSERT INTO `role_user` VALUES (1,1,1,NULL,NULL),(2,2,2,NULL,NULL);
/*!40000 ALTER TABLE `role_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `roles` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `slug` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `roles_slug_unique` (`slug`),
  UNIQUE KEY `roles_name_unique` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (1,'administrator','Administrator','Can create content creators.','2019-11-03 19:34:47','2019-11-03 19:34:47'),(2,'content-creator','Content Creator','Can create exams, questions and badges.','2019-11-03 19:35:45','2019-11-03 19:35:45');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tokens`
--

DROP TABLE IF EXISTS `tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tokens` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned DEFAULT NULL,
  `token` varchar(255) NOT NULL,
  `type` varchar(80) NOT NULL,
  `is_revoked` tinyint(1) DEFAULT '0',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `tokens_token_unique` (`token`),
  KEY `tokens_user_id_foreign` (`user_id`),
  CONSTRAINT `tokens_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=62 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tokens`
--

LOCK TABLES `tokens` WRITE;
/*!40000 ALTER TABLE `tokens` DISABLE KEYS */;
INSERT INTO `tokens` VALUES (12,3,'c6601c9ba91a43439e8cce546af91d1d','api_token',0,'2019-11-12 23:54:21','2019-11-12 23:54:21'),(13,3,'5dc76eb3d4304920aa6ae7a7e36ec22b','api_token',0,'2019-11-13 00:24:20','2019-11-13 00:24:20'),(14,2,'1d166747ef274d24905931a3c036df9f','api_token',1,'2019-11-13 00:51:05','2019-11-13 00:55:04'),(15,2,'3537d57b438e4a33a0d6dd464cbd05c7','api_token',1,'2019-11-13 00:55:48','2019-11-13 00:56:02'),(16,2,'ba1ce376db3a437997c9ec132315a7c2','api_token',0,'2019-11-13 00:56:10','2019-11-13 00:56:10'),(17,2,'ffdb3fea30794fb9ae0231c540be0294','api_token',1,'2019-11-13 00:58:16','2019-11-13 01:06:31'),(18,2,'ec5bc97af09e48f8a6c2339f8d3c11b4','api_token',1,'2019-11-13 01:06:40','2019-11-13 01:08:22'),(19,2,'ad464601e42d4ca7b236fd52582936ff','api_token',0,'2019-11-13 01:28:20','2019-11-13 01:28:20'),(20,2,'f6ec9557ef0442dc8755dfd8c7f74606','api_token',0,'2019-11-13 07:44:00','2019-11-13 07:44:00'),(21,2,'74b902e277df471cbca6003a136029ca','api_token',1,'2019-11-13 07:44:32','2019-11-13 07:50:33'),(22,2,'0763542b6e504900b0a582b098f9cc1f','api_token',0,'2019-11-13 08:01:06','2019-11-13 08:01:06'),(23,2,'f6c00e62e7a949d59249d63e6c54fd58','api_token',0,'2019-11-13 08:06:06','2019-11-13 08:06:06'),(24,2,'afa7d045dace41e4bfdd49d6ed228fb7','api_token',0,'2019-11-13 08:06:19','2019-11-13 08:06:19'),(25,2,'527f7d245db24ab28f4c884f327b9f4f','api_token',1,'2019-11-13 08:07:17','2019-11-13 08:20:37'),(26,2,'84653823712b43309c71954da02279b4','api_token',0,'2019-11-13 08:28:49','2019-11-13 08:28:49'),(27,2,'30112ecc460744d88ac741ef05d11e5b','api_token',0,'2019-11-13 08:29:55','2019-11-13 08:29:55'),(28,2,'72a2534c6f1e49cfaca720bc719ba2a6','api_token',0,'2019-11-13 08:29:58','2019-11-13 08:29:58'),(29,2,'149d21421d204beb81ee250e1c3a9a92','api_token',0,'2019-11-13 08:33:27','2019-11-13 08:33:27'),(30,2,'a0900b09f2bd45efaa31898006c5879b','api_token',0,'2019-11-13 08:35:44','2019-11-13 08:35:44'),(31,2,'d811f72243684e85a276cbd2f5f1dcb2','api_token',1,'2019-11-13 08:36:27','2019-11-13 08:37:18'),(32,2,'ad48d6049bb745c68c2ed7c7da945035','api_token',0,'2019-11-13 08:37:14','2019-11-13 08:37:14'),(33,2,'2ff29d1c53744629bc1a1b8dc2509ae1','api_token',0,'2019-11-13 08:40:13','2019-11-13 08:40:13'),(34,2,'572090c3fd9f42de9be2fec0dce6ca00','api_token',0,'2019-11-13 08:40:31','2019-11-13 08:40:31'),(35,2,'0d889b0fe8a84dee9f850cfc70000f78','api_token',0,'2019-11-13 08:41:40','2019-11-13 08:41:40'),(36,2,'4f0aeed8b74b4dc6882cd0e1d4cf51d5','api_token',1,'2019-11-13 08:45:46','2019-11-13 08:54:26'),(37,2,'3c0e54816c4c49d298387746104785b8','api_token',1,'2019-11-13 08:55:28','2019-11-13 09:00:01'),(38,2,'5f72ea80893e484b8ac8807610abd263','api_token',1,'2019-11-13 09:00:09','2019-11-13 09:01:51'),(39,2,'f4546a6b26e349fb8a4ab0bda3f73a80','api_token',1,'2019-11-13 09:09:09','2019-11-13 09:10:22'),(40,2,'01a8034897ad49dbb948fa45bfceb4f5','api_token',1,'2019-11-13 09:10:29','2019-11-13 09:12:00'),(41,2,'6779e65c2597481fbf8eed9ebe56eb48','api_token',1,'2019-11-13 09:12:10','2019-11-13 09:12:35'),(42,2,'17afbac6b97a48fea863edec7a4eccfd','api_token',1,'2019-11-13 09:12:44','2019-11-13 09:13:22'),(43,2,'565ec4d14f6948f3abd53e8cf43378df','api_token',1,'2019-11-13 09:13:34','2019-11-13 09:14:06'),(44,2,'8cbd1613b9324f87acb9f5e1c9db30b8','api_token',1,'2019-11-13 09:14:13','2019-11-13 09:15:14'),(45,2,'a15a4369e7644be1983b353ab0565e10','api_token',1,'2019-11-13 09:15:22','2019-11-13 09:15:39'),(46,2,'9679eeca4bfa48738d23d8da8680ede9','api_token',1,'2019-11-13 09:16:06','2019-11-13 09:17:01'),(47,2,'c4e57cdf37954863a64d9f28b9ff31e6','api_token',1,'2019-11-13 09:17:08','2019-11-13 09:19:15'),(48,2,'d6607a87f3cb4c9989db5a86ec247c5f','api_token',1,'2019-11-13 09:31:20','2019-11-13 09:43:34'),(49,2,'62e22a4508ae4b34a91d4e7206b5cd64','api_token',1,'2019-11-13 09:43:46','2019-11-13 09:47:47'),(50,2,'e5b06cc28cd443b1b047d1200a3e402e','api_token',1,'2019-11-13 09:47:53','2019-11-13 09:59:26'),(51,2,'c4b67c8c26954db68360ee37a38f23cb','api_token',1,'2019-11-13 09:59:38','2019-11-13 10:28:24'),(52,2,'f2a8a4e547d54ae9a74a22334e96f77c','api_token',1,'2019-11-13 10:28:32','2019-11-13 10:37:47'),(53,2,'5d6c8e404fdb466b9af064ffabdc859d','api_token',1,'2019-11-13 10:37:56','2019-11-13 10:38:22'),(54,2,'3fa95b32f9d64733825870f91cf07901','api_token',1,'2019-11-13 10:38:31','2019-11-13 10:38:48'),(55,2,'64c0253b4cd44e989cb47064121e8ccc','api_token',1,'2019-11-13 10:38:58','2019-11-13 10:39:41'),(56,2,'7d7d5d60c4dd4c45af7f2c763c1c4346','api_token',1,'2019-11-13 10:39:49','2019-11-13 10:40:51'),(57,2,'6bbfeb5335c642f7b9d11508bec4a567','api_token',1,'2019-11-13 10:41:00','2019-11-13 10:41:51'),(58,2,'ec025876d18d4a8782ed50c4ca2926d0','api_token',1,'2019-11-13 10:42:01','2019-11-13 10:58:16'),(59,2,'f3ff1ad9696b4549b8940f77188864ba','api_token',1,'2019-11-13 10:58:27','2019-11-13 10:59:58'),(60,2,'ea99a96c912d4ed7ad63401a358c297b','api_token',1,'2019-11-13 11:00:08','2019-11-13 15:27:11'),(61,2,'db9913231f944fa5919a8167221702b4','api_token',0,'2019-11-13 15:27:19','2019-11-13 15:27:19');
/*!40000 ALTER TABLE `tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_has_badge`
--

DROP TABLE IF EXISTS `user_has_badge`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_has_badge` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned DEFAULT NULL,
  `badge_id` int(10) unsigned DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `badge_id` (`badge_id`),
  CONSTRAINT `user_has_badge_badge_id_foreign` FOREIGN KEY (`badge_id`) REFERENCES `badges` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `user_has_badge_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_has_badge`
--

LOCK TABLES `user_has_badge` WRITE;
/*!40000 ALTER TABLE `user_has_badge` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_has_badge` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_makes_exam`
--

DROP TABLE IF EXISTS `user_makes_exam`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_makes_exam` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned DEFAULT NULL,
  `exam_id` int(10) unsigned DEFAULT NULL,
  `score` int(10) unsigned NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `exam_id` (`exam_id`),
  CONSTRAINT `user_makes_exam_exam_id_foreign` FOREIGN KEY (`exam_id`) REFERENCES `exams` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `user_makes_exam_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_makes_exam`
--

LOCK TABLES `user_makes_exam` WRITE;
/*!40000 ALTER TABLE `user_makes_exam` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_makes_exam` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  `username` varchar(80) NOT NULL,
  `progress` int(10) unsigned DEFAULT '0',
  `level` int(10) unsigned DEFAULT '1',
  `profile_image` varchar(255) DEFAULT NULL,
  `email` varchar(254) NOT NULL,
  `password` varchar(80) NOT NULL,
  `bio` varchar(1000) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_username_unique` (`username`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Henrique','test3423',0,1,NULL,'test523@gmail.com','$2a$10$LtoNrViDa3..tJEp3/C/vetHfmTlyLP0/Vxj5v3oXDCqCa84Wk3Be',NULL,'2019-11-03 20:21:30','2019-11-03 20:21:30'),(2,'Kaio','test',0,1,NULL,'test@cc.com','$2a$10$kVxUyxyFavd9khUGyKs5lOffMoxgIZWIPMSWZAt.zEeSVnddHtqdm','Ain eu sou kokete','2019-11-03 20:35:08','2019-11-03 22:30:37'),(3,'Henrique','test1',0,1,'https://api.adorable.io/avatars/testavatar@gmail.com','testavatar@gmail.com','$2a$10$SQRKf0cbDKizq8WqoA/4luULZIIJAeG3WLBxYRGkyd/8sZZiMXyi6',NULL,'2019-11-12 21:27:02','2019-11-12 21:27:02');
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

-- Dump completed on 2019-11-15 12:23:33
