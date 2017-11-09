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
	(1, 'Hello, World!', -1, -1, -1, 0, 0, 0, 0, 0, 0),
	(2, 'Movement', 1, -1, -1, 10, 0, 0, 0, 0, 0),
	(3, 'Obstacles', 2, -1, -1, 20, 10, 0, 0, 0, 0),
	(4, 'Attacks', 1, -1, -1, -10, 0, 0, 0, 0, 0),
	(6, 'Mazes', 3, -1, -1, 20, 20, 0, 0, 0, 0),
	(7, 'Enemies', 4, -1, -1, -20, -10, 4, 4, 0, 0);
/*!40000 ALTER TABLE `levels` ENABLE KEYS */;


-- Dumping structure for table moo_moo_code.level_enemies
DROP TABLE IF EXISTS `level_enemies`;
CREATE TABLE IF NOT EXISTS `level_enemies` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `level_id` int(10) unsigned NOT NULL,
  `pos_x` float unsigned NOT NULL,
  `pos_y` float unsigned NOT NULL,
  `name` varchar(45) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `enemy_level_idx` (`level_id`),
  CONSTRAINT `enemy_level` FOREIGN KEY (`level_id`) REFERENCES `levels` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table moo_moo_code.level_enemies: ~0 rows (approximately)
DELETE FROM `level_enemies`;
/*!40000 ALTER TABLE `level_enemies` DISABLE KEYS */;
/*!40000 ALTER TABLE `level_enemies` ENABLE KEYS */;


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
) ENGINE=InnoDB AUTO_INCREMENT=91 DEFAULT CHARSET=utf8;

-- Dumping data for table moo_moo_code.level_tiles: ~16 rows (approximately)
DELETE FROM `level_tiles`;
/*!40000 ALTER TABLE `level_tiles` DISABLE KEYS */;
INSERT INTO `level_tiles` (`id`, `level_id`, `x`, `y`, `tile_type`) VALUES
	(8, 7, 2, 2, 1),
	(14, 7, 1, 2, 0),
	(15, 7, 1, 1, 0),
	(16, 7, 2, 1, 1),
	(18, 7, 0, 3, 1),
	(19, 7, 0, 2, 1),
	(21, 7, 0, 1, 1),
	(22, 7, 1, 0, 0),
	(24, 7, 2, 0, 0),
	(25, 7, 3, 1, 0),
	(26, 7, 3, 2, 0),
	(27, 7, 3, 3, 0),
	(28, 7, 2, 3, 1),
	(29, 7, 1, 3, 1),
	(34, 7, 3, 0, 0),
	(37, 7, 0, 0, 1);
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

-- Dumping data for table moo_moo_code.tiles: ~2 rows (approximately)
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
