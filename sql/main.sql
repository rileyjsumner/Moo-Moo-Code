-- MySQL dump 10.13  Distrib 5.7.9, for Win64 (x86_64)
--
-- Host: localhost    Database: moo_moo_code
-- ------------------------------------------------------
-- Server version	5.7.10-log

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
-- Table structure for table `entities`
--

DROP TABLE IF EXISTS `entities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `entities` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `type` int(11) DEFAULT NULL,
  `name` varchar(45) DEFAULT NULL,
  `icon` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `entities`
--

LOCK TABLES `entities` WRITE;
/*!40000 ALTER TABLE `entities` DISABLE KEYS */;
INSERT INTO `entities` VALUES (2,1,'Cow','cow'),(3,0,'Player Spawn','farmer_dan');
/*!40000 ALTER TABLE `entities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lesson_categories`
--

DROP TABLE IF EXISTS `lesson_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lesson_categories` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `lesson_num` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lesson_categories`
--

LOCK TABLES `lesson_categories` WRITE;
/*!40000 ALTER TABLE `lesson_categories` DISABLE KEYS */;
INSERT INTO `lesson_categories` VALUES (1,'Introduction',0),(2,'Functions',1),(3,'Classes',2),(4,'Advanced',3);
/*!40000 ALTER TABLE `lesson_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lessons`
--

DROP TABLE IF EXISTS `lessons`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lessons` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `lesson_name` varchar(60) DEFAULT NULL,
  `lesson_num` int(11) DEFAULT NULL,
  `category_id` int(11) unsigned DEFAULT NULL,
  `lesson_text` varchar(1500) NOT NULL,
  `start_code` varchar(1500) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `lesson_category_idx` (`category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lessons`
--

LOCK TABLES `lessons` WRITE;
/*!40000 ALTER TABLE `lessons` DISABLE KEYS */;
INSERT INTO `lessons` VALUES (1,'My Lesson',0,1,'Do the code boi!','sql.inject(\"MooMoo.hack(int hacketyhack)\");'),(2,'Output',1,1,'KEK',''),(3,'Variables',2,1,'Richard Nixon',''),(4,'Numbers',3,1,'Putin',''),(5,'Introduction',0,2,'lol',''),(6,'Arguments',1,2,'Darude sandstorm is good song',''),(7,'Returning',2,2,'Richy & mortis',''),(8,'Using functions',3,2,'F5 F5 F5',''),(9,'Introduction',0,3,'wow gud lesson',''),(10,'Defining a class',1,3,'this is a lesson too',''),(11,'Functions in a class',2,3,'this is also a lesson',''),(12,'Using classes',3,3,'why did i type this',''),(13,'Common Classes',4,3,'what a waste of time','');
/*!40000 ALTER TABLE `lessons` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `level_entities`
--

DROP TABLE IF EXISTS `level_entities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `level_entities` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `level_id` int(10) unsigned NOT NULL,
  `pos_x` float unsigned NOT NULL,
  `pos_y` float unsigned NOT NULL,
  `name` varchar(45) NOT NULL,
  `entity_type` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `enemy_level_idx` (`level_id`),
  CONSTRAINT `enemy_level` FOREIGN KEY (`level_id`) REFERENCES `levels` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `level_entities`
--

LOCK TABLES `level_entities` WRITE;
/*!40000 ALTER TABLE `level_entities` DISABLE KEYS */;
INSERT INTO `level_entities` VALUES (3,7,6,9,'Bessie',0),(5,2,1,4,'Player Spawn',0),(7,3,6,2,'Player Spawn A',0),(8,1,11,3,'Cow',1),(9,1,3,3,'Player Spawn',0),(10,2,9,4,'Cow',1),(11,3,6,6,'Cow',1),(12,3,2,6,'Player Spawn C',0),(13,3,3,3,'Player Spawn B',0),(14,3,6,10,'Player Spawn D',0),(15,3,10,6,'Player Spawn E',0),(16,3,8.5,8.5,'Player Spawn',0),(17,3,8.5,3.5,'Player Spawn',0),(18,3,3.5,8.5,'Player Spawn',0);
/*!40000 ALTER TABLE `level_entities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `level_tiles`
--

DROP TABLE IF EXISTS `level_tiles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `level_tiles` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `level_id` int(11) unsigned NOT NULL,
  `x` int(11) unsigned NOT NULL,
  `y` int(11) unsigned NOT NULL DEFAULT '0',
  `tile_type` int(11) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_tile` (`level_id`,`x`,`y`),
  KEY `tile_level_idx` (`level_id`),
  CONSTRAINT `tile_level` FOREIGN KEY (`level_id`) REFERENCES `levels` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=1810 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `level_tiles`
--

LOCK TABLES `level_tiles` WRITE;
/*!40000 ALTER TABLE `level_tiles` DISABLE KEYS */;
INSERT INTO `level_tiles` VALUES (8,7,2,2,0),(14,7,1,2,0),(15,7,1,1,1),(16,7,2,1,1),(18,7,0,3,0),(19,7,0,2,0),(21,7,0,1,0),(22,7,1,0,1),(24,7,2,0,1),(25,7,3,1,0),(26,7,3,2,0),(27,7,3,3,0),(28,7,2,3,1),(29,7,1,3,1),(34,7,3,0,1),(37,7,0,0,0),(190,7,1,5,0),(191,7,2,5,0),(192,7,3,5,0),(193,7,0,5,0),(194,7,3,4,0),(198,7,4,0,0),(199,7,5,0,0),(200,7,5,1,1),(201,7,5,2,1),(202,7,5,3,1),(203,7,5,5,0),(204,7,6,5,0),(205,7,7,5,0),(206,7,7,4,1),(207,7,7,3,1),(208,7,7,2,1),(209,7,7,1,1),(210,7,8,1,1),(211,7,9,3,0),(212,7,9,4,0),(213,7,9,5,0),(214,7,9,6,0),(215,7,1,7,1),(216,7,2,7,1),(217,7,3,7,1),(218,7,4,7,0),(219,7,5,7,0),(220,7,6,7,1),(221,7,7,7,1),(222,7,8,7,1),(224,7,7,9,0),(225,7,6,9,0),(226,7,5,9,1),(227,7,4,9,1),(228,7,3,9,1),(229,7,2,9,1),(230,7,1,9,1),(231,7,0,9,1),(235,7,2,8,1),(236,7,8,2,1),(237,7,6,0,0),(247,7,1,4,0),(250,7,4,5,0),(253,7,6,4,1),(255,7,4,3,0),(257,7,2,4,1),(259,7,2,6,1),(261,7,4,8,1),(262,7,5,8,0),(263,7,6,8,1),(265,7,6,6,1),(267,7,4,4,0),(272,7,5,4,1),(275,7,8,4,1),(278,7,8,5,0),(280,7,5,6,0),(281,7,4,6,0),(282,7,3,6,0),(296,7,1,6,0),(303,7,6,2,0),(305,7,8,0,0),(306,7,9,1,0),(307,7,7,8,1),(318,7,7,6,1),(319,7,8,6,1),(324,7,3,8,1),(369,7,1,8,1),(377,7,0,8,0),(394,7,0,6,0),(395,7,0,7,0),(417,7,9,7,0),(444,7,0,4,0),(459,7,6,1,1),(466,7,4,2,1),(475,7,9,0,0),(477,7,9,2,0),(479,7,8,3,1),(492,7,8,8,1),(548,7,4,1,0),(566,7,6,3,0),(594,1,0,0,1),(595,1,3,0,1),(596,1,9,0,1),(597,1,7,0,1),(598,1,7,1,0),(599,1,7,2,0),(600,1,6,2,0),(601,1,5,2,0),(602,1,5,3,0),(603,1,4,3,0),(604,1,4,2,0),(605,1,3,2,0),(606,1,3,1,0),(607,1,4,1,0),(608,1,4,0,1),(609,1,5,0,1),(610,1,7,3,0),(611,1,8,3,0),(612,1,8,2,0),(613,1,9,2,0),(614,1,9,1,1),(615,1,10,1,0),(616,1,10,0,1),(619,1,11,0,1),(620,1,12,0,1),(621,1,12,1,1),(622,1,12,2,1),(623,1,11,3,0),(624,1,10,2,0),(628,1,11,1,0),(637,1,8,0,1),(639,1,6,0,0),(643,1,2,0,1),(644,1,1,1,1),(645,1,1,2,0),(646,1,0,2,1),(647,1,0,3,0),(648,1,0,4,0),(649,1,1,4,0),(650,1,2,4,0),(651,1,3,4,0),(652,1,3,3,0),(660,1,4,4,0),(663,1,6,3,0),(666,1,9,3,0),(669,1,11,2,0),(680,1,8,1,1),(689,1,5,1,0),(699,1,2,2,0),(701,1,1,3,0),(706,1,0,1,1),(708,1,2,1,0),(712,1,1,0,1),(719,1,6,1,0),(735,1,2,3,0),(804,1,5,4,0),(847,1,6,4,0),(907,1,7,4,0),(908,1,6,5,0),(909,1,5,5,0),(976,1,4,5,1),(1030,1,10,3,0),(1031,1,11,4,0),(1032,1,12,4,1),(1033,1,13,4,1),(1034,1,14,4,0),(1035,1,14,3,0),(1036,1,13,3,1),(1037,1,12,3,1),(1308,1,1,5,1),(1309,1,0,5,0),(1390,1,10,4,0),(1391,1,11,5,0),(1392,1,13,5,1),(1393,1,14,5,0),(1394,1,12,6,0),(1446,7,9,8,0),(1475,7,7,0,0),(1477,2,5,6,0),(1478,2,5,5,1),(1479,2,5,4,1),(1480,2,5,3,1),(1481,2,5,2,1),(1482,2,4,2,1),(1483,2,4,3,1),(1486,2,4,4,1),(1487,2,4,5,1),(1488,2,6,3,1),(1489,2,6,4,1),(1490,2,6,5,1),(1494,2,3,4,0),(1501,2,2,4,0),(1505,2,6,2,1),(1506,2,6,1,1),(1507,2,5,1,1),(1508,2,4,1,1),(1509,2,4,0,1),(1510,2,5,0,1),(1511,2,6,0,1),(1513,2,3,0,1),(1514,2,3,1,1),(1515,2,3,2,1),(1516,2,3,3,1),(1517,2,7,2,1),(1518,2,8,2,1),(1519,2,9,2,1),(1521,2,8,1,1),(1522,2,7,1,1),(1526,2,9,1,1),(1527,2,8,0,1),(1529,2,10,1,0),(1530,2,9,0,1),(1532,2,7,0,1),(1536,2,10,0,1),(1538,1,4,6,0),(1539,1,3,6,0),(1540,1,2,6,0),(1541,2,5,7,0),(1542,2,5,8,0),(1543,2,6,8,0),(1544,2,6,7,0),(1545,2,6,6,0),(1572,2,2,0,1),(1573,2,7,3,1),(1577,2,7,8,0),(1580,2,4,8,0),(1581,2,4,7,0),(1583,3,0,11,1),(1584,3,0,10,1),(1585,3,0,9,1),(1586,3,0,8,1),(1588,3,1,9,1),(1589,3,1,10,1),(1590,3,1,11,1),(1591,3,2,11,1),(1592,3,2,10,1),(1594,3,3,11,1),(1595,3,4,11,1),(1596,3,0,7,1),(1597,3,0,0,1),(1598,3,0,1,1),(1599,3,0,2,1),(1600,3,0,3,1),(1601,3,0,4,1),(1602,3,0,5,1),(1603,3,0,6,1),(1610,3,1,0,1),(1611,3,2,0,1),(1612,3,3,0,1),(1613,3,4,0,1),(1614,3,5,0,1),(1615,3,6,0,1),(1616,3,7,0,1),(1617,3,8,0,1),(1618,3,9,0,1),(1619,3,10,0,1),(1620,3,11,0,1),(1621,3,11,1,1),(1622,3,11,2,1),(1623,3,11,3,1),(1624,3,11,4,1),(1625,3,11,5,1),(1626,3,11,6,1),(1627,3,11,8,1),(1628,3,11,9,1),(1630,3,11,7,1),(1635,3,11,10,1),(1636,3,11,11,1),(1637,3,10,11,1),(1638,3,9,11,1),(1639,3,8,11,1),(1640,3,7,11,1),(1641,3,6,11,1),(1642,3,5,11,1),(1644,3,1,8,1),(1646,3,2,9,1),(1648,3,3,10,1),(1649,3,4,10,1),(1655,3,1,7,1),(1656,3,1,6,0),(1657,3,1,5,0),(1658,3,1,4,1),(1659,3,1,3,1),(1660,3,1,2,1),(1661,3,1,1,1),(1662,3,2,1,1),(1663,3,3,1,1),(1669,3,8,1,1),(1670,3,9,1,1),(1671,3,10,1,1),(1672,3,10,2,1),(1680,3,10,8,1),(1681,3,10,9,1),(1682,3,9,9,1),(1683,3,9,10,1),(1684,3,8,10,1),(1685,3,7,10,1),(1686,3,6,10,0),(1690,3,10,10,1),(1699,3,10,3,1),(1701,3,9,2,1),(1704,3,7,1,1),(1707,3,6,1,0),(1708,3,5,1,0),(1709,3,4,1,1),(1711,3,3,2,0),(1712,3,2,2,0),(1713,3,2,3,0),(1719,3,2,7,1),(1720,3,2,8,0),(1722,3,3,9,0),(1725,3,5,10,0),(1733,3,4,2,1),(1737,3,2,4,1),(1744,3,3,8,0),(1746,3,4,9,1),(1773,1,12,5,1),(1777,1,13,2,1),(1786,1,13,1,1),(1787,1,13,0,1),(1793,1,2,5,1),(1794,1,3,5,1),(1797,3,7,2,1),(1798,3,10,4,1),(1799,3,10,7,1),(1800,3,9,7,1),(1808,3,7,9,1),(1809,3,8,9,1);
/*!40000 ALTER TABLE `level_tiles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `levels`
--

DROP TABLE IF EXISTS `levels`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `levels` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `unlock_from` int(11) NOT NULL DEFAULT '-1',
  `unlock_from_2` int(11) NOT NULL DEFAULT '-1',
  `unlock_from_3` int(11) NOT NULL DEFAULT '-1',
  `pos_x` int(11) NOT NULL DEFAULT '0',
  `pos_y` int(11) NOT NULL DEFAULT '0',
  `dim_x` int(10) unsigned NOT NULL DEFAULT '0',
  `dim_y` int(10) unsigned NOT NULL DEFAULT '0',
  `desc` varchar(1500) NOT NULL DEFAULT '',
  `help` varchar(1000) NOT NULL DEFAULT '',
  `start_code` varchar(1000) NOT NULL DEFAULT '',
  `time` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `levels`
--

LOCK TABLES `levels` WRITE;
/*!40000 ALTER TABLE `levels` DISABLE KEYS */;
INSERT INTO `levels` VALUES (1,'Hello, World!',-1,-1,-1,0,0,14,6,'Welcome to the game!\r\n\r\nIn this game, you will control Farmer Dan, highlighted in green on the left, on his journey to rescue his cow, outlined in gold on the right.\r\n\r\nUnlike a normal video game, you will not actually control farmer Dan directly, but will write a piece of code that will allow Farmer Dan to find his cow on his own.\r\n\r\nYou are given several ways to control farmer Dan, but for the first level, all you will need will be the <b>x</b>, and the <b>y</b> variables. They will always be defined to <b>0</b> before your code even runs, so you won\'t need to worry about assigning them or using <b>var</b>.\r\n\r\nSetting the <b>x</b> Variable allows you to control how fast farmer Dan moves left to right-- Setting it to <b>1</b> means He will move at maximum speed to the <b>right</b>, while setting it at <b>-1</b> means he will move at maximum speed to the <b>left</b>. If you set this value more than 1 or less than -1, it will be capped back to between -1 and 1.\r\n\r\nThe <b>y</b> Variable similarly allows you to control Dan\'s vertical movement, <b>1</b> sending him <b>upward</b>, and <b>-1</b> sending him <b>down</b>.\r\n\r\nFor this simple level, see if you can set the right combination of <b>x</b> and <b>y</b> variables to send Farmer Dan to the Cow.\r\n','Since the Cow is directly to Dan\'s <b>right</b>, you will only need to worry about the <b>x</b> variable for this level.','// The x and y variables that control Farmer Dan:\r\nx = 0;\r\ny = 0;',80),(2,'Obstacles',1,-1,-1,10,0,11,9,'In the last level, you used the <b>x</b> and <b>y</b> variables to control Farmer Dan\'s Movement. In this level, you will have access to another object you can use: <b>time</b>.\r\n\r\nThe <b>time</b> variable will allow your code to know the time left in level, and will always be equal to the timer above the level. You can use this variable in combination with <b>if</b> statements to help Farmer Dan avoid the obstacle.\r\n\r\nIt\'s important to note that unlike <b>x</b> and <b>y</b>, changing the <b>time</b> variable  won\'t actually change the time left in the level, only your local variable.','See if you can time the level so that Farmer Dan\'s movement changes when he moves around the obstacle.\r\nFor example:\r\n\r\n<div class = \'modal-code\'>if(<b>time</b> > <b>4</b>)\r\n{\r\n    <b>y</b> = -1;\r\n}</div>','x = 0;\r\ny = 0;\r\nprint(time);',100),(3,'Awareness',2,-1,-1,20,10,12,12,'In the last level, you used <b>time</b> to determine how farmer Dan should avoid the obstacle. This level gives you another way to control Framer Dan: <b>player</b>.\r\n\r\nThe <b>player</b> object actually contains two values: <b>player.x</b>, and <b>player.y</b>. They allow you to see the x and y coordinates where Farmer Dan is currently standing on the level.\r\n\r\nAs you can see, there are many potential places that Farmer Dan <i>could</i> start the level, one of which will be chosen at random when you click run.\r\n\r\nYou can use the <b>player</b> object to find out where Farmer Dan started the level, and move him to the Cow.','Since you know that the Cow will always be at (x : 6 , y : 6), you can use farmer Dan\'s location (<b>player</b>) to find the direction he needs to move in by subtracting the two.\r\n\r\nThink: \r\nCow\'s Position - Dan\'s position = Direction to move','x = 0;\r\ny = 0;\r\n\r\nprint(player.x+\",\"+player.y);',50),(4,'Attacks',1,-1,-1,-10,0,0,0,'','','',0),(6,'Mazes',3,-1,-1,20,20,0,0,'','','',0),(7,'Enemies',4,-1,-1,-20,-10,10,10,'','','',0);
/*!40000 ALTER TABLE `levels` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tiles`
--

DROP TABLE IF EXISTS `tiles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tiles` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `icon` varchar(50) NOT NULL,
  `type` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tiles`
--

LOCK TABLES `tiles` WRITE;
/*!40000 ALTER TABLE `tiles` DISABLE KEYS */;
INSERT INTO `tiles` VALUES (1,'Wall','stone_test',1),(2,'Ground','grass_test',0);
/*!40000 ALTER TABLE `tiles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_levels`
--

DROP TABLE IF EXISTS `user_levels`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_levels` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `level_id` int(10) unsigned NOT NULL,
  `code` varchar(3000) NOT NULL DEFAULT '',
  `time` int(11) NOT NULL,
  `success` tinyint(2) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `user_level_idx` (`user_id`),
  KEY `user_level_level_idx` (`level_id`),
  CONSTRAINT `user_level` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `user_level_level` FOREIGN KEY (`level_id`) REFERENCES `levels` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_levels`
--

LOCK TABLES `user_levels` WRITE;
/*!40000 ALTER TABLE `user_levels` DISABLE KEYS */;
INSERT INTO `user_levels` VALUES (8,1,1,'// The x and y variables that control Farmer Dan:\r\nx = 1;\r\ny = 0;',35,1),(9,1,2,'x = 1;\r\ny = 1;\r\nif(time<8){y=-1}\r\nprint(time);',39,1),(10,1,3,'x = 6 - player.x;\r\ny = 6 - player.y;\r\n\r\nprint(player.x+\",\"+player.y);',12,1);
/*!40000 ALTER TABLE `user_levels` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(45) NOT NULL,
  `password` varchar(45) NOT NULL,
  `progress_learn_category` int(11) NOT NULL DEFAULT '0',
  `progress_learn_lesson` int(11) NOT NULL DEFAULT '0',
  `admin` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'root','admin',2,2,1),(2,'nixon','TESTRichard',2,0,1),(3,'admin','admin',0,0,0);
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

-- Dump completed on 2017-12-05 20:22:32
