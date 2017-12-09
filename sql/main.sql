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
-- Table structure for table `decorations`
--

DROP TABLE IF EXISTS `decorations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `decorations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `icon` varchar(45) DEFAULT NULL,
  `behind` int(11) NOT NULL DEFAULT '0',
  `type` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `decorations`
--

LOCK TABLES `decorations` WRITE;
/*!40000 ALTER TABLE `decorations` DISABLE KEYS */;
INSERT INTO `decorations` VALUES (6,'Tree A','basic_tree_1',0,0);
/*!40000 ALTER TABLE `decorations` ENABLE KEYS */;
UNLOCK TABLES;

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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
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
-- Table structure for table `lesson_bindings`
--

DROP TABLE IF EXISTS `lesson_bindings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lesson_bindings` (
  `id` int(11) NOT NULL,
  `lesson_id` int(11) NOT NULL,
  `binding_title` varchar(45) NOT NULL,
  `binding_value` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lesson_bindings`
--

LOCK TABLES `lesson_bindings` WRITE;
/*!40000 ALTER TABLE `lesson_bindings` DISABLE KEYS */;
/*!40000 ALTER TABLE `lesson_bindings` ENABLE KEYS */;
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
  `lesson_output` varchar(1500) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `lesson_category_idx` (`category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lessons`
--

LOCK TABLES `lessons` WRITE;
/*!40000 ALTER TABLE `lessons` DISABLE KEYS */;
INSERT INTO `lessons` VALUES (1,'My Lesson',0,1,'Do the code boi!','sql.inject(\"MooMoo.hack(int hacketyhack)\");',''),(2,'Output',1,1,'KEK','',''),(3,'Variables',2,1,'Richard Nixon','',''),(4,'Numbers',3,1,'Putin','',''),(5,'Introduction',0,2,'lol','',''),(6,'Arguments',1,2,'Darude sandstorm is good song','',''),(7,'Returning',2,2,'Richy & mortis','',''),(8,'Using functions',3,2,'F5 F5 F5','',''),(9,'Introduction',0,3,'wow gud lesson','',''),(10,'Defining a class',1,3,'this is a lesson too','',''),(11,'Functions in a class',2,3,'this is also a lesson','',''),(12,'Using classes',3,3,'why did i type this','',''),(13,'Common Classes',4,3,'what a waste of time','','');
/*!40000 ALTER TABLE `lessons` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `level_decorations`
--

DROP TABLE IF EXISTS `level_decorations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `level_decorations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `level_id` int(10) unsigned NOT NULL,
  `type` int(10) unsigned NOT NULL,
  `pos_x` float unsigned NOT NULL,
  `pos_y` float unsigned NOT NULL,
  `order` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `enemy_level_idx` (`level_id`),
  KEY `deco_type_idx` (`type`),
  CONSTRAINT `deco_level` FOREIGN KEY (`level_id`) REFERENCES `levels` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `deco_type` FOREIGN KEY (`type`) REFERENCES `decorations` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=1375 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `level_decorations`
--

LOCK TABLES `level_decorations` WRITE;
/*!40000 ALTER TABLE `level_decorations` DISABLE KEYS */;
INSERT INTO `level_decorations` VALUES (805,1,6,3.21682,5.75,0),(806,1,6,4.07653,5.75,1),(807,1,6,13.4517,5.75,2),(808,1,6,1.91894,5.71601,3),(809,1,6,12.1271,5.70618,4),(810,1,6,2.49883,5.52648,5),(811,1,6,1.4304,5.5,6),(812,1,6,2.18135,5.5,7),(813,1,6,3.08412,5.5,8),(814,1,6,4.85583,5.5,9),(815,1,6,12.2056,5.5,10),(816,1,6,13.75,5.5,11),(817,1,6,12.2266,5.48398,12),(818,1,6,12.9642,5.24086,13),(819,1,6,13.6067,5.06076,14),(820,1,6,13.231,4.9867,15),(821,1,6,12.932,4.20174,16),(822,1,6,13.7277,3.94524,17),(823,1,6,13.2496,3.78446,18),(824,1,6,12.9086,3.64129,19),(825,1,6,13.423,3.41825,20),(826,1,6,0.25,2.75684,21),(827,1,6,12.2482,2.75005,22),(828,1,6,0.25,2.71375,23),(829,1,6,12.1571,2.71192,24),(830,1,6,13.2058,2.61246,25),(831,1,6,9.70029,2.32705,26),(832,1,6,13.402,2.28863,27),(833,1,6,8.25773,2.2691,28),(834,1,6,1.01877,2.16763,29),(835,1,6,0.25,2.15241,30),(836,1,6,8.82692,2.15064,31),(837,1,6,12.0333,2.14886,32),(838,1,6,0.666449,2.1485,33),(839,1,6,1.10941,2.05417,34),(840,1,6,9.96349,2.03387,35),(841,1,6,12.5047,2.0205,36),(842,1,6,13.0714,1.51763,37),(843,1,6,4.23304,1.43603,38),(844,1,6,2.97165,1.3692,39),(845,1,6,13.4949,1.32555,40),(846,1,6,10.2958,1.32044,41),(847,1,6,4.43667,1.29269,42),(848,1,6,3.18477,1.24933,43),(849,1,6,7.99915,1.22924,44),(850,1,6,7.04328,1.19935,45),(851,1,6,9.91619,1.17823,46),(852,1,6,1.46129,1.16433,47),(853,1,6,2.08545,1.16184,48),(854,1,6,5.83779,1.13365,49),(855,1,6,8.31199,1.06806,50),(856,1,6,5.37805,1.04469,51),(857,1,6,10.4067,1.02639,52),(858,1,6,1.73177,1.0242,53),(859,1,6,12.0818,1.01539,54),(860,1,6,11.3419,0.984457,55),(861,1,6,8.76481,0.949805,56),(862,1,6,9.42379,0.948172,57),(863,1,6,3.97179,0.887971,58),(864,1,6,13.2887,0.859516,59),(865,1,6,0.754431,0.656116,60),(866,1,6,11.3941,0.603379,61),(867,1,6,0.281717,0.53124,62),(868,1,6,12.8417,0.52635,63),(1141,2,6,4.16643,6.39939,0),(1142,2,6,5.8063,6.31243,1),(1143,2,6,4.84027,6.09601,2),(1144,2,6,6.19999,5.62289,3),(1145,2,6,6.43225,5.59757,4),(1146,2,6,5.84446,5.52313,5),(1147,2,6,4.0659,5.49591,6),(1148,2,6,6.28695,5.38913,7),(1149,2,6,5.48028,5.37123,8),(1150,2,6,6.21168,5.30796,9),(1151,2,6,4.01246,5.30786,10),(1152,2,6,5.19567,5.29553,11),(1153,2,6,4.21958,4.4261,12),(1154,2,6,7.85192,4.35235,13),(1155,2,6,6.26786,4.30585,14),(1156,2,6,5.08045,4.03411,15),(1157,2,6,3.15146,3.9457,16),(1158,2,6,7.83109,3.93734,17),(1159,2,6,5.06603,3.83045,18),(1160,2,6,4.80391,3.77794,19),(1161,2,6,6.46643,3.76808,20),(1162,2,6,3.40943,3.63992,21),(1163,2,6,5.75152,3.41406,22),(1164,2,6,4.29611,3.27682,23),(1165,2,6,9.8075,3.25077,24),(1166,2,6,9.20138,3.24424,25),(1167,2,6,3.65146,3.10287,26),(1168,2,6,4.58641,3.10126,27),(1169,2,6,7.2748,3.06312,28),(1170,2,6,8.25486,2.86876,29),(1171,2,6,3.38671,2.78777,30),(1172,2,6,6.00397,2.76863,31),(1173,2,6,8.19548,2.72692,32),(1174,2,6,7.22048,2.72462,33),(1175,2,6,5.78931,2.6348,34),(1176,2,6,6.69569,2.52243,35),(1177,2,6,7.10032,2.30426,36),(1178,2,6,9.00949,2.23375,37),(1179,2,6,6.28157,2.15812,38),(1180,2,6,6.38807,2.09241,39),(1181,2,6,3.47861,1.8289,40),(1182,2,6,9.89329,1.76684,41),(1183,2,6,5.34362,1.76026,42),(1184,2,6,4.7846,1.74846,43),(1185,2,6,5.74029,1.67523,44),(1186,2,6,8.99996,1.60956,45),(1187,2,6,8.68269,1.58035,46),(1188,2,6,4.52705,1.5771,47),(1189,2,6,3.56921,1.52637,48),(1190,2,6,7.47188,1.52254,49),(1191,2,6,9.98324,1.43635,50),(1192,2,6,10.75,1.32104,51),(1193,2,6,5.17711,1.26798,52),(1194,2,6,8.60254,1.26055,53),(1195,2,6,5.74058,1.01818,54),(1196,2,6,3.39507,1.0159,55),(1197,2,6,6.87942,1.0099,56),(1198,2,6,4.09801,0.902192,57),(1199,2,6,4.75054,0.901308,58),(1200,2,6,8.16606,0.89979,59),(1201,2,6,7.0133,0.886339,60),(1202,2,6,2.5245,0.877378,61),(1203,2,6,10.75,0.843042,62),(1204,2,6,7.79521,0.589051,63),(1205,2,6,9.75212,0.583631,64),(1206,2,6,3.08646,0.579732,65),(1207,2,6,6.17508,0.563594,66),(1208,2,6,2.50222,0.506796,67),(1209,3,6,0.952829,11.75,0),(1210,3,6,2.79265,11.75,1),(1211,3,6,4.81625,11.75,2),(1212,3,6,6.51913,11.75,3),(1213,3,6,7.38365,11.75,4),(1214,3,6,8.20181,11.75,5),(1215,3,6,9.6156,11.666,6),(1216,3,6,5.52705,11.6443,7),(1217,3,6,10.846,11.635,8),(1218,3,6,3.53864,11.6094,9),(1219,3,6,11.0214,11.5782,10),(1220,3,6,1.90852,11.5547,11),(1221,3,6,0.25,11.5,12),(1222,3,6,1.90564,11.5,13),(1223,3,6,2.56309,11.5,14),(1224,3,6,3.58527,11.5,15),(1225,3,6,4.97199,11.5,16),(1226,3,6,5.02192,11.5,17),(1227,3,6,6.29794,11.5,18),(1228,3,6,7.35398,11.5,19),(1229,3,6,8.35658,11.5,20),(1230,3,6,9.08414,11.5,21),(1231,3,6,10.1547,11.5,22),(1232,3,6,11.75,11.5,23),(1233,3,6,8.64106,11.4792,24),(1234,3,6,11.3658,11.4604,25),(1235,3,6,0.59565,11.4203,26),(1236,3,6,0.774897,11.268,27),(1237,3,6,1.78869,11.2517,28),(1238,3,6,7.13274,11.1767,29),(1239,3,6,10.6529,11.1335,30),(1240,3,6,10.6535,10.9505,31),(1241,3,6,2.5238,10.92,32),(1242,3,6,9.67926,10.9145,33),(1243,3,6,9.4022,10.8879,34),(1244,3,6,8.11269,10.8797,35),(1245,3,6,4.4521,10.8578,36),(1246,3,6,3.42235,10.8279,37),(1247,3,6,4.96232,10.7507,38),(1248,3,6,1.90868,10.6935,39),(1249,3,6,7.8412,10.6709,40),(1250,3,6,3.35334,10.6618,41),(1251,3,6,11.5623,10.5879,42),(1252,3,6,2.67773,10.5863,43),(1253,3,6,4.34335,10.4845,44),(1254,3,6,7.6281,10.4675,45),(1255,3,6,2.21955,10.4551,46),(1256,3,6,9.99378,10.4094,47),(1257,3,6,7.12214,10.3469,48),(1258,3,6,8.68037,10.3292,49),(1259,3,6,4.98003,10.2736,50),(1260,3,6,0.89719,10.2716,51),(1261,3,6,2.19489,10.2157,52),(1262,3,6,11.3514,10.2124,53),(1263,3,6,1.46012,10.1795,54),(1264,3,6,10.2715,10.1645,55),(1265,3,6,10.7136,10.1465,56),(1266,3,6,0.560411,10.0771,57),(1267,3,6,1.7141,10.0748,58),(1268,3,6,9.05304,10.0649,59),(1269,3,6,8.10765,10.0202,60),(1270,3,6,11.3989,9.90247,61),(1271,3,6,1.06413,9.34822,62),(1272,3,6,0.25,9.33377,63),(1273,3,6,0.761012,9.10171,64),(1274,3,6,1.09732,9.06255,65),(1275,3,6,10.8504,9.02393,66),(1276,3,6,11.75,8.84454,67),(1277,3,6,11.1722,8.8419,68),(1278,3,6,10.4104,8.77716,69),(1279,3,6,9.37828,8.48753,70),(1280,3,6,0.925608,8.44053,71),(1281,3,6,11.7078,8.28547,72),(1282,3,6,1.14471,8.2078,73),(1283,3,6,1.74435,8.12689,74),(1284,3,6,10.0029,8.08601,75),(1285,3,6,11.75,8.003,76),(1286,3,6,2.43659,7.99579,77),(1287,3,6,2.39753,7.98251,78),(1288,3,6,10.0498,7.87641,79),(1289,3,6,9.79307,7.61517,80),(1290,3,6,0.797683,7.52555,81),(1291,3,6,0.25,7.36689,82),(1292,3,6,11.75,7.34423,83),(1293,3,6,11.3502,7.32555,84),(1294,3,6,0.459817,7.08634,85),(1295,3,6,11.4785,6.4244,86),(1296,3,6,0.25,6.14876,87),(1297,3,6,0.25,5.94581,88),(1298,3,6,11.75,5.57146,89),(1299,3,6,10.1019,5.37761,90),(1300,3,6,2.24492,5.28065,91),(1301,3,6,0.348863,5.27305,92),(1302,3,6,10.3797,5.2042,93),(1303,3,6,11.1876,5.13101,94),(1304,3,6,1.12021,5.10627,95),(1305,3,6,1.76873,5.04784,96),(1306,3,6,0.691713,4.99899,97),(1307,3,6,2.02249,4.76129,98),(1308,3,6,11.0789,4.64329,99),(1309,3,6,10.2453,4.3275,100),(1310,3,6,0.957773,4.12142,101),(1311,3,6,11.3062,3.95882,102),(1312,3,6,1.20433,3.90207,103),(1313,3,6,10.4901,3.77467,104),(1314,3,6,0.579109,3.64779,105),(1315,3,6,11.5627,3.63788,106),(1316,3,6,1.47317,3.51345,107),(1317,3,6,1.43899,3.45414,108),(1318,3,6,4.52273,3.40262,109),(1319,3,6,10.6147,3.40114,110),(1320,3,6,1.93628,3.37591,111),(1321,3,6,7.69356,3.28979,112),(1322,3,6,9.24841,3.22886,113),(1323,3,6,9.76507,3.15562,114),(1324,3,6,10.4316,3.09284,115),(1325,3,6,7.26592,3.07654,116),(1326,3,6,11.1254,3.05261,117),(1327,3,6,0.841805,2.96772,118),(1328,3,6,11.0019,2.9168,119),(1329,3,6,0.837702,2.67102,120),(1330,3,6,4.55697,2.51613,121),(1331,3,6,4.65329,2.48167,122),(1332,3,6,8.19035,2.37477,123),(1333,3,6,9.13605,2.2466,124),(1334,3,6,8.3512,2.22024,125),(1335,3,6,2.85199,2.19938,126),(1336,3,6,1.24564,2.15998,127),(1337,3,6,3.35032,2.14377,128),(1338,3,6,2.16958,2.02,129),(1339,3,6,7.57933,1.95434,130),(1340,3,6,1.84453,1.94524,131),(1341,3,6,7.42685,1.92008,132),(1342,3,6,10.9862,1.89809,133),(1343,3,6,11.0543,1.88623,134),(1344,3,6,0.806389,1.81222,135),(1345,3,6,9.20037,1.77361,136),(1346,3,6,4.67367,1.76703,137),(1347,3,6,10.9187,1.69239,138),(1348,3,6,11.033,1.62486,139),(1349,3,6,0.25,1.61005,140),(1350,3,6,3.02152,1.50729,141),(1351,3,6,3.12831,1.46384,142),(1352,3,6,1.82558,1.43556,143),(1353,3,6,4.25117,1.38823,144),(1354,3,6,11.5765,1.38101,145),(1355,3,6,10.1896,1.3735,146),(1356,3,6,10.7382,1.36046,147),(1357,3,6,8.9862,1.20029,148),(1358,3,6,6.63233,1.15345,149),(1359,3,6,9.44344,1.14645,150),(1360,3,6,0.765914,1.13084,151),(1361,3,6,0.996583,1.08323,152),(1362,3,6,7.61966,1.03795,153),(1363,3,6,8.03336,0.942602,154),(1364,3,6,5.72111,0.934433,155),(1365,3,6,11.7276,0.854919,156),(1366,3,6,7.2051,0.76829,157),(1367,3,6,2.1778,0.758741,158),(1368,3,6,5.73201,0.712132,159),(1369,3,6,9.97476,0.624263,160),(1370,3,6,1.60289,0.579468,161),(1371,3,6,2.02296,0.578362,162),(1372,3,6,3.44645,0.559677,163),(1373,3,6,4.70868,0.548981,164),(1374,3,6,6.06874,0.535577,165);
/*!40000 ALTER TABLE `level_decorations` ENABLE KEYS */;
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
  CONSTRAINT `entity_level` FOREIGN KEY (`level_id`) REFERENCES `levels` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8;
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
) ENGINE=InnoDB AUTO_INCREMENT=1822 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `level_tiles`
--

LOCK TABLES `level_tiles` WRITE;
/*!40000 ALTER TABLE `level_tiles` DISABLE KEYS */;
INSERT INTO `level_tiles` VALUES (8,7,2,2,0),(14,7,1,2,0),(15,7,1,1,1),(16,7,2,1,1),(18,7,0,3,0),(19,7,0,2,0),(21,7,0,1,0),(22,7,1,0,1),(24,7,2,0,1),(25,7,3,1,0),(26,7,3,2,0),(27,7,3,3,0),(28,7,2,3,1),(29,7,1,3,1),(34,7,3,0,1),(37,7,0,0,0),(190,7,1,5,0),(191,7,2,5,0),(192,7,3,5,0),(193,7,0,5,0),(194,7,3,4,0),(198,7,4,0,0),(199,7,5,0,0),(200,7,5,1,1),(201,7,5,2,1),(202,7,5,3,1),(203,7,5,5,0),(204,7,6,5,0),(205,7,7,5,0),(206,7,7,4,1),(207,7,7,3,1),(208,7,7,2,1),(209,7,7,1,1),(210,7,8,1,1),(211,7,9,3,0),(212,7,9,4,0),(213,7,9,5,0),(214,7,9,6,0),(215,7,1,7,1),(216,7,2,7,1),(217,7,3,7,1),(218,7,4,7,0),(219,7,5,7,0),(220,7,6,7,1),(221,7,7,7,1),(222,7,8,7,1),(224,7,7,9,0),(225,7,6,9,0),(226,7,5,9,1),(227,7,4,9,1),(228,7,3,9,1),(229,7,2,9,1),(230,7,1,9,1),(231,7,0,9,1),(235,7,2,8,1),(236,7,8,2,1),(237,7,6,0,0),(247,7,1,4,0),(250,7,4,5,0),(253,7,6,4,1),(255,7,4,3,0),(257,7,2,4,1),(259,7,2,6,1),(261,7,4,8,1),(262,7,5,8,0),(263,7,6,8,1),(265,7,6,6,1),(267,7,4,4,0),(272,7,5,4,1),(275,7,8,4,1),(278,7,8,5,0),(280,7,5,6,0),(281,7,4,6,0),(282,7,3,6,0),(296,7,1,6,0),(303,7,6,2,0),(305,7,8,0,0),(306,7,9,1,0),(307,7,7,8,1),(318,7,7,6,1),(319,7,8,6,1),(324,7,3,8,1),(369,7,1,8,1),(377,7,0,8,0),(394,7,0,6,0),(395,7,0,7,0),(417,7,9,7,0),(444,7,0,4,0),(459,7,6,1,1),(466,7,4,2,1),(475,7,9,0,0),(477,7,9,2,0),(479,7,8,3,1),(492,7,8,8,1),(548,7,4,1,0),(566,7,6,3,0),(594,1,0,0,1),(595,1,3,0,1),(596,1,9,0,1),(597,1,7,0,1),(598,1,7,1,0),(599,1,7,2,0),(600,1,6,2,0),(601,1,5,2,0),(602,1,5,3,0),(603,1,4,3,0),(604,1,4,2,0),(605,1,3,2,0),(606,1,3,1,0),(607,1,4,1,0),(608,1,4,0,1),(609,1,5,0,1),(610,1,7,3,0),(611,1,8,3,0),(612,1,8,2,0),(613,1,9,2,0),(614,1,9,1,1),(615,1,10,1,0),(616,1,10,0,1),(619,1,11,0,1),(620,1,12,0,1),(621,1,12,1,1),(622,1,12,2,1),(623,1,11,3,0),(624,1,10,2,0),(628,1,11,1,0),(637,1,8,0,1),(639,1,6,0,0),(643,1,2,0,1),(644,1,1,1,1),(645,1,1,2,0),(646,1,0,2,1),(647,1,0,3,0),(648,1,0,4,0),(649,1,1,4,0),(650,1,2,4,0),(651,1,3,4,0),(652,1,3,3,0),(660,1,4,4,0),(663,1,6,3,0),(666,1,9,3,0),(669,1,11,2,0),(680,1,8,1,1),(689,1,5,1,0),(699,1,2,2,0),(701,1,1,3,0),(706,1,0,1,1),(708,1,2,1,0),(712,1,1,0,1),(719,1,6,1,0),(735,1,2,3,0),(804,1,5,4,0),(847,1,6,4,0),(907,1,7,4,0),(908,1,6,5,0),(909,1,5,5,0),(976,1,4,5,1),(1030,1,10,3,0),(1031,1,11,4,0),(1032,1,12,4,1),(1033,1,13,4,1),(1034,1,14,4,0),(1035,1,14,3,0),(1036,1,13,3,1),(1037,1,12,3,1),(1308,1,1,5,1),(1309,1,0,5,0),(1390,1,10,4,0),(1391,1,11,5,0),(1392,1,13,5,1),(1393,1,14,5,0),(1394,1,12,6,0),(1446,7,9,8,0),(1475,7,7,0,0),(1477,2,5,6,0),(1478,2,5,5,1),(1479,2,5,4,1),(1480,2,5,3,1),(1481,2,5,2,1),(1482,2,4,2,1),(1483,2,4,3,1),(1486,2,4,4,1),(1487,2,4,5,1),(1488,2,6,3,1),(1489,2,6,4,1),(1490,2,6,5,1),(1494,2,3,4,0),(1501,2,2,4,0),(1505,2,6,2,1),(1506,2,6,1,1),(1507,2,5,1,1),(1508,2,4,1,1),(1509,2,4,0,1),(1510,2,5,0,1),(1511,2,6,0,1),(1513,2,3,0,1),(1514,2,3,1,1),(1515,2,3,2,1),(1516,2,3,3,1),(1517,2,7,2,1),(1518,2,8,2,1),(1519,2,9,2,1),(1521,2,8,1,1),(1522,2,7,1,1),(1526,2,9,1,1),(1527,2,8,0,1),(1529,2,10,1,0),(1530,2,9,0,1),(1532,2,7,0,1),(1536,2,10,0,1),(1538,1,4,6,0),(1539,1,3,6,0),(1540,1,2,6,0),(1541,2,5,7,0),(1542,2,5,8,0),(1543,2,6,8,0),(1544,2,6,7,0),(1545,2,6,6,0),(1572,2,2,0,1),(1573,2,7,3,1),(1577,2,7,8,0),(1580,2,4,8,0),(1581,2,4,7,0),(1583,3,0,11,1),(1584,3,0,10,1),(1585,3,0,9,1),(1586,3,0,8,1),(1588,3,1,9,1),(1589,3,1,10,1),(1590,3,1,11,1),(1591,3,2,11,1),(1592,3,2,10,1),(1594,3,3,11,1),(1595,3,4,11,1),(1596,3,0,7,1),(1597,3,0,0,1),(1598,3,0,1,1),(1599,3,0,2,1),(1600,3,0,3,1),(1601,3,0,4,1),(1602,3,0,5,1),(1603,3,0,6,1),(1610,3,1,0,1),(1611,3,2,0,1),(1612,3,3,0,1),(1613,3,4,0,1),(1614,3,5,0,1),(1615,3,6,0,1),(1616,3,7,0,1),(1617,3,8,0,1),(1618,3,9,0,1),(1619,3,10,0,1),(1620,3,11,0,1),(1621,3,11,1,1),(1622,3,11,2,1),(1623,3,11,3,1),(1624,3,11,4,1),(1625,3,11,5,1),(1626,3,11,6,1),(1627,3,11,8,1),(1628,3,11,9,1),(1630,3,11,7,1),(1635,3,11,10,1),(1636,3,11,11,1),(1637,3,10,11,1),(1638,3,9,11,1),(1639,3,8,11,1),(1640,3,7,11,1),(1641,3,6,11,1),(1642,3,5,11,1),(1644,3,1,8,1),(1646,3,2,9,1),(1648,3,3,10,1),(1649,3,4,10,1),(1655,3,1,7,1),(1656,3,1,6,0),(1657,3,1,5,0),(1658,3,1,4,1),(1659,3,1,3,1),(1660,3,1,2,1),(1661,3,1,1,1),(1662,3,2,1,1),(1663,3,3,1,1),(1669,3,8,1,1),(1670,3,9,1,1),(1671,3,10,1,1),(1672,3,10,2,1),(1680,3,10,8,1),(1681,3,10,9,1),(1682,3,9,9,1),(1683,3,9,10,1),(1684,3,8,10,1),(1685,3,7,10,1),(1686,3,6,10,0),(1690,3,10,10,1),(1699,3,10,3,1),(1701,3,9,2,1),(1704,3,7,1,1),(1707,3,6,1,0),(1708,3,5,1,0),(1709,3,4,1,1),(1711,3,3,2,0),(1712,3,2,2,0),(1713,3,2,3,0),(1719,3,2,7,1),(1720,3,2,8,0),(1722,3,3,9,0),(1725,3,5,10,0),(1733,3,4,2,1),(1737,3,2,4,1),(1744,3,3,8,0),(1746,3,4,9,1),(1773,1,12,5,1),(1777,1,13,2,1),(1786,1,13,1,1),(1787,1,13,0,1),(1793,1,2,5,1),(1794,1,3,5,1),(1797,3,7,2,1),(1798,3,10,4,1),(1799,3,10,7,1),(1800,3,9,7,1),(1808,3,7,9,1),(1809,3,8,9,1),(1810,4,3,9,1),(1811,4,4,9,1),(1812,4,5,9,1),(1813,4,5,8,1),(1814,4,5,7,1),(1815,4,4,7,1),(1818,4,4,8,1),(1820,4,6,8,1),(1821,4,6,9,1);
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
INSERT INTO `levels` VALUES (1,'Hello, World!',-1,-1,-1,0,0,14,6,'Welcome to the game!\r\n\r\nIn this game, you will control Farmer Dan, highlighted in green on the left, on his journey to rescue his cow, outlined in gold on the right.\r\n\r\nUnlike a normal video game, you will not actually control farmer Dan directly, but will write a piece of code that will allow Farmer Dan to find his cow on his own.\r\n\r\nYou are given several ways to control farmer Dan, but for the first level, all you will need will be the <b>x</b>, and the <b>y</b> variables. They will always be defined to <b>0</b> before your code even runs, so you won\'t need to worry about assigning them or using <b>var</b>.\r\n\r\nSetting the <b>x</b> Variable allows you to control how fast farmer Dan moves left to right-- Setting it to <b>1</b> means He will move at maximum speed to the <b>right</b>, while setting it at <b>-1</b> means he will move at maximum speed to the <b>left</b>. If you set this value more than 1 or less than -1, it will be capped back to between -1 and 1.\r\n\r\nThe <b>y</b> Variable similarly allows you to control Dan\'s vertical movement, <b>1</b> sending him <b>upward</b>, and <b>-1</b> sending him <b>down</b>.\r\n\r\nFor this simple level, see if you can set the right combination of <b>x</b> and <b>y</b> variables to send Farmer Dan to the Cow.\r\n','Since the Cow is directly to Dan\'s <b>right</b>, you will only need to worry about the <b>x</b> variable for this level.','// The x and y variables that control Farmer Dan:\r\nx = 0;\r\ny = 0;',80),(2,'Obstacles',1,-1,-1,10,0,11,9,'In the last level, you used the <b>x</b> and <b>y</b> variables to control Farmer Dan\'s Movement. In this level, you will have access to another object you can use: <b>time</b>.\r\n\r\nThe <b>time</b> variable will allow your code to know the time left in level, and will always be equal to the timer above the level. You can use this variable in combination with <b>if</b> statements to help Farmer Dan avoid the obstacle.\r\n\r\nIt\'s important to note that unlike <b>x</b> and <b>y</b>, changing the <b>time</b> variable  won\'t actually change the time left in the level, only your local variable.','See if you can time the level so that Farmer Dan\'s movement changes when he moves around the obstacle.\r\nFor example:\r\n\r\n<div class = \'modal-code\'>if(<b>time</b> > <b>4</b>)\r\n{\r\n    <b>y</b> = -1;\r\n}</div>','x = 0;\r\ny = 0;\r\nprint(time);',100),(3,'Awareness',2,-1,-1,20,10,12,12,'In the last level, you used <b>time</b> to determine how farmer Dan should avoid the obstacle. This level gives you another way to control Framer Dan: <b>player</b>.\r\n\r\nThe <b>player</b> object actually contains two values: <b>player.x</b>, and <b>player.y</b>. They allow you to see the x and y coordinates where Farmer Dan is currently standing on the level.\r\n\r\nAs you can see, there are many potential places that Farmer Dan <i>could</i> start the level, one of which will be chosen at random when you click run.\r\n\r\nYou can use the <b>player</b> object to find out where Farmer Dan started the level, and move him to the Cow.','Since you know that the Cow will always be at (x : 6 , y : 6), you can use farmer Dan\'s location (<b>player</b>) to find the direction he needs to move in by subtracting the two.\r\n\r\nThink: \r\nCow\'s Position - Dan\'s position = Direction to move','x = 0;\r\ny = 0;\r\n\r\nprint(player.x+\",\"+player.y);',50),(4,'Attacks',1,-1,-1,-10,0,10,10,'','','',80),(6,'Mazes',3,-1,-1,20,20,0,0,'','','',0),(7,'Enemies',4,-1,-1,-20,-10,10,10,'','','',0);
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
INSERT INTO `tiles` VALUES (1,'Level Edge - Forest','dirt',1),(2,'Ground','grass',0);
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
INSERT INTO `user_levels` VALUES (8,1,1,'// The x and y variables that control Farmer Dan:\r\nx = 1;\r\ny = 0;',35,1),(9,1,2,'x=1\r\ny=1\r\nif(time <= 8 ) {\r\n  y=-1\r\n}',39,1),(10,1,3,'x = 6 - player.x;\r\ny = 6 - player.y;\r\n\r\nprint(player.x+\",\"+player.y);',10,1);
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

-- Dump completed on 2017-12-09 16:31:23
