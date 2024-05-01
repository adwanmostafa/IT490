-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Apr 29, 2024 at 01:07 PM
-- Server version: 5.7.34
-- PHP Version: 8.2.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `testdb`
--

-- --------------------------------------------------------

--
-- Table structure for table `accounts`
--

CREATE TABLE `accounts` (
  `user_id` int(11) NOT NULL,
  `username` varchar(20) NOT NULL,
  `email` varchar(50) NOT NULL,
  `pwd_hash` varchar(255) NOT NULL,
  `height` decimal(3,2) NOT NULL DEFAULT '0.00',
  `weight` int(11) NOT NULL DEFAULT '0',
  `time_available` int(11) NOT NULL DEFAULT '30',
  `gym_access` tinyint(1) NOT NULL DEFAULT '0',
  `exercise_goals` varchar(20) NOT NULL DEFAULT 'Build Muscle',
  `equipment` varchar(500) NOT NULL DEFAULT '',
  `token` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `accounts`
--

INSERT INTO `accounts` (`user_id`, `username`, `email`, `pwd_hash`, `height`, `weight`, `time_available`, `gym_access`, `exercise_goals`, `equipment`, `token`) VALUES
(34, 'A', 'a@a.a', '$2y$10$PhlLrIw3XgP.InFyFteULuTLc9LyTlXELhZbUkr2HECn5DRqVaIce', 0.00, 0, 30, 0, 'Build Muscle', '', 'mL3Y5h'),
(35, 'Q', 'a@a.q', '$2y$10$z3o/xfvH8cEeNtat3XFmdONwTcQU4PEQVdkItjnseqCcP0okLRbiO', 0.00, 0, 30, 0, 'Build Muscle', '', '6wxD5y');

-- --------------------------------------------------------

--
-- Table structure for table `career`
--

CREATE TABLE `career` (
  `uid` int(11) NOT NULL,
  `status` varchar(30) NOT NULL,
  `job_desc` text NOT NULL,
  `college` text,
  `entre` enum('yes','no') DEFAULT NULL,
  `owns_biz` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `career`
--

INSERT INTO `career` (`uid`, `status`, `job_desc`, `college`, `entre`, `owns_biz`) VALUES
(3, 'working', 'Designer', 'Nike Inc', 'no', ''),
(4, 'student', 'Microbiology', 'Caltech', 'yes', 'zivame.com'),
(5, 'working', 'Historian', 'Discovery Inc', 'yes', 'Truffler.co'),
(6, 'student', 'Psychiatry', 'Chowgule College', 'no', ''),
(8, 'student', 'CSE', 'GEC', 'yes', 'Shopify.in'),
(9, 'student', 'Computer Science', 'IIT-B', 'no', ''),
(10, 'working', 'Hair Stylist', 'L\'oreal Paris', 'no', ' '),
(11, 'working', 'Gamer', 'Ubisoft', 'no', ' '),
(12, 'working', 'actor', 'disney studios', 'yes', ' learnacting.com'),
(13, 'working', 'dancer', 'Pro Dance Academy', 'yes', 'prodancer.com'),
(14, 'student', 'biotech engg', 'IIIT-B', 'no', ' '),
(15, 'working', 'Lead Animator', 'Microsoft India', 'no', ' '),
(16, 'working', 'Ex-CEO', 'Microsoft Inc', 'yes', 'Microsoft Inc'),
(17, 'working', 'Software Developer', 'TCS', 'no', ''),
(18, 'student', 'CSE', 'IIT-B', 'yes', 'I run my family biyaatch'),
(19, 'student', 'you', 'your heart', 'no', ''),
(20, 'working', 'Business', 'Wayne Towers', 'yes', 'Gotham CLub'),
(21, 'working', 'Spiderman', 'MCU', 'yes', 'Pizza Boii'),
(23, 'working', 'Heart Surgeon', 'Apollo Hospital', 'no', ''),
(28, 'Working', 'Engineer', 'SpaceX', 'yes', 'Tesla Inc'),
(29, 'working', 'Engineer', 'Amazon', 'yes', 'AWS');

-- --------------------------------------------------------

--
-- Table structure for table `hobbies`
--

CREATE TABLE `hobbies` (
  `uid` int(11) NOT NULL,
  `streaming_movies_and_shows` enum('1','0') NOT NULL,
  `anime` enum('1','0') NOT NULL,
  `stand_up_comedy` enum('1','0') NOT NULL,
  `reading` enum('1','0') NOT NULL,
  `writing` enum('1','0') NOT NULL,
  `meditation` enum('1','0') NOT NULL,
  `music` enum('1','0') NOT NULL,
  `eating` enum('1','0') NOT NULL,
  `dancing` enum('1','0') NOT NULL,
  `singing` enum('1','0') NOT NULL,
  `baking` enum('1','0') NOT NULL,
  `cooking` enum('1','0') NOT NULL,
  `gardening` enum('1','0') NOT NULL,
  `arts_and_crafts` enum('1','0') NOT NULL,
  `painting` enum('1','0') NOT NULL,
  `sketching` enum('1','0') NOT NULL,
  `fishing` enum('1','0') NOT NULL,
  `running` enum('1','0') NOT NULL,
  `walking` enum('1','0') NOT NULL,
  `swimming` enum('1','0') NOT NULL,
  `working_out` enum('1','0') NOT NULL,
  `yoga` enum('1','0') NOT NULL,
  `bicycling` enum('1','0') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `hobbies`
--

INSERT INTO `hobbies` (`uid`, `streaming_movies_and_shows`, `anime`, `stand_up_comedy`, `reading`, `writing`, `meditation`, `music`, `eating`, `dancing`, `singing`, `baking`, `cooking`, `gardening`, `arts_and_crafts`, `painting`, `sketching`, `fishing`, `running`, `walking`, `swimming`, `working_out`, `yoga`, `bicycling`) VALUES
(3, '1', '0', '1', '1', '0', '0', '1', '1', '1', '0', '1', '1', '1', '1', '0', '0', '0', '1', '1', '1', '1', '0', '1'),
(4, '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '0', '1', '0', '0', '0', '0', '0', '0', '1', '1', '0'),
(5, '1', '0', '1', '1', '0', '1', '0', '1', '1', '0', '1', '1', '0', '0', '1', '0', '0', '1', '1', '1', '0', '1', '0'),
(6, '1', '0', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '0', '1', '1', '0', '1', '1', '1', '1', '1', '1', '1'),
(8, '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1'),
(9, '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1'),
(10, '1', '0', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1'),
(11, '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1'),
(12, '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1'),
(13, '1', '0', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1'),
(14, '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1'),
(15, '1', '0', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1'),
(16, '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1'),
(17, '1', '0', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1'),
(18, '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1'),
(19, '1', '0', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1'),
(20, '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1'),
(21, '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1'),
(23, '1', '0', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1'),
(28, '1', '0', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1');

-- --------------------------------------------------------

--
-- Table structure for table `hobbies_list`
--

CREATE TABLE `hobbies_list` (
  `hid` int(11) NOT NULL,
  `hobby_name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `hobbies_list`
--

INSERT INTO `hobbies_list` (`hid`, `hobby_name`) VALUES
(1, 'Streaming Movies and Shows'),
(2, 'Anime'),
(3, 'Stand-up Comedy'),
(4, 'Reading'),
(5, 'Writing'),
(6, 'Meditation'),
(7, 'Music'),
(8, 'Eating'),
(9, 'Dancing'),
(10, 'Singing'),
(11, 'Baking'),
(12, 'Cooking'),
(13, 'Gardening'),
(14, 'Arts and Crafts'),
(15, 'Painting'),
(16, 'Sketching'),
(17, 'Fishing'),
(18, 'Running'),
(19, 'Walking'),
(20, 'Swimming'),
(21, 'Working Out'),
(22, 'Yoga'),
(23, 'Bicycling');

-- --------------------------------------------------------

--
-- Table structure for table `push_notifications`
--

CREATE TABLE `push_notifications` (
  `email` varchar(50) NOT NULL,
  `phone` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `push_notifications`
--

INSERT INTO `push_notifications` (`email`, `phone`) VALUES
('ja639@njit.edu', '9084771176'),
('joeyant1367@gmail.com', '9084771176'),
('joeyant1367@gmail.com', '9084771176'),
('joeyant1367@gmail.com', '9084771176'),
('joeyant1367@gmail.com', '9084771176'),
('joeyant1367@gmail.com', '9084771176'),
('joeyant1367@gmail.com', '9084771176'),
('joeyant1367@gmail.com', '9084771176'),
('[value-1]', '[value-2]'),
('joeyant1367@gmail.com', '9084771176'),
('joeyant1367@gmail.com', '9084771176'),
('joeyant1367@gmail.com', '9084771176'),
('a@b.c', '0740731707'),
('a@b.c', '0740731707'),
('a@b.c', '0740731707'),
('a@b.n', '0740731707'),
('a@a.q', '0112538022'),
('a@a.q', '0112538022'),
('a@a.q', '0112538022'),
('a@d.b', '0122825252');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `uid` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`uid`, `username`, `email`) VALUES
(1, 'test_user1', 'test_user1@example.com'),
(2, 'test_user2', 'test_user2@example.com'),
(3, 'test_user3', 'test_user3@example.com'),
(4, 'test_user4', 'test_user4@example.com'),
(5, 'test_user5', 'test_user5@example.com'),
(6, 'test_user6', 'test_user6@example.com'),
(7, 'test_user7', 'test_user7@example.com'),
(8, 'test_user8', 'test_user8@example.com'),
(9, 'test_user9', 'test_user9@example.com'),
(10, 'test_user10', 'test_user10@example.com'),
(11, 'test_user11', 'test_user11@example.com'),
(12, 'test_user12', 'test_user12@example.com'),
(13, 'test_user13', 'test_user13@example.com'),
(14, 'test_user14', 'test_user14@example.com'),
(15, 'test_user15', 'test_user15@example.com'),
(16, 'test_user16', 'test_user16@example.com'),
(17, 'test_user17', 'test_user17@example.com'),
(18, 'test_user18', 'test_user18@example.com'),
(19, 'test_user19', 'test_user19@example.com'),
(20, 'test_user20', 'test_user20@example.com'),
(21, 'test_user21', 'test_user21@example.com'),
(22, 'test_user22', 'test_user22@example.com'),
(23, 'test_user23', 'test_user23@example.com'),
(24, 'test_user24', 'test_user24@example.com'),
(25, 'test_user25', 'test_user25@example.com'),
(26, 'test_user26', 'test_user26@example.com'),
(27, 'test_user27', 'test_user27@example.com'),
(28, 'test_user28', 'test_user28@example.com');

-- --------------------------------------------------------

--
-- Table structure for table `users_hobbies`
--

CREATE TABLE `users_hobbies` (
  `uid` int(11) NOT NULL,
  `hid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `users_hobbies`
--

INSERT INTO `users_hobbies` (`uid`, `hid`) VALUES
(3, 1),
(4, 1),
(5, 1),
(6, 1),
(7, 1),
(8, 1),
(9, 1),
(10, 1),
(11, 1),
(12, 1),
(13, 1),
(14, 1),
(15, 1),
(16, 1),
(17, 1),
(18, 1),
(19, 1),
(20, 1),
(21, 1),
(23, 1),
(28, 1),
(4, 2),
(7, 2),
(8, 2),
(9, 2),
(10, 2),
(11, 2),
(14, 2),
(18, 2),
(20, 2),
(21, 2),
(3, 3),
(4, 3),
(5, 3),
(6, 3),
(7, 3),
(8, 3),
(9, 3),
(10, 3),
(11, 3),
(12, 3),
(13, 3),
(14, 3),
(15, 3),
(16, 3),
(17, 3),
(18, 3),
(19, 3),
(20, 3),
(21, 3),
(23, 3),
(28, 3),
(3, 4),
(4, 4),
(5, 4),
(6, 4),
(7, 4),
(8, 4),
(9, 4),
(10, 4),
(11, 4),
(12, 4),
(13, 4),
(14, 4),
(15, 4),
(16, 4),
(17, 4),
(18, 4),
(19, 4),
(20, 4),
(21, 4),
(23, 4),
(28, 4),
(4, 5),
(7, 5),
(8, 5),
(9, 5),
(10, 5),
(11, 5),
(14, 5),
(16, 5),
(18, 5),
(20, 5),
(21, 5),
(4, 6),
(7, 6),
(8, 6),
(9, 6),
(10, 6),
(11, 6),
(14, 6),
(16, 6),
(18, 6),
(20, 6),
(21, 6),
(4, 7),
(5, 7),
(6, 7),
(7, 7),
(8, 7),
(9, 7),
(10, 7),
(11, 7),
(12, 7),
(13, 7),
(14, 7),
(15, 7),
(16, 7),
(17, 7),
(18, 7),
(19, 7),
(20, 7),
(21, 7),
(28, 7),
(3, 8),
(4, 8),
(5, 8),
(6, 8),
(7, 8),
(8, 8),
(9, 8),
(10, 8),
(11, 8),
(12, 8),
(13, 8),
(14, 8),
(15, 8),
(16, 8),
(17, 8),
(18, 8),
(19, 8),
(20, 8),
(21, 8),
(23, 8),
(28, 8),
(3, 9),
(4, 9),
(5, 9),
(6, 9),
(7, 9),
(8, 9),
(9, 9),
(10, 9),
(11, 9),
(12, 9),
(13, 9),
(14, 9),
(15, 9),
(16, 9),
(17, 9),
(18, 9),
(19, 9),
(20, 9),
(21, 9),
(23, 9),
(28, 9),
(4, 10),
(6, 10),
(7, 10),
(8, 10),
(9, 10),
(10, 10),
(11, 10),
(12, 10),
(13, 10),
(14, 10),
(15, 10),
(16, 10),
(18, 10),
(19, 10),
(20, 10),
(21, 10),
(23, 10),
(28, 10),
(3, 11),
(4, 11),
(5, 11),
(6, 11),
(7, 11),
(8, 11),
(9, 11),
(10, 11),
(11, 11),
(12, 11),
(13, 11),
(14, 11),
(15, 11),
(16, 11),
(17, 11),
(18, 11),
(19, 11),
(20, 11),
(21, 11),
(23, 11),
(28, 11),
(3, 12),
(4, 12),
(5, 12),
(6, 12),
(7, 12),
(8, 12),
(9, 12),
(10, 12),
(11, 12),
(12, 12),
(13, 12),
(14, 12),
(15, 12),
(16, 12),
(17, 12),
(18, 12),
(19, 12),
(20, 12),
(21, 12),
(23, 12),
(28, 12),
(3, 13),
(4, 13),
(5, 13),
(6, 13),
(7, 13),
(8, 13),
(9, 13),
(10, 13),
(11, 13),
(12, 13),
(13, 13),
(14, 13),
(15, 13),
(16, 13),
(17, 13),
(18, 13),
(19, 13),
(20, 13),
(21, 13),
(23, 13),
(28, 13),
(4, 14),
(6, 14),
(7, 14),
(8, 14),
(9, 14),
(10, 14),
(11, 14),
(12, 14),
(13, 14),
(14, 14),
(15, 14),
(16, 14),
(17, 14),
(18, 14),
(19, 14),
(20, 14),
(21, 14),
(23, 14),
(28, 14),
(3, 15),
(4, 15),
(6, 15),
(7, 15),
(8, 15),
(9, 15),
(10, 15),
(11, 15),
(12, 15),
(13, 15),
(14, 15),
(15, 15),
(16, 15),
(17, 15),
(18, 15),
(19, 15),
(20, 15),
(21, 15),
(23, 15),
(28, 15),
(7, 16),
(8, 16),
(9, 16),
(10, 16),
(11, 16),
(12, 16),
(13, 16),
(14, 16),
(15, 16),
(16, 16),
(17, 16),
(18, 16),
(19, 16),
(20, 16),
(21, 16),
(28, 16),
(6, 17),
(7, 17),
(8, 17),
(9, 17),
(10, 17),
(11, 17),
(12, 17),
(13, 17),
(14, 17),
(15, 17),
(16, 17),
(17, 17),
(18, 17),
(19, 17),
(20, 17),
(21, 17),
(23, 17),
(28, 17),
(6, 18),
(7, 18),
(8, 18),
(9, 18),
(10, 18),
(11, 18),
(12, 18),
(13, 18),
(14, 18),
(15, 18),
(16, 18),
(17, 18),
(18, 18),
(19, 18),
(20, 18),
(21, 18),
(23, 18),
(28, 18),
(3, 19),
(6, 19),
(7, 19),
(8, 19),
(9, 19),
(10, 19),
(11, 19),
(12, 19),
(13, 19),
(14, 19),
(15, 19),
(16, 19),
(17, 19),
(18, 19),
(19, 19),
(20, 19),
(21, 19),
(23, 19),
(28, 19),
(3, 20),
(5, 20),
(6, 20),
(7, 20),
(8, 20),
(9, 20),
(10, 20),
(11, 20),
(12, 20),
(13, 20),
(14, 20),
(15, 20),
(16, 20),
(17, 20),
(18, 20),
(19, 20),
(20, 20),
(21, 20),
(23, 20),
(28, 20),
(3, 21),
(5, 21),
(6, 21),
(7, 21),
(8, 21),
(9, 21),
(10, 21),
(11, 21),
(12, 21),
(13, 21),
(14, 21),
(15, 21),
(16, 21),
(17, 21),
(18, 21),
(19, 21),
(20, 21),
(21, 21),
(23, 21),
(28, 21),
(3, 22),
(5, 22),
(6, 22),
(7, 22),
(8, 22),
(9, 22),
(10, 22),
(11, 22),
(12, 22),
(13, 22),
(14, 22),
(15, 22),
(16, 22),
(17, 22),
(18, 22),
(19, 22),
(20, 22),
(21, 22),
(23, 22),
(28, 22),
(5, 23),
(6, 23),
(7, 23),
(8, 23),
(9, 23),
(10, 23),
(11, 23),
(12, 23),
(13, 23),
(14, 23),
(15, 23),
(16, 23),
(17, 23),
(18, 23),
(19, 23),
(20, 23),
(21, 23),
(23, 23),
(28, 23);

-- --------------------------------------------------------

--
-- Table structure for table `user_ratings`
--

CREATE TABLE `user_ratings` (
  `user` varchar(20) NOT NULL,
  `exercise` varchar(50) NOT NULL,
  `rating` int(11) NOT NULL DEFAULT '5'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `user_ratings`
--

INSERT INTO `user_ratings` (`user`, `exercise`, `rating`) VALUES
('demo', 'burpee', 1),
('j', 'burpee', 1),
('jimbo', 'air bike', 1),
('jimbo', 'burpee', 1),
('jimbo', 'jump rope', 1);

-- --------------------------------------------------------

--
-- Table structure for table `workout_requests`
--

CREATE TABLE `workout_requests` (
  `id` int(11) NOT NULL,
  `sender_id` int(11) NOT NULL,
  `recipient_id` int(11) NOT NULL,
  `status` enum('pending','accepted','declined') NOT NULL DEFAULT 'pending'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `accounts`
--
ALTER TABLE `accounts`
  ADD PRIMARY KEY (`user_id`);

--
-- Indexes for table `career`
--
ALTER TABLE `career`
  ADD PRIMARY KEY (`uid`);

--
-- Indexes for table `hobbies`
--
ALTER TABLE `hobbies`
  ADD PRIMARY KEY (`uid`);

--
-- Indexes for table `hobbies_list`
--
ALTER TABLE `hobbies_list`
  ADD PRIMARY KEY (`hid`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`uid`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `users_hobbies`
--
ALTER TABLE `users_hobbies`
  ADD PRIMARY KEY (`uid`,`hid`),
  ADD KEY `hid` (`hid`);

--
-- Indexes for table `user_ratings`
--
ALTER TABLE `user_ratings`
  ADD PRIMARY KEY (`user`,`exercise`);

--
-- Indexes for table `workout_requests`
--
ALTER TABLE `workout_requests`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sender_id` (`sender_id`),
  ADD KEY `recipient_id` (`recipient_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `accounts`
--
ALTER TABLE `accounts`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT for table `career`
--
ALTER TABLE `career`
  MODIFY `uid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT for table `hobbies`
--
ALTER TABLE `hobbies`
  MODIFY `uid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `hobbies_list`
--
ALTER TABLE `hobbies_list`
  MODIFY `hid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `uid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `workout_requests`
--
ALTER TABLE `workout_requests`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `users_hobbies`
--
ALTER TABLE `users_hobbies`
  ADD CONSTRAINT `users_hobbies_ibfk_1` FOREIGN KEY (`uid`) REFERENCES `users` (`uid`),
  ADD CONSTRAINT `users_hobbies_ibfk_2` FOREIGN KEY (`hid`) REFERENCES `hobbies_list` (`hid`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
