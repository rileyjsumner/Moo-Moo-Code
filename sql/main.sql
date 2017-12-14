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
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `entities`
--

LOCK TABLES `entities` WRITE;
/*!40000 ALTER TABLE `entities` DISABLE KEYS */;
INSERT INTO `entities` VALUES (2,1,'Cow','cow'),(3,0,'Player Spawn','farmer_dan'),(6,2,'Pitch Fork - On Ground','pitchfork_ground'),(7,3,'Pitch Fork - Flying','pitchfork_flying'),(8,4,'Hay Bale','hay');
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
) ENGINE=InnoDB AUTO_INCREMENT=3935 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `level_decorations`
--

LOCK TABLES `level_decorations` WRITE;
/*!40000 ALTER TABLE `level_decorations` DISABLE KEYS */;
INSERT INTO `level_decorations` VALUES (3359,1,10,1.42222,5.9,0),(3360,1,10,12.9659,5.9,1),(3361,1,9,13.018,5.81702,2),(3362,1,10,2.66934,5.77512,3),(3363,1,7,2.65387,5.75,4),(3364,1,6,4.4609,5.75,5),(3365,1,6,12.8697,5.75,6),(3366,1,6,13.2335,5.75,7),(3367,1,8,3.99455,5.74833,8),(3368,1,10,3.43942,5.65268,9),(3369,1,7,1.60185,5.61612,10),(3370,1,10,4.3281,5.57916,11),(3371,1,7,1.90582,5.5,12),(3372,1,7,2.9349,5.5,13),(3373,1,7,3.93094,5.5,14),(3374,1,8,4.22575,5.5,15),(3375,1,7,12.6476,5.5,16),(3376,1,8,13.2634,5.5,17),(3377,1,10,12.9691,5.45979,18),(3378,1,9,13.1479,5.05579,19),(3379,1,7,12.2348,5.00213,20),(3380,1,6,12.5617,4.90874,21),(3381,1,6,13.4239,4.709,22),(3382,1,8,13.3062,4.65404,23),(3383,1,8,12.9741,4.411,24),(3384,1,7,13.1603,3.80166,25),(3385,1,10,12.6416,3.78343,26),(3386,1,6,12.8097,3.74888,27),(3387,1,9,13.3162,3.60458,28),(3388,1,7,13.2392,3.55608,29),(3389,1,8,13.75,3.4195,30),(3390,1,10,13.75,3.33724,31),(3391,1,7,0.509565,3.2895,32),(3392,1,8,12.6374,3.10154,33),(3393,1,8,13.3233,3.01261,34),(3394,1,9,12.4004,2.95813,35),(3395,1,7,12.1162,2.85967,36),(3396,1,7,0.877206,2.65497,37),(3397,1,10,0.516125,2.55484,38),(3398,1,9,9.03994,2.47538,39),(3399,1,6,0.422128,2.46453,40),(3400,1,7,13.7336,2.45116,41),(3401,1,8,1.53031,2.34531,42),(3402,1,10,12.5129,2.33045,43),(3403,1,10,8.63604,2.3168,44),(3404,1,10,0.898207,2.27763,45),(3405,1,8,9.88038,2.17684,46),(3406,1,7,12.6896,2.14227,47),(3407,1,8,13.75,2.09255,48),(3408,1,7,9.39676,2.05546,49),(3409,1,9,13.75,2.0115,50),(3410,1,8,8.74187,1.90939,51),(3411,1,9,1.66259,1.73882,52),(3412,1,7,1.60479,1.69078,53),(3413,1,6,12.0596,1.65034,54),(3414,1,6,0.25,1.64731,55),(3415,1,6,8.78813,1.59809,56),(3416,1,10,4.76402,1.49464,57),(3417,1,7,0.649566,1.4939,58),(3418,1,9,2.93583,1.48256,59),(3419,1,9,11.4281,1.46542,60),(3420,1,7,8.86603,1.42712,61),(3421,1,7,5.32983,1.38078,62),(3422,1,9,3.59203,1.29487,63),(3423,1,6,13.75,1.27739,64),(3424,1,8,8.40895,1.25907,65),(3425,1,9,10.5753,1.25119,66),(3426,1,7,0.405243,1.24515,67),(3427,1,9,5.97777,1.22068,68),(3428,1,10,13.75,1.1779,69),(3429,1,6,10.7431,1.1491,70),(3430,1,7,9.59239,1.14672,71),(3431,1,8,1.88183,1.14581,72),(3432,1,9,1.1473,1.13345,73),(3433,1,7,11.7358,1.00565,74),(3434,1,6,7.07043,1.00178,75),(3435,1,6,5.6086,0.993569,76),(3436,1,8,12.3776,0.978816,77),(3437,1,8,9.53463,0.939935,78),(3438,1,7,4.82865,0.921393,79),(3439,1,6,11.9917,0.913403,80),(3440,1,6,1.59083,0.913143,81),(3441,1,7,12.0668,0.883246,82),(3442,1,9,12.9776,0.874784,83),(3443,1,10,8.94023,0.843037,84),(3444,1,8,3.52014,0.815475,85),(3445,1,8,13.3683,0.81313,86),(3446,1,7,10.6357,0.813085,87),(3447,1,8,2.11427,0.809017,88),(3448,1,6,2.69098,0.743276,89),(3449,1,8,4.07061,0.734121,90),(3450,1,9,9.38618,0.704844,91),(3451,1,8,7.01878,0.680718,92),(3452,1,8,3.70729,0.589496,93),(3453,1,9,0.573202,0.549273,94),(3454,1,9,7.88948,0.504037,95),(3557,3,9,0.800932,11.9,0),(3558,3,10,2.74359,11.9,1),(3559,3,10,3.16644,11.9,2),(3560,3,9,4.95466,11.9,3),(3561,3,10,6.834,11.9,4),(3562,3,10,8.39731,11.9,5),(3563,3,9,9.40377,11.9,6),(3564,3,9,10.7843,11.9,7),(3565,3,9,11.75,11.8795,8),(3566,3,10,5.53629,11.8754,9),(3567,3,10,7.2281,11.7598,10),(3568,3,6,0.59866,11.75,11),(3569,3,6,3.75633,11.75,12),(3570,3,6,4.01917,11.75,13),(3571,3,8,5.60698,11.75,14),(3572,3,6,8.51192,11.75,15),(3573,3,8,9.88513,11.75,16),(3574,3,7,10.3459,11.75,17),(3575,3,8,11.7031,11.75,18),(3576,3,6,1.81378,11.7021,19),(3577,3,6,6.40393,11.6613,20),(3578,3,10,1.09131,11.6425,21),(3579,3,6,7.42269,11.538,22),(3580,3,7,2.83553,11.5142,23),(3581,3,8,0.862722,11.5,24),(3582,3,7,1.72344,11.5,25),(3583,3,7,2.07662,11.5,26),(3584,3,8,3.3492,11.5,27),(3585,3,7,4.99747,11.5,28),(3586,3,7,5.47892,11.5,29),(3587,3,7,6.32255,11.5,30),(3588,3,7,7.84396,11.5,31),(3589,3,6,8.2474,11.5,32),(3590,3,6,9.44912,11.5,33),(3591,3,7,10.5396,11.5,34),(3592,3,7,11.6491,11.5,35),(3593,3,10,0.497769,11.4839,36),(3594,3,8,2.45411,11.4669,37),(3595,3,7,0.457616,11.4257,38),(3596,3,7,3.25597,11.4046,39),(3597,3,8,3.83209,11.232,40),(3598,3,7,10.5771,11.2096,41),(3599,3,8,9.37558,11.1747,42),(3600,3,9,10.4222,11.1095,43),(3601,3,7,4.4688,11.1036,44),(3602,3,8,11.75,11.0952,45),(3603,3,9,3.304,11.0351,46),(3604,3,7,0.828904,10.9675,47),(3605,3,8,1.93592,10.9528,48),(3606,3,7,4.60988,10.9403,49),(3607,3,9,8.33464,10.9008,50),(3608,3,6,2.56978,10.8932,51),(3609,3,10,7.808,10.8913,52),(3610,3,8,7.11088,10.7457,53),(3611,3,6,8.86837,10.7033,54),(3612,3,7,10.4987,10.7,55),(3613,3,8,1.74784,10.6979,56),(3614,3,8,7.01668,10.6732,57),(3615,3,9,4.81119,10.6381,58),(3616,3,9,1.2403,10.6208,59),(3617,3,7,11.7414,10.5647,60),(3618,3,9,9.16123,10.5479,61),(3619,3,9,2.08612,10.5478,62),(3620,3,7,9.9954,10.5468,63),(3621,3,6,8.64046,10.527,64),(3622,3,9,11.3065,10.5083,65),(3623,3,7,11.75,10.4631,66),(3624,3,7,4.21286,10.3904,67),(3625,3,8,10.1765,10.2779,68),(3626,3,7,10.1013,10.2437,69),(3627,3,7,1.85717,10.1918,70),(3628,3,10,2.27535,10.1293,71),(3629,3,10,7.49879,10.111,72),(3630,3,9,0.86061,10.0829,73),(3631,3,6,1.7157,10.0314,74),(3632,3,6,2.93529,10.0305,75),(3633,3,10,8.5763,9.98442,76),(3634,3,6,0.357286,9.91978,77),(3635,3,8,4.24791,9.90194,78),(3636,3,8,8.9052,9.85148,79),(3637,3,7,9.5535,9.83964,80),(3638,3,6,9.5083,9.83539,81),(3639,3,10,11.1957,9.82606,82),(3640,3,8,2.52045,9.75824,83),(3641,3,6,11.1358,9.74778,84),(3642,3,8,7.09247,9.6934,85),(3643,3,10,9.42388,9.67509,86),(3644,3,6,7.64768,9.63171,87),(3645,3,7,0.736768,9.62809,88),(3646,3,10,1.61078,9.61982,89),(3647,3,9,4.09336,9.55989,90),(3648,3,6,8.81855,9.53163,91),(3649,3,9,10.2131,9.52247,92),(3650,3,8,1.53278,9.34641,93),(3651,3,6,10.9591,9.33354,94),(3652,3,6,11.5678,9.26485,95),(3653,3,10,1.90031,9.22172,96),(3654,3,8,11.4041,9.0628,97),(3655,3,7,0.349808,8.88422,98),(3656,3,8,10.613,8.80475,99),(3657,3,10,0.25,8.76757,100),(3658,3,8,0.786506,8.66758,101),(3659,3,9,10.128,8.61839,102),(3660,3,9,11.75,8.6131,103),(3661,3,6,1.43716,8.55648,104),(3662,3,9,9.88367,8.49008,105),(3663,3,6,2.72973,8.46447,106),(3664,3,10,11.75,8.45477,107),(3665,3,8,1.80138,8.39504,108),(3666,3,9,2.24686,8.33615,109),(3667,3,10,0.669268,8.25531,110),(3668,3,8,11.4629,8.02798,111),(3669,3,7,10.6929,7.94503,112),(3670,3,9,10.0927,7.93686,113),(3671,3,10,1.11824,7.87577,114),(3672,3,6,10.8178,7.76788,115),(3673,3,6,9.33037,7.75838,116),(3674,3,7,0.793293,7.67937,117),(3675,3,6,1.24079,7.64062,118),(3676,3,6,11.75,7.59697,119),(3677,3,8,9.44231,7.55127,120),(3678,3,8,2.7855,7.51115,121),(3679,3,8,0.557589,7.50653,122),(3680,3,6,11.75,7.37496,123),(3681,3,10,11.1903,7.2869,124),(3682,3,7,11.0422,7.24465,125),(3683,3,10,0.25,6.90309,126),(3684,3,8,0.966238,6.81069,127),(3685,3,6,0.510843,6.62943,128),(3686,3,10,0.726861,6.00417,129),(3687,3,8,11.2556,5.94072,130),(3688,3,6,0.592364,5.85111,131),(3689,3,7,0.25,5.8259,132),(3690,3,8,11.3169,5.70277,133),(3691,3,10,11.2671,5.58558,134),(3692,3,6,0.25,5.49588,135),(3693,3,8,0.310782,5.35054,136),(3694,3,9,0.25,5.30161,137),(3695,3,7,10.0451,5.17326,138),(3696,3,10,10.4379,5.16713,139),(3697,3,9,11.7398,5.12196,140),(3698,3,7,11.75,5.11008,141),(3699,3,9,1.68529,5.10583,142),(3700,3,6,1.71814,5.08698,143),(3701,3,7,2.43405,5.01287,144),(3702,3,7,2.40182,4.73337,145),(3703,3,9,2.73795,4.6973,146),(3704,3,8,11.3964,4.69651,147),(3705,3,6,10.0279,4.523,148),(3706,3,7,1.40832,4.51609,149),(3707,3,8,0.416575,4.34061,150),(3708,3,6,11.4122,4.1294,151),(3709,3,6,1.27185,4.12843,152),(3710,3,9,0.758695,4.1226,153),(3711,3,6,11.6944,4.09507,154),(3712,3,9,10.6284,4.07257,155),(3713,3,8,0.52677,4.06033,156),(3714,3,9,11.6217,3.92944,157),(3715,3,7,10.7039,3.8169,158),(3716,3,10,1.22864,3.75466,159),(3717,3,7,1.27625,3.65379,160),(3718,3,6,10.5134,3.61208,161),(3719,3,8,0.25,3.45887,162),(3720,3,8,10.505,3.4508,163),(3721,3,8,1.58718,3.30283,164),(3722,3,8,4.61503,3.22854,165),(3723,3,6,9.46883,3.22501,166),(3724,3,8,11.75,3.15648,167),(3725,3,10,11.365,3.03559,168),(3726,3,6,4.00226,3.02445,169),(3727,3,10,7.25095,2.98708,170),(3728,3,9,9.76289,2.85144,171),(3729,3,7,0.25,2.82618,172),(3730,3,10,4.88962,2.77833,173),(3731,3,9,1.41878,2.74586,174),(3732,3,6,10.3114,2.73793,175),(3733,3,8,7.15753,2.70416,176),(3734,3,7,9.17688,2.68491,177),(3735,3,6,11.5956,2.66037,178),(3736,3,8,7.50324,2.63078,179),(3737,3,10,0.25,2.5867,180),(3738,3,7,1.84495,2.56779,181),(3739,3,10,10.9738,2.50557,182),(3740,3,10,10.7421,2.49998,183),(3741,3,8,9.30002,2.49666,184),(3742,3,7,3.38537,2.43322,185),(3743,3,8,11.75,2.3964,186),(3744,3,6,0.664087,2.3359,187),(3745,3,8,8.22348,2.32174,188),(3746,3,10,9.8131,2.31143,189),(3747,3,10,11.1496,2.29476,190),(3748,3,9,2.18655,2.19023,191),(3749,3,6,9.84468,2.15201,192),(3750,3,10,1.90958,2.13022,193),(3751,3,6,1.11253,2.12819,194),(3752,3,8,10.2051,2.10436,195),(3753,3,8,0.271339,2.02964,196),(3754,3,9,3.10787,2.0161,197),(3755,3,7,11.548,1.92401,198),(3756,3,8,10.8913,1.91959,199),(3757,3,10,7.57489,1.90991,200),(3758,3,10,0.395155,1.9041,201),(3759,3,7,1.64403,1.8579,202),(3760,3,10,8.39497,1.85633,203),(3761,3,8,4.72732,1.85381,204),(3762,3,10,4.31724,1.85249,205),(3763,3,7,3.15229,1.74077,206),(3764,3,7,2.83018,1.71867,207),(3765,3,6,4.90294,1.6872,208),(3766,3,7,8.83183,1.68048,209),(3767,3,7,2.92099,1.66549,210),(3768,3,7,7.1733,1.59292,211),(3769,3,8,7.48573,1.58908,212),(3770,3,9,10.5354,1.49974,213),(3771,3,6,10.0714,1.44716,214),(3772,3,8,4.29105,1.33743,215),(3773,3,8,1.08114,1.33152,216),(3774,3,9,2.53719,1.32091,217),(3775,3,6,11.2453,1.26161,218),(3776,3,6,3.75998,1.23469,219),(3777,3,7,5.30067,1.20004,220),(3778,3,10,5.95763,1.1757,221),(3779,3,9,6.97734,1.16812,222),(3780,3,7,0.871502,1.12943,223),(3781,3,10,8.18759,1.12632,224),(3782,3,7,5.41815,1.0907,225),(3783,3,9,3.87054,1.05855,226),(3784,3,6,8.03353,1.04472,227),(3785,3,6,6.28096,0.998579,228),(3786,3,8,9.37983,0.998263,229),(3787,3,10,9.85042,0.977537,230),(3788,3,9,4.80519,0.970609,231),(3789,3,8,9.84875,0.946729,232),(3790,3,6,4.44071,0.919599,233),(3791,3,10,7.01122,0.808972,234),(3792,3,7,6.35179,0.780414,235),(3793,3,8,8.12034,0.6898,236),(3794,3,7,7.81077,0.680696,237),(3795,3,7,0.892256,0.673922,238),(3796,3,8,2.87346,0.665127,239),(3797,3,6,11.4932,0.658692,240),(3798,3,10,0.982247,0.614396,241),(3799,3,10,11.4482,0.605337,242),(3800,3,8,10.649,0.599888,243),(3801,3,9,1.20907,0.587727,244),(3802,3,6,1.80426,0.562216,245),(3803,3,6,3.45988,0.558257,246),(3804,3,8,7.71664,0.546621,247),(3805,3,7,2.1393,0.538612,248),(3806,2,10,5.94885,6.43613,0),(3807,2,8,4.41976,6.22871,1),(3808,2,8,6.51834,6.08748,2),(3809,2,8,4.13924,6.08103,3),(3810,2,7,5.73397,6.00659,4),(3811,2,6,5.94741,5.91891,5),(3812,2,7,6.83472,5.89609,6),(3813,2,10,6.0336,5.59663,7),(3814,2,9,4.24112,5.52502,8),(3815,2,7,4.03578,5.39773,9),(3816,2,10,5.55208,5.22716,10),(3817,2,10,4.87069,5.20788,11),(3818,2,7,5.64033,5.19578,12),(3819,2,9,6.59437,5.10714,13),(3820,2,7,6.79731,5.02993,14),(3821,2,7,6.13662,4.90239,15),(3822,2,6,4.2863,4.80566,16),(3823,2,6,5.28523,4.61326,17),(3824,2,10,6.15142,4.2727,18),(3825,2,6,7.05041,4.18758,19),(3826,2,10,3.92557,4.16813,20),(3827,2,6,5.81902,4.1631,21),(3828,2,6,3.86465,4.14594,22),(3829,2,9,7.38116,4.14047,23),(3830,2,6,5.38988,4.0771,24),(3831,2,7,3.81126,4.01481,25),(3832,2,6,7.41127,4.01093,26),(3833,2,9,5.65344,3.95207,27),(3834,2,6,6.88616,3.95139,28),(3835,2,10,4.11639,3.9418,29),(3836,2,8,4.5394,3.63986,30),(3837,2,8,6.95727,3.53751,31),(3838,2,7,4.84677,3.51781,32),(3839,2,9,6.48208,3.49718,33),(3840,2,10,4.65994,3.48356,34),(3841,2,9,9.80165,3.46645,35),(3842,2,8,3.53831,3.36192,36),(3843,2,10,8.92937,3.30839,37),(3844,2,7,8.60441,3.25603,38),(3845,2,6,7.96092,3.23399,39),(3846,2,6,7.3398,3.19225,40),(3847,2,9,5.12613,3.1672,41),(3848,2,7,3.74651,3.14011,42),(3849,2,6,9.48368,3.04259,43),(3850,2,8,5.48731,3.00306,44),(3851,2,10,3.88883,2.98186,45),(3852,2,9,7.2646,2.86445,46),(3853,2,7,8.06901,2.86419,47),(3854,2,6,4.01417,2.76337,48),(3855,2,7,9.46818,2.75274,49),(3856,2,7,5.65335,2.75071,50),(3857,2,6,6.11258,2.66711,51),(3858,2,8,4.11117,2.57554,52),(3859,2,8,6.52736,2.53231,53),(3860,2,9,5.87653,2.40617,54),(3861,2,9,4.004,2.36084,55),(3862,2,10,7.30101,2.30921,56),(3863,2,7,3.07133,2.2515,57),(3864,2,7,7.72678,2.25107,58),(3865,2,7,8.16889,2.24544,59),(3866,2,6,5.14877,2.18364,60),(3867,2,6,9.32525,2.17033,61),(3868,2,9,6.97908,2.07982,62),(3869,2,8,7.7528,2.0745,63),(3870,2,7,8.08134,2.06321,64),(3871,2,7,6.99133,2.05121,65),(3872,2,6,5.3037,1.95292,66),(3873,2,10,9.55653,1.93452,67),(3874,2,6,4.83132,1.93001,68),(3875,2,7,4.85997,1.86108,69),(3876,2,9,3.95011,1.82284,70),(3877,2,8,9.26956,1.80411,71),(3878,2,8,6.94261,1.60406,72),(3879,2,10,8.21924,1.52923,73),(3880,2,8,3.38516,1.51845,74),(3881,2,8,4.62057,1.47275,75),(3882,2,9,5.81454,1.44966,76),(3883,2,7,6.33042,1.44773,77),(3884,2,6,6.24687,1.41846,78),(3885,2,6,3.73413,1.38385,79),(3886,2,8,5.73447,1.35457,80),(3887,2,9,10.3317,1.3221,81),(3888,2,10,2.23033,1.31122,82),(3889,2,8,3.95433,1.29645,83),(3890,2,6,9.89902,1.28512,84),(3891,2,6,7.4105,1.21498,85),(3892,2,7,2.22719,1.18586,86),(3893,2,8,8.3691,1.16664,87),(3894,2,7,8.8928,1.15816,88),(3895,2,9,4.41331,1.14363,89),(3896,2,8,9.74055,1.10321,90),(3897,2,6,7.07807,1.06225,91),(3898,2,7,10.4496,1.06207,92),(3899,2,9,9.91923,1.0336,93),(3900,2,9,6.77036,1.00656,94),(3901,2,9,3.13882,0.997807,95),(3902,2,10,7.35417,0.851533,96),(3903,2,8,10.75,0.744893,97),(3904,2,7,4.5459,0.643193,98),(3905,2,6,5.78269,0.625433,99),(3906,2,9,8.94957,0.591124,100),(3907,2,7,2.45,0.564365,101),(3908,4,10,4.81729,9.9,0),(3909,4,10,6.65796,9.9,1),(3910,4,10,5.91318,9.86399,2),(3911,4,9,3.45428,9.8399,3),(3912,4,8,4.68926,9.75,4),(3913,4,6,5.42806,9.75,5),(3914,4,6,6.41944,9.75,6),(3915,4,7,3.50739,9.68073,7),(3916,4,6,3.35924,9.5,8),(3917,4,8,4.75774,9.5,9),(3918,4,6,5.7446,9.5,10),(3919,4,7,6.66171,9.5,11),(3920,4,6,5.53716,9.4714,12),(3921,4,10,5.87636,9.30386,13),(3922,4,7,5.00605,9.22833,14),(3923,4,7,4.81465,9.20572,15),(3924,4,9,4.80342,9.01862,16),(3925,4,7,6.37532,9.00541,17),(3926,4,8,6.74133,8.98105,18),(3927,4,7,4.25903,8.93858,19),(3928,4,9,6.5211,8.53505,20),(3929,4,6,5.58548,8.4824,21),(3930,4,6,4.30843,8.15849,22),(3931,4,7,4.52791,7.87536,23),(3932,4,7,5.00953,7.73475,24),(3933,4,9,4.78064,7.73362,25),(3934,4,9,5.83219,7.59552,26);
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

-- Dump completed on 2017-12-14 15:47:03
