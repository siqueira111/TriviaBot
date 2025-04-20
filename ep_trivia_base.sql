-- phpMyAdmin SQL Dump
-- version 5.2.2
-- https://www.phpmyadmin.net/
--
-- Host: maria_db:3306
-- Generation Time: Apr 20, 2025 at 01:44 PM
-- Server version: 11.7.2-MariaDB-ubu2404
-- PHP Version: 8.2.27

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ep`
--

-- --------------------------------------------------------

--
-- Table structure for table `trivia_attributes`
--

CREATE TABLE `trivia_attributes` (
  `Attribute` varchar(255) NOT NULL,
  `Description` varchar(255) NOT NULL,
  `Status` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `trivia_event`
--

CREATE TABLE `trivia_event` (
  `Id` int(11) NOT NULL,
  `Duration` time NOT NULL,
  `StartDate` datetime NOT NULL,
  `EndDate` datetime NOT NULL,
  `Description` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `trivia_event_attribute`
--

CREATE TABLE `trivia_event_attribute` (
  `event` int(11) NOT NULL,
  `attribute` varchar(255) NOT NULL,
  `Value` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `trivia_player`
--

CREATE TABLE `trivia_player` (
  `Id` int(11) NOT NULL,
  `DiscordId` int(11) NOT NULL,
  `Name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `trivia_player_attribute`
--

CREATE TABLE `trivia_player_attribute` (
  `player` int(11) NOT NULL,
  `attribute` varchar(255) NOT NULL,
  `Value` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `trivia_questions`
--

CREATE TABLE `trivia_questions` (
  `Id` int(11) NOT NULL,
  `event` int(11) NOT NULL,
  `Content` varchar(255) NOT NULL,
  `Answer` varchar(255) NOT NULL,
  `Type` enum('CTF','Boolean','MultipleChoice') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `trivia_questions_option`
--

CREATE TABLE `trivia_questions_option` (
  `Id` int(11) NOT NULL,
  `question` int(11) NOT NULL,
  `Content` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `trivia_attributes`
--
ALTER TABLE `trivia_attributes`
  ADD PRIMARY KEY (`Attribute`);

--
-- Indexes for table `trivia_event`
--
ALTER TABLE `trivia_event`
  ADD PRIMARY KEY (`Id`);

--
-- Indexes for table `trivia_event_attribute`
--
ALTER TABLE `trivia_event_attribute`
  ADD KEY `event` (`event`),
  ADD KEY `attribute` (`attribute`);

--
-- Indexes for table `trivia_player`
--
ALTER TABLE `trivia_player`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `DiscordId` (`DiscordId`);

--
-- Indexes for table `trivia_player_attribute`
--
ALTER TABLE `trivia_player_attribute`
  ADD KEY `player` (`player`),
  ADD KEY `attribute` (`attribute`);

--
-- Indexes for table `trivia_questions`
--
ALTER TABLE `trivia_questions`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `event` (`event`);

--
-- Indexes for table `trivia_questions_option`
--
ALTER TABLE `trivia_questions_option`
  ADD KEY `question` (`question`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `trivia_event`
--
ALTER TABLE `trivia_event`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `trivia_player`
--
ALTER TABLE `trivia_player`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `trivia_questions`
--
ALTER TABLE `trivia_questions`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `trivia_event_attribute`
--
ALTER TABLE `trivia_event_attribute`
  ADD CONSTRAINT `trivia_event_attribute_ibfk_1` FOREIGN KEY (`event`) REFERENCES `trivia_event` (`Id`),
  ADD CONSTRAINT `trivia_event_attribute_ibfk_2` FOREIGN KEY (`attribute`) REFERENCES `trivia_attributes` (`Attribute`);

--
-- Constraints for table `trivia_player_attribute`
--
ALTER TABLE `trivia_player_attribute`
  ADD CONSTRAINT `trivia_player_attribute_ibfk_1` FOREIGN KEY (`player`) REFERENCES `trivia_player` (`Id`),
  ADD CONSTRAINT `trivia_player_attribute_ibfk_2` FOREIGN KEY (`attribute`) REFERENCES `trivia_attributes` (`Attribute`);

--
-- Constraints for table `trivia_questions`
--
ALTER TABLE `trivia_questions`
  ADD CONSTRAINT `trivia_questions_ibfk_1` FOREIGN KEY (`event`) REFERENCES `trivia_event` (`Id`);

--
-- Constraints for table `trivia_questions_option`
--
ALTER TABLE `trivia_questions_option`
  ADD CONSTRAINT `trivia_questions_option_ibfk_1` FOREIGN KEY (`question`) REFERENCES `trivia_questions` (`Id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
