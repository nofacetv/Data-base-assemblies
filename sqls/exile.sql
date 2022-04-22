-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 22, 2022 at 04:31 PM
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
-- Database: `exile`
--

-- --------------------------------------------------------

--
-- Table structure for table `account`
--

CREATE TABLE `account` (
  `uid` varchar(32) NOT NULL,
  `clan_id` int(11) UNSIGNED DEFAULT NULL,
  `name` varchar(64) NOT NULL,
  `score` int(11) NOT NULL DEFAULT 0,
  `kills` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `deaths` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `locker` int(11) NOT NULL DEFAULT 0,
  `first_connect_at` datetime NOT NULL DEFAULT current_timestamp(),
  `last_connect_at` datetime NOT NULL DEFAULT current_timestamp(),
  `last_disconnect_at` datetime DEFAULT NULL,
  `total_connections` int(11) UNSIGNED NOT NULL DEFAULT 1,
  `zedkills` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `account`
--

INSERT INTO `account` (`uid`, `clan_id`, `name`, `score`, `kills`, `deaths`, `locker`, `first_connect_at`, `last_connect_at`, `last_disconnect_at`, `total_connections`, `zedkills`) VALUES
('76561198057491789', NULL, 'A_Rabb1t', 68088, 139, 12, 3000, '2022-04-20 08:43:14', '2022-04-21 09:12:56', '2022-04-21 12:33:53', 6, 139),
('76561198115196834', NULL, 'PONNY', 47520, 1, 0, 0, '2022-04-22 05:21:38', '2022-04-22 05:21:38', '2022-04-22 05:52:10', 1, 1),
('76561198157934652', NULL, 'steamuser', 91607, 117, 10, 1000000, '2022-04-20 06:38:42', '2022-04-21 11:25:21', '2022-04-21 11:57:18', 18, 117),
('76561198169174237', NULL, 'Brock', 176, 6, 1, 0, '2022-04-20 10:00:52', '2022-04-20 10:29:58', '2022-04-20 10:31:26', 8, 6),
('76561198961932168', NULL, 'Cmdr Redneck', 2616, 24, 2, 250000, '2022-04-20 09:16:00', '2022-04-20 10:15:54', '2022-04-20 11:25:26', 2, 24),
('76561199134604036', NULL, 'Jay', 0, 0, 0, 0, '2022-04-21 13:40:51', '2022-04-21 13:40:51', '2022-04-21 14:08:48', 1, 0),
('DMS_PersistentVehicle', NULL, 'DMS_PersistentVehicle', 0, 0, 0, 0, '2022-04-20 11:31:19', '2022-04-20 11:31:19', NULL, 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `clan`
--

CREATE TABLE `clan` (
  `id` int(11) UNSIGNED NOT NULL,
  `name` varchar(64) NOT NULL,
  `leader_uid` varchar(32) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `clan_map_marker`
--

CREATE TABLE `clan_map_marker` (
  `id` int(11) UNSIGNED NOT NULL,
  `clan_id` int(11) UNSIGNED NOT NULL,
  `markerType` tinyint(4) NOT NULL DEFAULT -1,
  `positionArr` text NOT NULL,
  `color` varchar(255) NOT NULL,
  `icon` varchar(255) NOT NULL,
  `iconSize` float UNSIGNED NOT NULL,
  `label` varchar(255) NOT NULL,
  `labelSize` float UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `construction`
--

CREATE TABLE `construction` (
  `id` int(11) UNSIGNED NOT NULL,
  `class` varchar(64) NOT NULL,
  `account_uid` varchar(32) NOT NULL,
  `spawned_at` datetime NOT NULL DEFAULT current_timestamp(),
  `position_x` double NOT NULL DEFAULT 0,
  `position_y` double NOT NULL DEFAULT 0,
  `position_z` double NOT NULL DEFAULT 0,
  `direction_x` double NOT NULL DEFAULT 0,
  `direction_y` double NOT NULL DEFAULT 0,
  `direction_z` double NOT NULL DEFAULT 0,
  `up_x` double NOT NULL DEFAULT 0,
  `up_y` double NOT NULL DEFAULT 0,
  `up_z` double NOT NULL DEFAULT 0,
  `is_locked` tinyint(1) NOT NULL DEFAULT 0,
  `pin_code` varchar(6) NOT NULL DEFAULT '000000',
  `damage` tinyint(1) UNSIGNED DEFAULT 0,
  `territory_id` int(11) UNSIGNED DEFAULT NULL,
  `last_updated_at` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `construction`
--

INSERT INTO `construction` (`id`, `class`, `account_uid`, `spawned_at`, `position_x`, `position_y`, `position_z`, `direction_x`, `direction_y`, `direction_z`, `up_x`, `up_y`, `up_z`, `is_locked`, `pin_code`, `damage`, `territory_id`, `last_updated_at`, `deleted_at`) VALUES
(1, 'Land_WaterCooler_01_new_F', '76561198157934652', '2022-04-21 06:27:28', 12668.0478516, 14776.131836, 0.182463, -0.79655, -0.604573, 0, 0, 0, 1, 0, '000000', 0, 4, '2022-04-21 06:27:28', NULL),
(2, 'Land_LampHalogen_F', '76561198157934652', '2022-04-21 06:28:04', 12666.703125, 14773.454102, 0.0175953, 0.810657, 0.585522, 0, 0, 0, 1, 0, '000000', 0, 4, '2022-04-21 06:28:04', NULL),
(3, 'Land_Mil_WallBig_4m_F', '76561198157934652', '2022-04-21 09:01:00', 12666.385742, 14801.473633, -0.672653, -0.0346099, 0.999401, 0, 0, 0, 1, 0, '000000', 0, 4, '2022-04-21 09:01:00', NULL),
(4, 'Land_Mil_WallBig_4m_F', '76561198157934652', '2022-04-21 09:01:57', 12670.553711, 14800.561523, -0.461615, 0.38529, 0.922795, 0, 0, 0, 1, 0, '000000', 0, 4, '2022-04-21 09:01:57', NULL),
(5, 'Land_HelipadCivil_F', '76561198057491789', '2022-04-21 09:30:54', 12176.616211, 17002.164063, -0.0900879, 0.999811, -0.0194361, 0, 0, 0, 1, 0, '000000', 0, 3, '2022-04-21 09:30:54', NULL),
(23, 'EBM_Brickwall_floor', '76561198057491789', '2022-04-21 10:52:46', 12163.863281, 17009.998047, 0.00114059, -0.985474, 0.169828, 0, 0, 0, 1, 0, '000000', 0, 3, '2022-04-21 10:52:46', NULL),
(24, 'EBM_Brickwall', '76561198057491789', '2022-04-21 10:53:22', 12163.375, 17007.164063, 0.282009, -0.169828, -0.985474, 0, 0, 0, 1, 0, '000000', 0, 3, '2022-04-21 10:53:22', NULL),
(25, 'EBM_Brickwall_hole', '76561198057491789', '2022-04-21 10:53:32', 12157.461914, 17008.183594, 0.291191, 0.169828, 0.985474, 0, 0, 0, 1, 0, '000000', 0, 3, '2022-04-21 10:53:32', NULL),
(26, 'EBM_Brickwall', '76561198057491789', '2022-04-21 10:53:43', 12155.117188, 17011.505859, 0.255909, -0.985474, 0.169828, 0, 0, 0, 1, 0, '000000', 0, 3, '2022-04-21 10:53:43', NULL),
(28, 'EBM_Brickwall', '76561198057491789', '2022-04-21 10:54:26', 12164.351563, 17012.832031, 0.235363, -0.169828, -0.985474, 0, 0, 0, 1, 0, '000000', 0, 3, '2022-04-21 10:54:26', NULL),
(29, 'EBM_Brickwall', '76561198057491789', '2022-04-21 10:54:34', 12166.696289, 17009.509766, 0.249641, -0.985474, 0.169828, 0, 0, 0, 1, 0, '000000', 0, 3, '2022-04-21 10:54:34', NULL),
(32, 'EBM_Brickwall_floor', '76561198057491789', '2022-04-21 10:56:05', 12157.950195, 17011.0175781, 0.00357819, -0.985474, 0.169828, 0, 0, 0, 1, 0, '000000', 0, 3, '2022-04-21 10:56:05', NULL),
(34, 'EBM_Brickwall', '76561198057491789', '2022-04-21 10:56:53', 12158.432617, 17013.839844, 0.275463, -0.166985, -0.985959, 0, 0, 0, 1, 0, '000000', 0, 3, '2022-04-21 10:56:53', NULL),
(44, 'Land_i_House_Small_03_V1_F', '76561198057491789', '2022-04-21 11:03:00', 12195.111328, 17019.585938, -0.162373, 0.445614, 0.895225, 0, 0, 0, 1, 0, '000000', 0, 3, '2022-04-21 11:03:00', NULL),
(47, 'Land_CncBarrierMedium_F', '76561198057491789', '2022-04-21 11:06:41', 12157.140625, 17005.617188, -0.150745, 0.16491, 0.986309, 0, 0, 0, 1, 0, '000000', 0, 3, '2022-04-21 11:06:41', NULL),
(48, 'Land_CncBarrierMedium_F', '76561198057491789', '2022-04-21 11:07:22', 12153.955078, 17022.736328, -0.0167961, 0.0809253, 0.99672, 0, 0, 0, 1, 0, '000000', 0, 3, '2022-04-21 11:07:22', NULL),
(49, 'PortableHelipadLight_01_red_F', '76561198057491789', '2022-04-21 11:27:15', 12218.375, 17002.958984, 0.00363541, 0.989722, 0.111875, -0.0890786, 0.0813277, 0.0720404, 0.994081, 0, '000000', 0, 3, '2022-04-21 11:27:15', NULL),
(50, 'PortableHelipadLight_01_red_F', '76561198057491789', '2022-04-21 11:30:27', 12206.724609, 16985.929688, 0.223026, -0.0501049, -0.998744, 0, 0, 0, 1, 0, '000000', 0, 3, '2022-04-21 11:30:27', NULL),
(52, 'Land_GH_Stairs_F', '76561198057491789', '2022-04-21 11:33:55', 12162.298828, 17014.0449219, -0.743999, 0.982788, -0.184735, 0, 0, 0, 1, 0, '000000', 0, 3, '2022-04-21 11:33:55', NULL),
(53, 'EBM_Brickwall_floor', '76561198057491789', '2022-04-21 11:34:49', 12157.950195, 17011.0175781, 3.253578, -0.985474, 0.169828, 0, 0, 0, 1, 0, '000000', 0, 3, '2022-04-21 11:34:49', NULL),
(54, 'EBM_Brickwall_floor', '76561198057491789', '2022-04-21 11:36:20', 12163.917969, 17009.970703, 3.249363, -0.986017, 0.166644, -0.0000000010371, -0.0000000092994, 0.0000000028859, 1, 0, '000000', 0, 3, '2022-04-21 11:36:20', NULL),
(55, 'Land_BagFence_Long_F', '76561198057491789', '2022-04-21 11:38:13', 12165.228516, 17008.332031, 3.515903, 0.597902, -0.801569, 0, 0, 0, 1, 0, '000000', 0, 3, '2022-04-21 11:38:13', NULL),
(56, 'Land_SolarPanel_2_F', '76561198057491789', '2022-04-21 11:41:33', 12196.109375, 17022.529297, 3.538292, -0.891324, 0.453368, 0, 0, 0, 1, 0, '000000', 0, 3, '2022-04-21 11:41:33', NULL),
(57, 'EBM_Brickwall', '76561198057491789', '2022-04-21 11:43:37', 12194.227539, 16951.376953, -0.0742455, 0.390207, -0.920727, 0, 0, 0, 1, 0, '000000', 0, 3, '2022-04-21 11:43:37', NULL),
(58, 'EBM_Brickwall', '76561198057491789', '2022-04-21 11:43:51', 12188.417969, 16949.947266, -0.0382919, 0.131204, -0.991355, 0, 0, 0, 1, 0, '000000', 0, 3, '2022-04-21 11:43:51', NULL),
(59, 'EBM_Brickwall', '76561198057491789', '2022-04-21 11:44:12', 12182.375977, 16949.822266, -0.0988846, -0.0684535, -0.997654, 0, 0, 0, 1, 0, '000000', 0, 3, '2022-04-21 11:44:12', NULL),
(60, 'EBM_Brickwall', '76561198057491789', '2022-04-21 11:44:26', 12176.370117, 16950.0996094, -0.367325, -0.0512731, -0.998685, 0, 0, 0, 1, 0, '000000', 0, 3, '2022-04-21 11:44:26', NULL),
(61, 'EBM_Brickwall', '76561198057491789', '2022-04-21 11:46:56', 12199.931641, 16953.742188, 0.0852203, -0.469891, 0.882724, 0, 0, 0, 1, 0, '000000', 0, 3, '2022-04-21 11:46:56', NULL),
(63, 'EBM_Brickwall', '76561198057491789', '2022-04-21 11:48:01', 12215.140625, 16958.353516, -0.217304, 0.414277, -0.910151, 0, 0, 0, 1, 0, '000000', 0, 3, '2022-04-21 11:48:01', NULL),
(64, 'EBM_Brickwall', '76561198057491789', '2022-04-21 11:48:14', 12209.430664, 16956.394531, -0.194611, 0.233597, -0.972334, 0, 0, 0, 1, 0, '000000', 0, 3, '2022-04-21 11:48:14', NULL),
(65, 'EBM_Brickwall_stairs', '76561198057491789', '2022-04-21 11:48:35', 12219.855469, 16966.328125, -0.164406, 0.988702, 0.149895, 0, 0, 0, 1, 0, '000000', 0, 3, '2022-04-21 11:48:35', NULL),
(66, 'EBM_Brickwall', '76561198057491789', '2022-04-21 11:49:34', 12220.15332, 16961.207031, -0.079174, 0.605887, -0.795551, 0, 0, 0, 1, 0, '000000', 0, 3, '2022-04-21 11:49:34', NULL),
(67, 'EBM_Brickwall', '76561198057491789', '2022-04-21 11:50:37', 12204.498047, 16955.447266, -0.0397263, 0.171965, -0.985103, 0, 0, 0, 1, 0, '000000', 0, 3, '2022-04-21 11:50:37', NULL),
(68, 'EBM_Brickwall', '76561198057491789', '2022-04-21 11:53:32', 12228.259766, 16973.910156, 0.0240173, 0.945257, -0.326327, 0, 0, 0, 1, 0, '000000', 0, 3, '2022-04-21 11:53:32', NULL),
(69, 'EBM_Brickwall_hole', '76561198057491789', '2022-04-21 11:54:08', 12230.283203, 16979.421875, 0.141651, 0.919821, -0.392339, 0, 0, 0, 1, 0, '000000', 0, 3, '2022-04-21 11:54:08', NULL),
(70, 'Land_Sign_WarningMilitaryArea_F', '76561198057491789', '2022-04-21 11:54:25', 12233.277344, 16974.275391, -0.823334, -0.982795, 0.184702, 0, 0, 0, 1, 0, '000000', 0, 3, '2022-04-21 11:54:25', NULL),
(71, 'EBM_Brickwall', '76561198057491789', '2022-04-21 11:54:51', 12232.208008, 16985.101563, 0.0730247, 0.972415, -0.233259, 0, 0, 0, 1, 0, '000000', 0, 3, '2022-04-21 11:54:51', NULL),
(72, 'EBM_Brickwall_window', '76561198057491789', '2022-04-21 11:56:30', 12233.698242, 16990.892578, -0.130447, 0.974809, -0.223042, 0, 0, 0, 1, 0, '000000', 0, 3, '2022-04-21 11:56:30', NULL),
(74, 'EBM_Brickwall', '76561198057491789', '2022-04-21 11:59:08', 12205.123047, 17019.912109, -0.110222, -0.466776, -0.884375, 0, 0, 0, 1, 0, '000000', 0, 3, '2022-04-21 11:59:08', NULL),
(75, 'EBM_Brickwall', '76561198057491789', '2022-04-21 12:00:14', 12210.274414, 17017.0625, 0.0981789, -0.470649, -0.882321, 0, 0, 0, 1, 0, '000000', 0, 3, '2022-04-21 12:00:14', NULL),
(76, 'EBM_Brickwall_window', '76561198057491789', '2022-04-21 12:01:00', 12215.598633, 17014.119141, 0.0051384, -0.444451, -0.895803, 0, 0, 0, 1, 0, '000000', 0, 3, '2022-04-21 12:01:00', NULL),
(77, 'EBM_Brickwall', '76561198057491789', '2022-04-21 12:01:41', 12220.771484, 17011.806641, -0.288322, -0.367102, -0.930181, 0, 0, 0, 1, 0, '000000', 0, 3, '2022-04-21 12:01:41', NULL),
(78, 'EBM_Brickwall', '76561198057491789', '2022-04-21 12:01:59', 12233.0712891, 16996.398438, -0.218613, 0.902359, 0.430985, 0, 0, 0, 1, 0, '000000', 0, 3, '2022-04-21 12:01:59', NULL),
(79, 'EBM_Brickwall', '76561198057491789', '2022-04-21 12:02:11', 12229.957031, 17001.466797, -0.28141, 0.769667, 0.638445, 0, 0, 0, 1, 0, '000000', 0, 3, '2022-04-21 12:02:11', NULL),
(80, 'Land_Sign_WarningMilitaryArea_F', '76561198057491789', '2022-04-21 12:03:50', 12204.0761719, 17023.134766, -0.404102, -0.430167, -0.902749, 0, 0, 0, 1, 0, '000000', 0, 3, '2022-04-21 12:03:50', NULL),
(81, 'Land_HBarrier_1_F', '76561198057491789', '2022-04-21 12:18:26', 12190.0830078, 17025.46875, -0.0196533, -0.41944, 0.907783, 0, 0, 0, 1, 0, '000000', 0, 3, '2022-04-21 12:18:26', NULL),
(82, 'EBM_Brickwall', '76561198057491789', '2022-04-21 12:20:16', 12225.356445, 17008.517578, -0.208534, -0.74226, -0.670112, 0, 0, 0, 1, 0, '000000', 0, 3, '2022-04-21 12:20:16', NULL),
(83, 'EBM_Brickwall', '76561198057491789', '2022-04-21 12:20:41', 12228.69043, 17003.726563, -0.526867, -0.872993, -0.487732, 0, 0, 0, 1, 0, '000000', 0, 3, '2022-04-21 12:20:41', NULL),
(84, 'Land_BagFence_Long_F', '76561198057491789', '2022-04-21 12:21:39', 12162.458984, 17007.738281, 3.526554, -0.176849, -0.984238, 0, 0, 0, 1, 0, '000000', 0, 3, '2022-04-21 12:21:39', NULL),
(85, 'Land_BagFence_Long_F', '76561198057491789', '2022-04-21 12:21:52', 12166.0244141, 17010.890625, 3.491554, 0.972131, 0.234437, 0, 0, 0, 1, 0, '000000', 0, 3, '2022-04-21 12:21:52', NULL),
(86, 'Land_BagFence_Long_F', '76561198057491789', '2022-04-21 12:22:17', 12156.34082, 17009.888672, 3.516037, -0.842323, -0.538973, 0, 0, 0, 1, 0, '000000', 0, 3, '2022-04-21 12:22:17', NULL),
(87, 'Land_BagFence_Long_F', '76561198057491789', '2022-04-21 12:22:28', 12156.461914, 17012.564453, 3.498745, -0.766981, 0.64167, 0, 0, 0, 1, 0, '000000', 0, 3, '2022-04-21 12:22:28', NULL),
(88, 'EBM_Brickwall', '76561198057491789', '2022-04-21 12:23:24', 12181.835938, 17032.792969, -0.0150909, 0.2566, 0.966518, 0, 0, 0, 1, 0, '000000', 0, 3, '2022-04-21 12:23:24', NULL),
(89, 'EBM_Brickwall', '76561198057491789', '2022-04-21 12:28:48', 12186.188477, 17029.335938, -0.0266838, 0.864183, 0.503178, 0, 0, 0, 1, 0, '000000', 0, 3, '2022-04-21 12:28:48', NULL),
(90, 'Land_BagFence_Long_F', '76561198057491789', '2022-04-21 12:29:17', 12159.143555, 17008.363281, 3.526291, -0.196801, -0.980443, 0, 0, 0, 1, 0, '000000', 0, 3, '2022-04-21 12:29:17', NULL),
(91, 'EBM_Brickwall', '76561198057491789', '2022-04-21 12:32:37', 12170.390625, 16950.482422, -0.238724, -0.0716404, -0.997431, 0, 0, 0, 1, 0, '000000', 0, 3, '2022-04-21 12:32:37', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `container`
--

CREATE TABLE `container` (
  `id` int(11) UNSIGNED NOT NULL,
  `class` varchar(64) NOT NULL,
  `spawned_at` datetime NOT NULL DEFAULT current_timestamp(),
  `account_uid` varchar(32) DEFAULT NULL,
  `is_locked` tinyint(1) NOT NULL DEFAULT 0,
  `position_x` double NOT NULL DEFAULT 0,
  `position_y` double NOT NULL DEFAULT 0,
  `position_z` double NOT NULL DEFAULT 0,
  `direction_x` double NOT NULL DEFAULT 0,
  `direction_y` double NOT NULL DEFAULT 0,
  `direction_z` double NOT NULL DEFAULT 0,
  `up_x` double NOT NULL DEFAULT 0,
  `up_y` double NOT NULL DEFAULT 0,
  `up_z` double NOT NULL DEFAULT 1,
  `cargo_items` text NOT NULL,
  `cargo_magazines` text NOT NULL,
  `cargo_weapons` text NOT NULL,
  `cargo_container` text NOT NULL,
  `last_updated_at` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `pin_code` varchar(6) NOT NULL DEFAULT '000000',
  `territory_id` int(11) UNSIGNED DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `money` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `abandoned` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

--
-- Dumping data for table `container`
--

INSERT INTO `container` (`id`, `class`, `spawned_at`, `account_uid`, `is_locked`, `position_x`, `position_y`, `position_z`, `direction_x`, `direction_y`, `direction_z`, `up_x`, `up_y`, `up_z`, `cargo_items`, `cargo_magazines`, `cargo_weapons`, `cargo_container`, `last_updated_at`, `pin_code`, `territory_id`, `deleted_at`, `money`, `abandoned`) VALUES
(2, 'Land_Cargo40_light_green_F', '2022-04-21 06:25:34', '76561198157934652', 0, 12659.759766, 14782.294922, -0.0718384, -0.652355, 0.757914, 0, 0, 0, 1, '[[],[]]', '[]', '[]', '[]', '2022-04-21 09:13:21', '0000', 4, NULL, 121000, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `player`
--

CREATE TABLE `player` (
  `id` int(11) UNSIGNED NOT NULL,
  `name` varchar(64) NOT NULL,
  `account_uid` varchar(32) NOT NULL,
  `money` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `damage` double UNSIGNED NOT NULL DEFAULT 0,
  `hunger` double UNSIGNED NOT NULL DEFAULT 100,
  `thirst` double UNSIGNED NOT NULL DEFAULT 100,
  `alcohol` double UNSIGNED NOT NULL DEFAULT 0,
  `temperature` double NOT NULL DEFAULT 37,
  `wetness` double UNSIGNED NOT NULL DEFAULT 0,
  `oxygen_remaining` double UNSIGNED NOT NULL DEFAULT 1,
  `bleeding_remaining` double UNSIGNED NOT NULL DEFAULT 0,
  `hitpoints` varchar(1024) NOT NULL DEFAULT '[]',
  `direction` double NOT NULL DEFAULT 0,
  `position_x` double NOT NULL DEFAULT 0,
  `position_y` double NOT NULL DEFAULT 0,
  `position_z` double NOT NULL DEFAULT 0,
  `spawned_at` datetime NOT NULL DEFAULT current_timestamp(),
  `assigned_items` text NOT NULL,
  `backpack` varchar(64) NOT NULL,
  `backpack_items` text NOT NULL,
  `backpack_magazines` text NOT NULL,
  `backpack_weapons` text NOT NULL,
  `current_weapon` varchar(64) NOT NULL,
  `goggles` varchar(64) NOT NULL,
  `handgun_items` text NOT NULL,
  `handgun_weapon` varchar(64) NOT NULL,
  `headgear` varchar(64) NOT NULL,
  `binocular` varchar(64) NOT NULL,
  `loaded_magazines` text NOT NULL,
  `primary_weapon` varchar(64) NOT NULL,
  `primary_weapon_items` text NOT NULL,
  `secondary_weapon` varchar(64) NOT NULL,
  `secondary_weapon_items` text NOT NULL,
  `uniform` varchar(64) NOT NULL,
  `uniform_items` text NOT NULL,
  `uniform_magazines` text NOT NULL,
  `uniform_weapons` text NOT NULL,
  `vest` varchar(64) NOT NULL,
  `vest_items` text NOT NULL,
  `vest_magazines` text NOT NULL,
  `vest_weapons` text NOT NULL,
  `last_updated_at` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `player`
--

INSERT INTO `player` (`id`, `name`, `account_uid`, `money`, `damage`, `hunger`, `thirst`, `alcohol`, `temperature`, `wetness`, `oxygen_remaining`, `bleeding_remaining`, `hitpoints`, `direction`, `position_x`, `position_y`, `position_z`, `spawned_at`, `assigned_items`, `backpack`, `backpack_items`, `backpack_magazines`, `backpack_weapons`, `current_weapon`, `goggles`, `handgun_items`, `handgun_weapon`, `headgear`, `binocular`, `loaded_magazines`, `primary_weapon`, `primary_weapon_items`, `secondary_weapon`, `secondary_weapon_items`, `uniform`, `uniform_items`, `uniform_magazines`, `uniform_weapons`, `vest`, `vest_items`, `vest_magazines`, `vest_weapons`, `last_updated_at`) VALUES
(10, 'Brock', '76561198169174237', 0, 0, 100, 100, 0, 37, 0, 1, 0, '[[\"face_hub\",0],[\"neck\",0],[\"head\",0],[\"pelvis\",0],[\"spine1\",0],[\"spine2\",0],[\"spine3\",0],[\"body\",0],[\"arms\",0],[\"hands\",0],[\"legs\",0],[\"body\",0]]', 166.0419769, 9998.000976563, 12199.775391, 494.651886, '2022-04-20 10:31:00', '[\"ItemMap\",\"ItemCompass\",\"Exile_Item_XM8\",\"ItemRadio\"]', '', '[]', '[]', '[]', '', '', '[\"\",\"\",\"\",\"\"]', '', '', '', '[]', '', '[\"\",\"\",\"\",\"\"]', '', '[\"\",\"\",\"\",\"\"]', 'Exile_Uniform_BambiOverall', '[]', '[[\"Exile_Item_PlasticBottleFreshWater\",1]]', '[]', '', '[]', '[]', '[]', '2022-04-20 10:31:26'),
(11, 'Cmdr Redneck', '76561198961932168', 0, 0, 57.820606, 35.783745, 0, 37, 0, 1, 0, '[[\"face_hub\",0],[\"neck\",0],[\"head\",0],[\"pelvis\",0],[\"spine1\",0],[\"spine2\",0],[\"spine3\",0],[\"body\",0],[\"arms\",0],[\"hands\",0],[\"legs\",0],[\"body\",0]]', 188.423248, 14597.790039, 16776.802734, 0.126438, '2022-04-20 10:45:21', '[\"ItemMap\",\"ItemCompass\",\"Exile_Item_XM8\",\"ItemRadio\",\"ItemGPS\",\"Binocular\"]', 'B_AssaultPack_cbr', '[]', '[[\"30Rnd_556x45_Stanag_Tracer_Red\",30],[\"30Rnd_556x45_Stanag_Tracer_Red\",30],[\"30Rnd_556x45_Stanag_Tracer_Red\",30],[\"30Rnd_556x45_Stanag_Tracer_Red\",30],[\"Exile_Item_PlasticBottleFreshWater\",1],[\"30Rnd_9x21_Red_Mag\",30],[\"30Rnd_9x21_Red_Mag\",30],[\"30Rnd_9x21_Red_Mag\",30],[\"30Rnd_9x21_Red_Mag\",30],[\"Exile_Item_Noodles\",1],[\"30Rnd_556x45_Stanag_Tracer_Red\",30],[\"Exile_Item_InstaDoc\",1],[\"30Rnd_556x45_Stanag_Tracer_Red\",20]]', '[]', '', 'G_Sport_BlackWhite', '[\"\",\"\",\"\",\"\"]', 'hgun_P07_F', 'H_HelmetB', 'Binocular', '[[\"arifle_SPAR_01_blk_F\",\"30Rnd_556x45_Stanag_Tracer_Red\",30,\"arifle_SPAR_01_blk_F\"],[\"hgun_P07_F\",\"16Rnd_9x21_yellow_Mag\",15,\"hgun_P07_F\"]]', 'arifle_SPAR_01_blk_F', '[\"\",\"acc_pointer_IR\",\"optic_ERCO_blk_F\",\"\"]', '', '[\"\",\"\",\"\",\"\"]', 'U_C_man_sport_2_F', '[]', '[[\"FlareRed_F\",1],[\"16Rnd_9x21_yellow_Mag\",13],[\"Exile_Item_ZipTie\",1],[\"Exile_Item_PlasticBottleFreshWater\",1]]', '[]', 'V_PlateCarrier1_blk', '[]', '[[\"Exile_Item_CanOpener\",1],[\"Exile_Item_MountainDupe\",1],[\"Exile_Item_MountainDupe\",1],[\"Exile_Item_Noodles\",1],[\"Exile_Item_MountainDupe\",1],[\"Exile_Item_Noodles\",1],[\"Exile_Item_MountainDupe\",1],[\"Exile_Item_Noodles\",1],[\"Exile_Item_Noodles\",1],[\"Exile_Item_PlasticBottleFreshWater\",1],[\"Exile_Item_CatFood\",1],[\"Exile_Item_Matches\",10],[\"Exile_Item_PlasticBottleFreshWater\",1],[\"Exile_Item_DuctTape\",1]]', '[]', '2022-04-20 11:25:26'),
(29, 'steamuser', '76561198157934652', 299455, 0.0275591, 50.969055, 50.484077, 0, 37, 0, 1, 0, '[[\"face_hub\",0.0275591],[\"neck\",0.0275591],[\"head\",0.0275591],[\"pelvis\",0.0275591],[\"spine1\",0.0275591],[\"spine2\",0.0275591],[\"spine3\",0.0275591],[\"body\",0.0275591],[\"arms\",0.0275591],[\"hands\",0.0275591],[\"legs\",0.0275591],[\"body\",0.0275591]]', 40.0117226, 12209.0166016, 16984.498047, 0.00166321, '2022-04-21 09:59:59', '[\"ItemMap\",\"ItemCompass\",\"Exile_Item_XM8\",\"ItemRadio\",\"O_NVGoggles_urb_F\"]', 'B_Bergen_dgtl_F', '[]', '[[\"200Rnd_65x39_cased_Box_Tracer\",200],[\"200Rnd_65x39_cased_Box_Tracer\",200],[\"200Rnd_65x39_cased_Box_Tracer\",200],[\"200Rnd_65x39_cased_Box_Tracer\",200],[\"200Rnd_65x39_cased_Box_Tracer\",200],[\"200Rnd_65x39_cased_Box_Tracer\",200]]', '[]', 'LMG_Mk200_F', 'G_Shades_Black', '[\"\",\"\",\"\",\"\"]', '', 'rhs_6b27m_digi', '', '[[\"LMG_Mk200_F\",\"200Rnd_65x39_cased_Box_Tracer\",122,\"LMG_Mk200_F\"]]', 'LMG_Mk200_F', '[\"\",\"\",\"optic_Hamr_khk_F\",\"\"]', '', '[\"\",\"\",\"\",\"\"]', 'rhs_uniform_emr_patchless', '[]', '[]', '[]', 'rhs_6b23_6sh92_headset', '[]', '[[\"200Rnd_65x39_cased_Box_Tracer\",200]]', '[]', '2022-04-21 11:57:18'),
(30, 'A_Rabb1t', '76561198057491789', 10605, 0, 46.707043, 46.0196114, 0, 36.997826, 0, 1, 0, '[[\"face_hub\",0],[\"neck\",0],[\"head\",0],[\"pelvis\",0],[\"spine1\",0],[\"spine2\",0],[\"spine3\",0],[\"body\",0],[\"arms\",0],[\"hands\",0],[\"legs\",0],[\"body\",0]]', 145.838776, 12218.183594, 17000.0351563, 0.00144577, '2022-04-21 11:27:59', '[\"ItemMap\",\"ItemCompass\",\"Exile_Item_XM8\",\"ItemRadio\",\"ItemGPS\",\"O_NVGoggles_urb_F\"]', 'B_Carryall_mcamo', '[[\"ToolKit\",1],[\"FirstAidKit\",4]]', '[[\"100Rnd_65x39_caseless_mag\",100],[\"100Rnd_65x39_caseless_mag\",100],[\"Exile_Item_MountainDupe\",1],[\"Exile_Item_EnergyDrink\",1],[\"Exile_Item_Codelock\",1]]', '[]', 'arifle_MXC_F', 'G_Bandanna_shades', '[\"muzzle_snds_L\",\"\",\"\",\"\"]', 'hgun_P07_F', 'H_Booniehat_mcamo', '', '[[\"arifle_MXC_F\",\"100Rnd_65x39_caseless_mag\",76,\"arifle_MXC_F\"],[\"hgun_P07_F\",\"30Rnd_9x21_Red_Mag\",27,\"hgun_P07_F\"]]', 'arifle_MXC_F', '[\"muzzle_snds_H_snd_F\",\"acc_pointer_IR\",\"optic_ERCO_snd_F\",\"\"]', '', '[\"\",\"\",\"\",\"\"]', 'U_B_CombatUniform_mcam', '[]', '[[\"30Rnd_9x21_Red_Mag\",30],[\"30Rnd_65x39_caseless_mag\",10],[\"30Rnd_9x21_Red_Mag\",20],[\"30Rnd_9x21_Red_Mag\",25]]', '[]', 'V_PlateCarrierGL_mtp', '[]', '[[\"30Rnd_9x21_Red_Mag\",30],[\"30Rnd_9x21_Red_Mag\",30],[\"30Rnd_65x39_caseless_mag\",17],[\"100Rnd_65x39_caseless_mag\",99],[\"30Rnd_65x39_caseless_mag\",26],[\"30Rnd_65x39_caseless_mag\",24],[\"Exile_Item_PlasticBottleEmpty\",1],[\"Exile_Item_Moobar\",1],[\"Exile_Item_Moobar\",1],[\"Exile_Item_Moobar\",1],[\"Exile_Item_MountainDupe\",1],[\"Exile_Item_EnergyDrink\",1],[\"Exile_Item_MountainDupe\",1],[\"100Rnd_65x39_caseless_mag\",68]]', '[]', '2022-04-21 12:33:53'),
(31, 'Jay', '76561199134604036', 0, 0.0511811, 77.980461, 77.595985, 0, 36.993633, 0, 1, 0, '[[\"face_hub\",0.0511811],[\"neck\",0.0511811],[\"head\",0.0511811],[\"pelvis\",0.0511811],[\"spine1\",0.0511811],[\"spine2\",0.0511811],[\"spine3\",0.0511811],[\"body\",0.0511811],[\"arms\",0.0511811],[\"hands\",0.0511811],[\"legs\",0.0511811],[\"body\",0.0511811]]', 335.716309, 24065.806641, 22583.976563, 0.00150299, '2022-04-21 13:41:50', '[\"ItemMap\",\"ItemCompass\",\"Exile_Item_XM8\",\"ItemRadio\"]', '', '[]', '[]', '[]', '', 'G_Spectacles_Tinted', '[\"\",\"\",\"\",\"\"]', '', '', '', '[[\"SMG_05_F\",\"30Rnd_9x21_Mag_SMG_02_Tracer_Green\",30,\"SMG_05_F\"]]', 'SMG_05_F', '[\"\",\"\",\"\",\"\"]', '', '[\"\",\"\",\"\",\"\"]', 'Exile_Uniform_BambiOverall', '[]', '[[\"30Rnd_9x21_Mag_SMG_02_Tracer_Green\",30],[\"30Rnd_9x21_Mag_SMG_02_Tracer_Green\",30],[\"30Rnd_9x21_Mag_SMG_02_Tracer_Green\",30]]', '[]', '', '[]', '[]', '[]', '2022-04-21 14:08:48'),
(32, 'PONNY', '76561198115196834', 448505, 0, 74.856995, 74.796509, 0, 37, 0, 1, 0, '[[\"face_hub\",0],[\"neck\",0],[\"head\",0],[\"pelvis\",0],[\"spine1\",0],[\"spine2\",0],[\"spine3\",0],[\"body\",0],[\"arms\",0],[\"hands\",0],[\"legs\",0],[\"body\",0]]', 179.220123, 14608.649414, 16860.464844, 0.00144386, '2022-04-22 05:22:10', '[\"ItemMap\",\"ItemCompass\",\"Exile_Item_XM8\",\"ItemRadio\"]', '', '[]', '[]', '[]', '', '', '[\"\",\"\",\"\",\"\"]', '', '', '', '[]', '', '[\"\",\"\",\"\",\"\"]', '', '[\"\",\"\",\"\",\"\"]', 'Exile_Uniform_BambiOverall', '[]', '[[\"Exile_Item_PlasticBottleFreshWater\",1]]', '[]', '', '[]', '[]', '[]', '2022-04-22 05:52:09');

-- --------------------------------------------------------

--
-- Table structure for table `player_history`
--

CREATE TABLE `player_history` (
  `id` int(11) UNSIGNED NOT NULL,
  `account_uid` varchar(32) NOT NULL,
  `name` varchar(64) NOT NULL,
  `died_at` datetime NOT NULL DEFAULT current_timestamp(),
  `position_x` double NOT NULL,
  `position_y` double NOT NULL,
  `position_z` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `player_history`
--

INSERT INTO `player_history` (`id`, `account_uid`, `name`, `died_at`, `position_x`, `position_y`, `position_z`) VALUES
(1, '76561198057491789', 'A_Rabb1t', '2022-04-20 08:55:15', 9226.93, 11920, 0.00149059),
(2, '76561198157934652', 'steamuser', '2022-04-20 09:15:58', 13542.8, 17833.8, 0.00144577),
(3, '76561198961932168', 'Cmdr Redneck', '2022-04-20 09:19:16', 10112.8, 11667.4, 0.00144005),
(4, '76561198057491789', 'A_Rabb1t', '2022-04-20 09:58:56', 14584.8, 16771.3, 0.00143814),
(5, '76561198157934652', 'steamuser', '2022-04-20 10:10:58', 11741, 13742.3, 0.00135136),
(6, '76561198169174237', 'Brock', '2022-04-20 10:30:10', 11587.1, 13761.2, 0.187587),
(7, '76561198961932168', 'Cmdr Redneck', '2022-04-20 10:44:48', 12845.9, 16738.1, 1.28188),
(8, '76561198057491789', 'A_Rabb1t', '2022-04-20 10:58:19', 12878, 16682.7, 0.00244904),
(9, '76561198057491789', 'A_Rabb1t', '2022-04-20 11:50:40', 21727.6, 17916.9, 153.275),
(10, '76561198057491789', 'A_Rabb1t', '2022-04-20 11:51:29', 9677.93, 11927.9, 2.17196),
(11, '76561198057491789', 'A_Rabb1t', '2022-04-20 11:59:11', 10100.4, 11923.8, 1.97158),
(12, '76561198157934652', 'steamuser', '2022-04-20 12:03:00', 20963.9, 17619.7, 2.06756),
(13, '76561198057491789', 'A_Rabb1t', '2022-04-20 12:03:08', 11936.8, 12394.8, 2.46075),
(14, '76561198157934652', 'steamuser', '2022-04-20 12:11:05', 21397.1, 18012.2, 0.00145721),
(15, '76561198157934652', 'steamuser', '2022-04-20 13:23:40', 26657.4, 28379.3, 0.00758904),
(16, '76561198057491789', 'A_Rabb1t', '2022-04-20 13:41:06', 15722.8, 18556.5, 1.34981),
(17, '76561198057491789', 'A_Rabb1t', '2022-04-20 13:51:03', 10770.8, 14879.9, 11.0047),
(18, '76561198157934652', 'steamuser', '2022-04-21 09:05:42', 12676.3, 14787.7, 0.00143814),
(19, '76561198157934652', 'steamuser', '2022-04-21 09:06:29', 12360.2, 14797.4, -0.167709),
(20, '76561198057491789', 'A_Rabb1t', '2022-04-21 09:39:45', 17386.3, 15763.8, 4.44922),
(21, '76561198157934652', 'steamuser', '2022-04-21 09:39:45', 17378.4, 15764.1, 4.00465),
(22, '76561198157934652', 'steamuser', '2022-04-21 09:40:51', 12651.7, 14762, 0.000793457),
(23, '76561198157934652', 'steamuser', '2022-04-21 09:55:47', 17168.8, 15907.1, 0.0019207),
(24, '76561198057491789', 'A_Rabb1t', '2022-04-21 09:56:01', 17125.9, 15923.6, 0.0015831),
(25, '76561198157934652', 'steamuser', '2022-04-21 09:59:36', 17020.7, 15802, 0),
(26, '76561198057491789', 'A_Rabb1t', '2022-04-21 11:27:31', 12214.9, 17023.2, 0.00173187);

-- --------------------------------------------------------

--
-- Table structure for table `territory`
--

CREATE TABLE `territory` (
  `id` int(11) UNSIGNED NOT NULL,
  `owner_uid` varchar(32) NOT NULL,
  `name` varchar(64) NOT NULL,
  `position_x` double NOT NULL,
  `position_y` double NOT NULL,
  `position_z` double NOT NULL,
  `radius` double NOT NULL,
  `level` int(11) NOT NULL,
  `flag_texture` varchar(255) NOT NULL,
  `flag_stolen` tinyint(1) NOT NULL DEFAULT 0,
  `flag_stolen_by_uid` varchar(32) DEFAULT NULL,
  `flag_stolen_at` datetime DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `last_paid_at` datetime DEFAULT current_timestamp(),
  `xm8_protectionmoney_notified` tinyint(1) NOT NULL DEFAULT 0,
  `build_rights` varchar(640) NOT NULL DEFAULT '0',
  `moderators` varchar(320) NOT NULL DEFAULT '0',
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `territory`
--

INSERT INTO `territory` (`id`, `owner_uid`, `name`, `position_x`, `position_y`, `position_z`, `radius`, `level`, `flag_texture`, `flag_stolen`, `flag_stolen_by_uid`, `flag_stolen_at`, `created_at`, `last_paid_at`, `xm8_protectionmoney_notified`, `build_rights`, `moderators`, `deleted_at`) VALUES
(2, '76561198057491789', 'Rabb1t Military', 12831.289063, 16699.900391, -0.47187, 15, 1, '\\A3\\Data_F\\Flags\\flag_us_co.paa', 1, '76561198961932168', '2022-04-20 11:11:49', '2022-04-20 10:54:31', '2022-04-20 10:54:31', 0, '[\"76561198057491789\"]', '[\"76561198057491789\"]', NULL),
(3, '76561198057491789', 'Hoes Galore', 12178.678711, 17021.884766, -0.000785828, 75, 5, 'exile_assets\\texture\\flag\\flag_misc_knuckles_co.paa', 0, NULL, NULL, '2022-04-20 13:11:36', '2022-04-20 13:11:36', 0, '[\"76561198057491789\",\"76561198157934652\"]', '[\"76561198057491789\",\"76561198157934652\"]', NULL),
(4, '76561198157934652', 'Da Wae', 12669.681641, 14785.59668, 7.417528, 135, 9, 'exile_assets\\texture\\flag\\flag_misc_knuckles_co.paa', 0, NULL, NULL, '2022-04-20 13:46:31', '2022-04-20 13:46:31', 0, '[\"76561198157934652\",\"76561198057491789\"]', '[\"76561198157934652\"]', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `vehicle`
--

CREATE TABLE `vehicle` (
  `id` int(11) UNSIGNED NOT NULL,
  `class` varchar(64) NOT NULL,
  `spawned_at` datetime NOT NULL DEFAULT current_timestamp(),
  `account_uid` varchar(32) DEFAULT NULL,
  `is_locked` tinyint(1) NOT NULL DEFAULT 0,
  `fuel` double UNSIGNED NOT NULL DEFAULT 0,
  `damage` double UNSIGNED NOT NULL DEFAULT 0,
  `hitpoints` text NOT NULL,
  `position_x` double NOT NULL DEFAULT 0,
  `position_y` double NOT NULL DEFAULT 0,
  `position_z` double NOT NULL DEFAULT 0,
  `direction_x` double NOT NULL DEFAULT 0,
  `direction_y` double NOT NULL DEFAULT 0,
  `direction_z` double NOT NULL DEFAULT 0,
  `up_x` double NOT NULL DEFAULT 0,
  `up_y` double NOT NULL DEFAULT 0,
  `up_z` double NOT NULL DEFAULT 1,
  `cargo_items` text NOT NULL,
  `cargo_magazines` text NOT NULL,
  `cargo_weapons` text NOT NULL,
  `cargo_container` text NOT NULL,
  `last_updated_at` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `pin_code` varchar(6) NOT NULL DEFAULT '000000',
  `deleted_at` datetime DEFAULT NULL,
  `money` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `vehicle_texture` text NOT NULL,
  `territory_id` int(11) UNSIGNED DEFAULT NULL,
  `nickname` varchar(64) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `vehicle`
--

INSERT INTO `vehicle` (`id`, `class`, `spawned_at`, `account_uid`, `is_locked`, `fuel`, `damage`, `hitpoints`, `position_x`, `position_y`, `position_z`, `direction_x`, `direction_y`, `direction_z`, `up_x`, `up_y`, `up_z`, `cargo_items`, `cargo_magazines`, `cargo_weapons`, `cargo_container`, `last_updated_at`, `pin_code`, `deleted_at`, `money`, `vehicle_texture`, `territory_id`, `nickname`) VALUES
(1, 'Exile_Chopper_Hummingbird_Civillian_Wasp', '2022-04-20 10:36:06', '76561198157934652', 0, 0.559266, 0.440709, '[[\"hitfuel\",0.440709],[\"hithull\",0.440709],[\"hitengine\",0.440709],[\"hitavionics\",0.440709],[\"hithrotor\",0.440709],[\"hitvrotor\",0.440709],[\"hitglass1\",0.440709],[\"hitglass2\",0.440709],[\"hitglass3\",0.440709],[\"hitglass4\",0.440709],[\"hitengine1\",0.440709],[\"hitengine2\",0.440709],[\"hitmissiles\",0.440709],[\"hitrglass\",0.440709],[\"hitlglass\",0.440709],[\"hitengine3\",0.440709],[\"hitwinch\",0.440709],[\"hittransmission\",0.440709],[\"hitglass5\",0.440709],[\"hitglass6\",0.440709],[\"hitlight\",0.440709],[\"hithydraulics\",0.440709],[\"hitgear\",0.440709],[\"hithstabilizerl1\",0.440709],[\"hithstabilizerr1\",0.440709],[\"hitvstabilizer1\",0.440709],[\"hittail\",0.440709],[\"hitpitottube\",0.440709],[\"hitstaticport\",0.440709],[\"hitstarter1\",0.440709],[\"hitstarter2\",0.440709],[\"hitstarter3\",0.440709],[\"hitturret\",0.440709],[\"hitgun\",0.440709],[\"#light_hitpoint\",0.440709]]', 12880.745117, 16724.21875, 0.0118866, 0.505683, -0.86268, -0.00821902, 0.105304, 0.0522658, 0.993065, '[[],[]]', '[]', '[]', '[]', '2022-04-20 11:44:25', '1104', NULL, 0, '', NULL, ''),
(3, 'Exile_Car_Ifrit', '2022-04-20 12:19:38', 'DMS_PersistentVehicle', 0, 0.835554, 0, '[[\"hitlfwheel\",0.519685],[\"hitlf2wheel\",0.476378],[\"hitrfwheel\",0.5],[\"hitrf2wheel\",0.503937],[\"hitreservewheel\",0.448819],[\"hitfuel\",0],[\"hithull\",0.456693],[\"hitengine\",0.472441],[\"hitbody\",0.393701],[\"hitglass1\",0.480315],[\"hitglass2\",0.377953],[\"hitglass3\",0.405512],[\"hitglass4\",0.322835],[\"hitglass5\",0.437008],[\"hitglass6\",0.535433],[\"hitglass7\",0.523622],[\"hitglass8\",0.523622],[\"hitglass9\",0.531496],[\"hitglass10\",0.5],[\"hitglass11\",0.46063],[\"hitrglass\",0.551181],[\"hitlglass\",0.433071],[\"hitlbwheel\",0.562992],[\"hitlmwheel\",0.543307],[\"hitrbwheel\",0.425197],[\"hitrmwheel\",0.452756],[\"#light_l\",0.393701],[\"#light_r\",0.472441],[\"#light_l\",0.393701],[\"#light_r\",0.472441],[\"#light_l2\",0.456693],[\"#light_r2\",0.492126]]', 21310.769531, 17881.232422, -0.152481, -0.580561, 0.814203, 0.00469586, 0.0275306, 0.0138658, 0.999525, '[[],[]]', '[[\"200Rnd_65x39_cased_Box\",200],[\"20Rnd_762x51_Mag\",20],[\"20Rnd_762x51_Mag\",20],[\"20Rnd_762x51_Mag\",20],[\"20Rnd_762x51_Mag\",20]]', '[[\"srifle_EBR_F\",\"\",\"\",\"\",[\"20Rnd_762x51_Mag\",20],[],\"\"],[\"Exile_Weapon_RPK\",\"\",\"\",\"\",[],[],\"\"],[\"arifle_Katiba_GL_F\",\"\",\"\",\"\",[\"30Rnd_65x39_caseless_green\",30],[],\"\"],[\"arifle_TRG20_F\",\"\",\"\",\"\",[\"30Rnd_556x45_Stanag\",30],[],\"\"],[\"arifle_Katiba_F\",\"\",\"\",\"\",[\"30Rnd_65x39_caseless_green\",30],[],\"\"],[\"Exile_Weapon_AKS_Gold\",\"\",\"\",\"\",[],[],\"\"],[\"srifle_DMR_06_olive_F\",\"\",\"\",\"\",[\"20Rnd_762x51_Mag\",20],[],\"\"]]', '[[\"B_Kitbag_mcamo\",[],[],[[],[]]],[\"B_Bergen_blk\",[],[],[[],[]]],[\"B_Bergen_blk\",[],[],[[],[]]]]', '2022-04-20 12:45:21', '5654', NULL, 0, '', NULL, ''),
(4, 'Exile_Chopper_Huron_Black', '2022-04-20 13:36:47', '76561198157934652', 0, 0.592769, 0.0551181, '[[\"hithull\",0.0551181],[\"hitfuel\",0.271654],[\"hitavionics\",0],[\"hitengine1\",0],[\"hitengine2\",0.409449],[\"hitengine3\",0.409449],[\"hitengine4\",0.409449],[\"hitengine\",0.307087],[\"hithrotor\",0.0905512],[\"hitvrotor\",0.0905512],[\"hitrotorvirtual\",0.0905512],[\"hitglass1\",0.015748],[\"hitglass2\",0.015748],[\"hitglass3\",0.015748],[\"hitglass4\",0.019685],[\"hitglass5\",0.019685],[\"hitglass6\",0.015748],[\"hitglass7\",0.015748],[\"hitglass8\",0.0354331],[\"hitglass9\",0.0354331],[\"hitglass10\",0.224409],[\"hitglass11\",0.228346],[\"hitglass12\",0.440945],[\"hitglass13\",0.440945],[\"hitglass14\",0.440945],[\"hitglass15\",0.440945],[\"hitwinch\",0.0944882],[\"hittransmission\",0.0314961],[\"hitlight\",0],[\"hithydraulics\",0],[\"hitgear\",0],[\"hithstabilizerl1\",0],[\"hithstabilizerr1\",0],[\"hitvstabilizer1\",0],[\"hittail\",0],[\"hitpitottube\",0],[\"hitstaticport\",0],[\"hitmissiles\",0],[\"hitrglass\",0],[\"hitlglass\",0],[\"hitstarter1\",0],[\"hitstarter2\",0],[\"hitstarter3\",0],[\"hitturret\",0],[\"hitgun\",0],[\"hitturret\",0],[\"hitgun\",0],[\"hitturret\",0],[\"hitgun\",0],[\"#light_l\",0.011811],[\"#light_r\",0.011811]]', 14645.03125, 16727.935547, -0.0170975, -0.808899, 0.587663, 0.0183105, 0.0141316, -0.0117013, 0.999832, '[[\"bipod_03_F_blk\",\"muzzle_snds_H\",\"G_Bandanna_aviator\"],[1,1,1]]', '[[\"Exile_Item_EMRE\",1],[\"Exile_Item_EMRE\",1],[\"Exile_Item_EMRE\",1],[\"Exile_Item_PlasticBottleFreshWater\",1],[\"Exile_Item_PlasticBottleFreshWater\",1],[\"Exile_Item_PlasticBottleFreshWater\",1],[\"Exile_Item_PlasticBottleFreshWater\",1],[\"Exile_Item_PlasticBottleFreshWater\",1],[\"Exile_Item_InstaDoc\",1],[\"Exile_Item_InstaDoc\",1],[\"Exile_Item_InstaDoc\",1],[\"Exile_Item_InstaDoc\",1],[\"Exile_Item_PlasticBottleFreshWater\",1],[\"30Rnd_65x39_caseless_mag\",30],[\"30Rnd_65x39_caseless_mag\",30],[\"30Rnd_65x39_caseless_mag\",30],[\"Exile_Item_PlasticBottleFreshWater\",1],[\"Exile_Item_PlasticBottleFreshWater\",1],[\"Exile_Item_EMRE\",1],[\"Exile_Item_EMRE\",1],[\"30Rnd_65x39_caseless_mag\",16]]', '[]', '[]', '2022-04-21 09:16:52', '1104', NULL, 0, '', NULL, ''),
(6, 'RHS_T50_vvs_051', '2022-04-21 10:16:56', '76561198157934652', -1, 0.915353, 0.0472441, '[[\"hithull\",0.0472441],[\"hitavionics\",0.145669],[\"hitengine_c\",0.137795],[\"hitengine\",0.137795],[\"hitengine2\",0.137795],[\"hitfuel\",0],[\"hitfuel_left\",0],[\"hitfuel_right\",0],[\"hitfuel2\",0],[\"hitlaileron_link\",0.145669],[\"hitraileron_link\",0.145669],[\"hitlaileron\",0.220472],[\"hitraileron\",0.220472],[\"hitcontrolrear\",0.220472],[\"hitlcelevator\",0.220472],[\"hitrelevator\",0.220472],[\"hitlcrudder\",0.220472],[\"hitrightrudder\",0.220472],[\"hitglass1\",0.440945],[\"hitglass2\",0.440945],[\"#l svetlo\",0],[\"#p svetlo\",0]]', 14715.917969, 16786.324219, -0.124617, 0.674072, 0.738515, 0.0148926, -0.00958576, -0.011414, 0.999889, '[[],[]]', '[]', '[]', '[]', '2022-04-21 10:28:32', '1104', NULL, 0, '', NULL, ''),
(7, 'RHS_UH1Y', '2022-04-21 11:26:40', '76561198157934652', 0, 0.845281, 0, '[[\"hithull\",0],[\"hitavionics\",0],[\"hitengine1\",0],[\"hitengine2\",0],[\"hitengine\",0],[\"hittail\",0],[\"hitvrotor\",0],[\"hithrotor\",0],[\"hitfuel\",0],[\"hitglass7\",0],[\"hitpylon1\",0],[\"hitpylon2\",0],[\"hitglass1\",0],[\"hitglass2\",0],[\"hitglass3\",0],[\"hitglass4\",0],[\"hitglass5\",0],[\"hitglass6\",0],[\"hitglass8\",0],[\"hitglass9\",0],[\"hitglass10\",0],[\"hitmissiles\",0],[\"hitrglass\",0],[\"hitlglass\",0],[\"hitengine3\",0],[\"hitwinch\",0],[\"hittransmission\",0],[\"hitlight\",0],[\"hithydraulics\",0],[\"hitgear\",0],[\"hithstabilizerl1\",0],[\"hithstabilizerr1\",0],[\"hitvstabilizer1\",0],[\"hitpitottube\",0],[\"hitstaticport\",0],[\"hitstarter1\",0],[\"hitstarter2\",0],[\"hitstarter3\",0],[\"hitturret\",0],[\"hitgun\",0],[\"#svetlo\",0],[\"#cabin_light\",0],[\"#cargo_light_1\",0],[\"#cargo_light_2\",0]]', 12206.551758, 16980.708984, 0.00313187, 0.15448, 0.986604, 0.0524292, 0.0865359, -0.0663737, 0.994035, '[[],[]]', '[]', '[]', '[]', '2022-04-21 12:31:19', '1104', NULL, 0, '', 3, 'HUEY'),
(8, 'Exile_Car_Hunter', '2022-04-22 05:37:58', '76561198115196834', 0, 0.979322, 0, '[[\"hitlfwheel\",0],[\"hitlf2wheel\",0],[\"hitrfwheel\",0],[\"hitrf2wheel\",0],[\"hitbody\",0],[\"hithull\",0],[\"hitengine\",0],[\"hitfuel\",0],[\"hitglass1\",0],[\"hitglass2\",0],[\"hitglass3\",0],[\"hitglass4\",0],[\"hitglass5\",0],[\"hitglass6\",0],[\"hitrglass\",0],[\"hitlglass\",0],[\"hitlbwheel\",0],[\"hitlmwheel\",0],[\"hitrbwheel\",0],[\"hitrmwheel\",0],[\"hitglass7\",0],[\"hitglass8\",0],[\"#light_l\",0],[\"#light_r\",0],[\"#light_l\",0],[\"#light_r\",0],[\"#light_l2\",0],[\"#light_r2\",0]]', 17371.462891, 15784.318359, 0.00705719, 0.921509, -0.386993, 0.0325317, -0.0232347, 0.0286791, 0.999319, '[[],[]]', '[]', '[]', '[]', '2022-04-22 05:40:21', '1211', NULL, 0, '', NULL, '');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `account`
--
ALTER TABLE `account`
  ADD PRIMARY KEY (`uid`),
  ADD KEY `clan_id` (`clan_id`);

--
-- Indexes for table `clan`
--
ALTER TABLE `clan`
  ADD PRIMARY KEY (`id`),
  ADD KEY `leader_uid` (`leader_uid`);

--
-- Indexes for table `clan_map_marker`
--
ALTER TABLE `clan_map_marker`
  ADD PRIMARY KEY (`id`),
  ADD KEY `clan_id` (`clan_id`);

--
-- Indexes for table `construction`
--
ALTER TABLE `construction`
  ADD PRIMARY KEY (`id`),
  ADD KEY `account_uid` (`account_uid`),
  ADD KEY `territory_id` (`territory_id`);

--
-- Indexes for table `container`
--
ALTER TABLE `container`
  ADD PRIMARY KEY (`id`),
  ADD KEY `account_uid` (`account_uid`),
  ADD KEY `territory_id` (`territory_id`);

--
-- Indexes for table `player`
--
ALTER TABLE `player`
  ADD PRIMARY KEY (`id`),
  ADD KEY `player_uid` (`account_uid`);

--
-- Indexes for table `player_history`
--
ALTER TABLE `player_history`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `territory`
--
ALTER TABLE `territory`
  ADD PRIMARY KEY (`id`),
  ADD KEY `owner_uid` (`owner_uid`),
  ADD KEY `flag_stolen_by_uid` (`flag_stolen_by_uid`);

--
-- Indexes for table `vehicle`
--
ALTER TABLE `vehicle`
  ADD PRIMARY KEY (`id`),
  ADD KEY `account_uid` (`account_uid`),
  ADD KEY `vehicle_ibfk_2_idx` (`territory_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `clan`
--
ALTER TABLE `clan`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `clan_map_marker`
--
ALTER TABLE `clan_map_marker`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `construction`
--
ALTER TABLE `construction`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=92;

--
-- AUTO_INCREMENT for table `container`
--
ALTER TABLE `container`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `player`
--
ALTER TABLE `player`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT for table `player_history`
--
ALTER TABLE `player_history`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `territory`
--
ALTER TABLE `territory`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `vehicle`
--
ALTER TABLE `vehicle`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `account`
--
ALTER TABLE `account`
  ADD CONSTRAINT `account_ibfk_1` FOREIGN KEY (`clan_id`) REFERENCES `clan` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `clan`
--
ALTER TABLE `clan`
  ADD CONSTRAINT `clan_ibfk_1` FOREIGN KEY (`leader_uid`) REFERENCES `account` (`uid`) ON DELETE CASCADE;

--
-- Constraints for table `clan_map_marker`
--
ALTER TABLE `clan_map_marker`
  ADD CONSTRAINT `clan_map_marker_ibfk_1` FOREIGN KEY (`clan_id`) REFERENCES `clan` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `construction`
--
ALTER TABLE `construction`
  ADD CONSTRAINT `construction_ibfk_1` FOREIGN KEY (`account_uid`) REFERENCES `account` (`uid`) ON DELETE CASCADE,
  ADD CONSTRAINT `construction_ibfk_2` FOREIGN KEY (`territory_id`) REFERENCES `territory` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `container`
--
ALTER TABLE `container`
  ADD CONSTRAINT `container_ibfk_1` FOREIGN KEY (`account_uid`) REFERENCES `account` (`uid`) ON DELETE CASCADE,
  ADD CONSTRAINT `container_ibfk_2` FOREIGN KEY (`territory_id`) REFERENCES `territory` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `player`
--
ALTER TABLE `player`
  ADD CONSTRAINT `player_ibfk_1` FOREIGN KEY (`account_uid`) REFERENCES `account` (`uid`) ON DELETE CASCADE;

--
-- Constraints for table `territory`
--
ALTER TABLE `territory`
  ADD CONSTRAINT `territory_ibfk_1` FOREIGN KEY (`owner_uid`) REFERENCES `account` (`uid`) ON DELETE CASCADE,
  ADD CONSTRAINT `territory_ibfk_2` FOREIGN KEY (`flag_stolen_by_uid`) REFERENCES `account` (`uid`) ON DELETE SET NULL;

--
-- Constraints for table `vehicle`
--
ALTER TABLE `vehicle`
  ADD CONSTRAINT `vehicle_ibfk_1` FOREIGN KEY (`account_uid`) REFERENCES `account` (`uid`) ON DELETE CASCADE,
  ADD CONSTRAINT `vehicle_ibfk_2` FOREIGN KEY (`territory_id`) REFERENCES `territory` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
