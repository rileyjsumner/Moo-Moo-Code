-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               5.7.10-log - MySQL Community Server (GPL)
-- Server OS:                    Win64
-- HeidiSQL Version:             9.3.0.4984
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- Dumping database structure for moo_moo_code
CREATE DATABASE IF NOT EXISTS `moo_moo_code` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `moo_moo_code`;


-- Dumping structure for table moo_moo_code.entities
DROP TABLE IF EXISTS `entities`;
CREATE TABLE IF NOT EXISTS `entities` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `type` int(11) DEFAULT NULL,
  `name` varchar(45) DEFAULT NULL,
  `icon` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- Dumping data for table moo_moo_code.entities: ~1 rows (approximately)
DELETE FROM `entities`;
/*!40000 ALTER TABLE `entities` DISABLE KEYS */;
INSERT INTO `entities` (`id`, `type`, `name`, `icon`) VALUES
	(2, 0, 'Cow', 'cow');
/*!40000 ALTER TABLE `entities` ENABLE KEYS */;


-- Dumping structure for table moo_moo_code.lessons
DROP TABLE IF EXISTS `lessons`;
CREATE TABLE IF NOT EXISTS `lessons` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `lesson_name` varchar(60) DEFAULT NULL,
  `lesson_num` int(11) DEFAULT NULL,
  `category_id` int(11) unsigned DEFAULT NULL,
  `lesson_text` varchar(1500) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `lesson_category_idx` (`category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

-- Dumping data for table moo_moo_code.lessons: ~13 rows (approximately)
DELETE FROM `lessons`;
/*!40000 ALTER TABLE `lessons` DISABLE KEYS */;
INSERT INTO `lessons` (`id`, `lesson_name`, `lesson_num`, `category_id`, `lesson_text`) VALUES
	(1, 'Introduction', 0, 1, 'TEST LESSON1'),
	(2, 'Output', 1, 1, 'KEK'),
	(3, 'Variables', 2, 1, 'Richard Nixon'),
	(4, 'Numbers', 3, 1, 'Putin'),
	(5, 'Introduction', 0, 2, 'lol'),
	(6, 'Arguments', 1, 2, 'Darude sandstorm is good song'),
	(7, 'Returning', 2, 2, 'Richy & mortis'),
	(8, 'Using functions', 3, 2, 'F5 F5 F5'),
	(9, 'Introduction', 0, 3, 'wow gud lesson'),
	(10, 'Defining a class', 1, 3, 'this is a lesson too'),
	(11, 'Functions in a class', 2, 3, 'this is also a lesson'),
	(12, 'Using classes', 3, 3, 'why did i type this'),
	(13, 'Common Classes', 4, 3, 'what a waste of time');
/*!40000 ALTER TABLE `lessons` ENABLE KEYS */;


-- Dumping structure for table moo_moo_code.lesson_categories
DROP TABLE IF EXISTS `lesson_categories`;
CREATE TABLE IF NOT EXISTS `lesson_categories` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `lesson_num` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- Dumping data for table moo_moo_code.lesson_categories: ~3 rows (approximately)
DELETE FROM `lesson_categories`;
/*!40000 ALTER TABLE `lesson_categories` DISABLE KEYS */;
INSERT INTO `lesson_categories` (`id`, `name`, `lesson_num`) VALUES
	(1, 'Introduction', 0),
	(2, 'Functions', 1),
	(3, 'Classes', 2),
	(4, 'Advanced', 3);
/*!40000 ALTER TABLE `lesson_categories` ENABLE KEYS */;


-- Dumping structure for table moo_moo_code.levels
DROP TABLE IF EXISTS `levels`;
CREATE TABLE IF NOT EXISTS `levels` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `unlock_from` int(11) NOT NULL DEFAULT '-1',
  `unlock_from_2` int(11) NOT NULL DEFAULT '-1',
  `unlock_from_3` int(11) NOT NULL DEFAULT '-1',
  `pos_x` int(11) NOT NULL DEFAULT '0',
  `pos_y` int(11) NOT NULL DEFAULT '0',
  `dim_x` int(10) unsigned NOT NULL DEFAULT '0',
  `dim_y` int(10) unsigned NOT NULL DEFAULT '0',
  `start_x` float unsigned NOT NULL DEFAULT '0',
  `start_y` float unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- Dumping data for table moo_moo_code.levels: ~6 rows (approximately)
DELETE FROM `levels`;
/*!40000 ALTER TABLE `levels` DISABLE KEYS */;
INSERT INTO `levels` (`id`, `name`, `unlock_from`, `unlock_from_2`, `unlock_from_3`, `pos_x`, `pos_y`, `dim_x`, `dim_y`, `start_x`, `start_y`) VALUES
	(1, 'Hello, World!', -1, -1, -1, 0, 0, 15, 7, 3, 3),
	(2, 'Movement', 1, -1, -1, 10, 0, 0, 0, 0, 0),
	(3, 'Obstacles', 2, -1, -1, 20, 10, 0, 0, 0, 0),
	(4, 'Attacks', 1, -1, -1, -10, 0, 0, 0, 0, 0),
	(6, 'Mazes', 3, -1, -1, 20, 20, 0, 0, 0, 0),
	(7, 'Enemies', 4, -1, -1, -20, -10, 10, 10, 4, 4);
/*!40000 ALTER TABLE `levels` ENABLE KEYS */;


-- Dumping structure for table moo_moo_code.level_entities
DROP TABLE IF EXISTS `level_entities`;
CREATE TABLE IF NOT EXISTS `level_entities` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `level_id` int(10) unsigned NOT NULL,
  `pos_x` float unsigned NOT NULL,
  `pos_y` float unsigned NOT NULL,
  `name` varchar(45) NOT NULL,
  `entity_type` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `enemy_level_idx` (`level_id`),
  CONSTRAINT `enemy_level` FOREIGN KEY (`level_id`) REFERENCES `levels` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- Dumping data for table moo_moo_code.level_entities: ~4 rows (approximately)
DELETE FROM `level_entities`;
/*!40000 ALTER TABLE `level_entities` DISABLE KEYS */;
INSERT INTO `level_entities` (`id`, `level_id`, `pos_x`, `pos_y`, `name`, `entity_type`) VALUES
	(1, 7, 4, 4, 'Cow', 1),
	(2, 7, 0, 0, '', 0),
	(3, 7, 0, 0, '', 0),
	(4, 1, 0, 0, 'Cow', 0);
/*!40000 ALTER TABLE `level_entities` ENABLE KEYS */;


-- Dumping structure for table moo_moo_code.level_tiles
DROP TABLE IF EXISTS `level_tiles`;
CREATE TABLE IF NOT EXISTS `level_tiles` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `level_id` int(11) unsigned NOT NULL,
  `x` int(11) unsigned NOT NULL,
  `y` int(11) unsigned NOT NULL DEFAULT '0',
  `tile_type` int(11) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_tile` (`level_id`,`x`,`y`),
  KEY `tile_level_idx` (`level_id`),
  CONSTRAINT `tile_level` FOREIGN KEY (`level_id`) REFERENCES `levels` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=1450 DEFAULT CHARSET=utf8;

-- Dumping data for table moo_moo_code.level_tiles: ~169 rows (approximately)
DELETE FROM `level_tiles`;
/*!40000 ALTER TABLE `level_tiles` DISABLE KEYS */;
INSERT INTO `level_tiles` (`id`, `level_id`, `x`, `y`, `tile_type`) VALUES
	(8, 7, 2, 2, 0),
	(14, 7, 1, 2, 0),
	(15, 7, 1, 1, 1),
	(16, 7, 2, 1, 1),
	(18, 7, 0, 3, 0),
	(19, 7, 0, 2, 0),
	(21, 7, 0, 1, 0),
	(22, 7, 1, 0, 1),
	(24, 7, 2, 0, 1),
	(25, 7, 3, 1, 0),
	(26, 7, 3, 2, 0),
	(27, 7, 3, 3, 0),
	(28, 7, 2, 3, 1),
	(29, 7, 1, 3, 1),
	(34, 7, 3, 0, 1),
	(37, 7, 0, 0, 0),
	(190, 7, 1, 5, 0),
	(191, 7, 2, 5, 0),
	(192, 7, 3, 5, 0),
	(193, 7, 0, 5, 0),
	(194, 7, 3, 4, 0),
	(198, 7, 4, 0, 0),
	(199, 7, 5, 0, 0),
	(200, 7, 5, 1, 1),
	(201, 7, 5, 2, 1),
	(202, 7, 5, 3, 1),
	(203, 7, 5, 5, 0),
	(204, 7, 6, 5, 1),
	(205, 7, 7, 5, 1),
	(206, 7, 7, 4, 1),
	(207, 7, 7, 3, 0),
	(208, 7, 7, 2, 0),
	(209, 7, 7, 1, 0),
	(210, 7, 8, 1, 1),
	(211, 7, 9, 3, 0),
	(212, 7, 9, 4, 0),
	(213, 7, 9, 5, 0),
	(214, 7, 9, 6, 0),
	(215, 7, 1, 7, 1),
	(216, 7, 2, 7, 1),
	(217, 7, 3, 7, 1),
	(218, 7, 4, 7, 0),
	(219, 7, 5, 7, 0),
	(220, 7, 6, 7, 1),
	(221, 7, 7, 7, 1),
	(222, 7, 8, 7, 0),
	(224, 7, 7, 9, 0),
	(225, 7, 6, 9, 0),
	(226, 7, 5, 9, 1),
	(227, 7, 4, 9, 1),
	(228, 7, 3, 9, 1),
	(229, 7, 2, 9, 1),
	(230, 7, 1, 9, 1),
	(231, 7, 0, 9, 1),
	(235, 7, 2, 8, 1),
	(236, 7, 8, 2, 1),
	(237, 7, 6, 0, 0),
	(247, 7, 1, 4, 0),
	(250, 7, 4, 5, 0),
	(253, 7, 6, 4, 1),
	(255, 7, 4, 3, 0),
	(257, 7, 2, 4, 1),
	(259, 7, 2, 6, 1),
	(261, 7, 4, 8, 1),
	(262, 7, 5, 8, 0),
	(263, 7, 6, 8, 0),
	(265, 7, 6, 6, 1),
	(267, 7, 4, 4, 0),
	(272, 7, 5, 4, 1),
	(275, 7, 8, 4, 1),
	(278, 7, 8, 5, 1),
	(280, 7, 5, 6, 1),
	(281, 7, 4, 6, 0),
	(282, 7, 3, 6, 0),
	(296, 7, 1, 6, 0),
	(303, 7, 6, 2, 0),
	(305, 7, 8, 0, 0),
	(306, 7, 9, 1, 0),
	(307, 7, 7, 8, 1),
	(318, 7, 7, 6, 1),
	(319, 7, 8, 6, 1),
	(324, 7, 3, 8, 1),
	(369, 7, 1, 8, 1),
	(377, 7, 0, 8, 0),
	(394, 7, 0, 6, 0),
	(395, 7, 0, 7, 0),
	(417, 7, 9, 7, 0),
	(444, 7, 0, 4, 0),
	(459, 7, 6, 1, 1),
	(466, 7, 4, 2, 1),
	(475, 7, 9, 0, 0),
	(477, 7, 9, 2, 0),
	(479, 7, 8, 3, 1),
	(492, 7, 8, 8, 0),
	(548, 7, 4, 1, 0),
	(566, 7, 6, 3, 0),
	(594, 1, 0, 0, 0),
	(595, 1, 3, 0, 0),
	(596, 1, 9, 0, 0),
	(597, 1, 7, 0, 0),
	(598, 1, 7, 1, 0),
	(599, 1, 7, 2, 0),
	(600, 1, 6, 2, 0),
	(601, 1, 5, 2, 0),
	(602, 1, 5, 3, 0),
	(603, 1, 4, 3, 0),
	(604, 1, 4, 2, 0),
	(605, 1, 3, 2, 0),
	(606, 1, 3, 1, 0),
	(607, 1, 4, 1, 0),
	(608, 1, 4, 0, 0),
	(609, 1, 5, 0, 0),
	(610, 1, 7, 3, 0),
	(611, 1, 8, 3, 0),
	(612, 1, 8, 2, 0),
	(613, 1, 9, 2, 0),
	(614, 1, 9, 1, 0),
	(615, 1, 10, 1, 0),
	(616, 1, 10, 0, 0),
	(619, 1, 11, 0, 0),
	(620, 1, 12, 0, 0),
	(621, 1, 12, 1, 0),
	(622, 1, 12, 2, 0),
	(623, 1, 11, 3, 0),
	(624, 1, 10, 2, 0),
	(628, 1, 11, 1, 0),
	(637, 1, 8, 0, 0),
	(639, 1, 6, 0, 0),
	(643, 1, 2, 0, 0),
	(644, 1, 1, 1, 0),
	(645, 1, 1, 2, 0),
	(646, 1, 0, 2, 0),
	(647, 1, 0, 3, 0),
	(648, 1, 0, 4, 0),
	(649, 1, 1, 4, 0),
	(650, 1, 2, 4, 0),
	(651, 1, 3, 4, 0),
	(652, 1, 3, 3, 0),
	(660, 1, 4, 4, 0),
	(663, 1, 6, 3, 0),
	(666, 1, 9, 3, 0),
	(669, 1, 11, 2, 0),
	(680, 1, 8, 1, 0),
	(689, 1, 5, 1, 0),
	(699, 1, 2, 2, 0),
	(701, 1, 1, 3, 0),
	(706, 1, 0, 1, 0),
	(708, 1, 2, 1, 0),
	(712, 1, 1, 0, 0),
	(719, 1, 6, 1, 0),
	(735, 1, 2, 3, 0),
	(804, 1, 5, 4, 0),
	(847, 1, 6, 4, 0),
	(907, 1, 7, 4, 0),
	(908, 1, 6, 5, 0),
	(909, 1, 5, 5, 0),
	(976, 1, 4, 5, 0),
	(1030, 1, 10, 3, 0),
	(1031, 1, 11, 4, 0),
	(1032, 1, 12, 4, 0),
	(1033, 1, 13, 4, 0),
	(1034, 1, 14, 4, 0),
	(1035, 1, 14, 3, 0),
	(1036, 1, 13, 3, 0),
	(1037, 1, 12, 3, 0),
	(1308, 1, 1, 5, 0),
	(1309, 1, 0, 5, 0),
	(1390, 1, 10, 4, 0),
	(1391, 1, 11, 5, 0),
	(1392, 1, 13, 5, 0),
	(1393, 1, 14, 5, 0),
	(1394, 1, 12, 6, 0),
	(1446, 7, 9, 8, 0);
/*!40000 ALTER TABLE `level_tiles` ENABLE KEYS */;


-- Dumping structure for table moo_moo_code.tiles
DROP TABLE IF EXISTS `tiles`;
CREATE TABLE IF NOT EXISTS `tiles` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `icon` varchar(50) NOT NULL,
  `type` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- Dumping data for table moo_moo_code.tiles: ~1 rows (approximately)
DELETE FROM `tiles`;
/*!40000 ALTER TABLE `tiles` DISABLE KEYS */;
INSERT INTO `tiles` (`id`, `name`, `icon`, `type`) VALUES
	(1, 'Wall', 'stone_test', 1),
	(2, 'Ground', 'grass_test', 0);
/*!40000 ALTER TABLE `tiles` ENABLE KEYS */;


-- Dumping structure for table moo_moo_code.users
DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(45) NOT NULL,
  `password` varchar(45) NOT NULL,
  `progress_learn_category` int(11) NOT NULL DEFAULT '0',
  `progress_learn_lesson` int(11) NOT NULL DEFAULT '0',
  `admin` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- Dumping data for table moo_moo_code.users: ~3 rows (approximately)
DELETE FROM `users`;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` (`id`, `username`, `password`, `progress_learn_category`, `progress_learn_lesson`, `admin`) VALUES
	(1, 'root', 'admin', 2, 2, 1),
	(2, 'nixon', 'TESTRichard', 0, 0, 1),
	(3, 'admin', 'admin', 0, 0, 0);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;


-- Dumping structure for table moo_moo_code.user_levels
DROP TABLE IF EXISTS `user_levels`;
CREATE TABLE IF NOT EXISTS `user_levels` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `level_id` int(10) unsigned NOT NULL,
  `bindings` varchar(2000) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_level_idx` (`user_id`),
  KEY `user_level_level_idx` (`level_id`),
  CONSTRAINT `user_level` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `user_level_level` FOREIGN KEY (`level_id`) REFERENCES `levels` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- Dumping data for table moo_moo_code.user_levels: ~2 rows (approximately)
DELETE FROM `user_levels`;
/*!40000 ALTER TABLE `user_levels` DISABLE KEYS */;
INSERT INTO `user_levels` (`id`, `user_id`, `level_id`, `bindings`) VALUES
	(2, 1, 1, NULL),
	(7, 1, 2, NULL);
/*!40000 ALTER TABLE `user_levels` ENABLE KEYS */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
