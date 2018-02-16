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
  `lesson_id` int(11) unsigned NOT NULL,
  `binding_title` varchar(45) NOT NULL,
  `binding_value` varchar(45) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `binding_lesson_idx` (`lesson_id`),
  CONSTRAINT `binding_lesson` FOREIGN KEY (`lesson_id`) REFERENCES `lessons` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lesson_bindings`
--

LOCK TABLES `lesson_bindings` WRITE;
/*!40000 ALTER TABLE `lesson_bindings` DISABLE KEYS */;
INSERT INTO `lesson_bindings` VALUES (1,2,'printed_var','This is a print statement'),(2,3,'int_var','?'),(3,3,'string_var','?'),(4,4,'first_num','3'),(5,4,'second_num','7'),(6,5,'add_num','?'),(8,6,'my_greeting','?'),(9,7,'updateAccount','?'),(10,8,'getDate','?'),(11,8,'today_date','?'),(12,9,'my_pizza','?'),(13,10,'Box','function Box(){this.size=\"4x3\";}'),(14,11,'Box','function Box(){this.size=\"4x3\";}'),(15,11,'my_box','new Box()');
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
  `user_id` int(11) unsigned NOT NULL,
  `lesson_id` int(11) NOT NULL,
  `save_code` varchar(1500) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_lesson_idx` (`user_id`),
  CONSTRAINT `user_lessons` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lesson_progress`
--

LOCK TABLES `lesson_progress` WRITE;
/*!40000 ALTER TABLE `lesson_progress` DISABLE KEYS */;
INSERT INTO `lesson_progress` VALUES (4,4,2,'var printed_var = \"This is a print statement\";\r\nprint(printed_var);'),(5,4,3,'var int_var = 3;\r\nvar string_var = \"kek\";\r\nprint(int_var + \"\\n\" + string_var);'),(6,4,4,'// int variable\r\nvar first_num = 3;\r\nprint(first_num + 4);\r\nvar second_num = 7;\r\nprint(first_num + second_num);'),(7,4,5,'// Function\r\nfunction add(num_one, num_two) {\r\n  return(num_one+num_two);\r\n}\r\nvar add_num = add(3, 8);\r\nprint(add_num);'),(8,4,6,'function greeting(name, age, money) {\r\n  return (\"Hello! My name is \" + name + \" and I am \" + age + \" years old. I have \" + money + \" dollars!\");\r\n}\r\nvar my_greeting = greeting(\"Riley\", 17, 23.22);\r\nprint(my_greeting);'),(9,4,7,'// Update Account\r\nfunction updateAccount(init_balance, transaction) {\r\n  \r\n  // return:\r\n  return init_balance + transaction;\r\n}\r\n'),(10,4,8,'function getDate() {\r\n  return Date.now();\r\n}\r\n// call function\r\nvar today_date = getDate();\r\nprint(today_date);'),(11,4,9,'function Pizza(topping, crust, size) {\r\n  this.topping = topping;\r\n  this.crust = crust;\r\n  this.size = size;\r\n  this.getInfo = getPizzaInfo;\r\n}\r\nfunction getPizzaInfo() {\r\n  return \"Looks like a \" + this.size + \" \" + this.crust + \" crust pizza with \" + this.topping +\"\'s\";\r\n}\r\nvar example_pizza = new Pizza(\"pepperoni\", \"thin\", \"medium\");\r\nprint(example_pizza.getInfo());\r\n\r\nvar my_pizza = new Pizza(\"sausage\", \"New York Style\", \"large\");\r\nprint(my_pizza.getInfo());'),(12,4,10,'function Box() {\r\n  this.size=\"4x3\";\r\n}'),(13,4,11,'var my_box = new Box();');
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
INSERT INTO `lessons` VALUES (2,'Output',1,1,'When writing javascript there are often times you will need to display your code. Given to you is a variable myvar. You can print information using the <code>print()</code> function. For example, to print out a string you could say:\r\n<br/>\r\n<code>print(\"Moo Moo Code!);</code>\r\n<br />\r\nTry printing out the variable given to you!','var printed_var = \"This is a print statement\";','This is a print statement'),(3,'Variables',2,1,'Variables are a way to store information. There are 3 types of variables:\r\n<ul>\r\n<li>String (text)</li>\r\n<li>Integer (whole numbers)</li>\r\n<li>Double (decimals)</li>\r\n</ul>\r\nWe can declare and initialize variables by saying: <code>var my_var = \"this is a string variable\";</code>\r\n<br/>\r\nTo declare integer and double variables is the same way, just without the quotes: <code>var my_num = 1.2;</code>\r\n<br/>\r\nTry declaring 2 variables, an integer type named <code>int_var</code> and a String called <code>string_var</code>. Set them equal to whatever you would like!','// Code Starts Here\r\n','?\r\n?'),(4,'Numbers',3,1,'We can use numbers in javascript to compute data. \r\n<br/>\r\nCalculations can be both stored in a new variable or done inside a <code>print()</code> statement. \r\n<br/>\r\nSuppose we had <code>var first_num = 3;</code>\r\nWe can add 4 to that number, and <code>print()</code> it out. Try running the code and see!\r\n<br/>\r\nTry declaring a new variable <code>second_num</code> and set it equal to 7. Then <code>print()</code> the sum of <code>first_num + second_num</code>!','// int variable\r\nvar first_num = 3;\r\nprint(first_num + 4);','10'),(5,'Introduction',0,2,'Functions allow you to run a block of code multiple times. \r\nWe could have a function called <code>add()</code> which <code>return</code>\'s the sum of two numbers. \r\n<br/>\r\nThe two variables inside the parenthesis are called parameters. The number of parameters to give a function could be 0, or quite a few! It all depends on what the function is doing. Parameters are separated by commas.\r\n<br/>\r\nA function may also contain a <code>return</code> statement. The return statement specifies what value the function should have when it is called. In the case of this function, we return the sum of <code>num_one</code> and <code>num_two</code>.\r\n<br/>\r\nTry calling the function <code>add()</code> and specify the two numbers to add. Store the result in a variable called <code>add_num</code>\r\n<br/>\r\nThe function should take 2 parameters, <code>num_one</code> and <code>num_two</code>','// Function\r\nfunction add(num_one, num_two) {\r\n  return(num_one+num_two)\r\n}','?'),(6,'Arguments',1,2,'Arguments or parameters can be used to give a function information. In the previous example, we used a function <code>add()</code> that took two integer parameters and returned the sum of the two.\r\n<br />\r\nThe function to the right, <code>greeting()</code> takes three parameters: <code>String name</code>,<code>int age</code>, and <code>double money</code>. The function returns a greeting statement.\r\n<br />\r\nTry calling the function, and give it some values!\r\nStore the result in a variable <code>my_greeting</code>','function greeting(name, age, money) {\r\n  return (\"Hello! My name is \" + name + \" and I am \" + age + \" years old. I have \" + money + \" dollars!\");\r\n}\r\n',''),(7,'Returning',2,2,'You may be noticing the <code>return</code> statement at the end of a function. This is what allows us to retrieve a value made by a function. \r\n<br/>\r\nYou can set a function call equal to a variable and use the variable in your code.\r\n<br/>\r\nFor this lesson, imagine you are a banker. Write a function that will return the new account balance after taking two double parameters. \r\n<br/>\r\n<code>init_balance</code> is the start balance, and <code>transaction</code> is the value of the deposit or withdrawal. \r\n<br/>\r\nFill in the function to return the new account balance.','// Update Account\r\nfunction updateAccount(init_balance, transaction) {\r\n  \r\n  // return:\r\n}',''),(8,'Using functions',3,2,'After writing functions, you can use them in your code. Take the function to the right. It returns the current date. You can set the function to a variable, and the variable stores whatever the return value of the function is.\r\n<br/>\r\nSet <code>today_date</code> equal to a function call of <code>getDate</code>. Then print it out.','function getDate() {\r\n  return Date.now();\r\n}\r\n// call function',''),(9,'Introduction',0,3,'In javascript you can also use Object Oriented Programming and create objects. An object can be used to store dynamic information as you define it.\r\n<br/>\r\nTo the right you can see an example object called <code>Pizza</code>. It takes the parameters:\r\n<ul>\r\n<li><code>topping</code></li>\r\n<li><code>crust</code></li>\r\n<li><code>size</code></li>\r\n</ul>\r\n<br/>\r\nThere is also an object of the Pizza class called <code>example_pizza</code>. Follow this example and create your own pizza with called <code>my_pizza</code>.','function Pizza(topping, crust, size) {\r\n  this.topping = topping;\r\n  this.crust = crust;\r\n  this.size = size;\r\n  this.getInfo = getPizzaInfo;\r\n}\r\nfunction getPizzaInfo() {\r\n  return \"Looks like a \" + this.size + \" \" + this.crust + \" crust pizza with \" + this.topping +\"\'s\";\r\n}\r\nvar example_pizza = new Pizza(\"pepperoni\", \"thin\", \"medium\");\r\nprint(example_pizza.getInfo());',''),(10,'Defining an Object',1,3,'Let\'s focus on how to declare a class. While there are many ways to declare objects in JavaScript, we are going to focus on only one. \r\n<br/>\r\nTo start, we declare a <code>function</code> and give it the name of the object we will use. \r\n<br/>\r\nIf we wanted to make a object <code>Train</code> we would say:\r\n<br/>\r\n<code>function Train() {</code>object code<code>}</code>\r\n<br/>\r\nInside the declaration, we can declare some properties as well. Inside the braces, we would type: <code>this.cars = 4</code>. This sets the property <code>cars</code> to 4.\r\n<br/>\r\nTry declaring a new object called Box. Give it a <code>size</code> property equal to \"4x3\".','',''),(11,'Creating Objects',2,3,'Let\'s keep using our <code>Box()</code> object. In order to create an object, we store a variable equal to <code>new Box()</code>, while putting any parameters required by the class inside the <code>()</code>. \r\n<br/>\r\nTry declaring a new <code>Box()</code> object called <code>my_box</code> and set it equal to a new <code>Box()</code> object.','function Box() {\r\n	this.size=\"4x3\";\r\n}',''),(12,'Using Objects',3,3,'Objects can be used to obtain information. We\'ve added another property to the <code>Box()</code> object. When called, the function will return a string with the box information. Let\'s write it!\r\n\r\nDeclare the <code>getBoxInfo()</code> function. It should not require any parameters and will return a string saying: \"The boxes size is \" + <code>this.size</code>.\r\n\r\nThen, create a new <code>Box()</code> called <code>cardboard</code>.\r\n\r\n\r\n','// add getBoxInfo():\r\n\r\n\r\nfunction Box() {\r\n  this.size=\"4x3\";\r\n  this.getBoxInfo=getBoxInfo();\r\n}\r\n\r\n// create Box object\r\n\r\n\r\n// print cardboard info','');
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
) ENGINE=InnoDB AUTO_INCREMENT=7982 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `level_decorations`
--

LOCK TABLES `level_decorations` WRITE;
/*!40000 ALTER TABLE `level_decorations` DISABLE KEYS */;
INSERT INTO `level_decorations` VALUES (3359,1,10,1.42222,5.9,0),(3360,1,10,12.9659,5.9,1),(3361,1,9,13.018,5.81702,2),(3362,1,10,2.66934,5.77512,3),(3363,1,7,2.65387,5.75,4),(3364,1,6,4.4609,5.75,5),(3365,1,6,12.8697,5.75,6),(3366,1,6,13.2335,5.75,7),(3367,1,8,3.99455,5.74833,8),(3368,1,10,3.43942,5.65268,9),(3369,1,7,1.60185,5.61612,10),(3370,1,10,4.3281,5.57916,11),(3371,1,7,1.90582,5.5,12),(3372,1,7,2.9349,5.5,13),(3373,1,7,3.93094,5.5,14),(3374,1,8,4.22575,5.5,15),(3375,1,7,12.6476,5.5,16),(3376,1,8,13.2634,5.5,17),(3377,1,10,12.9691,5.45979,18),(3378,1,9,13.1479,5.05579,19),(3379,1,7,12.2348,5.00213,20),(3380,1,6,12.5617,4.90874,21),(3381,1,6,13.4239,4.709,22),(3382,1,8,13.3062,4.65404,23),(3383,1,8,12.9741,4.411,24),(3384,1,7,13.1603,3.80166,25),(3385,1,10,12.6416,3.78343,26),(3386,1,6,12.8097,3.74888,27),(3387,1,9,13.3162,3.60458,28),(3388,1,7,13.2392,3.55608,29),(3389,1,8,13.75,3.4195,30),(3390,1,10,13.75,3.33724,31),(3391,1,7,0.509565,3.2895,32),(3392,1,8,12.6374,3.10154,33),(3393,1,8,13.3233,3.01261,34),(3394,1,9,12.4004,2.95813,35),(3395,1,7,12.1162,2.85967,36),(3396,1,7,0.877206,2.65497,37),(3397,1,10,0.516125,2.55484,38),(3398,1,9,9.03994,2.47538,39),(3399,1,6,0.422128,2.46453,40),(3400,1,7,13.7336,2.45116,41),(3401,1,8,1.53031,2.34531,42),(3402,1,10,12.5129,2.33045,43),(3403,1,10,8.63604,2.3168,44),(3404,1,10,0.898207,2.27763,45),(3405,1,8,9.88038,2.17684,46),(3406,1,7,12.6896,2.14227,47),(3407,1,8,13.75,2.09255,48),(3408,1,7,9.39676,2.05546,49),(3409,1,9,13.75,2.0115,50),(3410,1,8,8.74187,1.90939,51),(3411,1,9,1.66259,1.73882,52),(3412,1,7,1.60479,1.69078,53),(3413,1,6,12.0596,1.65034,54),(3414,1,6,0.25,1.64731,55),(3415,1,6,8.78813,1.59809,56),(3416,1,10,4.76402,1.49464,57),(3417,1,7,0.649566,1.4939,58),(3418,1,9,2.93583,1.48256,59),(3419,1,9,11.4281,1.46542,60),(3420,1,7,8.86603,1.42712,61),(3421,1,7,5.32983,1.38078,62),(3422,1,9,3.59203,1.29487,63),(3423,1,6,13.75,1.27739,64),(3424,1,8,8.40895,1.25907,65),(3425,1,9,10.5753,1.25119,66),(3426,1,7,0.405243,1.24515,67),(3427,1,9,5.97777,1.22068,68),(3428,1,10,13.75,1.1779,69),(3429,1,6,10.7431,1.1491,70),(3430,1,7,9.59239,1.14672,71),(3431,1,8,1.88183,1.14581,72),(3432,1,9,1.1473,1.13345,73),(3433,1,7,11.7358,1.00565,74),(3434,1,6,7.07043,1.00178,75),(3435,1,6,5.6086,0.993569,76),(3436,1,8,12.3776,0.978816,77),(3437,1,8,9.53463,0.939935,78),(3438,1,7,4.82865,0.921393,79),(3439,1,6,11.9917,0.913403,80),(3440,1,6,1.59083,0.913143,81),(3441,1,7,12.0668,0.883246,82),(3442,1,9,12.9776,0.874784,83),(3443,1,10,8.94023,0.843037,84),(3444,1,8,3.52014,0.815475,85),(3445,1,8,13.3683,0.81313,86),(3446,1,7,10.6357,0.813085,87),(3447,1,8,2.11427,0.809017,88),(3448,1,6,2.69098,0.743276,89),(3449,1,8,4.07061,0.734121,90),(3450,1,9,9.38618,0.704844,91),(3451,1,8,7.01878,0.680718,92),(3452,1,8,3.70729,0.589496,93),(3453,1,9,0.573202,0.549273,94),(3454,1,9,7.88948,0.504037,95),(7415,3,9,0.740934,8.9,0),(7416,3,9,1.32638,8.9,1),(7417,3,9,4.23085,8.9,2),(7418,3,9,5.62393,8.9,3),(7419,3,9,7.93931,8.9,4),(7420,3,10,8.75,8.9,5),(7421,3,9,6.39088,8.85418,6),(7422,3,10,2.00197,8.79827,7),(7423,3,8,0.465764,8.75,8),(7424,3,8,2.35309,8.75,9),(7425,3,6,3.4601,8.75,10),(7426,3,7,4.99562,8.75,11),(7427,3,6,6.65452,8.75,12),(7428,3,8,7.03018,8.75,13),(7429,3,7,8.6375,8.75,14),(7430,3,6,5.03435,8.58267,15),(7431,3,6,1.25124,8.58224,16),(7432,3,10,3.02613,8.55717,17),(7433,3,7,0.612059,8.5,18),(7434,3,7,1.5158,8.5,19),(7435,3,7,2.21027,8.5,20),(7436,3,6,3.77433,8.5,21),(7437,3,8,4.22589,8.5,22),(7438,3,8,5.69678,8.5,23),(7439,3,7,6.28858,8.5,24),(7440,3,6,7.15271,8.5,25),(7441,3,7,8.21913,8.5,26),(7442,3,10,1.69151,8.46895,27),(7443,3,9,8.1783,8.45721,28),(7444,3,8,1.13073,8.45215,29),(7445,3,8,2.16154,8.40705,30),(7446,3,7,0.308186,8.18318,31),(7447,3,7,3.01392,8.18113,32),(7448,3,8,8.75,8.134,33),(7449,3,8,0.25,8.09655,34),(7450,3,7,2.79464,8.02362,35),(7451,3,8,3.00058,8.00712,36),(7452,3,7,1.47673,7.88039,37),(7453,3,6,8.04282,7.84335,38),(7454,3,10,3.53678,7.72133,39),(7455,3,9,0.768281,7.64117,40),(7456,3,9,2.58697,7.62437,41),(7457,3,6,0.643589,7.48757,42),(7458,3,6,1.02566,7.2195,43),(7459,3,9,1.54202,7.12766,44),(7460,3,9,2.64974,7.00508,45),(7461,3,8,2.68743,6.95383,46),(7462,3,8,8.31303,6.93941,47),(7463,3,10,0.862212,6.8399,48),(7464,3,9,8.09635,6.8316,49),(7465,3,8,0.25,6.72146,50),(7466,3,6,2.23902,6.67481,51),(7467,3,6,8.14501,6.61405,52),(7468,3,8,1.90755,6.57592,53),(7469,3,8,1.3968,6.32774,54),(7470,3,10,0.82357,6.25289,55),(7471,3,8,8.40091,6.21317,56),(7472,3,9,1.07952,6.21197,57),(7473,3,8,1.10856,6.16822,58),(7474,3,10,8.15811,6.01461,59),(7475,3,7,0.732239,5.91167,60),(7476,3,7,0.334799,5.7109,61),(7477,3,6,8.17348,5.52494,62),(7478,3,10,0.879844,5.43899,63),(7479,3,8,1.05185,5.141,64),(7480,3,10,1.1763,5.05035,65),(7481,3,6,0.919963,4.69616,66),(7482,3,6,1.80946,4.6573,67),(7483,3,8,8.29869,4.6481,68),(7484,3,9,8.75,4.61116,69),(7485,3,8,8.18761,4.59843,70),(7486,3,8,0.956192,4.51856,71),(7487,3,7,4.15377,4.43376,72),(7488,3,7,2.62143,4.41705,73),(7489,3,7,3.49848,4.40032,74),(7490,3,10,0.462152,4.3138,75),(7491,3,6,2.82399,4.29006,76),(7492,3,10,3.56671,4.19739,77),(7493,3,8,8.73172,4.06821,78),(7494,3,7,1.23251,3.97171,79),(7495,3,9,8.13731,3.88992,80),(7496,3,6,1.61577,3.85772,81),(7497,3,9,1.59556,3.85633,82),(7498,3,6,0.25,3.76291,83),(7499,3,10,4.95795,3.64519,84),(7500,3,6,4.97774,3.6375,85),(7501,3,10,2.80163,3.57914,86),(7502,3,8,8.4067,3.54108,87),(7503,3,6,3.5904,3.54044,88),(7504,3,7,0.27648,3.51191,89),(7505,3,10,0.649633,3.3348,90),(7506,3,8,8.75,3.26002,91),(7507,3,9,8.75,3.12182,92),(7508,3,8,0.25,2.99039,93),(7509,3,7,0.556449,2.9105,94),(7510,3,7,8.25302,2.59805,95),(7511,3,9,8.23622,2.44965,96),(7512,3,6,8.55495,1.9503,97),(7513,3,8,8.01212,1.84065,98),(7514,3,10,0.728627,1.80814,99),(7515,3,6,0.433199,1.72968,100),(7516,3,7,0.635202,1.6521,101),(7517,3,7,5.06416,1.49918,102),(7518,3,7,5.50224,1.49703,103),(7519,3,10,5.75644,1.41324,104),(7520,3,10,3.54304,1.35346,105),(7521,3,8,8.07417,1.20033,106),(7522,3,6,0.25,1.16375,107),(7523,3,8,7.65955,1.1197,108),(7524,3,10,4.90768,1.10967,109),(7525,3,6,7.15525,1.10227,110),(7526,3,8,6.56006,1.05066,111),(7527,3,8,4.3214,1.04962,112),(7528,3,9,8.75,0.939761,113),(7529,3,8,8.75,0.911131,114),(7530,3,6,4.73779,0.911023,115),(7531,3,7,3.21034,0.893264,116),(7532,3,9,7.74499,0.844262,117),(7533,3,7,3.61116,0.75585,118),(7534,3,10,6.07655,0.74657,119),(7535,3,7,0.25,0.588768,120),(7536,3,8,6.79456,0.584155,121),(7537,3,9,0.965097,0.5157,122),(7643,9,10,1.08817,9.9,0),(7644,9,9,2.17075,9.87575,1),(7645,9,6,0.25,9.75,2),(7646,9,8,1.59433,9.75,3),(7647,9,6,2.52147,9.75,4),(7648,9,9,0.351358,9.63867,5),(7649,9,6,0.909563,9.5,6),(7650,9,6,1.79302,9.5,7),(7651,9,8,2.11496,9.5,8),(7652,9,7,5.58703,9.11384,9),(7653,9,8,5.87463,8.98117,10),(7654,9,7,1.66389,8.96528,11),(7655,9,9,1.32293,8.95737,12),(7656,9,7,0.836215,8.86811,13),(7657,9,9,5.03959,8.81336,14),(7658,9,10,0.25,8.76065,15),(7659,9,8,0.25,8.6329,16),(7660,9,8,1.06241,8.57309,17),(7661,9,9,4.58092,8.46042,18),(7662,9,7,5.70582,8.43147,19),(7663,9,6,0.25,8.39551,20),(7664,9,8,4.47164,8.28624,21),(7665,9,7,0.519547,8.24693,22),(7666,9,9,5.70772,8.23484,23),(7667,9,7,6.82802,7.98358,24),(7668,9,7,6.51214,7.96829,25),(7669,9,6,4.73721,7.95735,26),(7670,9,9,6.86136,7.82026,27),(7671,9,7,5.65696,7.61027,28),(7672,9,10,0.666777,7.51851,29),(7673,9,10,6.2578,7.41955,30),(7674,9,10,4.93593,7.39541,31),(7675,9,8,5.64139,7.28336,32),(7676,9,6,7.26435,7.24202,33),(7677,9,6,4.08144,7.23293,34),(7678,9,7,7.02371,7.22495,35),(7679,9,10,7.87144,7.22404,36),(7680,9,8,3.45877,7.18343,37),(7681,9,8,4.32461,7.09787,38),(7682,9,7,0.940831,7.04821,39),(7683,9,10,0.705147,7.0086,40),(7684,9,6,6.03072,7.00121,41),(7685,9,8,6.39314,6.88534,42),(7686,9,10,5.11326,6.80913,43),(7687,9,6,0.680154,6.68573,44),(7688,9,7,3.76582,6.60158,45),(7689,9,9,3.18382,6.56721,46),(7690,9,6,5.5709,6.50493,47),(7691,9,6,2.02838,6.47876,48),(7692,9,7,3.27673,6.42921,49),(7693,9,10,7.41583,6.36892,50),(7694,9,7,4.2183,6.33768,51),(7695,9,8,7.37294,6.31239,52),(7696,9,9,4.29173,6.22254,53),(7697,9,6,7.05892,6.19195,54),(7698,9,7,2.69159,6.18957,55),(7699,9,10,5.45084,6.15686,56),(7700,9,6,6.62102,5.96485,57),(7701,9,6,4.20601,5.95422,58),(7702,9,6,5.7179,5.94713,59),(7703,9,6,3.51882,5.89394,60),(7704,9,10,3.05091,5.87482,61),(7705,9,6,8.42673,5.83266,62),(7706,9,8,6.25156,5.77213,63),(7707,9,6,8.74434,5.75579,64),(7708,9,10,2.44244,5.74574,65),(7709,9,10,6.18825,5.70488,66),(7710,9,8,5.89384,5.69527,67),(7711,9,9,8.04514,5.56851,68),(7712,9,9,6.54575,5.49947,69),(7713,9,8,4.74279,5.42048,70),(7714,9,10,5.26386,5.39086,71),(7715,9,6,5.36994,5.34468,72),(7716,9,9,1.01396,5.26915,73),(7717,9,7,3.76938,5.22036,74),(7718,9,10,7.00147,5.1183,75),(7719,9,6,2.12834,5.02452,76),(7720,9,8,7.55433,5.0041,77),(7721,9,8,5.90341,5.00272,78),(7722,9,6,3.32742,4.92612,79),(7723,9,6,7.39448,4.87432,80),(7724,9,10,4.85889,4.86617,81),(7725,9,9,2.36121,4.86396,82),(7726,9,10,3.72058,4.70224,83),(7727,9,7,6.82354,4.69708,84),(7728,9,8,1.83779,4.66047,85),(7729,9,8,6.54091,4.64103,86),(7730,9,7,2.29547,4.61022,87),(7731,9,7,4.89206,4.57913,88),(7732,9,8,1.93407,4.50282,89),(7733,9,6,4.29377,4.49497,90),(7734,9,7,5.12696,4.45645,91),(7735,9,9,4.36445,4.45537,92),(7736,9,8,3.84112,4.2737,93),(7737,9,10,3.75114,4.262,94),(7738,9,6,4.6545,4.13527,95),(7739,9,6,6.22991,4.05789,96),(7740,9,8,3.43455,3.95745,97),(7741,9,9,5.00538,3.92391,98),(7742,9,6,7.97052,3.8716,99),(7743,9,10,7.96961,3.78627,100),(7744,9,10,6.18338,3.77264,101),(7745,9,8,7.49164,3.66374,102),(7746,9,6,5.08949,3.64357,103),(7747,9,6,6.13592,3.63918,104),(7748,9,6,0.25,3.04965,105),(7749,9,6,7.50797,3.00206,106),(7750,9,10,7.83408,2.92668,107),(7751,9,7,0.25,2.87154,108),(7752,9,9,0.489877,2.83356,109),(7753,9,9,6.0804,2.74542,110),(7754,9,7,6.41608,2.73982,111),(7755,9,8,6.35545,2.63209,112),(7756,9,7,7.01284,2.50748,113),(7757,9,6,0.557414,2.46186,114),(7758,9,9,0.529453,1.7679,115),(7759,9,8,0.45382,1.66552,116),(7760,9,7,4.05761,1.43905,117),(7761,9,7,0.566069,1.40714,118),(7762,9,10,1.51606,1.38306,119),(7763,9,8,1.59407,1.33316,120),(7764,9,7,3.01004,1.27804,121),(7765,9,10,4.39753,1.20169,122),(7766,9,6,3.36915,1.16114,123),(7767,9,9,2.13478,0.891842,124),(7768,9,9,0.338934,0.875646,125),(7769,9,8,4.45068,0.864226,126),(7770,9,7,2.3208,0.837112,127),(7771,9,8,0.954347,0.593881,128),(7772,9,8,1.24108,0.565643,129),(7773,9,8,2.72763,0.511997,130),(7774,9,9,3.2098,0.502063,131),(7775,6,9,0.394279,9.9,0),(7776,6,9,3.68537,9.9,1),(7777,6,10,1.38034,9.84606,2),(7778,6,7,0.72602,9.75,3),(7779,6,8,2.43064,9.75,4),(7780,6,10,4.43922,9.73335,5),(7781,6,8,4.52414,9.61858,6),(7782,6,10,2.05883,9.61362,7),(7783,6,7,1.56265,9.59975,8),(7784,6,7,3.70382,9.52706,9),(7785,6,8,0.25,9.5,10),(7786,6,6,1.65277,9.5,11),(7787,6,7,2.28159,9.5,12),(7788,6,6,3.17376,9.5,13),(7789,6,7,4.51576,9.5,14),(7790,6,8,2.13525,9.35052,15),(7791,6,7,3.82749,9.33925,16),(7792,6,8,3.75948,9.22083,17),(7793,6,8,1.03462,9.19129,18),(7794,6,9,2.79437,9.12021,19),(7795,6,9,0.25,9.03567,20),(7796,6,9,3.84139,8.96743,21),(7797,6,7,2.96128,8.75803,22),(7798,6,6,1.46879,8.74512,23),(7799,6,6,0.513586,8.65396,24),(7800,6,9,1.72396,8.60408,25),(7801,6,6,0.617635,8.58182,26),(7802,6,6,8.92145,8.47336,27),(7803,6,10,2.77206,8.43935,28),(7804,6,6,6.72409,8.39537,29),(7805,6,8,8.96903,8.33249,30),(7806,6,7,0.686374,8.31482,31),(7807,6,9,6.27159,8.28601,32),(7808,6,6,2.74014,8.20275,33),(7809,6,9,1.98367,8.19633,34),(7810,6,6,2.52151,8.17935,35),(7811,6,7,1.91387,8.16942,36),(7812,6,8,0.696813,8.07423,37),(7813,6,6,7.25441,8.00348,38),(7814,6,6,1.41733,7.94612,39),(7815,6,7,7.21881,7.90618,40),(7816,6,10,7.18819,7.78058,41),(7817,6,9,0.954744,7.76924,42),(7818,6,9,8.27825,7.7538,43),(7819,6,8,9.1164,7.75113,44),(7820,6,8,6.28142,7.67886,45),(7821,6,9,9.68573,7.51024,46),(7822,6,6,9.4803,7.50393,47),(7823,6,6,0.550694,7.49732,48),(7824,6,9,9.75,7.46926,49),(7825,6,7,2.63104,7.38731,50),(7826,6,6,1.60713,7.28635,51),(7827,6,7,1.95723,7.23731,52),(7828,6,9,2.94542,7.22185,53),(7829,6,7,0.25,7.17496,54),(7830,6,9,0.675033,7.04621,55),(7831,6,6,5.17794,6.97578,56),(7832,6,10,6.89012,6.87729,57),(7833,6,9,1.6376,6.81471,58),(7834,6,7,5.32467,6.77689,59),(7835,6,10,5.84321,6.69537,60),(7836,6,6,9.46066,6.63853,61),(7837,6,6,9.75,6.5613,62),(7838,6,7,6.74588,6.56037,63),(7839,6,6,2.48089,6.54676,64),(7840,6,6,6.00787,6.52655,65),(7841,6,8,5.71377,6.41331,66),(7842,6,9,5.7709,6.13318,67),(7843,6,6,6.65578,6.08141,68),(7844,6,9,6.28477,5.86015,69),(7845,6,8,9.11614,5.83728,70),(7846,6,6,6.59576,5.82547,71),(7847,6,7,5.4508,5.79061,72),(7848,6,8,9.75,5.65851,73),(7849,6,10,9.28338,5.61107,74),(7850,6,6,6.95738,5.48051,75),(7851,6,7,5.86227,5.4718,76),(7852,6,8,6.42695,5.34591,77),(7853,6,8,5.50002,5.26803,78),(7854,6,9,9.25212,5.25396,79),(7855,6,8,9.75,5.19263,80),(7856,6,9,5.33816,5.16621,81),(7857,6,8,9.24063,4.90119,82),(7858,6,9,6.57239,4.62364,83),(7859,6,9,9.62139,4.44651,84),(7860,6,8,2.7533,4.44642,85),(7861,6,10,5.93416,4.30253,86),(7862,6,8,5.34346,4.24038,87),(7863,6,7,9.08757,4.16613,88),(7864,6,10,0.287373,4.13424,89),(7865,6,8,6.22437,4.09732,90),(7866,6,9,2.84672,4.08332,91),(7867,6,6,2.16214,4.02325,92),(7868,6,8,1.97716,3.97003,93),(7869,6,8,9.28969,3.94545,94),(7870,6,6,1.29456,3.94196,95),(7871,6,9,6.54993,3.9348,96),(7872,6,8,0.689338,3.7906,97),(7873,6,6,0.844571,3.63285,98),(7874,6,9,1.99562,3.60102,99),(7875,6,8,5.25243,3.55805,100),(7876,6,8,6.71399,3.50921,101),(7877,6,8,2.4083,3.4717,102),(7878,6,9,0.338389,3.47078,103),(7879,6,8,9.75,3.37552,104),(7880,6,9,1.64954,3.14524,105),(7881,6,7,1.61713,3.10698,106),(7882,6,6,0.90777,3.02658,107),(7883,6,6,5.36577,2.9841,108),(7884,6,9,2.041,2.93096,109),(7885,6,6,5.98979,2.91067,110),(7886,6,10,6.10958,2.8982,111),(7887,6,7,0.461721,2.88647,112),(7888,6,8,6.9596,2.80468,113),(7889,6,9,5.43517,2.74686,114),(7890,6,8,2.26051,2.73204,115),(7891,6,8,6.43415,2.59636,116),(7892,6,8,9.3833,2.58731,117),(7893,6,10,9.33583,2.55626,118),(7894,6,6,1.96893,2.51531,119),(7895,4,9,0.985402,7.9,0),(7896,4,9,1.58201,7.9,1),(7897,4,9,5.95679,7.9,2),(7898,4,9,6.22661,7.9,3),(7899,4,9,7.30182,7.9,4),(7900,4,10,8.67319,7.9,5),(7901,4,9,9.27793,7.9,6),(7902,4,9,4.11255,7.75095,7),(7903,4,7,0.837029,7.75,8),(7904,4,6,3.29929,7.75,9),(7905,4,7,4.35286,7.75,10),(7906,4,8,5.80149,7.75,11),(7907,4,7,6.35241,7.75,12),(7908,4,8,7.18075,7.75,13),(7909,4,7,8.94903,7.75,14),(7910,4,7,9.15053,7.75,15),(7911,4,8,1.64094,7.66515,16),(7912,4,6,2.97385,7.64964,17),(7913,4,10,2.6234,7.64526,18),(7914,4,9,3.70746,7.55388,19),(7915,4,8,0.987804,7.5,20),(7916,4,6,1.20967,7.5,21),(7917,4,6,2.48175,7.5,22),(7918,4,7,3.85816,7.5,23),(7919,4,8,4.922,7.5,24),(7920,4,8,5.06418,7.5,25),(7921,4,8,6.51641,7.5,26),(7922,4,7,7.27481,7.5,27),(7923,4,7,8.76994,7.5,28),(7924,4,6,9.75,7.5,29),(7925,4,9,1.41096,7.47377,30),(7926,4,6,6.64715,7.45748,31),(7927,4,9,7.18796,7.45553,32),(7928,4,9,6.44839,7.42416,33),(7929,4,7,1.02786,7.41495,34),(7930,4,6,9.06346,7.34953,35),(7931,4,8,8.0615,7.19456,36),(7932,4,8,0.838004,7.10146,37),(7933,4,10,9.3183,7.09116,38),(7934,4,8,6.13229,6.92036,39),(7935,4,6,7.94221,6.75577,40),(7936,4,10,8.8388,6.72295,41),(7937,4,6,9.11656,6.70468,42),(7938,4,8,7.95253,6.70093,43),(7939,4,6,1.42938,6.64538,44),(7940,4,6,0.98858,6.62707,45),(7941,4,10,0.985828,6.53839,46),(7942,4,8,8.26566,6.52926,47),(7943,4,7,9.57424,6.37769,48),(7944,4,10,0.25,6.19508,49),(7945,4,10,9.75,5.91443,50),(7946,4,7,0.613113,5.67592,51),(7947,4,7,0.416884,5.56386,52),(7948,4,7,9.56153,5.54802,53),(7949,4,7,9.75,5.36579,54),(7950,4,7,9.1697,4.85182,55),(7951,4,9,9.75,4.60364,56),(7952,4,7,9.26521,4.41099,57),(7953,4,9,9.25271,4.40515,58),(7954,4,7,9.35231,3.54941,59),(7955,4,7,8.2509,3.30005,60),(7956,4,9,8.62355,3.01792,61),(7957,4,9,9.5959,2.87915,62),(7958,4,7,9.03418,2.72631,63),(7959,4,8,8.83191,2.6904,64),(7960,4,6,9.75,2.56618,65),(7961,4,7,7.91827,2.43763,66),(7962,4,7,8.6664,2.30894,67),(7963,4,7,9.75,2.22639,68),(7964,4,6,9.75,2.14615,69),(7965,4,10,9.75,2.02244,70),(7966,4,8,8.95829,1.9262,71),(7967,4,8,7.32544,1.78387,72),(7968,4,10,8.06576,1.63779,73),(7969,4,10,7.18348,1.53494,74),(7970,4,9,9.75,1.39855,75),(7971,4,9,8.14186,1.33203,76),(7972,4,6,9.64903,1.19975,77),(7973,4,8,6.03371,1.1918,78),(7974,4,7,9.53051,1.17224,79),(7975,4,6,8.1243,1.05842,80),(7976,4,8,7.80659,0.97351,81),(7977,4,9,7.5961,0.960959,82),(7978,4,7,7.61711,0.897639,83),(7979,4,6,8.65077,0.879493,84),(7980,4,10,6.88505,0.618192,85),(7981,4,6,6.97714,0.555015,86);
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
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `level_entities`
--

LOCK TABLES `level_entities` WRITE;
/*!40000 ALTER TABLE `level_entities` DISABLE KEYS */;
INSERT INTO `level_entities` VALUES (8,1,11,3,'Cow',1),(9,1,3,3,'Player Spawn',0),(11,3,6.5,6.5,'Cow',1),(16,3,1.5,1.5,'Player Spawn',0),(19,4,3,5,'Pitch Fork - On Ground',2),(20,4,1.5,1.5,'Player Spawn',0),(21,4,8,5,'Cow',1),(22,4,5.5,0.5,'Hay Bale',5),(23,4,4.6,1.4,'Hay Bale Vertical',4),(24,4,4.5,2.5,'Hay Bale Vertical',4),(25,4,4,3.5,'Hay Bale Vertical',4),(26,4,5,4.5,'Hay Bale Vertical',4),(27,4,5,5.5,'Hay Bale Vertical',4),(28,4,4,6.5,'Hay Bale Horizontal',5),(29,4,5,6.5,'Hay Bale Horizontal',5),(32,4,3.5,0.5,'Hay Bale Horizontal',5),(33,4,6,2,'Hay Bale Horizontal',5),(39,6,1,1,'Player Spawn',0),(40,6,8,9,'Cow',1),(41,6,4.5,2.5,'Hay Bale Vertical',4),(42,6,3.5,2.5,'Hay Bale Horizontal',5),(43,9,2,2,'Player Spawn',0),(44,9,8,8,'Cow',1),(45,6,8,6,'Pitch Fork - On Ground',2);
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
) ENGINE=InnoDB AUTO_INCREMENT=2886 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `level_tiles`
--

LOCK TABLES `level_tiles` WRITE;
/*!40000 ALTER TABLE `level_tiles` DISABLE KEYS */;
INSERT INTO `level_tiles` VALUES (594,1,0,0,1),(595,1,3,0,1),(596,1,9,0,1),(597,1,7,0,1),(598,1,7,1,0),(599,1,7,2,0),(600,1,6,2,0),(601,1,5,2,0),(602,1,5,3,0),(603,1,4,3,0),(604,1,4,2,0),(605,1,3,2,0),(606,1,3,1,0),(607,1,4,1,0),(608,1,4,0,1),(609,1,5,0,1),(610,1,7,3,0),(611,1,8,3,0),(612,1,8,2,0),(613,1,9,2,0),(614,1,9,1,1),(615,1,10,1,0),(616,1,10,0,1),(619,1,11,0,1),(620,1,12,0,1),(621,1,12,1,1),(622,1,12,2,1),(623,1,11,3,0),(624,1,10,2,0),(628,1,11,1,0),(637,1,8,0,1),(639,1,6,0,0),(643,1,2,0,1),(644,1,1,1,1),(645,1,1,2,0),(646,1,0,2,1),(647,1,0,3,0),(648,1,0,4,0),(649,1,1,4,0),(650,1,2,4,0),(651,1,3,4,0),(652,1,3,3,0),(660,1,4,4,0),(663,1,6,3,0),(666,1,9,3,0),(669,1,11,2,0),(680,1,8,1,1),(689,1,5,1,0),(699,1,2,2,0),(701,1,1,3,0),(706,1,0,1,1),(708,1,2,1,0),(712,1,1,0,1),(719,1,6,1,0),(735,1,2,3,0),(804,1,5,4,0),(847,1,6,4,0),(907,1,7,4,0),(908,1,6,5,0),(909,1,5,5,0),(976,1,4,5,1),(1030,1,10,3,0),(1031,1,11,4,0),(1032,1,12,4,1),(1033,1,13,4,1),(1034,1,14,4,0),(1035,1,14,3,0),(1036,1,13,3,1),(1037,1,12,3,1),(1308,1,1,5,1),(1309,1,0,5,0),(1390,1,10,4,0),(1391,1,11,5,0),(1392,1,13,5,1),(1393,1,14,5,0),(1394,1,12,6,0),(1538,1,4,6,0),(1539,1,3,6,0),(1540,1,2,6,0),(1583,3,0,11,1),(1584,3,0,10,1),(1585,3,0,9,1),(1586,3,0,8,1),(1588,3,1,9,1),(1589,3,1,10,0),(1590,3,1,11,1),(1591,3,2,11,1),(1592,3,2,10,0),(1594,3,3,11,1),(1595,3,4,11,1),(1596,3,0,7,1),(1597,3,0,0,1),(1598,3,0,1,1),(1599,3,0,2,1),(1600,3,0,3,1),(1601,3,0,4,1),(1602,3,0,5,1),(1603,3,0,6,1),(1610,3,1,0,0),(1611,3,2,0,0),(1612,3,3,0,1),(1613,3,4,0,1),(1614,3,5,0,1),(1615,3,6,0,1),(1616,3,7,0,1),(1617,3,8,0,1),(1618,3,9,0,1),(1619,3,10,0,1),(1620,3,11,0,1),(1621,3,11,1,1),(1622,3,11,2,1),(1623,3,11,3,1),(1624,3,11,4,1),(1625,3,11,5,1),(1626,3,11,6,1),(1627,3,11,8,1),(1628,3,11,9,1),(1630,3,11,7,1),(1635,3,11,10,1),(1636,3,11,11,1),(1637,3,10,11,1),(1638,3,9,11,1),(1639,3,8,11,1),(1640,3,7,11,1),(1641,3,6,11,1),(1642,3,5,11,1),(1644,3,1,8,1),(1646,3,2,9,1),(1648,3,3,10,0),(1649,3,4,10,0),(1655,3,1,7,1),(1656,3,1,6,1),(1657,3,1,5,1),(1658,3,1,4,1),(1659,3,1,3,1),(1660,3,1,2,0),(1661,3,1,1,0),(1662,3,2,1,0),(1663,3,3,1,0),(1669,3,8,1,1),(1670,3,9,1,1),(1671,3,10,1,0),(1672,3,10,2,0),(1680,3,10,8,0),(1681,3,10,9,0),(1682,3,9,9,1),(1683,3,9,10,0),(1684,3,8,10,0),(1685,3,7,10,0),(1686,3,6,10,0),(1690,3,10,10,0),(1699,3,10,3,0),(1701,3,9,2,1),(1704,3,7,1,0),(1707,3,6,1,0),(1708,3,5,1,0),(1709,3,4,1,0),(1711,3,3,2,0),(1712,3,2,2,0),(1713,3,2,3,1),(1719,3,2,7,1),(1720,3,2,8,1),(1722,3,3,9,1),(1725,3,5,10,0),(1733,3,4,2,0),(1737,3,2,4,0),(1744,3,3,8,1),(1746,3,4,9,1),(1773,1,12,5,1),(1777,1,13,2,1),(1786,1,13,1,1),(1787,1,13,0,1),(1793,1,2,5,1),(1794,1,3,5,1),(1797,3,7,2,0),(1798,3,10,4,0),(1799,3,10,7,0),(1800,3,9,7,1),(1808,3,7,9,1),(1809,3,8,9,1),(1810,4,3,9,1),(1811,4,4,9,1),(1812,4,5,9,1),(1813,4,5,8,1),(1814,4,5,7,1),(1815,4,4,7,1),(1818,4,4,8,1),(1820,4,6,8,1),(1821,4,6,9,1),(1846,3,5,9,1),(1863,3,2,6,1),(1865,3,3,7,1),(1878,3,2,5,0),(1907,3,4,3,1),(1908,3,5,3,0),(1909,3,5,2,0),(1932,3,8,2,1),(1968,3,10,5,0),(2064,3,6,2,0),(2068,3,9,3,1),(2069,3,9,4,1),(2070,3,9,5,1),(2071,3,9,6,1),(2073,3,9,8,1),(2077,3,6,9,1),(2087,3,3,4,0),(2088,3,4,4,0),(2089,3,5,4,0),(2090,3,6,4,0),(2091,3,7,4,0),(2092,3,7,5,0),(2093,3,7,6,0),(2094,3,7,7,0),(2095,3,6,7,0),(2096,3,5,7,0),(2097,3,4,7,0),(2098,3,4,6,0),(2111,3,8,4,1),(2119,3,3,6,0),(2120,3,3,5,0),(2121,3,4,5,0),(2122,3,5,5,0),(2125,3,6,3,0),(2126,3,7,3,0),(2127,3,8,3,1),(2149,3,8,5,1),(2150,3,8,6,1),(2151,3,8,7,1),(2152,3,8,8,1),(2153,3,7,8,1),(2154,3,6,8,1),(2155,3,5,8,1),(2156,3,4,8,1),(2180,3,6,5,0),(2181,3,6,6,0),(2182,3,5,6,0),(2386,6,1,1,0),(2387,6,3,1,0),(2388,6,5,1,0),(2389,6,6,1,0),(2390,6,9,1,0),(2391,6,8,1,0),(2392,6,8,2,0),(2393,6,9,2,1),(2394,6,9,4,1),(2395,6,8,4,0),(2396,6,7,4,0),(2397,6,6,4,1),(2398,6,6,3,1),(2399,6,3,2,0),(2400,6,3,3,0),(2401,6,4,3,0),(2402,6,1,2,1),(2403,6,0,2,1),(2404,6,3,4,0),(2405,6,2,4,0),(2407,6,1,4,0),(2408,6,0,4,0),(2409,6,4,4,0),(2410,6,3,5,0),(2411,6,2,5,0),(2412,6,2,6,1),(2413,6,4,7,0),(2414,6,5,7,0),(2415,6,5,6,1),(2416,6,6,6,1),(2417,6,8,6,0),(2418,6,9,6,1),(2419,6,0,6,1),(2420,6,0,5,0),(2421,6,0,8,1),(2422,6,0,9,1),(2423,6,1,9,1),(2424,6,1,8,1),(2425,6,2,9,1),(2426,6,2,8,1),(2427,6,3,9,1),(2428,6,4,9,1),(2429,6,5,9,0),(2430,6,6,9,0),(2431,6,6,8,0),(2433,6,8,7,1),(2434,6,9,7,1),(2435,6,6,7,1),(2436,6,7,7,1),(2441,6,0,7,1),(2444,6,1,7,1),(2449,6,0,3,1),(2451,6,0,1,0),(2453,6,2,1,0),(2455,6,4,1,0),(2458,6,7,1,0),(2462,6,9,3,1),(2463,6,8,3,0),(2465,6,7,2,0),(2469,6,6,2,1),(2472,6,7,3,0),(2474,6,9,5,1),(2477,6,7,5,0),(2478,6,5,3,1),(2479,6,3,0,0),(2480,6,2,0,0),(2486,6,6,5,1),(2487,6,4,2,0),(2492,6,5,4,1),(2493,6,7,6,0),(2495,6,9,8,0),(2496,6,8,8,0),(2500,6,1,0,0),(2502,6,5,5,1),(2503,6,7,8,0),(2504,6,7,9,0),(2505,6,8,9,0),(2508,6,2,3,1),(2512,6,4,5,0),(2520,6,0,0,0),(2539,6,3,6,0),(2542,6,1,3,1),(2548,6,4,8,0),(2553,6,3,7,0),(2554,6,3,8,1),(2557,6,2,7,1),(2558,6,1,6,1),(2594,6,4,6,0),(2613,6,5,8,0),(2622,6,9,9,0),(2626,6,8,5,0),(2650,6,2,2,1),(2651,6,5,2,1),(2776,3,3,3,1),(2778,4,6,7,1),(2779,4,7,7,1),(2780,4,8,7,1),(2781,4,9,7,1),(2782,4,9,6,1),(2783,4,8,6,1),(2784,4,7,6,1),(2786,4,9,5,1),(2787,4,9,4,1),(2788,4,6,6,1),(2789,4,3,7,1),(2790,4,2,7,1),(2791,4,1,7,1),(2792,4,0,7,1),(2793,4,5,6,0),(2794,4,8,1,1),(2795,4,8,0,1),(2796,4,7,0,1),(2798,4,9,0,1),(2799,4,9,1,1),(2800,4,9,2,1),(2801,4,9,3,1),(2803,4,8,2,1),(2804,4,7,1,1),(2805,4,6,0,1),(2806,4,1,6,1),(2807,4,0,6,1),(2808,4,0,5,1),(2822,9,0,2,1),(2823,9,0,1,1),(2824,9,0,0,1),(2825,9,1,0,1),(2826,9,2,0,1),(2827,9,3,0,1),(2828,9,4,0,1),(2829,9,3,3,1),(2831,9,4,3,1),(2832,9,5,3,1),(2833,9,3,4,1),(2834,9,3,5,1),(2835,9,2,5,1),(2836,9,3,6,1),(2837,9,4,6,1),(2838,9,6,3,1),(2839,9,6,2,1),(2840,9,7,2,1),(2841,9,7,3,1),(2842,9,7,4,1),(2843,9,7,5,1),(2844,9,8,5,1),(2845,9,4,7,1),(2846,9,5,7,1),(2847,9,6,7,1),(2848,9,6,6,1),(2849,9,6,5,1),(2850,9,5,5,1),(2851,9,5,6,1),(2853,9,4,5,1),(2858,9,6,4,1),(2859,9,5,4,1),(2860,9,4,4,1),(2865,9,7,6,1),(2866,9,5,8,1),(2867,9,0,9,1),(2868,9,0,8,1),(2870,9,1,9,1),(2871,9,2,9,1),(2874,9,0,7,1),(2875,9,1,8,1),(2876,9,0,6,1),(2877,9,2,4,1),(2878,9,1,4,1);
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
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `levels`
--

LOCK TABLES `levels` WRITE;
/*!40000 ALTER TABLE `levels` DISABLE KEYS */;
INSERT INTO `levels` VALUES (1,'Hello, World!',-1,-1,-1,-10,0,14,6,'Welcome to the game!\r\n\r\nIn this game, you will control Farmer Dan, highlighted in green on the left, on his journey to rescue his cow, outlined in gold on the right.\r\n\r\nUnlike a normal video game, you will not actually control farmer Dan directly, but will write a piece of code that will allow Farmer Dan to find his cow on his own.\r\n\r\nYou are given several ways to control farmer Dan, but for the first level, all you will need will be the <b>x</b>, and the <b>y</b> variables. They will always be defined to <b>0</b> before your code even runs, so you won\'t need to worry about assigning them or using <b>var</b>.\r\n\r\nSetting the <b>x</b> Variable allows you to control how fast farmer Dan moves left to right-- Setting it to <b>1</b> means He will move at maximum speed to the <b>right</b>, while setting it at <b>-1</b> means he will move at maximum speed to the <b>left</b>. If you set this value more than 1 or less than -1, it will be capped back to between -1 and 1.\r\n\r\nThe <b>y</b> Variable similarly allows you to control Dan\'s vertical movement, <b>1</b> sending him <b>upward</b>, and <b>-1</b> sending him <b>down</b>.\r\n\r\nFor this simple level, see if you can set the right combination of <b>x</b> and <b>y</b> variables to send Farmer Dan to the Cow.\r\n','Since the Cow is directly to Dan\'s <b>right</b>, you will only need to worry about the <b>x</b> variable for this level.','// The x and y variables that control Farmer Dan:\r\nx = 0;\r\ny = 0;',80,0),(3,'Time',1,-1,-1,0,0,9,9,'In the last level, you used the <b>x</b> and <b>y</b> variables to control Framer Dan\'s movement. In this level, you are given another variable to use: <b>time</b>.\r\n\r\nThe <b>time</b> variable gives you access to the amount of time left in the level, in seconds, which will exactly follow the clock at the top. Try just running the code, and watch as <b>time</b> counts down the time left.\r\n\r\nWith <b>time</b>, you can define a path for Farmer Dan to walk to the cow, using <b>if</b> statements that change the <b>x</b> and <b>y</b> variables.','You can use the <b>time</b> variable to easily control how Farmer Dan moves.\r\n\r\n<div class = \'modal-code\'>\r\nx = 1;\r\ny = 0;\r\nif(<b>time</b> >= 15)\r\n{\r\n    <b>y</b> = 0;\r\n}\r\nelse if(<b>time</b> >= 10)\r\n{\r\n    <b>y</b> = 1;\r\n    <b>x</b> = 0;\r\n}</div>','x = 0;\r\ny = 0;\r\n\r\nprint(time);',200,0),(4,'The Pitchfork',9,-1,-1,20,0,10,8,'The pitchfork is the most common tool to any farmer, so it\'s never too soon to learn to use one.\r\n\r\nThe pitchfork can easily be picked up by touching it, and farmer Dan will automatically equip it.\r\n\r\nTo swing, simply set the variable <b>swing</b> to <b>true</b>, and all hay bales that you are touching will disappear.','To beat the level, you will need to first, pick up the pitchfork, then walk up to the hay bales, and swing your pitchfork until the hay bales are cleared and you can reach the cow.','',80,0),(6,'So Close',4,-1,-1,10,10,10,10,'Sometimes navigating through the farm can be tough. Try to help farmer Dan find his cow using the pitcchfork!','Stuck? Remember to use <b>if statements</b> in combination with <b>time</b> to navigate your way through.','x = 0;\r\ny = 0;',200,0),(9,'Navigating',3,-1,-1,10,-10,10,10,'Sometimes the path isn\'t always clear, and you may need to use multiple <b>if</b> statements to navigate. See if you can reach the cow!','Don\'t forget to use <b>if</b> statements in combination with <b>time</b> to move Farmer Dan. If you don\'t know what time Farmer Dan should turn and move through the level, try <b>print</b>ing the <b>time</b> variable, and it will show you.','var x =0;\r\nvar y =0;\r\nprint(time);',200,0);
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
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_levels`
--

LOCK TABLES `user_levels` WRITE;
/*!40000 ALTER TABLE `user_levels` DISABLE KEYS */;
INSERT INTO `user_levels` VALUES (18,4,1,'// The x and y variables that control Farmer Dan:\r\nx = 1;\r\ny = 0;',35,1),(19,4,3,'x = 1;\r\ny = 1;\r\n\r\nif(time < 18)\r\n{\r\n  x = 0;\r\n}\r\nprint(time);',34,1);
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
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (4,'cm9vdA==','YWRtaW4=',2,2,1),(5,'bml4b24=','bml4b24=',0,1,1);
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