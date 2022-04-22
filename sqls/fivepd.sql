-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 22, 2022 at 04:32 PM
-- Server version: 10.4.22-MariaDB
-- PHP Version: 8.1.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `fivepd`
--

-- --------------------------------------------------------

--
-- Table structure for table `allowlist`
--

CREATE TABLE `allowlist` (
  `userID` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Table structure for table `arrestreports`
--

CREATE TABLE `arrestreports` (
  `caseID` varchar(75) COLLATE utf8_bin NOT NULL,
  `userID` int(11) NOT NULL,
  `defendantName` varchar(75) COLLATE utf8_bin NOT NULL,
  `city` varchar(75) COLLATE utf8_bin NOT NULL,
  `street` varchar(75) COLLATE utf8_bin NOT NULL,
  `zip` varchar(75) COLLATE utf8_bin NOT NULL,
  `arrestingOfficer` varchar(75) COLLATE utf8_bin NOT NULL,
  `date` varchar(10) COLLATE utf8_bin NOT NULL COMMENT 'Format DD/MM/YYYY',
  `time` varchar(5) COLLATE utf8_bin NOT NULL COMMENT 'Format HH:MM',
  `factsOfArrest` text COLLATE utf8_bin NOT NULL,
  `signature` text COLLATE utf8_bin NOT NULL COMMENT 'Encoded JSON String',
  `charges` text COLLATE utf8_bin NOT NULL COMMENT 'JSON Array String'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Table structure for table `defaultreports`
--

CREATE TABLE `defaultreports` (
  `caseID` varchar(75) COLLATE utf8_bin NOT NULL,
  `callName` text COLLATE utf8_bin DEFAULT NULL,
  `userID` int(11) DEFAULT NULL,
  `officer` varchar(75) COLLATE utf8_bin DEFAULT NULL,
  `location` varchar(75) COLLATE utf8_bin DEFAULT NULL,
  `date` varchar(10) COLLATE utf8_bin DEFAULT NULL COMMENT 'Fromat - DD/MM/YYYY',
  `time` varchar(5) COLLATE utf8_bin DEFAULT NULL COMMENT 'Format - HH:MM',
  `involved` text COLLATE utf8_bin DEFAULT NULL COMMENT 'JSON Array String',
  `suspects` text COLLATE utf8_bin DEFAULT NULL COMMENT 'JSON Array String',
  `victims` text COLLATE utf8_bin DEFAULT NULL COMMENT 'JSON Array String',
  `report` text COLLATE utf8_bin DEFAULT NULL,
  `signature` text COLLATE utf8_bin DEFAULT NULL COMMENT 'Encoded JSON String'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Table structure for table `departments`
--

CREATE TABLE `departments` (
  `id` int(11) NOT NULL,
  `name` varchar(75) COLLATE utf8_bin NOT NULL,
  `shortname` varchar(10) COLLATE utf8_bin NOT NULL,
  `icon` text COLLATE utf8_bin NOT NULL,
  `background` text COLLATE utf8_bin NOT NULL,
  `wallpaper` text COLLATE utf8_bin NOT NULL,
  `requiresApplication` tinyint(1) NOT NULL DEFAULT 0,
  `hiring` tinyint(1) NOT NULL DEFAULT 0,
  `maxMembers` int(11) UNSIGNED NOT NULL DEFAULT 1,
  `callsignFormat` varchar(10) COLLATE utf8_bin NOT NULL DEFAULT '',
  `radius` float NOT NULL DEFAULT 0,
  `posX` float NOT NULL DEFAULT 0,
  `posY` float NOT NULL DEFAULT 0,
  `posZ` float NOT NULL DEFAULT 0
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Table structure for table `department_members`
--

CREATE TABLE `department_members` (
  `userID` int(11) NOT NULL,
  `rankID` int(11) NOT NULL,
  `departmentID` int(11) NOT NULL,
  `accepted` tinyint(1) NOT NULL,
  `callsign` varchar(10) COLLATE utf8_bin NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Table structure for table `messages`
--

CREATE TABLE `messages` (
  `ID` int(11) NOT NULL,
  `receiverID` int(11) NOT NULL,
  `senderID` int(11) NOT NULL,
  `timestamp` int(11) DEFAULT NULL,
  `message` text COLLATE utf8_bin DEFAULT NULL,
  `isRead` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Table structure for table `pedcitations`
--

CREATE TABLE `pedcitations` (
  `citationID` varchar(15) COLLATE utf8_bin NOT NULL,
  `userID` int(11) NOT NULL,
  `name` varchar(150) COLLATE utf8_bin NOT NULL,
  `address` varchar(150) COLLATE utf8_bin DEFAULT NULL,
  `date` varchar(10) COLLATE utf8_bin NOT NULL COMMENT 'dd/mm/yyyy',
  `time` varchar(5) COLLATE utf8_bin NOT NULL COMMENT 'hh:mm',
  `reason` text COLLATE utf8_bin NOT NULL COMMENT 'JSON Array String',
  `location` varchar(75) COLLATE utf8_bin NOT NULL,
  `amount` double NOT NULL,
  `timestamp` int(11) NOT NULL DEFAULT 0 COMMENT 'Record Timestamp'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Table structure for table `ranks`
--

CREATE TABLE `ranks` (
  `id` int(11) NOT NULL,
  `departmentID` int(11) NOT NULL,
  `name` varchar(75) COLLATE utf8_bin NOT NULL COMMENT 'The name of the rank',
  `promoteOnly` tinyint(1) NOT NULL,
  `canPromote` tinyint(1) NOT NULL,
  `canKick` tinyint(1) NOT NULL,
  `canAccept` tinyint(1) NOT NULL,
  `canChangeCallsign` tinyint(1) NOT NULL DEFAULT 0,
  `rankNumber` int(11) NOT NULL DEFAULT 0
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `ID` int(11) NOT NULL,
  `userID` int(11) NOT NULL,
  `radiovolume` double NOT NULL DEFAULT 1,
  `emergencyvolume` double NOT NULL DEFAULT 1,
  `language` varchar(2) COLLATE utf8_bin NOT NULL DEFAULT 'en'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `license` varchar(75) COLLATE utf8_bin DEFAULT NULL,
  `gameName` varchar(75) COLLATE utf8_bin DEFAULT NULL,
  `isAdmin` tinyint(1) DEFAULT 0,
  `activated` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Table structure for table `vehiclecitations`
--

CREATE TABLE `vehiclecitations` (
  `citationID` varchar(15) COLLATE utf8_bin NOT NULL,
  `userID` int(11) NOT NULL,
  `name` varchar(150) COLLATE utf8_bin DEFAULT NULL,
  `address` varchar(150) COLLATE utf8_bin DEFAULT NULL,
  `licenseplate` varchar(15) COLLATE utf8_bin DEFAULT NULL,
  `vehicle` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `date` varchar(10) COLLATE utf8_bin DEFAULT NULL COMMENT 'dd/mm/yyyy',
  `time` varchar(5) COLLATE utf8_bin DEFAULT NULL COMMENT 'hh:mm',
  `reason` text COLLATE utf8_bin DEFAULT NULL COMMENT 'JSON Array String',
  `location` varchar(75) COLLATE utf8_bin DEFAULT NULL,
  `amount` int(11) NOT NULL DEFAULT 0,
  `isPoint` tinyint(1) NOT NULL,
  `timestamp` int(11) NOT NULL DEFAULT 0
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `allowlist`
--
ALTER TABLE `allowlist`
  ADD UNIQUE KEY `userID` (`userID`);

--
-- Indexes for table `arrestreports`
--
ALTER TABLE `arrestreports`
  ADD UNIQUE KEY `caseID` (`caseID`);

--
-- Indexes for table `defaultreports`
--
ALTER TABLE `defaultreports`
  ADD UNIQUE KEY `caseID` (`caseID`);

--
-- Indexes for table `departments`
--
ALTER TABLE `departments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `department_members`
--
ALTER TABLE `department_members`
  ADD UNIQUE KEY `userID` (`userID`);

--
-- Indexes for table `messages`
--
ALTER TABLE `messages`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `pedcitations`
--
ALTER TABLE `pedcitations`
  ADD UNIQUE KEY `citationID` (`citationID`);

--
-- Indexes for table `ranks`
--
ALTER TABLE `ranks`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `userID` (`userID`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `license` (`license`);

--
-- Indexes for table `vehiclecitations`
--
ALTER TABLE `vehiclecitations`
  ADD UNIQUE KEY `citationID` (`citationID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `departments`
--
ALTER TABLE `departments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `messages`
--
ALTER TABLE `messages`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ranks`
--
ALTER TABLE `ranks`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
