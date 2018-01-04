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
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `decorations`
--

LOCK TABLES `decorations` WRITE;
/*!40000 ALTER TABLE `decorations` DISABLE KEYS */;
INSERT INTO `decorations` VALUES (6,'Tree A','basic_tree_1',0,0),(7,'Tree B','basic_tree_2',0,0),(8,'Tree C','basic_tree_3',0,0),(9,'Bush A','basic_bush_1',0,1),(10,'Bush B','basic_bush_2',0,1);
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
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `entities`
--

LOCK TABLES `entities` WRITE;
/*!40000 ALTER TABLE `entities` DISABLE KEYS */;
INSERT INTO `entities` VALUES (2,1,'Cow','cow'),(3,0,'Player Spawn','farmer_dan'),(6,2,'Pitch Fork - On Ground','pitchfork'),(7,3,'Pitch Fork - Flying','pitchfork'),(8,4,'Hay Bale Vertical','hay'),(9,5,'Hay Bale Horizontal','hay');
/*!40000 ALTER TABLE `entities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lesson_bindings`
--

DROP TABLE IF EXISTS `lesson_bindings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lesson_bindings` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `lesson_id` int(11) NOT NULL,
  `binding_title` varchar(45) NOT NULL,
  `binding_value` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lesson_bindings`
--

LOCK TABLES `lesson_bindings` WRITE;
/*!40000 ALTER TABLE `lesson_bindings` DISABLE KEYS */;
INSERT INTO `lesson_bindings` VALUES (1,2,'myvar','my_name');
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
-- Table structure for table `lesson_progress`
--

DROP TABLE IF EXISTS `lesson_progress`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lesson_progress` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `lesson_id` int(11) NOT NULL,
  `save_code` varchar(1500) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lesson_progress`
--

LOCK TABLES `lesson_progress` WRITE;
/*!40000 ALTER TABLE `lesson_progress` DISABLE KEYS */;
/*!40000 ALTER TABLE `lesson_progress` ENABLE KEYS */;
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
INSERT INTO `lessons` VALUES (1,'My Lesson',0,1,'Do the code boi!','sql.inject(\"MooMoo.hack(int hacketyhack)\");',''),(2,'Output',1,1,'KEK','sql.inject(\"MooMoo.hack(int hacketyhack)\");',''),(3,'Variables',2,1,'Richard Nixon','',''),(4,'Numbers',3,1,'Putin','',''),(5,'Introduction',0,2,'lol','',''),(6,'Arguments',1,2,'Darude sandstorm is good song','',''),(7,'Returning',2,2,'Richy & mortis','',''),(8,'Using functions',3,2,'F5 F5 F5','',''),(9,'Introduction',0,3,'wow gud lesson','',''),(10,'Defining a class',1,3,'this is a lesson too','',''),(11,'Functions in a class',2,3,'this is also a lesson','',''),(12,'Using classes',3,3,'why did i type this','',''),(13,'Common Classes',4,3,'what a waste of time','','');
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
) ENGINE=InnoDB AUTO_INCREMENT=6158 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `level_decorations`
--

LOCK TABLES `level_decorations` WRITE;
/*!40000 ALTER TABLE `level_decorations` DISABLE KEYS */;
INSERT INTO `level_decorations` VALUES (3359,1,10,1.42222,5.9,0),(3360,1,10,12.9659,5.9,1),(3361,1,9,13.018,5.81702,2),(3362,1,10,2.66934,5.77512,3),(3363,1,7,2.65387,5.75,4),(3364,1,6,4.4609,5.75,5),(3365,1,6,12.8697,5.75,6),(3366,1,6,13.2335,5.75,7),(3367,1,8,3.99455,5.74833,8),(3368,1,10,3.43942,5.65268,9),(3369,1,7,1.60185,5.61612,10),(3370,1,10,4.3281,5.57916,11),(3371,1,7,1.90582,5.5,12),(3372,1,7,2.9349,5.5,13),(3373,1,7,3.93094,5.5,14),(3374,1,8,4.22575,5.5,15),(3375,1,7,12.6476,5.5,16),(3376,1,8,13.2634,5.5,17),(3377,1,10,12.9691,5.45979,18),(3378,1,9,13.1479,5.05579,19),(3379,1,7,12.2348,5.00213,20),(3380,1,6,12.5617,4.90874,21),(3381,1,6,13.4239,4.709,22),(3382,1,8,13.3062,4.65404,23),(3383,1,8,12.9741,4.411,24),(3384,1,7,13.1603,3.80166,25),(3385,1,10,12.6416,3.78343,26),(3386,1,6,12.8097,3.74888,27),(3387,1,9,13.3162,3.60458,28),(3388,1,7,13.2392,3.55608,29),(3389,1,8,13.75,3.4195,30),(3390,1,10,13.75,3.33724,31),(3391,1,7,0.509565,3.2895,32),(3392,1,8,12.6374,3.10154,33),(3393,1,8,13.3233,3.01261,34),(3394,1,9,12.4004,2.95813,35),(3395,1,7,12.1162,2.85967,36),(3396,1,7,0.877206,2.65497,37),(3397,1,10,0.516125,2.55484,38),(3398,1,9,9.03994,2.47538,39),(3399,1,6,0.422128,2.46453,40),(3400,1,7,13.7336,2.45116,41),(3401,1,8,1.53031,2.34531,42),(3402,1,10,12.5129,2.33045,43),(3403,1,10,8.63604,2.3168,44),(3404,1,10,0.898207,2.27763,45),(3405,1,8,9.88038,2.17684,46),(3406,1,7,12.6896,2.14227,47),(3407,1,8,13.75,2.09255,48),(3408,1,7,9.39676,2.05546,49),(3409,1,9,13.75,2.0115,50),(3410,1,8,8.74187,1.90939,51),(3411,1,9,1.66259,1.73882,52),(3412,1,7,1.60479,1.69078,53),(3413,1,6,12.0596,1.65034,54),(3414,1,6,0.25,1.64731,55),(3415,1,6,8.78813,1.59809,56),(3416,1,10,4.76402,1.49464,57),(3417,1,7,0.649566,1.4939,58),(3418,1,9,2.93583,1.48256,59),(3419,1,9,11.4281,1.46542,60),(3420,1,7,8.86603,1.42712,61),(3421,1,7,5.32983,1.38078,62),(3422,1,9,3.59203,1.29487,63),(3423,1,6,13.75,1.27739,64),(3424,1,8,8.40895,1.25907,65),(3425,1,9,10.5753,1.25119,66),(3426,1,7,0.405243,1.24515,67),(3427,1,9,5.97777,1.22068,68),(3428,1,10,13.75,1.1779,69),(3429,1,6,10.7431,1.1491,70),(3430,1,7,9.59239,1.14672,71),(3431,1,8,1.88183,1.14581,72),(3432,1,9,1.1473,1.13345,73),(3433,1,7,11.7358,1.00565,74),(3434,1,6,7.07043,1.00178,75),(3435,1,6,5.6086,0.993569,76),(3436,1,8,12.3776,0.978816,77),(3437,1,8,9.53463,0.939935,78),(3438,1,7,4.82865,0.921393,79),(3439,1,6,11.9917,0.913403,80),(3440,1,6,1.59083,0.913143,81),(3441,1,7,12.0668,0.883246,82),(3442,1,9,12.9776,0.874784,83),(3443,1,10,8.94023,0.843037,84),(3444,1,8,3.52014,0.815475,85),(3445,1,8,13.3683,0.81313,86),(3446,1,7,10.6357,0.813085,87),(3447,1,8,2.11427,0.809017,88),(3448,1,6,2.69098,0.743276,89),(3449,1,8,4.07061,0.734121,90),(3450,1,9,9.38618,0.704844,91),(3451,1,8,7.01878,0.680718,92),(3452,1,8,3.70729,0.589496,93),(3453,1,9,0.573202,0.549273,94),(3454,1,9,7.88948,0.504037,95),(3806,2,10,5.94885,6.43613,0),(3807,2,8,4.41976,6.22871,1),(3808,2,8,6.51834,6.08748,2),(3809,2,8,4.13924,6.08103,3),(3810,2,7,5.73397,6.00659,4),(3811,2,6,5.94741,5.91891,5),(3812,2,7,6.83472,5.89609,6),(3813,2,10,6.0336,5.59663,7),(3814,2,9,4.24112,5.52502,8),(3815,2,7,4.03578,5.39773,9),(3816,2,10,5.55208,5.22716,10),(3817,2,10,4.87069,5.20788,11),(3818,2,7,5.64033,5.19578,12),(3819,2,9,6.59437,5.10714,13),(3820,2,7,6.79731,5.02993,14),(3821,2,7,6.13662,4.90239,15),(3822,2,6,4.2863,4.80566,16),(3823,2,6,5.28523,4.61326,17),(3824,2,10,6.15142,4.2727,18),(3825,2,6,7.05041,4.18758,19),(3826,2,10,3.92557,4.16813,20),(3827,2,6,5.81902,4.1631,21),(3828,2,6,3.86465,4.14594,22),(3829,2,9,7.38116,4.14047,23),(3830,2,6,5.38988,4.0771,24),(3831,2,7,3.81126,4.01481,25),(3832,2,6,7.41127,4.01093,26),(3833,2,9,5.65344,3.95207,27),(3834,2,6,6.88616,3.95139,28),(3835,2,10,4.11639,3.9418,29),(3836,2,8,4.5394,3.63986,30),(3837,2,8,6.95727,3.53751,31),(3838,2,7,4.84677,3.51781,32),(3839,2,9,6.48208,3.49718,33),(3840,2,10,4.65994,3.48356,34),(3841,2,9,9.80165,3.46645,35),(3842,2,8,3.53831,3.36192,36),(3843,2,10,8.92937,3.30839,37),(3844,2,7,8.60441,3.25603,38),(3845,2,6,7.96092,3.23399,39),(3846,2,6,7.3398,3.19225,40),(3847,2,9,5.12613,3.1672,41),(3848,2,7,3.74651,3.14011,42),(3849,2,6,9.48368,3.04259,43),(3850,2,8,5.48731,3.00306,44),(3851,2,10,3.88883,2.98186,45),(3852,2,9,7.2646,2.86445,46),(3853,2,7,8.06901,2.86419,47),(3854,2,6,4.01417,2.76337,48),(3855,2,7,9.46818,2.75274,49),(3856,2,7,5.65335,2.75071,50),(3857,2,6,6.11258,2.66711,51),(3858,2,8,4.11117,2.57554,52),(3859,2,8,6.52736,2.53231,53),(3860,2,9,5.87653,2.40617,54),(3861,2,9,4.004,2.36084,55),(3862,2,10,7.30101,2.30921,56),(3863,2,7,3.07133,2.2515,57),(3864,2,7,7.72678,2.25107,58),(3865,2,7,8.16889,2.24544,59),(3866,2,6,5.14877,2.18364,60),(3867,2,6,9.32525,2.17033,61),(3868,2,9,6.97908,2.07982,62),(3869,2,8,7.7528,2.0745,63),(3870,2,7,8.08134,2.06321,64),(3871,2,7,6.99133,2.05121,65),(3872,2,6,5.3037,1.95292,66),(3873,2,10,9.55653,1.93452,67),(3874,2,6,4.83132,1.93001,68),(3875,2,7,4.85997,1.86108,69),(3876,2,9,3.95011,1.82284,70),(3877,2,8,9.26956,1.80411,71),(3878,2,8,6.94261,1.60406,72),(3879,2,10,8.21924,1.52923,73),(3880,2,8,3.38516,1.51845,74),(3881,2,8,4.62057,1.47275,75),(3882,2,9,5.81454,1.44966,76),(3883,2,7,6.33042,1.44773,77),(3884,2,6,6.24687,1.41846,78),(3885,2,6,3.73413,1.38385,79),(3886,2,8,5.73447,1.35457,80),(3887,2,9,10.3317,1.3221,81),(3888,2,10,2.23033,1.31122,82),(3889,2,8,3.95433,1.29645,83),(3890,2,6,9.89902,1.28512,84),(3891,2,6,7.4105,1.21498,85),(3892,2,7,2.22719,1.18586,86),(3893,2,8,8.3691,1.16664,87),(3894,2,7,8.8928,1.15816,88),(3895,2,9,4.41331,1.14363,89),(3896,2,8,9.74055,1.10321,90),(3897,2,6,7.07807,1.06225,91),(3898,2,7,10.4496,1.06207,92),(3899,2,9,9.91923,1.0336,93),(3900,2,9,6.77036,1.00656,94),(3901,2,9,3.13882,0.997807,95),(3902,2,10,7.35417,0.851533,96),(3903,2,8,10.75,0.744893,97),(3904,2,7,4.5459,0.643193,98),(3905,2,6,5.78269,0.625433,99),(3906,2,9,8.94957,0.591124,100),(3907,2,7,2.45,0.564365,101),(3908,4,10,4.81729,9.9,0),(3909,4,10,6.65796,9.9,1),(3910,4,10,5.91318,9.86399,2),(3911,4,9,3.45428,9.8399,3),(3912,4,8,4.68926,9.75,4),(3913,4,6,5.42806,9.75,5),(3914,4,6,6.41944,9.75,6),(3915,4,7,3.50739,9.68073,7),(3916,4,6,3.35924,9.5,8),(3917,4,8,4.75774,9.5,9),(3918,4,6,5.7446,9.5,10),(3919,4,7,6.66171,9.5,11),(3920,4,6,5.53716,9.4714,12),(3921,4,10,5.87636,9.30386,13),(3922,4,7,5.00605,9.22833,14),(3923,4,7,4.81465,9.20572,15),(3924,4,9,4.80342,9.01862,16),(3925,4,7,6.37532,9.00541,17),(3926,4,8,6.74133,8.98105,18),(3927,4,7,4.25903,8.93858,19),(3928,4,9,6.5211,8.53505,20),(3929,4,6,5.58548,8.4824,21),(3930,4,6,4.30843,8.15849,22),(3931,4,7,4.52791,7.87536,23),(3932,4,7,5.00953,7.73475,24),(3933,4,9,4.78064,7.73362,25),(3934,4,9,5.83219,7.59552,26),(6020,3,9,0.414614,8.9,0),(6021,3,10,1.90317,8.9,1),(6022,3,10,2.4062,8.9,2),(6023,3,10,4.90715,8.9,3),(6024,3,9,6.72898,8.9,4),(6025,3,9,7.08921,8.9,5),(6026,3,9,8.44951,8.9,6),(6027,3,9,5.51938,8.78389,7),(6028,3,8,1.91899,8.75,8),(6029,3,6,2.18786,8.75,9),(6030,3,6,3.26108,8.75,10),(6031,3,6,4.03456,8.75,11),(6032,3,6,5.24361,8.75,12),(6033,3,8,6.332,8.75,13),(6034,3,8,7.75614,8.75,14),(6035,3,6,8.75,8.75,15),(6036,3,9,3.36014,8.72733,16),(6037,3,6,0.25,8.7203,17),(6038,3,8,0.991748,8.5,18),(6039,3,7,1.73118,8.5,19),(6040,3,8,2.53864,8.5,20),(6041,3,7,3.10322,8.5,21),(6042,3,8,4.81254,8.5,22),(6043,3,8,5.20556,8.5,23),(6044,3,6,6.50594,8.5,24),(6045,3,7,7.19564,8.5,25),(6046,3,6,8.32479,8.5,26),(6047,3,9,0.25,8.34907,27),(6048,3,7,8.75,8.27138,28),(6049,3,6,0.25,8.15565,29),(6050,3,9,8.10563,8.13945,30),(6051,3,8,8.75,8.0174,31),(6052,3,7,0.25,7.57738,32),(6053,3,7,5.22821,7.49904,33),(6054,3,8,2.19501,7.45257,34),(6055,3,6,0.566203,7.43662,35),(6056,3,6,6.42096,7.39581,36),(6057,3,8,4.10363,7.38519,37),(6058,3,8,3.56981,7.37924,38),(6059,3,7,4.53621,7.3249,39),(6060,3,9,8.29083,7.2468,40),(6061,3,9,6.59887,7.23858,41),(6062,3,6,2.10237,7.23486,42),(6063,3,10,4.31535,7.15836,43),(6064,3,8,8.07826,7.05579,44),(6065,3,10,5.3106,7.01118,45),(6066,3,7,3.73727,6.95965,46),(6067,3,10,0.25,6.90682,47),(6068,3,7,5.1413,6.75649,48),(6069,3,9,2.18865,6.69853,49),(6070,3,9,3.14418,6.69846,50),(6071,3,6,8.34306,6.64568,51),(6072,3,7,6.26961,6.63302,52),(6073,3,8,0.315988,6.56093,53),(6074,3,8,8.58938,6.33984,54),(6075,3,6,2.40076,6.21884,55),(6076,3,6,8.03416,6.09676,56),(6077,3,7,6.44493,6.07294,57),(6078,3,10,0.352988,6.06321,58),(6079,3,10,6.98389,5.96406,59),(6080,3,7,0.577921,5.91678,60),(6081,3,7,2.62276,5.84403,61),(6082,3,10,8.05005,5.79348,62),(6083,3,10,2.14764,5.73058,63),(6084,3,8,0.558738,5.65981,64),(6085,3,8,6.51247,5.6492,65),(6086,3,9,6.57545,5.43961,66),(6087,3,9,8.66222,5.4273,67),(6088,3,7,0.300269,5.21582,68),(6089,3,7,6.50439,5.06297,69),(6090,3,6,2.22098,5.00413,70),(6091,3,8,8.42136,4.90497,71),(6092,3,10,0.781782,4.87719,72),(6093,3,8,8.75,4.85241,73),(6094,3,7,6.75805,4.76903,74),(6095,3,6,2.50719,4.74685,75),(6096,3,10,2.37584,4.63102,76),(6097,3,7,0.914273,4.61258,77),(6098,3,8,0.254212,4.44924,78),(6099,3,6,8.28947,4.39681,79),(6100,3,9,0.849673,4.39105,80),(6101,3,9,8.62335,4.27344,81),(6102,3,7,8.07154,4.18169,82),(6103,3,6,6.92813,4.09383,83),(6104,3,7,0.300907,4.05216,84),(6105,3,9,6.04421,3.92957,85),(6106,3,7,6.16299,3.70887,86),(6107,3,9,0.999271,3.49637,87),(6108,3,7,2.0829,3.45682,88),(6109,3,10,3.11187,3.45085,89),(6110,3,10,4.23883,3.41106,90),(6111,3,8,0.362039,3.34286,91),(6112,3,6,0.807095,3.30697,92),(6113,3,8,8.69857,3.30089,93),(6114,3,9,8.75,3.25156,94),(6115,3,8,5.78374,3.19065,95),(6116,3,9,1.76369,3.16257,96),(6117,3,6,1.3253,3.15986,97),(6118,3,6,2.11128,3.06433,98),(6119,3,8,3.66015,3.05935,99),(6120,3,10,2.6433,2.97518,100),(6121,3,6,4.2134,2.91588,101),(6122,3,7,8.66826,2.89875,102),(6123,3,10,5.00073,2.87072,103),(6124,3,7,1.3391,2.85015,104),(6125,3,6,3.71961,2.75991,105),(6126,3,10,6.28283,2.7283,106),(6127,3,8,6.25469,2.66647,107),(6128,3,6,6.34843,2.64172,108),(6129,3,8,4.86256,2.61055,109),(6130,3,8,5.79641,2.50084,110),(6131,3,8,8.27092,2.387,111),(6132,3,6,0.25,2.38669,112),(6133,3,8,8.44527,2.18328,113),(6134,3,9,0.25,2.03473,114),(6135,3,10,8.25027,2.01669,115),(6136,3,8,0.454392,1.62013,116),(6137,3,10,8.14976,1.37591,117),(6138,3,8,8.75,1.37192,118),(6139,3,8,5.21217,1.36152,119),(6140,3,8,4.16658,1.3083,120),(6141,3,7,7.98767,1.23083,121),(6142,3,6,6.99456,1.1789,122),(6143,3,8,8.75,1.10998,123),(6144,3,6,3.60566,1.08977,124),(6145,3,8,3.01263,1.08645,125),(6146,3,10,7.77841,0.978044,126),(6147,3,6,5.67706,0.921369,127),(6148,3,10,0.535535,0.871602,128),(6149,3,7,4.77764,0.862502,129),(6150,3,6,6.79821,0.860884,130),(6151,3,9,5.47399,0.79075,131),(6152,3,9,6.27428,0.674232,132),(6153,3,7,7.10217,0.637019,133),(6154,3,7,0.25,0.623498,134),(6155,3,9,3.90104,0.571559,135),(6156,3,7,0.665047,0.55064,136),(6157,3,9,4.82192,0.535073,137);
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
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `level_entities`
--

LOCK TABLES `level_entities` WRITE;
/*!40000 ALTER TABLE `level_entities` DISABLE KEYS */;
INSERT INTO `level_entities` VALUES (3,7,6,9,'Bessie',0),(5,2,1,4,'Player Spawn',0),(8,1,11,3,'Cow',1),(9,1,3,3,'Player Spawn',0),(10,2,9,4,'Cow',1),(11,3,4.5,4.5,'Cow',1),(16,3,1.5,1.5,'Player Spawn',0),(19,4,1.5,5.5,'Pitch Fork - On Ground',2),(20,4,1.5,1.5,'Player Spawn',0),(21,4,7.5,5.5,'Cow',1),(22,4,5,0.5,'Hay Bale',5),(23,4,4,1.5,'Hay Bale Vertical',4),(24,4,4.5,2.5,'Hay Bale Vertical',4),(25,4,4,3.5,'Hay Bale Vertical',4),(26,4,4.5,4.5,'Hay Bale Vertical',4),(27,4,5,5.5,'Hay Bale Vertical',4),(28,4,4,6.5,'Hay Bale Horizontal',5),(29,4,5,6.5,'Hay Bale Horizontal',5),(31,4,3.5,7.5,'Hay Bale Vertical',4),(32,4,3.5,0.5,'Hay Bale Horizontal',5),(33,4,6,2,'Hay Bale Horizontal',5);
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
) ENGINE=InnoDB AUTO_INCREMENT=2198 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `level_tiles`
--

LOCK TABLES `level_tiles` WRITE;
/*!40000 ALTER TABLE `level_tiles` DISABLE KEYS */;
INSERT INTO `level_tiles` VALUES (8,7,2,2,0),(14,7,1,2,0),(15,7,1,1,1),(16,7,2,1,1),(18,7,0,3,0),(19,7,0,2,0),(21,7,0,1,0),(22,7,1,0,1),(24,7,2,0,1),(25,7,3,1,0),(26,7,3,2,0),(27,7,3,3,0),(28,7,2,3,1),(29,7,1,3,1),(34,7,3,0,1),(37,7,0,0,0),(190,7,1,5,0),(191,7,2,5,0),(192,7,3,5,0),(193,7,0,5,0),(194,7,3,4,0),(198,7,4,0,0),(199,7,5,0,0),(200,7,5,1,1),(201,7,5,2,1),(202,7,5,3,1),(203,7,5,5,0),(204,7,6,5,0),(205,7,7,5,0),(206,7,7,4,1),(207,7,7,3,1),(208,7,7,2,1),(209,7,7,1,1),(210,7,8,1,1),(211,7,9,3,0),(212,7,9,4,0),(213,7,9,5,0),(214,7,9,6,0),(215,7,1,7,1),(216,7,2,7,1),(217,7,3,7,1),(218,7,4,7,0),(219,7,5,7,0),(220,7,6,7,1),(221,7,7,7,1),(222,7,8,7,1),(224,7,7,9,0),(225,7,6,9,0),(226,7,5,9,1),(227,7,4,9,1),(228,7,3,9,1),(229,7,2,9,1),(230,7,1,9,1),(231,7,0,9,1),(235,7,2,8,1),(236,7,8,2,1),(237,7,6,0,0),(247,7,1,4,0),(250,7,4,5,0),(253,7,6,4,1),(255,7,4,3,0),(257,7,2,4,1),(259,7,2,6,1),(261,7,4,8,1),(262,7,5,8,0),(263,7,6,8,1),(265,7,6,6,1),(267,7,4,4,0),(272,7,5,4,1),(275,7,8,4,1),(278,7,8,5,0),(280,7,5,6,0),(281,7,4,6,0),(282,7,3,6,0),(296,7,1,6,0),(303,7,6,2,0),(305,7,8,0,0),(306,7,9,1,0),(307,7,7,8,1),(318,7,7,6,1),(319,7,8,6,1),(324,7,3,8,1),(369,7,1,8,1),(377,7,0,8,0),(394,7,0,6,0),(395,7,0,7,0),(417,7,9,7,0),(444,7,0,4,0),(459,7,6,1,1),(466,7,4,2,1),(475,7,9,0,0),(477,7,9,2,0),(479,7,8,3,1),(492,7,8,8,1),(548,7,4,1,0),(566,7,6,3,0),(594,1,0,0,1),(595,1,3,0,1),(596,1,9,0,1),(597,1,7,0,1),(598,1,7,1,0),(599,1,7,2,0),(600,1,6,2,0),(601,1,5,2,0),(602,1,5,3,0),(603,1,4,3,0),(604,1,4,2,0),(605,1,3,2,0),(606,1,3,1,0),(607,1,4,1,0),(608,1,4,0,1),(609,1,5,0,1),(610,1,7,3,0),(611,1,8,3,0),(612,1,8,2,0),(613,1,9,2,0),(614,1,9,1,1),(615,1,10,1,0),(616,1,10,0,1),(619,1,11,0,1),(620,1,12,0,1),(621,1,12,1,1),(622,1,12,2,1),(623,1,11,3,0),(624,1,10,2,0),(628,1,11,1,0),(637,1,8,0,1),(639,1,6,0,0),(643,1,2,0,1),(644,1,1,1,1),(645,1,1,2,0),(646,1,0,2,1),(647,1,0,3,0),(648,1,0,4,0),(649,1,1,4,0),(650,1,2,4,0),(651,1,3,4,0),(652,1,3,3,0),(660,1,4,4,0),(663,1,6,3,0),(666,1,9,3,0),(669,1,11,2,0),(680,1,8,1,1),(689,1,5,1,0),(699,1,2,2,0),(701,1,1,3,0),(706,1,0,1,1),(708,1,2,1,0),(712,1,1,0,1),(719,1,6,1,0),(735,1,2,3,0),(804,1,5,4,0),(847,1,6,4,0),(907,1,7,4,0),(908,1,6,5,0),(909,1,5,5,0),(976,1,4,5,1),(1030,1,10,3,0),(1031,1,11,4,0),(1032,1,12,4,1),(1033,1,13,4,1),(1034,1,14,4,0),(1035,1,14,3,0),(1036,1,13,3,1),(1037,1,12,3,1),(1308,1,1,5,1),(1309,1,0,5,0),(1390,1,10,4,0),(1391,1,11,5,0),(1392,1,13,5,1),(1393,1,14,5,0),(1394,1,12,6,0),(1446,7,9,8,0),(1475,7,7,0,0),(1477,2,5,6,0),(1478,2,5,5,1),(1479,2,5,4,1),(1480,2,5,3,1),(1481,2,5,2,1),(1482,2,4,2,1),(1483,2,4,3,1),(1486,2,4,4,1),(1487,2,4,5,1),(1488,2,6,3,1),(1489,2,6,4,1),(1490,2,6,5,1),(1494,2,3,4,0),(1501,2,2,4,0),(1505,2,6,2,1),(1506,2,6,1,1),(1507,2,5,1,1),(1508,2,4,1,1),(1509,2,4,0,1),(1510,2,5,0,1),(1511,2,6,0,1),(1513,2,3,0,1),(1514,2,3,1,1),(1515,2,3,2,1),(1516,2,3,3,1),(1517,2,7,2,1),(1518,2,8,2,1),(1519,2,9,2,1),(1521,2,8,1,1),(1522,2,7,1,1),(1526,2,9,1,1),(1527,2,8,0,1),(1529,2,10,1,0),(1530,2,9,0,1),(1532,2,7,0,1),(1536,2,10,0,1),(1538,1,4,6,0),(1539,1,3,6,0),(1540,1,2,6,0),(1541,2,5,7,0),(1542,2,5,8,0),(1543,2,6,8,0),(1544,2,6,7,0),(1545,2,6,6,0),(1572,2,2,0,1),(1573,2,7,3,1),(1577,2,7,8,0),(1580,2,4,8,0),(1581,2,4,7,0),(1583,3,0,11,1),(1584,3,0,10,1),(1585,3,0,9,1),(1586,3,0,8,1),(1588,3,1,9,1),(1589,3,1,10,0),(1590,3,1,11,1),(1591,3,2,11,1),(1592,3,2,10,0),(1594,3,3,11,1),(1595,3,4,11,1),(1596,3,0,7,1),(1597,3,0,0,1),(1598,3,0,1,1),(1599,3,0,2,1),(1600,3,0,3,1),(1601,3,0,4,1),(1602,3,0,5,1),(1603,3,0,6,1),(1610,3,1,0,0),(1611,3,2,0,0),(1612,3,3,0,1),(1613,3,4,0,1),(1614,3,5,0,1),(1615,3,6,0,1),(1616,3,7,0,1),(1617,3,8,0,1),(1618,3,9,0,1),(1619,3,10,0,1),(1620,3,11,0,1),(1621,3,11,1,1),(1622,3,11,2,1),(1623,3,11,3,1),(1624,3,11,4,1),(1625,3,11,5,1),(1626,3,11,6,1),(1627,3,11,8,1),(1628,3,11,9,1),(1630,3,11,7,1),(1635,3,11,10,1),(1636,3,11,11,1),(1637,3,10,11,1),(1638,3,9,11,1),(1639,3,8,11,1),(1640,3,7,11,1),(1641,3,6,11,1),(1642,3,5,11,1),(1644,3,1,8,1),(1646,3,2,9,1),(1648,3,3,10,0),(1649,3,4,10,0),(1655,3,1,7,0),(1656,3,1,6,0),(1657,3,1,5,0),(1658,3,1,4,0),(1659,3,1,3,0),(1660,3,1,2,1),(1661,3,1,1,0),(1662,3,2,1,0),(1663,3,3,1,0),(1669,3,8,1,1),(1670,3,9,1,1),(1671,3,10,1,0),(1672,3,10,2,0),(1680,3,10,8,0),(1681,3,10,9,0),(1682,3,9,9,1),(1683,3,9,10,0),(1684,3,8,10,0),(1685,3,7,10,0),(1686,3,6,10,0),(1690,3,10,10,0),(1699,3,10,3,0),(1701,3,9,2,1),(1704,3,7,1,0),(1707,3,6,1,0),(1708,3,5,1,0),(1709,3,4,1,0),(1711,3,3,2,1),(1712,3,2,2,1),(1713,3,2,3,0),(1719,3,2,7,0),(1720,3,2,8,1),(1722,3,3,9,1),(1725,3,5,10,0),(1733,3,4,2,1),(1737,3,2,4,1),(1744,3,3,8,1),(1746,3,4,9,1),(1773,1,12,5,1),(1777,1,13,2,1),(1786,1,13,1,1),(1787,1,13,0,1),(1793,1,2,5,1),(1794,1,3,5,1),(1797,3,7,2,0),(1798,3,10,4,0),(1799,3,10,7,0),(1800,3,9,7,1),(1808,3,7,9,1),(1809,3,8,9,1),(1810,4,3,9,1),(1811,4,4,9,1),(1812,4,5,9,1),(1813,4,5,8,1),(1814,4,5,7,1),(1815,4,4,7,1),(1818,4,4,8,1),(1820,4,6,8,1),(1821,4,6,9,1),(1846,3,5,9,1),(1863,3,2,6,1),(1865,3,3,7,0),(1878,3,2,5,1),(1907,3,4,3,0),(1908,3,5,3,0),(1909,3,5,2,1),(1932,3,8,2,1),(1968,3,10,5,0),(2064,3,6,2,1),(2068,3,9,3,1),(2069,3,9,4,1),(2070,3,9,5,1),(2071,3,9,6,1),(2073,3,9,8,1),(2077,3,6,9,1),(2087,3,3,4,0),(2088,3,4,4,0),(2089,3,5,4,0),(2090,3,6,4,1),(2091,3,7,4,0),(2092,3,7,5,0),(2093,3,7,6,0),(2094,3,7,7,0),(2095,3,6,7,0),(2096,3,5,7,0),(2097,3,4,7,0),(2098,3,4,6,1),(2111,3,8,4,1),(2119,3,3,6,1),(2120,3,3,5,0),(2121,3,4,5,0),(2122,3,5,5,0),(2125,3,6,3,1),(2126,3,7,3,0),(2127,3,8,3,1),(2149,3,8,5,1),(2150,3,8,6,1),(2151,3,8,7,1),(2152,3,8,8,1),(2153,3,7,8,1),(2154,3,6,8,1),(2155,3,5,8,1),(2156,3,4,8,1),(2180,3,6,5,1),(2181,3,6,6,1),(2182,3,5,6,1);
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
  `start_pitchfork` tinyint(2) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `levels`
--

LOCK TABLES `levels` WRITE;
/*!40000 ALTER TABLE `levels` DISABLE KEYS */;
INSERT INTO `levels` VALUES (1,'Hello, World!',-1,-1,-1,-20,0,14,6,'Welcome to the game!\r\n\r\nIn this game, you will control Farmer Dan, highlighted in green on the left, on his journey to rescue his cow, outlined in gold on the right.\r\n\r\nUnlike a normal video game, you will not actually control farmer Dan directly, but will write a piece of code that will allow Farmer Dan to find his cow on his own.\r\n\r\nYou are given several ways to control farmer Dan, but for the first level, all you will need will be the <b>x</b>, and the <b>y</b> variables. They will always be defined to <b>0</b> before your code even runs, so you won\'t need to worry about assigning them or using <b>var</b>.\r\n\r\nSetting the <b>x</b> Variable allows you to control how fast farmer Dan moves left to right-- Setting it to <b>1</b> means He will move at maximum speed to the <b>right</b>, while setting it at <b>-1</b> means he will move at maximum speed to the <b>left</b>. If you set this value more than 1 or less than -1, it will be capped back to between -1 and 1.\r\n\r\nThe <b>y</b> Variable similarly allows you to control Dan\'s vertical movement, <b>1</b> sending him <b>upward</b>, and <b>-1</b> sending him <b>down</b>.\r\n\r\nFor this simple level, see if you can set the right combination of <b>x</b> and <b>y</b> variables to send Farmer Dan to the Cow.\r\n','Since the Cow is directly to Dan\'s <b>right</b>, you will only need to worry about the <b>x</b> variable for this level.','// The x and y variables that control Farmer Dan:\r\nx = 0;\r\ny = 0;',80,0),(2,'The Player',1,-1,-1,-10,0,11,9,'In the last level, you used the <b>x</b> and <b>y</b> variables to control Farmer Dan\'s Movement. In this level, you will have access to another object you can use: <b>player</b>.\r\n\r\nThe <b>player</b> variable allows you to know the position Farmer Dan is currently standing on the level, and actually is made up of two parts:\r\n<b>player.x</b>, which shows you the players x position (row), and\r\n<b>player.y</b>, which shows you the player\'s y position (column).\r\n\r\nIt\'s important to note that unlike <b>x</b> and <b>y</b>, changing the <b>player</b> variable won\'t actually change the player\'s position, and can only be used to find out where the farmer is.','See if you can use the player variable to change the direction Farmer Dan walks by using <b>if</b> statements.\r\nFor example:\r\n\r\n<div class = \'modal-code\'>\r\nx = 1;\r\ny = 1;\r\nif(<b>player.y</b> >= <b>7</b>)\r\n{\r\n    <b>y</b> = 0;\r\n}</div>','x = 0;\r\ny = 0;\r\nprint(player.x+\",\"+player.y);',100,0),(3,'Time',2,-1,-1,0,0,9,9,'In the last level, you used <b>player</b> to determine how farmer Dan should avoid the obstacle. This level gives you another way to control Framer Dan: <b>time</b>.\r\n\r\nThe <b>time</b> variable gives you access to the amount of time left in the level, in seconds, which will exactly follow the clock at the top.\r\n\r\nWith <b>time</b>, you can much more easily define a path for Farmer Dan using <b>if</b> statements that change the <b>x</b> and <b>y</b> variables.','You can use the <b>time</b> variable to easily control how Farmer Dan moves.\r\n\r\n<div class = \'modal-code\'>\r\nx = 1;\r\ny = 0;\r\nif(<b>time</b> >= 15)\r\n{\r\n    <b>y</b> = 0;\r\n}\r\nelse if(<b>time</b> >= 10)\r\n{\r\n    <b>y</b> = 1;\r\n    <b>x</b> = 0;\r\n}</div>','x = 0;\r\ny = 0;\r\n\r\nprint(time);',200,0),(4,'The Pitchfork',3,-1,-1,10,-10,10,10,'The pitchfork is the most common tool to any farmer, so it\'s never too soon to learn to use one.\r\n\r\nThe pitchfork can easily be picked up by touching it, and farmer Dan will automatically equip it.\r\n\r\nTo swing, simply set the variable <b>pitchforkSwing</b> to <b>true</b>, and all hay bales that you are touching will be immediately flung away from you.','To beat the level, you will need to first, pick up the pitchfork, and then walk up to the hay bales, and swing your pitchfork until the hay bales are cleared.','',80,0),(6,'Mazes',3,-1,-1,10,10,0,0,'','','',0,0),(7,'Enemies',4,-1,-1,20,0,10,10,'','','',0,0);
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
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_levels`
--

LOCK TABLES `user_levels` WRITE;
/*!40000 ALTER TABLE `user_levels` DISABLE KEYS */;
INSERT INTO `user_levels` VALUES (8,1,1,'// The x and y variables that control Farmer Dan:\r\nx = 1;\r\ny = 0;',35,1),(9,1,2,'x = 1;\r\ny = 1;\r\nif(player.y >= 7)\r\n{\r\n	y = 0;\r\n}\r\nif(player.x >= 8.5)\r\n{\r\n	y = -1;\r\n    x = 0;\r\n}',49,1),(10,1,3,'x = 1;\r\ny = 1;\r\nif(time <=4)\r\n{\r\n	y=1;\r\n  	x=1;\r\n}\r\nelse if(time <= 5)\r\n{\r\n	y = 0;\r\n	x = 1;\r\n}\r\nelse if(time <= 8)\r\n{\r\n	y = -1;\r\n	x = 0;\r\n}\r\nelse if(time <= 12)\r\n{\r\n	y = 0;\r\n    x = -1;\r\n}',161,1),(11,1,4,'',0,0);
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

-- Dump completed on 2018-01-04 16:45:54
