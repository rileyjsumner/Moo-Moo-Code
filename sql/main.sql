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
CREATE TABLE IF NOT EXISTS `levels` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `unlock_from` int(11) NOT NULL DEFAULT '-1',
  `unlock_from_2` int(11) NOT NULL DEFAULT '-1',
  `unlock_from_3` int(11) NOT NULL DEFAULT '-1',
  `pos_x` int(11) NOT NULL DEFAULT '0',
  `pos_y` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- Dumping data for table moo_moo_code.levels: ~5 rows (approximately)
DELETE FROM `levels`;
/*!40000 ALTER TABLE `levels` DISABLE KEYS */;
INSERT INTO `levels` (`id`, `name`, `unlock_from`, `unlock_from_2`, `unlock_from_3`, `pos_x`, `pos_y`) VALUES
	(1, 'Hello, World!', -1, -1, -1, 0, 0),
	(2, 'Movement', 1, -1, -1, 10, 0),
	(3, 'Obstacles', 2, -1, -1, 10, 10),
	(4, 'Attacks', 1, -1, -1, -10, 0),
	(5, 'Enemies', 4, -1, -1, -10, -10);
/*!40000 ALTER TABLE `levels` ENABLE KEYS */;


-- Dumping structure for table moo_moo_code.users
CREATE TABLE IF NOT EXISTS `users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(45) NOT NULL,
  `password` varchar(45) NOT NULL,
  `progress_learn_category` int(11) NOT NULL DEFAULT '0',
  `progress_learn_lesson` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- Dumping data for table moo_moo_code.users: ~2 rows (approximately)
DELETE FROM `users`;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` (`id`, `username`, `password`, `progress_learn_category`, `progress_learn_lesson`) VALUES
	(1, 'root', 'admin', 2, 2),
	(2, 'nixon', 'TESTRichard', 0, 0);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;


-- Dumping structure for table moo_moo_code.user_levels
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table moo_moo_code.user_levels: ~0 rows (approximately)
DELETE FROM `user_levels`;
/*!40000 ALTER TABLE `user_levels` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_levels` ENABLE KEYS */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
