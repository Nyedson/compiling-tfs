-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 07-11-2022 a las 04:34:36
-- Versión del servidor: 10.4.18-MariaDB
-- Versión de PHP: 7.3.27

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `xamera_db`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `accounts`
--

CREATE TABLE `accounts` (
  `id` int(11) NOT NULL,
  `name` varchar(32) NOT NULL,
  `password` char(40) NOT NULL,
  `secret` char(16) DEFAULT NULL,
  `type` int(11) NOT NULL DEFAULT 1,
  `premdays` int(11) NOT NULL DEFAULT 0,
  `coins` int(11) NOT NULL DEFAULT 0,
  `lastday` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `proxy_id` int(11) NOT NULL DEFAULT 0,
  `email` varchar(255) NOT NULL DEFAULT '',
  `creation` bigint(20) NOT NULL DEFAULT 0,
  `recruiter` int(11) DEFAULT 0,
  `vote` int(11) NOT NULL DEFAULT 0,
  `key` varchar(64) NOT NULL DEFAULT '',
  `blocked` tinyint(1) NOT NULL DEFAULT 0 COMMENT 'internal usage',
  `created` int(11) NOT NULL DEFAULT 0,
  `email_new` varchar(255) NOT NULL DEFAULT '',
  `email_new_time` int(11) NOT NULL DEFAULT 0,
  `rlname` varchar(255) NOT NULL DEFAULT '',
  `location` varchar(255) NOT NULL DEFAULT '',
  `country` varchar(3) NOT NULL DEFAULT '',
  `web_lastlogin` int(11) NOT NULL DEFAULT 0,
  `web_flags` int(11) NOT NULL DEFAULT 0,
  `email_hash` varchar(32) NOT NULL DEFAULT '',
  `email_verified` tinyint(1) NOT NULL DEFAULT 0,
  `page_access` int(11) NOT NULL DEFAULT 0,
  `email_code` varchar(255) NOT NULL DEFAULT '',
  `email_next` int(11) NOT NULL DEFAULT 0,
  `premium_points` int(11) NOT NULL DEFAULT 0,
  `create_date` bigint(20) NOT NULL DEFAULT 0,
  `create_ip` bigint(20) NOT NULL DEFAULT 0,
  `last_post` int(11) NOT NULL DEFAULT 0,
  `flag` varchar(80) NOT NULL DEFAULT '',
  `vip_time` int(11) NOT NULL DEFAULT 0,
  `guild_points` int(11) NOT NULL DEFAULT 0,
  `guild_points_stats` int(11) NOT NULL DEFAULT 0,
  `passed` int(11) NOT NULL DEFAULT 0,
  `block` int(11) NOT NULL DEFAULT 0,
  `refresh` int(11) NOT NULL DEFAULT 0,
  `birth_date` varchar(50) NOT NULL DEFAULT '',
  `gender` varchar(20) NOT NULL DEFAULT '',
  `loyalty_points` bigint(20) NOT NULL DEFAULT 0,
  `authToken` varchar(100) NOT NULL DEFAULT '',
  `player_sell_bank` int(11) DEFAULT 0,
  `secret_status` tinyint(1) NOT NULL DEFAULT 0,
  `tournamentBalance` int(11) NOT NULL DEFAULT 0,
  `tokens` int(11) NOT NULL DEFAULT 0,
  `spices` int(11) NOT NULL DEFAULT 0,
  `reference` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `accounts_storage`
--

CREATE TABLE `accounts_storage` (
  `account_id` int(11) NOT NULL DEFAULT 0,
  `key` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `value` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `account_bans`
--

CREATE TABLE `account_bans` (
  `account_id` int(11) NOT NULL,
  `reason` varchar(255) NOT NULL,
  `banned_at` bigint(20) NOT NULL,
  `expires_at` bigint(20) NOT NULL,
  `banned_by` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `account_ban_history`
--

CREATE TABLE `account_ban_history` (
  `id` int(10) UNSIGNED NOT NULL,
  `account_id` int(11) NOT NULL,
  `reason` varchar(255) NOT NULL,
  `banned_at` bigint(20) NOT NULL,
  `expired_at` bigint(20) NOT NULL,
  `banned_by` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `account_character_sale`
--

CREATE TABLE `account_character_sale` (
  `id` int(11) NOT NULL,
  `id_account` int(11) NOT NULL,
  `id_player` int(11) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0,
  `price_type` tinyint(4) NOT NULL,
  `price_coins` int(11) DEFAULT NULL,
  `price_gold` int(11) DEFAULT NULL,
  `dta_insert` datetime NOT NULL,
  `dta_valid` datetime NOT NULL,
  `dta_sale` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `account_events`
--

CREATE TABLE `account_events` (
  `accountId` int(11) NOT NULL,
  `status` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `account_events`
--

INSERT INTO `account_events` (`accountId`, `status`) VALUES
(104, 2),
(19, 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `account_viplist`
--

CREATE TABLE `account_viplist` (
  `account_id` int(11) NOT NULL COMMENT 'id of account whose viplist entry it is',
  `player_id` int(11) NOT NULL COMMENT 'id of target player of viplist entry',
  `description` varchar(128) NOT NULL DEFAULT '',
  `icon` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `notify` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `announcements`
--

CREATE TABLE `announcements` (
  `id` int(11) NOT NULL,
  `title` varchar(50) NOT NULL,
  `text` varchar(255) NOT NULL,
  `date` varchar(20) NOT NULL,
  `author` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `blessings_history`
--

CREATE TABLE `blessings_history` (
  `id` int(11) NOT NULL,
  `player_id` int(11) NOT NULL,
  `blessing` tinyint(4) NOT NULL,
  `loss` tinyint(1) NOT NULL,
  `timestamp` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `boosted_boss`
--

CREATE TABLE `boosted_boss` (
  `date` varchar(250) NOT NULL DEFAULT '',
  `boostname` text DEFAULT NULL,
  `bossid` varchar(250) NOT NULL DEFAULT '',
  `looktype` int(11) NOT NULL DEFAULT 136,
  `lookfeet` int(11) NOT NULL DEFAULT 0,
  `looklegs` int(11) NOT NULL DEFAULT 0,
  `lookhead` int(11) NOT NULL DEFAULT 0,
  `lookbody` int(11) NOT NULL DEFAULT 0,
  `lookaddons` int(11) NOT NULL DEFAULT 0,
  `lookmount` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `boosted_boss`
--

INSERT INTO `boosted_boss` (`date`, `boostname`, `bossid`, `looktype`, `lookfeet`, `looklegs`, `lookhead`, `lookbody`, `lookaddons`, `lookmount`) VALUES
('6', 'The Sandking', '1444', 1013, 0, 0, 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `boosted_creature`
--

CREATE TABLE `boosted_creature` (
  `looktype` int(11) NOT NULL DEFAULT 136,
  `lookfeet` int(11) NOT NULL DEFAULT 0,
  `looklegs` int(11) NOT NULL DEFAULT 0,
  `lookhead` int(11) NOT NULL DEFAULT 0,
  `lookbody` int(11) NOT NULL DEFAULT 0,
  `lookaddons` int(11) NOT NULL DEFAULT 0,
  `lookmount` int(11) DEFAULT 0,
  `date` varchar(250) NOT NULL DEFAULT '',
  `boostname` text DEFAULT NULL,
  `raceid` varchar(250) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `boosted_creature`
--

INSERT INTO `boosted_creature` (`looktype`, `lookfeet`, `looklegs`, `lookhead`, `lookbody`, `lookaddons`, `lookmount`, `date`, `boostname`, `raceid`) VALUES
(47, 0, 0, 0, 0, 0, 0, '6', 'Renegade Quara Hydromancer', '1098');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `boss_slots`
--

CREATE TABLE `boss_slots` (
  `player_id` int(11) NOT NULL,
  `num` int(11) NOT NULL,
  `boss_id` int(11) NOT NULL,
  `removals` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `boss_slots`
--

INSERT INTO `boss_slots` (`player_id`, `num`, `boss_id`, `removals`) VALUES
(1796, 0, 0, 0),
(1796, 1, 0, 0),
(1308, 0, 0, 0),
(1308, 1, 0, 0),
(2019, 0, 0, 0),
(2019, 1, 0, 0),
(2089, 0, 0, 0),
(2089, 1, 0, 0),
(1081, 0, 0, 0),
(1081, 1, 0, 0),
(2079, 0, 0, 0),
(2079, 1, 0, 0),
(2011, 0, 0, 0),
(2011, 1, 0, 0),
(2081, 0, 0, 0),
(2081, 1, 0, 0),
(1899, 0, 0, 0),
(1899, 1, 0, 0),
(2058, 0, 0, 0),
(2058, 1, 0, 0),
(1921, 0, 0, 0),
(1921, 1, 0, 0),
(814, 0, 0, 0),
(814, 1, 0, 0),
(848, 0, 0, 0),
(848, 1, 0, 0),
(847, 0, 0, 0),
(847, 1, 0, 0),
(1996, 0, 0, 0),
(1996, 1, 0, 0),
(268, 0, 0, 0),
(268, 1, 0, 0),
(1315, 0, 0, 0),
(1315, 1, 0, 0),
(1958, 0, 0, 0),
(1958, 1, 0, 0),
(1957, 0, 0, 0),
(1957, 1, 0, 0),
(1707, 0, 0, 0),
(1707, 1, 0, 0),
(1813, 0, 0, 0),
(1813, 1, 0, 0),
(2075, 0, 0, 0),
(2075, 1, 0, 0),
(2097, 0, 0, 0),
(2097, 1, 0, 0),
(266, 0, 0, 0),
(266, 1, 0, 0),
(2088, 0, 0, 0),
(2088, 1, 0, 0),
(1709, 0, 0, 0),
(1709, 1, 0, 0),
(2087, 0, 0, 0),
(2087, 1, 0, 0),
(2062, 0, 0, 0),
(2062, 1, 0, 0),
(2049, 0, 0, 0),
(2049, 1, 0, 0),
(1994, 0, 0, 0),
(1994, 1, 0, 0),
(2082, 0, 0, 0),
(2082, 1, 0, 0),
(2091, 0, 0, 0),
(2091, 1, 0, 0),
(1821, 0, 0, 0),
(1821, 1, 0, 0),
(1407, 0, 0, 0),
(1407, 1, 0, 0),
(1304, 0, 0, 0),
(1304, 1, 0, 0),
(1984, 0, 0, 0),
(1984, 1, 0, 0),
(790, 0, 0, 0),
(790, 1, 0, 0),
(791, 0, 0, 0),
(791, 1, 0, 0),
(793, 0, 0, 0),
(793, 1, 0, 0),
(772, 0, 0, 0),
(772, 1, 0, 0),
(1944, 0, 0, 0),
(1944, 1, 0, 0),
(1602, 0, 0, 0),
(1602, 1, 0, 0),
(2002, 0, 0, 0),
(2002, 1, 0, 0),
(2028, 0, 0, 0),
(2028, 1, 0, 0),
(2008, 0, 0, 0),
(2008, 1, 0, 0),
(1799, 0, 0, 0),
(1799, 1, 0, 0),
(1625, 0, 0, 0),
(1625, 1, 0, 0),
(2023, 0, 0, 0),
(2023, 1, 0, 0),
(2096, 0, 0, 0),
(2096, 1, 0, 0),
(1484, 0, 0, 0),
(1484, 1, 0, 0),
(1734, 0, 0, 0),
(1734, 1, 0, 0),
(1806, 0, 0, 0),
(1806, 1, 0, 0),
(2025, 0, 0, 0),
(2025, 1, 0, 0),
(1687, 0, 0, 0),
(1687, 1, 0, 0),
(1932, 0, 0, 0),
(1932, 1, 0, 0),
(1384, 0, 0, 0),
(1384, 1, 0, 0),
(1876, 0, 0, 0),
(1876, 1, 0, 0),
(866, 0, 0, 0),
(866, 1, 0, 0),
(862, 0, 0, 0),
(862, 1, 0, 0),
(2095, 0, 0, 0),
(2095, 1, 0, 0),
(1878, 0, 0, 0),
(1878, 1, 0, 0),
(1777, 0, 0, 0),
(1777, 1, 0, 0),
(1604, 0, 0, 0),
(1604, 1, 0, 0),
(1275, 0, 0, 0),
(1275, 1, 0, 0),
(2041, 0, 0, 0),
(2041, 1, 0, 0),
(1678, 0, 0, 0),
(1678, 1, 0, 0),
(1949, 0, 0, 0),
(1949, 1, 0, 0),
(1619, 0, 0, 0),
(1619, 1, 0, 0),
(1483, 0, 0, 0),
(1483, 1, 0, 0),
(1738, 0, 0, 0),
(1738, 1, 0, 0),
(1502, 0, 0, 0),
(1502, 1, 0, 0),
(1714, 0, 0, 0),
(1714, 1, 0, 0),
(1504, 0, 0, 0),
(1504, 1, 0, 0),
(1814, 0, 0, 0),
(1814, 1, 0, 0),
(1956, 0, 0, 0),
(1956, 1, 0, 0),
(1929, 0, 0, 0),
(1929, 1, 0, 0),
(2018, 0, 0, 0),
(2018, 1, 0, 0),
(605, 0, 0, 0),
(605, 1, 0, 0),
(867, 0, 0, 0),
(867, 1, 0, 0),
(813, 0, 0, 0),
(813, 1, 0, 0),
(2100, 0, 0, 0),
(2100, 1, 0, 0),
(1797, 0, 0, 0),
(1797, 1, 0, 0),
(2078, 0, 0, 0),
(2078, 1, 0, 0),
(2039, 0, 0, 0),
(2039, 1, 0, 0),
(2037, 0, 0, 0),
(2037, 1, 0, 0),
(2038, 0, 0, 0),
(2038, 1, 0, 0),
(2050, 0, 0, 0),
(2050, 1, 0, 0),
(1912, 0, 0, 0),
(1912, 1, 0, 0),
(1914, 0, 0, 0),
(1914, 1, 0, 0),
(1611, 0, 0, 0),
(1611, 1, 0, 0),
(1915, 0, 0, 0),
(1915, 1, 0, 0),
(1911, 0, 0, 0),
(1911, 1, 0, 0),
(1913, 0, 0, 0),
(1913, 1, 0, 0),
(1776, 0, 0, 0),
(1776, 1, 0, 0),
(1663, 0, 0, 0),
(1663, 1, 0, 0),
(1662, 0, 0, 0),
(1662, 1, 0, 0),
(693, 0, 0, 0),
(693, 1, 0, 0),
(1795, 0, 0, 0),
(1795, 1, 0, 0),
(1303, 0, 0, 0),
(1303, 1, 0, 0),
(2052, 0, 0, 0),
(2052, 1, 0, 0),
(1458, 0, 0, 0),
(1458, 1, 0, 0),
(903, 0, 0, 0),
(903, 1, 0, 0),
(2063, 0, 0, 0),
(2063, 1, 0, 0),
(1245, 0, 0, 0),
(1245, 1, 0, 0),
(1746, 0, 0, 0),
(1746, 1, 0, 0),
(904, 0, 0, 0),
(904, 1, 0, 0),
(1798, 0, 0, 0),
(1798, 1, 0, 0),
(1953, 0, 0, 0),
(1953, 1, 0, 0),
(1533, 0, 0, 0),
(1533, 1, 0, 0),
(2010, 0, 0, 0),
(2010, 1, 0, 0),
(1948, 0, 0, 0),
(1948, 1, 0, 0),
(2098, 0, 0, 0),
(2098, 1, 0, 0),
(1622, 0, 0, 0),
(1622, 1, 0, 0),
(1624, 0, 0, 0),
(1624, 1, 0, 0),
(1623, 0, 0, 0),
(1623, 1, 0, 0),
(1968, 0, 0, 0),
(1968, 1, 0, 0),
(2046, 0, 0, 0),
(2046, 1, 0, 0),
(1980, 0, 0, 0),
(1980, 1, 0, 0),
(1685, 0, 0, 0),
(1685, 1, 0, 0),
(1832, 0, 0, 0),
(1832, 1, 0, 0),
(864, 0, 0, 0),
(864, 1, 0, 0),
(1646, 0, 0, 0),
(1646, 1, 0, 0),
(1846, 0, 0, 0),
(1846, 1, 0, 0),
(1246, 0, 0, 0),
(1246, 1, 0, 0),
(1592, 0, 0, 0),
(1592, 1, 0, 0),
(1450, 0, 0, 0),
(1450, 1, 0, 0),
(1939, 0, 0, 0),
(1939, 1, 0, 0),
(2026, 0, 0, 0),
(2026, 1, 0, 0),
(603, 0, 0, 0),
(603, 1, 0, 0),
(1995, 0, 0, 0),
(1995, 1, 0, 0),
(1501, 0, 0, 0),
(1501, 1, 0, 0),
(380, 0, 0, 0),
(380, 1, 0, 0),
(1569, 0, 0, 0),
(1569, 1, 0, 0),
(1618, 0, 0, 0),
(1618, 1, 0, 0),
(1500, 0, 0, 0),
(1500, 1, 0, 0),
(2053, 0, 0, 0),
(2053, 1, 0, 0),
(1640, 0, 0, 0),
(1640, 1, 0, 0),
(1257, 0, 0, 0),
(1257, 1, 0, 0),
(1975, 0, 0, 0),
(1975, 1, 0, 0),
(1503, 0, 0, 0),
(1503, 1, 0, 0),
(1825, 0, 0, 0),
(1825, 1, 0, 0),
(1444, 0, 0, 0),
(1444, 1, 0, 0),
(2048, 0, 0, 0),
(2048, 1, 0, 0),
(2042, 0, 0, 0),
(2042, 1, 0, 0),
(1690, 0, 0, 0),
(1690, 1, 0, 0),
(306, 0, 0, 0),
(306, 1, 0, 0),
(1950, 0, 0, 0),
(1950, 1, 0, 0),
(1628, 0, 0, 0),
(1628, 1, 0, 0),
(1532, 0, 0, 0),
(1532, 1, 0, 0),
(1951, 0, 0, 0),
(1951, 1, 0, 0),
(1931, 0, 0, 0),
(1931, 1, 0, 0),
(2005, 0, 0, 0),
(2005, 1, 0, 0),
(1822, 0, 0, 0),
(1822, 1, 0, 0),
(1621, 0, 0, 0),
(1621, 1, 0, 0),
(2099, 0, 0, 0),
(2099, 1, 0, 0),
(1244, 0, 0, 0),
(1244, 1, 0, 0),
(1498, 0, 0, 0),
(1498, 1, 0, 0),
(1256, 0, 0, 0),
(1256, 1, 0, 0),
(1394, 0, 0, 0),
(1394, 1, 0, 0),
(269, 0, 0, 0),
(269, 1, 0, 0),
(971, 0, 0, 0),
(971, 1, 0, 0),
(528, 0, 0, 0),
(528, 1, 0, 0),
(1043, 0, 0, 0),
(1043, 1, 0, 0),
(1358, 0, 0, 0),
(1358, 1, 0, 0),
(1567, 0, 0, 0),
(1567, 1, 0, 0),
(1717, 0, 0, 0),
(1717, 1, 0, 0),
(1617, 0, 0, 0),
(1617, 1, 0, 0),
(1568, 0, 0, 0),
(1568, 1, 0, 0),
(1449, 0, 0, 0),
(1449, 1, 0, 0),
(1737, 0, 0, 0),
(1737, 1, 0, 0),
(1741, 0, 0, 0),
(1741, 1, 0, 0),
(1616, 0, 0, 0),
(1616, 1, 0, 0),
(1656, 0, 0, 0),
(1656, 1, 0, 0),
(1722, 0, 0, 0),
(1722, 1, 0, 0),
(1383, 0, 0, 0),
(1383, 1, 0, 0),
(1962, 0, 0, 0),
(1962, 1, 0, 0),
(1735, 0, 0, 0),
(1735, 1, 0, 0),
(1626, 0, 0, 0),
(1626, 1, 0, 0),
(1858, 0, 0, 0),
(1858, 1, 0, 0),
(385, 0, 0, 0),
(385, 1, 0, 0),
(1908, 0, 0, 0),
(1908, 1, 0, 0),
(258, 0, 0, 0),
(258, 1, 0, 0),
(2102, 0, 0, 0),
(2102, 1, 0, 0),
(2103, 0, 0, 0),
(2103, 1, 0, 0),
(250, 0, 0, 0),
(250, 1, 0, 0),
(224, 0, 0, 0),
(224, 1, 0, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `coins_transactions`
--

CREATE TABLE `coins_transactions` (
  `id` int(11) NOT NULL,
  `account_id` int(10) UNSIGNED NOT NULL,
  `type` tinyint(3) UNSIGNED NOT NULL,
  `amount` int(10) UNSIGNED NOT NULL,
  `description` varchar(3500) NOT NULL,
  `timestamp` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `crypto_payments`
--

CREATE TABLE `crypto_payments` (
  `paymentID` int(10) UNSIGNED NOT NULL,
  `boxID` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `boxType` enum('paymentbox','captchabox') NOT NULL,
  `orderID` varchar(50) NOT NULL DEFAULT '',
  `userID` varchar(50) NOT NULL DEFAULT '',
  `countryID` varchar(3) NOT NULL DEFAULT '',
  `coinLabel` varchar(6) NOT NULL DEFAULT '',
  `amount` double(20,8) NOT NULL DEFAULT 0.00000000,
  `amountUSD` double(20,8) NOT NULL DEFAULT 0.00000000,
  `unrecognised` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `addr` varchar(34) NOT NULL DEFAULT '',
  `txID` char(64) NOT NULL DEFAULT '',
  `txDate` datetime DEFAULT NULL,
  `txConfirmed` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `txCheckDate` datetime DEFAULT NULL,
  `processed` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `processedDate` datetime DEFAULT NULL,
  `recordCreated` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cs_current_offers`
--

CREATE TABLE `cs_current_offers` (
  `id` int(11) NOT NULL,
  `account_old` int(11) NOT NULL,
  `account_new` int(11) NOT NULL,
  `price` int(11) NOT NULL,
  `player_id` int(11) NOT NULL,
  `dateStart` date NOT NULL,
  `dateEnd` date NOT NULL,
  `status` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cs_transaction_history`
--

CREATE TABLE `cs_transaction_history` (
  `id` int(11) NOT NULL,
  `type` int(11) NOT NULL,
  `date` date NOT NULL,
  `player_id` int(11) NOT NULL,
  `seller_account` int(11) NOT NULL,
  `buyer_account` int(11) NOT NULL,
  `price` int(11) NOT NULL,
  `offer_date_start` date NOT NULL,
  `offer_date_end` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `cs_transaction_history`
--

INSERT INTO `cs_transaction_history` (`id`, `type`, `date`, `player_id`, `seller_account`, `buyer_account`, `price`, `offer_date_start`, `offer_date_end`) VALUES
(1, 2, '2022-06-18', 1082, 528, 0, 50, '2022-06-18', '2022-06-18'),
(2, 3, '2022-06-18', 1082, 528, 0, 50, '2022-06-18', '2022-06-18'),
(3, 2, '2022-06-19', 258, 26, 0, 1000, '2022-06-19', '2022-06-19'),
(4, 1, '2022-06-19', 258, 26, 25, 1000, '2022-06-19', '2022-06-19'),
(5, 2, '2022-06-19', 389, 111, 0, 1000, '2022-06-19', '2022-06-19'),
(6, 3, '2022-06-19', 389, 111, 0, 1000, '2022-06-19', '2022-06-19'),
(7, 2, '2022-06-20', 253, 26, 0, 800, '2022-06-20', '2022-06-20'),
(8, 2, '2022-06-23', 875, 422, 0, 500, '2022-06-23', '2022-06-23'),
(9, 3, '2022-06-30', 253, 26, 0, 800, '2022-06-30', '2022-06-30'),
(10, 2, '2022-07-02', 814, 390, 0, 900, '2022-07-02', '2022-07-02'),
(11, 2, '2022-07-08', 919, 449, 0, 55, '2022-07-08', '2022-07-08'),
(12, 1, '2022-07-08', 919, 449, 37, 55, '2022-07-08', '2022-07-08'),
(13, 3, '2022-07-11', 814, 390, 0, 900, '2022-07-11', '2022-07-11'),
(14, 1, '2022-07-17', 875, 422, 824, 500, '2022-07-17', '2022-07-17'),
(15, 2, '2022-07-22', 1412, 439, 0, 250, '2022-07-22', '2022-07-22'),
(16, 3, '2022-07-24', 1412, 439, 0, 250, '2022-07-24', '2022-07-24'),
(17, 2, '2022-08-02', 1500, 1036, 0, 50, '2022-08-02', '2022-08-02'),
(18, 3, '2022-08-02', 1500, 1036, 0, 50, '2022-08-02', '2022-08-02'),
(19, 2, '2022-08-02', 1480, 1036, 0, 50, '2022-08-02', '2022-08-02'),
(20, 3, '2022-08-02', 1480, 1036, 0, 50, '2022-08-02', '2022-08-02'),
(21, 2, '2022-08-02', 1480, 1036, 0, 99, '2022-08-02', '2022-08-02'),
(22, 3, '2022-08-02', 1480, 1036, 0, 99, '2022-08-02', '2022-08-02'),
(23, 2, '2022-08-02', 1480, 1036, 0, 55, '2022-08-02', '2022-08-02'),
(24, 3, '2022-08-02', 1480, 1036, 0, 55, '2022-08-02', '2022-08-02'),
(25, 2, '2022-08-02', 1469, 1036, 0, 50, '2022-08-02', '2022-08-02'),
(26, 3, '2022-08-02', 1469, 1036, 0, 50, '2022-08-02', '2022-08-02'),
(27, 2, '2022-08-02', 1480, 1036, 0, 50, '2022-08-02', '2022-08-02'),
(28, 2, '2022-08-02', 1391, 1036, 0, 50, '2022-08-02', '2022-08-02'),
(29, 2, '2022-08-02', 1395, 1036, 0, 50, '2022-08-02', '2022-08-02'),
(30, 2, '2022-08-02', 1396, 1036, 0, 50, '2022-08-02', '2022-08-02'),
(31, 2, '2022-08-02', 1397, 1036, 0, 50, '2022-08-02', '2022-08-02'),
(32, 2, '2022-08-02', 1398, 1036, 0, 50, '2022-08-02', '2022-08-02'),
(33, 2, '2022-08-02', 1399, 1036, 0, 50, '2022-08-02', '2022-08-02'),
(34, 3, '2022-08-02', 1399, 1036, 0, 50, '2022-08-02', '2022-08-02'),
(35, 3, '2022-08-02', 1391, 1036, 0, 50, '2022-08-02', '2022-08-02'),
(36, 3, '2022-08-02', 1395, 1036, 0, 50, '2022-08-02', '2022-08-02'),
(37, 3, '2022-08-02', 1396, 1036, 0, 50, '2022-08-02', '2022-08-02'),
(38, 3, '2022-08-02', 1397, 1036, 0, 50, '2022-08-02', '2022-08-02'),
(39, 3, '2022-08-02', 1398, 1036, 0, 50, '2022-08-02', '2022-08-02'),
(40, 2, '2022-08-02', 1492, 1036, 0, 50, '2022-08-02', '2022-08-02'),
(41, 2, '2022-08-02', 1492, 1036, 0, 50, '2022-08-02', '2022-08-02'),
(42, 2, '2022-08-02', 1495, 1036, 0, 50, '2022-08-02', '2022-08-02'),
(43, 3, '2022-08-02', 1480, 1036, 0, 50, '2022-08-02', '2022-08-02'),
(44, 3, '2022-08-02', 1495, 1036, 0, 50, '2022-08-02', '2022-08-02'),
(45, 3, '2022-08-02', 1492, 1036, 0, 50, '2022-08-02', '2022-08-02'),
(46, 3, '2022-08-02', 1492, 1036, 0, 50, '2022-08-02', '2022-08-02'),
(47, 2, '2022-08-02', 1506, 1036, 0, 50, '2022-08-02', '2022-08-02'),
(48, 2, '2022-08-02', 1507, 1036, 0, 50, '2022-08-02', '2022-08-02'),
(49, 2, '2022-08-02', 1509, 1036, 0, 50, '2022-08-02', '2022-08-02'),
(50, 3, '2022-08-02', 1509, 1036, 0, 50, '2022-08-02', '2022-08-02'),
(51, 3, '2022-08-02', 1506, 1036, 0, 50, '2022-08-02', '2022-08-02'),
(52, 3, '2022-08-02', 1507, 1036, 0, 50, '2022-08-02', '2022-08-02'),
(53, 2, '2022-08-02', 1513, 1036, 0, 50, '2022-08-02', '2022-08-02'),
(54, 2, '2022-08-02', 1514, 1036, 0, 50, '2022-08-02', '2022-08-02'),
(55, 2, '2022-08-02', 1515, 1036, 0, 50, '2022-08-02', '2022-08-02'),
(56, 3, '2022-08-02', 1513, 1036, 0, 50, '2022-08-02', '2022-08-02'),
(57, 3, '2022-08-02', 1514, 1036, 0, 50, '2022-08-02', '2022-08-02'),
(58, 3, '2022-08-02', 1515, 1036, 0, 50, '2022-08-02', '2022-08-02'),
(59, 2, '2022-08-02', 1527, 1036, 0, 50, '2022-08-02', '2022-08-02'),
(60, 2, '2022-08-02', 1528, 1036, 0, 50, '2022-08-02', '2022-08-02'),
(61, 3, '2022-08-02', 1528, 1036, 0, 50, '2022-08-02', '2022-08-02'),
(62, 3, '2022-08-02', 1527, 1036, 0, 50, '2022-08-02', '2022-08-02'),
(63, 2, '2022-08-02', 1531, 1036, 0, 50, '2022-08-02', '2022-08-02'),
(64, 2, '2022-08-02', 1534, 1036, 0, 50, '2022-08-02', '2022-08-02'),
(65, 2, '2022-08-02', 1535, 1036, 0, 50, '2022-08-02', '2022-08-02'),
(66, 3, '2022-08-02', 1535, 1036, 0, 50, '2022-08-02', '2022-08-02'),
(67, 3, '2022-08-02', 1531, 1036, 0, 50, '2022-08-02', '2022-08-02'),
(68, 3, '2022-08-02', 1534, 1036, 0, 50, '2022-08-02', '2022-08-02'),
(69, 2, '2022-08-02', 1539, 1036, 0, 50, '2022-08-02', '2022-08-02'),
(70, 2, '2022-08-02', 1544, 1036, 0, 50, '2022-08-02', '2022-08-02'),
(71, 3, '2022-08-02', 1544, 1036, 0, 50, '2022-08-02', '2022-08-02'),
(72, 3, '2022-08-02', 1539, 1036, 0, 50, '2022-08-02', '2022-08-02'),
(73, 2, '2022-08-02', 1553, 1036, 0, 50, '2022-08-02', '2022-08-02'),
(74, 2, '2022-08-02', 1554, 1036, 0, 50, '2022-08-02', '2022-08-02'),
(75, 2, '2022-08-02', 1555, 1036, 0, 50, '2022-08-02', '2022-08-02'),
(76, 3, '2022-08-02', 1555, 1036, 0, 50, '2022-08-02', '2022-08-02'),
(77, 3, '2022-08-02', 1554, 1036, 0, 50, '2022-08-02', '2022-08-02'),
(78, 3, '2022-08-02', 1553, 1036, 0, 50, '2022-08-02', '2022-08-02'),
(79, 2, '2022-08-02', 1557, 1036, 0, 50, '2022-08-02', '2022-08-02'),
(80, 2, '2022-08-02', 1560, 1036, 0, 50, '2022-08-02', '2022-08-02'),
(81, 2, '2022-08-02', 1561, 1036, 0, 50, '2022-08-02', '2022-08-02'),
(82, 2, '2022-08-02', 1562, 1036, 0, 50, '2022-08-02', '2022-08-02'),
(83, 3, '2022-08-02', 1562, 1036, 0, 50, '2022-08-02', '2022-08-02'),
(84, 3, '2022-08-02', 1561, 1036, 0, 50, '2022-08-02', '2022-08-02'),
(85, 3, '2022-08-02', 1557, 1036, 0, 50, '2022-08-02', '2022-08-02'),
(86, 3, '2022-08-02', 1560, 1036, 0, 50, '2022-08-02', '2022-08-02'),
(87, 2, '2022-08-02', 1566, 1036, 0, 50, '2022-08-02', '2022-08-02'),
(88, 2, '2022-08-02', 1571, 1036, 0, 50, '2022-08-02', '2022-08-02'),
(89, 2, '2022-08-02', 1575, 1036, 0, 50, '2022-08-02', '2022-08-02'),
(90, 3, '2022-08-02', 1575, 1036, 0, 50, '2022-08-02', '2022-08-02'),
(91, 3, '2022-08-02', 1571, 1036, 0, 50, '2022-08-02', '2022-08-02'),
(92, 3, '2022-08-02', 1566, 1036, 0, 50, '2022-08-02', '2022-08-02'),
(93, 2, '2022-08-02', 1578, 1036, 0, 50, '2022-08-02', '2022-08-02'),
(94, 2, '2022-08-02', 1580, 1036, 0, 50, '2022-08-02', '2022-08-02'),
(95, 2, '2022-08-02', 1581, 1036, 0, 50, '2022-08-02', '2022-08-02'),
(96, 2, '2022-08-02', 1582, 1036, 0, 50, '2022-08-02', '2022-08-02'),
(97, 3, '2022-08-02', 1582, 1036, 0, 50, '2022-08-02', '2022-08-02'),
(98, 3, '2022-08-02', 1580, 1036, 0, 50, '2022-08-02', '2022-08-02'),
(99, 3, '2022-08-02', 1578, 1036, 0, 50, '2022-08-02', '2022-08-02'),
(100, 3, '2022-08-02', 1581, 1036, 0, 50, '2022-08-02', '2022-08-02'),
(101, 2, '2022-08-03', 1587, 1036, 0, 50, '2022-08-03', '2022-08-03'),
(102, 2, '2022-08-03', 1588, 1036, 0, 50, '2022-08-03', '2022-08-03'),
(103, 2, '2022-08-03', 1589, 1036, 0, 50, '2022-08-03', '2022-08-03'),
(104, 2, '2022-08-03', 1590, 1036, 0, 50, '2022-08-03', '2022-08-03'),
(105, 2, '2022-08-03', 1591, 1036, 0, 50, '2022-08-03', '2022-08-03'),
(106, 3, '2022-08-03', 1587, 1036, 0, 50, '2022-08-03', '2022-08-03'),
(107, 3, '2022-08-03', 1588, 1036, 0, 50, '2022-08-03', '2022-08-03'),
(108, 3, '2022-08-03', 1589, 1036, 0, 50, '2022-08-03', '2022-08-03'),
(109, 3, '2022-08-03', 1590, 1036, 0, 50, '2022-08-03', '2022-08-03'),
(110, 3, '2022-08-03', 1591, 1036, 0, 50, '2022-08-03', '2022-08-03'),
(111, 2, '2022-08-03', 1300, 1036, 0, 50, '2022-08-03', '2022-08-03'),
(112, 2, '2022-08-03', 1301, 1036, 0, 50, '2022-08-03', '2022-08-03'),
(113, 3, '2022-08-03', 1300, 1036, 0, 50, '2022-08-03', '2022-08-03'),
(114, 3, '2022-08-03', 1301, 1036, 0, 50, '2022-08-03', '2022-08-03'),
(115, 2, '2022-08-03', 1305, 1036, 0, 50, '2022-08-03', '2022-08-03'),
(116, 3, '2022-08-03', 1305, 1036, 0, 50, '2022-08-03', '2022-08-03'),
(117, 2, '2022-08-03', 1701, 1036, 0, 50, '2022-08-03', '2022-08-03'),
(118, 3, '2022-08-03', 1701, 1036, 0, 50, '2022-08-03', '2022-08-03'),
(119, 2, '2022-08-03', 1706, 1036, 0, 50, '2022-08-03', '2022-08-03'),
(120, 2, '2022-08-03', 1708, 1036, 0, 50, '2022-08-03', '2022-08-03'),
(121, 3, '2022-08-03', 1706, 1036, 0, 50, '2022-08-03', '2022-08-03'),
(122, 3, '2022-08-03', 1708, 1036, 0, 50, '2022-08-03', '2022-08-03'),
(123, 2, '2022-08-03', 1712, 1036, 0, 50, '2022-08-03', '2022-08-03'),
(124, 2, '2022-08-03', 1714, 1036, 0, 50, '2022-08-03', '2022-08-03'),
(125, 2, '2022-08-03', 1720, 1036, 0, 50, '2022-08-03', '2022-08-03'),
(126, 2, '2022-08-03', 1727, 1036, 0, 50, '2022-08-03', '2022-08-03'),
(127, 2, '2022-08-03', 1729, 1036, 0, 50, '2022-08-03', '2022-08-03'),
(128, 2, '2022-08-03', 1730, 1036, 0, 50, '2022-08-03', '2022-08-03'),
(129, 2, '2022-08-03', 1130, 1036, 0, 50, '2022-08-03', '2022-08-03'),
(130, 2, '2022-08-03', 1131, 1036, 0, 50, '2022-08-03', '2022-08-03'),
(131, 2, '2022-08-03', 1140, 1036, 0, 50, '2022-08-03', '2022-08-03'),
(132, 3, '2022-08-03', 1712, 1036, 0, 50, '2022-08-03', '2022-08-03'),
(133, 3, '2022-08-03', 1714, 1036, 0, 50, '2022-08-03', '2022-08-03'),
(134, 3, '2022-08-03', 1720, 1036, 0, 50, '2022-08-03', '2022-08-03'),
(135, 3, '2022-08-03', 1727, 1036, 0, 50, '2022-08-03', '2022-08-03'),
(136, 3, '2022-08-03', 1729, 1036, 0, 50, '2022-08-03', '2022-08-03'),
(137, 3, '2022-08-03', 1730, 1036, 0, 50, '2022-08-03', '2022-08-03'),
(138, 3, '2022-08-03', 1130, 1036, 0, 50, '2022-08-03', '2022-08-03'),
(139, 3, '2022-08-03', 1131, 1036, 0, 50, '2022-08-03', '2022-08-03'),
(140, 3, '2022-08-03', 1140, 1036, 0, 50, '2022-08-03', '2022-08-03'),
(141, 2, '2022-08-03', 1142, 1036, 0, 50, '2022-08-03', '2022-08-03'),
(142, 3, '2022-08-03', 1142, 1036, 0, 50, '2022-08-03', '2022-08-03'),
(143, 2, '2022-08-03', 1166, 1036, 0, 50, '2022-08-03', '2022-08-03'),
(144, 3, '2022-08-03', 1166, 1036, 0, 50, '2022-08-03', '2022-08-03'),
(145, 2, '2022-08-03', 1873, 1036, 0, 50, '2022-08-03', '2022-08-03'),
(146, 3, '2022-08-03', 1873, 1036, 0, 50, '2022-08-03', '2022-08-03');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `daily_reward_history`
--

CREATE TABLE `daily_reward_history` (
  `id` int(10) UNSIGNED NOT NULL,
  `daystreak` smallint(6) NOT NULL DEFAULT 0,
  `player_id` int(11) NOT NULL,
  `timestamp` int(11) NOT NULL,
  `description` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `forge_history`
--

CREATE TABLE `forge_history` (
  `id` int(11) NOT NULL,
  `player_id` int(11) NOT NULL,
  `timestamp` int(11) NOT NULL,
  `description` text NOT NULL,
  `result` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `free_pass`
--

CREATE TABLE `free_pass` (
  `player_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `global_storage`
--

CREATE TABLE `global_storage` (
  `key` varchar(32) NOT NULL,
  `value` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `global_storage`
--

INSERT INTO `global_storage` (`key`, `value`) VALUES
('14110', '1663905901');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `guilds`
--

CREATE TABLE `guilds` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `ownerid` int(11) NOT NULL,
  `creationdata` bigint(20) NOT NULL,
  `motd` varchar(255) NOT NULL DEFAULT '',
  `residence` int(11) DEFAULT 0,
  `description` text NOT NULL,
  `guild_logo` mediumblob DEFAULT NULL,
  `create_ip` bigint(20) NOT NULL DEFAULT 0,
  `balance` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `last_execute_points` bigint(20) NOT NULL DEFAULT 0,
  `logo_name` varchar(255) NOT NULL DEFAULT 'default.gif',
  `level` int(11) NOT NULL DEFAULT 1,
  `points` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Disparadores `guilds`
--
DELIMITER $$
CREATE TRIGGER `oncreate_guilds` AFTER INSERT ON `guilds` FOR EACH ROW BEGIN
    INSERT INTO `guild_ranks` (`name`, `level`, `guild_id`) VALUES ('The Leader', 3, NEW.`id`);
    INSERT INTO `guild_ranks` (`name`, `level`, `guild_id`) VALUES ('Vice-Leader', 2, NEW.`id`);
    INSERT INTO `guild_ranks` (`name`, `level`, `guild_id`) VALUES ('Member', 1, NEW.`id`);
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `guildwar_kills`
--

CREATE TABLE `guildwar_kills` (
  `id` int(11) NOT NULL,
  `killer` varchar(50) NOT NULL,
  `target` varchar(50) NOT NULL,
  `killerguild` int(11) NOT NULL DEFAULT 0,
  `targetguild` int(11) NOT NULL DEFAULT 0,
  `warid` int(11) NOT NULL DEFAULT 0,
  `time` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `guild_actions_h`
--

CREATE TABLE `guild_actions_h` (
  `id` int(10) UNSIGNED NOT NULL,
  `guild_id` int(11) DEFAULT NULL,
  `player_id` int(11) NOT NULL,
  `value` int(11) NOT NULL,
  `date` bigint(20) DEFAULT NULL,
  `type` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `guild_invites`
--

CREATE TABLE `guild_invites` (
  `player_id` int(11) NOT NULL DEFAULT 0,
  `guild_id` int(11) NOT NULL DEFAULT 0,
  `date` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `guild_membership`
--

CREATE TABLE `guild_membership` (
  `player_id` int(11) NOT NULL,
  `guild_id` int(11) NOT NULL,
  `rank_id` int(11) NOT NULL,
  `nick` varchar(15) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `guild_ranks`
--

CREATE TABLE `guild_ranks` (
  `id` int(11) NOT NULL,
  `guild_id` int(11) NOT NULL COMMENT 'guild',
  `name` varchar(255) NOT NULL COMMENT 'rank name',
  `level` int(11) NOT NULL COMMENT 'rank level - leader, vice, member, maybe something else'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `guild_transfer_h`
--

CREATE TABLE `guild_transfer_h` (
  `id` int(10) UNSIGNED NOT NULL,
  `player_id` int(11) NOT NULL,
  `from_guild_id` int(11) NOT NULL,
  `to_guild_id` int(11) NOT NULL,
  `value` int(11) NOT NULL,
  `date` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `guild_wars`
--

CREATE TABLE `guild_wars` (
  `id` int(11) NOT NULL,
  `guild1` int(11) NOT NULL DEFAULT 0,
  `guild2` int(11) NOT NULL DEFAULT 0,
  `name1` varchar(255) NOT NULL,
  `name2` varchar(255) NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 0,
  `started` bigint(20) NOT NULL DEFAULT 0,
  `ended` bigint(20) NOT NULL DEFAULT 0,
  `frags_limit` int(11) DEFAULT 20
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `houses`
--

CREATE TABLE `houses` (
  `id` int(11) NOT NULL,
  `owner` int(11) NOT NULL,
  `paid` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `warnings` int(11) NOT NULL DEFAULT 0,
  `name` varchar(255) NOT NULL,
  `rent` int(11) NOT NULL DEFAULT 0,
  `town_id` int(11) NOT NULL DEFAULT 0,
  `bid` int(11) NOT NULL DEFAULT 0,
  `bid_end` int(11) NOT NULL DEFAULT 0,
  `last_bid` int(11) NOT NULL DEFAULT 0,
  `highest_bidder` int(11) NOT NULL DEFAULT 0,
  `size` int(11) NOT NULL DEFAULT 0,
  `guildid` int(11) DEFAULT NULL,
  `beds` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `houses`
--

INSERT INTO `houses` (`id`, `owner`, `paid`, `warnings`, `name`, `rent`, `town_id`, `bid`, `bid_end`, `last_bid`, `highest_bidder`, `size`, `guildid`, `beds`) VALUES
(2628, 0, 1648877860, 0, 'Castle of the Winds', 500000, 5, 0, 0, 0, 0, 863, NULL, 0),
(2629, 0, 0, 0, 'Ab\'Dendriel Clanhall', 250000, 5, 0, 0, 0, 0, 456, NULL, 0),
(2630, 0, 1648877860, 0, 'Underwood 9', 50000, 5, 0, 0, 0, 0, 29, NULL, 0),
(2631, 0, 1648877860, 0, 'Treetop 13', 100000, 5, 0, 0, 0, 0, 45, NULL, 0),
(2632, 0, 1648877860, 0, 'Underwood 8', 50000, 5, 0, 0, 0, 0, 33, NULL, 0),
(2633, 0, 1648877860, 0, 'Treetop 11', 50000, 5, 0, 0, 0, 0, 34, NULL, 0),
(2635, 0, 1648877860, 0, 'Great Willow 2a', 50000, 5, 0, 0, 0, 0, 34, NULL, 0),
(2637, 0, 1648877860, 0, 'Great Willow 2b', 50000, 5, 0, 0, 0, 0, 29, NULL, 0),
(2638, 0, 1648877860, 0, 'Great Willow Western Wing', 100000, 5, 0, 0, 0, 0, 90, NULL, 0),
(2640, 0, 1648877860, 0, 'Great Willow 1', 100000, 5, 0, 0, 0, 0, 55, NULL, 0),
(2642, 0, 1648877860, 0, 'Great Willow 3a', 50000, 5, 0, 0, 0, 0, 33, NULL, 0),
(2644, 0, 1648877860, 0, 'Great Willow 3b', 80000, 5, 0, 0, 0, 0, 52, NULL, 0),
(2645, 0, 1648877860, 0, 'Great Willow 4a', 25000, 5, 0, 0, 0, 0, 27, NULL, 0),
(2648, 0, 1648877860, 0, 'Great Willow 4b', 25000, 5, 0, 0, 0, 0, 31, NULL, 0),
(2649, 0, 1648877860, 0, 'Underwood 6', 100000, 5, 0, 0, 0, 0, 55, NULL, 0),
(2650, 0, 1648877860, 0, 'Underwood 3', 100000, 5, 0, 0, 0, 0, 56, NULL, 0),
(2651, 0, 1648877860, 0, 'Underwood 5', 80000, 5, 0, 0, 0, 0, 49, NULL, 0),
(2652, 0, 1648877860, 0, 'Underwood 2', 100000, 5, 0, 0, 0, 0, 53, NULL, 0),
(2653, 0, 1648877860, 0, 'Underwood 1', 100000, 5, 0, 0, 0, 0, 54, NULL, 0),
(2654, 0, 0, 0, 'Prima Arbor', 400000, 5, 0, 0, 0, 0, 316, NULL, 0),
(2655, 0, 0, 0, 'Underwood 7', 200000, 5, 0, 0, 0, 0, 52, NULL, 0),
(2656, 0, 1648877860, 0, 'Underwood 10', 25000, 5, 0, 0, 0, 0, 30, NULL, 0),
(2657, 0, 1648877860, 0, 'Underwood 4', 100000, 5, 0, 0, 0, 0, 72, NULL, 0),
(2658, 0, 1648877860, 0, 'Treetop 9', 50000, 5, 0, 0, 0, 0, 35, NULL, 0),
(2659, 0, 1648877860, 0, 'Treetop 10', 80000, 5, 0, 0, 0, 0, 42, NULL, 0),
(2660, 0, 1648877860, 0, 'Treetop 8', 25000, 5, 0, 0, 0, 0, 35, NULL, 0),
(2661, 0, 1648877860, 0, 'Treetop 7', 50000, 5, 0, 0, 0, 0, 28, NULL, 0),
(2662, 0, 1648877860, 0, 'Treetop 6', 25000, 5, 0, 0, 0, 0, 24, NULL, 0),
(2663, 0, 1648877860, 0, 'Treetop 5 (Shop)', 80000, 5, 0, 0, 0, 0, 54, NULL, 0),
(2664, 0, 1648877860, 0, 'Treetop 12 (Shop)', 100000, 5, 0, 0, 0, 0, 56, NULL, 0),
(2665, 0, 1648877860, 0, 'Treetop 4 (Shop)', 80000, 5, 0, 0, 0, 0, 48, NULL, 0),
(2666, 0, 1648877860, 0, 'Treetop 3 (Shop)', 80000, 5, 0, 0, 0, 0, 60, NULL, 0),
(2687, 0, 1648877860, 0, 'Northern Street 1a', 100000, 6, 0, 0, 0, 0, 42, NULL, 0),
(2688, 0, 1648877860, 0, 'Park Lane 3a', 100000, 6, 0, 0, 0, 0, 48, NULL, 0),
(2689, 0, 0, 0, 'Park Lane 1a', 150000, 6, 0, 0, 0, 0, 53, NULL, 0),
(2690, 0, 1648877860, 0, 'Park Lane 4', 150000, 6, 0, 0, 0, 0, 42, NULL, 0),
(2691, 0, 1648877860, 0, 'Park Lane 2', 150000, 6, 0, 0, 0, 0, 42, NULL, 0),
(2692, 0, 1648877860, 0, 'Theater Avenue 7, Flat 04', 50000, 6, 0, 0, 0, 0, 20, NULL, 0),
(2693, 0, 1648877860, 0, 'Theater Avenue 7, Flat 03', 25000, 6, 0, 0, 0, 0, 19, NULL, 0),
(2694, 0, 1648877860, 0, 'Theater Avenue 7, Flat 05', 50000, 6, 0, 0, 0, 0, 20, NULL, 0),
(2695, 0, 1648877860, 0, 'Theater Avenue 7, Flat 06', 25000, 6, 0, 0, 0, 0, 20, NULL, 0),
(2696, 0, 1648877860, 0, 'Theater Avenue 7, Flat 02', 25000, 6, 0, 0, 0, 0, 20, NULL, 0),
(2697, 0, 1648877860, 0, 'Theater Avenue 7, Flat 01', 25000, 6, 0, 0, 0, 0, 20, NULL, 0),
(2698, 0, 1648877860, 0, 'Northern Street 5', 200000, 6, 0, 0, 0, 0, 68, NULL, 0),
(2699, 0, 1648877860, 0, 'Northern Street 7', 150000, 6, 0, 0, 0, 0, 59, NULL, 0),
(2700, 0, 0, 0, 'Theater Avenue 6e', 80000, 6, 0, 0, 0, 0, 31, NULL, 0),
(2701, 0, 1648877860, 0, 'Theater Avenue 6c', 25000, 6, 0, 0, 0, 0, 12, NULL, 0),
(2702, 0, 0, 0, 'Theater Avenue 6a', 80000, 6, 0, 0, 0, 0, 35, NULL, 0),
(2703, 0, 1648877860, 0, 'Theater Avenue, Tower', 300000, 6, 0, 0, 0, 0, 125, NULL, 0),
(2705, 0, 1648877860, 0, 'East Lane 2', 300000, 6, 0, 0, 0, 0, 111, NULL, 0),
(2706, 0, 1648877860, 0, 'Harbour Lane 2a (Shop)', 80000, 6, 0, 0, 0, 0, 32, NULL, 0),
(2707, 0, 1648877860, 0, 'Harbour Lane 2b (Shop)', 80000, 6, 0, 0, 0, 0, 40, NULL, 0),
(2708, 0, 0, 0, 'Harbour Lane 3', 400000, 6, 0, 0, 0, 0, 113, NULL, 0),
(2709, 0, 1648877860, 0, 'Magician\'s Alley 8', 150000, 6, 0, 0, 0, 0, 49, NULL, 0),
(2710, 0, 1648877860, 0, 'Lonely Sea Side Hostel', 400000, 6, 0, 0, 0, 0, 397, NULL, 0),
(2711, 0, 0, 0, 'Suntower', 500000, 6, 0, 0, 0, 0, 451, NULL, 0),
(2712, 0, 0, 0, 'House of Recreation', 500000, 6, 0, 0, 0, 0, 687, NULL, 0),
(2713, 0, 0, 0, 'Carlin Clanhall', 250000, 6, 0, 0, 0, 0, 374, NULL, 0),
(2714, 0, 1648877860, 0, 'Magician\'s Alley 4', 200000, 6, 0, 0, 0, 0, 96, NULL, 0),
(2715, 0, 1648877860, 0, 'Theater Avenue 14 (Shop)', 200000, 6, 0, 0, 0, 0, 83, NULL, 0),
(2716, 0, 1648877860, 0, 'Theater Avenue 12', 80000, 6, 0, 0, 0, 0, 28, NULL, 0),
(2717, 0, 1648877860, 0, 'Magician\'s Alley 1', 100000, 6, 0, 0, 0, 0, 35, NULL, 0),
(2718, 0, 1648877860, 0, 'Theater Avenue 10', 100000, 6, 0, 0, 0, 0, 45, NULL, 0),
(2719, 0, 1648877860, 0, 'Magician\'s Alley 1b', 25000, 6, 0, 0, 0, 0, 24, NULL, 0),
(2720, 0, 1648877860, 0, 'Magician\'s Alley 1a', 25000, 6, 0, 0, 0, 0, 28, NULL, 0),
(2721, 0, 1648877860, 0, 'Magician\'s Alley 1c', 25000, 6, 0, 0, 0, 0, 20, NULL, 0),
(2722, 0, 1648877860, 0, 'Magician\'s Alley 1d', 25000, 6, 0, 0, 0, 0, 24, NULL, 0),
(2723, 0, 1648877860, 0, 'Magician\'s Alley 5c', 100000, 6, 0, 0, 0, 0, 35, NULL, 0),
(2724, 0, 1648877860, 0, 'Magician\'s Alley 5f', 80000, 6, 0, 0, 0, 0, 42, NULL, 0),
(2725, 0, 1648877860, 0, 'Magician\'s Alley 5b', 50000, 6, 0, 0, 0, 0, 40, NULL, 0),
(2727, 0, 1648877860, 0, 'Magician\'s Alley 5a', 50000, 6, 0, 0, 0, 0, 45, NULL, 0),
(2729, 0, 1648877860, 0, 'Central Plaza 3 (Shop)', 50000, 6, 0, 0, 0, 0, 24, NULL, 0),
(2730, 0, 1648877860, 0, 'Central Plaza 2 (Shop)', 25000, 6, 0, 0, 0, 0, 24, NULL, 0),
(2731, 0, 1648877860, 0, 'Central Plaza 1 (Shop)', 50000, 6, 0, 0, 0, 0, 24, NULL, 0),
(2732, 0, 1648877860, 0, 'Theater Avenue 8b', 100000, 6, 0, 0, 0, 0, 49, NULL, 0),
(2733, 0, 0, 0, 'Harbour Lane 1 (Shop)', 100000, 6, 0, 0, 0, 0, 54, NULL, 0),
(2734, 0, 1648877860, 0, 'Theater Avenue 6f', 80000, 6, 0, 0, 0, 0, 31, NULL, 0),
(2735, 0, 1648877860, 0, 'Theater Avenue 6d', 25000, 6, 0, 0, 0, 0, 12, NULL, 0),
(2736, 0, 1648877860, 0, 'Theater Avenue 6b', 50000, 6, 0, 0, 0, 0, 35, NULL, 0),
(2737, 0, 1648877860, 0, 'Northern Street 3a', 80000, 6, 0, 0, 0, 0, 34, NULL, 0),
(2738, 0, 1648877860, 0, 'Northern Street 3b', 80000, 6, 0, 0, 0, 0, 36, NULL, 0),
(2739, 0, 1648877860, 0, 'Northern Street 1b', 80000, 6, 0, 0, 0, 0, 37, NULL, 0),
(2740, 0, 1648877860, 0, 'Northern Street 1c', 80000, 6, 0, 0, 0, 0, 35, NULL, 0),
(2741, 0, 1648877860, 0, 'Theater Avenue 7, Flat 14', 25000, 6, 0, 0, 0, 0, 20, NULL, 0),
(2742, 0, 1648877860, 0, 'Theater Avenue 7, Flat 13', 25000, 6, 0, 0, 0, 0, 20, NULL, 0),
(2743, 0, 1648877860, 0, 'Theater Avenue 7, Flat 15', 25000, 6, 0, 0, 0, 0, 20, NULL, 0),
(2744, 0, 1648877860, 0, 'Theater Avenue 7, Flat 12', 25000, 6, 0, 0, 0, 0, 20, NULL, 0),
(2745, 0, 1648877860, 0, 'Theater Avenue 7, Flat 11', 50000, 6, 0, 0, 0, 0, 24, NULL, 0),
(2746, 0, 1648877860, 0, 'Theater Avenue 7, Flat 16', 25000, 6, 0, 0, 0, 0, 24, NULL, 0),
(2747, 0, 1648877860, 0, 'Theater Avenue 5', 200000, 6, 0, 0, 0, 0, 165, NULL, 0),
(2751, 0, 1648877860, 0, 'Harbour Flats, Flat 11', 25000, 6, 0, 0, 0, 0, 24, NULL, 0),
(2752, 0, 1648877860, 0, 'Harbour Flats, Flat 13', 25000, 6, 0, 0, 0, 0, 24, NULL, 0),
(2753, 0, 1648877860, 0, 'Harbour Flats, Flat 15', 50000, 6, 0, 0, 0, 0, 38, NULL, 0),
(2755, 0, 1648877860, 0, 'Harbour Flats, Flat 12', 50000, 6, 0, 0, 0, 0, 40, NULL, 0),
(2757, 0, 1648877860, 0, 'Harbour Flats, Flat 16', 50000, 6, 0, 0, 0, 0, 45, NULL, 0),
(2759, 0, 1648877860, 0, 'Harbour Flats, Flat 21', 50000, 6, 0, 0, 0, 0, 35, NULL, 0),
(2760, 0, 1648877860, 0, 'Harbour Flats, Flat 22', 80000, 6, 0, 0, 0, 0, 45, NULL, 0),
(2761, 0, 1648877860, 0, 'Harbour Flats, Flat 23', 25000, 6, 0, 0, 0, 0, 25, NULL, 0),
(2763, 0, 0, 0, 'Park Lane 1b', 200000, 6, 0, 0, 0, 0, 54, NULL, 0),
(2764, 0, 1648877860, 0, 'Theater Avenue 8a', 100000, 6, 0, 0, 0, 0, 49, NULL, 0),
(2765, 0, 1648877860, 0, 'Theater Avenue 11a', 100000, 6, 0, 0, 0, 0, 48, NULL, 0),
(2767, 0, 1648877860, 0, 'Theater Avenue 11b', 100000, 6, 0, 0, 0, 0, 54, NULL, 0),
(2768, 0, 0, 0, 'Caretaker\'s Residence', 600000, 6, 0, 0, 0, 0, 423, NULL, 0),
(2769, 0, 0, 0, 'Moonkeep', 250000, 6, 0, 0, 0, 0, 518, NULL, 0),
(2770, 0, 1648877860, 0, 'Mangrove 1', 80000, 5, 0, 0, 0, 0, 56, NULL, 0),
(2771, 0, 1648877860, 0, 'Coastwood 2', 50000, 5, 0, 0, 0, 0, 28, NULL, 0),
(2772, 0, 1648877860, 0, 'Coastwood 1', 50000, 5, 0, 0, 0, 0, 35, NULL, 0),
(2773, 0, 1648877860, 0, 'Coastwood 3', 50000, 5, 0, 0, 0, 0, 37, NULL, 0),
(2774, 0, 1648877860, 0, 'Coastwood 4', 50000, 5, 0, 0, 0, 0, 42, NULL, 0),
(2775, 0, 1648877860, 0, 'Mangrove 4', 50000, 5, 0, 0, 0, 0, 36, NULL, 0),
(2776, 0, 1648877860, 0, 'Coastwood 10', 80000, 5, 0, 0, 0, 0, 49, NULL, 0),
(2777, 0, 1648877860, 0, 'Coastwood 5', 50000, 5, 0, 0, 0, 0, 49, NULL, 0),
(2778, 0, 1648877860, 0, 'Coastwood 6 (Shop)', 80000, 5, 0, 0, 0, 0, 48, NULL, 0),
(2779, 0, 1648877860, 0, 'Coastwood 7', 25000, 5, 0, 0, 0, 0, 29, NULL, 0),
(2780, 0, 1648877860, 0, 'Coastwood 8', 50000, 5, 0, 0, 0, 0, 42, NULL, 0),
(2781, 0, 1648877860, 0, 'Coastwood 9', 50000, 5, 0, 0, 0, 0, 36, NULL, 0),
(2782, 0, 1648877860, 0, 'Treetop 2', 25000, 5, 0, 0, 0, 0, 24, NULL, 0),
(2783, 0, 1648877860, 0, 'Treetop 1', 25000, 5, 0, 0, 0, 0, 30, NULL, 0),
(2784, 0, 1648877860, 0, 'Mangrove 3', 80000, 5, 0, 0, 0, 0, 42, NULL, 0),
(2785, 0, 1648877860, 0, 'Mangrove 2', 50000, 5, 0, 0, 0, 0, 48, NULL, 0),
(2786, 0, 1648877860, 0, 'The Hideout', 250000, 5, 0, 0, 0, 0, 584, NULL, 0),
(2787, 0, 1648877860, 0, 'Shadow Towers', 250000, 5, 0, 0, 0, 0, 708, NULL, 0),
(2788, 0, 1648877860, 0, 'Druids Retreat A', 50000, 6, 0, 0, 0, 0, 60, NULL, 0),
(2789, 0, 1648877860, 0, 'Druids Retreat C', 50000, 6, 0, 0, 0, 0, 45, NULL, 0),
(2790, 0, 1648877860, 0, 'Druids Retreat B', 50000, 6, 0, 0, 0, 0, 56, NULL, 0),
(2791, 0, 1648877860, 0, 'Druids Retreat D', 80000, 6, 0, 0, 0, 0, 51, NULL, 0),
(2792, 0, 1648877860, 0, 'East Lane 1b', 150000, 6, 0, 0, 0, 0, 53, NULL, 0),
(2793, 0, 1648877860, 0, 'East Lane 1a', 200000, 6, 0, 0, 0, 0, 87, NULL, 0),
(2794, 0, 1648877860, 0, 'Senja Village 11', 80000, 6, 0, 0, 0, 0, 92, NULL, 0),
(2795, 0, 1648877860, 0, 'Senja Village 10', 50000, 6, 0, 0, 0, 0, 72, NULL, 0),
(2796, 0, 1648877860, 0, 'Senja Village 9', 80000, 6, 0, 0, 0, 0, 112, NULL, 0),
(2797, 0, 1648877860, 0, 'Senja Village 8', 50000, 6, 0, 0, 0, 0, 72, NULL, 0),
(2798, 0, 1648877860, 0, 'Senja Village 7', 25000, 6, 0, 0, 0, 0, 36, NULL, 0),
(2799, 0, 1648877860, 0, 'Senja Village 6b', 25000, 6, 0, 0, 0, 0, 30, NULL, 0),
(2800, 0, 1648877860, 0, 'Senja Village 6a', 50000, 6, 0, 0, 0, 0, 30, NULL, 0),
(2801, 0, 1648877860, 0, 'Senja Village 5', 50000, 6, 0, 0, 0, 0, 48, NULL, 0),
(2802, 0, 1648877860, 0, 'Senja Village 4', 50000, 6, 0, 0, 0, 0, 66, NULL, 0),
(2803, 0, 1648877860, 0, 'Senja Village 3', 50000, 6, 0, 0, 0, 0, 72, NULL, 0),
(2804, 0, 1648877860, 0, 'Senja Village 1b', 50000, 6, 0, 0, 0, 0, 66, NULL, 0),
(2805, 0, 1648877860, 0, 'Senja Village 1a', 25000, 6, 0, 0, 0, 0, 36, NULL, 0),
(2806, 0, 1648877860, 0, 'Rosebud C', 100000, 6, 0, 0, 0, 0, 70, NULL, 0),
(2807, 0, 1648877860, 0, 'Rosebud B', 80000, 6, 0, 0, 0, 0, 60, NULL, 0),
(2808, 0, 1648877860, 0, 'Rosebud A', 50000, 6, 0, 0, 0, 0, 60, NULL, 0),
(2809, 0, 1648877860, 0, 'Park Lane 3b', 100000, 6, 0, 0, 0, 0, 48, NULL, 0),
(2810, 0, 1648877860, 0, 'Northport Village 6', 80000, 6, 0, 0, 0, 0, 64, NULL, 0),
(2811, 0, 0, 0, 'Northport Village 5', 80000, 6, 0, 0, 0, 0, 56, NULL, 0),
(2812, 0, 1648877860, 0, 'Northport Village 4', 100000, 6, 0, 0, 0, 0, 92, NULL, 0),
(2813, 0, 1648877860, 0, 'Northport Village 3', 150000, 6, 0, 0, 0, 0, 119, NULL, 0),
(2814, 0, 1648877860, 0, 'Northport Village 2', 50000, 6, 0, 0, 0, 0, 40, NULL, 0),
(2815, 0, 1648877860, 0, 'Northport Village 1', 50000, 6, 0, 0, 0, 0, 48, NULL, 0),
(2816, 0, 1648877860, 0, 'Nautic Observer', 200000, 6, 0, 0, 0, 0, 226, NULL, 0),
(2817, 0, 1648877860, 0, 'Nordic Stronghold', 250000, 6, 0, 0, 0, 0, 809, NULL, 0),
(2818, 0, 1648877860, 0, 'Senja Clanhall', 250000, 6, 0, 0, 0, 0, 396, NULL, 0),
(2819, 0, 0, 0, 'Seawatch', 250000, 6, 0, 0, 0, 0, 749, NULL, 0),
(2820, 0, 1648877860, 0, 'Dwarven Magnate\'s Estate', 300000, 7, 0, 0, 0, 0, 395, NULL, 0),
(2821, 0, 1648877860, 0, 'Forge Master\'s Quarters', 300000, 7, 0, 0, 0, 0, 117, NULL, 0),
(2822, 0, 1648877860, 0, 'Upper Barracks 13', 25000, 7, 0, 0, 0, 0, 24, NULL, 0),
(2823, 0, 1648877860, 0, 'Upper Barracks 5', 80000, 7, 0, 0, 0, 0, 50, NULL, 0),
(2824, 0, 1648877860, 0, 'Upper Barracks 3', 80000, 7, 0, 0, 0, 0, 24, NULL, 0),
(2825, 0, 1648877860, 0, 'Upper Barracks 4', 50000, 7, 0, 0, 0, 0, 35, NULL, 0),
(2826, 0, 1648877860, 0, 'Upper Barracks 2', 80000, 7, 0, 0, 0, 0, 50, NULL, 0),
(2827, 0, 1648877860, 0, 'Upper Barracks 1', 50000, 7, 0, 0, 0, 0, 35, NULL, 0),
(2828, 0, 1648877860, 0, 'Tunnel Gardens 9', 150000, 7, 0, 0, 0, 0, 145, NULL, 0),
(2829, 0, 1648877860, 0, 'Tunnel Gardens 8', 25000, 7, 0, 0, 0, 0, 42, NULL, 0),
(2830, 0, 1648877860, 0, 'Tunnel Gardens 7', 50000, 7, 0, 0, 0, 0, 35, NULL, 0),
(2831, 0, 1648877860, 0, 'Tunnel Gardens 6', 25000, 7, 0, 0, 0, 0, 42, NULL, 0),
(2832, 0, 1648877860, 0, 'Tunnel Gardens 5', 25000, 7, 0, 0, 0, 0, 35, NULL, 0),
(2835, 0, 1648877860, 0, 'Tunnel Gardens 4', 80000, 7, 0, 0, 0, 0, 58, NULL, 0),
(2836, 0, 1648877860, 0, 'Tunnel Gardens 2', 80000, 7, 0, 0, 0, 0, 54, NULL, 0),
(2837, 0, 1648877860, 0, 'Tunnel Gardens 1', 80000, 7, 0, 0, 0, 0, 47, NULL, 0),
(2838, 0, 1648877860, 0, 'Tunnel Gardens 3', 80000, 7, 0, 0, 0, 0, 65, NULL, 0),
(2839, 0, 1648877860, 0, 'The Market 4 (Shop)', 80000, 7, 0, 0, 0, 0, 63, NULL, 0),
(2840, 0, 1648877860, 0, 'The Market 3 (Shop)', 80000, 7, 0, 0, 0, 0, 54, NULL, 0),
(2841, 0, 1648877860, 0, 'The Market 2 (Shop)', 50000, 7, 0, 0, 0, 0, 45, NULL, 0),
(2842, 0, 1648877860, 0, 'The Market 1 (Shop)', 25000, 7, 0, 0, 0, 0, 25, NULL, 0),
(2843, 0, 1648877860, 0, 'The Farms 6, Fishing Hut', 50000, 7, 0, 0, 0, 0, 42, NULL, 0),
(2844, 0, 1648877860, 0, 'The Farms 5', 50000, 7, 0, 0, 0, 0, 49, NULL, 0),
(2845, 0, 1648877860, 0, 'The Farms 4', 25000, 7, 0, 0, 0, 0, 49, NULL, 0),
(2846, 0, 1648877860, 0, 'The Farms 3', 80000, 7, 0, 0, 0, 0, 49, NULL, 0),
(2847, 0, 1648877860, 0, 'The Farms 2', 50000, 7, 0, 0, 0, 0, 49, NULL, 0),
(2849, 0, 1648877860, 0, 'The Farms 1', 80000, 7, 0, 0, 0, 0, 78, NULL, 0),
(2850, 0, 1648877860, 0, 'Outlaw Camp 14 (Shop)', 25000, 7, 0, 0, 0, 0, 35, NULL, 0),
(2852, 0, 1648877860, 0, 'Outlaw Camp 13 (Shop)', 50000, 7, 0, 0, 0, 0, 40, NULL, 0),
(2853, 0, 1648877860, 0, 'Outlaw Camp 9', 80000, 7, 0, 0, 0, 0, 40, NULL, 0),
(2854, 0, 1648877860, 0, 'Outlaw Camp 7', 25000, 7, 0, 0, 0, 0, 38, NULL, 0),
(2855, 0, 1648877860, 0, 'Outlaw Camp 4', 50000, 7, 0, 0, 0, 0, 40, NULL, 0),
(2856, 0, 1648877860, 0, 'Outlaw Camp 2', 50000, 7, 0, 0, 0, 0, 40, NULL, 0),
(2857, 0, 1648877860, 0, 'Outlaw Camp 3', 50000, 7, 0, 0, 0, 0, 35, NULL, 0),
(2858, 0, 1648877860, 0, 'Outlaw Camp 1', 80000, 7, 0, 0, 0, 0, 54, NULL, 0),
(2859, 0, 1648877860, 0, 'Nobility Quarter 5', 100000, 7, 0, 0, 0, 0, 143, NULL, 0),
(2860, 0, 1648877860, 0, 'Nobility Quarter 4', 50000, 7, 0, 0, 0, 0, 66, NULL, 0),
(2861, 0, 1648877860, 0, 'Nobility Quarter 3', 80000, 7, 0, 0, 0, 0, 56, NULL, 0),
(2862, 0, 1648877860, 0, 'Nobility Quarter 2', 50000, 7, 0, 0, 0, 0, 61, NULL, 0),
(2863, 0, 1648877860, 0, 'Nobility Quarter 1', 80000, 7, 0, 0, 0, 0, 64, NULL, 0),
(2864, 0, 1648877860, 0, 'Lower Barracks 10', 80000, 7, 0, 0, 0, 0, 50, NULL, 0),
(2865, 0, 1648877860, 0, 'Lower Barracks 9', 80000, 7, 0, 0, 0, 0, 50, NULL, 0),
(2866, 0, 1648877860, 0, 'Lower Barracks 8', 80000, 7, 0, 0, 0, 0, 50, NULL, 0),
(2867, 0, 1648877860, 0, 'Lower Barracks 1', 80000, 7, 0, 0, 0, 0, 50, NULL, 0),
(2868, 0, 1648877860, 0, 'Lower Barracks 2', 80000, 7, 0, 0, 0, 0, 50, NULL, 0),
(2869, 0, 1648877860, 0, 'Lower Barracks 3', 80000, 7, 0, 0, 0, 0, 50, NULL, 0),
(2870, 0, 1648877860, 0, 'Lower Barracks 4', 50000, 7, 0, 0, 0, 0, 50, NULL, 0),
(2871, 0, 1648877860, 0, 'Lower Barracks 5', 100000, 7, 0, 0, 0, 0, 100, NULL, 0),
(2872, 0, 1648877860, 0, 'Lower Barracks 6', 100000, 7, 0, 0, 0, 0, 100, NULL, 0),
(2873, 0, 1648877860, 0, 'Lower Barracks 7', 80000, 7, 0, 0, 0, 0, 50, NULL, 0),
(2874, 0, 0, 0, 'Wolftower', 500000, 7, 0, 0, 0, 0, 680, NULL, 0),
(2875, 0, 1648877860, 0, 'Riverspring', 250000, 7, 0, 0, 0, 0, 632, NULL, 0),
(2876, 0, 1648877860, 0, 'Outlaw Castle', 250000, 7, 0, 0, 0, 0, 356, NULL, 0),
(2877, 0, 1648877860, 0, 'Marble Guildhall', 250000, 7, 0, 0, 0, 0, 612, NULL, 0),
(2878, 0, 1648877860, 0, 'Iron Guildhall', 250000, 7, 0, 0, 0, 0, 534, NULL, 0),
(2879, 0, 1648877860, 0, 'Hill Hideout', 250000, 7, 0, 0, 0, 0, 395, NULL, 0),
(2880, 0, 1648877860, 0, 'Granite Guildhall', 250000, 7, 0, 0, 0, 0, 627, NULL, 0),
(2881, 0, 0, 0, 'Alai Flats, Flat 01', 50000, 8, 0, 0, 0, 0, 25, NULL, 0),
(2882, 0, 0, 0, 'Alai Flats, Flat 02', 50000, 8, 0, 0, 0, 0, 35, NULL, 0),
(2883, 0, 0, 0, 'Alai Flats, Flat 03', 50000, 8, 0, 0, 0, 0, 36, NULL, 0),
(2884, 0, 0, 0, 'Alai Flats, Flat 04', 80000, 8, 0, 0, 0, 0, 30, NULL, 0),
(2885, 0, 0, 0, 'Alai Flats, Flat 05', 100000, 8, 0, 0, 0, 0, 42, NULL, 0),
(2886, 0, 0, 0, 'Alai Flats, Flat 06', 100000, 8, 0, 0, 0, 0, 42, NULL, 0),
(2887, 0, 0, 0, 'Alai Flats, Flat 07', 25000, 8, 0, 0, 0, 0, 30, NULL, 0),
(2888, 0, 1648877860, 0, 'Alai Flats, Flat 08', 50000, 8, 0, 0, 0, 0, 36, NULL, 0),
(2889, 0, 1648877860, 0, 'Alai Flats, Flat 11', 80000, 8, 0, 0, 0, 0, 30, NULL, 0),
(2890, 0, 0, 0, 'Alai Flats, Flat 12', 25000, 8, 0, 0, 0, 0, 30, NULL, 0),
(2891, 0, 1648877860, 0, 'Alai Flats, Flat 13', 50000, 8, 0, 0, 0, 0, 36, NULL, 0),
(2892, 0, 0, 0, 'Alai Flats, Flat 14', 80000, 8, 0, 0, 0, 0, 32, NULL, 0),
(2893, 0, 0, 0, 'Alai Flats, Flat 15', 100000, 8, 0, 0, 0, 0, 46, NULL, 0),
(2894, 0, 0, 0, 'Alai Flats, Flat 16', 100000, 8, 0, 0, 0, 0, 46, NULL, 0),
(2895, 0, 1648877860, 0, 'Alai Flats, Flat 17', 80000, 8, 0, 0, 0, 0, 32, NULL, 0),
(2896, 0, 1648877860, 0, 'Alai Flats, Flat 18', 50000, 8, 0, 0, 0, 0, 38, NULL, 0),
(2897, 0, 1648877860, 0, 'Alai Flats, Flat 21', 50000, 8, 0, 0, 0, 0, 30, NULL, 0),
(2898, 0, 1648877860, 0, 'Alai Flats, Flat 22', 50000, 8, 0, 0, 0, 0, 30, NULL, 0),
(2899, 0, 1648877860, 0, 'Alai Flats, Flat 23', 25000, 8, 0, 0, 0, 0, 36, NULL, 0),
(2900, 0, 1648877860, 0, 'Alai Flats, Flat 28', 80000, 8, 0, 0, 0, 0, 32, NULL, 0),
(2901, 0, 1648877860, 0, 'Alai Flats, Flat 27', 80000, 8, 0, 0, 0, 0, 32, NULL, 0),
(2902, 0, 1648877860, 0, 'Alai Flats, Flat 26', 100000, 8, 0, 0, 0, 0, 46, NULL, 0),
(2903, 0, 0, 0, 'Alai Flats, Flat 25', 100000, 8, 0, 0, 0, 0, 46, NULL, 0),
(2904, 0, 0, 0, 'Alai Flats, Flat 24', 80000, 8, 0, 0, 0, 0, 39, NULL, 0),
(2905, 0, 0, 0, 'Beach Home Apartments, Flat 01', 50000, 8, 0, 0, 0, 0, 25, NULL, 0),
(2906, 0, 0, 0, 'Beach Home Apartments, Flat 02', 80000, 8, 0, 0, 0, 0, 30, NULL, 0),
(2907, 0, 0, 0, 'Beach Home Apartments, Flat 03', 80000, 8, 0, 0, 0, 0, 24, NULL, 0),
(2908, 0, 0, 0, 'Beach Home Apartments, Flat 04', 50000, 8, 0, 0, 0, 0, 24, NULL, 0),
(2909, 0, 0, 0, 'Beach Home Apartments, Flat 05', 80000, 8, 0, 0, 0, 0, 30, NULL, 0),
(2910, 0, 0, 0, 'Beach Home Apartments, Flat 06', 100000, 8, 0, 0, 0, 0, 40, NULL, 0),
(2911, 0, 0, 0, 'Beach Home Apartments, Flat 11', 25000, 8, 0, 0, 0, 0, 25, NULL, 0),
(2912, 0, 0, 0, 'Beach Home Apartments, Flat 12', 50000, 8, 0, 0, 0, 0, 30, NULL, 0),
(2913, 0, 0, 0, 'Beach Home Apartments, Flat 13', 80000, 8, 0, 0, 0, 0, 30, NULL, 0),
(2914, 0, 0, 0, 'Beach Home Apartments, Flat 14', 25000, 8, 0, 0, 0, 0, 15, NULL, 0),
(2915, 0, 0, 0, 'Beach Home Apartments, Flat 15', 25000, 8, 0, 0, 0, 0, 20, NULL, 0),
(2916, 0, 0, 0, 'Beach Home Apartments, Flat 16', 80000, 8, 0, 0, 0, 0, 40, NULL, 0),
(2917, 0, 1648877860, 0, 'Demon Tower', 100000, 8, 0, 0, 0, 0, 150, NULL, 0),
(2918, 0, 0, 0, 'Farm Lane, 1st floor (Shop)', 80000, 8, 0, 0, 0, 0, 36, NULL, 0),
(2919, 0, 0, 0, 'Farm Lane, 2nd Floor (Shop)', 50000, 8, 0, 0, 0, 0, 36, NULL, 0),
(2920, 0, 0, 0, 'Farm Lane, Basement (Shop)', 50000, 8, 0, 0, 0, 0, 42, NULL, 0),
(2921, 0, 1648877860, 0, 'Fibula Village 1', 25000, 8, 0, 0, 0, 0, 30, NULL, 0),
(2922, 0, 1648877860, 0, 'Fibula Village 2', 25000, 8, 0, 0, 0, 0, 30, NULL, 0),
(2923, 0, 1648877860, 0, 'Fibula Village 4', 25000, 8, 0, 0, 0, 0, 42, NULL, 0),
(2924, 0, 1648877860, 0, 'Fibula Village 5', 50000, 8, 0, 0, 0, 0, 49, NULL, 0),
(2925, 0, 1648877860, 0, 'Fibula Village 3', 80000, 8, 0, 0, 0, 0, 110, NULL, 0),
(2926, 0, 1648877860, 0, 'Fibula Village, Tower Flat', 100000, 8, 0, 0, 0, 0, 156, NULL, 0),
(2927, 0, 1648877860, 0, 'Guildhall of the Red Rose', 250000, 8, 0, 0, 0, 0, 597, NULL, 0),
(2928, 0, 1648877860, 0, 'Fibula Village, Bar (Shop)', 100000, 8, 0, 0, 0, 0, 127, NULL, 0),
(2929, 0, 1648877860, 0, 'Fibula Village, Villa', 200000, 8, 0, 0, 0, 0, 397, NULL, 0),
(2930, 0, 1648877860, 0, 'Greenshore Village 1', 80000, 8, 0, 0, 0, 0, 64, NULL, 0),
(2931, 0, 0, 0, 'Greenshore Clanhall', 250000, 8, 0, 0, 0, 0, 312, NULL, 0),
(2932, 0, 0, 0, 'Castle of Greenshore', 250000, 8, 0, 0, 0, 0, 474, NULL, 0),
(2933, 0, 1648877860, 0, 'Greenshore Village, Shop', 80000, 8, 0, 0, 0, 0, 64, NULL, 0),
(2934, 0, 0, 0, 'Greenshore Village, Villa', 300000, 8, 0, 0, 0, 0, 262, NULL, 0),
(2935, 0, 1648877860, 0, 'Greenshore Village 7', 25000, 8, 0, 0, 0, 0, 42, NULL, 0),
(2936, 0, 1648877860, 0, 'Greenshore Village 3', 50000, 8, 0, 0, 0, 0, 55, NULL, 0),
(2939, 0, 1648877860, 0, 'Greenshore Village 2', 50000, 8, 0, 0, 0, 0, 55, NULL, 0),
(2940, 0, 0, 0, 'Greenshore Village 6', 150000, 8, 0, 0, 0, 0, 112, NULL, 0),
(2941, 0, 0, 0, 'Harbour Place 1 (Shop)', 800000, 8, 0, 0, 0, 0, 48, NULL, 0),
(2942, 0, 0, 0, 'Harbour Place 2 (Shop)', 600000, 8, 0, 0, 0, 0, 54, NULL, 0),
(2943, 0, 0, 0, 'Harbour Place 3', 800000, 8, 0, 0, 0, 0, 138, NULL, 0),
(2944, 0, 0, 0, 'Harbour Place 4', 80000, 8, 0, 0, 0, 0, 36, NULL, 0),
(2945, 0, 0, 0, 'Lower Swamp Lane 1', 400000, 8, 0, 0, 0, 0, 156, NULL, 0),
(2946, 0, 0, 0, 'Lower Swamp Lane 3', 400000, 8, 0, 0, 0, 0, 156, NULL, 0),
(2947, 0, 0, 0, 'Main Street 9, 1st floor (Shop)', 200000, 8, 0, 0, 0, 0, 63, NULL, 0),
(2948, 0, 0, 0, 'Main Street 9a, 2nd floor (Shop)', 100000, 8, 0, 0, 0, 0, 30, NULL, 0),
(2949, 0, 0, 0, 'Main Street 9b, 2nd floor (Shop)', 150000, 8, 0, 0, 0, 0, 57, NULL, 0),
(2950, 0, 0, 0, 'Mill Avenue 1 (Shop)', 200000, 8, 0, 0, 0, 0, 54, NULL, 0),
(2951, 0, 0, 0, 'Mill Avenue 2 (Shop)', 200000, 8, 0, 0, 0, 0, 100, NULL, 0),
(2952, 0, 0, 0, 'Mill Avenue 3', 100000, 8, 0, 0, 0, 0, 49, NULL, 0),
(2953, 0, 0, 0, 'Mill Avenue 4', 100000, 8, 0, 0, 0, 0, 49, NULL, 0),
(2954, 0, 0, 0, 'Mill Avenue 5', 300000, 8, 0, 0, 0, 0, 116, NULL, 0),
(2955, 0, 0, 0, 'Open-Air Theatre', 150000, 8, 0, 0, 0, 0, 111, NULL, 0),
(2956, 0, 0, 0, 'Smuggler\'s Den', 400000, 8, 0, 0, 0, 0, 298, NULL, 0),
(2957, 0, 0, 0, 'Sorcerer\'s Avenue 1a', 100000, 8, 0, 0, 0, 0, 42, NULL, 0),
(2958, 0, 0, 0, 'Sorcerer\'s Avenue 5 (Shop)', 150000, 8, 0, 0, 0, 0, 96, NULL, 0),
(2959, 0, 0, 0, 'Sorcerer\'s Avenue 1b', 80000, 8, 0, 0, 0, 0, 30, NULL, 0),
(2960, 0, 0, 0, 'Sorcerer\'s Avenue 1c', 100000, 8, 0, 0, 0, 0, 42, NULL, 0),
(2961, 0, 1648877860, 0, 'Sorcerer\'s Avenue Labs 2a', 50000, 8, 0, 0, 0, 0, 54, NULL, 0),
(2962, 0, 1648877860, 0, 'Sorcerer\'s Avenue Labs 2c', 50000, 8, 0, 0, 0, 0, 48, NULL, 0),
(2963, 0, 1648877860, 0, 'Sorcerer\'s Avenue Labs 2b', 50000, 8, 0, 0, 0, 0, 54, NULL, 0),
(2964, 0, 0, 0, 'Sunset Homes, Flat 01', 100000, 8, 0, 0, 0, 0, 25, NULL, 0),
(2965, 0, 0, 0, 'Sunset Homes, Flat 02', 80000, 8, 0, 0, 0, 0, 30, NULL, 0),
(2966, 0, 0, 0, 'Sunset Homes, Flat 03', 80000, 8, 0, 0, 0, 0, 30, NULL, 0),
(2967, 0, 0, 0, 'Sunset Homes, Flat 11', 80000, 8, 0, 0, 0, 0, 25, NULL, 0),
(2968, 0, 0, 0, 'Sunset Homes, Flat 12', 50000, 8, 0, 0, 0, 0, 26, NULL, 0),
(2969, 0, 0, 0, 'Sunset Homes, Flat 13', 100000, 8, 0, 0, 0, 0, 35, NULL, 0),
(2970, 0, 0, 0, 'Sunset Homes, Flat 14', 50000, 8, 0, 0, 0, 0, 30, NULL, 0),
(2971, 0, 0, 0, 'Sunset Homes, Flat 21', 50000, 8, 0, 0, 0, 0, 25, NULL, 0),
(2972, 0, 0, 0, 'Sunset Homes, Flat 22', 50000, 8, 0, 0, 0, 0, 26, NULL, 0),
(2973, 0, 0, 0, 'Sunset Homes, Flat 23', 80000, 8, 0, 0, 0, 0, 35, NULL, 0),
(2974, 0, 1648877860, 0, 'Sunset Homes, Flat 24', 50000, 8, 0, 0, 0, 0, 30, NULL, 0),
(2975, 0, 0, 0, 'Thais Hostel', 200000, 8, 0, 0, 0, 0, 171, NULL, 0),
(2976, 0, 0, 0, 'The City Wall 1a', 150000, 8, 0, 0, 0, 0, 49, NULL, 0),
(2977, 0, 0, 0, 'The City Wall 1b', 100000, 8, 0, 0, 0, 0, 49, NULL, 0),
(2978, 0, 0, 0, 'The City Wall 3a', 100000, 8, 0, 0, 0, 0, 35, NULL, 0),
(2979, 0, 0, 0, 'The City Wall 3b', 100000, 8, 0, 0, 0, 0, 35, NULL, 0),
(2980, 0, 0, 0, 'The City Wall 3c', 100000, 8, 0, 0, 0, 0, 42, NULL, 0),
(2981, 0, 0, 0, 'The City Wall 3d', 100000, 8, 0, 0, 0, 0, 35, NULL, 0),
(2982, 0, 0, 0, 'The City Wall 3e', 100000, 8, 0, 0, 0, 0, 35, NULL, 0),
(2983, 0, 0, 0, 'The City Wall 3f', 100000, 8, 0, 0, 0, 0, 42, NULL, 0),
(2984, 0, 0, 0, 'Upper Swamp Lane 12', 300000, 8, 0, 0, 0, 0, 124, NULL, 0),
(2985, 0, 0, 0, 'Upper Swamp Lane 10', 150000, 8, 0, 0, 0, 0, 70, NULL, 0),
(2986, 0, 0, 0, 'Upper Swamp Lane 8', 600000, 8, 0, 0, 0, 0, 206, NULL, 0),
(2987, 0, 0, 0, 'Upper Swamp Lane 4', 600000, 8, 0, 0, 0, 0, 176, NULL, 0),
(2988, 0, 0, 0, 'Upper Swamp Lane 2', 600000, 8, 0, 0, 0, 0, 176, NULL, 0),
(2989, 0, 0, 0, 'The City Wall 9', 80000, 8, 0, 0, 0, 0, 50, NULL, 0),
(2990, 0, 0, 0, 'The City Wall 7h', 50000, 8, 0, 0, 0, 0, 30, NULL, 0),
(2991, 0, 1648877860, 0, 'The City Wall 7b', 25000, 8, 0, 0, 0, 0, 30, NULL, 0),
(2992, 0, 0, 0, 'The City Wall 7d', 50000, 8, 0, 0, 0, 0, 36, NULL, 0),
(2993, 0, 0, 0, 'The City Wall 7f', 80000, 8, 0, 0, 0, 0, 36, NULL, 0),
(2994, 0, 0, 0, 'The City Wall 7c', 80000, 8, 0, 0, 0, 0, 36, NULL, 0),
(2995, 0, 0, 0, 'The City Wall 7a', 80000, 8, 0, 0, 0, 0, 30, NULL, 0),
(2996, 0, 0, 0, 'The City Wall 7g', 50000, 8, 0, 0, 0, 0, 30, NULL, 0),
(2997, 0, 0, 0, 'The City Wall 7e', 80000, 8, 0, 0, 0, 0, 36, NULL, 0),
(2998, 0, 0, 0, 'The City Wall 5b', 50000, 8, 0, 0, 0, 0, 24, NULL, 0),
(2999, 0, 0, 0, 'The City Wall 5d', 50000, 8, 0, 0, 0, 0, 24, NULL, 0),
(3000, 0, 1648877860, 0, 'The City Wall 5f', 25000, 8, 0, 0, 0, 0, 30, NULL, 0),
(3001, 0, 0, 0, 'The City Wall 5a', 50000, 8, 0, 0, 0, 0, 24, NULL, 0),
(3002, 0, 0, 0, 'The City Wall 5c', 50000, 8, 0, 0, 0, 0, 24, NULL, 0),
(3003, 0, 0, 0, 'The City Wall 5e', 50000, 8, 0, 0, 0, 0, 30, NULL, 0),
(3004, 0, 0, 0, 'Warriors\' Guildhall', 5000000, 8, 0, 0, 0, 0, 535, NULL, 0),
(3005, 0, 1648877860, 0, 'The Tibianic', 500000, 8, 0, 0, 0, 0, 824, NULL, 0),
(3006, 0, 0, 0, 'Bloodhall', 500000, 8, 0, 0, 0, 0, 539, NULL, 0),
(3007, 0, 1648877860, 0, 'Fibula Clanhall', 250000, 8, 0, 0, 0, 0, 305, NULL, 0),
(3008, 0, 0, 0, 'Dark Mansion', 1000000, 8, 0, 0, 0, 0, 590, NULL, 0),
(3009, 0, 0, 0, 'Halls of the Adventurers', 250000, 8, 0, 0, 0, 0, 512, NULL, 0),
(3010, 0, 0, 0, 'Mercenary Tower', 250000, 8, 0, 0, 0, 0, 982, NULL, 0),
(3011, 0, 1648877860, 0, 'Snake Tower', 500000, 8, 0, 0, 0, 0, 1041, NULL, 0),
(3012, 0, 0, 0, 'Southern Thais Guildhall', 1000000, 8, 0, 0, 0, 0, 635, NULL, 0),
(3013, 0, 0, 0, 'Spiritkeep', 500000, 8, 0, 0, 0, 0, 564, NULL, 0),
(3014, 0, 0, 0, 'Thais Clanhall', 500000, 8, 0, 0, 0, 0, 380, NULL, 0),
(3015, 0, 1648877860, 0, 'The Lair', 200000, 9, 0, 0, 0, 0, 335, NULL, 0),
(3016, 0, 1648877860, 0, 'Silver Street 4', 300000, 9, 0, 0, 0, 0, 153, NULL, 0),
(3017, 0, 1648877860, 0, 'Dream Street 1 (Shop)', 600000, 9, 0, 0, 0, 0, 178, NULL, 0),
(3018, 0, 1648877860, 0, 'Dagger Alley 1', 200000, 9, 0, 0, 0, 0, 126, NULL, 0),
(3019, 0, 1648877860, 0, 'Dream Street 2', 400000, 9, 0, 0, 0, 0, 138, NULL, 0),
(3020, 0, 1648877860, 0, 'Dream Street 3', 300000, 9, 0, 0, 0, 0, 126, NULL, 0),
(3021, 0, 1648877860, 0, 'Elm Street 1', 300000, 9, 0, 0, 0, 0, 114, NULL, 0),
(3022, 0, 1648877860, 0, 'Elm Street 3', 300000, 9, 0, 0, 0, 0, 120, NULL, 0),
(3023, 0, 1648877860, 0, 'Elm Street 2', 300000, 9, 0, 0, 0, 0, 120, NULL, 0),
(3024, 0, 1648877860, 0, 'Elm Street 4', 300000, 9, 0, 0, 0, 0, 126, NULL, 0),
(3025, 0, 0, 0, 'Seagull Walk 1', 800000, 9, 0, 0, 0, 0, 202, NULL, 0),
(3026, 0, 1648877860, 0, 'Seagull Walk 2', 300000, 9, 0, 0, 0, 0, 132, NULL, 0),
(3027, 0, 1648877860, 0, 'Dream Street 4', 400000, 9, 0, 0, 0, 0, 168, NULL, 0),
(3028, 0, 1648877860, 0, 'Old Lighthouse', 200000, 9, 0, 0, 0, 0, 177, NULL, 0),
(3029, 0, 0, 0, 'Market Street 1', 600000, 9, 0, 0, 0, 0, 258, NULL, 0),
(3030, 0, 0, 0, 'Market Street 3', 600000, 9, 0, 0, 0, 0, 153, NULL, 0),
(3031, 0, 0, 0, 'Market Street 4 (Shop)', 800000, 9, 0, 0, 0, 0, 209, NULL, 0),
(3032, 0, 0, 0, 'Market Street 5 (Shop)', 800000, 9, 0, 0, 0, 0, 243, NULL, 0),
(3033, 0, 0, 0, 'Market Street 2', 600000, 9, 0, 0, 0, 0, 200, NULL, 0),
(3034, 0, 0, 0, 'Loot Lane 1 (Shop)', 600000, 9, 0, 0, 0, 0, 198, NULL, 0),
(3035, 0, 1648877860, 0, 'Mystic Lane 1', 300000, 9, 0, 0, 0, 0, 110, NULL, 0),
(3036, 0, 1648877860, 0, 'Mystic Lane 2', 200000, 9, 0, 0, 0, 0, 139, NULL, 0),
(3037, 0, 1648877860, 0, 'Lucky Lane 2 (Tower)', 600000, 9, 0, 0, 0, 0, 240, NULL, 0),
(3038, 0, 1648877860, 0, 'Lucky Lane 3 (Tower)', 600000, 9, 0, 0, 0, 0, 240, NULL, 0),
(3039, 0, 1648877860, 0, 'Iron Alley 1', 300000, 9, 0, 0, 0, 0, 120, NULL, 0),
(3040, 0, 1648877860, 0, 'Iron Alley 2', 300000, 9, 0, 0, 0, 0, 144, NULL, 0),
(3041, 0, 0, 0, 'Swamp Watch', 500000, 9, 0, 0, 0, 0, 420, NULL, 0),
(3042, 0, 0, 0, 'Golden Axe Guildhall', 500000, 9, 0, 0, 0, 0, 390, NULL, 0),
(3043, 0, 1648877860, 0, 'Silver Street 1', 200000, 9, 0, 0, 0, 0, 125, NULL, 0),
(3044, 0, 1648877860, 0, 'Valorous Venore', 500000, 9, 0, 0, 0, 0, 507, NULL, 0),
(3045, 0, 1648877860, 0, 'Salvation Street 2', 300000, 9, 0, 0, 0, 0, 135, NULL, 0),
(3046, 0, 1648877860, 0, 'Salvation Street 3', 300000, 9, 0, 0, 0, 0, 162, NULL, 0),
(3047, 0, 1648877860, 0, 'Silver Street 2', 200000, 9, 0, 0, 0, 0, 84, NULL, 0),
(3048, 0, 1648877860, 0, 'Silver Street 3', 200000, 9, 0, 0, 0, 0, 105, NULL, 0),
(3049, 0, 1648877860, 0, 'Mystic Lane 3 (Tower)', 800000, 9, 0, 0, 0, 0, 245, NULL, 0),
(3050, 0, 1648877860, 0, 'Market Street 7', 200000, 9, 0, 0, 0, 0, 114, NULL, 0),
(3051, 0, 1648877860, 0, 'Market Street 6', 600000, 9, 0, 0, 0, 0, 216, NULL, 0),
(3052, 0, 1648877860, 0, 'Iron Alley Watch, Upper', 600000, 9, 0, 0, 0, 0, 252, NULL, 0),
(3053, 0, 1648877860, 0, 'Iron Alley Watch, Lower', 600000, 9, 0, 0, 0, 0, 240, NULL, 0),
(3054, 0, 1648877860, 0, 'Blessed Shield Guildhall', 500000, 9, 0, 0, 0, 0, 289, NULL, 0),
(3055, 0, 0, 0, 'Steel Home', 500000, 9, 0, 0, 0, 0, 441, NULL, 0),
(3056, 0, 0, 0, 'Salvation Street 1 (Shop)', 600000, 9, 0, 0, 0, 0, 249, NULL, 0),
(3057, 0, 1648877860, 0, 'Lucky Lane 1 (Shop)', 800000, 9, 0, 0, 0, 0, 253, NULL, 0),
(3058, 0, 1648877860, 0, 'Paupers Palace, Flat 34', 100000, 9, 0, 0, 0, 0, 60, NULL, 0),
(3059, 0, 1648877860, 0, 'Paupers Palace, Flat 33', 50000, 9, 0, 0, 0, 0, 35, NULL, 0),
(3060, 0, 1648877860, 0, 'Paupers Palace, Flat 32', 100000, 9, 0, 0, 0, 0, 50, NULL, 0),
(3061, 0, 1648877860, 0, 'Paupers Palace, Flat 31', 80000, 9, 0, 0, 0, 0, 40, NULL, 0),
(3062, 0, 1648877860, 0, 'Paupers Palace, Flat 28', 25000, 9, 0, 0, 0, 0, 15, NULL, 0),
(3063, 0, 1648877860, 0, 'Paupers Palace, Flat 26', 25000, 9, 0, 0, 0, 0, 20, NULL, 0),
(3064, 0, 1648877860, 0, 'Paupers Palace, Flat 24', 25000, 9, 0, 0, 0, 0, 20, NULL, 0),
(3065, 0, 1648877860, 0, 'Paupers Palace, Flat 22', 25000, 9, 0, 0, 0, 0, 20, NULL, 0),
(3066, 0, 1648877860, 0, 'Paupers Palace, Flat 21', 25000, 9, 0, 0, 0, 0, 20, NULL, 0),
(3067, 0, 1648877860, 0, 'Paupers Palace, Flat 27', 50000, 9, 0, 0, 0, 0, 25, NULL, 0),
(3068, 0, 1648877860, 0, 'Paupers Palace, Flat 25', 50000, 9, 0, 0, 0, 0, 25, NULL, 0),
(3069, 0, 1648877860, 0, 'Paupers Palace, Flat 23', 50000, 9, 0, 0, 0, 0, 30, NULL, 0),
(3070, 0, 1648877860, 0, 'Paupers Palace, Flat 11', 25000, 9, 0, 0, 0, 0, 15, NULL, 0),
(3071, 0, 1648877860, 0, 'Paupers Palace, Flat 13', 50000, 9, 0, 0, 0, 0, 20, NULL, 0),
(3072, 0, 1648877860, 0, 'Paupers Palace, Flat 15', 50000, 9, 0, 0, 0, 0, 20, NULL, 0),
(3073, 0, 1648877860, 0, 'Paupers Palace, Flat 17', 25000, 9, 0, 0, 0, 0, 20, NULL, 0),
(3074, 0, 1648877860, 0, 'Paupers Palace, Flat 18', 25000, 9, 0, 0, 0, 0, 20, NULL, 0),
(3075, 0, 1648877860, 0, 'Paupers Palace, Flat 12', 50000, 9, 0, 0, 0, 0, 25, NULL, 0),
(3076, 0, 1648877860, 0, 'Paupers Palace, Flat 14', 50000, 9, 0, 0, 0, 0, 25, NULL, 0),
(3077, 0, 1648877860, 0, 'Paupers Palace, Flat 16', 50000, 9, 0, 0, 0, 0, 30, NULL, 0),
(3078, 0, 1648877860, 0, 'Paupers Palace, Flat 06', 25000, 9, 0, 0, 0, 0, 20, NULL, 0),
(3079, 0, 1648877860, 0, 'Paupers Palace, Flat 05', 25000, 9, 0, 0, 0, 0, 15, NULL, 0),
(3080, 0, 1648877860, 0, 'Paupers Palace, Flat 04', 25000, 9, 0, 0, 0, 0, 25, NULL, 0),
(3081, 0, 1648877860, 0, 'Paupers Palace, Flat 07', 50000, 9, 0, 0, 0, 0, 23, NULL, 0),
(3082, 0, 1648877860, 0, 'Paupers Palace, Flat 03', 25000, 9, 0, 0, 0, 0, 20, NULL, 0),
(3083, 0, 1648877860, 0, 'Paupers Palace, Flat 02', 25000, 9, 0, 0, 0, 0, 25, NULL, 0),
(3084, 0, 1648877860, 0, 'Paupers Palace, Flat 01', 25000, 9, 0, 0, 0, 0, 24, NULL, 0),
(3085, 0, 0, 0, 'Castle, Residence', 600000, 11, 0, 0, 0, 0, 182, NULL, 0),
(3086, 0, 1648877860, 0, 'Castle, 3rd Floor, Flat 07', 80000, 11, 0, 0, 0, 0, 30, NULL, 0),
(3087, 0, 1648877860, 0, 'Castle, 3rd Floor, Flat 04', 25000, 11, 0, 0, 0, 0, 25, NULL, 0),
(3088, 0, 1648877860, 0, 'Castle, 3rd Floor, Flat 03', 50000, 11, 0, 0, 0, 0, 30, NULL, 0),
(3089, 0, 1648877860, 0, 'Castle, 3rd Floor, Flat 06', 100000, 11, 0, 0, 0, 0, 36, NULL, 0),
(3090, 0, 1648877860, 0, 'Castle, 3rd Floor, Flat 05', 80000, 11, 0, 0, 0, 0, 30, NULL, 0),
(3091, 0, 1648877860, 0, 'Castle, 3rd Floor, Flat 02', 80000, 11, 0, 0, 0, 0, 30, NULL, 0),
(3092, 0, 1648877860, 0, 'Castle, 3rd Floor, Flat 01', 50000, 11, 0, 0, 0, 0, 30, NULL, 0),
(3093, 0, 1648877860, 0, 'Castle, 4th Floor, Flat 09', 50000, 11, 0, 0, 0, 0, 28, NULL, 0),
(3094, 0, 1648877860, 0, 'Castle, 4th Floor, Flat 08', 80000, 11, 0, 0, 0, 0, 42, NULL, 0),
(3095, 0, 1648877860, 0, 'Castle, 4th Floor, Flat 07', 80000, 11, 0, 0, 0, 0, 30, NULL, 0),
(3096, 0, 1648877860, 0, 'Castle, 4th Floor, Flat 04', 50000, 11, 0, 0, 0, 0, 25, NULL, 0),
(3097, 0, 1648877860, 0, 'Castle, 4th Floor, Flat 03', 50000, 11, 0, 0, 0, 0, 30, NULL, 0),
(3098, 0, 1648877860, 0, 'Castle, 4th Floor, Flat 06', 100000, 11, 0, 0, 0, 0, 36, NULL, 0),
(3099, 0, 1648877860, 0, 'Castle, 4th Floor, Flat 05', 80000, 11, 0, 0, 0, 0, 30, NULL, 0),
(3100, 0, 1648877860, 0, 'Castle, 4th Floor, Flat 02', 80000, 11, 0, 0, 0, 0, 30, NULL, 0),
(3101, 0, 1648877860, 0, 'Castle, 4th Floor, Flat 01', 50000, 11, 0, 0, 0, 0, 30, NULL, 0),
(3102, 0, 1648877860, 0, 'Castle Street 2', 150000, 11, 0, 0, 0, 0, 56, NULL, 0),
(3103, 0, 1648877860, 0, 'Castle Street 3', 150000, 11, 0, 0, 0, 0, 64, NULL, 0),
(3104, 0, 1648877860, 0, 'Castle Street 4', 150000, 11, 0, 0, 0, 0, 61, NULL, 0),
(3105, 0, 1648877860, 0, 'Castle Street 5', 150000, 11, 0, 0, 0, 0, 64, NULL, 0),
(3106, 0, 1648877860, 0, 'Castle Street 1', 300000, 11, 0, 0, 0, 0, 112, NULL, 0),
(3107, 0, 1648877860, 0, 'Edron Flats, Flat 08', 25000, 11, 0, 0, 0, 0, 20, NULL, 0),
(3108, 0, 1648877860, 0, 'Edron Flats, Flat 05', 25000, 11, 0, 0, 0, 0, 20, NULL, 0),
(3109, 0, 1648877860, 0, 'Edron Flats, Flat 04', 25000, 11, 0, 0, 0, 0, 25, NULL, 0),
(3110, 0, 1648877860, 0, 'Edron Flats, Flat 01', 50000, 11, 0, 0, 0, 0, 25, NULL, 0),
(3111, 0, 1648877860, 0, 'Edron Flats, Flat 07', 25000, 11, 0, 0, 0, 0, 20, NULL, 0),
(3112, 0, 1648877860, 0, 'Edron Flats, Flat 06', 25000, 11, 0, 0, 0, 0, 20, NULL, 0),
(3113, 0, 1648877860, 0, 'Edron Flats, Flat 03', 25000, 11, 0, 0, 0, 0, 20, NULL, 0),
(3114, 0, 1648877860, 0, 'Edron Flats, Flat 02', 100000, 11, 0, 0, 0, 0, 40, NULL, 0),
(3115, 0, 1648877860, 0, 'Edron Flats, Basement Flat 2', 100000, 11, 0, 0, 0, 0, 54, NULL, 0),
(3116, 0, 1648877860, 0, 'Edron Flats, Basement Flat 1', 100000, 11, 0, 0, 0, 0, 63, NULL, 0),
(3119, 0, 1648877860, 0, 'Edron Flats, Flat 13', 80000, 11, 0, 0, 0, 0, 45, NULL, 0),
(3121, 0, 1648877860, 0, 'Edron Flats, Flat 14', 100000, 11, 0, 0, 0, 0, 50, NULL, 0),
(3123, 0, 1648877860, 0, 'Edron Flats, Flat 12', 80000, 11, 0, 0, 0, 0, 45, NULL, 0),
(3124, 0, 1648877860, 0, 'Edron Flats, Flat 11', 100000, 11, 0, 0, 0, 0, 60, NULL, 0),
(3125, 0, 1648877860, 0, 'Edron Flats, Flat 25', 80000, 11, 0, 0, 0, 0, 60, NULL, 0),
(3127, 0, 1648877860, 0, 'Edron Flats, Flat 24', 80000, 11, 0, 0, 0, 0, 35, NULL, 0),
(3128, 0, 1648877860, 0, 'Edron Flats, Flat 21', 80000, 11, 0, 0, 0, 0, 40, NULL, 0),
(3131, 0, 1648877860, 0, 'Edron Flats, Flat 23', 80000, 11, 0, 0, 0, 0, 40, NULL, 0),
(3133, 0, 0, 0, 'Castle Shop 1', 400000, 11, 0, 0, 0, 0, 70, NULL, 0),
(3134, 0, 0, 0, 'Castle Shop 2', 400000, 11, 0, 0, 0, 0, 70, NULL, 0),
(3135, 0, 0, 0, 'Castle Shop 3', 300000, 11, 0, 0, 0, 0, 80, NULL, 0),
(3136, 0, 0, 0, 'Central Circle 1', 800000, 11, 0, 0, 0, 0, 98, NULL, 0),
(3137, 0, 0, 0, 'Central Circle 2', 800000, 11, 0, 0, 0, 0, 120, NULL, 0),
(3138, 0, 0, 0, 'Central Circle 3', 800000, 11, 0, 0, 0, 0, 147, NULL, 0),
(3139, 0, 0, 0, 'Central Circle 4', 800000, 11, 0, 0, 0, 0, 147, NULL, 0),
(3140, 0, 0, 0, 'Central Circle 5', 800000, 11, 0, 0, 0, 0, 168, NULL, 0),
(3141, 0, 0, 0, 'Central Circle 8 (Shop)', 400000, 11, 0, 0, 0, 0, 168, NULL, 0),
(3142, 0, 0, 0, 'Central Circle 7 (Shop)', 400000, 11, 0, 0, 0, 0, 168, NULL, 0),
(3143, 0, 1648877860, 0, 'Central Circle 6 (Shop)', 400000, 11, 0, 0, 0, 0, 192, NULL, 0),
(3144, 0, 0, 0, 'Central Circle 9a', 150000, 11, 0, 0, 0, 0, 42, NULL, 0),
(3145, 0, 0, 0, 'Central Circle 9b', 150000, 11, 0, 0, 0, 0, 42, NULL, 0),
(3146, 0, 0, 0, 'Sky Lane, Guild 1', 1000000, 11, 0, 0, 0, 0, 663, NULL, 0),
(3147, 0, 1648877860, 0, 'Sky Lane, Sea Tower', 300000, 11, 0, 0, 0, 0, 196, NULL, 0),
(3148, 0, 0, 0, 'Sky Lane, Guild 3', 1000000, 11, 0, 0, 0, 0, 507, NULL, 0),
(3149, 0, 0, 0, 'Sky Lane, Guild 2', 1000000, 11, 0, 0, 0, 0, 653, NULL, 0),
(3150, 0, 0, 0, 'Wood Avenue 11', 600000, 11, 0, 0, 0, 0, 245, NULL, 0),
(3151, 0, 0, 0, 'Wood Avenue 8', 800000, 11, 0, 0, 0, 0, 218, NULL, 0),
(3152, 0, 0, 0, 'Wood Avenue 7', 800000, 11, 0, 0, 0, 0, 232, NULL, 0),
(3153, 0, 1648877860, 0, 'Wood Avenue 10a', 200000, 11, 0, 0, 0, 0, 56, NULL, 0),
(3154, 0, 1648877860, 0, 'Wood Avenue 9a', 200000, 11, 0, 0, 0, 0, 56, NULL, 0),
(3155, 0, 0, 0, 'Wood Avenue 6a', 300000, 11, 0, 0, 0, 0, 64, NULL, 0),
(3156, 0, 1648877860, 0, 'Wood Avenue 6b', 200000, 11, 0, 0, 0, 0, 56, NULL, 0),
(3157, 0, 1648877860, 0, 'Wood Avenue 9b', 200000, 11, 0, 0, 0, 0, 56, NULL, 0),
(3158, 0, 1648877860, 0, 'Wood Avenue 10b', 200000, 11, 0, 0, 0, 0, 64, NULL, 0),
(3159, 0, 1648877860, 0, 'Stronghold', 800000, 11, 0, 0, 0, 0, 285, NULL, 0),
(3160, 0, 0, 0, 'Wood Avenue 5', 300000, 11, 0, 0, 0, 0, 64, NULL, 0),
(3161, 0, 0, 0, 'Wood Avenue 3', 200000, 11, 0, 0, 0, 0, 52, NULL, 0),
(3162, 0, 0, 0, 'Wood Avenue 4', 200000, 11, 0, 0, 0, 0, 60, NULL, 0),
(3163, 0, 0, 0, 'Wood Avenue 2', 200000, 11, 0, 0, 0, 0, 64, NULL, 0),
(3164, 0, 1648877860, 0, 'Wood Avenue 1', 200000, 11, 0, 0, 0, 0, 64, NULL, 0),
(3165, 0, 1648877860, 0, 'Wood Avenue 4c', 200000, 11, 0, 0, 0, 0, 57, NULL, 0),
(3166, 0, 1648877860, 0, 'Wood Avenue 4a', 150000, 11, 0, 0, 0, 0, 56, NULL, 0),
(3167, 0, 1648877860, 0, 'Wood Avenue 4b', 150000, 11, 0, 0, 0, 0, 56, NULL, 0),
(3168, 0, 1648877860, 0, 'Stonehome Village 1', 150000, 11, 0, 0, 0, 0, 77, NULL, 0),
(3169, 0, 1648877860, 0, 'Stonehome Flats, Flat 04', 80000, 11, 0, 0, 0, 0, 45, NULL, 0),
(3171, 0, 1648877860, 0, 'Stonehome Flats, Flat 03', 80000, 11, 0, 0, 0, 0, 45, NULL, 0),
(3173, 0, 1648877860, 0, 'Stonehome Flats, Flat 02', 25000, 11, 0, 0, 0, 0, 30, NULL, 0),
(3174, 0, 1648877860, 0, 'Stonehome Flats, Flat 01', 25000, 11, 0, 0, 0, 0, 25, NULL, 0),
(3175, 0, 1648877860, 0, 'Stonehome Flats, Flat 13', 80000, 11, 0, 0, 0, 0, 45, NULL, 0),
(3177, 0, 1648877860, 0, 'Stonehome Flats, Flat 11', 50000, 11, 0, 0, 0, 0, 30, NULL, 0),
(3178, 0, 1648877860, 0, 'Stonehome Flats, Flat 14', 80000, 11, 0, 0, 0, 0, 45, NULL, 0),
(3180, 0, 1648877860, 0, 'Stonehome Flats, Flat 12', 50000, 11, 0, 0, 0, 0, 30, NULL, 0),
(3181, 0, 1648877860, 0, 'Stonehome Village 2', 50000, 11, 0, 0, 0, 0, 35, NULL, 0),
(3182, 0, 1648877860, 0, 'Stonehome Village 3', 50000, 11, 0, 0, 0, 0, 36, NULL, 0),
(3183, 0, 1648877860, 0, 'Stonehome Village 4', 80000, 11, 0, 0, 0, 0, 42, NULL, 0),
(3184, 0, 1648877860, 0, 'Stonehome Village 6', 100000, 11, 0, 0, 0, 0, 55, NULL, 0),
(3185, 0, 1648877860, 0, 'Stonehome Village 5', 80000, 11, 0, 0, 0, 0, 49, NULL, 0),
(3186, 0, 1648877860, 0, 'Stonehome Village 7', 100000, 11, 0, 0, 0, 0, 49, NULL, 0),
(3187, 0, 1648877860, 0, 'Stonehome Village 8', 25000, 11, 0, 0, 0, 0, 36, NULL, 0),
(3188, 0, 1648877860, 0, 'Stonehome Village 9', 50000, 11, 0, 0, 0, 0, 36, NULL, 0),
(3189, 0, 1648877860, 0, 'Stonehome Clanhall', 250000, 11, 0, 0, 0, 0, 364, NULL, 0),
(3190, 0, 1648877860, 0, 'Mad Scientist\'s Lab', 600000, 17, 0, 0, 0, 0, 115, NULL, 0),
(3191, 0, 1648877860, 0, 'Radiant Plaza 4', 800000, 17, 0, 0, 0, 0, 361, NULL, 0),
(3192, 0, 1648877860, 0, 'Radiant Plaza 3', 800000, 17, 0, 0, 0, 0, 245, NULL, 0),
(3193, 0, 1648877860, 0, 'Radiant Plaza 2', 600000, 17, 0, 0, 0, 0, 153, NULL, 0),
(3194, 0, 1648877860, 0, 'Radiant Plaza 1', 800000, 17, 0, 0, 0, 0, 257, NULL, 0),
(3195, 0, 1648877860, 0, 'Aureate Court 3', 400000, 17, 0, 0, 0, 0, 226, NULL, 0),
(3196, 0, 1648877860, 0, 'Aureate Court 4', 400000, 17, 0, 0, 0, 0, 185, NULL, 0),
(3197, 0, 1648877860, 0, 'Aureate Court 5', 600000, 17, 0, 0, 0, 0, 201, NULL, 0),
(3198, 0, 1648877860, 0, 'Aureate Court 2', 400000, 17, 0, 0, 0, 0, 176, NULL, 0),
(3199, 0, 1648877860, 0, 'Aureate Court 1', 600000, 17, 0, 0, 0, 0, 264, NULL, 0),
(3205, 0, 1648877860, 0, 'Halls of Serenity', 5000000, 17, 0, 0, 0, 0, 1026, NULL, 0),
(3206, 0, 1648877860, 0, 'Fortune Wing 3', 600000, 17, 0, 0, 0, 0, 235, NULL, 0),
(3207, 0, 1648877860, 0, 'Fortune Wing 4', 600000, 17, 0, 0, 0, 0, 252, NULL, 0),
(3208, 0, 1648877860, 0, 'Fortune Wing 2', 600000, 17, 0, 0, 0, 0, 260, NULL, 0),
(3209, 0, 1648877860, 0, 'Fortune Wing 1', 800000, 17, 0, 0, 0, 0, 400, NULL, 0),
(3211, 0, 0, 0, 'Cascade Towers', 5000000, 17, 0, 0, 0, 0, 739, NULL, 0),
(3212, 0, 1648877860, 0, 'Luminous Arc 5', 800000, 17, 0, 0, 0, 0, 196, NULL, 0),
(3213, 0, 1648877860, 0, 'Luminous Arc 2', 600000, 17, 0, 0, 0, 0, 298, NULL, 0),
(3214, 0, 1648877860, 0, 'Luminous Arc 1', 800000, 17, 0, 0, 0, 0, 341, NULL, 0),
(3215, 0, 0, 0, 'Luminous Arc 3', 600000, 17, 0, 0, 0, 0, 228, NULL, 0),
(3216, 0, 0, 0, 'Luminous Arc 4', 800000, 17, 0, 0, 0, 0, 326, NULL, 0),
(3217, 0, 1648877860, 0, 'Harbour Promenade 1', 800000, 17, 0, 0, 0, 0, 205, NULL, 0),
(3218, 0, 1648877860, 0, 'Sun Palace', 5000000, 17, 0, 0, 0, 0, 926, NULL, 0),
(3219, 0, 1648877860, 0, 'Haggler\'s Hangout 3', 300000, 15, 0, 0, 0, 0, 241, NULL, 0),
(3220, 0, 1648877860, 0, 'Haggler\'s Hangout 7', 400000, 15, 0, 0, 0, 0, 240, NULL, 0),
(3221, 0, 1648877860, 0, 'Big Game Hunter\'s Lodge', 600000, 15, 0, 0, 0, 0, 257, NULL, 0),
(3222, 0, 1648877860, 0, 'Haggler\'s Hangout 6', 400000, 15, 0, 0, 0, 0, 188, NULL, 0),
(3223, 0, 1648877860, 0, 'Haggler\'s Hangout 5 (Shop)', 200000, 15, 0, 0, 0, 0, 56, NULL, 0),
-- --------------------------------------------------------

--
-- Table structure `house_lists`
--

CREATE TABLE `house_lists` (
  `house_id` int(11) NOT NULL,
  `listid` int(11) NOT NULL,
  `list` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure `ip_bans`
--

CREATE TABLE `ip_bans` (
  `ip` int(10) UNSIGNED NOT NULL,
  `reason` varchar(255) NOT NULL,
  `banned_at` bigint(20) NOT NULL,
  `expires_at` bigint(20) NOT NULL,
  `banned_by` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure `links`
--

CREATE TABLE `links` (
  `account_id` int(11) NOT NULL,
  `code` varchar(50) NOT NULL,
  `code_date` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure `live_casts`
--

CREATE TABLE `live_casts` (
  `player_id` int(11) NOT NULL,
  `cast_name` varchar(255) NOT NULL,
  `password` tinyint(1) NOT NULL DEFAULT '0',
  `description` varchar(255) DEFAULT NULL,
  `spectators` smallint(5) DEFAULT '0',
  `version` int(10) DEFAULT '1220'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure `market_history`
--

CREATE TABLE `market_history` (
  `id` int(10) UNSIGNED NOT NULL,
  `player_id` int(11) NOT NULL,
  `sale` tinyint(1) NOT NULL DEFAULT '0',
  `itemtype` int(10) UNSIGNED NOT NULL,
  `amount` smallint(5) UNSIGNED NOT NULL,
  `price` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `expires_at` bigint(20) UNSIGNED NOT NULL,
  `inserted` bigint(20) UNSIGNED NOT NULL,
  `state` tinyint(1) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure `market_offers`
--

CREATE TABLE `market_offers` (
  `id` int(10) UNSIGNED NOT NULL,
  `player_id` int(11) NOT NULL,
  `sale` tinyint(1) NOT NULL DEFAULT '0',
  `itemtype` int(10) UNSIGNED NOT NULL,
  `amount` smallint(5) UNSIGNED NOT NULL,
  `created` bigint(20) UNSIGNED NOT NULL,
  `anonymous` tinyint(1) NOT NULL DEFAULT '0',
  `price` int(10) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure `newsticker`
--

CREATE TABLE `newsticker` (
  `id` int(10) UNSIGNED NOT NULL,
  `date` int(11) NOT NULL,
  `text` mediumtext NOT NULL,
  `icon` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure `pagseguro`
--

CREATE TABLE `pagseguro` (
  `date` datetime NOT NULL,
  `code` varchar(50) NOT NULL,
  `reference` varchar(200) NOT NULL,
  `type` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  `lastEventDate` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure `pagseguro_transactions`
--

CREATE TABLE `pagseguro_transactions` (
  `transaction_code` varchar(36) NOT NULL,
  `name` varchar(200) DEFAULT NULL,
  `payment_method` varchar(50) NOT NULL,
  `status` varchar(50) NOT NULL,
  `item_count` int(11) NOT NULL,
  `data` datetime NOT NULL,
  `payment_amount` float DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure `paypal_transactions`
--

CREATE TABLE `paypal_transactions` (
  `id` int(11) NOT NULL,
  `payment_status` varchar(70) NOT NULL DEFAULT '',
  `date` datetime NOT NULL,
  `payer_email` varchar(255) NOT NULL DEFAULT '',
  `payer_id` varchar(255) NOT NULL DEFAULT '',
  `item_number1` varchar(255) NOT NULL DEFAULT '',
  `mc_gross` float NOT NULL,
  `mc_currency` varchar(5) NOT NULL DEFAULT '',
  `txn_id` varchar(255) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure `players`
--

CREATE TABLE `players` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `group_id` int(11) NOT NULL DEFAULT '1',
  `account_id` int(11) NOT NULL DEFAULT '0',
  `level` int(11) NOT NULL DEFAULT '1',
  `vocation` int(11) NOT NULL DEFAULT '0',
  `health` int(11) NOT NULL DEFAULT '150',
  `healthmax` int(11) NOT NULL DEFAULT '150',
  `experience` bigint(20) NOT NULL DEFAULT '0',
  `exptoday` int(11) DEFAULT NULL,
  `lookbody` int(11) NOT NULL DEFAULT '0',
  `lookfeet` int(11) NOT NULL DEFAULT '0',
  `lookhead` int(11) NOT NULL DEFAULT '0',
  `looklegs` int(11) NOT NULL DEFAULT '0',
  `looktype` int(11) NOT NULL DEFAULT '136',
  `lookaddons` int(11) NOT NULL DEFAULT '0',
  `maglevel` int(11) NOT NULL DEFAULT '0',
  `mana` int(11) NOT NULL DEFAULT '0',
  `manamax` int(11) NOT NULL DEFAULT '0',
  `manaspent` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `soul` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `town_id` int(11) NOT NULL DEFAULT '0',
  `posx` int(11) NOT NULL DEFAULT '0',
  `posy` int(11) NOT NULL DEFAULT '0',
  `posz` int(11) NOT NULL DEFAULT '0',
  `conditions` blob NOT NULL,
  `cap` int(11) NOT NULL DEFAULT '0',
  `sex` int(11) NOT NULL DEFAULT '0',
  `lastlogin` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `lastip` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `save` tinyint(1) NOT NULL DEFAULT '1',
  `skull` tinyint(1) NOT NULL DEFAULT '0',
  `skulltime` bigint(20) NOT NULL DEFAULT '0',
  `lastlogout` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `blessings` tinyint(2) NOT NULL DEFAULT '0',
  `blessings1` tinyint(4) NOT NULL DEFAULT '0',
  `blessings2` tinyint(4) NOT NULL DEFAULT '0',
  `blessings3` tinyint(4) NOT NULL DEFAULT '0',
  `blessings4` tinyint(4) NOT NULL DEFAULT '0',
  `blessings5` tinyint(4) NOT NULL DEFAULT '0',
  `blessings6` tinyint(4) NOT NULL DEFAULT '0',
  `blessings7` tinyint(4) NOT NULL DEFAULT '0',
  `blessings8` tinyint(4) NOT NULL DEFAULT '0',
  `onlinetime` bigint(20) NOT NULL DEFAULT '0',
  `deletion` bigint(15) NOT NULL DEFAULT '0',
  `balance` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `bonusrerollcount` bigint(20) DEFAULT '0',
  `quickloot_fallback` tinyint(1) DEFAULT '0',
  `lookmountbody` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `lookmountfeet` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `lookmounthead` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `lookmountlegs` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `lookfamiliarstype` int(11) unsigned NOT NULL DEFAULT '0',
  `isreward` tinyint(1) NOT NULL DEFAULT '1',
  `istutorial` tinyint(1) NOT NULL DEFAULT '0',
  `offlinetraining_time` smallint(5) UNSIGNED NOT NULL DEFAULT '43200',
  `offlinetraining_skill` int(11) NOT NULL DEFAULT '-1',
  `stamina` smallint(5) UNSIGNED NOT NULL DEFAULT '2520',
  `skill_fist` int(10) UNSIGNED NOT NULL DEFAULT '10',
  `skill_fist_tries` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `skill_club` int(10) UNSIGNED NOT NULL DEFAULT '10',
  `skill_club_tries` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `skill_sword` int(10) UNSIGNED NOT NULL DEFAULT '10',
  `skill_sword_tries` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `skill_axe` int(10) UNSIGNED NOT NULL DEFAULT '10',
  `skill_axe_tries` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `skill_dist` int(10) UNSIGNED NOT NULL DEFAULT '10',
  `skill_dist_tries` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `skill_shielding` int(10) UNSIGNED NOT NULL DEFAULT '10',
  `skill_shielding_tries` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `skill_fishing` int(10) UNSIGNED NOT NULL DEFAULT '10',
  `skill_fishing_tries` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `deleted` tinyint(1) NOT NULL DEFAULT '0',
  `description` varchar(255) NOT NULL DEFAULT '',
  `comment` text NOT NULL,
  `create_ip` bigint(20) NOT NULL DEFAULT '0',
  `create_date` bigint(20) NOT NULL DEFAULT '0',
  `hide_char` int(11) NOT NULL DEFAULT '0',
  `skill_critical_hit_chance` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `skill_critical_hit_chance_tries` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `skill_critical_hit_damage` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `skill_critical_hit_damage_tries` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `skill_life_leech_chance` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `skill_life_leech_chance_tries` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `skill_life_leech_amount` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `skill_life_leech_amount_tries` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `skill_mana_leech_chance` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `skill_mana_leech_chance_tries` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `skill_mana_leech_amount` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `skill_mana_leech_amount_tries` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `skill_criticalhit_chance` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `skill_criticalhit_damage` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `skill_lifeleech_chance` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `skill_lifeleech_amount` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `skill_manaleech_chance` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `skill_manaleech_amount` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `manashield` SMALLINT UNSIGNED NOT NULL DEFAULT '0',
  `max_manashield` SMALLINT UNSIGNED NOT NULL DEFAULT '0',
  `prey_stamina_1` int(11) DEFAULT NULL,
  `prey_stamina_2` int(11) DEFAULT NULL,
  `prey_stamina_3` int(11) DEFAULT NULL,
  `prey_column` smallint(6) NOT NULL DEFAULT '1',
  `xpboost_stamina` int(11) DEFAULT NULL,
  `xpboost_value` int(10) DEFAULT NULL,
  `marriage_status` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `hide_skills` int(11) DEFAULT NULL,
  `hide_set` int(11) DEFAULT NULL,
  `former` varchar(255) NOT NULL DEFAULT '-',
  `signature` varchar(255) NOT NULL DEFAULT '',
  `marriage_spouse` int(11) NOT NULL DEFAULT '-1',
  `loyalty_ranking` tinyint(1) NOT NULL DEFAULT '0',
  `bonus_rerolls` bigint(21) NOT NULL DEFAULT '0',
  `critical` int(20) DEFAULT '0',
  `bonus_reroll` int(11) NOT NULL DEFAULT '0',
  `sbw_points` int(11) NOT NULL DEFAULT '0',
  `instantrewardtokens` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `charmpoints` int(11) DEFAULT '0',
  `direction` tinyint(1) DEFAULT '0',
  `lookmount` int(11) DEFAULT '0',
  `version` int(11) DEFAULT '1000',
  `lootaction` tinyint(2) DEFAULT '0',
  `spells` blob DEFAULT NULL,
  `storages` mediumblob DEFAULT NULL,
  `items` longblob DEFAULT NULL,
  `depotitems` longblob DEFAULT NULL,
  `inboxitems` longblob DEFAULT NULL,
  `rewards` longblob DEFAULT NULL,
  `varcap` int(11) NOT NULL DEFAULT '0',
  `charmExpansion` tinyint(2) DEFAULT '0',
  `bestiarykills` longblob DEFAULT NULL,
  `charms` longblob DEFAULT NULL,
  `bestiaryTracker` longblob DEFAULT NULL,
  `autoloot` blob DEFAULT NULL,
  `lastday` bigint(22) DEFAULT '0',
  `cast` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extracting data from the table `players`
--

INSERT INTO `players` (`id`, `name`, `group_id`, `account_id`, `level`, `vocation`, `health`, `healthmax`, `experience`, `exptoday`, `lookbody`, `lookfeet`, `lookhead`, `looklegs`, `looktype`, `lookaddons`, `maglevel`, `mana`, `manamax`, `manaspent`, `soul`, `town_id`, `posx`, `posy`, `posz`, `conditions`, `cap`, `sex`, `lastlogin`, `lastip`, `save`, `skull`, `skulltime`, `lastlogout`, `blessings`, `blessings1`, `blessings2`, `blessings3`, `blessings4`, `blessings5`, `blessings6`, `blessings7`, `blessings8`, `onlinetime`, `deletion`, `balance`, `bonusrerollcount`, `quickloot_fallback`, `lookmountbody`, `lookmountfeet`, `lookmounthead`, `lookmountlegs`, `lookfamiliarstype`, `isreward`, `offlinetraining_time`, `offlinetraining_skill`, `stamina`, `skill_fist`, `skill_fist_tries`, `skill_club`, `skill_club_tries`, `skill_sword`, `skill_sword_tries`, `skill_axe`, `skill_axe_tries`, `skill_dist`, `skill_dist_tries`, `skill_shielding`, `skill_shielding_tries`, `skill_fishing`, `skill_fishing_tries`, `deleted`, `description`, `comment`, `create_ip`, `create_date`, `hide_char`, `skill_critical_hit_chance`, `skill_critical_hit_chance_tries`, `skill_critical_hit_damage`, `skill_critical_hit_damage_tries`, `skill_life_leech_chance`, `skill_life_leech_chance_tries`, `skill_life_leech_amount`, `skill_life_leech_amount_tries`, `skill_mana_leech_chance`, `skill_mana_leech_chance_tries`, `skill_mana_leech_amount`, `skill_mana_leech_amount_tries`, `skill_criticalhit_chance`, `skill_criticalhit_damage`, `skill_lifeleech_chance`, `skill_lifeleech_amount`, `skill_manaleech_chance`, `skill_manaleech_amount`, `manashield`, `max_manashield`, `prey_stamina_1`, `prey_stamina_2`, `prey_stamina_3`, `prey_column`, `xpboost_stamina`, `xpboost_value`, `marriage_status`, `hide_skills`, `hide_set`, `former`, `signature`, `marriage_spouse`, `loyalty_ranking`, `bonus_rerolls`, `critical`, `bonus_reroll`, `sbw_points`, `instantrewardtokens`, `charmpoints`, `direction`, `lookmount`, `version`, `lootaction`, `spells`, `storages`, `items`, `depotitems`, `inboxitems`, `rewards`, `varcap`, `charmExpansion`, `bestiarykills`, `charms`, `bestiaryTracker`, `autoloot`, `lastday`, `cast`) VALUES
(1, 'Rook Sample', 1, 1, 2, 0, 155, 155, 100, NULL, 113, 115, 95, 39, 129, 0, 2, 60, 60, 5936, 0, 1, 0, 0, 0, '', 410, 1, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 43200, -1, 2520, 10, 0, 12, 155, 12, 155, 12, 155, 12, 93, 10, 0, 10, 0, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, NULL, NULL, '-', '', -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1000, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, 0, 0),
(2, 'Sorcerer Sample', 1, 1, 8, 1, 185, 185, 4200, NULL, 113, 115, 95, 39, 129, 0, 0, 90, 90, 0, 100, 8, 0, 0, 0, '', 470, 1, 0, 0, 1, 0, 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 43200, -1, 2520, 10, 0, 10, 0, 10, 0, 10, 0, 10, 0, 10, 0, 10, 0, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, NULL, NULL, '-', '', -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1000, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, 0, 0),
(3, 'Druid Sample', 1, 1, 8, 2, 185, 185, 4200, NULL, 113, 115, 95, 39, 129, 0, 0, 90, 90, 0, 100, 8, 0, 0, 0, '', 470, 1, 0, 0, 1, 0, 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 43200, -1, 2520, 10, 0, 10, 0, 10, 0, 10, 0, 10, 0, 10, 0, 10, 0, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, NULL, NULL, '-', '', -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1000, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, 0, 0),
(4, 'Paladin Sample', 1, 1, 8, 3, 185, 185, 4200, NULL, 113, 115, 95, 39, 129, 0, 0, 90, 90, 0, 100, 8, 0, 0, 0, '', 470, 1, 0, 0, 1, 0, 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 43200, -1, 2520, 10, 0, 10, 0, 10, 0, 10, 0, 10, 0, 10, 0, 10, 0, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, NULL, NULL, '-', '', -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1000, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, 0, 0),
(5, 'Knight Sample', 1, 1, 8, 4, 185, 185, 4200, NULL, 113, 115, 95, 39, 129, 0, 0, 90, 90, 0, 100, 8, 0, 0, 0, '', 470, 1, 0, 0, 1, 0, 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 43200, -1, 2520, 10, 0, 10, 0, 10, 0, 10, 0, 10, 0, 10, 0, 10, 0, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, NULL, NULL, '-', '', -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1000, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, 0, 0),
(6, 'GOD', 6, 1, 2, 0, 155, 155, 100, NULL, 113, 115, 95, 39, 75, 0, 0, 60, 60, 0, 0, 8, 0, 0, 0, '', 410, 1, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 43200, -1, 2520, 10, 0, 10, 0, 10, 0, 10, 0, 10, 0, 10, 0, 10, 0, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, NULL, NULL, '-', '', -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1000, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, 0, 0);

-- --------------------------------------------------------

--
-- Table structure `player_charm`
--

CREATE TABLE `player_charms` (
	`player_guid` INT(250) NOT NULL,
	`charm_points` VARCHAR(250) NULL,
	`charm_expansion` BOOLEAN NULL,
	`rune_wound` INT(250) NULL,
	`rune_enflame` INT(250) NULL,
	`rune_poison` INT(250) NULL,
	`rune_freeze` INT(250) NULL,
	`rune_zap` INT(250) NULL,
	`rune_curse` INT(250) NULL,
	`rune_cripple` INT(250) NULL,
	`rune_parry` INT(250) NULL,
	`rune_dodge` INT(250) NULL,
	`rune_adrenaline` INT(250) NULL,
	`rune_numb` INT(250) NULL,
	`rune_cleanse` INT(250) NULL,
	`rune_bless` INT(250) NULL,
	`rune_scavenge` INT(250) NULL,
	`rune_gut` INT(250) NULL,
	`rune_low_blow` INT(250) NULL,
	`rune_divine` INT(250) NULL,
	`rune_vamp` INT(250) NULL,
	`rune_void` INT(250) NULL,
	`UsedRunesBit` VARCHAR(250) NULL,
	`UnlockedRunesBit` VARCHAR(250) NULL,
	`tracker list` BLOB NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure `players_online`
--

CREATE TABLE `players_online` (
  `player_id` int(11) NOT NULL
) ENGINE=MEMORY DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure `player_binary_items`
--

CREATE TABLE `player_binary_items` (
  `player_id` int(11) NOT NULL,
  `type` int(11) NOT NULL,
  `items` longblob NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure `player_deaths`
  `rune_bless` int(11) DEFAULT NULL,
  `rune_scavenge` int(11) DEFAULT NULL,
  `rune_gut` int(11) DEFAULT NULL,
  `rune_low_blow` int(11) DEFAULT NULL,
  `rune_divine` int(11) DEFAULT NULL,
  `rune_vamp` int(11) DEFAULT NULL,
  `rune_void` int(11) DEFAULT NULL,
  `UsedRunesBit` varchar(250) DEFAULT NULL,
  `UnlockedRunesBit` varchar(250) DEFAULT NULL,
  `tracker list` blob DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `player_charms`
--

INSERT INTO `player_charms` (`player_guid`, `charm_points`, `charm_expansion`, `rune_wound`, `rune_enflame`, `rune_poison`, `rune_freeze`, `rune_zap`, `rune_curse`, `rune_cripple`, `rune_parry`, `rune_dodge`, `rune_adrenaline`, `rune_numb`, `rune_cleanse`, `rune_bless`, `rune_scavenge`, `rune_gut`, `rune_low_blow`, `rune_divine`, `rune_vamp`, `rune_void`, `UsedRunesBit`, `UnlockedRunesBit`, `tracker list`) VALUES
(224, '0', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '0', '0', ''),
(2102, '0', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '0', '0', ''),
(258, '0', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '0', '0', ''),
(250, '0', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '0', '0', ''),
(385, '0', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '0', '0', ''),
(1908, '0', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '0', '0', ''),
(2103, '0', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '0', '0', '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `player_deaths`
--

CREATE TABLE `player_deaths` (
  `player_id` int(11) NOT NULL,
  `time` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `level` int(11) NOT NULL DEFAULT 1,
  `killed_by` varchar(255) NOT NULL,
  `is_player` tinyint(1) NOT NULL DEFAULT 1,
  `mostdamage_by` varchar(100) NOT NULL,
  `mostdamage_is_player` tinyint(1) NOT NULL DEFAULT 0,
  `unjustified` tinyint(1) NOT NULL DEFAULT 0,
  `mostdamage_unjustified` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `player_depotitems`
--

CREATE TABLE `player_depotitems` (
  `player_id` int(11) NOT NULL,
  `sid` int(11) NOT NULL COMMENT 'any given range eg 0-100 will be reserved for depot lockers and all > 100 will be then normal items inside depots',
  `pid` int(11) NOT NULL DEFAULT 0,
  `itemtype` int(11) NOT NULL DEFAULT 0,
  `count` int(11) NOT NULL DEFAULT 0,
  `attributes` blob NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `player_former_names`
--

CREATE TABLE `player_former_names` (
  `id` int(11) NOT NULL,
  `player_id` int(11) NOT NULL,
  `former_name` varchar(35) NOT NULL,
  `date` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `player_hirelings`
--

CREATE TABLE `player_hirelings` (
  `id` int(11) NOT NULL,
  `player_id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `active` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `sex` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `posx` int(11) NOT NULL DEFAULT 0,
  `posy` int(11) NOT NULL DEFAULT 0,
  `posz` int(11) NOT NULL DEFAULT 0,
  `lookbody` int(11) NOT NULL DEFAULT 0,
  `lookfeet` int(11) NOT NULL DEFAULT 0,
  `lookhead` int(11) NOT NULL DEFAULT 0,
  `looklegs` int(11) NOT NULL DEFAULT 0,
  `looktype` int(11) NOT NULL DEFAULT 136
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `player_inboxitems`
--

CREATE TABLE `player_inboxitems` (
  `player_id` int(11) NOT NULL,
  `sid` int(11) NOT NULL,
  `pid` int(11) NOT NULL DEFAULT 0,
  `itemtype` int(11) NOT NULL DEFAULT 0,
  `count` int(11) NOT NULL DEFAULT 0,
  `attributes` blob NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `player_items`
--

CREATE TABLE `player_items` (
  `player_id` int(11) NOT NULL DEFAULT 0,
  `pid` int(11) NOT NULL DEFAULT 0,
  `sid` int(11) NOT NULL DEFAULT 0,
  `itemtype` int(11) NOT NULL DEFAULT 0,
  `count` int(11) NOT NULL DEFAULT 0,
  `attributes` blob NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `player_kills`
--

CREATE TABLE `player_kills` (
  `player_id` int(11) NOT NULL,
  `time` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `target` int(11) NOT NULL,
  `unavenged` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `player_misc`
--

CREATE TABLE `player_misc` (
  `player_id` int(11) NOT NULL,
  `info` blob NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `player_misc`
--

INSERT INTO `player_misc` (`player_id`, `info`) VALUES
(385, 0x7b7d),
(1908, 0x7b7d),
(258, 0x7b7d),
(2102, 0x7b7d),
(2103, 0x7b7d),
(250, 0x7b7d),
(224, 0x7b7d);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `player_namelocks`
--

CREATE TABLE `player_namelocks` (
  `player_id` int(11) NOT NULL,
  `reason` varchar(255) NOT NULL,
  `namelocked_at` bigint(20) NOT NULL,
  `namelocked_by` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `player_prey`
--

CREATE TABLE `player_prey` (
  `player_id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `mindex` smallint(6) NOT NULL,
  `mcolumn` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `player_preydata`
--

CREATE TABLE `player_preydata` (
  `player_id` int(11) NOT NULL,
  `data` blob NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `player_preytimes`
--

CREATE TABLE `player_preytimes` (
  `player_id` int(11) NOT NULL,
  `bonus_type1` int(11) NOT NULL,
  `bonus_value1` int(11) NOT NULL,
  `bonus_name1` varchar(50) NOT NULL,
  `bonus_type2` int(11) NOT NULL,
  `bonus_value2` int(11) NOT NULL,
  `bonus_name2` varchar(50) NOT NULL,
  `bonus_type3` int(11) NOT NULL,
  `bonus_value3` int(11) NOT NULL,
  `bonus_name3` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `player_preytimes`
--

INSERT INTO `player_preytimes` (`player_id`, `bonus_type1`, `bonus_value1`, `bonus_name1`, `bonus_type2`, `bonus_value2`, `bonus_name2`, `bonus_type3`, `bonus_value3`, `bonus_name3`) VALUES
(224, 0, 0, '', 0, 0, '', 0, 0, ''),
(2102, 0, 0, '', 0, 0, '', 0, 0, ''),
(258, 0, 0, '', 0, 0, '', 0, 0, ''),
(250, 0, 0, '', 0, 0, '', 0, 0, ''),
(385, 0, 0, '', 0, 0, '', 0, 0, ''),
(1908, 0, 0, '', 0, 0, '', 0, 0, ''),
(2103, 0, 0, '', 0, 0, '', 0, 0, '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `player_rewards`
--

CREATE TABLE `player_rewards` (
  `player_id` int(11) NOT NULL,
  `sid` int(11) NOT NULL,
  `pid` int(11) NOT NULL DEFAULT 0,
  `itemtype` int(11) NOT NULL DEFAULT 0,
  `count` int(11) NOT NULL DEFAULT 0,
  `attributes` blob NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `player_spells`
--

CREATE TABLE `player_spells` (
  `player_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `player_stash`
--

CREATE TABLE `player_stash` (
  `player_id` int(11) NOT NULL,
  `item_id` int(11) NOT NULL,
  `item_count` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `player_storage`
--

CREATE TABLE `player_storage` (
  `player_id` int(11) NOT NULL DEFAULT 0,
  `key` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `value` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `prey_slots`
--

CREATE TABLE `prey_slots` (
  `player_id` int(11) NOT NULL,
  `num` smallint(6) NOT NULL,
  `state` smallint(6) NOT NULL DEFAULT 1,
  `unlocked` tinyint(1) NOT NULL DEFAULT 0,
  `current` varchar(40) NOT NULL DEFAULT '',
  `monster_list` varchar(360) NOT NULL,
  `free_reroll_in` int(11) NOT NULL DEFAULT 0,
  `time_left` smallint(6) NOT NULL DEFAULT 0,
  `next_use` int(11) NOT NULL DEFAULT 0,
  `bonus_type` smallint(6) NOT NULL,
  `bonus_value` smallint(6) NOT NULL DEFAULT 0,
  `bonus_grade` smallint(6) NOT NULL DEFAULT 0,
  `tick` smallint(6) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `quickloot_containers`
--

CREATE TABLE `quickloot_containers` (
  `player_id` int(11) NOT NULL,
  `category_id` int(10) UNSIGNED NOT NULL,
  `cid` int(10) UNSIGNED NOT NULL,
  `sid` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sellchar`
--

CREATE TABLE `sellchar` (
  `id` int(11) NOT NULL,
  `name` varchar(40) NOT NULL,
  `vocation` int(11) NOT NULL,
  `price` int(11) NOT NULL,
  `status` varchar(40) NOT NULL,
  `oldid` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sell_players`
--

CREATE TABLE `sell_players` (
  `player_id` int(11) NOT NULL,
  `account` int(11) NOT NULL,
  `create` bigint(20) NOT NULL,
  `createip` bigint(20) NOT NULL,
  `coin` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sell_players_history`
--

CREATE TABLE `sell_players_history` (
  `player_id` int(11) NOT NULL,
  `accountold` int(11) NOT NULL,
  `accountnew` int(11) NOT NULL,
  `create` bigint(20) NOT NULL,
  `createip` bigint(20) NOT NULL,
  `buytime` bigint(20) NOT NULL,
  `buyip` bigint(20) NOT NULL,
  `coin` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `server_config`
--

CREATE TABLE `server_config` (
  `config` varchar(50) NOT NULL,
  `value` varchar(256) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `server_config`
--

INSERT INTO `server_config` (`config`, `value`) VALUES
('db_version', '18'),
('motd_hash', '1dc9b72741b6d9fd42a11026c3b77f97041b23ed'),
('motd_num', '5'),
('players_record', '122');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `snowballwar`
--

CREATE TABLE `snowballwar` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `score` int(11) NOT NULL,
  `data` varchar(255) NOT NULL,
  `hora` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `store_history`
--

CREATE TABLE `store_history` (
  `id` int(11) NOT NULL,
  `account_id` int(10) UNSIGNED NOT NULL,
  `mode` smallint(6) NOT NULL DEFAULT 0,
  `description` varchar(3500) NOT NULL,
  `coin_amount` int(11) NOT NULL,
  `time` bigint(20) UNSIGNED NOT NULL,
  `timestamp` int(11) NOT NULL DEFAULT 0,
  `coins` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `store_history`
--

INSERT INTO `store_history` (`id`, `account_id`, `mode`, `description`, `coin_amount`, `time`, `timestamp`, `coins`) VALUES
(1, 1159, 0, '30 Days of VIP Time', -45, 1663893878, 0, 0),
(2, 1159, 0, 'Alfa Boots', -40, 1663893926, 0, 0),
(3, 1159, 0, 'Full Revenant Outfit', -50, 1663893932, 0, 0),
(4, 1159, 0, 'tokens', -10, 1663893936, 0, 0),
(5, 1159, 0, 'Durable Exercise Bow', -7, 1663895048, 0, 0),
(6, 1159, 0, 'Durable Exercise Sword', -7, 1663895115, 0, 0),
(7, 1159, 0, 'slayer of destruction', -10, 1663895279, 0, 0),
(8, 1159, 0, 'earthheart cuirass', -10, 1663895317, 0, 0),
(9, 1159, 0, 'fireheart cuirass', -10, 1663895355, 0, 0),
(10, 1159, 0, 'bone fiddle', -17, 1663895419, 0, 0),
(11, 1159, 0, 'Full Golden', -150, 1663895430, 0, 0),
(12, 1159, 0, 'Dawn Strayer', -30, 1663895456, 0, 0),
(13, 1159, 0, 'Permanent Prey Slot', -70, 1663896523, 0, 0),
(14, 1159, 0, 'Full Stamina Refil', -15, 1663896526, 0, 0),
(15, 1159, 0, 'Prey Wildcard', -5, 1663896531, 0, 0),
(16, 1159, 0, 'Small Stamina Refil', -5, 1663896537, 0, 0),
(17, 1159, 0, 'Prey Wildcard', -5, 1663896546, 0, 0),
(18, 1159, 0, 'Alchemistic Bookstand', -10, 1663896949, 0, 0),
(19, 1159, 0, 'Sarcophagus', -12, 1663896959, 0, 0),
(20, 1159, 0, 'Terrarium Snake', -15, 1663896966, 0, 0),
(21, 1159, 0, 'Wooden Bookcase', -5, 1663897012, 0, 0),
(22, 1159, 0, 'Ferumbras Exercise Dummy', -70, 1663897021, 0, 0),
(23, 1159, 0, 'Alfa Boots', -40, 1663918147, 0, 0),
(24, 1159, 0, 'rod of destruction', -10, 1663918180, 0, 0),
(25, 1159, 0, 'Crystal Backpack', -10, 1663918191, 0, 0),
(26, 1159, 0, 'firemind raiment', -10, 1663918288, 0, 0),
(27, 1159, 0, 'make-do boots', -15, 1663918296, 0, 0),
(28, 1159, 0, 'bone fiddle', -17, 1663918307, 0, 0),
(29, 1159, 0, 'Lasting Exercise Rod', -15, 1663918632, 0, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tickets`
--

CREATE TABLE `tickets` (
  `ticket_id` int(11) NOT NULL,
  `ticket_subject` varchar(255) DEFAULT NULL,
  `ticket_author` varchar(255) DEFAULT NULL,
  `ticket_author_acc_id` int(11) NOT NULL,
  `ticket_last_reply` varchar(11) DEFAULT NULL,
  `ticket_admin_reply` int(11) DEFAULT NULL,
  `ticket_date` varchar(255) DEFAULT NULL,
  `ticket_ended` varchar(255) DEFAULT NULL,
  `ticket_status` varchar(255) DEFAULT NULL,
  `ticket_category` varchar(255) DEFAULT NULL,
  `ticket_description` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tickets_reply`
--

CREATE TABLE `tickets_reply` (
  `reply_id` int(11) NOT NULL,
  `ticket_id` int(11) DEFAULT NULL,
  `reply_author` varchar(255) DEFAULT NULL,
  `reply_message` varchar(255) DEFAULT NULL,
  `reply_date` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tile_store`
--

CREATE TABLE `tile_store` (
  `house_id` int(11) NOT NULL,
  `data` longblob NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `tile_store`
--

INSERT INTO `tile_store` (`house_id`, `data`) VALUES
(2628, 0x897f577b08010000006f1800),
(2628, 0x8d7f557b05010000006f1800),
(2628, 0x8e7f567b0601000000711800),
(2628, 0x8b7f597b08010000006f1800),
(2628, 0x8c7f587b06010000006f1800),
(2628, 0x8e7f5a7b0601000000711800),
(2628, 0x8c7f5b7b0701000000711800),
(2628, 0x8b7f5e7b04010000002c1900),
(2628, 0x8b7f5e7b05010000002c1900),
(2628, 0x8b7f5e7b06010000002c1900),
(2628, 0x897f5c7b08010000006f1800),
(2628, 0x8d7f5c7b05010000006f1800),
(2628, 0x8f7f5c7b06010000006f1800),
(2628, 0x8e7f5d7b07010000006f1800),
(2628, 0x8f7f5d7b08010000006f1800),
(2628, 0x917f557b06010000006f1800),
(2628, 0x947f557b05010000006f1800),
(2628, 0x917f587b06010000006f1800),
(2628, 0x917f5a7b0701000000711800),
(2628, 0x967f5a7b0701000000711800),
(2628, 0x917f5e7b0701000000711800),
(2628, 0x927f5e7b0701000000711800),
(2628, 0x977f5e7b04010000002c1900),
(2628, 0x947f5c7b05010000006f1800),
(2628, 0x977f5e7b05010000002c1900),
(2628, 0x947f5c7b06010000006f1800),
(2628, 0x987f5c7b04010000002d1900),
(2628, 0x987f5c7b05010000002d1900),
(2628, 0x987f5d7b06010000002d1900),
(2628, 0x987f5d7b07010000002d1900),
(2629, 0xc77f9c7b0602000000321900321900),
(2629, 0xc47f9f7b0701000000331900),
(2629, 0xc77f9c7b0701000000321900),
(2629, 0xc87f9e7b0601000000361800),
(2629, 0xca7f9c7b0602000000130700130700),
(2629, 0xcb7f9f7b0601000000c50400),
(2629, 0xc97f9e7b0701000000361800),
(2629, 0xca7f9c7b0701000000381800),
(2629, 0xc47fa17b0602000000251900251900),
(2629, 0xc47fa27b0701000000331900),
(2629, 0xc87fa17b0601000000361800),
(2629, 0xcb7fa07b0701000000381800),
(2629, 0xce7fa27b0601000000251900),
(2629, 0xc47fa57b0602000000251900251900),
(2629, 0xc77fa67b0601000000321900),
(2629, 0xc87fa57b0601000000c30400),
(2629, 0xcb7fa77b0801000000361800),
(2629, 0xcc7fa67b0601000000241900),
(2629, 0xce7fa47b0602000000351900351900),
(2629, 0xce7fa77b0801000000361800),
(2629, 0xca7fa87b0801000000381800),
(2629, 0xcd7fa87b0801000000381800),
(2630, 0xcb7fae7b0701000000351900),
(2630, 0xc87fb07b0701000000381800),
(2631, 0xca7faa7b0602000000341900341900),
(2631, 0xc77fae7b0602000000351900351900),
(2631, 0xcd7fac7b0601000000351900),
(2631, 0xc97fb07b0601000000c50400),
(2631, 0xcb7fb07b0601000000341900),
(2632, 0xb07f9b7b0701000000331900),
(2632, 0xb37f997b0701000000321900),
(2632, 0xb57f9b7b0701000000331900),
(2632, 0xb27f9e7b0701000000381800),
(2632, 0xb47f9e7b0701000000321900),
(2632, 0xb57f9d7b0701000000331900),
(2633, 0xb17f9a7b0601000000361800),
(2633, 0xb37f987b0602000000341900341900),
(2633, 0xb57f9a7b0601000000351900),
(2633, 0xb17f9c7b0601000000351900),
(2633, 0xb37f9e7b0601000000321900),
(2633, 0xb57f9c7b0601000000351900),
(2635, 0x977f937b0601000000c30400),
(2635, 0x9a7f917b0602000000341900341900),
(2635, 0x967f967b0401000000c50400),
(2637, 0x9c7f977b0601000000331900),
(2637, 0x977f9a7b0601000000361800),
(2637, 0x997f9b7b0601000000321900),
(2637, 0x9b7f9b7b0601000000241900),
(2638, 0x907f9b7b0401000000241900),
(2638, 0x917f9b7b0401000000241900),
(2638, 0x937f997b0401000000c30400),
(2638, 0x917f9b7b0501000000261900),
(2638, 0x927f997b0501000000c30400),
(2638, 0x917f9b7b0601000000321900),
(2638, 0x927f997b0601000000361800),
(2638, 0x937f997b0701000000361800),
(2640, 0x9c7f947b0701000000331900),
(2640, 0x987f997b0701000000361800),
(2640, 0x9c7f997b0701000000331900),
(2642, 0x977f937b0501000000c30400),
(2642, 0x9a7f917b0502000000241900241900),
(2644, 0x9c7f977b0501000000251900),
(2644, 0x977f9a7b0501000000c30400),
(2644, 0x997f9b7b0401000000241900),
(2644, 0x9b7f9b7b0401000000321900),
(2644, 0x997f9b7b0501000000241900),
(2644, 0x9b7f9b7b0501000000321900),
(2644, 0x9c7f997b0401000000331900),
(2644, 0x9c7f9a7b0401000000331900),
(2645, 0x947f917b0402000000321900321900),
(2645, 0x927f947b0402000000251900251900),
(2648, 0x9a7f917b0402000000241900241900),
(2648, 0x987f967b0401000000c50400),
(2648, 0x9c7f947b0401000000331900),
(2649, 0x8d7fa17b0701000000321900),
(2649, 0x8a7fa57b0701000000331900),
(2649, 0x8c7fa77b0701000000381800),
(2649, 0x8e7fa77b0701000000321900),
(2649, 0x917fa47b0701000000331900),
(2650, 0x7f7fa67b0701000000321900),
(2650, 0x827fa97b0701000000361800),
(2650, 0x807fae7b0701000000321900),
(2650, 0x827fac7b0701000000331900),
(2651, 0x8d7fad7b0701000000321900),
(2651, 0x8c7fb37b0701000000381800),
(2651, 0x8d7fb37b0701000000321900),
(2651, 0x907fb17b0701000000331900),
(2652, 0x7f7fba7b0701000000331900),
(2652, 0x827fb77b0701000000321900),
(2652, 0x857fba7b0701000000331900),
(2652, 0x817fbe7b0701000000321900),
(2652, 0x837fbe7b0701000000321900),
(2652, 0x857fbc7b0701000000361800),
(2653, 0x7f7fc97b0701000000341900),
(2653, 0x7b7fcd7b0701000000351900),
(2653, 0x7f7fcf7b0701000000321900),
(2653, 0x827fcb7b0701000000361800),
(2653, 0x827fcd7b0701000000351900),
(2654, 0xb07fc67b0601000000361800),
(2654, 0xb07fc67b0701000000361800),
(2654, 0xb57fc57b0501000000371800),
(2654, 0xb57fc57b0601000000371800),
(2654, 0xb77fc57b0701000000371800),
(2654, 0xb67fc87b0701000000381800),
(2655, 0xa67fb77b0701000000321900),
(2655, 0xa37fba7b0701000000331900),
(2655, 0xaa7fbb7b0701000000331900),
(2655, 0xa57fbd7b0701000000381800),
(2655, 0xa77fbd7b0701000000341900),
(2656, 0x727faa7b0701000000381800),
(2656, 0x737fae7b0701000000321900),
(2657, 0x717fa07b0701000000341900),
(2657, 0x727fa77b0701000000381800),
(2657, 0x757fa77b0701000000321900),
(2657, 0x767fa57b0701000000351900),
(2658, 0x6d7fa17b0602000000251900251900),
(2658, 0x707fa57b0601000000c50400),
(2658, 0x717fa57b0601000000261900),
(2659, 0x6f7fac7b0602000000351900351900),
(2659, 0x727fa97b0601000000381800),
(2659, 0x747fa97b0602000000241900241900),
(2659, 0x747fae7b0601000000321900),
(2659, 0x757fac7b0601000000331900),
(2660, 0x747f9f7b0602000000321900321900),
(2660, 0x767fa17b0601000000331900),
(2660, 0x767fa37b0601000000331900),
(2660, 0x747fa57b0601000000c50400),
(2660, 0x757fa57b0601000000241900),
(2661, 0x7f7fa77b0601000000321900),
(2661, 0x7b7fa97b0602000000331900331900),
(2661, 0x817fa97b0601000000361800),
(2661, 0x817faa7b0601000000331900),
(2662, 0x7e7fae7b0601000000241900),
(2662, 0x807fae7b0601000000321900),
(2662, 0x817fac7b0601000000351900),
(2662, 0x817fad7b0601000000361800),
(2663, 0x897fa27b0602000000271900271900),
(2663, 0x8c7fa27b0601000000c30400),
(2663, 0x8f7fa07b0602000000241900241900),
(2663, 0x8b7fa57b0601000000381800),
(2663, 0x8f7fa57b0601000000241900),
(2663, 0x917fa37b0601000000331900),
(2663, 0x907fa57b0601000000c50400),
(2664, 0xa77fb67b0602000000241900241900),
(2664, 0xa27fb97b0602000000331900331900),
(2664, 0xa47fb97b0601000000c50400),
(2664, 0xa67fb97b0601000000c50400),
(2664, 0xa87fba7b0601000000251900),
(2664, 0xa87fbb7b0601000000c30400),
(2664, 0xa27fbc7b06020000001a07001a0700),
(2664, 0xa47fbd7b0601000000241900),
(2664, 0xa77fbd7b0601000000241900),
(2664, 0xa87fbc7b0601000000331900),
(2665, 0x7e7fb87b0502000000331900331900),
(2665, 0x7e7fb87b06010000001a0700),
(2665, 0x827fb67b0502000000241900241900),
(2665, 0x827fb67b0602000000321900321900),
(2665, 0x837fb97b0501000000331900),
(2665, 0x817fb97b0601000000660600),
(2665, 0x837fb87b0601000000361800),
(2665, 0x837fb97b0601000000331900),
(2666, 0x7e7fbc7b0502000000251900251900),
(2666, 0x7e7fbc7b06010000001a0700),
(2666, 0x807fbe7b0501000000241900),
(2666, 0x827fbe7b0501000000241900),
(2666, 0x837fbc7b0501000000331900),
(2666, 0x807fbe7b0601000000321900),
(2666, 0x817fbd7b0601000000660600),
(2666, 0x827fbe7b0601000000241900),
(2666, 0x837fbc7b0601000000361800),
(2666, 0x837fbd7b0601000000331900),
(2687, 0x627e127c0701000000182800),
(2687, 0x637e177c0701000000222800),
(2687, 0x617e187c0701000000182800),
(2688, 0x447e167c07010000002c1900),
(2688, 0x467e167c0701000000711800),
(2688, 0x477e167c07010000002c1900),
(2689, 0x4d7e167c0701000000f82800),
(2689, 0x4f7e167c0701000000e72800),
(2689, 0x517e137c07010000002d1900),
(2690, 0x457e197c0701000000182800),
(2690, 0x477e197c0701000000242800),
(2690, 0x487e1e7c0701000000182800),
(2690, 0x497e1c7c0701000000222800),
(2691, 0x4d7e197c0701000000182800),
(2691, 0x4f7e197c0701000000242800),
(2691, 0x4b7e1c7c0701000000222800),
(2691, 0x4e7e1e7c0701000000182800),
(2692, 0x5b7e207c07010000002c1900),
(2692, 0x5c7e237c0701000000242800),
(2693, 0x5e7e237c0701000000242800),
(2693, 0x627e227c07010000002d1900),
(2694, 0x577e277c07010000002d1900),
(2694, 0x5a7e267c0701000000222800),
(2695, 0x5a7e2b7c07010000002c1900),
(2695, 0x5b7e2a7c0701000000222800),
(2696, 0x5f7e277c0701000000222800),
(2696, 0x627e277c07010000002d1900),
(2697, 0x5e7e2a7c0701000000222800),
(2697, 0x607e2b7c07010000002c1900),
(2698, 0x7e7e177c0701000000182800),
(2698, 0x7c7e1b7c0701000000242800),
(2698, 0x7f7e1b7c0701000000182800),
(2698, 0x817e197c0701000000192800),
(2699, 0x897e1b7c07010000001b2800),
(2699, 0x857e1d7c0701000000242800),
(2699, 0x877e1d7c0701000000182800),
(2700, 0x727e337c07010000002d1900),
(2700, 0x767e327c07010000006f1800),
(2700, 0x747e367c07010000002c1900),
(2701, 0x787e337c0701000000711800),
(2701, 0x787e367c07010000002c1900),
(2702, 0x797e327c07010000006f1800),
(2702, 0x7d7e337c07010000002d1900),
(2702, 0x7b7e367c07010000002c1900),
(2703, 0x857e2e7c0601000000701800),
(2703, 0x857e2c7c0701000000711800),
(2705, 0x907e367c0701000000222800),
(2705, 0x947e347c0701000000182800),
(2705, 0x967e377c0701000000192800),
(2705, 0x907e387c0701000000192800),
(2705, 0x967e397c0701000000222800),
(2705, 0x967e3b7c0701000000192800),
(2705, 0x927e3c7c0701000000182800),
(2705, 0x957e3c7c07010000001a2800),
(2706, 0x7a7e3b7c0701000000130700),
(2706, 0x7b7e3b7c0701000000242800),
(2706, 0x7c7e3b7c0701000000130700),
(2706, 0x7b7e3e7c0701000000680600),
(2706, 0x7b7e407c0701000000182800),
(2706, 0x7c7e407c0701000000242800),
(2707, 0x7e7e3b7c0701000000130700),
(2707, 0x7f7e3b7c0701000000242800),
(2707, 0x7f7e3e7c0701000000680600),
(2707, 0x807e3b7c0701000000130700),
(2707, 0x817e3d7c0701000000192800),
(2707, 0x7f7e407c0701000000242800),
(2708, 0x6a7e507c0701000000242800),
(2708, 0x6d7e537c0701000000192800),
(2708, 0x687e577c0701000000182800),
(2708, 0x6b7e577c0701000000182800),
(2708, 0x6d7e557c0701000000192800),
(2709, 0x477e4f7c07010000001b2800),
(2709, 0x4b7e4c7c0701000000242800),
(2709, 0x4d7e517c0701000000192800),
(2710, 0x397e5c7c0601000000182800),
(2710, 0x397e5d7c07010000001a0700),
(2710, 0x397e5e7c07010000006f1800),
(2710, 0x397e5f7c07010000001a0700),
(2710, 0x3d7e5d7c0601000000222800),
(2710, 0x3d7e5f7c0601000000222800),
(2710, 0x377e617c0601000000192800),
(2710, 0x377e637c0601000000192800),
(2710, 0x3a7e607c0601000000242800),
(2710, 0x397e637c07010000006f1800),
(2710, 0x3b7e617c0701000000711800),
(2710, 0x3d7e617c0601000000222800),
(2710, 0x3d7e637c0601000000222800),
(2710, 0x3f7e607c0701000000711800),
(2710, 0x387e647c0601000000242800),
(2710, 0x397e667c0601000000182800),
(2710, 0x3c7e667c0601000000182800),
(2710, 0x3d7e657c0601000000222800),
(2710, 0x3f7e667c0601000000182800),
(2710, 0x3d7e647c07010000002c1900),
(2710, 0x417e627c07010000002d1900),
(2711, 0x527e657c08010000006f1800),
(2711, 0x557e677c08010000001a0700),
(2711, 0x527e6a7c04010000002d1900),
(2711, 0x527e6a7c07010000002d1900),
(2711, 0x527e697c08010000006f1800),
(2711, 0x557e687c04010000002c1900),
(2711, 0x557e687c05010000002c1900),
(2711, 0x557e6b7c0501000000711800),
(2711, 0x547e6b7c0601000000711800),
(2711, 0x557e687c06010000002c1900),
(2711, 0x577e6a7c06010000006f1800),
(2711, 0x557e687c0701000000711800),
(2711, 0x567e6a7c07010000006f1800),
(2711, 0x557e687c08010000001a0700),
(2711, 0x597e687c0701000000130700),
(2711, 0x5a7e687c0701000000130700),
(2711, 0x5a7e6b7c0701000000711800),
(2711, 0x5b7e6a7c07010000002d1900),
(2711, 0x527e6d7c08010000006f1800),
(2711, 0x557e6f7c04010000002c1900),
(2711, 0x577e6c7c04010000002d1900),
(2711, 0x547e6e7c05010000006f1800),
(2711, 0x567e6f7c05010000002c1900),
(2711, 0x577e6d7c05010000002d1900),
(2711, 0x577e6e7c06010000006f1800),
(2711, 0x547e6f7c07010000002e1900),
(2711, 0x557e6c7c0701000000711800),
(2711, 0x567e6e7c07010000006f1800),
(2711, 0x597e6f7c07010000002e1900),
(2711, 0x587e6c7c0801000000711800),
(2712, 0x167e4e7c0501000000182800),
(2712, 0x147e4e7c0601000000182800),
(2712, 0x147e4e7c0701000000182800),
(2712, 0x1b7e4e7c0501000000182800),
(2712, 0x127e507c0501000000192800),
(2712, 0x127e517c0701000000192800),
(2712, 0x167e507c0601000000222800),
(2712, 0x167e527c0701000000222800),
(2712, 0x187e527c0501000000222800),
(2712, 0x197e527c0601000000242800),
(2712, 0x187e507c0701000000242800),
(2712, 0x197e527c0701000000222800),
(2712, 0x1e7e527c0501000000192800),
(2712, 0x1c7e527c0601000000242800),
(2712, 0x1e7e517c0601000000192800),
(2712, 0x1e7e517c0701000000192800),
(2712, 0x1e7e527c0701000000192800),
(2712, 0x127e547c0601000000192800),
(2712, 0x157e547c0501000000242800),
(2712, 0x177e577c0501000000192800),
(2712, 0x177e567c0601000000222800),
(2712, 0x167e577c0701000000222800),
(2712, 0x167e557c08010000006f1800),
(2712, 0x1b7e547c0501000000242800),
(2712, 0x187e547c0701000000242800),
(2712, 0x187e567c0801000000711800),
(2712, 0x197e557c08010000006f1800),
(2712, 0x1d7e547c0501000000182800),
(2712, 0x1e7e557c0601000000192800),
(2712, 0x157e597c0501000000182800),
(2712, 0x167e597c0601000000182800),
(2712, 0x147e597c0701000000182800),
(2712, 0x197e597c0601000000182800),
(2712, 0x197e597c0701000000182800),
(2712, 0x1b7e597c0701000000261900),
(2713, 0x2d7e4b7c0601000000182800),
(2713, 0x277e4d7c0701000000192800),
(2713, 0x297e4f7c0601000000182800),
(2713, 0x2a7e4d7c0601000000222800),
(2713, 0x297e4f7c0701000000182800),
(2713, 0x2a7e4e7c0701000000222800),
(2713, 0x287e4d7c0801000000c30400),
(2713, 0x2a7e4e7c0801000000c50400),
(2713, 0x2d7e4e7c0601000000242800),
(2713, 0x2f7e4d7c0601000000222800),
(2713, 0x2d7e4f7c0701000000242800),
(2713, 0x2f7e4d7c0701000000222800),
(2713, 0x327e4b7c0601000000182800),
(2713, 0x307e4b7c0701000000130700),
(2713, 0x337e4b7c0701000000242800),
(2713, 0x327e4e7c0701000000242800),
(2713, 0x347e4d7c0601000000192800),
(2713, 0x347e4d7c0701000000192800),
(2713, 0x2a7e517c0701000000222800),
(2713, 0x2f7e507c0601000000222800),
(2713, 0x2f7e537c0601000000222800),
(2713, 0x2c7e547c0601000000182800),
(2713, 0x2d7e547c0701000000182800),
(2713, 0x347e507c0601000000192800),
(2713, 0x347e537c0601000000192800),
(2713, 0x347e517c0701000000192800),
(2713, 0x347e527c0701000000192800),
(2713, 0x327e547c0601000000182800),
(2713, 0x327e547c0701000000182800),
(2714, 0x3d7e4d7c0701000000242800),
(2714, 0x3b7e507c0701000000192800),
(2714, 0x3f7e527c0601000000182800),
(2714, 0x3d7e527c0701000000182800),
(2714, 0x427e4f7c0701000000192800),
(2714, 0x427e507c0601000000192800),
(2714, 0x417e527c0701000000182800),
(2714, 0x427e517c0701000000192800),
(2715, 0x2d7e307c0701000000242800),
(2715, 0x2f7e337c0701000000192800),
(2715, 0x297e347c07010000001a0700),
(2715, 0x297e357c07010000001a0700),
(2715, 0x297e377c0701000000222800),
(2715, 0x2f7e367c0701000000192800),
(2715, 0x2c7e387c0701000000182800),
(2715, 0x2e7e387c0701000000242800),
(2716, 0x317e327c0701000000192800),
(2716, 0x347e307c0701000000182800),
(2716, 0x367e307c0701000000242800),
(2717, 0x317e367c0701000000192800),
(2717, 0x337e387c0701000000242800),
(2717, 0x357e387c07010000001a2800),
(2718, 0x3a7e307c0701000000242800),
(2718, 0x3c7e337c0701000000192800),
(2718, 0x3c7e357c0701000000192800),
(2718, 0x3a7e387c0701000000182800),
(2719, 0x317e327c0601000000192800),
(2719, 0x347e307c0601000000182800),
(2719, 0x367e337c0601000000222800),
(2720, 0x317e367c0601000000192800),
(2720, 0x367e367c0601000000222800),
(2720, 0x337e387c0601000000182800),
(2721, 0x387e337c0601000000222800),
(2721, 0x3a7e307c0601000000182800),
(2721, 0x3c7e327c0601000000192800),
(2722, 0x387e367c0601000000222800),
(2722, 0x3c7e367c0601000000192800),
(2722, 0x3b7e387c0601000000182800),
(2723, 0x477e377c0601000000182800),
(2723, 0x437e3a7c0601000000222800),
(2723, 0x497e397c0601000000192800),
(2723, 0x497e3b7c0601000000192800),
(2724, 0x437e3f7c0601000000222800),
(2724, 0x497e3e7c0601000000192800),
(2724, 0x457e417c0601000000182800),
(2724, 0x477e417c0601000000182800),
(2724, 0x497e407c0601000000192800),
(2725, 0x457e3b7c0701000000242800),
(2725, 0x497e397c0701000000192800),
(2727, 0x467e3d7c0701000000242800),
(2727, 0x497e3f7c0701000000192800),
(2727, 0x447e417c0701000000182800),
(2727, 0x477e417c0701000000182800),
(2729, 0x5b7e357c0701000000130700),
(2729, 0x5c7e357c0701000000130700),
(2729, 0x5a7e387c0701000000660600),
(2730, 0x5b7e3b7c0701000000130700),
(2730, 0x5c7e3b7c0701000000130700),
(2730, 0x5a7e3e7c0701000000660600),
(2731, 0x5b7e417c0701000000130700),
(2731, 0x5c7e417c0701000000130700),
(2731, 0x5a7e447c0701000000660600),
(2732, 0x5e7e337c0601000000192800),
(2732, 0x647e337c0601000000222800),
(2732, 0x607e357c0601000000182800),
(2732, 0x637e357c0601000000182800),
(2733, 0x6a7e337c0602000000130700130700),
(2733, 0x6b7e337c0601000000130700),
(2733, 0x6c7e337c0601000000242800),
(2733, 0x687e357c0601000000192800),
(2733, 0x687e377c0601000000192800),
(2733, 0x6b7e367c0601000000680600),
(2733, 0x6d7e347c0601000000192800),
(2733, 0x6d7e377c0601000000222800),
(2733, 0x6b7e397c0601000000182800),
(2734, 0x727e327c06010000002f1900),
(2734, 0x767e327c06010000006f1800),
(2734, 0x747e367c06010000002e1900),
(2735, 0x787e337c0601000000711800),
(2735, 0x787e367c06010000002c1900),
(2736, 0x797e327c06010000006f1800),
(2736, 0x7d7e327c06010000002d1900),
(2736, 0x7b7e367c06010000002c1900),
(2737, 0x6d7e147c0601000000192800),
(2737, 0x707e167c0601000000242800),
(2737, 0x737e147c0601000000192800),
(2738, 0x737e197c0601000000222800),
(2738, 0x767e1b7c0601000000182800),
(2738, 0x787e197c0601000000192800),
(2739, 0x607e127c0601000000182800),
(2739, 0x637e177c0601000000222800),
(2739, 0x607e187c0601000000182800),
(2740, 0x657e167c0601000000242800),
(2740, 0x697e147c0601000000192800),
(2741, 0x5c7e237c0601000000242800),
(2742, 0x5e7e237c0601000000242800),
(2743, 0x5a7e277c0601000000222800),
(2744, 0x5f7e277c0601000000222800),
(2745, 0x5e7e287c0601000000242800),
(2746, 0x5b7e287c0601000000242800),
(2747, 0x687e257c06010000006f1800),
(2747, 0x6c7e267c06010000006f1800),
(2747, 0x697e2b7c05010000001a2800),
(2747, 0x687e297c06010000006f1800),
(2751, 0x7a7e567c0601000000182800),
(2751, 0x787e597c0601000000192800),
(2751, 0x7a7e5b7c0601000000242800),
(2751, 0x7b7e5b7c0601000000182800),
(2752, 0x7e7e567c0601000000182800),
(2752, 0x7e7e5b7c0601000000242800),
(2752, 0x7f7e5b7c0601000000182800),
(2753, 0x817e567c0601000000182800),
(2753, 0x837e5b7c0601000000242800),
(2753, 0x867e597c0601000000192800),
(2755, 0x797e617c0601000000182800),
(2755, 0x7a7e617c0601000000242800),
(2755, 0x7d7e617c0601000000182800),
(2755, 0x767e647c0601000000192800),
(2755, 0x787e657c0601000000182800),
(2755, 0x797e657c0601000000182800),
(2755, 0x7c7e657c0601000000182800),
(2755, 0x7d7e657c0601000000182800),
(2757, 0x817e617c0601000000182800),
(2757, 0x827e617c0601000000242800),
(2757, 0x857e617c0601000000182800),
(2757, 0x807e657c0601000000182800),
(2757, 0x817e657c0601000000182800),
(2757, 0x847e657c0601000000182800),
(2757, 0x857e657c0601000000182800),
(2757, 0x867e647c0601000000192800),
(2759, 0x7c7e567c0501000000182800),
(2759, 0x787e587c0501000000192800),
(2759, 0x7b7e5a7c0501000000182800),
(2759, 0x7d7e5a7c0501000000242800),
(2760, 0x837e567c05010000001a2800),
(2760, 0x817e5a7c0501000000242800),
(2760, 0x847e5b7c05010000001a2800),
(2760, 0x867e587c05010000001b2800),
(2761, 0x827e637c0501000000222800),
(2761, 0x857e617c0501000000182800),
(2761, 0x867e637c0501000000192800),
(2761, 0x847e657c0501000000182800),
(2761, 0x857e657c0501000000182800),
(2761, 0x867e647c0501000000192800),
(2763, 0x4a7e137c0601000000f02800),
(2763, 0x507e137c06010000006f1800),
(2764, 0x647e307c0501000000222800),
(2764, 0x647e337c0501000000192800),
(2764, 0x607e357c0501000000182800),
(2764, 0x627e357c0501000000182800),
(2765, 0x3b7e257c05010000006f1800),
(2765, 0x3e7e2b7c05010000002c1900),
(2765, 0x407e267c05010000002d1900),
(2765, 0x407e297c05010000002f1900),
(2767, 0x377e267c0501000000711800),
(2767, 0x357e2b7c05010000002c1900),
(2767, 0x397e2b7c05010000002c1900),
(2768, 0x977e137c0601000000182800),
(2768, 0x967e137c0701000000182800),
(2768, 0x987e137c0701000000252800),
(2768, 0x937e157c0601000000192800),
(2768, 0x937e167c0701000000192800),
(2768, 0x9b7e167c0701000000192800),
(2768, 0x937e187c0601000000192800),
(2768, 0x937e197c0701000000192800),
(2768, 0x977e1b7c06010000001a2800),
(2768, 0x957e1b7c0701000000182800),
(2768, 0x977e1b7c0701000000242800),
(2768, 0x967e1b7c0801000000711800),
(2768, 0x997e1b7c0701000000182800),
(2768, 0x9b7e197c0701000000192800),
(2768, 0x967e287c0801000000711800),
(2769, 0xa37e117c07010000001a0700),
(2769, 0xa37e127c07010000001a0700),
(2769, 0xa77e107c0601000000c30400),
(2769, 0xa77e137c0601000000c30400),
(2769, 0xa97e117c0601000000251900),
(2769, 0xa97e117c0701000000081400),
(2769, 0xaf7e117c0701000000081400),
(2769, 0xaf7e127c0701000000081400),
(2769, 0xa37e167c0601000000251900),
(2769, 0xa77e177c0601000000c50400),
(2769, 0xa77e157c0701000000ff1300),
(2769, 0xa97e167c0501000000251900),
(2769, 0xa97e167c0601000000c30400),
(2769, 0xab7e147c0801000000081400),
(2769, 0xac7e147c0701000000ff1300),
(2769, 0xaf7e177c0701000000431900),
(2769, 0xa77e1a7c0501000000241900),
(2769, 0xa97e197c0601000000251900),
(2769, 0xa97e187c0701000000081400),
(2769, 0xa87e187c0801000000ff1300),
(2769, 0xab7e1a7c0801000000081400),
(2769, 0xac7e1a7c0701000000421900),
(2770, 0x817f6f7b0701000000351900),
(2770, 0x857f6d7b0701000000341900),
(2770, 0x877f707b0701000000351900),
(2770, 0x877f727b0701000000361800),
(2771, 0x807f6e7b0601000000331900),
(2771, 0x847f6c7b0601000000321900),
(2771, 0x867f6e7b0601000000251900),
(2771, 0x867f6f7b0601000000361800),
(2772, 0x807f727b0601000000271900),
(2772, 0x867f727b0601000000271900),
(2772, 0x867f737b0601000000361800),
(2772, 0x827f747b0601000000321900),
(2772, 0x847f747b0601000000241900),
(2773, 0x9b7f747b0601000000321900),
(2773, 0x987f797b0601000000331900),
(2773, 0x9a7f7b7b0601000000321900),
(2773, 0x9c7f7b7b0601000000381800),
(2774, 0x9e7f747b0601000000321900),
(2774, 0x9f7f7b7b0601000000381800),
(2774, 0xa17f7b7b0601000000321900),
(2774, 0xa27f7a7b0601000000331900),
(2775, 0xce7f7f7b0701000000321900),
(2775, 0xcc7f827b0701000000331900),
(2775, 0xcd7f847b0701000000381800),
(2776, 0xcd7f7e7b0601000000341900),
(2776, 0xcd7f847b0601000000381800),
(2776, 0xcf7f847b0601000000341900),
(2776, 0xd17f807b0601000000251900),
(2776, 0xd17f827b0601000000251900),
(2777, 0xa67f617b0601000000321900),
(2777, 0xa27f657b0601000000251900),
(2777, 0xa47f677b0601000000381800),
(2777, 0xa67f677b0601000000341900),
(2777, 0xa77f677b0601000000341900),
(2777, 0xa87f657b0601000000351900),
(2778, 0xaf7f677b0601000000321900),
(2778, 0xb07f627b0601000000321900),
(2778, 0xb17f637b0601000000c30400),
(2778, 0xb07f677b0601000000381800),
(2778, 0xb37f677b0601000000381800),
(2778, 0xb47f677b0601000000321900),
(2779, 0xb77f627b0601000000341900),
(2779, 0xb77f677b0601000000381800),
(2779, 0xb87f677b0601000000321900),
(2779, 0xb97f667b0601000000331900),
(2780, 0xb67f6e7b0601000000341900),
(2780, 0xb37f707b0601000000361800),
(2780, 0xb37f727b0601000000351900),
(2780, 0xb87f707b0601000000351900),
(2780, 0xb87f727b0601000000351900),
(2780, 0xb57f747b0601000000341900),
(2780, 0xb67f747b0601000000341900),
(2781, 0xac7f7a7b0601000000351900),
(2781, 0xae7f787b0601000000341900),
(2781, 0xae7f7d7b0601000000321900),
(2781, 0xb17f7a7b0601000000331900),
(2781, 0xb07f7d7b0601000000381800),
(2781, 0xb17f7c7b0601000000331900),
(2782, 0x807fca7b0601000000c50400),
(2782, 0x817fcf7b0601000000341900),
(2782, 0x827fcc7b0601000000271900),
(2783, 0x7c7fca7b0601000000c50400),
(2783, 0x7a7fce7b0602000000251900251900),
(2783, 0x7c7fcf7b0601000000241900),
(2784, 0xb57f6f7b0701000000321900),
(2784, 0xb57f747b0701000000381800),
(2785, 0xa37f657b0701000000351900),
(2785, 0xa87f657b0701000000331900),
(2785, 0xa87f687b0701000000361800),
(2786, 0x1f7fae7b0701000000711800),
(2786, 0x207fa57b0501000000711800),
(2786, 0x247fa77b07010000006f1800),
(2786, 0x227faa7b06010000006f1800),
(2786, 0x217faa7b0801000000711800),
(2786, 0x237fa97b08010000006f1800),
(2786, 0x247fa87b05010000006f1800),
(2786, 0x247faa7b07010000006f1800),
(2786, 0x207fac7b0601000000711800),
(2786, 0x227faf7b06010000006f1800),
(2786, 0x247fae7b07010000006f1800),
(2786, 0x227fb17b0701000000711800),
(2786, 0x237fb17b0701000000711800),
(2787, 0xbb7f0f7c0601000000130700),
(2787, 0xbc7f0f7c0601000000130700),
(2787, 0xb97f137c0501000000711800),
(2787, 0xba7f137c0701000000711800),
(2787, 0xbd7f137c0601000000711800),
(2787, 0xbb7f177c04010000002d1900),
(2787, 0xbb7f177c05010000002d1900),
(2787, 0xbb7f167c06010000006f1800),
(2787, 0xb87f157c07010000006f1800),
(2787, 0xbb7f167c07010000006f1800),
(2787, 0xbf7f167c06010000006f1800),
(2787, 0xb87f197c04010000002c1900),
(2787, 0xb87f197c05010000002c1900),
(2787, 0xba7f187c0701000000711800),
(2787, 0xbd7f1a7c07010000006f1800),
(2787, 0xbf7f187c0701000000711800),
(2787, 0xba7f1c7c0701000000711800),
(2787, 0xc17f127c0501000000711800),
(2787, 0xc27f147c03010000006f1800),
(2787, 0xc17f167c07010000006f1800),
(2787, 0xc47f157c0301000000711800),
(2787, 0xc57f167c03010000002d1900),
(2787, 0xc57f167c04010000002d1900),
(2787, 0xc47f147c0501000000711800),
(2787, 0xc57f167c05010000002d1900),
(2787, 0xc57f167c06010000002d1900),
(2787, 0xc27f197c03010000002c1900),
(2787, 0xc27f197c04010000002c1900),
(2787, 0xc27f197c05010000002c1900),
(2787, 0xc57f187c03010000002d1900),
(2788, 0x157ef07b0701000000c50400),
(2789, 0x1b7e167c0701000000c30400),
(2790, 0x107e167c0701000000c50400),
(2791, 0x457eec7b0701000000c30400),
(2792, 0x8b7e377c0601000000192800),
(2792, 0x8a7e3b7c0601000000182800),
(2792, 0x8b7e397c0601000000222800),
(2793, 0x837e377c0701000000192800),
(2793, 0x877e377c0601000000192800),
(2793, 0x897e357c0701000000242800),
(2793, 0x8b7e377c0701000000192800),
(2793, 0x867e3b7c0701000000182800),
(2793, 0x897e3b7c0701000000182800),
(2794, 0x897dbc7b0701000000241900),
(2794, 0x8c7dbc7b0701000000241900),
(2794, 0x8d7dbc7b0701000000c50400),
(2794, 0x8e7dbc7b0701000000241900),
(2794, 0x8a7dc07b0701000000c30400),
(2795, 0x917dba7b0701000000c30400),
(2795, 0x967db97b0701000000251900),
(2795, 0x967dbb7b0701000000251900),
(2795, 0x947dbc7b0701000000241900),
(2796, 0x847db77b0701000000c50400),
(2796, 0x887dba7b0801000000711800),
(2796, 0x857dbc7b08010000006f1800),
(2797, 0x857db37b0601000000251900),
(2797, 0x857db37b0701000000251900),
(2797, 0x887db17b0601000000241900),
(2797, 0x887db17b0701000000c50400),
(2797, 0x857db57b0601000000251900),
(2797, 0x857db57b0701000000251900),
(2798, 0x7e7dac7b0601000000251900),
(2798, 0x817da97b0601000000241900),
(2798, 0x837dab7b0601000000c30400),
(2799, 0x9c7da47b0601000000241900),
(2799, 0x9d7da67b0601000000c30400),
(2799, 0x9d7da77b0601000000251900),
(2800, 0x987da77b0701000000c30400),
(2800, 0x9c7da47b0701000000241900),
(2801, 0x937da67b0701000000241900),
(2801, 0x957daa7b0701000000c30400),
(2801, 0x937dad7b0701000000241900),
(2801, 0x957dac7b0701000000251900),
(2802, 0x9c7db17b0701000000c50400),
(2802, 0x997db47b0701000000251900),
(2802, 0x9c7db67b0701000000241900),
(2802, 0x9e7db47b0701000000c30400),
(2802, 0xa17db67b0701000000241900),
(2802, 0xa37db47b0701000000251900),
(2803, 0x9b7dae7b0701000000c50400),
(2803, 0x997dac7b08010000006f1800),
(2803, 0x9c7dae7b0701000000241900),
(2804, 0x9a7dae7b0601000000241900),
(2804, 0x9c7dae7b0601000000241900),
(2804, 0x9d7dad7b0601000000c30400),
(2804, 0x9f7dae7b0601000000241900),
(2804, 0xa17dae7b0601000000241900),
(2804, 0xa27dac7b0601000000c30400),
(2805, 0xa27dab7b0701000000251900),
(2805, 0xa07dae7b0701000000c50400),
(2805, 0xa17dae7b0701000000241900),
(2806, 0x147ecf7b0601000000721b00),
(2806, 0x147ecf7b07010000002d1900),
(2806, 0x107ed17b0601000000711b00),
(2806, 0x127ed17b0601000000711b00),
(2806, 0x107ed17b0701000000711800),
(2806, 0x127ed17b07010000002c1900),
(2807, 0x067ed17b0601000000241900),
(2807, 0x067ed17b07010000002c1900),
(2807, 0x077ed17b0701000000711800),
(2807, 0x087ed07b0601000000251900),
(2807, 0x087ed07b07010000002d1900),
(2808, 0x097ed67b0601000000711b00),
(2808, 0x097ed67b0701000000711800),
(2808, 0x0b7ed87b0601000000721b00),
(2808, 0x097eda7b07010000002c1900),
(2808, 0x0b7ed87b07010000002d1900),
(2809, 0x487e147c0601000000f02800),
(2810, 0xf47e777b0701000000241900),
(2810, 0xf67e777b0701000000c50400),
(2810, 0xf97e7a7b0701000000251900),
(2810, 0xf57e7e7b0701000000241900),
(2810, 0xf77e7e7b0701000000241900),
(2810, 0xf97e7c7b0701000000251900),
(2811, 0xf77e6e7b0701000000241900),
(2811, 0xfa7e717b0701000000251900),
(2811, 0xfa7e727b0701000000251900),
(2811, 0xf77e747b0701000000c50400),
(2812, 0xef7e6e7b0701000000241900),
(2812, 0xeb7e727b0701000000c30400),
(2812, 0xee7e747b0701000000241900),
(2812, 0xf07e747b0701000000241900),
(2813, 0xdc7e797b0601000000241900),
(2813, 0xde7e797b0601000000c50400),
(2813, 0xe17e7b7b0601000000c30400),
(2813, 0xe17e7e7b0601000000251900),
(2813, 0xdd7e807b0601000000241900),
(2813, 0xdf7e807b0601000000241900),
(2814, 0xdd7e767b0701000000241900),
(2814, 0xdf7e767b0701000000241900),
(2814, 0xda7e797b0701000000251900),
(2814, 0xe17e797b0701000000c30400),
(2815, 0xda7e7e7b0701000000251900),
(2815, 0xe17e7e7b0701000000c30400),
(2815, 0xdd7e807b0701000000241900),
(2815, 0xdf7e807b0701000000241900),
(2816, 0xe07e4a7c0701000000da1300),
(2816, 0xe37e4b7c0701000000dc1300),
(2816, 0xe47e4b7c0601000000dc1300),
(2816, 0xe37e507c0701000000a61400),
(2817, 0x237eb07b06010000006f1800),
(2817, 0x257eb17b05010000006f1800),
(2817, 0x257eb07b06010000006f1800),
(2817, 0x287eb27b0501000000f82800),
(2817, 0x2a7eb27b0501000000f82800),
(2817, 0x297eb27b0701000000711800),
(2817, 0x2b7eb27b0801000000711800),
(2817, 0x2c7eb17b05010000006f1800),
(2817, 0x2e7eb27b0501000000711800),
(2817, 0x2c7eb07b06010000006f1800),
(2817, 0x207eb47b05010000001a0700),
(2817, 0x207eb57b05010000001a0700),
(2817, 0x237eb47b06010000006f1800),
(2817, 0x257eb47b05010000002d1900),
(2817, 0x257eb77b0501000000f92800),
(2817, 0x257eb47b06010000002d1900),
(2817, 0x257eb77b0601000000f92800),
(2817, 0x257eb47b07010000002d1900),
(2817, 0x257eb57b07010000006f1800),
(2817, 0x257eb77b0701000000f92800),
(2817, 0x297eb47b08010000006f1800),
(2817, 0x2e7eb77b0501000000f82800),
(2817, 0x2e7eb77b0601000000e72800),
(2817, 0x2c7eb57b07010000006f1800),
(2817, 0x2e7eb77b0701000000711800),
(2817, 0x2e7eb47b0801000000711800),
(2817, 0x227eba7b0501000000f82800),
(2817, 0x237eb87b06010000006f1800),
(2817, 0x237eba7b0701000000f82800),
(2817, 0x257eb97b0601000000f02800),
(2817, 0x257eb97b07010000006f1800),
(2817, 0x297eba7b0701000000711800),
(2817, 0x297eb87b08010000006f1800),
(2817, 0x307eb07b05010000002d1900),
(2817, 0x307eb07b06010000002d1900),
(2817, 0x307eb07b07010000002d1900),
(2817, 0x307eb37b08010000006f1800),
(2817, 0x307eb57b05010000002d1900),
(2817, 0x307eb57b06010000002d1900),
(2817, 0x307eb57b07010000002d1900),
(2818, 0xa97dab7b0601000000251900),
(2818, 0xab7da97b0601000000130700),
(2818, 0xad7dab7b0601000000c30400),
(2818, 0xaf7da97b0601000000241900),
(2818, 0xae7da97b0701000000241900),
(2818, 0xa97daf7b0601000000251900),
(2818, 0xa97dad7b0701000000251900),
(2818, 0xab7dae7b0701000000c50400),
(2818, 0xab7daf7b0801000000c50400),
(2818, 0xac7dac7b0601000000c50400),
(2818, 0xac7dac7b0701000000c30400),
(2818, 0xae7dad7b0701000000c50400),
(2818, 0xac7dac7b0801000000c30400),
(2818, 0xaf7daf7b0801000000c50400),
(2818, 0xb07dae7b0601000000c30400),
(2818, 0xb27dad7b0701000000c50400),
(2818, 0xb07dae7b0801000000c30400),
(2818, 0xb47dac7b0601000000251900),
(2818, 0xb47dac7b0701000000251900),
(2818, 0xa97db07b0701000000c30400),
(2818, 0xab7db37b0701000000241900),
(2818, 0xac7db37b0601000000241900),
(2818, 0xad7db37b0601000000241900),
(2818, 0xac7db07b0701000000c30400),
(2818, 0xaf7db37b0701000000241900),
(2818, 0xb07db17b0601000000c30400),
(2818, 0xb17db37b0701000000241900),
(2818, 0xb17db17b0801000000c30400),
(2818, 0xb47db07b0701000000251900),
(2818, 0xb47db17b0701000000251900),
(2819, 0x097f6b7b06010000001a0700),
(2819, 0x0c7f6a7b0701000000711800),
(2819, 0x0f7f6b7b0801000000711800),
(2819, 0x097f6c7b06010000001a0700),
(2819, 0x0e7f6c7b05010000006f1800),
(2819, 0x0c7f6e7b0701000000711800),
(2819, 0x0f7f6e7b0801000000711800),
(2819, 0x147f6b7b0801000000711800),
(2819, 0x117f6c7b05010000006f1800),
(2819, 0x127f6f7b0701000000711800),
(2819, 0x137f6e7b0801000000711800),
(2819, 0x097f707b07010000006f1800),
(2819, 0x097f717b07010000006f1800),
(2819, 0x0e7f717b05010000006f1800),
(2819, 0x0e7f717b06010000006f1800),
(2819, 0x0e7f717b07010000006f1800),
(2819, 0x117f717b05010000006f1800),
(2820, 0x847fb77c0201000000632100),
(2820, 0x8a7fb97c0201000000632100),
(2820, 0x8f7fbd7c0201000000652100),
(2820, 0x937fb67c0201000000632100),
(2820, 0x937fbb7c0201000000632100),
(2820, 0x937fb97c0301000000632100),
(2821, 0x897f907c0801000000d52300),
(2822, 0x687fb37c0501000000632100),
(2823, 0x677faa7c0501000000632100),
(2823, 0x667fad7c0501000000632100),
(2824, 0x607fb17c0501000000652100),
(2825, 0x647fb47c0501000000652100),
(2826, 0x5d7faa7c0501000000632100),
(2826, 0x5c7fad7c0501000000632100),
(2827, 0x5c7fb37c0501000000632100),
(2828, 0x5e7fb37c0b01000000652100),
(2828, 0x5f7fb37c0c01000000652100),
(2828, 0x5b7fb57c0c01000000652100),
(2829, 0x517fa77c0c01000000632100),
(2830, 0x517fa37c0c01000000632100),
(2831, 0x517fa67c0b01000000632100),
(2832, 0x517fa17c0b01000000632100),
(2835, 0x5a7fa67c0b01000000652100),
(2836, 0x5e7fa67c0b01000000652100),
(2837, 0x5e7fa37c0b01000000652100),
(2838, 0x5b7fa37c0b01000000652100),
(2839, 0x7c7fbd7c0801000000632100),
(2839, 0x7f7fbd7c0801000000660600),
(2839, 0x807fba7c0801000000130700),
(2839, 0x817fba7c0801000000130700),
(2840, 0x7c7fb67c0801000000632100),
(2840, 0x7f7fb67c0801000000660600),
(2840, 0x807fb47c0801000000130700),
(2840, 0x817fb47c0801000000130700),
(2841, 0x777fbb7c0801000000680600),
(2841, 0x797fba7c0801000000632100),
(2841, 0x757fbc7c08010000001a0700),
(2841, 0x757fbd7c08010000001a0700),
(2842, 0x777fb37c0801000000652100),
(2842, 0x757fb67c08010000001a0700),
(2842, 0x757fb77c08010000001a0700),
(2842, 0x777fb57c0801000000680600),
(2843, 0x767f907c0701000000632100),
(2844, 0x8b7f927c0201000000632100),
(2845, 0x897f9b7c0201000000632100),
(2846, 0x867fa47c0201000000632100),
(2847, 0x827fae7c0201000000632100),
(2849, 0x737fb27c0201000000652100),
(2849, 0x707fb57c0201000000632100),
(2850, 0x967fc47d08010000001a0700),
(2850, 0x997fc67d0801000000680600),
(2852, 0x937fcb7d08010000001a0700),
(2852, 0x9a7fc97d0801000000680600),
(2853, 0x977fd27d0801000000de3200),
(2854, 0x877fd47d0801000000dc3200),
(2855, 0x977fd27d0701000000de3200),
(2856, 0x8a7fd47d0701000000dc3200),
(2856, 0x8a7fd47d0801000000dc3200),
(2857, 0x887fd47d0601000000dc3200),
(2858, 0x847fcc7d0701000000dc3200),
(2859, 0x5f7fa97c0401000000652100),
(2859, 0x647fab7c0401000000652100),
(2859, 0x647fb07c0401000000652100),
(2860, 0x5f7fb27c0401000000652100),
(2861, 0x597fa87c0401000000632100),
(2862, 0x597faf7c0401000000632100),
(2863, 0x527fb47c0401000000632100),
(2864, 0x7e7fbb7c0901000000632100),
(2865, 0x7e7fb17c0901000000632100),
(2866, 0x7e7fa77c0901000000632100),
(2867, 0x6f7fa77c0901000000632100),
(2868, 0x6f7fb17c0901000000632100),
(2869, 0x6f7fbb7c0901000000632100),
(2870, 0x727fbb7c0901000000632100),
(2870, 0x7b7fbb7c0901000000632100),
(2871, 0x727fb17c0901000000632100),
(2871, 0x727fb67c0901000000632100),
(2871, 0x7b7fb67c0901000000632100),
(2871, 0x767fb87c0901000000632100),
(2872, 0x727fa77c0901000000632100),
(2872, 0x797faa7c0901000000652100),
(2872, 0x727fac7c0901000000632100),
(2872, 0x7b7fac7c0901000000632100),
(2873, 0x727fa27c0901000000632100),
(2873, 0x7b7fa27c0901000000632100),
(2874, 0x837f1a7d0701000000711800),
(2874, 0x847f1a7d0701000000711800),
(2874, 0x867f1b7d08010000006f1800),
(2874, 0x887f197d0801000000711800),
(2874, 0x867f1d7d0301000000711800),
(2874, 0x867f1c7d04010000006f1800),
(2874, 0x847f1e7d0501000000711800),
(2874, 0x867f1c7d05010000006f1800),
(2874, 0x867f1e7d0501000000130700),
(2874, 0x877f1e7d0501000000130700),
(2874, 0x877f1d7d06010000006f1800),
(2874, 0x847f1d7d0701000000711800),
(2874, 0x867f1c7d07010000006f1800),
(2874, 0x867f1f7d07010000006f1800),
(2874, 0x8b7f1c7d04010000002d1900),
(2874, 0x897f1e7d0501000000711800),
(2874, 0x8b7f1c7d05010000002f1900),
(2874, 0x897f1e7d0601000000711800),
(2874, 0x8b7f1c7d06010000002f1900),
(2874, 0x897f1d7d0701000000711800),
(2874, 0x8b7f1c7d07010000002f1900),
(2874, 0x8b7f1f7d07010000002f1900),
(2874, 0x847f207d0401000000711800),
(2874, 0x847f217d0701000000711800),
(2874, 0x887f207d0401000000711800),
(2874, 0x8b7f217d04010000002d1900),
(2874, 0x8b7f217d05010000002f1900),
(2874, 0x8b7f217d06010000002f1900),
(2874, 0x897f217d0701000000711800),
(2874, 0x847f247d04010000002c1900),
(2874, 0x847f247d05010000002e1900),
(2874, 0x847f247d06010000002e1900),
(2874, 0x847f247d07010000002c1900),
(2874, 0x897f247d04010000002e1900),
(2874, 0x897f247d05010000002e1900),
(2874, 0x897f247d06010000002e1900),
(2874, 0x897f247d07010000002c1900),
(2875, 0xf37f837d0801000000c30400),
(2875, 0xf87f837d07010000006f1800),
(2875, 0xf97f817d0701000000711800),
(2875, 0xfa7f817d0701000000711800),
(2875, 0xfb7f837d07010000006f1800),
(2875, 0xf67f867d0401000000711800),
(2875, 0xf77f847d04010000006f1800),
(2875, 0xf77f867d0501000000711800),
(2875, 0xf67f857d0601000000711800),
(2875, 0xf77f857d0701000000711800),
(2875, 0xf77f877d0701000000711800),
(2875, 0xf57f847d0801000000c50400),
(2875, 0xfb7f847d04010000006f1800),
(2875, 0xfb7f877d04010000006f1800),
(2875, 0xf97f847d05010000006f1800),
(2875, 0xf87f847d06010000006f1800),
(2875, 0xf97f857d0601000000130700),
(2875, 0xfa7f857d0601000000130700),
(2875, 0xfa7f847d0701000000711800),
(2875, 0xff7f847d04010000002d1900),
(2875, 0xff7f847d05010000002d1900),
(2875, 0xfd7f857d0601000000711800),
(2875, 0xff7f847d06010000002d1900),
(2875, 0xfd7f857d0701000000711800),
(2875, 0xfd7f877d0701000000711800),
(2875, 0xff7f847d07010000002d1900),
(2875, 0xf67f887d0401000000711800),
(2875, 0xfa7f887d0401000000711800),
(2875, 0xfb7f887d07010000006f1800),
(2875, 0xff7f897d04010000002d1900),
(2875, 0xff7f897d05010000002d1900),
(2875, 0xff7f897d06010000002d1900),
(2875, 0xff7f897d07010000002d1900),
(2875, 0xf67f8c7d04010000002c1900),
(2875, 0xf67f8c7d05010000002c1900),
(2875, 0xf67f8c7d06010000002c1900),
(2875, 0xf67f8c7d07010000002c1900),
(2875, 0xf87f8c7d06010000002c1900),
(2875, 0xfb7f8c7d06010000002c1900),
(2875, 0xfd7f8c7d04010000002c1900),
(2875, 0xfd7f8c7d05010000002c1900),
(2875, 0xfd7f8c7d06010000002c1900),
(2875, 0xfd7f8c7d07010000002c1900),
(2876, 0x8f7fea7d0501000000df3200),
(2876, 0x8d7fef7d08010000001a0700),
(2876, 0x947fea7d0501000000df3200),
(2876, 0x947feb7d0701000000de3200),
(2876, 0x907fef7d0501000000dd3200),
(2876, 0x937fef7d0501000000dd3200),
(2876, 0x907fec7d0601000000de3200),
(2876, 0x937fec7d0601000000df3200),
(2876, 0x957fee7d0801000000de3200),
(2876, 0x8d7ff07d08010000001a0700),
(2876, 0x937ff27d0801000000dc3200),
(2876, 0x947ff27d0901000000dc3200),
(2876, 0x957ff07d0901000000de3200),
(2877, 0x6e7fd37c0901000000652100),
(2877, 0x657fd67c0901000000652100),
(2877, 0x677fd67c0901000000130700),
(2877, 0x667fd77c0a01000000632100),
(2877, 0x687fd47c0801000000632100),
(2877, 0x697fd67c0801000000652100),
(2877, 0x687fd67c0901000000130700),
(2877, 0x6a7fd67c0901000000652100),
(2877, 0x697fd67c0a01000000652100),
(2877, 0x6c7fd67c0801000000652100),
(2877, 0x6f7fd47c0801000000632100),
(2877, 0x6d7fd67c0a01000000652100),
(2877, 0x637fd87c0901000000632100),
(2877, 0x637fdb7c0901000000632100),
(2877, 0x657fd97c0901000000652100),
(2877, 0x677fdb7c0901000000632100),
(2877, 0x667fda7c0a01000000632100),
(2877, 0x697fd87c0a01000000652100),
(2877, 0x6e7fd97c0901000000652100),
(2877, 0x6e7fd97c0a01000000652100),
(2878, 0x4e7f947c09010000001a0700),
(2878, 0x4e7f957c09010000001a0700),
(2878, 0x527f937c0a01000000652100),
(2878, 0x557f917c0901000000632100),
(2878, 0x557f937c0a01000000652100),
(2878, 0x587f937c0901000000652100),
(2878, 0x597f937c0a01000000652100),
(2878, 0x5c7f937c0901000000652100),
(2878, 0x5d7f937c0a01000000652100),
(2878, 0x517f957c0a01000000632100),
(2878, 0x527f967c0a01000000652100),
(2878, 0x557f957c0901000000632100),
(2878, 0x557f967c0a01000000652100),
(2878, 0x587f967c0901000000652100),
(2878, 0x597f967c0a01000000652100),
(2878, 0x5e7f957c0901000000632100),
(2878, 0x5d7f967c0a01000000652100),
(2879, 0x407f4d7c09010000001a0700),
(2879, 0x407f4e7c09010000001a0700),
(2879, 0x427f4f7c0a010000006f1800),
(2879, 0x467f4d7c0a01000000711800),
(2879, 0x4a7f4d7c0901000000711800),
(2879, 0x437f507c0a01000000711800),
(2879, 0x467f507c0a01000000711800),
(2879, 0x487f527c09010000006f1800),
(2879, 0x4a7f507c0a01000000711800),
(2879, 0x507f527c09010000006f1800),
(2880, 0x577fcd7c0401000000652100),
(2880, 0x577fce7c0501000000652100),
(2880, 0x587fcf7c0401000000632100),
(2880, 0x4c7fd37c0501000000632100),
(2880, 0x4e7fd17c0501000000652100),
(2880, 0x4f7fd27c0601000000632100),
(2880, 0x4c7fd67c0501000000632100),
(2880, 0x4e7fd47c0501000000652100),
(2880, 0x4f7fd57c0601000000632100),
(2880, 0x517fd17c0401000000652100),
(2880, 0x507fd17c0501000000130700),
(2880, 0x517fd17c0501000000130700),
(2880, 0x537fd17c0501000000652100),
(2880, 0x527fd17c0601000000652100),
(2880, 0x527fd37c0601000000652100),
(2880, 0x547fd17c0401000000652100),
(2880, 0x567fd17c0601000000652100),
(2880, 0x507fd67c0501000000632100),
(2880, 0x577fd47c0501000000652100),
(2880, 0x577fd47c0601000000652100),
(2881, 0x797e017e0701000000c50400),
(2882, 0x7e7e017e0701000000c50400),
(2882, 0x7e7e067e0701000000241900),
(2883, 0x777e087e0701000000c30400),
(2883, 0x7c7e097e0701000000251900),
(2884, 0x867e017e0701000000241900),
(2884, 0x837e057e0701000000c30400),
(2884, 0x887e047e0701000000251900),
(2885, 0x837e087e0701000000251900),
(2885, 0x837e0a7e0701000000251900),
(2885, 0x887e097e0701000000251900),
(2885, 0x837e0c7e0701000000c30400),
(2886, 0x827e0d7e0701000000c50400),
(2887, 0x7e7e0d7e0701000000c50400),
(2887, 0x807e0d7e0701000000241900),
(2888, 0x797e0d7e0701000000c50400),
(2888, 0x7b7e0d7e0701000000241900),
(2889, 0x7e7e017e0601000000c50400),
(2889, 0x7e7e067e0601000000241900),
(2889, 0x807e067e0601000000241900),
(2890, 0x797e017e0601000000c50400),
(2891, 0x797e0b7e0601000000c50400),
(2891, 0x7c7e087e0601000000251900),
(2891, 0x7c7e0a7e0601000000251900),
(2892, 0x867e017e0602000000241900241900),
(2892, 0x887e037e0601000000251900),
(2892, 0x837e057e0601000000c30400),
(2892, 0x887e047e0601000000c30400),
(2893, 0x837e087e0601000000251900),
(2893, 0x837e0a7e0601000000251900),
(2893, 0x887e087e0601000000251900),
(2893, 0x887e097e0601000000c30400),
(2893, 0x887e0b7e0601000000251900),
(2893, 0x837e0c7e0601000000c30400),
(2894, 0x827e0d7e0601000000c50400),
(2894, 0x837e127e0601000000241900),
(2894, 0x857e127e0601000000c50400),
(2895, 0x7e7e0d7e0601000000c50400),
(2895, 0x7e7e127e0601000000241900),
(2895, 0x7f7e127e0601000000c50400),
(2895, 0x807e0d7e0601000000241900),
(2896, 0x797e0d7e0601000000c50400),
(2896, 0x7b7e0d7e0601000000241900),
(2896, 0x797e127e0601000000241900),
(2896, 0x7a7e127e0601000000c50400),
(2897, 0x7e7e017e0501000000c50400),
(2897, 0x7e7e067e0501000000241900),
(2897, 0x807e067e0501000000241900),
(2898, 0x797e017e0501000000c50400),
(2899, 0x797e0b7e0501000000c50400),
(2899, 0x7c7e087e0501000000251900),
(2899, 0x7c7e0a7e0501000000251900),
(2900, 0x797e0d7e0501000000c50400),
(2900, 0x7b7e0d7e0501000000241900),
(2900, 0x797e127e0501000000241900),
(2900, 0x7a7e127e0501000000c50400),
(2901, 0x7e7e0d7e0501000000c50400),
(2901, 0x7e7e127e0501000000241900),
(2901, 0x7f7e127e0501000000c50400),
(2901, 0x807e0d7e0501000000241900),
(2902, 0x827e0d7e0501000000c50400),
(2902, 0x837e127e0501000000241900),
(2902, 0x857e127e0501000000c50400),
(2903, 0x837e087e0501000000251900),
(2903, 0x837e0a7e0501000000251900),
(2903, 0x887e087e0501000000251900),
(2903, 0x887e097e0501000000c30400),
(2903, 0x887e0b7e0501000000251900),
(2903, 0x837e0c7e0501000000c30400),
(2904, 0x867e017e0502000000241900241900),
(2904, 0x887e037e0501000000251900),
(2904, 0x837e057e0501000000c30400),
(2904, 0x887e047e0501000000c30400),
(2905, 0x3b7ef37d0701000000251900),
(2905, 0x3b7ef57d0701000000c30400),
(2905, 0x3d7ef67d0701000000241900),
(2905, 0x3f7ef47d0701000000251900),
(2906, 0x3b7eee7d0701000000251900),
(2906, 0x3d7eec7d0701000000241900),
(2906, 0x3f7eef7d0701000000251900),
(2906, 0x3b7ef07d0701000000c30400),
(2907, 0x3d7ee57d0701000000241900),
(2907, 0x3d7eea7d0701000000c50400),
(2907, 0x3f7ee87d0701000000251900),
(2908, 0x397ee57d0701000000241900),
(2908, 0x397eea7d0701000000c50400),
(2909, 0x357ee57d0701000000241900),
(2909, 0x337ee87d0701000000251900),
(2909, 0x357eea7d0701000000c50400),
(2910, 0x327eef7d0701000000241900),
(2910, 0x307ef27d0701000000251900),
(2910, 0x347ef17d0701000000251900),
(2910, 0x347ef37d0701000000c30400),
(2910, 0x327ef67d0701000000241900),
(2910, 0x347ef57d0701000000251900),
(2911, 0x3b7ef37d0601000000c30400),
(2911, 0x3f7ef27d0601000000251900),
(2911, 0x3d7ef47d0601000000241900),
(2912, 0x3b7eee7d0601000000c30400),
(2912, 0x3f7eec7d0601000000251900),
(2912, 0x3f7eee7d0601000000251900),
(2913, 0x3b7ee57d0603000000241900461900241900),
(2913, 0x3d7ee57d0602000000241900241900),
(2913, 0x3f7ee77d0601000000251900),
(2913, 0x3a7ee97d0601000000c50400),
(2914, 0x387ee57d0602000000241900241900),
(2914, 0x387ee97d0601000000c50400),
(2915, 0x337ee77d0602000000251900251900),
(2915, 0x357ee57d0601000000241900),
(2915, 0x357ee97d0601000000c50400),
(2916, 0x327eef7d0602000000241900241900),
(2916, 0x307ef47d0601000000c30400),
(2916, 0x327ef67d0601000000241900),
(2917, 0x587f747d07010000008b1500),
(2918, 0x787ee87d07010000001a0700),
(2918, 0x787ee97d07010000001a0700),
(2918, 0x7b7ee87d0701000000660600),
(2918, 0x7d7ee87d0701000000c30400),
(2919, 0x787ee87d06030000001a07001a07001a0700),
(2919, 0x787ee97d06030000001a07001a07001a0700),
(2919, 0x7b7ee87d0601000000660600),
(2919, 0x7d7ee97d0601000000c30400),
(2920, 0x7d7ee77d08010000006f1800),
(2920, 0x787ee87d08010000001a0700),
(2920, 0x787ee97d08010000001a0700),
(2920, 0x7b7ee87d0801000000660600),
(2921, 0xaf7db07e0701000000281900),
(2921, 0xb07db07e0701000000ed1300),
(2921, 0xb17db07e0701000000281900),
(2922, 0xb77db07e0701000000281900),
(2922, 0xb87db07e0701000000ed1300),
(2922, 0xb97db07e0701000000281900),
(2923, 0xaf7db97e0701000000c50400),
(2923, 0xb17db97e0701000000241900),
(2924, 0xaa7db97e0701000000241900),
(2924, 0xab7db97e0701000000c50400),
(2925, 0xc47db77e0601000000241900),
(2925, 0xc47db77e0701000000c50400),
(2925, 0xc27dba7e0601000000251900),
(2925, 0xc57dbe7e0601000000241900),
(2925, 0xc77dbe7e0601000000241900),
(2925, 0xc97dbc7e0601000000251900),
(2926, 0x9f7db87e0701000000711800),
(2926, 0x9f7dbe7e05010000002e1900),
(2926, 0x9e7dbe7e06010000002e1900),
(2926, 0xa17dbb7e05010000002f1900),
(2926, 0xa17dbb7e06010000002d1900),
(2927, 0xb27d9a7e0801000000c50400),
(2927, 0xb77d9a7e0801000000c50400),
(2927, 0xb67d9f7e0801000000620600),
(2927, 0xba7d9c7e0801000000c30400),
(2927, 0xae7da07e08010000001a0700),
(2927, 0xae7da17e08010000001a0700),
(2927, 0xaf7daa7e0601000000281900),
(2927, 0xb37da77e0601000000f61300),
(2927, 0xbb7da77e0701000000291900),
(2927, 0xba7da47e0801000000c30400),
(2927, 0xb07daa7e0601000000281900),
(2927, 0xb57daa7e0601000000ed1300),
(2927, 0xb47daa7e0701000000ed1300),
(2927, 0xb77daa7e0701000000281900),
(2927, 0xb87daa7e0601000000281900),
(2927, 0xb97daa7e0601000000281900),
(2928, 0x8f7d8e7e07010000002c1900),
(2928, 0x937d877e07010000002d1900),
(2928, 0x907d8a7e0701000000711800),
(2928, 0x937d887e07010000002d1900),
(2928, 0x937d8b7e07010000001a0700),
(2928, 0x927d8e7e07010000002c1900),
(2928, 0x937d8c7e07010000001a0700),
(2928, 0x937d8d7e07010000006f1800),
(2928, 0x977d8e7e0701000000711800),
(2929, 0x827d727e0501000000251900),
(2929, 0x827d737e0701000000251900),
(2929, 0x867d707e0501000000241900),
(2929, 0x847d737e0601000000c50400),
(2929, 0x877d707e0601000000241900),
(2929, 0x877d737e0601000000c50400),
(2929, 0x847d707e0701000000241900),
(2929, 0x857d707e0701000000c50400),
(2929, 0x877d727e0701000000c30400),
(2929, 0x887d727e0501000000c30400),
(2929, 0x897d737e0501000000c50400),
(2929, 0x8b7d727e0501000000251900),
(2929, 0x897d707e0701000000241900),
(2929, 0x8b7d737e0701000000251900),
(2929, 0x827d757e0501000000251900),
(2929, 0x827d757e0601000000251900),
(2929, 0x827d757e0701000000251900),
(2929, 0x857d757e0501000000c30400),
(2929, 0x877d777e0501000000241900),
(2929, 0x857d777e0601000000241900),
(2929, 0x867d777e0601000000241900),
(2929, 0x857d777e0701000000241900),
(2929, 0x877d767e0701000000c30400),
(2929, 0x867d747e0801000000711800),
(2929, 0x8a7d777e0501000000241900),
(2929, 0x8b7d757e0501000000251900),
(2929, 0x887d757e0601000000c30400),
(2929, 0x8b7d747e0601000000251900),
(2929, 0x8b7d757e0601000000251900),
(2929, 0x897d747e0701000000c50400),
(2929, 0x897d777e0701000000241900),
(2929, 0x8b7d767e0701000000c30400),
(2929, 0x897d747e0801000000711800),
(2930, 0x117e3c7d0701000000291900),
(2930, 0x117e3e7d0701000000f61300),
(2930, 0x0e7e417d0701000000281900),
(2931, 0x0e7e427d0601000000241900),
(2931, 0x0f7e427d0601000000241900),
(2931, 0x0a7e447d0701000000251900),
(2931, 0x0d7e477d0601000000c50400),
(2931, 0x0d7e467d0701000000c50400),
(2931, 0x0a7e497d0601000000251900),
(2931, 0x0d7e4b7d0601000000241900),
(2931, 0x0d7e4b7d0701000000241900),
(2931, 0x0f7e497d0701000000c30400),
(2931, 0x107e477d0601000000c50400),
(2931, 0x127e457d0601000000c30400),
(2931, 0x127e467d06010000001a0700),
(2931, 0x117e467d0701000000c50400),
(2931, 0x127e447d0801000000c30400),
(2931, 0x147e477d0601000000c50400),
(2931, 0x157e457d0601000000251900),
(2931, 0x147e467d0701000000c50400),
(2931, 0x157e457d0701000000c30400),
(2931, 0x147e457d0801000000c50400),
(2931, 0x107e4b7d0601000000241900),
(2931, 0x127e4b7d0701000000241900),
(2931, 0x137e4b7d0701000000241900),
(2931, 0x157e497d0601000000251900),
(2931, 0x157e497d0701000000251900),
(2932, 0x1f7e3f7d05010000006f1800),
(2932, 0x1e7e437d0501000000711800),
(2932, 0x1f7e427d06010000006f1800),
(2932, 0x1c7e407d0701000000711800),
(2932, 0x1f7e437d07010000006f1800),
(2932, 0x1f7e417d08010000006f1800),
(2932, 0x1e7e467d06010000002c1900),
(2932, 0x1f7e457d06010000006f1800),
(2932, 0x217e407d0601000000711800),
(2932, 0x207e407d0701000000711800),
(2932, 0x237e407d0701000000711800),
(2932, 0x207e427d0801000000711800),
(2932, 0x227e407d08010000006f1800),
(2932, 0x257e407d0601000000711800),
(2932, 0x257e407d0701000000130700),
(2932, 0x287e417d07010000002d1900),
(2932, 0x227e457d0701000000711800),
(2933, 0x187e307d0701000000ed1300),
(2933, 0x197e307d0701000000130700),
(2933, 0x1a7e307d0701000000130700),
(2933, 0x1b7e327d0701000000f61300),
(2933, 0x1c7e307d0701000000ed1300),
(2933, 0x1e7e337d0701000000291900),
(2933, 0x177e347d0701000000f61300),
(2933, 0x1b7e347d0701000000f61300),
(2934, 0x157e257d0601000000241900),
(2934, 0x147e257d0701000000241900),
(2934, 0x167e257d0701000000c50400),
(2934, 0x187e277d0701000000c30400),
(2934, 0x1b7e257d0701000000241900),
(2934, 0x157e287d0601000000c50400),
(2934, 0x167e2a7d0601000000c30400),
(2934, 0x147e297d0701000000c50400),
(2934, 0x157e2b7d0701000000c30400),
(2934, 0x187e2b7d0701000000c30400),
(2934, 0x1d7e287d0601000000251900),
(2934, 0x1d7e2a7d0601000000251900),
(2934, 0x1d7e287d0701000000251900),
(2934, 0x1d7e2a7d0701000000251900),
(2934, 0x147e2c7d0601000000241900),
(2934, 0x147e2c7d0701000000c50400),
(2934, 0x177e2c7d0701000000241900),
(2934, 0x197e2c7d0601000000241900),
(2934, 0x1b7e2c7d0601000000241900),
(2934, 0x1b7e2c7d0701000000241900),
(2935, 0x067e1d7d0701000000241900),
(2935, 0x067e227d0701000000241900),
(2935, 0x097e207d0701000000c30400),
(2936, 0x007e267d0701000000251900),
(2936, 0x037e247d0701000000241900),
(2936, 0x047e267d0701000000c30400),
(2936, 0x087e247d0701000000241900),
(2936, 0x0a7e267d0701000000251900),
(2936, 0x087e287d0701000000c50400),
(2939, 0x087e2b7d0701000000c50400),
(2939, 0x007e2e7d0701000000251900),
(2939, 0x037e2f7d0701000000241900),
(2939, 0x047e2d7d0701000000c30400),
(2939, 0x087e2f7d0701000000241900),
(2939, 0x0a7e2e7d0701000000251900),
(2940, 0x077e277d0601000000c50400),
(2940, 0x097e277d0601000000241900),
(2940, 0x037e297d0601000000c30400),
(2940, 0x0a7e2b7d0601000000251900),
(2940, 0x007e2c7d0601000000251900),
(2940, 0x037e2d7d0601000000c30400),
(2940, 0x067e2f7d0601000000241900),
(2940, 0x077e2f7d0601000000241900),
(2940, 0x0a7e2c7d0601000000251900),
(2941, 0x4d7edf7d0701000000660600),
(2941, 0x4f7ede7d0701000000f61300),
(2941, 0x4b7ee07d0701000000f61300),
(2941, 0x4d7ee17d0701000000281900),
(2941, 0x4e7ee17d0701000000281900),
(2942, 0x517ed27d0701000000c40400),
(2942, 0x527ed07d0701000000c50400),
(2942, 0x537ed27d0701000000660600),
(2942, 0x547ed07d0701000000130700),
(2942, 0x557ed07d0701000000130700),
(2943, 0x477ecf7d0701000000c50400),
(2943, 0x447ed17d0701000000251900),
(2943, 0x457ed07d0701000000a68e00),
(2943, 0x457ed27d0701000000df7200),
(2943, 0x457ed37d0701000000be8c170000000000),
(2943, 0x487ed07d07010000008f7d00),
(2943, 0x497ed37d07010000001d7d00),
(2943, 0x4a7ed07d0701000000c40400),
(2943, 0x4d7ed07d0601000000c30400),
(2943, 0x477ed47d0601000000c60400),
(2944, 0x467e007e0701000000251900),
(2944, 0x4b7e017e0701000000c30400);
INSERT INTO `tile_store` (`house_id`, `data`) VALUES
(2945, 0x5f7e0b7e0601000000c50400),
(2945, 0x5f7e0e7e0601000000241900),
(2945, 0x617e077e0602000000241900241900),
(2945, 0x607e077e0701000000241900),
(2945, 0x647e077e0701000000c50400),
(2945, 0x627e097e0601000000c30400),
(2945, 0x627e097e0701000000c30400),
(2945, 0x647e0a7e0601000000241900),
(2945, 0x647e0a7e0701000000241900),
(2945, 0x657e097e0701000000c30400),
(2945, 0x607e0d7e0601000000c30400),
(2945, 0x607e0e7e0701000000241900),
(2945, 0x627e0c7e0701000000c30400),
(2946, 0x6d7e077e0602000000241900241900),
(2946, 0x6c7e077e0701000000241900),
(2946, 0x6b7e0b7e0601000000c50400),
(2946, 0x6e7e097e0601000000c30400),
(2946, 0x6e7e097e0701000000c30400),
(2946, 0x6b7e0e7e0601000000241900),
(2946, 0x6c7e0d7e0601000000c30400),
(2946, 0x6c7e0e7e0701000000241900),
(2946, 0x6e7e0c7e0701000000c30400),
(2946, 0x707e077e0701000000c50400),
(2946, 0x707e0a7e0601000000241900),
(2946, 0x707e0a7e0701000000241900),
(2946, 0x717e097e0701000000c30400),
(2947, 0x7a7ee07d0701000000c30400),
(2947, 0x7a7ee27d07010000001a0700),
(2947, 0x7a7ee37d07010000001a0700),
(2947, 0x7d7ee17d0701000000680600),
(2947, 0x7a7ee47d0701000000c30400),
(2948, 0x7c7eda7d0603000000130700130700130700),
(2948, 0x7d7eda7d0603000000130700130700130700),
(2948, 0x7a7ede7d0601000000c30400),
(2948, 0x7d7edd7d0601000000680600),
(2949, 0x7a7ee07d0601000000c30400),
(2949, 0x7a7ee27d06010000001a0700),
(2949, 0x7a7ee37d06010000001a0700),
(2949, 0x7d7ee17d0601000000680600),
(2949, 0x7a7ee47d0601000000d32300),
(2950, 0x8a7eaf7d0701000000241900),
(2950, 0x8c7eaf7d0701000000130700),
(2950, 0x8d7eaf7d0701000000130700),
(2950, 0x8e7eaf7d0701000000241900),
(2950, 0x887eb27d0701000000251900),
(2950, 0x8b7eb17d0701000000c30400),
(2950, 0x8e7eb27d0701000000680600),
(2950, 0x8a7eb47d0701000000241900),
(2950, 0x8e7eb47d0701000000c50400),
(2950, 0x907eb17d0701000000251900),
(2951, 0x927eae7d0701000000291900),
(2951, 0x937eaf7d0701000000130700),
(2951, 0x947eaf7d0601000000ed1300),
(2951, 0x947eaf7d0701000000ed1300),
(2951, 0x957eaf7d0701000000130700),
(2951, 0x927eb07d0701000000291900),
(2951, 0x947eb27d0701000000680600),
(2951, 0x957eb47d0601000000281900),
(2951, 0x947eb47d0701000000ed1300),
(2951, 0x957eb47d0701000000281900),
(2952, 0x967ebb7d0701000000251900),
(2952, 0x987eb97d0701000000241900),
(2952, 0x9a7eb97d0701000000c50400),
(2952, 0x9c7ebb7d0701000000251900),
(2952, 0x987ebf7d0701000000241900),
(2952, 0x9b7ebf7d0701000000241900),
(2952, 0x9c7ebe7d0701000000251900),
(2953, 0x967ebb7d0603000000251900f92800251900),
(2953, 0x987eb97d0602000000241900241900),
(2953, 0x997eb97d0601000000f82800),
(2953, 0x9b7eb97d0602000000241900241900),
(2953, 0x987ebf7d0601000000241900),
(2953, 0x9b7ebf7d0601000000241900),
(2953, 0x9c7ebc7d0601000000251900),
(2953, 0x9c7ebd7d0601000000c30400),
(2953, 0x9c7ebe7d0601000000251900),
(2954, 0xa67eaa7d0701000000241900),
(2954, 0xa37eac7d0603000000271900271900271900),
(2954, 0xa37eaf7d0603000000271900271900271900),
(2954, 0xa37eaf7d0701000000c30400),
(2954, 0xa67ead7d0601000000c50400),
(2954, 0xa67ead7d0701000000c50400),
(2954, 0xa37eb07d0701000000251900),
(2954, 0xa57eb17d0601000000261900),
(2954, 0xa77eb17d0601000000261900),
(2954, 0xa57eb17d0701000000241900),
(2954, 0xa67eb17d0701000000c50400),
(2954, 0xa77eb17d0701000000241900),
(2954, 0xa87eb07d0601000000271900),
(2954, 0xa87eb07d0701000000251900),
(2955, 0xfe7dee7d0701000000f92800),
(2955, 0x037eeb7d0701000000f02800),
(2955, 0x087eeb7d0701000000f02800),
(2955, 0x0e7eeb7d0701000000f92800),
(2955, 0x067eed7d0701000000e72800),
(2955, 0x0e7eee7d0701000000f92800),
(2956, 0xac7e037e0901000000a61400),
(2956, 0xa47e067e0901000000a41400),
(2956, 0xa37e097e0a01000000a01400),
(2956, 0xa87e087e0901000000a61400),
(2956, 0xab7e0b7e0a01000000a41400),
(2957, 0x267efb7d0701000000251900),
(2957, 0x287ef97d0701000000241900),
(2957, 0x297eff7d0701000000241900),
(2957, 0x2b7efe7d0701000000c30400),
(2958, 0x187efa7d0601000000f82800),
(2958, 0x1a7efa7d0601000000f82800),
(2958, 0x167efe7d0601000000f92800),
(2958, 0x167efc7d07010000001a0700),
(2958, 0x167efd7d07010000001a0700),
(2958, 0x167eff7d0701000000251900),
(2958, 0x1b7efc7d0701000000c30400),
(2958, 0x1b7eff7d0701000000251900),
(2958, 0x197e017e0601000000241900),
(2958, 0x1a7e017e0701000000241900),
(2958, 0x1b7e007e0701000000c30400),
(2959, 0x2b7efb7d0601000000c30400),
(2959, 0x297eff7d0601000000241900),
(2959, 0x2b7efe7d0601000000251900),
(2960, 0x267ef67d0602000000251900251900),
(2960, 0x287ef47d0602000000241900241900),
(2960, 0x2b7ef77d0601000000251900),
(2960, 0x267ef87d0602000000251900251900),
(2960, 0x2b7ef97d0601000000c30400),
(2961, 0x297e107e0801000000c50400),
(2962, 0x297e137e0801000000c50400),
(2963, 0x2d7e137e0801000000c50400),
(2964, 0x487ee77d0701000000271900),
(2964, 0x4a7ee57d0701000000261900),
(2964, 0x4c7ee87d0701000000c30400),
(2965, 0x487eed7d0701000000251900),
(2965, 0x4c7eed7d0701000000c30400),
(2966, 0x497ef47d0701000000251900),
(2966, 0x4d7ef47d0701000000c30400),
(2967, 0x487ee67d0601000000f92800),
(2967, 0x487ee77d0602000000251900251900),
(2967, 0x4a7ee57d0603000000241900f82800241900),
(2967, 0x487ee97d0601000000f92800),
(2967, 0x4c7ee87d0601000000c30400),
(2968, 0x487eec7d0603000000251900f92800251900),
(2968, 0x487eee7d0603000000251900f92800251900),
(2968, 0x4c7eed7d0601000000c30400),
(2969, 0x497ef17d0602000000271900271900),
(2969, 0x497ef37d0603000000271900f92800271900),
(2969, 0x497ef57d0603000000271900f92800271900),
(2969, 0x4d7ef47d0601000000c30400),
(2970, 0x497ef87d0602000000251900251900),
(2970, 0x497efa7d0603000000251900f92800251900),
(2970, 0x4b7efb7d0601000000241900),
(2970, 0x4c7efb7d0601000000241900),
(2970, 0x4d7ef97d0601000000c30400),
(2971, 0x487ee77d0503000000251900f92800251900),
(2971, 0x4a7ee57d0503000000241900f82800241900),
(2971, 0x487ee97d0501000000f92800),
(2971, 0x4c7ee87d0501000000c30400),
(2972, 0x487eec7d0503000000251900f92800251900),
(2972, 0x487eee7d0503000000251900f92800251900),
(2972, 0x4c7eed7d0501000000c30400),
(2973, 0x497ef17d0502000000251900251900),
(2973, 0x497ef37d0503000000251900f92800251900),
(2973, 0x497ef47d0501000000f92800),
(2973, 0x497ef57d0502000000251900251900),
(2973, 0x4d7ef47d0501000000c30400),
(2974, 0x497ef87d0503000000251900f92800251900),
(2974, 0x497efa7d0503000000251900f92800251900),
(2974, 0x4b7efb7d0501000000241900),
(2974, 0x4c7efb7d0501000000241900),
(2974, 0x4d7ef97d0501000000c30400),
(2975, 0x467efe7d06030000001a07001a07001a0700),
(2975, 0x467eff7d06030000001a07001a07001a0700),
(2975, 0x497efd7d0603000000241900241900241900),
(2975, 0x4a7efd7d0603000000241900241900241900),
(2975, 0x4c7eff7d0601000000c30400),
(2975, 0x467e037e0603000000251900251900251900),
(2975, 0x487e007e0601000000c50400),
(2975, 0x4b7e007e0601000000c50400),
(2975, 0x4f7e037e0601000000251900),
(2975, 0x467e067e0603000000251900251900251900),
(2975, 0x4f7e067e0601000000251900),
(2975, 0x467e097e0603000000251900251900251900),
(2975, 0x4f7e097e0601000000251900),
(2975, 0x467e0c7e0603000000251900251900251900),
(2975, 0x497e0e7e0601000000241900),
(2975, 0x4d7e0e7e0601000000241900),
(2975, 0x4f7e0c7e0601000000251900),
(2976, 0x9f7ebc7d0701000000251900),
(2976, 0xa27eb97d0701000000241900),
(2976, 0xa57ebb7d0701000000251900),
(2976, 0xa27ebf7d0701000000241900),
(2976, 0xa37ebf7d0701000000241900),
(2976, 0xa57ebd7d0701000000c30400),
(2976, 0xa57ebe7d0701000000251900),
(2977, 0x9f7ebc7d0601000000f92800),
(2977, 0xa27eb97d0603000000241900f82800241900),
(2977, 0xa17ebf7d0601000000241900),
(2977, 0xa47ebf7d0601000000241900),
(2977, 0xa57ebc7d0601000000251900),
(2977, 0xa57ebd7d0601000000c30400),
(2977, 0xa57ebe7d0601000000251900),
(2978, 0xa67ecf7d0701000000251900),
(2978, 0xa67ed07d0701000000c30400),
(2978, 0xa67ed17d0701000000251900),
(2979, 0xa67eca7d0701000000251900),
(2979, 0xa67ecb7d0701000000c30400),
(2979, 0xa67ecc7d0701000000251900),
(2980, 0xa67ec57d0701000000251900),
(2980, 0xa67ec67d0701000000c30400),
(2980, 0xa67ec77d0701000000251900),
(2981, 0xa67ecf7d0601000000251900),
(2981, 0xa67ed07d0601000000c30400),
(2981, 0xa67ed17d0601000000251900),
(2982, 0xa67eca7d0601000000251900),
(2982, 0xa67ecb7d0601000000c30400),
(2982, 0xa67ecc7d0601000000251900),
(2983, 0xa27ec37d0601000000f82800),
(2983, 0xa57ec37d0601000000f82800),
(2983, 0xa67ec57d0601000000251900),
(2983, 0xa67ec67d0601000000c30400),
(2983, 0xa67ec77d0601000000251900),
(2984, 0x9f7e037e0602000000271900271900),
(2984, 0x9f7e037e0701000000251900),
(2984, 0xa17e017e0602000000261900261900),
(2984, 0xa27e017e0701000000241900),
(2984, 0xa37e017e0701000000c60400),
(2984, 0xa47e017e0602000000261900261900),
(2984, 0xa57e037e0601000000271900),
(2984, 0xa57e037e0701000000251900),
(2984, 0xa17e047e0601000000c50400),
(2984, 0xa17e077e0601000000261900),
(2984, 0xa37e047e0601000000c50400),
(2984, 0xa17e077e0701000000241900),
(2984, 0xa27e067e0701000000c30400),
(2984, 0xa37e077e0701000000c50400),
(2984, 0xa47e077e0601000000261900),
(2984, 0xa57e057e0701000000251900),
(2985, 0x977e037e0602000000251900251900),
(2985, 0x977e037e0701000000251900),
(2985, 0x997e017e0602000000241900241900),
(2985, 0x9c7e017e0602000000241900241900),
(2985, 0x9d7e037e0601000000251900),
(2985, 0x9c7e017e0701000000c60400),
(2985, 0x9d7e037e0701000000251900),
(2985, 0x997e057e0601000000241900),
(2985, 0x997e057e0701000000241900),
(2985, 0x9c7e057e0701000000241900),
(2986, 0x8c7e037e0603000000251900f92800251900),
(2986, 0x8f7e017e0603000000241900f82800241900),
(2986, 0x8e7e017e0701000000c60400),
(2986, 0x8f7e017e0701000000241900),
(2986, 0x8e7e057e0601000000241900),
(2986, 0x8f7e057e0601000000241900),
(2986, 0x8c7e047e0701000000c30400),
(2986, 0x8e7e057e0701000000241900),
(2986, 0x8f7e057e0701000000241900),
(2986, 0x907e037e0601000000c30400),
(2986, 0x937e017e0701000000241900),
(2986, 0x947e017e0701000000241900),
(2986, 0x957e037e0701000000251900),
(2986, 0x907e047e0701000000c30400),
(2986, 0x907e077e0701000000251900),
(2986, 0x957e057e0701000000251900),
(2986, 0x927e087e0701000000241900),
(2987, 0x657efd7d0602000000241900241900),
(2987, 0x667eff7d0601000000c30400),
(2987, 0x647efd7d0701000000241900),
(2987, 0x667eff7d0701000000c30400),
(2987, 0x687efd7d0701000000c60400),
(2987, 0x697eff7d0701000000c30400),
(2987, 0x637e017e0601000000c50400),
(2987, 0x647e037e0601000000c30400),
(2987, 0x667e027e0701000000c30400),
(2987, 0x687e007e0601000000241900),
(2987, 0x687e007e0701000000241900),
(2987, 0x637e047e0601000000241900),
(2987, 0x647e047e0701000000241900),
(2988, 0x597efd7d0602000000241900241900),
(2988, 0x5a7eff7d0601000000c30400),
(2988, 0x587efd7d0701000000241900),
(2988, 0x5a7eff7d0701000000c30400),
(2988, 0x5c7efd7d0701000000c60400),
(2988, 0x5d7eff7d0701000000c30400),
(2988, 0x577e017e0601000000c50400),
(2988, 0x587e037e0601000000c30400),
(2988, 0x5a7e027e0701000000c30400),
(2988, 0x5c7e007e0601000000241900),
(2988, 0x5c7e007e0701000000241900),
(2988, 0x577e047e0601000000241900),
(2988, 0x587e047e0701000000241900),
(2989, 0xa17efb7d0602000000251900251900),
(2989, 0xa37ef87d0602000000241900241900),
(2989, 0xa37ef87d0701000000c50400),
(2989, 0xa57efa7d0601000000251900),
(2989, 0xa57efa7d0701000000251900),
(2989, 0xa37efc7d0701000000241900),
(2989, 0xa47efc7d0601000000241900),
(2990, 0xa37eef7d0601000000c50400),
(2990, 0xa17ef17d0603000000251900251900251900),
(2990, 0xa17ef37d0603000000251900251900251900),
(2990, 0xa57ef17d0601000000251900),
(2990, 0xa57ef37d0601000000251900),
(2990, 0xa47ef47d0601000000241900),
(2991, 0xa37ee77d0602000000241900241900),
(2991, 0xa17ee97d0602000000251900251900),
(2991, 0xa17eeb7d0602000000251900251900),
(2991, 0xa57ee97d0601000000251900),
(2991, 0xa57eeb7d0601000000251900),
(2991, 0xa37eec7d0601000000c50400),
(2992, 0x9d7ee77d0602000000241900241900),
(2992, 0x9b7ee97d0602000000251900251900),
(2992, 0x9b7eeb7d0602000000251900251900),
(2992, 0x9d7eec7d0601000000c50400),
(2992, 0xa07ee97d0601000000251900),
(2992, 0xa07eeb7d0601000000251900),
(2993, 0x9d7eef7d0601000000c50400),
(2993, 0x9b7ef17d0603000000251900251900251900),
(2993, 0x9b7ef37d0603000000251900251900251900),
(2993, 0x9e7ef47d0601000000241900),
(2993, 0xa07ef17d0601000000251900),
(2993, 0xa07ef37d0601000000251900),
(2994, 0x9e7ee77d0701000000241900),
(2994, 0x9b7ee97d0701000000251900),
(2994, 0x9b7eeb7d0701000000251900),
(2994, 0x9d7eec7d0701000000c50400),
(2994, 0xa07ee97d0701000000251900),
(2994, 0xa07eeb7d0701000000251900),
(2995, 0xa47ee77d0701000000241900),
(2995, 0xa17ee97d0701000000251900),
(2995, 0xa17eeb7d0701000000251900),
(2995, 0xa57ee97d0701000000251900),
(2995, 0xa57eeb7d0701000000251900),
(2995, 0xa37eec7d0701000000c50400),
(2996, 0xa37eef7d0701000000c50400),
(2996, 0xa17ef17d0701000000251900),
(2996, 0xa17ef37d0701000000251900),
(2996, 0xa57ef17d0701000000251900),
(2996, 0xa57ef37d0701000000251900),
(2996, 0xa37ef47d0701000000241900),
(2997, 0x9d7eef7d0701000000c50400),
(2997, 0x9b7ef17d0701000000251900),
(2997, 0x9b7ef37d0701000000251900),
(2997, 0x9d7ef47d0701000000241900),
(2997, 0xa07ef17d0701000000251900),
(2997, 0xa07ef37d0701000000251900),
(2998, 0x9c7ed97d0602000000241900241900),
(2998, 0x9e7ed97d0602000000241900241900),
(2998, 0x9f7edb7d0601000000251900),
(2998, 0x9a7edc7d0602000000251900251900),
(2998, 0x9f7edc7d0601000000c30400),
(2999, 0x9f7edf7d0601000000c30400),
(2999, 0x9a7ee07d0602000000251900251900),
(2999, 0x9f7ee07d0601000000251900),
(3000, 0x9f7ee27d0601000000c30400),
(3000, 0x9a7ee47d0602000000251900251900),
(3000, 0x9c7ee57d0601000000241900),
(3000, 0x9e7ee57d0601000000241900),
(3000, 0x9f7ee47d0601000000251900),
(3001, 0x9c7ed97d0701000000241900),
(3001, 0x9e7ed97d0701000000241900),
(3001, 0x9f7edb7d0701000000251900),
(3001, 0x9a7edc7d0701000000251900),
(3001, 0x9f7edc7d0701000000c30400),
(3002, 0x9f7edf7d0701000000c30400),
(3002, 0x9a7ee07d0701000000251900),
(3002, 0x9f7ee07d0701000000251900),
(3003, 0x9f7ee27d0701000000c30400),
(3003, 0x9a7ee47d0701000000251900),
(3003, 0x9c7ee57d0701000000241900),
(3003, 0x9e7ee57d0701000000241900),
(3003, 0x9f7ee47d0701000000251900),
(3004, 0x577ec37d0602000000251900251900),
(3004, 0x577ec37d0701000000251900),
(3004, 0x5a7ec17d0602000000241900241900),
(3004, 0x5d7ec17d0602000000241900241900),
(3004, 0x5b7ec57d0601000000c60400),
(3004, 0x5b7ec57d0701000000c60400),
(3004, 0x5b7ec47d08010000006f1800),
(3004, 0x5b7ec77d08010000006f1800),
(3004, 0x5f7ec47d0601000000251900),
(3004, 0x5f7ec77d0601000000251900),
(3004, 0x5c7ec57d0701000000130700),
(3004, 0x5f7ec47d0701000000251900),
(3004, 0x5f7ec77d0701000000251900),
(3004, 0x5e7ec47d08010000006f1800),
(3004, 0x5e7ec77d08010000006f1800),
(3004, 0x577ec87d0602000000251900251900),
(3004, 0x577ec87d0701000000251900),
(3004, 0x5a7ec97d0601000000c30400),
(3004, 0x597ecb7d0701000000c50400),
(3004, 0x5a7ec97d0801000000130700),
(3004, 0x5e7ec97d0601000000c50400),
(3004, 0x5f7ecb7d0601000000251900),
(3004, 0x5c7ecb7d0701000000c60400),
(3004, 0x5f7ec97d0701000000251900),
(3004, 0x5d7ec97d0801000000721800),
(3004, 0x577ece7d0601000000241900),
(3004, 0x5a7ece7d0701000000620600),
(3004, 0x5b7ecf7d08010000006f1800),
(3004, 0x5d7ecd7d0601000000c30400),
(3004, 0x5f7ecf7d0601000000251900),
(3004, 0x5b7ed27d0601000000241900),
(3004, 0x5d7ed07d0601000000c30400),
(3004, 0x5e7ed27d0601000000c50400),
(3004, 0x5c7ed47d0701000000c50400),
(3004, 0x5d7ed47d0701000000c50400),
(3005, 0x0b7e0a7d0701000000660600),
(3005, 0x0c7e0b7d0601000000dc1300),
(3005, 0x0c7e087d0701000000130700),
(3005, 0x0d7e087d0701000000130700),
(3005, 0x097e0d7d0601000000da1300),
(3005, 0x0d7e0e7d0601000000dc1300),
(3005, 0x127e0b7d0601000000dc1300),
(3005, 0x167e0b7d0501000000da1300),
(3005, 0x117e0e7d0601000000dc1300),
(3005, 0x157e0c7d0601000000da1300),
(3005, 0x197e0e7d0501000000dc1300),
(3005, 0x197e0e7d0601000000dc1300),
(3006, 0xd37eab7d06020000002c19002c1900),
(3006, 0xd57eab7d0701000000711800),
(3006, 0xd07eae7d05020000002d19002d1900),
(3006, 0xd37eaf7d0501000000711800),
(3006, 0xd37eae7d0601000000711800),
(3006, 0xd07eae7d07010000002d1900),
(3006, 0xd37ead7d07010000006f1800),
(3006, 0xd57eae7d0401000000711800),
(3006, 0xd57ead7d06010000006f1800),
(3006, 0xd77eae7d0601000000711800),
(3006, 0xd67ead7d07010000006f1800),
(3006, 0xd67ead7d08010000006f1800),
(3006, 0xd97eaf7d05010000002d1900),
(3006, 0xd87eae7d0701000000711800),
(3006, 0xd87eae7d0801000000711800),
(3006, 0xd27eb17d0501000000711800),
(3006, 0xd07eb17d06020000001a07001a0700),
(3006, 0xd07eb27d06020000001a07001a0700),
(3006, 0xd07eb37d07010000002d1900),
(3006, 0xd37eb27d07010000006f1800),
(3006, 0xd57eb17d04010000002c1900),
(3006, 0xd67eb07d04010000002d1900),
(3006, 0xd57eb17d0501000000711800),
(3006, 0xd87eb17d0501000000711800),
(3006, 0xd97eb27d06010000002d1900),
(3006, 0xd97eb17d07010000002d1900),
(3006, 0xd97eb27d07010000002d1900),
(3006, 0xd27eb57d05010000002c1900),
(3006, 0xd27eb57d06010000002c1900),
(3006, 0xd57eb57d05010000002c1900),
(3006, 0xd77eb57d06010000002c1900),
(3006, 0xd67eb57d07010000002c1900),
(3006, 0xd87eb57d05010000002c1900),
(3007, 0xa77d727e0701000000251900),
(3007, 0xaa7d707e0601000000241900),
(3007, 0xaa7d707e0701000000241900),
(3007, 0xad7d737e0601000000c30400),
(3007, 0xaf7d707e0601000000130700),
(3007, 0xac7d707e0701000000241900),
(3007, 0xac7d727e0801000000c30400),
(3007, 0xae7d737e0801000000c50400),
(3007, 0xa77d767e0601000000251900),
(3007, 0xab7d747e0601000000c50400),
(3007, 0xa97d767e0701000000c50400),
(3007, 0xad7d777e0601000000c30400),
(3007, 0xaf7d747e0601000000c50400),
(3007, 0xac7d767e0701000000c50400),
(3007, 0xae7d757e0701000000c30400),
(3007, 0xa77d787e0601000000251900),
(3007, 0xaa7d7a7e0601000000241900),
(3007, 0xab7d7a7e0601000000241900),
(3007, 0xa97d7a7e0701000000241900),
(3007, 0xaf7d7a7e0601000000241900),
(3007, 0xac7d7a7e0701000000241900),
(3007, 0xaf7d7a7e0701000000241900),
(3007, 0xb17d727e0601000000251900),
(3007, 0xb07d737e0701000000c50400),
(3007, 0xb17d727e0701000000251900),
(3007, 0xb07d767e0701000000c50400),
(3007, 0xb17d757e0701000000c30400),
(3007, 0xb17d787e0601000000251900),
(3007, 0xb17d787e0701000000251900),
(3008, 0x887e917d0601000000281900),
(3008, 0x8b7e917d0701000000281900),
(3008, 0x8a7e917d0801000000130700),
(3008, 0x8b7e917d0801000000130700),
(3008, 0x8e7e917d0601000000281900),
(3008, 0x897e977d0601000000ed1300),
(3008, 0x8d7e977d0601000000ed1300),
(3008, 0x8e7e947d0801000000f61300),
(3008, 0x887e997d0601000000ed1300),
(3008, 0x897e9a7d0701000000ed1300),
(3008, 0x8a7e9a7d0801000000ed1300),
(3008, 0x887e997d0901000000711800),
(3008, 0x8d7e9a7d0701000000ed1300),
(3008, 0x8e7e9b7d0801000000f61300),
(3008, 0x897e9d7d0601000000281900),
(3008, 0x887e9d7d0701000000281900),
(3008, 0x917e917d0601000000281900),
(3008, 0x907e917d0701000000281900),
(3008, 0x927e977d0601000000ed1300),
(3008, 0x947e957d0601000000291900),
(3008, 0x947e957d0701000000291900),
(3008, 0x907e9a7d0601000000f61300),
(3008, 0x927e997d0601000000ed1300),
(3008, 0x917e9a7d0701000000ed1300),
(3008, 0x947e987d0601000000291900),
(3008, 0x947e9b7d0601000000291900),
(3008, 0x947e987d0701000000291900),
(3008, 0x947e9b7d0701000000291900),
(3008, 0x927e9d7d0601000000281900),
(3008, 0x927e9d7d0701000000281900),
(3009, 0x8a7e217d0601000000f61300),
(3009, 0x8d7e237d0801000000f61300),
(3009, 0x867e257d08010000001a0700),
(3009, 0x867e267d08010000001a0700),
(3009, 0x8a7e277d0601000000f61300),
(3009, 0x8d7e247d0601000000f61300),
(3009, 0x8d7e277d0801000000f61300),
(3009, 0x8a7e297d0601000000f61300),
(3009, 0x897e297d0701000000ed1300),
(3009, 0x897e297d0801000000ed1300),
(3009, 0x8b7e2a7d0801000000f61300),
(3009, 0x8c7e287d0601000000ed1300),
(3009, 0x8c7e297d0701000000ed1300),
(3009, 0x8d7e297d0701000000ed1300),
(3009, 0x887e2c7d0601000000281900),
(3009, 0x887e2c7d0701000000281900),
(3009, 0x937e237d0701000000291900),
(3009, 0x937e277d0701000000291900),
(3009, 0x937e2a7d0601000000291900),
(3009, 0x907e297d0701000000ed1300),
(3009, 0x937e2a7d0701000000291900),
(3009, 0x917e297d0801000000ed1300),
(3009, 0x917e2c7d0601000000281900),
(3009, 0x917e2c7d0701000000281900),
(3010, 0xcc7da97e0801000000711800),
(3010, 0xcb7daf7e06010000001a0700),
(3010, 0xce7daf7e04010000006f1800),
(3010, 0xce7daf7e0501000000711800),
(3010, 0xd07dab7e0501000000711800),
(3010, 0xd37da97e0801000000c50400),
(3010, 0xd37dab7e0801000000c50400),
(3010, 0xda7da97e0801000000c50400),
(3010, 0xda7dab7e0801000000c50400),
(3010, 0xd07dae7e0401000000711800),
(3010, 0xd27dae7e0501000000711800),
(3010, 0xd07dad7e0701000000711800),
(3010, 0xd47dae7e04010000002d1900),
(3010, 0xd47dae7e06010000002d1900),
(3010, 0xcb7db07e06010000001a0700),
(3010, 0xcd7db07e07010000006f1800),
(3010, 0xcd7db47e05010000002c1900),
(3010, 0xcf7db47e0601000000711800),
(3010, 0xd07db07e0401000000711800),
(3010, 0xd17db07e06010000006f1800),
(3010, 0xd07db27e0701000000711800),
(3010, 0xd27db07e07010000006f1800),
(3010, 0xd47db17e04010000002d1900),
(3010, 0xd47db17e06010000002d1900),
(3010, 0xd07db47e04010000002c1900),
(3010, 0xd27db47e05010000002c1900),
(3010, 0xd07db47e06010000002c1900),
(3010, 0xd07db47e0701000000711800),
(3011, 0xae7e6a7e0901000000711800),
(3011, 0xac7e6d7e09010000006f1800),
(3011, 0xb37e687e0701000000711800),
(3011, 0xb37e6b7e0701000000711800),
(3011, 0xb17e6a7e0901000000711800),
(3011, 0xb47e6a7e04010000006f1800),
(3011, 0xb77e6b7e04010000006f1800),
(3011, 0xb47e6b7e05010000006f1800),
(3011, 0xb47e6b7e06010000006f1800),
(3011, 0xb47e687e0701000000711800),
(3011, 0xb47e6b7e0701000000711800),
(3011, 0xb77e6a7e0901000000711800),
(3011, 0xbb7e6b7e04010000002d1900),
(3011, 0xb97e687e0701000000130700),
(3011, 0xb97e6b7e0701000000680600),
(3011, 0xba7e687e0701000000130700),
(3011, 0xb27e6e7e0501000000711800),
(3011, 0xb27e6e7e0701000000711800),
(3011, 0xb27e6c7e0801000000711800),
(3011, 0xb27e6d7e09010000006f1800),
(3011, 0xb47e6d7e04010000006f1800),
(3011, 0xb47e6d7e05010000001a0700),
(3011, 0xb47e6e7e05010000001a0700),
(3011, 0xb47e6c7e06010000006f1800),
(3011, 0xb57e6e7e0701000000711800),
(3011, 0xb67e6d7e07010000006f1800),
(3011, 0xb57e6c7e0801000000711800),
(3011, 0xb67e6e7e0801000000711800),
(3011, 0xbb7e6c7e05010000002d1900),
(3011, 0xbb7e6f7e05010000002d1900),
(3011, 0xbb7e6c7e06010000002d1900),
(3011, 0xb87e6c7e0801000000711800),
(3011, 0xba7e6e7e0801000000711800),
(3011, 0xbb7e6c7e0801000000711800),
(3011, 0xac7e707e09010000006f1800),
(3011, 0xb37e727e04010000002c1900),
(3011, 0xb47e707e04010000006f1800),
(3011, 0xb57e727e04010000002c1900),
(3011, 0xb77e707e04010000006f1800),
(3011, 0xb77e727e05010000002c1900),
(3011, 0xb97e727e04010000002c1900),
(3011, 0xbb7e707e04010000002d1900),
(3012, 0x8b7ef47d0602000000241900241900),
(3012, 0x8e7ef47d0602000000241900241900),
(3012, 0x8b7ef87d0601000000c50400),
(3012, 0x8b7efa7d0601000000c50400),
(3012, 0x897ef87d0701000000251900),
(3012, 0x897efa7d0701000000251900),
(3012, 0x897ef97d0901000000711800),
(3012, 0x897efb7d0901000000711800),
(3012, 0x8e7ef87d0601000000c50400),
(3012, 0x8f7efa7d0601000000c50400),
(3012, 0x8f7efb7d0701000000c30400),
(3012, 0x8d7ef97d0901000000711800),
(3012, 0x8b7efd7d0601000000241900),
(3012, 0x8f7efd7d0601000000241900),
(3012, 0x8c7efd7d0701000000241900),
(3012, 0x8d7efd7d0701000000241900),
(3012, 0x947ef47d0602000000241900241900),
(3012, 0x9a7ef77d0601000000251900),
(3012, 0x9a7ef67d0701000000251900),
(3012, 0x937efa7d0601000000c50400),
(3012, 0x917ef87d0701000000c50400),
(3012, 0x927ef87d0701000000130700),
(3012, 0x937efb7d0701000000c30400),
(3012, 0x917ef87d08010000006f1800),
(3012, 0x937ef87d08010000006f1800),
(3012, 0x927ef97d09010000006f1800),
(3012, 0x927efb7d09010000001a0700),
(3012, 0x947ef87d0601000000c50400),
(3012, 0x957ef97d0601000000c30400),
(3012, 0x957ef87d0701000000c50400),
(3012, 0x967efb7d0701000000c30400),
(3012, 0x9a7efa7d0601000000251900),
(3012, 0x9a7efb7d0701000000251900),
(3012, 0x937efd7d0601000000241900),
(3012, 0x917efd7d0701000000c50400),
(3012, 0x927efd7d09010000006f1800),
(3012, 0x977efd7d0601000000241900),
(3012, 0x957efd7d0701000000241900),
(3012, 0x997efd7d0601000000241900),
(3012, 0x997efd7d0701000000241900),
(3013, 0x087e377e08010000006f1800),
(3013, 0x0c7e377e0701000000711800),
(3013, 0x0e7e377e0801000000711800),
(3013, 0x037e3b7e0601000000711800),
(3013, 0x037e3b7e0701000000711800),
(3013, 0x067e397e07010000006f1800),
(3013, 0x097e3b7e0701000000711800),
(3013, 0x0b7e397e07010000006f1800),
(3013, 0x0e7e3b7e0601000000711800),
(3013, 0x0d7e397e0701000000660600),
(3013, 0x0e7e3b7e0701000000711800),
(3013, 0x087e3c7e08010000006f1800),
(3013, 0x047e407e06010000006f1800),
(3013, 0x0d7e407e06010000006f1800),
(3014, 0x3e7e0a7e0403000000241900241900241900),
(3014, 0x3b7e0f7e0403000000251900251900251900),
(3014, 0x3b7e0d7e0503000000251900251900251900),
(3014, 0x3b7e0f7e0503000000251900251900251900),
(3014, 0x3b7e0c7e0603000000251900251900251900),
(3014, 0x3b7e0f7e0603000000251900251900251900),
(3014, 0x3b7e0c7e0701000000251900),
(3014, 0x3b7e0f7e0701000000251900),
(3014, 0x3e7e0d7e0401000000c50400),
(3014, 0x3f7e0c7e0601000000c30400),
(3014, 0x3d7e0d7e0701000000c50400),
(3014, 0x3e7e117e0401000000241900),
(3014, 0x3e7e117e0501000000241900),
(3014, 0x3f7e117e0501000000241900),
(3014, 0x427e0a7e0403000000241900241900241900),
(3014, 0x407e0c7e0401000000c30400),
(3014, 0x427e0d7e0401000000c50400),
(3014, 0x417e0c7e0501000000c30400),
(3014, 0x437e0d7e0501000000c50400),
(3014, 0x407e0d7e0601000000c50400),
(3014, 0x437e0d7e0601000000c50400),
(3014, 0x427e0e7e0701000000c30400),
(3014, 0x427e0f7e07010000001a0700),
(3014, 0x457e0f7e0401000000251900),
(3014, 0x457e0c7e0501000000251900),
(3014, 0x457e0f7e0701000000251900),
(3014, 0x457e0c7e0801000000c30400),
(3014, 0x437e117e0401000000241900),
(3014, 0x437e117e0601000000241900),
(3014, 0x447e117e0501000000241900),
(3014, 0x457e107e0701000000c30400),
(3015, 0xe180997d0701000000d52300),
(3015, 0xe2809e7d0601000000d52300),
(3015, 0xe1809e7d0701000000d52300),
(3016, 0xe380497d0701000000184e00),
(3016, 0xe2804d7d05010000008c4d00),
(3016, 0xe3804d7d0701000000184e00),
(3016, 0xe4804d7d06010000008c4d00),
(3017, 0x7e80687d05010000008c4d00),
(3017, 0x7c80697d0601000000834d00),
(3017, 0x7e80697d0601000000834d00),
(3017, 0x7c80697d07010000000f4e00),
(3017, 0x7e80687d0701000000184e00),
(3017, 0x80806b7d06010000008c4d00),
(3018, 0x9a80867d06010000008c4d00),
(3018, 0x9a80847d0701000000184e00),
(3019, 0x8380497d0701000000184e00),
(3019, 0x83804d7d06010000008c4d00),
(3019, 0x83804d7d0701000000184e00),
(3019, 0x85804d7d05010000008c4d00),
(3020, 0x7e80447d0701000000184e00),
(3020, 0x8080457d06010000008c4d00),
(3021, 0x7e80397d0601000000834d00),
(3021, 0x7e80397d07010000000f4e00),
(3022, 0x8680397d0601000000834d00),
(3023, 0x7e80337d0701000000184e00),
(3023, 0x7e80367d0601000000834d00),
(3024, 0x8680367d0601000000834d00),
(3024, 0x8580357d07010000000f4e00),
(3025, 0x9180327d0501000000834d00),
(3025, 0x9380317d05010000008c4d00),
(3025, 0x9180337d07010000000f4e00),
(3025, 0x9380317d0701000000184e00),
(3025, 0x9380357d0701000000184e00),
(3025, 0x9580347d06010000008c4d00),
(3026, 0x9380267d0601000000834d00),
(3026, 0x9280277d07010000000f4e00),
(3026, 0x9480277d07010000000f4e00),
(3026, 0x9580297d0701000000184e00),
(3027, 0x83802a7d06010000008c4d00),
(3027, 0x8780287d05010000008c4d00),
(3027, 0x87802b7d05010000008c4d00),
(3027, 0x8480287d0701000000184e00),
(3027, 0x84802b7d0701000000184e00),
(3028, 0x9e80247d0601000000834d00),
(3029, 0x9f802e7d0701000000184e00),
(3029, 0xa3802f7d05010000008c4d00),
(3029, 0xa1802f7d0701000000184e00),
(3029, 0xa080307d07010000000f4e00),
(3029, 0xa480327d0601000000834d00),
(3030, 0xb5802f7d0701000000184e00),
(3030, 0xb680337d0601000000834d00),
(3030, 0xb780307d07010000000f4e00),
(3030, 0x1884017f0e01000000844d00),
(3031, 0xc0802f7d0501000000834d00),
(3031, 0xc1802e7d05010000008c4d00),
(3031, 0xc2802f7d0701000000184e00),
(3031, 0xc4802f7d0601000000834d00),
(3031, 0xc080337d0601000000834d00),
(3031, 0xc280327d06010000008c4d00),
(3031, 0xc480317d07010000000f4e00),
(3032, 0xc480367d0601000000834d00),
(3032, 0xc1803a7d0501000000834d00),
(3032, 0xc380387d05010000008c4d00),
(3032, 0xc280387d06010000008c4d00),
(3032, 0xc2803b7d06010000008c4d00),
(3033, 0xb080367d0601000000834d00),
(3033, 0xb280397d05010000008c4d00),
(3033, 0xb280397d07010000000f4e00),
(3033, 0xb480397d0601000000834d00),
(3033, 0xb2803c7d05010000008c4d00),
(3034, 0xd380357d0701000000184e00),
(3034, 0xd280397d05010000008c4d00),
(3034, 0xd080397d0601000000834d00),
(3034, 0xd280397d0601000000834d00),
(3034, 0xd380387d0701000000184e00),
(3034, 0xd3803b7d0701000000184e00),
(3034, 0xd4803b7d06010000008c4d00),
(3035, 0xce80437d0501000000834d00),
(3035, 0xcf80477d0601000000834d00),
(3035, 0xcf80457d07010000000f4e00),
(3035, 0xd080437d0601000000834d00),
(3036, 0xd380477d0601000000834d00),
(3036, 0xd580457d07010000000f4e00),
(3037, 0xa680987d06010000008d4d00),
(3038, 0xa980987d06010000008d4d00),
(3039, 0xae807f7d0601000000834d00),
(3039, 0xaf80817d07010000000f4e00),
(3040, 0xb4807f7d0601000000834d00),
(3040, 0xb480817d07010000000f4e00),
(3041, 0xbb80787d07010000000f4e00),
(3041, 0xbe80787d0601000000834d00),
(3041, 0xbf80787d07010000000f4e00),
(3041, 0xc1807b7d03010000008c4d00),
(3041, 0xc1807b7d04010000008c4d00),
(3041, 0xc1807b7d05010000008c4d00),
(3041, 0xc0807a7d06010000008c4d00),
(3041, 0xc280787d07010000000f4e00),
(3041, 0xc3807c7d0301000000834d00),
(3041, 0xc1807e7d04010000008c4d00),
(3041, 0xc1807e7d05010000008c4d00),
(3041, 0xc0807d7d06010000008c4d00),
(3042, 0xdb806e7d0601000000834d00),
(3042, 0xd8806e7d0701000000184e00),
(3042, 0xd480717d0501000000834d00),
(3042, 0xd480737d0501000000834d00),
(3042, 0xd780717d0501000000834d00),
(3042, 0xd780737d0501000000834d00),
(3042, 0xd680707d06010000008c4d00),
(3042, 0xd980707d06010000008c4d00),
(3042, 0xdb80737d07010000000f4e00),
(3042, 0xd680747d06010000008c4d00),
(3042, 0xd980747d06010000008c4d00),
(3042, 0xd880757d0701000000184e00),
(3043, 0xe7806d7d06010000008d4d00),
(3043, 0xe9806e7d0501000000834d00),
(3044, 0xd7805f7d0701000000184e00),
(3044, 0xd8805f7d05010000008c4d00),
(3044, 0xdc805f7d05010000008c4d00),
(3044, 0xdc805f7d0701000000184e00),
(3044, 0xd480607d06010000008c4d00),
(3044, 0xd780637d0601000000834d00),
(3044, 0xd680637d07010000000f4e00),
(3044, 0xd780627d0701000000184e00),
(3044, 0xd880627d05010000008c4d00),
(3044, 0xda80637d0501000000834d00),
(3044, 0xda80607d06010000008c4d00),
(3044, 0xdc80627d05010000008c4d00),
(3044, 0xdd80637d0601000000834d00),
(3044, 0xdc80657d05010000008c4d00),
(3044, 0xdc80687d05010000008c4d00),
(3045, 0xc780617d0601000000834d00),
(3045, 0xc780627d07010000000f4e00),
(3046, 0xcc80617d0601000000834d00),
(3046, 0xcc80627d07010000000f4e00),
(3047, 0xe780587d06010000008c4d00),
(3047, 0xea80587d0701000000184e00),
(3048, 0xe780547d06010000008c4d00),
(3048, 0xea80547d0701000000184e00),
(3049, 0xf180487d06010000008c4d00),
(3050, 0xec80337d0601000000834d00),
(3050, 0xed80317d0701000000184e00),
(3050, 0xed80357d0701000000184e00),
(3051, 0xe0802f7d05010000008c4d00),
(3051, 0xe0802f7d0701000000184e00),
(3051, 0xdf80307d0501000000834d00),
(3051, 0xdf80317d07010000000f4e00),
(3051, 0xe180337d0601000000834d00),
(3052, 0x65807c7d0601000000844d00),
(3053, 0x65807f7d0601000000844d00),
(3054, 0x8c807f7d0601000000834d00),
(3054, 0x8a80817d06010000008c4d00),
(3054, 0x8b80817d07010000000f4e00),
(3054, 0x8c80827d0601000000834d00),
(3054, 0x8d80817d06010000008c4d00),
(3054, 0x8d80817d07010000000f4e00),
(3054, 0x8a80847d0701000000184e00),
(3054, 0x8e80847d0701000000184e00),
(3055, 0x9f80777d06010000008c4d00),
(3055, 0x9f80777d0701000000184e00),
(3055, 0x9c80797d0501000000834d00),
(3055, 0x9f807b7d06010000008c4d00),
(3055, 0x9f807d7d0701000000184e00),
(3055, 0xa280777d06010000008c4d00),
(3055, 0xa080797d0501000000834d00),
(3055, 0xa2807b7d06010000008c4d00),
(3055, 0xa480797d0501000000834d00),
(3055, 0xa1807c7d0601000000834d00),
(3056, 0xa180617d0601000000834d00),
(3056, 0xa180657d0501000000834d00),
(3056, 0xa180657d0601000000834d00),
(3056, 0xa280657d07010000000f4e00),
(3056, 0xa480657d0501000000834d00),
(3056, 0xa580657d0601000000834d00),
(3056, 0xa480677d0701000000184e00),
(3057, 0xab80567d0701000000184e00),
(3057, 0xae80577d07010000000f4e00),
(3057, 0xab80587d05010000008c4d00),
(3057, 0xa9805a7d06010000008c4d00),
(3057, 0xab80587d0601000000834d00),
(3057, 0xae80587d0601000000834d00),
(3058, 0x89805f7d04010000008c4d00),
(3058, 0x8780617d0401000000834d00),
(3059, 0x8c805c7d04010000008c4d00),
(3059, 0x8f805e7d0401000000834d00),
(3060, 0x8f80647d04010000008c4d00),
(3060, 0x9280617d0401000000834d00),
(3061, 0x96805e7d0401000000834d00),
(3062, 0x87805e7d0501000000834d00),
(3063, 0x8b805e7d0501000000834d00),
(3064, 0x8f805e7d0501000000834d00),
(3065, 0x93805e7d0501000000834d00),
(3066, 0x96805e7d0501000000834d00),
(3067, 0x8880617d0501000000834d00),
(3068, 0x8d80617d0501000000834d00),
(3069, 0x9280617d0501000000834d00),
(3070, 0x87805e7d0601000000834d00),
(3071, 0x8b805e7d0601000000834d00),
(3072, 0x8f805e7d0601000000834d00),
(3073, 0x93805e7d0601000000834d00),
(3074, 0x96805e7d0601000000834d00),
(3075, 0x8880617d0601000000834d00),
(3076, 0x8d80617d0601000000834d00),
(3077, 0x9280617d0601000000834d00),
(3078, 0x89805c7d0701000000184e00),
(3079, 0x8980607d0701000000184e00),
(3080, 0x8980637d0701000000184e00),
(3081, 0x8e805c7d07010000000f4e00),
(3082, 0x8f80637d07010000000f4e00),
(3083, 0x92805f7d07010000000f4e00),
(3084, 0x96805d7d07010000000f4e00),
(3085, 0x9381327c0501000000711800),
(3085, 0x9181307c06010000006f1800),
(3085, 0x9381327c0601000000711800),
(3085, 0x9281377c0501000000711800),
(3086, 0x8c81397c05010000002d1900),
(3086, 0x90813a7c05010000006f1800),
(3087, 0x90813f7c05010000006f1800),
(3088, 0x9081447c05010000006f1800),
(3089, 0x93813a7c05010000006f1800),
(3089, 0x98813a7c05010000002d1900),
(3090, 0x93813f7c05010000006f1800),
(3090, 0x9881407c05010000002d1900),
(3091, 0x9381447c05010000006f1800),
(3091, 0x9881447c05010000002d1900),
(3092, 0x9381497c05010000006f1800),
(3092, 0x95814b7c05010000002c1900),
(3092, 0x9881497c05010000002d1900),
(3093, 0x8f812d7c04010000006f1800),
(3093, 0x95812d7c04010000002d1900),
(3094, 0x8f81327c04010000006f1800),
(3094, 0x9581317c04010000002d1900),
(3095, 0x8c81397c04010000002d1900),
(3095, 0x90813a7c04010000006f1800),
(3096, 0x8c813f7c04010000002d1900),
(3096, 0x90813f7c04010000006f1800),
(3097, 0x8c81447c04010000002d1900),
(3097, 0x9081447c04010000006f1800),
(3098, 0x93813a7c04010000006f1800),
(3099, 0x93813f7c04010000006f1800),
(3099, 0x9881407c04010000002d1900),
(3100, 0x9381447c04010000006f1800),
(3100, 0x9881457c04010000002d1900),
(3101, 0x9381497c04010000006f1800),
(3101, 0x9881497c04010000002d1900),
(3102, 0x8781337c0701000000241900),
(3102, 0x8381367c0701000000c30400),
(3102, 0x8381387c0701000000251900),
(3102, 0x86813a7c0701000000241900),
(3102, 0x87813a7c0701000000241900),
(3103, 0x7981317c0701000000241900),
(3103, 0x7b81317c0701000000241900),
(3103, 0x7681357c0701000000251900),
(3103, 0x7d81357c0701000000c30400),
(3103, 0x7d81377c0701000000251900),
(3104, 0x8381277c0701000000261900),
(3104, 0x86812b7c0701000000271900),
(3104, 0x81812e7c0701000000241900),
(3104, 0x83812e7c0701000000c50400),
(3105, 0x7e81207c0701000000241900),
(3105, 0x7c81277c0701000000c50400),
(3105, 0x7e81277c0701000000241900),
(3105, 0x8181247c0701000000251900),
(3106, 0x8a81597c0601000000241900),
(3106, 0x8b81597c0701000000241900),
(3106, 0x8c81597c0601000000241900),
(3106, 0x8e815b7c0701000000c30400),
(3106, 0x87815c7c0601000000251900),
(3106, 0x87815c7c0701000000251900),
(3106, 0x8a815f7c0601000000241900),
(3106, 0x8a815f7c0701000000241900),
(3106, 0x8c815f7c0601000000241900),
(3106, 0x8e815c7c0601000000251900),
(3106, 0x8c815f7c0701000000241900),
(3106, 0x8e815e7c0701000000251900),
(3107, 0x9781637c0701000000711800),
(3108, 0x9b81637c0701000000711800),
(3109, 0x9f81637c0701000000711800),
(3110, 0xa581637c0701000000711800),
(3110, 0xa781627c07010000002d1900),
(3111, 0x9781667c0701000000711800),
(3111, 0x97816a7c07010000002c1900),
(3112, 0x9b81667c0701000000711800),
(3112, 0x9b816a7c07010000002c1900),
(3113, 0x9f81667c0701000000711800),
(3113, 0x9f816a7c07010000002c1900),
(3114, 0xa581667c0701000000711800),
(3114, 0xa4816a7c07010000002c1900),
(3115, 0x9f81627c0801000000711800),
(3116, 0xa381627c0801000000711800),
(3119, 0x9f81637c0601000000711800),
(3121, 0x9781637c0601000000711800),
(3121, 0x9481657c06010000002f1900),
(3121, 0x9881647c06010000006f1800),
(3121, 0x96816a7c06010000002c1900),
(3123, 0x9f81667c0601000000711800),
(3123, 0x9a816a7c06010000002c1900),
(3123, 0x9e816a7c06010000002c1900),
(3124, 0xa581637c0601000000711800),
(3124, 0xa781617c06010000002d1900),
(3124, 0xa381647c06010000006f1800),
(3124, 0xa6816a7c06010000002c1900),
(3124, 0xa781687c06010000002d1900),
(3125, 0x9781637c0501000000711800),
(3125, 0x9481657c05010000002f1900),
(3125, 0x9881647c05010000006f1800),
(3125, 0x97816a7c05010000002c1900),
(3127, 0x9f81637c0501000000711800),
(3128, 0xa581637c0501000000711800),
(3128, 0xa781627c05010000002d1900),
(3131, 0x9f81667c0501000000711800),
(3131, 0x9b816a7c05010000002c1900),
(3131, 0x9e816a7c05010000002c1900),
(3133, 0xba812f7c0701000000130700),
(3133, 0xbb812f7c0701000000130700),
(3133, 0xb681327c07010000006f1800),
(3133, 0xb981327c0701000000660600),
(3133, 0xbc81337c07010000006f1800),
(3133, 0xbf81337c07010000006f1800),
(3134, 0xba81367c0701000000130700),
(3134, 0xbb81367c0701000000130700),
(3134, 0xb681397c07010000006f1800),
(3134, 0xb981397c0701000000660600),
(3134, 0xbc813a7c07010000006f1800),
(3134, 0xbf813a7c07010000006f1800),
(3135, 0xba813d7c0701000000130700),
(3135, 0xbb813d7c0701000000130700),
(3135, 0xb681407c07010000006f1800),
(3135, 0xb981407c0701000000660600),
(3135, 0xbc81417c07010000006f1800),
(3135, 0xbf81417c07010000006f1800),
(3136, 0xb281597c0701000000241900),
(3136, 0xb4815b7c0701000000c30400),
(3136, 0xb0815d7c0701000000251900),
(3136, 0xb4815e7c0701000000c30400),
(3136, 0xb381607c0701000000c50400),
(3136, 0xb681607c0701000000241900),
(3137, 0xb981597c0701000000241900),
(3137, 0xbb815b7c0701000000c30400),
(3137, 0xbb815e7c0701000000c30400),
(3137, 0xbe815f7c0701000000251900),
(3137, 0xba81607c0701000000c50400),
(3137, 0xbd81607c0701000000241900),
(3138, 0xad81697c0601000000241900),
(3138, 0xae816b7c0601000000c30400),
(3138, 0xaf81697c0701000000241900),
(3138, 0xad816b7c0801000000c30400),
(3138, 0xab816e7c0601000000251900),
(3138, 0xab816e7c0701000000251900),
(3138, 0xad816c7c0601000000c50400),
(3138, 0xad816e7c0801000000c30400),
(3138, 0xb081697c0601000000261900),
(3138, 0xb181697c0701000000c50400),
(3139, 0xb481697c0601000000241900),
(3139, 0xb5816b7c0601000000c30400),
(3139, 0xb781697c0601000000241900),
(3139, 0xb681697c0701000000241900),
(3139, 0xb4816b7c0801000000c30400),
(3139, 0xb881697c0701000000c50400),
(3139, 0xb4816c7c0601000000c50400),
(3139, 0xb4816e7c0801000000c30400),
(3140, 0xbb81697c0601000000241900),
(3140, 0xbb816b7c0801000000c30400),
(3140, 0xbc816b7c0601000000c30400),
(3140, 0xbe81697c0601000000241900),
(3140, 0xbf81697c0701000000c50400),
(3140, 0xbb816c7c0601000000c50400),
(3140, 0xbb816e7c0801000000c30400),
(3140, 0xc0816e7c0601000000251900),
(3140, 0xc0816c7c0701000000251900),
(3140, 0xc0816e7c0701000000251900),
(3141, 0xae81737c0601000000c50400),
(3141, 0xad81737c0701000000c50400),
(3141, 0xae81727c0701000000c30400),
(3141, 0xae81737c07010000001a0700),
(3141, 0xae81777c0601000000241900),
(3141, 0xad81777c0701000000241900),
(3141, 0xae81747c07010000001a0700),
(3141, 0xae81767c0701000000c30400),
(3141, 0xb181737c0601000000c50400),
(3141, 0xb181777c0601000000241900),
(3141, 0xb081777c0701000000c50400),
(3141, 0xb181777c0701000000241900),
(3142, 0xb581737c0601000000c50400),
(3142, 0xb481737c0701000000c50400),
(3142, 0xb581727c0701000000c30400),
(3142, 0xb581737c07010000001a0700),
(3142, 0xb881737c0601000000c50400),
(3142, 0xb581777c0601000000241900),
(3142, 0xb481777c0701000000241900),
(3142, 0xb581747c07010000001a0700),
(3142, 0xb581767c0701000000c30400),
(3142, 0xb781777c0701000000c50400),
(3142, 0xb881777c0601000000241900),
(3142, 0xb881777c0701000000241900),
(3143, 0xbb81737c0701000000c50400),
(3143, 0xbc81737c0601000000c50400),
(3143, 0xbf81737c0601000000c50400),
(3143, 0xbc81727c0701000000c30400),
(3143, 0xbc81737c07010000001a0700),
(3143, 0xbb81777c0701000000241900),
(3143, 0xbc81777c0601000000241900),
(3143, 0xbf81777c0601000000241900),
(3143, 0xbc81747c07010000001a0700),
(3143, 0xbc81767c0701000000c30400),
(3143, 0xbe81777c0701000000c50400),
(3143, 0xbf81777c0701000000241900),
(3144, 0xa181797c0701000000251900),
(3144, 0xa681787c0701000000c30400),
(3144, 0xa4817c7c0701000000241900),
(3145, 0xa181797c0601000000251900),
(3145, 0xa681787c0601000000c30400),
(3145, 0xa4817c7c0601000000241900),
(3146, 0xbc817b7c0501000000241900),
(3146, 0xbf817b7c0601000000241900),
(3146, 0xb9817d7c0701000000251900),
(3146, 0xbc817f7c0501000000c50400),
(3146, 0xbf817f7c0501000000c50400),
(3146, 0xbe817d7c0701000000c30400),
(3146, 0xbe817d7c0801000000c30400),
(3146, 0xc0817b7c0501000000241900),
(3146, 0xc0817d7c0701000000c30400),
(3146, 0xc4817f7c0501000000251900),
(3146, 0xbb81817c0501000000c30400),
(3146, 0xb981807c06010000001a0700),
(3146, 0xb981817c06010000001a0700),
(3146, 0xb981807c0701000000251900),
(3146, 0xbd81827c0501000000c50400),
(3146, 0xbe81807c0701000000c30400),
(3146, 0xb981847c0701000000251900),
(3146, 0xbc81867c0501000000241900),
(3146, 0xbc81867c0601000000241900),
(3146, 0xbc81867c0701000000241900),
(3146, 0xbe81847c0701000000c30400),
(3146, 0xc281827c0501000000c50400),
(3146, 0xc481807c0501000000251900),
(3146, 0xc481807c0601000000251900),
(3146, 0xc481817c0601000000251900),
(3146, 0xc481827c0701000000c30400),
(3146, 0xc181867c0501000000241900),
(3146, 0xc181867c0601000000241900),
(3146, 0xc181867c0701000000241900),
(3146, 0xc481847c0701000000251900),
(3147, 0xdd818b7c0501000000241900),
(3147, 0xdd818b7c0601000000241900),
(3147, 0xdd818b7c0701000000241900),
(3147, 0xda818f7c0501000000251900),
(3147, 0xda818e7c0701000000251900),
(3147, 0xdc818c7c0501000000c30400),
(3147, 0xdd818e7c0601000000c50400),
(3147, 0xe0818f7c0401000000251900),
(3147, 0xe0818f7c0501000000251900),
(3147, 0xe0818f7c0701000000251900),
(3147, 0xdd81917c0401000000241900),
(3147, 0xdd81917c0501000000241900),
(3147, 0xdc81917c0601000000241900),
(3147, 0xdd81917c0701000000c50400),
(3148, 0xca81927c0701000000281900),
(3148, 0xce81927c0701000000ed1300),
(3148, 0xca81977c0601000000ed1300),
(3148, 0xcc81977c0501000000130700),
(3148, 0xcd81977c0501000000130700),
(3148, 0xce81977c0601000000ed1300),
(3148, 0xcc81957c0701000000f61300),
(3148, 0xca81997c0601000000ed1300),
(3148, 0xc881997c07010000002b1900),
(3148, 0xce81997c0601000000ed1300),
(3148, 0xcc81987c0701000000f61300),
(3148, 0xce81997c0701000000ed1300),
(3148, 0xcb819d7c0501000000281900),
(3148, 0xcb819d7c06010000002a1900),
(3148, 0xcb819d7c0701000000281900),
(3148, 0xcf819d7c0501000000281900),
(3148, 0xcf819d7c0601000000281900),
(3148, 0xcf819d7c0701000000281900),
(3148, 0xd081947c0501000000f61300),
(3148, 0xd381947c0501000000291900),
(3148, 0xd381977c0501000000291900),
(3148, 0xd381947c06010000002b1900),
(3148, 0xd381977c06010000002b1900),
(3148, 0xd3819b7c0501000000291900),
(3148, 0xd281997c0601000000ed1300),
(3148, 0xd3819b7c06010000002b1900),
(3148, 0xd2819d7c0501000000281900),
(3148, 0xd2819d7c06010000002a1900),
(3148, 0xd1819d7c0701000000281900),
(3149, 0xce81817c0601000000241900),
(3149, 0xcd81817c0701000000241900),
(3149, 0xcb81847c0501000000251900),
(3149, 0xcb81867c0601000000251900),
(3149, 0xcb81847c0701000000c30400),
(3149, 0xcd81867c0501000000c50400),
(3149, 0xcf81857c0601000000c30400),
(3149, 0xcf81877c06010000001a0700),
(3149, 0xce81877c0801000000c50400),
(3149, 0xcf81857c0801000000c30400),
(3149, 0xcf81887c06010000001a0700),
(3149, 0xcf818a7c0601000000c30400),
(3149, 0xcf818a7c0701000000c30400),
(3149, 0xcd818c7c0501000000241900),
(3149, 0xcd818c7c0601000000241900),
(3149, 0xce818c7c0701000000241900),
(3149, 0xd381817c0501000000241900),
(3149, 0xd481817c0701000000241900),
(3149, 0xd281847c0501000000c50400),
(3149, 0xd281867c0501000000c50400),
(3149, 0xd181847c0701000000c50400),
(3149, 0xd281877c0701000000c30400),
(3149, 0xd681857c0601000000251900),
(3149, 0xd681877c0601000000251900),
(3149, 0xd681877c0701000000251900),
(3149, 0xd2818a7c0701000000c30400),
(3149, 0xd681897c0501000000251900),
(3149, 0xd681897c0601000000251900),
(3149, 0xd6818b7c0701000000251900),
(3149, 0xd3818c7c0501000000241900),
(3149, 0xd3818c7c0601000000241900),
(3149, 0xd1818c7c0701000000261900),
(3149, 0xd4818c7c0601000000241900),
(3150, 0xd081757c0601000000251900),
(3150, 0xd081757c0701000000c30400),
(3150, 0xd081767c0701000000251900),
(3150, 0xd581767c0601000000c30400),
(3150, 0xd581777c0701000000c30400),
(3150, 0xda81757c0701000000251900),
(3150, 0xda81767c0701000000251900),
(3150, 0xd381787c0601000000c50400),
(3150, 0xd0817b7c0701000000251900),
(3150, 0xd4817b7c0701000000c30400),
(3150, 0xd881787c0601000000c50400),
(3150, 0xda817b7c0601000000251900),
(3150, 0xd881787c0701000000c50400),
(3150, 0xd2817d7c0601000000241900),
(3150, 0xd2817d7c0701000000241900),
(3150, 0xd6817d7c0601000000241900),
(3150, 0xd7817d7c0601000000241900),
(3150, 0xd6817d7c0701000000241900),
(3150, 0xd8817d7c0701000000241900),
(3151, 0xd0816d7c0601000000251900),
(3151, 0xd3816e7c0601000000c50400),
(3151, 0xd0816e7c0701000000c30400),
(3151, 0xd4816d7c0601000000c30400),
(3151, 0xd7816d7c0601000000251900),
(3151, 0xd7816e7c0701000000c30400),
(3151, 0xd5816e7c0801000000c50400),
(3151, 0xd081707c0601000000251900),
(3151, 0xd781707c0701000000251900),
(3152, 0xd081667c0601000000251900),
(3152, 0xd381677c0601000000c50400),
(3152, 0xd081677c0701000000c30400),
(3152, 0xd381647c0701000000241900),
(3152, 0xd481667c0601000000c30400),
(3152, 0xd781667c0601000000251900),
(3152, 0xd781677c0701000000c30400),
(3152, 0xd581677c0801000000c50400),
(3152, 0xd081697c0601000000251900),
(3152, 0xd781697c0701000000271900),
(3153, 0xc481737c0701000000251900),
(3153, 0xcb81737c0701000000c30400),
(3153, 0xc981747c0701000000c50400),
(3153, 0xc981777c0701000000241900),
(3153, 0xca81777c0701000000241900),
(3154, 0xc4816e7c0701000000251900),
(3154, 0xc9816c7c0701000000c50400),
(3154, 0xcb816e7c0701000000c30400),
(3155, 0xc781627c0701000000241900),
(3155, 0xc981627c0701000000c50400),
(3155, 0xc481677c0701000000251900),
(3155, 0xc781677c0701000000c30400),
(3155, 0xc881647c0701000000c30400),
(3155, 0xcb81667c0701000000251900),
(3155, 0xcb81677c0701000000251900),
(3156, 0xc681627c0601000000241900),
(3156, 0xca81627c0601000000241900),
(3156, 0xcb81637c0601000000c30400),
(3156, 0xc481677c0601000000251900),
(3156, 0xc781677c0601000000c30400),
(3156, 0xc881647c0601000000c30400),
(3156, 0xcb81667c0601000000251900),
(3156, 0xcb81677c0601000000251900),
(3157, 0xcb816a7c0601000000c30400),
(3157, 0xc4816c7c0601000000251900),
(3157, 0xc9816c7c0601000000c50400),
(3157, 0xcb816e7c0601000000251900),
(3158, 0xc881727c0601000000c30400),
(3158, 0xcb81717c0601000000c30400),
(3158, 0xcb81737c0601000000251900),
(3158, 0xc481747c0601000000251900),
(3158, 0xc681777c0601000000241900),
(3158, 0xca81747c0601000000c50400),
(3158, 0xcb81767c0601000000251900),
(3159, 0xe581727c05010000002d1900),
(3159, 0xe581727c06010000002d1900),
(3159, 0xea81727c03010000002d1900),
(3159, 0xea81727c04010000002d1900),
(3159, 0xea81727c05010000002d1900),
(3159, 0xea81727c06010000002d1900),
(3159, 0xe881747c0401000000721800),
(3159, 0xe881747c0501000000721800),
(3159, 0xe881747c0601000000721800),
(3159, 0xec81767c05010000002d1900),
(3159, 0xec81767c0601000000701800),
(3159, 0xe7817a7c0601000000711800),
(3160, 0xdb81537c0701000000241900),
(3160, 0xd781577c0701000000c30400),
(3160, 0xde81567c0701000000251900),
(3160, 0xde81577c0701000000251900),
(3161, 0xca81497c0701000000c30400),
(3161, 0xcd814c7c0701000000241900),
(3161, 0xcf814c7c0701000000241900),
(3162, 0xd881487c0701000000251900),
(3162, 0xd8814a7c0701000000251900),
(3162, 0xd5814c7c0701000000c50400),
(3162, 0xd7814c7c0701000000241900),
(3163, 0xd1813e7c0701000000241900),
(3163, 0xcd81427c0701000000c30400),
(3163, 0xd481417c0701000000251900),
(3164, 0xca81357c0701000000251900),
(3164, 0xcc81387c0701000000241900),
(3164, 0xce81387c0701000000c50400),
(3164, 0xd181347c0701000000251900),
(3164, 0xd181367c0701000000251900),
(3165, 0xd1813e7c0601000000261900),
(3165, 0xcd81427c0601000000271900),
(3165, 0xd481417c0601000000251900),
(3165, 0xd481427c0601000000251900),
(3165, 0xd481437c0601000000c30400),
(3166, 0xca81487c0601000000251900),
(3166, 0xcd814c7c0601000000241900),
(3166, 0xcf814c7c0601000000c50400),
(3167, 0xd681457c0601000000241900),
(3167, 0xd881487c0601000000251900),
(3167, 0xd8814a7c0601000000251900),
(3167, 0xd4814c7c0601000000c50400),
(3167, 0xd5814c7c0601000000241900),
(3168, 0x0b82127c0701000000241900),
(3168, 0x0882157c0701000000c30400),
(3168, 0x0e82157c0701000000c30400),
(3168, 0x0e82177c0701000000251900),
(3168, 0x0b82197c0701000000241900),
(3169, 0x0982207c0701000000241900),
(3169, 0x0d82207c0701000000241900),
(3169, 0x0e82247c0701000000c50400),
(3171, 0x0e82277c0701000000c50400),
(3171, 0x09822b7c0701000000241900),
(3171, 0x0d822b7c0701000000241900),
(3173, 0x1382277c0701000000c50400),
(3173, 0x12822b7c0701000000241900),
(3173, 0x13822b7c0701000000241900),
(3174, 0x1382207c0701000000241900),
(3174, 0x1382247c0701000000c50400),
(3175, 0x0982207c0601000000241900),
(3175, 0x0d82207c0601000000241900),
(3175, 0x0e82247c0601000000c50400),
(3177, 0x1282207c0601000000241900),
(3177, 0x1182247c0601000000c50400),
(3178, 0x0e82277c0601000000c50400),
(3178, 0x09822b7c0601000000241900),
(3178, 0x0d822b7c0601000000241900),
(3180, 0x1182277c0601000000c50400),
(3180, 0x12822b7c0601000000241900),
(3180, 0x13822b7c0601000000241900),
(3181, 0x1d821b7c0601000000251900),
(3181, 0x1f821d7c0601000000c50400),
(3181, 0x2082197c0601000000241900),
(3181, 0x21821d7c0601000000241900),
(3182, 0x1682157c0601000000241900),
(3182, 0x1882177c0601000000c30400),
(3182, 0x1382187c0601000000251900),
(3182, 0x16821a7c0601000000241900),
(3183, 0x10820e7c0601000000251900),
(3183, 0x15820f7c0601000000c30400),
(3183, 0x1382117c0601000000241900),
(3184, 0x2e820e7c0601000000241900),
(3184, 0x2a82127c0601000000251900),
(3184, 0x2e82157c0601000000c50400),
(3184, 0x3082117c0601000000251900),
(3184, 0x3082137c0601000000251900),
(3185, 0x2e821c7c0601000000c50400),
(3185, 0x30821f7c0601000000251900),
(3185, 0x2f82227c0601000000241900),
(3185, 0x3082207c0601000000251900),
(3186, 0x1d820a7c0701000000241900),
(3186, 0x2082077c0701000000251900),
(3186, 0x2082097c0701000000c30400),
(3187, 0x2882067c0701000000251900),
(3187, 0x2582087c0701000000241900),
(3187, 0x2682087c0701000000c50400),
(3188, 0x2c820a7c0701000000c50400),
(3188, 0x2e820a7c0701000000241900),
(3188, 0x2f82087c0701000000251900),
(3189, 0x3482117c0601000000241900),
(3189, 0x3682137c0601000000c30400),
(3189, 0x3482117c0701000000241900),
(3189, 0x3582117c0701000000c50400),
(3189, 0x3682127c07010000001a0700),
(3189, 0x3682137c0701000000c30400),
(3189, 0x3882117c0601000000241900),
(3189, 0x3982137c0701000000c30400),
(3189, 0x3b82117c0701000000241900),
(3189, 0x3d82137c0601000000251900),
(3189, 0x3d82137c0701000000251900),
(3189, 0x3282167c0601000000251900),
(3189, 0x3582177c0601000000c50400),
(3189, 0x3682167c0601000000c30400),
(3189, 0x3682167c0701000000c30400),
(3189, 0x3482177c0801000000c50400),
(3189, 0x3682147c0801000000c30400),
(3189, 0x3682167c0801000000c30400),
(3189, 0x3982147c0601000000c30400),
(3189, 0x3982177c0601000000c30400),
(3189, 0x3882147c0701000000c50400),
(3189, 0x3d82177c0601000000251900),
(3189, 0x35821b7c0601000000241900),
(3189, 0x35821b7c0701000000241900),
(3189, 0x3682197c0701000000c30400),
(3189, 0x3882187c0601000000c50400),
(3189, 0x38821b7c0601000000241900),
(3189, 0x39821b7c0701000000241900),
(3189, 0x3b821b7c0701000000261900),
(3190, 0xf17f0d7a0701000000081400),
(3190, 0xf07f127a0701000000ff1300),
(3190, 0xf17f157a0701000000081400),
(3191, 0xfc7fff7904010000008d1500),
(3191, 0xfd7fff7907010000008b1500),
(3191, 0xfe7f017a07010000008d1500),
(3191, 0x0080ff7907010000008b1500),
(3192, 0xf67ff87907010000008b1500),
(3192, 0xf87ff87905010000008b1500),
(3192, 0xf87ff87906010000008b1500),
(3192, 0xfd7ff87907010000008b1500),
(3193, 0x0580f37906010000008b1500),
(3193, 0x0280f57907010000008d1500),
(3194, 0x0480f87907010000008b1500),
(3194, 0x0980fb7905010000008d1500),
(3194, 0x0980fa7906010000008b1500),
(3194, 0x0980f97907010000008d1500),
(3194, 0x0d80f97907010000008d1500),
(3195, 0xfe7fd27907010000008d1500),
(3195, 0xf97fd57906010000008d1500),
(3195, 0xfb7fd47906010000008b1500),
(3195, 0xfb7fd57907010000008d1500),
(3196, 0xf27fcc7906010000008d1500),
(3196, 0xf57fcf7907010000008b1500),
(3196, 0xfa7fcf7907010000008b1500),
(3196, 0xf27fd17906010000008d1500),
(3196, 0xf27fd07907010000008d1500),
(3197, 0x0680db7905010000008d1500),
(3197, 0x0680df7907010000008d1500),
(3198, 0x0180d17907010000008b1500),
(3198, 0x0580d27907010000008d1500),
(3199, 0xfe7fc97907010000008d1500),
(3199, 0xff7fcc7907010000008d1500),
(3199, 0x0280ca7905010000008d1500),
(3199, 0x0080c87906010000008b1500),
(3199, 0x0280ca7906010000008d1500),
(3199, 0x0180cb7907010000008b1500),
(3199, 0x0480c87907010000008d1500),
(3205, 0xff7fbd7906010000001a0700),
(3205, 0x0e80b77906010000008d1500),
(3205, 0x0480ba790601000000130700);
INSERT INTO `tile_store` (`house_id`, `data`) VALUES
(3205, 0x0f80b87904010000008b1500),
(3205, 0x0f80b87905010000008d1500),
(3205, 0x0e80b87907010000008d1500),
(3205, 0x0580bd7904010000008b1500),
(3205, 0x0480be7905010000008b1500),
(3205, 0x0780bf7906010000008b1500),
(3205, 0x0480bd7907010000008b1500),
(3205, 0x0580be7907010000008d1500),
(3205, 0x0780bd7907010000008b1500),
(3205, 0x0f80bc7907010000008d1500),
(3205, 0x1180b77904010000008d1500),
(3205, 0x1080ba7907010000008b1500),
(3205, 0x0780c27907010000008b1500),
(3205, 0x0e80c37904010000008d1500),
(3205, 0x0f80c07907010000008d1500),
(3205, 0x0f80c37907010000008d1500),
(3205, 0x1080c37904010000008d1500),
(3205, 0x1080c27907010000008b1500),
(3205, 0x1080c47905010000008d1500),
(3205, 0x1080c47906010000008d1500),
(3206, 0x3180be7906010000008d1500),
(3206, 0x3180bf7907010000008d1500),
(3206, 0x2d80c27906010000008b1500),
(3206, 0x3580c37907010000008b1500),
(3207, 0x3980b97905010000008d1500),
(3207, 0x3880be7906010000008d1500),
(3207, 0x3980be7907010000008d1500),
(3207, 0x3980c07905010000008d1500),
(3207, 0x3980c37907010000008d1500),
(3208, 0x2a80cb7906010000008d1500),
(3208, 0x2d80ca7907010000008b1500),
(3208, 0x2f80cc7907010000008d1500),
(3208, 0x3080cb7906010000008d1500),
(3208, 0x3280cb7907010000008b1500),
(3209, 0x3780cc7907010000008d1500),
(3209, 0x3c80ce7907010000008b1500),
(3209, 0x4b80c57907010000008b1500),
(3209, 0x4380ca7907010000008b1500),
(3211, 0x4980d27904010000008d1500),
(3211, 0x4a80d27905010000008b1500),
(3211, 0x4a80d17906010000008b1500),
(3211, 0x4a80d17907010000008b1500),
(3211, 0x4c80d27905010000008b1500),
(3211, 0x4d80d17906010000008b1500),
(3211, 0x4d80d17907010000008b1500),
(3211, 0x4180d67906010000008b1500),
(3211, 0x4b80d47904010000008b1500),
(3211, 0x4980d67905010000008b1500),
(3211, 0x4a80d57906010000008b1500),
(3211, 0x4a80d57907010000008b1500),
(3211, 0x4d80d57906010000008b1500),
(3211, 0x4c80d77907010000008d1500),
(3211, 0x4d80d57907010000008b1500),
(3211, 0x4180db7906010000008b1500),
(3211, 0x4380da7906010000008d1500),
(3211, 0x4280da7907010000008d1500),
(3211, 0x4080dc7907010000008b1500),
(3211, 0x4680dc7906010000008b1500),
(3211, 0x4c80df7906010000008d1500),
(3211, 0x4e80df7906010000008d1500),
(3211, 0x4c80dc7907010000008d1500),
(3211, 0x4d80df7907010000008d1500),
(3212, 0x5980df7907010000008b1500),
(3213, 0x4980ec7907010000008d1500),
(3213, 0x4a80ee7907010000008b1500),
(3213, 0x4880f07907010000008d1500),
(3214, 0x4a80f47907010000008b1500),
(3214, 0x4c80f57907010000008d1500),
(3214, 0x5180f77906010000008d1500),
(3214, 0x5280f57906010000008b1500),
(3214, 0x5280f67907010000008b1500),
(3214, 0x5080f87907010000008d1500),
(3214, 0x5180fc7907010000008d1500),
(3214, 0x5280fc7907010000008d1500),
(3215, 0x3f80ec7906010000008b1500),
(3215, 0x3f80ec7907010000008b1500),
(3215, 0x3e80f17906010000008d1500),
(3215, 0x4280ea7907010000008d1500),
(3215, 0x4180ed7907010000008d1500),
(3215, 0x4180f47907010000008b1500),
(3216, 0x4480f97907010000008b1500),
(3216, 0x4580ff7907010000008d1500),
(3216, 0x4580037a06010000008d1500),
(3216, 0x4580037a07010000008d1500),
(3216, 0x4880067a06010000008b1500),
(3216, 0x4880067a07010000008b1500),
(3216, 0x43800b7a07010000008b1500),
(3217, 0x05801a7a07010000008b1500),
(3217, 0x0b801b7a06010000008b1500),
(3217, 0x08801c7a06010000008b1500),
(3217, 0x09801e7a07010000008d1500),
(3217, 0x0b801c7a07010000008b1500),
(3218, 0xf67fe37907010000008d1500),
(3218, 0xf27fe77906010000008d1500),
(3218, 0xf37fe57907010000008b1500),
(3218, 0xfb7fe77906010000008d1500),
(3218, 0xfc7fe57907010000008b1500),
(3218, 0xf27feb7906010000008d1500),
(3218, 0xfb7feb7906010000008d1500),
(3218, 0xf97fe97907010000008b1500),
(3218, 0xfc7fe97907010000008b1500),
(3218, 0xf37fed7907010000008b1500),
(3218, 0xf67fee7907010000008d1500),
(3218, 0xfc7fed7907010000008b1500),
(3219, 0x5f7fe67f05010000003c1900),
(3219, 0x5e7fe67f06010000003c1900),
(3219, 0x5f7fe67f07010000003a1900),
(3219, 0x637fe27f05010000003d1900),
(3219, 0x637fe27f06010000003d1900),
(3219, 0x637fe17f07010000003d1900),
(3219, 0x637fe37f0701000000db0d00),
(3219, 0x617fe67f05010000003c1900),
(3219, 0x637fe47f05010000003d1900),
(3219, 0x607fe67f06010000003c1900),
(3219, 0x627fe67f06010000003c1900),
(3219, 0x637fe47f06010000003d1900),
(3219, 0x617fe67f07010000003a1900),
(3219, 0x637fe57f07010000003b1900),
(3220, 0x5d7fd37f06010000003a1900),
(3220, 0x5c7fd37f07010000003a1900),
(3220, 0x5a7fd67f06010000003b1900),
(3220, 0x5a7fd57f07010000003b1900),
(3220, 0x5a7fdb7f07010000003b1900),
(3220, 0x5c7fd87f0601000000d20d00),
(3220, 0x5c7fdc7f07010000003a1900),
(3220, 0x637fd37f06010000003a1900),
(3220, 0x607fd37f07010000003a1900),
(3220, 0x637fd37f07010000003a1900),
(3220, 0x657fd67f06010000003b1900),
(3220, 0x657fd67f07010000003b1900),
(3220, 0x637fd87f0601000000d20d00),
(3220, 0x617fda7f0701000000db0d00),
(3220, 0x657fda7f06010000003b1900),
(3220, 0x657fd87f0701000000db0d00),
(3220, 0x657fda7f07010000003b1900),
(3220, 0x607fdc7f06010000003a1900),
(3220, 0x607fdc7f07010000003a1900),
(3221, 0x717fd37f06010000008f1b00),
(3221, 0x737fd77f0601000000911b00),
(3221, 0x707fd77f0701000000c30400),
(3221, 0x747fd57f0701000000c50400),
(3221, 0x737fda7f0701000000c60400),
(3222, 0x7f7fee7f0701000000db0d00),
(3222, 0x867fe67f06010000003b1900),
(3222, 0x867fe77f07010000003b1900),
(3222, 0x837fea7f0601000000d20d00),
(3222, 0x837fea7f0701000000d20d00),
(3222, 0x867fe97f06010000003b1900),
(3222, 0x867fec7f06010000003b1900),
(3222, 0x867fef7f06010000003b1900),
(3222, 0x867fec7f07010000003b1900),
(3222, 0x867fef7f07010000003b1900),
(3222, 0x827ff07f06010000003a1900),
(3222, 0x827ff07f07010000003a1900),
(3222, 0x847ff07f06010000003a1900),
(3222, 0x847ff07f07010000003a1900),
(3223, 0x777ff57f0701000000db0d00),
(3223, 0x797ff57f0701000000620600),
(3223, 0x7d7ff57f07010000003b1900),
(3223, 0x7d7ff77f07010000003b1900),
(3223, 0x797ffa7f07010000003a1900),
(3223, 0x7c7ffa7f07010000003a1900),
(3224, 0x657ff67f0701000000660600),
(3224, 0x677ff47f07010000003b1900),
(3224, 0x677ff67f0701000000db0d00),
(3224, 0x627ff87f07010000003a1900),
(3224, 0x667ff87f07010000003a1900),
(3225, 0x677fed7f07010000003b1900),
(3225, 0x677fef7f07010000003b1900),
(3225, 0x657ff07f0701000000660600),
(3225, 0x677ff07f0701000000db0d00),
(3226, 0x5b7ff47f07010000003b1900),
(3226, 0x5b7ff77f07010000003b1900),
(3226, 0x577ff87f07010000003a1900),
(3226, 0x597ff87f0701000000d20d00),
(3227, 0x4c7ff97f07010000003a1900),
(3227, 0x4f7ff97f07010000003a1900),
(3227, 0x507ff57f07010000003d1900),
(3227, 0x507ff77f0701000000db0d00),
(3228, 0x867f15800701000000db0d00),
(3228, 0x8a7f17800701000000d20d00),
(3228, 0x8c7f158007010000003b1900),
(3228, 0x8a7f1a8007010000003c1900),
(3229, 0x917f1a8007010000003b1900),
(3229, 0x967f1a8004010000003b1900),
(3229, 0x967f1a800501000000d20d00),
(3229, 0x967f1a800701000000db0d00),
(3229, 0x9b7f1a800501000000d20d00),
(3229, 0x987f18800701000000d20d00),
(3229, 0x997f18800701000000d20d00),
(3229, 0x9b7f1a800701000000db0d00),
(3229, 0x947f1c8004010000003a1900),
(3229, 0x947f1d800601000000d20d00),
(3229, 0x9a7f1d800601000000d20d00),
(3229, 0x997f1c800701000000d20d00),
(3229, 0x9e7f1c8004010000003a1900),
(3229, 0xa07f1a8004010000003b1900),
(3229, 0xa07f1b8006010000003b1900),
(3229, 0xa07f1a8007010000003b1900),
(3229, 0xa07f1e8005010000003b1900),
(3229, 0xa07f1e8006010000003b1900),
(3229, 0x937f20800601000000d20d00),
(3229, 0x937f238006010000003a1900),
(3229, 0x917f218007010000003b1900),
(3229, 0x947f238004010000003a1900),
(3229, 0x967f218004010000003b1900),
(3229, 0x967f20800501000000d20d00),
(3229, 0x967f20800601000000d20d00),
(3229, 0x977f238006010000003a1900),
(3229, 0x9b7f20800501000000d20d00),
(3229, 0x9b7f238005010000003a1900),
(3229, 0x9b7f20800601000000d20d00),
(3229, 0x9e7f238004010000003a1900),
(3229, 0x9c7f238006010000003a1900),
(3229, 0xa07f218004010000003b1900),
(3229, 0xa07f218006010000003b1900),
(3229, 0xa07f218007010000003b1900),
(3230, 0x6d7f1a8007010000003b1900),
(3230, 0x6b7f1e8007010000003a1900),
(3230, 0x6d7f1c800701000000db0d00),
(3231, 0x3f7f1b800701000000db0d00),
(3231, 0x437f1c800701000000db0d00),
(3232, 0x2b7f2e800601000000db0d00),
(3232, 0x2a7f308006010000003a1900),
(3233, 0x257f228006010000003d1900),
(3233, 0x257f23800601000000db0d00),
(3233, 0x227f258006010000003c1900),
(3233, 0x247f258006010000003c1900),
(3233, 0x257f248006010000003d1900),
(3234, 0x2f7f278006010000003a1900),
(3234, 0x307f25800601000000db0d00),
(3234, 0x307f268006010000003b1900),
(3235, 0x297f1e800601000000d20d00),
(3235, 0x2a7f1e8006010000003c1900),
(3235, 0x2b7f1d8006010000003d1900),
(3236, 0x377f178006010000003a1900),
(3236, 0x397f178006010000003a1900),
(3236, 0x357f1a8006010000003b1900),
(3236, 0x3a7f198006010000003d1900),
(3236, 0x3a7f1a800601000000db0d00),
(3236, 0x3a7f1b8006010000003b1900),
(3236, 0x387f1d8006010000003a1900),
(3237, 0x357f138006010000003d1900),
(3237, 0x387f108006010000003c1900),
(3237, 0x3a7f128006010000003b1900),
(3237, 0x3a7f13800601000000db0d00),
(3237, 0x3a7f148006010000003b1900),
(3238, 0x3f7f128006010000003b1900),
(3238, 0x427f0d8006010000003a1900),
(3238, 0x457f0f8006010000003b1900),
(3238, 0x417f138006010000003a1900),
(3238, 0x437f13800601000000d20d00),
(3238, 0x447f138006010000003a1900),
(3238, 0x457f128006010000003b1900),
(3239, 0x4c7f0f8006010000003b1900),
(3239, 0x537f0f8005010000003b1900),
(3239, 0x537f0f8006010000003b1900),
(3239, 0x4c7f158006010000003b1900),
(3239, 0x4e7f178006010000003a1900),
(3239, 0x507f13800501000000d20d00),
(3239, 0x537f128005010000003b1900),
(3239, 0x507f10800601000000d20d00),
(3239, 0x537f128006010000003b1900),
(3239, 0x507f178005010000003a1900),
(3239, 0x537f158005010000003b1900),
(3239, 0x507f17800601000000d20d00),
(3239, 0x527f178006010000003a1900),
(3239, 0x537f158006010000003b1900),
(3240, 0x587f148006010000003b1900),
(3240, 0x5b7f188005010000003c1900),
(3240, 0x5b7f188006010000003a1900),
(3240, 0x5d7f18800601000000d20d00),
(3240, 0x607f15800501000000d20d00),
(3240, 0x627f178005010000003d1900),
(3240, 0x627f148006010000003b1900),
(3240, 0x627f178006010000003b1900),
(3240, 0x607f188005010000003c1900),
(3240, 0x607f188006010000003a1900),
(3241, 0x6a7f12800601000000d20d00),
(3241, 0x6c7f108006010000003b1900),
(3242, 0x727f128006010000003a1900),
(3242, 0x737f128006010000003a1900),
(3242, 0x747f10800601000000db0d00),
(3243, 0x7b7f0f8006010000003a1900),
(3243, 0x7d7f0f8006010000003a1900),
(3243, 0x7e7f0e800601000000db0d00),
(3243, 0x807f0f8006010000003a1900),
(3243, 0x827f0f800601000000d20d00),
(3243, 0x837f0f8006010000003a1900),
(3243, 0x857f0d8006010000003b1900),
(3243, 0x857f0e8006010000003b1900),
(3244, 0x8a7f0c8006010000003b1900),
(3244, 0x8c7f0d8006010000003a1900),
(3244, 0x8d7f0d800601000000d20d00),
(3244, 0x8e7f0d8006010000003a1900),
(3244, 0x8f7f0c8006010000003b1900),
(3245, 0x9b7f0e8005010000003b1900),
(3245, 0x997f0c8006010000003c1900),
(3245, 0x9b7f0e8006010000003b1900),
(3245, 0x957f108006010000003b1900),
(3245, 0x977f118006010000003a1900),
(3245, 0x9b7f108005010000003b1900),
(3245, 0x987f11800601000000d20d00),
(3245, 0x997f118006010000003a1900),
(3245, 0x9b7f108006010000003b1900),
(3246, 0x9f7f0c8006010000003b1900),
(3246, 0xa27f098006010000003a1900),
(3246, 0xa47f0b8006010000003b1900),
(3246, 0xa27f0e800601000000d20d00),
(3246, 0xa47f0d8006010000003b1900),
(3247, 0x947f028006010000003c1900),
(3247, 0x967f078006010000003a1900),
(3247, 0x977f048006010000003d1900),
(3247, 0x977f05800601000000db0d00),
(3248, 0x9d7f038006010000003b1900),
(3248, 0xa07f008006010000003a1900),
(3248, 0xa37f028006010000003b1900),
(3248, 0xa07f05800601000000d20d00),
(3248, 0xa27f058006010000003a1900),
(3248, 0xa37f048006010000003b1900),
(3249, 0xa87f018006010000003a1900),
(3249, 0xa97f01800601000000d20d00),
(3249, 0xaa7f018006010000003a1900),
(3250, 0x927fee7f06010000003a1900),
(3250, 0x8f7ff27f06010000003b1900),
(3250, 0x957ff07f0601000000db0d00),
(3250, 0x957ff27f06010000003b1900),
(3250, 0x957ff37f06010000003b1900),
(3250, 0x927ff47f06010000003a1900),
(3250, 0x937ff47f06010000003a1900),
(3251, 0x9b7fe57f05010000003a1900),
(3251, 0x9c7fe57f06010000003a1900),
(3251, 0x997feb7f05010000003b1900),
(3251, 0x9b7fe87f0501000000d20d00),
(3251, 0x997fea7f06010000003b1900),
(3251, 0x9d7feb7f0501000000db0d00),
(3251, 0x9b7fec7f05010000003c1900),
(3251, 0x9f7fec7f05010000003a1900),
(3251, 0x9c7fec7f06010000003a1900),
(3251, 0x9e7fec7f06010000003a1900),
(3251, 0xa07fe77f05010000003b1900),
(3251, 0xa07fe77f06010000003b1900),
(3251, 0xa07fe87f06010000003b1900),
(3251, 0xa07fea7f0601000000db0d00),
(3252, 0x9e7ff27f06010000003a1900),
(3252, 0x9c7ff57f06010000003b1900),
(3252, 0x9e7ff77f06010000003a1900),
(3252, 0xa07ff77f06010000003a1900),
(3252, 0xa17ff57f0601000000db0d00),
(3253, 0xa57ff27f06010000003b1900),
(3253, 0xa77ff37f06010000003c1900),
(3253, 0xa87ff37f0601000000d20d00),
(3253, 0xa97ff37f06010000003c1900),
(3253, 0xaa7ff07f06010000003d1900),
(3253, 0xaa7ff27f06010000003b1900),
(3254, 0xb47ff37f06010000003b1900),
(3254, 0xb27ff47f0601000000d20d00),
(3255, 0xa57fe67f06010000003d1900),
(3255, 0xaa7fe57f06010000003b1900),
(3255, 0xaa7fe77f06010000003b1900),
(3255, 0xa87fe87f0601000000d20d00),
(3256, 0x877ffb7f0501000000d20d00),
(3256, 0x877ffb7f0601000000d20d00),
(3256, 0x8a7ffa7f05010000003b1900),
(3256, 0x8a7ff87f06010000003b1900),
(3256, 0x8a7ffa7f06010000003b1900),
(3256, 0x8a7ffe7f06010000003d1900),
(3256, 0x857f008006010000003c1900),
(3256, 0x877f00800601000000d20d00),
(3256, 0x897f008006010000003a1900),
(3257, 0x7b7ffe7f06010000003a1900),
(3257, 0x7d7f008006010000003b1900),
(3257, 0x7d7f038006010000003b1900),
(3257, 0x787f048006010000003a1900),
(3257, 0x7a7f04800601000000d20d00),
(3257, 0x7c7f048006010000003a1900),
(3258, 0x737ffe7f06010000003a1900),
(3258, 0x707f008006010000003b1900),
(3258, 0x727f048006010000003a1900),
(3258, 0x737f04800601000000d20d00),
(3258, 0x757f048006010000003a1900),
(3259, 0x677fff7f05010000003a1900),
(3259, 0x627f038005010000003b1900),
(3259, 0x697f018005010000003b1900),
(3259, 0x697f038005010000003b1900),
(3259, 0x697f018006010000003b1900),
(3259, 0x697f038006010000003b1900),
(3259, 0x647f068005010000003a1900),
(3259, 0x647f068006010000003a1900),
(3259, 0x687f068005010000003a1900),
(3259, 0x687f068006010000003a1900),
(3259, 0x697f05800601000000db0d00),
(3260, 0x527f008006010000003b1900),
(3260, 0x5a7f008006010000003d1900),
(3260, 0x5a7f028006010000003d1900),
(3260, 0x547f048006010000003c1900),
(3260, 0x567f04800601000000d20d00),
(3260, 0x597f048006010000003c1900),
(3261, 0x457f028006010000003d1900),
(3261, 0x4e7f018006010000003d1900),
(3261, 0x4e7f028006010000003d1900),
(3261, 0x487f048006010000003c1900),
(3261, 0x4a7f04800601000000d20d00),
(3261, 0x4c7f048006010000003c1900),
(3262, 0x3f7ffa7f06010000003a1900),
(3262, 0x3c7fff7f06010000003a1900),
(3262, 0x3f7fff7f06010000003a1900),
(3262, 0x407ffc7f06010000003b1900),
(3262, 0x407ffe7f0601000000db0d00),
(3263, 0x377f068006010000003b1900),
(3263, 0x377f07800601000000db0d00),
(3263, 0x337f0a8006010000003a1900),
(3263, 0x357f0a8006010000003c1900),
(3263, 0x377f098006010000003b1900),
(3264, 0x227ffd7f0601000000d20d00),
(3264, 0x267ffe7f0501000000db0d00),
(3264, 0x257ffd7f0601000000d20d00),
(3264, 0x297ffd7f0601000000d20d00),
(3264, 0x2b7fff7f0601000000db0d00),
(3264, 0x227f00800601000000d20d00),
(3264, 0x267f03800501000000db0d00),
(3264, 0x287f00800601000000d20d00),
(3265, 0xc37d99790701000000711b00),
(3265, 0xc47d99790601000000711b00),
(3265, 0xc97d99790701000000711b00),
(3265, 0xc07d9c790601000000721b00),
(3265, 0xc07d9c790701000000721b00),
(3265, 0xc37d9f790701000000711b00),
(3265, 0xc47d9f790601000000711b00),
(3265, 0xc77d9c790601000000721b00),
(3265, 0xc77d9d790601000000f71a00),
(3265, 0xc77d9d790701000000f71a00),
(3265, 0xca7d9c790701000000f71a00),
(3266, 0xc67d93790701000000ee1a00),
(3266, 0xca7d93790701000000711b00),
(3266, 0xc47d94790701000000721b00),
(3266, 0xc67d97790701000000731b00),
(3266, 0xc87d95790701000000f71a00),
(3266, 0xcb7d97790701000000731b00),
(3266, 0xcd7d96790701000000f71a00),
(3267, 0xc57da2790701000000711b00),
(3267, 0xcb7da2790701000000711b00),
(3267, 0xc77da4790701000000f71a00),
(3267, 0xca7da7790701000000ee1a00),
(3267, 0xcd7da4790701000000f71a00),
(3267, 0xc77da9790701000000721b00),
(3267, 0xca7daa790701000000711b00),
(3268, 0xc57da2790601000000731b00),
(3268, 0xc97da2790601000000711b00),
(3268, 0xc77da4790601000000f71a00),
(3268, 0xcd7da5790601000000721b00),
(3268, 0xca7daa790601000000711b00),
(3268, 0xcc7daa790601000000ee1a00),
(3268, 0xcd7da8790601000000721b00),
(3269, 0xbf7dab790501000000f71a00),
(3269, 0xbc7dab790601000000721b00),
(3269, 0xbe7dad790501000000ee1a00),
(3269, 0xc07da7790601000000711b00),
(3269, 0xc47da9790601000000721b00),
(3269, 0xc47dab790601000000721b00),
(3269, 0xc17dad790501000000711b00),
(3269, 0xc07daf790601000000711b00),
(3269, 0xc37dac790601000000ee1a00),
(3269, 0xc47dae790601000000f71a00),
(3270, 0xdf7d9f790701000000711b00),
(3270, 0xdf7da5790701000000ee1a00),
(3270, 0xe17da1790701000000f71a00),
(3270, 0xe47da2790701000000721b00),
(3271, 0xdd7d99790701000000f71a00),
(3271, 0xe07d96790701000000711b00),
(3271, 0xe07d9b790701000000f71a00),
(3271, 0xe37d9b790701000000721b00),
(3272, 0xd07d8f790701000000721b00),
(3272, 0xd07d92790701000000721b00),
(3272, 0xd27d93790701000000ee1a00),
(3272, 0xd47d90790701000000f71a00),
(3272, 0xd57d93790701000000711b00),
(3273, 0xd97d8c790701000000711b00),
(3273, 0xd97d8f790701000000ee1a00),
(3273, 0xdd7d8f790701000000ee1a00),
(3273, 0xdb7d93790701000000ee1a00),
(3273, 0xdd7d93790701000000711b00),
(3273, 0xdf7d90790701000000721b00),
(3274, 0xd07d8e790601000000721b00),
(3274, 0xd07d92790601000000721b00),
(3274, 0xd37d93790601000000711b00),
(3274, 0xd67d92790601000000f71a00),
(3274, 0xd87d93790601000000ee1a00),
(3274, 0xdb7d90790601000000f71a00),
(3275, 0xe67d8b790601000000731b00),
(3275, 0xe27d8e790601000000721b00),
(3275, 0xe27d8e790701000000721b00),
(3275, 0xe57d8e790701000000f71a00),
(3275, 0xea7d8d790601000000741b00),
(3275, 0xea7d8f790601000000741b00),
(3275, 0xea7d8e790701000000f71a00),
(3275, 0xe67d91790601000000731b00),
(3275, 0xe87d91790701000000711b00),
(3276, 0xea7d93790701000000711b00),
(3276, 0xe67d96790701000000721b00),
(3276, 0xe97d95790701000000f71a00),
(3276, 0xee7d96790701000000f71a00),
(3276, 0xec7d98790701000000731b00),
(3277, 0xe67d9e790701000000721b00),
(3277, 0xe97d9c790601000000f71a00),
(3277, 0xeb7d9d790601000000ee1a00),
(3277, 0xeb7d9e790701000000f71a00),
(3277, 0xed7d9e790601000000721b00),
(3277, 0xed7d9e790701000000f71a00),
(3277, 0xe97da1790601000000711b00),
(3277, 0xeb7da1790601000000711b00),
(3277, 0xe97da1790701000000711b00),
(3277, 0xed7da0790701000000741b00),
(3278, 0xf67d9b790601000000731b00),
(3278, 0xf27d9d790701000000f71a00),
(3278, 0xf47d9f790601000000711b00),
(3278, 0xf77d9f790601000000ee1a00),
(3278, 0xf67d9e790701000000ee1a00),
(3278, 0xf97d9d790601000000721b00),
(3278, 0xf97d9d790701000000721b00),
(3278, 0xf77da1790701000000711b00),
(3279, 0xfe7d99790701000000711b00),
(3279, 0xff7d9e790701000000711b00),
(3279, 0x047e99790701000000711b00),
(3279, 0x017e9c790701000000f71a00),
(3279, 0x047e9e790701000000711b00),
(3279, 0x077e9c790701000000f71a00),
(3280, 0xf77d8b790701000000721b00),
(3280, 0xfa7d8b790501000000f71a00),
(3280, 0xfe7d8b790501000000721b00),
(3280, 0xf77d8c790601000000721b00),
(3280, 0xf77d8d7907010000001a0700),
(3280, 0xf77d8e790701000000f71a00),
(3280, 0xf77d8f7907010000001a0700),
(3280, 0xf57d8f790801000000680600),
(3280, 0xfa7d8f790501000000f71a00),
(3280, 0xf97d8c790701000000ee1a00),
(3280, 0xfa7d8e790701000000f71a00),
(3280, 0xfe7d8f790501000000721b00),
(3280, 0xfe7d8d790601000000721b00),
(3280, 0xfe7d8c790701000000721b00),
(3280, 0xf37d917908010000001a0700),
(3280, 0xf67d93790501000000f71a00),
(3280, 0xf77d92790601000000f71a00),
(3280, 0xf77d92790701000000f71a00),
(3280, 0xfa7d93790501000000f71a00),
(3280, 0xfa7d91790601000000f71a00),
(3280, 0xfa7d92790701000000f71a00),
(3280, 0xfe7d93790501000000721b00),
(3280, 0xfe7d91790601000000721b00),
(3280, 0xfe7d92790701000000721b00),
(3280, 0xf37d94790501000000721b00),
(3280, 0xf37d94790601000000721b00),
(3280, 0xf37d94790701000000721b00),
(3280, 0xf57d97790401000000711b00),
(3280, 0xf97d94790601000000711b00),
(3280, 0xf97d94790701000000711b00),
(3280, 0xfc7d94790701000000711b00),
(3281, 0x047e8f790701000000f71a00),
(3281, 0x077e8d790701000000ee1a00),
(3281, 0x0a7e8c790701000000721b00),
(3281, 0x0a7e8f790701000000721b00),
(3281, 0x077e91790701000000ee1a00),
(3281, 0x077e94790701000000711b00),
(3282, 0x017e83790701000000721b00),
(3282, 0x057e83790701000000f71a00),
(3282, 0x087e83790601000000f71a00),
(3282, 0x0b7e83790701000000721b00),
(3282, 0x037e85790701000000ee1a00),
(3282, 0x047e85790601000000711b00),
(3282, 0x077e85790601000000711b00),
(3282, 0x097e85790701000000711b00),
(3283, 0x0e7e8f790701000000721b00),
(3283, 0x107e8a790601000000ee1a00),
(3283, 0x117e88790701000000711b00),
(3283, 0x147e8a790701000000721b00),
(3283, 0x117e8f790601000000ee1a00),
(3283, 0x137e8c790701000000ee1a00),
(3283, 0x147e8d790601000000741b00),
(3283, 0x147e8f790701000000721b00),
(3283, 0x107e92790701000000711b00),
(3283, 0x137e92790701000000711b00),
(3283, 0x147e91790701000000f71a00),
(3284, 0x1a7e88790701000000711b00),
(3284, 0x1c7e8a790601000000721b00),
(3284, 0x1c7e8a790701000000721b00),
(3284, 0x1a7e8f790601000000ee1a00),
(3284, 0x187e8e790701000000f71a00),
(3284, 0x197e8f790701000000680600),
(3284, 0x1a7e8c790701000000ee1a00),
(3284, 0x1c7e8d790601000000721b00),
(3284, 0x1c7e8f790701000000721b00),
(3284, 0x1a7e92790701000000ee1a00),
(3285, 0x237e8e790701000000f71a00),
(3285, 0x297e8d790701000000721b00),
(3285, 0x297e8f790701000000721b00),
(3285, 0x257e91790701000000ee1a00),
(3285, 0x217e95790701000000f71a00),
(3285, 0x257e96790701000000711b00),
(3285, 0x287e94790701000000721b00),
(3286, 0x2e7e8d790701000000a41400),
(3286, 0x317e8f790701000000461900),
(3286, 0x347e8d790701000000471900),
(3287, 0x2d7e94790701000000a41400),
(3287, 0x2f7e95790701000000461900),
(3287, 0x327e95790701000000461900),
(3287, 0x347e94790701000000471900),
(3288, 0x357e87790701000000a41400),
(3288, 0x397e86790701000000471900),
(3288, 0x387e8a790701000000461900),
(3289, 0x347e81790701000000a41400),
(3289, 0x367e82790701000000481900),
(3290, 0x357e7b790701000000a51400),
(3290, 0x377e7d790701000000461900),
(3290, 0x3a7e7d790701000000481900),
(3291, 0x3f7e83790701000000461900),
(3291, 0x407e83790701000000a71400),
(3291, 0x417e81790701000000471900),
(3292, 0x357ea2790701000000660600),
(3292, 0x377ea1790701000000ee1a00),
(3292, 0x387ea3790601000000721b00),
(3292, 0x337ea6790601000000711b00),
(3292, 0x317ea4790701000000721b00),
(3292, 0x317ea5790701000000f71a00),
(3292, 0x357ea4790601000000f71a00),
(3292, 0x357ea6790701000000711b00),
(3292, 0x387ea5790601000000721b00),
(3292, 0x387ea4790701000000721b00),
(3293, 0x0c7eaf790701000000721b00),
(3293, 0x0e7eb1790701000000ee1a00),
(3293, 0x0e7eb4790701000000711b00),
(3293, 0x127eb1790701000000ee1a00),
(3293, 0x147eb0790701000000721b00),
(3293, 0x107eb4790701000000ee1a00),
(3293, 0x137eb4790701000000711b00),
(3294, 0xfe7db3790601000000721b00),
(3294, 0xfe7db3790701000000721b00),
(3294, 0x017ead790601000000711b00),
(3294, 0x017ead790701000000711b00),
(3294, 0x017eb0790601000000ee1a00),
(3294, 0x017eb0790701000000ee1a00),
(3294, 0x067eb3790601000000f71a00),
(3294, 0x047eb3790701000000f71a00),
(3294, 0x077eb0790701000000711b00),
(3294, 0x0a7eb3790701000000721b00),
(3294, 0x017eb5790601000000711b00),
(3294, 0x007eb5790701000000ee1a00),
(3294, 0x027eb5790701000000711b00),
(3294, 0x057eb5790601000000711b00),
(3294, 0x087eb5790701000000711b00),
(3295, 0x047eba790701000000ee1a00),
(3295, 0x027ebe790701000000721b00),
(3295, 0x057ebf790701000000f71a00),
(3295, 0x097ebc790701000000721b00),
(3295, 0x047ec1790701000000711b00),
(3295, 0x077ec1790701000000711b00),
(3296, 0xfc7dbb790701000000f71a00),
(3296, 0xfb7dbf790601000000711b00),
(3296, 0xf97dbe790701000000f71a00),
(3296, 0xfc7dbc790601000000f71a00),
(3296, 0xff7dbf790601000000711b00),
(3296, 0xfc7dbe790701000000f71a00),
(3296, 0xfe7dbf790701000000711b00),
(3296, 0x007ebb790701000000721b00),
(3296, 0x007ebc790601000000721b00),
(3297, 0x0d7ec3790601000000721b00),
(3297, 0x0f7ec0790701000000711b00),
(3297, 0x0d7ec6790701000000f71a00),
(3297, 0x0f7ec4790701000000ee1a00),
(3297, 0x127ec2790601000000721b00),
(3297, 0x117ec3790701000000660600),
(3297, 0x137ec0790701000000ee1a00),
(3297, 0x157ec2790701000000721b00),
(3297, 0x107ec7790601000000711b00),
(3297, 0x127ec4790601000000f71a00),
(3297, 0x127ec6790601000000721b00),
(3297, 0x157ec6790701000000721b00),
(3298, 0x037ec3790701000000711b00),
(3298, 0x007ec5790701000000f71a00),
(3298, 0x057ec6790701000000f71a00),
(3298, 0x087ec6790701000000721b00),
(3299, 0x007ec9790701000000f71a00),
(3299, 0x037ecb790701000000711b00),
(3299, 0x057eca790701000000f71a00),
(3299, 0x077ecb790701000000711b00),
(3300, 0x057ed3790701000000ee1a00),
(3300, 0x067ed0790701000000711b00),
(3300, 0x027ed5790701000000f71a00),
(3300, 0x057ed6790701000000711b00),
(3300, 0x077ed5790701000000721b00),
(3301, 0xf07dd2790701000000721b00),
(3301, 0xf77dd2790701000000f71a00),
(3301, 0xf97dd3790701000000f71a00),
(3301, 0xf37dd6790701000000711b00),
(3301, 0xf77dd5790701000000f71a00),
(3301, 0xf97dd5790701000000721b00),
(3302, 0xdf7dd7790701000000851a00),
(3302, 0xe77dd77907010000008e1b00),
(3302, 0xe17dd9790701000000861a00),
(3302, 0xe37dd87907010000008e1b00),
(3302, 0xe57dd9790701000000841a00),
(3303, 0xd97dd3790701000000851a00),
(3303, 0xd67dd5790701000000901b00),
(3303, 0xd97dd77907010000008e1b00),
(3303, 0xd67dd8790701000000841a00),
(3304, 0xcf7dcd790701000000851a00),
(3304, 0xd77dca790701000000901b00),
(3304, 0xd17dcf790701000000841a00),
(3304, 0xd47dce7907010000008e1b00),
(3304, 0xd77dcf790701000000841a00),
(3304, 0xda7dcd790701000000851a00),
(3305, 0xdc7dcd790701000000851a00),
(3305, 0xdf7dcd7907010000008e1b00),
(3305, 0xe17dca790701000000901b00),
(3305, 0xe37dcd790701000000871a00),
(3305, 0xde7dd0790701000000861a00),
(3305, 0xe17dd0790701000000861a00),
(3306, 0xda7dbf790701000000861a00),
(3306, 0xd87dc3790701000000851a00),
(3306, 0xda7dc7790701000000861a00),
(3306, 0xdb7dc57907010000008e1b00),
(3306, 0xdd7dc7790701000000901b00),
(3306, 0xde7dc57907010000008e1b00),
(3306, 0xe17dc3790701000000871a00),
(3306, 0xe17dc6790701000000871a00),
(3307, 0xd17dbf790701000000861a00),
(3307, 0xd17dc2790701000000901b00),
(3307, 0xd47dc1790701000000871a00),
(3307, 0xd17dc6790701000000901b00),
(3307, 0xd47dc4790701000000871a00),
(3308, 0xc77dbe790701000000841a00),
(3308, 0xc47dc1790701000000851a00),
(3308, 0xc87dc3790701000000841a00),
(3308, 0xcb7dc17907010000008e1b00),
(3309, 0xf57dad790701000000721b00),
(3309, 0xfc7daf790701000000721b00),
(3309, 0xf57db2790701000000721b00),
(3309, 0xf77db0790701000000ee1a00),
(3309, 0xfb7db0790701000000ee1a00),
(3309, 0xfc7db3790701000000721b00),
(3309, 0xf87db4790701000000ee1a00),
(3309, 0xfb7db4790701000000711b00),
(3310, 0xe47daf790701000000721b00),
(3310, 0xe57db0790701000000ee1a00),
(3310, 0xe47db5790701000000721b00),
(3310, 0xe67db7790701000000ee1a00),
(3310, 0xe87db4790701000000f71a00),
(3310, 0xe67dba790701000000711b00),
(3311, 0xed7dad790701000000711b00),
(3311, 0xef7daf790701000000721b00),
(3311, 0xea7db1790701000000ee1a00),
(3311, 0xec7db0790701000000ee1a00),
(3311, 0xed7db2790701000000711b00),
(3312, 0xea7db6790701000000ee1a00),
(3312, 0xec7db5790701000000711b00),
(3312, 0xec7db7790701000000ee1a00),
(3312, 0xed7dba790701000000711b00),
(3312, 0xef7db8790701000000721b00),
(3313, 0xed7dbe790501000000711b00),
(3313, 0xed7dbe790601000000711b00),
(3313, 0xec7dbe790701000000711b00),
(3313, 0xf37dbe790501000000711b00),
(3313, 0xf37dbe790601000000711b00),
(3313, 0xf47dbe790601000000130700),
(3313, 0xea7dc2790601000000721b00),
(3313, 0xed7dc0790701000000f71a00),
(3313, 0xee7dc1790701000000ee1a00),
(3313, 0xea7dc6790501000000721b00),
(3313, 0xea7dc7790601000000721b00),
(3313, 0xea7dc4790701000000721b00),
(3313, 0xed7dc6790501000000f71a00),
(3313, 0xea7dca790701000000721b00),
(3313, 0xee7dc9790501000000ee1a00),
(3313, 0xec7dca790601000000ee1a00),
(3313, 0xec7dcb790701000000ee1a00),
(3313, 0xed7dce790501000000711b00),
(3313, 0xec7dce790601000000711b00),
(3313, 0xec7dce790701000000711b00),
(3313, 0xf07dc3790501000000ee1a00),
(3313, 0xf17dc1790701000000ee1a00),
(3313, 0xf37dc27907010000001a0700),
(3313, 0xf37dc37907010000001a0700),
(3313, 0xf67dc2790601000000721b00),
(3313, 0xf67dc1790701000000721b00),
(3313, 0xf17dc4790701000000711b00),
(3313, 0xf27dc6790701000000f71a00),
(3313, 0xf67dc6790701000000721b00),
(3313, 0xf17dc9790501000000ee1a00),
(3313, 0xf07dca790601000000ee1a00),
(3313, 0xf07dcb790701000000ee1a00),
(3313, 0xf47dca790501000000ee1a00),
(3313, 0xf47dca790601000000ee1a00),
(3313, 0xf67dc8790601000000721b00),
(3313, 0xf57dcb790701000000ee1a00),
(3313, 0xf17dce790501000000711b00),
(3313, 0xf07dce790601000000711b00),
(3313, 0xf07dce790701000000711b00),
(3313, 0xf47dce790501000000711b00),
(3313, 0xf47dce790601000000711b00),
(3313, 0xf67dcc790701000000721b00),
(3314, 0xcc81ba7e07010000008b1500),
(3315, 0xcf81ba7e07010000008b1500),
(3316, 0xca81bf7e07010000008b1500),
(3316, 0xc881c27e07010000008d1500),
(3317, 0xd181bf7e07010000008b1500),
(3317, 0xd481c27e07010000008d1500),
(3318, 0xce81c27e07010000008d1500),
(3319, 0xc881bc7e06010000008d1500),
(3319, 0xca81be7e06010000008b1500),
(3319, 0xc881c27e06010000008d1500),
(3320, 0xcc81bc7e06010000008d1500),
(3321, 0xd481bc7e06010000008d1500),
(3321, 0xd181c17e06010000008b1500),
(3321, 0xd481c27e06010000008d1500),
(3322, 0xd081c27e06010000008d1500),
(3323, 0xe281ba7e07010000008b1500),
(3325, 0xe581ba7e07010000008b1500),
(3326, 0xe781bf7e07010000008b1500),
(3327, 0xe481c27e07010000008d1500),
(3327, 0xe781c57e07010000008b1500),
(3327, 0xe581c47e08010000006f1800),
(3327, 0xe681c57e0801000000711800),
(3327, 0xe781c47e08010000006f1800),
(3328, 0xe081be7e06010000008b1500),
(3328, 0xde81c27e06010000008d1500),
(3329, 0xe081ba7e06010000008b1500),
(3329, 0xe281bc7e06010000008d1500),
(3330, 0xea81bc7e06010000008d1500),
(3330, 0xe781c17e06010000008b1500),
(3331, 0xe681c27e06010000008d1500),
(3331, 0xe781c57e06010000008b1500),
(3332, 0xfa81c27e07010000008b1500),
(3332, 0xf381c57e07010000008b1500),
(3332, 0xf581c67e06010000008d1500),
(3332, 0xf581c47e07010000008d1500),
(3332, 0xf581c67e07010000008d1500),
(3332, 0xf681c57e07010000008b1500),
(3332, 0xfa81c57e07010000008b1500),
(3332, 0xfc81c67e06010000008d1500),
(3332, 0xf681c87e06010000008b1500),
(3332, 0xf681c97e07010000008b1500),
(3332, 0xfa81c97e07010000008b1500),
(3333, 0xd581d17e06010000008b1500),
(3333, 0xd581d17e07010000008b1500),
(3333, 0xdc81d37e06010000008d1500),
(3333, 0xd381d47e06010000008d1500),
(3333, 0xd381d77e06010000008d1500),
(3333, 0xd181d67e07010000008b1500),
(3333, 0xd381d47e07010000008d1500),
(3333, 0xd381d77e07010000008d1500),
(3333, 0xd381d77e0801000000711800),
(3333, 0xd581d67e07010000008b1500),
(3333, 0xd481d67e08010000006f1800),
(3333, 0xda81d67e07010000008b1500),
(3333, 0xdc81d57e07010000008d1500),
(3333, 0xd881d87e0601000000130700),
(3333, 0xd981d87e0601000000130700),
(3333, 0xda81da7e07010000008b1500),
(3333, 0xdc81d87e06010000008d1500),
(3334, 0xc281d17e06010000008b1500),
(3334, 0xc781d17e06010000008b1500),
(3334, 0xc581d37e07010000008d1500),
(3334, 0xc081d57e07010000008d1500),
(3334, 0xc281d47e07010000008b1500),
(3334, 0xc781d67e06010000001a0700),
(3334, 0xc781d77e06010000001a0700),
(3334, 0xc781d67e07010000008b1500),
(3334, 0xc981d47e06010000008d1500),
(3334, 0xc981d47e07010000008d1500),
(3334, 0xc981d77e07010000008d1500),
(3334, 0xcb81d67e07010000008b1500),
(3334, 0xc081d87e06010000008d1500),
(3334, 0xc281da7e06010000008b1500),
(3334, 0xc281da7e07010000008b1500),
(3334, 0xc581d87e07010000008d1500),
(3334, 0xc781da7e07010000008b1500),
(3334, 0xc981d87e06010000008d1500),
(3335, 0xb381b37e07010000008b1500),
(3336, 0xb781b17e07010000008d1500),
(3337, 0xbc81b37e07010000008d1500),
(3338, 0xb381b67e07010000008b1500),
(3339, 0xb581b87e07010000008d1500),
(3340, 0xb881b87e07010000008d1500),
(3341, 0xbc81b67e07010000008d1500),
(3342, 0xb581b17e06010000008d1500),
(3343, 0xb381b37e06010000008b1500),
(3344, 0xb381b77e06010000008b1500),
(3345, 0xb581b87e06010000008d1500),
(3346, 0xb981b87e06010000008d1500),
(3347, 0xba81b77e06010000008b1500),
(3348, 0xba81b27e06010000008b1500),
(3349, 0xb881b17e06010000008d1500),
(3350, 0xae819a7e07010000008d1500),
(3350, 0xb0819e7e07010000008b1500),
(3350, 0xae81a17e07010000008d1500),
(3351, 0xb281a17e07010000008d1500),
(3352, 0xb2819a7e07010000008d1500),
(3353, 0xba819c7e07010000008d1500),
(3354, 0xba819f7e07010000008d1500),
(3355, 0xae819a7e06010000008d1500),
(3355, 0xb0819c7e06010000008b1500),
(3356, 0xb681a17e06010000008d1500),
(3356, 0xb081a47e06010000008b1500),
(3357, 0xba819a7e06010000008d1500),
(3357, 0xb781a07e06010000008b1500),
(3357, 0xba81a17e06010000008d1500),
(3358, 0xb2819a7e06010000008d1500),
(3359, 0xe381907e07010000008d1500),
(3359, 0xe581937e07010000008b1500),
(3360, 0xe781997e07010000008b1500),
(3361, 0xea81997e07010000008b1500),
(3362, 0xec81937e07010000008b1500),
(3362, 0xee81907e07010000008d1500),
(3363, 0xe881907e07010000008d1500),
(3364, 0xe5818e7e06010000008b1500),
(3364, 0xe781907e06010000008d1500),
(3365, 0xe581927e06010000008b1500),
(3365, 0xe381967e06010000008d1500),
(3366, 0xeb81967e06010000008d1500),
(3366, 0xec81997e06010000008b1500),
(3367, 0xef81907e06010000008d1500),
(3367, 0xec81957e06010000008b1500),
(3368, 0xfb81937e06010000008b1500),
(3368, 0xf981947e07010000008d1500),
(3368, 0xfd81957e07010000008b1500),
(3369, 0xf981977e07010000008d1500),
(3369, 0xfb81987e06010000008b1500),
(3370, 0xd881a37e07010000008b1500),
(3370, 0xdc81a57e07010000008d1500),
(3371, 0xd881a97e07010000008b1500),
(3372, 0xd881af7e07010000008b1500),
(3372, 0xdc81ac7e07010000008d1500),
(3373, 0xe281aa7e07010000008d1500),
(3374, 0xe281a77e07010000008d1500),
(3375, 0xd681a57e06010000008d1500),
(3375, 0xd881a77e06010000008b1500),
(3375, 0xd681ac7e06010000008d1500),
(3376, 0xda81a57e06010000008d1500),
(3377, 0xde81ac7e06010000008d1500),
(3377, 0xdf81af7e06010000008b1500),
(3378, 0xdf81ab7e06010000008b1500),
(3378, 0xe281a57e06010000008d1500),
(3379, 0xeb81a77e07010000008d1500),
(3380, 0xf181a57e07010000008d1500),
(3381, 0xf781a57e07010000008d1500),
(3381, 0xf481a97e07010000008b1500),
(3381, 0xf781ac7e07010000008d1500),
(3382, 0xeb81aa7e07010000008d1500),
(3383, 0xf181ac7e07010000008d1500),
(3384, 0xeb81a57e06010000008d1500),
(3384, 0xed81a77e06010000008b1500),
(3384, 0xeb81ac7e06010000008d1500),
(3385, 0xef81a57e06010000008d1500),
(3386, 0xf781a57e06010000008d1500),
(3386, 0xf481ab7e06010000008b1500),
(3386, 0xf781ac7e06010000008d1500),
(3387, 0xf381ac7e06010000008d1500),
(3388, 0xff81a67e0701000000a41400),
(3388, 0x0882a27e0701000000a61400),
(3389, 0x0282af7e0701000000a41400),
(3389, 0x0582ac7e0701000000a41400),
(3390, 0xfc7d52800701000000461900),
(3390, 0xfa7d57800601000000471900),
(3390, 0xfa7d57800701000000471900),
(3390, 0xff7d55800601000000471900),
(3390, 0xff7d56800601000000a41400),
(3390, 0xff7d56800701000000a41400),
(3390, 0x037e56800701000000a61400),
(3390, 0x087e56800701000000a61400),
(3390, 0x0a7e55800701000000471900),
(3390, 0x067e5b800601000000a41400),
(3390, 0x087e58800601000000a61400),
(3390, 0x0a7e5a800601000000471900),
(3390, 0x097e59800701000000a61400),
(3390, 0x0a7e58800701000000471900),
(3390, 0x0a7e5b800701000000a41400),
(3390, 0x037e5d800601000000471900),
(3390, 0x037e5e800701000000a41400),
(3390, 0x087e5c800601000000a61400),
(3390, 0x0a7e5e800601000000471900),
(3390, 0x0a7e5c800701000000a41400),
(3390, 0x0a7e5e800701000000471900),
(3390, 0x007e63800601000000471900),
(3390, 0x027e60800601000000461900),
(3390, 0x007e63800701000000471900),
(3390, 0x027e60800701000000461900),
(3390, 0x077e60800701000000a61400),
(3390, 0x0a7e60800601000000471900),
(3390, 0x067e65800601000000461900),
(3391, 0x0f7e5f800701000000a61400),
(3391, 0x0f7e63800701000000481900),
(3392, 0x157e5e800701000000a61400),
(3392, 0x147e62800701000000461900),
(3392, 0x167e61800701000000471900),
(3394, 0x187e5f800701000000491900),
(3394, 0x1c7e5e800701000000461900),
(3394, 0x1d7e61800701000000a41400),
(3395, 0x217e5f800701000000471900),
(3395, 0x237e5e800701000000461900),
(3395, 0x217e61800701000000a41400),
(3396, 0x107e50800701000000461900),
(3396, 0x107e55800701000000a61400),
(3397, 0x157e53800701000000481900),
(3397, 0x167e53800701000000a61400),
(3397, 0x187e55800701000000a41400),
(3398, 0x187e5a800701000000a41400),
(3398, 0x187e5b800701000000471900),
(3398, 0x167e5c800701000000461900),
(3399, 0x1f7e59800701000000471900),
(3399, 0x217e56800701000000461900),
(3399, 0x217e5a800701000000461900),
(3399, 0x227e5a800701000000a61400),
(3401, 0x1e7e53800701000000461900),
(3401, 0x227e53800701000000461900),
(3401, 0x237e53800701000000a61400),
(3401, 0x247e53800701000000461900),
(3402, 0x1d7e4b800701000000471900),
(3402, 0x1f7e49800701000000461900),
(3402, 0x1d7e4d800701000000a41400),
(3402, 0x1f7e4f800701000000461900),
(3402, 0x207e4d800701000000a41400),
(3402, 0x237e4e800701000000471900),
(3403, 0x137e4b800701000000491900),
(3403, 0x177e4b800701000000a41400),
(3403, 0x167e4d800701000000481900),
(3404, 0x037e49800701000000461900),
(3404, 0x067e4b800701000000471900),
(3404, 0x037e4d800701000000461900),
(3404, 0x047e4d800701000000a61400),
(3405, 0xfe7d44800701000000471900),
(3405, 0x007e46800701000000461900),
(3405, 0x017e46800701000000a61400),
(3406, 0x047e43800701000000491900),
(3406, 0x077e41800701000000a61400),
(3406, 0x087e41800701000000481900),
(3406, 0x077e45800701000000a61400),
(3406, 0x097e45800701000000481900),
(3406, 0x0b7e44800701000000491900),
(3407, 0x0d7e43800701000000491900),
(3407, 0x117e43800701000000a41400),
(3407, 0x107e45800701000000481900),
(3408, 0x187e3e800701000000461900),
(3408, 0x157e42800701000000471900),
(3408, 0x1a7e42800701000000a41400),
(3408, 0x1a7e43800701000000471900),
(3408, 0x197e45800701000000461900),
(3409, 0x0d7e3e800701000000471900),
(3409, 0x107e3b800701000000461900),
(3409, 0x117e3e800701000000a41400),
(3409, 0x117e3f800701000000491900),
(3409, 0x107e40800701000000461900),
(3410, 0x0a7e3b800701000000481900),
(3410, 0x087e3e800701000000a41400),
(3410, 0x087e3f800701000000491900),
(3411, 0x037e39800701000000481900),
(3411, 0x047e3d800701000000a41400),
(3411, 0x047e3f800701000000471900),
(3412, 0x007e36800701000000471900),
(3412, 0x037e34800701000000461900),
(3412, 0x077e36800701000000471900),
(3412, 0x077e37800701000000a41400),
(3412, 0x067e38800701000000461900),
(3413, 0x0b7e37800701000000a41400),
(3413, 0x0d7e34800701000000461900),
(3413, 0x0f7e36800701000000471900),
(3413, 0x0f7e37800701000000a41400),
(3414, 0xfe7d23800701000000421900),
(3414, 0xfc7d26800701000000431900),
(3414, 0xfc7d2b800701000000431900),
(3414, 0xfe7d2e800701000000421900),
(3414, 0x007e29800701000000ff1300),
(3414, 0x007e2e800701000000ff1300),
(3415, 0x067e23800701000000421900),
(3415, 0x097e26800701000000431900),
(3415, 0x077e29800701000000ff1300),
(3415, 0x067e2e800701000000ff1300),
(3415, 0x087e2e800701000000421900),
(3415, 0x097e2c800701000000431900),
(3416, 0x0c7e28800701000000431900),
(3416, 0x0d7e2c800701000000441900),
(3416, 0x0f7e2c800701000000ff1300),
(3416, 0x117e27800701000000431900),
(3416, 0x117e2a800701000000431900),
(3417, 0x107e1f800701000000421900),
(3417, 0x137e1f800701000000ff1300),
(3417, 0x0c7e21800701000000431900),
(3417, 0x167e21800701000000431900),
(3417, 0x137e24800701000000421900),
(3417, 0x157e24800701000000421900),
(3418, 0x197e21800701000000431900),
(3418, 0x1e7e21800701000000081400),
(3418, 0x1e7e22800701000000431900),
(3419, 0x197e25800701000000451900),
(3419, 0x1e7e25800701000000081400),
(3420, 0x1e7e29800701000000431900),
(3420, 0x1e7e2a800701000000081400),
(3420, 0x1c7e2c800701000000421900),
(3421, 0x147e2a800701000000431900),
(3421, 0x177e2c800701000000ff1300),
(3421, 0x187e2c800701000000421900),
(3422, 0x117e18800701000000081400),
(3423, 0x117e13800701000000081400),
(3424, 0x117e0f800701000000081400),
(3425, 0x157e0f800701000000081400),
(3426, 0x157e12800701000000081400),
(3427, 0x157e17800701000000081400),
(3428, 0x0f7e0b800601000000241900),
(3428, 0x0c7e0e800601000000251900),
(3428, 0x117e0f800601000000c30400),
(3429, 0x0c7e13800601000000251900),
(3429, 0x117e13800601000000c30400),
(3430, 0x0c7e18800601000000251900),
(3430, 0x0f7e1a800601000000241900),
(3430, 0x117e18800601000000c30400),
(3431, 0x187e0b800601000000241900),
(3431, 0x157e0f800601000000c30400),
(3431, 0x1a7e0e800601000000251900),
(3432, 0x157e12800601000000c30400),
(3432, 0x1a7e13800601000000251900),
(3433, 0x157e17800601000000c30400),
(3433, 0x187e1a800601000000241900),
(3433, 0x1a7e18800601000000251900),
(3434, 0x2e7e0e8007010000008b1500),
(3434, 0x327e118006010000008d1500),
(3434, 0x327e138007010000008d1500),
(3434, 0x327e158006010000008d1500),
(3435, 0x267e0e8006010000008b1500),
(3435, 0x257e0e8007010000008b1500),
(3435, 0x297e0e8007010000008b1500),
(3436, 0x1e7e17800601000000251900),
(3436, 0x1e7e19800601000000251900),
(3436, 0x217e14800601000000241900),
(3436, 0x247e14800601000000241900),
(3436, 0x267e16800601000000251900),
(3436, 0x217e1b800601000000241900),
(3436, 0x237e188007010000008b1500),
(3436, 0x247e1b800601000000241900),
(3436, 0x267e18800601000000c30400),
(3436, 0x267e1a800601000000251900),
(3436, 0x297e188007010000008b1500),
(3437, 0x357e1f800601000000081400),
(3437, 0x357e1f8007010000008b1500),
(3437, 0x317e238007010000008b1500),
(3437, 0x357e23800601000000081400),
(3437, 0x357e248007010000008d1500),
(3438, 0x427e1f8007010000008b1500),
(3438, 0x427e238006010000008b1500),
(3438, 0x457e208006010000008d1500),
(3438, 0x427e248007010000008b1500),
(3438, 0x467e258007010000008d1500),
(3439, 0x507e228006010000008d1500),
(3439, 0x527e218007010000008d1500),
(3439, 0x507e258007010000008d1500),
(3440, 0x597e1a8006010000008b1500),
(3440, 0x5c7e1a8006010000008b1500),
(3440, 0x5d7e1b8007010000008d1500),
(3440, 0x5b7e1c8006010000008d1500),
(3440, 0x5b7e1e8007010000008d1500),
(3441, 0x2e7e2b800701000000081400),
(3442, 0x3c7e2b800701000000081400),
(3442, 0x427e2c800701000000081400),
(3443, 0x327e33800701000000ff1300),
(3443, 0x327e39800701000000ff1300),
(3444, 0x497e31800601000000241900),
(3444, 0x467e34800601000000251900),
(3444, 0x497e36800601000000241900),
(3444, 0x4b7e35800601000000c30400),
(3444, 0x497e36800701000000680600),
(3444, 0x4b7e35800701000000081400),
(3444, 0x4e7e36800601000000c50400),
(3444, 0x4f7e34800601000000251900),
(3444, 0x4f7e34800701000000081400),
(3444, 0x4a7e39800701000000ff1300),
(3444, 0x517e36800701000000a61400),
(3445, 0x567e33800701000000081400),
(3445, 0x5d7e31800601000000241900),
(3445, 0x597e35800601000000c30400),
(3445, 0x597e36800601000000251900),
(3445, 0x5a7e36800701000000680600),
(3445, 0x5c7e34800701000000081400),
(3445, 0x587e39800701000000ff1300),
(3445, 0x5c7e39800601000000241900),
(3445, 0x5e7e39800601000000241900),
(3445, 0x5c7e38800701000000081400),
(3446, 0x5a7e4b8007010000008b1500),
(3447, 0x6c7e338007010000008d1500),
(3447, 0x6b7e368006010000008d1500),
(3447, 0x6c7e398006010000008b1500),
(3448, 0x107ef97f0501000000ff1300),
(3448, 0x107ef97f0701000000ff1300),
(3448, 0x167ef97f0501000000ff1300),
(3448, 0x177ef87f0601000000ff1300),
(3448, 0x167ef97f0701000000ff1300),
(3448, 0x1a7ef97f0501000000ff1300),
(3448, 0x197efb7f0801000000ff1300),
(3448, 0x137eff7f0801000000081400),
(3448, 0x157efc7f0701000000ff1300),
(3448, 0x157e06800701000000ff1300),
(3449, 0x2c7efe7f06010000008b1500),
(3449, 0x2c7efe7f07010000008d1500),
(3449, 0x287e008006010000008d1500),
(3449, 0x2a7e018007010000008b1500),
(3449, 0x2c7e038007010000008d1500),
(3449, 0x2d7e018007010000008b1500),
(3449, 0x307e008006010000008d1500),
(3450, 0x467e2a800601000000251900),
(3450, 0x497e28800601000000241900),
(3450, 0x4b7e2b800601000000c30400),
(3450, 0x4e7e2b800601000000c30400),
(3450, 0x467e2e800601000000251900),
(3450, 0x467e2c800701000000081400),
(3450, 0x497e2f800601000000261900),
(3450, 0x4b7e2d800701000000081400),
(3450, 0x4d7e2c800601000000c50400),
(3450, 0x4d7e2f800601000000241900),
(3450, 0x527e2b800601000000251900),
(3450, 0x527e2d800601000000251900),
(3452, 0x797e427f07010000003d1900),
(3452, 0x7f7e477f0701000000d20d00),
(3452, 0x807e477f07010000003a1900),
(3453, 0x237e3d800601000000241900),
(3453, 0x1f7e40800601000000251900),
(3453, 0x1f7e44800601000000251900),
(3453, 0x267e45800601000000c30400),
(3454, 0x287e3d800601000000261900),
(3454, 0x2d7e3d800601000000241900),
(3454, 0x297e43800601000000c50400),
(3455, 0x317e3d800601000000241900),
(3455, 0x2c7e47800601000000c30400),
(3455, 0x317e43800601000000c50400),
(3455, 0x347e40800601000000251900),
(3455, 0x347e44800601000000271900),
(3455, 0x337e49800601000000c50400),
(3455, 0x347e48800601000000251900),
(3455, 0x327e4e800601000000241900),
(3455, 0x347e4c800601000000251900),
(3456, 0x277e4b800601000000251900),
(3456, 0x297e49800601000000c50400),
(3456, 0x277e4c800601000000251900),
(3456, 0x2a7e4e800601000000241900),
(3456, 0x2e7e4e800601000000241900),
(3457, 0x227e3d800501000000241900),
(3457, 0x257e3d800501000000241900),
(3457, 0x2b7e3d800501000000241900),
(3457, 0x327e3d800501000000241900),
(3457, 0x1f7e41800501000000251900),
(3457, 0x1f7e43800501000000251900),
(3457, 0x277e40800501000000c30400),
(3457, 0x2d7e42800501000000c50400),
(3457, 0x2f7e40800501000000c30400),
(3457, 0x227e46800501000000241900),
(3457, 0x257e46800501000000241900),
(3458, 0x307e46800501000000c30400),
(3458, 0x347e45800501000000251900),
(3458, 0x327e4b800501000000c50400),
(3458, 0x347e48800501000000251900),
(3458, 0x347e49800501000000251900),
(3458, 0x347e4d800501000000251900),
(3459, 0x2a7e47800501000000c50400),
(3459, 0x277e4b800501000000251900),
(3459, 0x2a7e4e800501000000261900),
(3460, 0x2e7e47800501000000c50400),
(3460, 0x2f7e4e800501000000241900),
(3461, 0x267e2a7f0601000000204700),
(3462, 0x887ec27f0501000000241900),
(3462, 0x887ec27f0601000000ff1300),
(3462, 0x867ec47f0501000000c30400),
(3462, 0x877ec67f0501000000c50400),
(3462, 0x867ec47f0601000000081400),
(3462, 0x857ec57f0701000000711800),
(3462, 0x847ec47f08010000006f1800),
(3462, 0x8a7ec67f0501000000c50400),
(3462, 0x8b7ec47f0501000000c30400),
(3462, 0x8b7ec77f0501000000251900),
(3462, 0x8a7ec67f0601000000ff1300),
(3462, 0x8c7ec47f07010000006f1800),
(3462, 0x837ec87f0501000000251900),
(3462, 0x8b7eca7f0501000000251900),
(3463, 0xe081bf7e07010000008b1500),
(3463, 0xde81c27e07010000008d1500),
(3464, 0xb4812d7c0801000000711800),
(3465, 0xb481307c0801000000711800),
(3466, 0xb881307c0801000000711800),
(3467, 0xbc812d7c0801000000711800),
(3468, 0xbc81307c0801000000711800),
(3469, 0xc0812d7c0801000000711800),
(3470, 0xc081307c0801000000711800),
(3471, 0xc4812d7c0801000000711800),
(3472, 0xc481307c0801000000711800),
(3473, 0x1982d77c0701000000251900),
(3473, 0x1582da7c0701000000241900),
(3473, 0x1682da7c0701000000c50400),
(3473, 0x1782da7c0701000000241900),
(3473, 0x1982d87c0701000000251900),
(3474, 0x1e82d87c0701000000241900),
(3474, 0x1f82dc7c0701000000c50400),
(3475, 0x2282d87c0701000000241900),
(3475, 0x2382dc7c0701000000c50400),
(3476, 0x2882d87c0701000000241900),
(3476, 0x2882dc7c0701000000c50400),
(3477, 0x1f82df7c0701000000c50400),
(3477, 0x1e82e37c0701000000241900),
(3478, 0x2382df7c0701000000c50400),
(3478, 0x2282e37c0701000000241900),
(3479, 0x2882df7c0701000000c50400),
(3479, 0x2782e37c0701000000241900),
(3480, 0x1e82d87c0601000000241900),
(3480, 0x2282d87c0601000000241900),
(3480, 0x2382dc7c0601000000c50400),
(3482, 0x2782d87c0601000000241900),
(3482, 0x2682dc7c0601000000c50400),
(3483, 0x2382df7c0601000000c50400),
(3483, 0x1e82e37c0601000000241900),
(3483, 0x2282e37c0601000000241900),
(3485, 0x2682df7c0601000000c50400),
(3485, 0x2782e37c0601000000241900),
(3486, 0x0c82de7c0601000000c30400),
(3486, 0x0e82df7c0601000000c50400),
(3486, 0x1082de7c0601000000271900),
(3486, 0x0882e07c0601000000271900),
(3486, 0x0a82e37c0601000000241900),
(3486, 0x0e82e37c0601000000261900),
(3486, 0x0c82e37c0701000000241900),
(3486, 0x1082e27c0601000000271900),
(3486, 0x1082e07c0701000000c30400),
(3487, 0x0b82e57c0701000000241900),
(3487, 0x0882ea7c0701000000251900),
(3487, 0x0a82ed7c0701000000241900),
(3487, 0x0c82ed7c0701000000c50400),
(3488, 0x1c82e67c0701000000241900),
(3488, 0x1982ea7c0701000000c30400),
(3488, 0x1d82ee7c0701000000241900),
(3488, 0x2082ea7c0701000000251900),
(3488, 0x2082eb7c0701000000251900),
(3489, 0x0382f27c0601000000241900),
(3489, 0x0382f27c0701000000241900),
(3489, 0x0082f57c0701000000251900),
(3489, 0x0682f67c0601000000251900),
(3489, 0x0682f47c0701000000c30400),
(3489, 0x0682f67c0701000000251900),
(3490, 0x0682fa7c0701000000c30400),
(3490, 0x0082fc7c0701000000251900),
(3490, 0x0682fc7c0601000000251900),
(3490, 0x0682fc7c0701000000251900),
(3491, 0x0082037d0601000000c30400),
(3491, 0x0082017d0701000000251900),
(3491, 0x0682027d0601000000251900),
(3491, 0x0682007d0701000000c30400),
(3491, 0x0682027d0701000000251900),
(3491, 0x0382047d0601000000241900),
(3491, 0x0382047d0701000000241900),
(3492, 0xf781ea7c0701000000c30400),
(3492, 0xfa81e87c0601000000241900),
(3492, 0xfa81e87c0701000000241900),
(3492, 0xfd81eb7c0601000000251900),
(3492, 0xfa81ef7c0601000000241900),
(3492, 0xfb81ef7c0601000000241900),
(3492, 0xfa81ef7c0701000000241900),
(3492, 0xfd81ee7c0601000000251900),
(3492, 0xfd81ec7c0701000000c30400),
(3492, 0xfd81ee7c0701000000251900),
(3493, 0x0b82fa7c06010000001a0700),
(3493, 0x0b82fb7c06010000001a0700),
(3493, 0x0c82f87c04010000002c1900),
(3493, 0x0e82f87c0501000000711800),
(3493, 0x0d82f87c0601000000711800),
(3493, 0x0c82f87c0701000000711800),
(3493, 0x0f82fe7c05010000006f1800),
(3493, 0x1182f37c0701000000711800),
(3493, 0x1382f67c07010000006f1800),
(3493, 0x1582f57c05010000006f1800),
(3493, 0x1382fa7c06010000006f1800),
(3493, 0x1182f87c0701000000711800),
(3493, 0x1682f87c04010000002c1900),
(3493, 0x1582f87c0501000000711800),
(3493, 0x1582f87c0601000000711800),
(3493, 0x1782fa7c06010000006f1800),
(3493, 0x1582f87c0701000000711800),
(3493, 0x1482fa7c08010000006f1800),
(3493, 0x1382fe7c05010000006f1800),
(3493, 0x1382ff7c06010000006f1800),
(3493, 0x0c82017d04010000002c1900),
(3493, 0x0d82017d06010000002c1900),
(3493, 0x0e82017d07010000002c1900),
(3493, 0x1582017d05010000002c1900),
(3493, 0x1682017d06010000002c1900),
(3493, 0x1582017d07010000002c1900),
(3494, 0x01820a7d0701000000241900),
(3494, 0x01820f7d0701000000c50400),
(3494, 0x05820c7d0701000000c30400),
(3494, 0x0182157d0701000000241900),
(3495, 0x08820e7d0701000000c50400),
(3495, 0x0a82117d0701000000251900),
(3495, 0x0a82137d0701000000251900),
(3495, 0x0882157d0701000000241900),
(3496, 0xfe810d7d0601000000251900),
(3496, 0x02820a7d0601000000241900),
(3496, 0x01820f7d0601000000c50400),
(3496, 0x05820c7d0601000000c30400),
(3496, 0x0182157d0601000000241900),
(3496, 0x0282157d0601000000241900),
(3497, 0x08820e7d0601000000c50400),
(3497, 0x0a82117d0601000000251900),
(3497, 0x0a82137d0601000000251900),
(3497, 0x0882157d0601000000241900),
(3498, 0x0e82067d0701000000c50400),
(3498, 0x0e820c7d0601000000241900),
(3498, 0x0e820c7d0701000000c50400),
(3498, 0x12820a7d0601000000251900),
(3498, 0x12820a7d0701000000251900),
(3498, 0x10820c7d0601000000241900),
(3498, 0x10820c7d0701000000241900),
(3499, 0x1982067d0701000000c50400),
(3499, 0x1d82097d0701000000251900),
(3499, 0x1d820b7d0701000000251900),
(3499, 0x18820d7d0701000000241900),
(3499, 0x1c820d7d0701000000241900),
(3500, 0xa581667c0501000000711800),
(3500, 0xa5816a7c05010000002c1900),
(3500, 0xa781697c05010000002d1900),
(3501, 0xe8815c7c0801000000130700),
(3501, 0xe9815c7c0801000000130700),
(3501, 0xe781607c0801000000660600),
(3502, 0x01825b7c0801000000f61300),
(3502, 0x0282597c0801000000ed1300),
(3503, 0xfb814f7c04010000008d1500),
(3503, 0xfb814f7c05010000008d1500),
(3503, 0xfb814f7c0801000000ed1300),
(3503, 0xfd814f7c04010000008d1500),
(3503, 0xfd814f7c05010000008d1500),
(3503, 0xfc814c7c0601000000130700),
(3503, 0xfd814c7c0601000000130700),
(3503, 0xfd814f7c0801000000ed1300),
(3503, 0xf881517c06010000008b1500),
(3504, 0x0282597c07010000008d1500),
(3505, 0x0282597c05010000008d1500),
(3506, 0x0282597c04010000008d1500),
(3507, 0x0282597c03010000008d1500),
(3508, 0x338161800701000000d50400),
(3509, 0x33815c800701000000d50400),
(3510, 0x338157800701000000d50400),
(3510, 0x378157800701000000d50400),
(3510, 0x358159800701000000d70400),
(3511, 0x37815c800701000000d50400),
(3512, 0x378161800701000000d50400),
(3513, 0x2f815a800601000000d50400),
(3514, 0x2f815f800601000000d50400),
(3515, 0x3a815f800601000000d50400),
(3516, 0x3a815a800601000000d50400),
(3517, 0x4a8159800701000000d50400),
(3518, 0x60815d800701000000d50400),
(3519, 0x2f814b800701000000d50400),
(3520, 0x2f813e800701000000d50400),
(3521, 0x3c8147800701000000d70400),
(3523, 0x3c814a800701000000d70400),
(3524, 0x3d8149800701000000d50400),
(3525, 0x318133800701000000d70400),
(3526, 0x3f8134800601000000d70400),
(3526, 0x3f8136800701000000d70400),
(3526, 0x428134800601000000d70400),
(3526, 0x418134800701000000d50400),
(3526, 0x418137800701000000d50400),
(3526, 0x418138800501000000381900),
(3526, 0x40813a800701000000d70400),
(3527, 0x538137800701000000d50400),
(3527, 0x558136800701000000d70400),
(3527, 0x568137800701000000d50400),
(3527, 0x558139800701000000d70400),
(3528, 0x55812c800701000000d70400);
INSERT INTO `tile_store` (`house_id`, `data`) VALUES
(3528, 0x56812e800701000000d50400),
(3528, 0x518130800701000000d70400),
(3528, 0x558130800701000000d70400),
(3529, 0x528132800601000000d70400),
(3529, 0x568132800601000000d70400),
(3529, 0x598135800601000000d50400),
(3530, 0x558135800501000000d70400),
(3531, 0x40811f800701000000d50400),
(3531, 0x46811f800701000000d50400),
(3532, 0x3f8125800701000000d50400),
(3532, 0x418127800701000000d70400),
(3532, 0x428125800701000000d50400),
(3533, 0x40811e800601000000d70400),
(3533, 0x408122800601000000d70400),
(3534, 0x4e811a800701000000d50400),
(3535, 0x5a811a800701000000d50400),
(3536, 0x518123800701000000d70400),
(3537, 0x578123800701000000d70400),
(3538, 0x52811c800601000000d70400),
(3538, 0x55811c800601000000d70400),
(3538, 0x548121800601000000d70400),
(3539, 0x56811d800501000000d50400),
(3540, 0x5b810d800701000000d50400),
(3541, 0x708109800701000000d50400),
(3542, 0x7a8109800701000000d70400),
(3543, 0x878109800701000000d70400),
(3544, 0x98810a800701000000d50400),
(3545, 0x8d8117800701000000d50400),
(3546, 0x978117800701000000d50400),
(3547, 0x92811e800701000000d70400),
(3548, 0x928116800601000000d70400),
(3549, 0x9e8113800701000000d50400),
(3550, 0xa88113800701000000d50400),
(3551, 0xa1811a800701000000d70400),
(3552, 0xa6811a800701000000d70400),
(3553, 0xa38112800601000000d70400),
(3554, 0xb18116800701000000d50400),
(3555, 0xbb8116800701000000d50400),
(3556, 0xb4811b800701000000d50400),
(3556, 0xb7811d800701000000d70400),
(3557, 0xb98119800601000000d50400),
(3558, 0xc48120800701000000d50400),
(3559, 0xc8812c800701000000d70400),
(3559, 0xc78130800701000000d70400),
(3560, 0xca812d800601000000d50400),
(3561, 0xd28133800701000000d50400),
(3561, 0xd48134800701000000d70400),
(3561, 0xd78134800701000000d70400),
(3562, 0xd88134800601000000d50400),
(3564, 0xce8140800701000000d50400),
(3564, 0xd68140800701000000d50400),
(3565, 0xd28144800701000000d50400),
(3565, 0xd48146800701000000d70400),
(3566, 0xd28140800601000000d70400),
(3567, 0xbe813b800701000000d70400),
(3567, 0xbe813f800601000000d70400),
(3567, 0xc4813b800701000000d70400),
(3567, 0xc3813f800601000000d70400),
(3567, 0xc18143800601000000d70400),
(3568, 0xba8151800701000000d50400),
(3569, 0xc4814e800701000000d70400),
(3570, 0xbd815b800701000000d70400),
(3571, 0xc4815b800701000000d70400),
(3572, 0xc28157800601000000d50400),
(3572, 0xc18159800601000000d70400),
(3573, 0xc08152800601000000d50400),
(3573, 0xc58153800601000000d50400),
(3574, 0xbe8155800501000000d50400),
(3575, 0xa68163800701000000d50400),
(3576, 0xa6816b800701000000d50400),
(3576, 0xaf8169800701000000d50400),
(3576, 0xaf816c800701000000d50400),
(3577, 0xb18160800701000000d70400),
(3578, 0xab8162800601000000d70400),
(3579, 0xb28165800601000000d50400),
(3581, 0xab816c800601000000d70400),
(3581, 0xb0816c800601000000d70400),
(3582, 0xaa8167800501000000d50400),
(3583, 0x948152800701000000d70400),
(3583, 0x948156800701000000d70400),
(3584, 0x90815d800701000000d50400),
(3585, 0x9a815d800701000000d50400),
(3585, 0x9c8160800701000000d70400),
(3586, 0x9b8152800701000000d70400),
(3586, 0x998156800701000000d70400),
(3586, 0x9c8156800701000000d70400),
(3587, 0x928157800601000000d50400),
(3587, 0x9c8157800601000000d50400),
(3587, 0x95815e800601000000d70400),
(3587, 0x9c815c800601000000d50400),
(3591, 0x978156800501000000d70400),
(3592, 0x968143800701000000d70400),
(3592, 0x948146800701000000d50400),
(3592, 0x978146800701000000d50400),
(3592, 0x988145800501000000d50400),
(3592, 0x96814a800701000000d70400),
(3593, 0xa78139800701000000d50400),
(3593, 0xa4813e800701000000d50400),
(3594, 0xa88145800701000000d70400),
(3595, 0xae813d800701000000d70400),
(3595, 0xaf8145800701000000d70400),
(3596, 0xa8813e800601000000d70400),
(3596, 0xac813e800601000000d70400),
(3596, 0xab8143800601000000d70400),
(3597, 0xae813f800501000000d50400),
(3598, 0x338130800601000000d50400),
(3599, 0x3882ec7f06010000008b1500),
(3599, 0x3d82ec7f05010000008d1500),
(3599, 0x3182f17f05010000008b1500),
(3599, 0x3882f67f05010000008d1500),
(3599, 0x3882f57f06010000008b1500),
(3599, 0x3782fa7f06010000008d1500),
(3600, 0x358160800501000000d70400),
(3601, 0x418124800501000000d70400),
(3602, 0x6a8119800501000000d50400),
(3603, 0x64811a800601000000d50400),
(3603, 0x668118800601000000d70400),
(3603, 0x6a8118800601000000d70400),
(3604, 0x628116800701000000d50400),
(3605, 0x6b8113800701000000d70400),
(3606, 0x66811e800701000000d70400),
(3607, 0x6b811e800701000000d70400),
(3608, 0x7a811e800701000000d70400),
(3609, 0x81811e800701000000d70400),
(3610, 0x768113800701000000d50400),
(3611, 0x848114800701000000d50400),
(3612, 0x7e8112800601000000d70400),
(3612, 0x7b8115800601000000d50400),
(3613, 0x78811a800601000000d50400),
(3613, 0x7e8119800601000000d50400),
(3614, 0x808118800501000000d50400),
(3615, 0x528148800501000000d50400),
(3616, 0x4e8145800601000000d50400),
(3617, 0x4e814b800601000000d50400),
(3618, 0x51814b800601000000d50400),
(3619, 0x518145800601000000d50400),
(3620, 0x4f8144800701000000d50400),
(3620, 0x518147800701000000d70400),
(3620, 0x528144800701000000d50400),
(3621, 0x4f8149800701000000d50400),
(3622, 0x528149800701000000d50400),
(3622, 0x52814b800701000000d50400),
(3623, 0x67812b800701000000660600),
(3624, 0x678133800701000000660600),
(3625, 0x6d8133800701000000660600),
(3626, 0x6d812b800701000000660600),
(3627, 0xa4812b800501000000d70400),
(3628, 0xa0812b800601000000d50400),
(3628, 0xa28128800601000000d70400),
(3629, 0xa68128800601000000d70400),
(3629, 0xa8812b800601000000d50400),
(3630, 0x9e8126800701000000d50400),
(3631, 0xaa8126800701000000d50400),
(3632, 0xa3812a800701000000d50400),
(3632, 0xa3812d800701000000d50400),
(3632, 0xa5812f800701000000d70400),
(3632, 0xa6812d800701000000d50400),
(3633, 0xb6812d800701000000d50400),
(3633, 0xb8812f800701000000d70400),
(3633, 0xb9812d800701000000d50400),
(3634, 0x91840c7b0701000000548b00),
(3635, 0x99840c7b0601000000568b00),
(3635, 0x9a840c7b0701000000568b00),
(3635, 0x9e840d7b0701000000ea8d00),
(3636, 0x5e84407b0701000000ea8d00),
(3637, 0x6884397b0701000000e98d00),
(3638, 0x7584307b0701000000e98d00),
(3638, 0x7084347b0401000000ea8d00),
(3638, 0x7084347b0701000000ea8d00),
(3638, 0x7284357b0801000000c50400),
(3638, 0x7584347b0301000000ea8d00),
(3638, 0x7584347b0501000000ea8d00),
(3638, 0x7584347b0601000000ea8d00),
(3638, 0x7384397b0801000000c30400),
(3639, 0x4a841b7b0701000000e98d00),
(3640, 0x5884257b0701000000568b00),
(3640, 0x5c84247b0601000000e98d00),
(3640, 0x5f84257b0701000000568b00),
(3640, 0x5b84287b0501000000548b00),
(3641, 0xbf823c7a0901000000554300),
(3641, 0xbf823d7a0a01000000554300),
(3641, 0xc5823c7a0901000000554300),
(3641, 0xc4823d7a0a01000000554300),
(3641, 0xbf82417a0901000000554300),
(3641, 0xbe82467a0901000000534300),
(3641, 0xc582417a0901000000554300),
(3641, 0xc082447a0a01000000554300),
(3641, 0xc382447a0a01000000554300),
(3641, 0xc782467a0901000000534300),
(3641, 0xc1824d7a0901000000534300),
(3641, 0xc4824d7a0901000000534300),
(3642, 0x3783a47c05010000002a5900),
(3642, 0x3783a57c06010000002a5900),
(3642, 0x3a83a57c0401000000215900),
(3642, 0x3d83a57c0601000000285900),
(3642, 0x3783a97c04010000002a5900),
(3642, 0x3783a97c05010000002a5900),
(3642, 0x3783a87c06010000002a5900),
(3642, 0x3983aa7c0601000000215900),
(3643, 0x4483a57c0501000000215900),
(3643, 0x4483aa7c0601000000215900),
(3644, 0x4f83a57c04010000002a5900),
(3644, 0x4f83a57c05010000002a5900),
(3644, 0x4f83a87c0601000000215900),
(3645, 0x5883a47c0501000000215900),
(3645, 0x5983a77c0601000000215900),
(3646, 0x6883a37c05010000002a5900),
(3646, 0x6583a67c0601000000215900),
(3647, 0x6583b07c0601000000215900),
(3648, 0x6f83ae7c05010000002a5900),
(3648, 0x7183aa7c05010000002a5900),
(3648, 0x7783ab7c06010000002a5900),
(3648, 0x7183ad7c06010000002a5900),
(3649, 0x7a83b27c0601000000215900),
(3649, 0x7983b67c0501000000215900),
(3649, 0x7783ba7c06010000002a5900),
(3649, 0x7a83ba7c05010000002a5900),
(3649, 0x7d83ba7c05010000002a5900),
(3650, 0x6b83b57c05010000002a5900),
(3650, 0x6a83b87c0501000000215900),
(3650, 0x6e83b87c0501000000215900),
(3650, 0x6c83ba7c06010000002a5900),
(3650, 0x6e83bc7c0601000000215900),
(3650, 0x7183b87c06010000002a5900),
(3651, 0x5e83b87c0501000000215900),
(3651, 0x6083bb7c0501000000215900),
(3651, 0x6483b87c06010000002a5900),
(3651, 0x6083c17c0501000000215900),
(3652, 0x4e83b87c0401000000215900),
(3652, 0x4c83b97c0501000000215900),
(3652, 0x4e83be7c0401000000215900),
(3652, 0x4e83be7c0601000000215900),
(3653, 0x5383b97c0501000000215900),
(3653, 0x5583b87c0401000000215900),
(3653, 0x5583be7c0401000000225900),
(3653, 0x5583be7c0601000000215900),
(3654, 0x3a83b37c0601000000215900),
(3654, 0x3d83b07c04010000002a5900),
(3654, 0x3e83b27c0501000000215900),
(3654, 0x3983b67c0401000000215900),
(3654, 0x3a83b67c0601000000215900),
(3654, 0x3e83b67c0401000000215900),
(3654, 0x3c83b67c05010000002a5900),
(3654, 0x3f83b47c05010000002a5900),
(3654, 0x3c83ba7c05010000002a5900),
(3654, 0x3f83ba7c05010000002a5900),
(3654, 0x3d83ba7c06010000002a5900),
(3654, 0x3f83bc7c0601000000215900),
(3654, 0x4083b07c04010000002a5900),
(3654, 0x4183b37c0601000000215900),
(3654, 0x4483b37c0401000000215900),
(3654, 0x4483b67c0601000000215900),
(3654, 0x4083b97c06010000002a5900),
(3655, 0x3383b67c06010000002a5900),
(3655, 0x3183b97c0601000000215900),
(3656, 0x4b83ae7c0501000000215900),
(3656, 0x4e83ad7c05010000002a5900),
(3656, 0x4f83ad7c06010000002a5900),
(3656, 0x4e83b17c0601000000215900),
(3657, 0x5b83ad7c06010000002a5900),
(3657, 0x5e83b07c0601000000215900),
(3658, 0x74839f7c0401000000215900),
(3658, 0x7383a57c0601000000215900),
(3659, 0x7e839f7c04010000002a5900),
(3659, 0x7e83a57c0401000000215900),
(3659, 0x7e83a57c0501000000215900),
(3659, 0x7e83ac7c0501000000215900),
(3659, 0x7e83ac7c0601000000215900),
(3659, 0x8183a17c05010000002a5900),
(3659, 0x8383a07c0501000000215900),
(3659, 0x8483a07c04010000002a5900),
(3659, 0x8583a27c0501000000215900),
(3659, 0x8783a07c0501000000215900),
(3659, 0x8483a57c0501000000215900),
(3660, 0x697ef27e07010000004f9600),
(3660, 0x667ef77e0701000000929800),
(3660, 0x6b7ef67e0601000000909800),
(3660, 0x6c7ef57e0701000000929800),
(3660, 0x697ef97e07010000004d9600),
(3661, 0x8d7fb87b0801000000361800),
(3662, 0x917fb87b0801000000361800),
(3663, 0x8d7fb07b0901000000361800),
(3663, 0x8d7fb07b0a01000000361800),
(3664, 0x917fb07b0901000000361800),
(3664, 0x917fb07b0a01000000361800),
(3665, 0x8d7fb87b0901000000361800),
(3665, 0x8d7fb87b0a01000000361800),
(3666, 0x917fb87b0901000000361800),
(3666, 0x917fb87b0a01000000361800),
(3667, 0xce7e777b0701000000251900),
(3667, 0xd27e757b0601000000241900),
(3667, 0xd67e757b0601000000241900),
(3667, 0xd57e757b0701000000241900),
(3667, 0xd27e787b0701000000c30400),
(3667, 0xd27e7b7b0801000000c30400),
(3667, 0xd47e7b7b0601000000c30400),
(3667, 0xd67e797b0601000000c50400),
(3667, 0xd77e787b0601000000251900),
(3667, 0xd77e7b7b0601000000251900),
(3667, 0xd47e7a7b0701000000c50400),
(3667, 0xd57e7a7b0701000000130700),
(3667, 0xd77e787b0701000000251900),
(3667, 0xd47e797b0801000000c50400),
(3667, 0xd77e7b7b0801000000c30400),
(3667, 0xd97e797b0801000000c50400),
(3667, 0xd27e7d7b0601000000241900),
(3667, 0xd07e7d7b0701000000241900),
(3667, 0xd27e7c7b0701000000c30400),
(3667, 0xd47e7d7b0701000000c50400),
(3667, 0xd57e7d7b0701000000241900),
(3668, 0xd57fae7f05010000003b1900),
(3668, 0xdb7faf7f0501000000d20d00),
(3668, 0xe37fab7f05010000003a1900),
(3668, 0xe17faf7f05010000003a1900),
(3668, 0xd87fb07f05010000003a1900),
(3668, 0xd97fb77f0501000000db0d00),
(3668, 0xd57fb97f05010000003b1900),
(3668, 0xd87fbb7f05010000003a1900),
(3668, 0xe67fb07f0501000000d20d00),
(3668, 0xe37fb97f0501000000d20d00),
(3668, 0xe97fba7f07010000003a1900),
(3668, 0xea7fb97f0701000000db0d00),
(3668, 0xe37fbd7f05010000003a1900),
(3669, 0x237e7a790401000000751b00),
(3669, 0x237e7a790501000000751b00),
(3669, 0x267e7a790301000000130700),
(3669, 0x267e7a790501000000751b00),
(3669, 0x297e7a790401000000751b00),
(3669, 0x297e7a790501000000751b00),
(3669, 0x237e7e790201000000751b00),
(3669, 0x227e7c7903010000007c1b00),
(3669, 0x257e7d790101000000761b00),
(3669, 0x257e7d790301000000680600),
(3669, 0x277e7f7904010000007c1b00),
(3669, 0x287e7e7901010000007c1b00),
(3669, 0x2b7e7c790101000000761b00),
(3669, 0x297e7e790201000000751b00),
(3669, 0x2a7e7c7903010000007c1b00),
(3669, 0x2f7e7f790301000000851b00),
(3669, 0x2d7e7c790401000000751b00),
(3669, 0x2d7e7c790501000000751b00),
(3669, 0x227e837901010000007c1b00),
(3669, 0x227e83790201000000751b00),
(3669, 0x227e82790301000000851b00),
(3669, 0x207e80790401000000761b00),
(3669, 0x227e83790401000000751b00),
(3669, 0x207e82790501000000851b00),
(3669, 0x227e807905010000007c1b00),
(3669, 0x237e80790501000000130700),
(3669, 0x237e83790501000000751b00),
(3669, 0x247e81790101000000761b00),
(3669, 0x247e837903010000007c1b00),
(3669, 0x257e81790401000000851b00),
(3669, 0x267e807905010000007c1b00),
(3669, 0x2b7e80790301000000851b00),
(3669, 0x287e83790401000000751b00),
(3669, 0x297e807905010000007c1b00),
(3669, 0x2a7e83790501000000751b00),
(3669, 0x2b7e83790501000000751b00),
(3669, 0x2f7e82790301000000761b00),
(3669, 0x2d7e837904010000007c1b00),
(3669, 0x2f7e80790401000000761b00),
(3669, 0x2d7e807905010000007c1b00),
(3669, 0x2f7e82790501000000761b00),
(3670, 0xaf7fa77d0b01000000ea4600),
(3670, 0xaf7fad7d0b01000000de3200),
(3670, 0xae7fb67d0a01000000dc3200),
(3670, 0xab7fba7d0a01000000de3200),
(3670, 0xb37fb77d0a01000000de3200),
(3670, 0xaf7fc07d0a01000000de3200),
(3671, 0x2f7f6f7c0701000000ed1300),
(3673, 0xef80c17a0601000000901b00),
(3674, 0x6882d97a04010000008e1500),
(3674, 0x6b82de7a03010000008c1500),
(3674, 0x6f82dd7a04010000008c1500),
(3674, 0x7482d97a04010000008e1500),
(3674, 0x7082de7a03010000008b1500),
(3675, 0x437eab790601000000f71a00),
(3675, 0x497eaa790401000000721b00),
(3675, 0x497ea9790501000000721b00),
(3675, 0x497ea9790601000000721b00),
(3675, 0x477eae790401000000711b00),
(3675, 0x457eae790501000000711b00),
(3675, 0x457eae790601000000711b00),
(3675, 0x467eae790601000000ee1a00),
(3675, 0x487eae790501000000711b00),
(3675, 0x497eac790501000000721b00),
(3675, 0x487eae790601000000711b00),
(3675, 0x497eac790601000000721b00),
(3676, 0x197ebc790701000000f71a00),
(3676, 0x1e7ebd790701000000721b00),
(3677, 0x197eb8790701000000f71a00),
(3677, 0x1e7eb9790701000000721b00),
(3678, 0x197eb4790701000000f71a00),
(3678, 0x1e7eb5790701000000721b00),
(3679, 0x197eb0790701000000f71a00),
(3679, 0x1e7eb1790701000000721b00),
(3680, 0x197eac790701000000f71a00),
(3680, 0x1e7ead790701000000721b00),
(3681, 0x1a7ebc790601000000f71a00),
(3681, 0x1e7ebd790601000000741b00),
(3682, 0x1a7eb8790601000000f71a00),
(3682, 0x1e7eb9790601000000721b00),
(3683, 0x1a7eb4790601000000f71a00),
(3683, 0x1e7eb5790601000000721b00),
(3684, 0x1a7eb0790601000000f71a00),
(3684, 0x1e7eb1790601000000741b00),
(3685, 0x1a7eac790601000000f71a00),
(3685, 0x1e7ead790601000000721b00),
(3686, 0xea7df4790601000000861b00),
(3686, 0xea7df47907010000007c1b00),
(3686, 0xee7df67906010000007d1b00),
(3686, 0xec7df7790701000000851b00),
(3686, 0xe77df9790701000000851b00),
(3686, 0xea7df9790601000000861b00),
(3686, 0xea7dfa7907010000007c1b00),
(3687, 0x3e7ebd7c0601000000bd0400),
(3687, 0x3f7ebd7c0601000000bd0400),
(3687, 0x3e7ebd7c0701000000bd0400),
(3687, 0x4e7ebf7c0601000000241900),
(3687, 0x4d7ebf7c0701000000241900),
(3687, 0x537ebf7c0501000000241900),
(3687, 0x547ebf7c0701000000241900),
(3687, 0x4b7ec27c0501000000251900),
(3687, 0x4b7ec27c0701000000c30400),
(3687, 0x4f7ec37c0601000000c30400),
(3687, 0x4f7ec37c0801000000c30400),
(3687, 0x4b7ec47c0601000000251900),
(3687, 0x4d7ec47c0501000000c50400),
(3687, 0x4f7ec57c06010000001a0700),
(3687, 0x4f7ec67c06010000001a0700),
(3687, 0x4e7ec57c0801000000c50400),
(3687, 0x4d7eca7c0501000000241900),
(3687, 0x4d7eca7c0601000000241900),
(3687, 0x4f7ec87c0601000000c30400),
(3687, 0x4e7eca7c0701000000241900),
(3687, 0x527ec27c0501000000c50400),
(3687, 0x517ec27c0701000000c50400),
(3687, 0x567ec37c0601000000251900),
(3687, 0x527ec47c0501000000c50400),
(3687, 0x567ec77c0501000000251900),
(3687, 0x567ec57c0601000000251900),
(3687, 0x567ec77c0601000000251900),
(3687, 0x567ec57c0701000000251900),
(3687, 0x537eca7c0501000000241900),
(3687, 0x537eca7c0601000000241900),
(3687, 0x517eca7c0701000000261900),
(3687, 0x547eca7c0601000000241900),
(3687, 0x567ec97c0701000000251900),
(3688, 0x487ede7d0601000000291900),
(3688, 0x4a7edc7d0601000000281900),
(3688, 0x487ee07d0601000000291900);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `z_ots_comunication`
--

CREATE TABLE `z_ots_comunication` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL DEFAULT '',
  `type` varchar(255) NOT NULL DEFAULT '',
  `action` varchar(255) NOT NULL DEFAULT '',
  `param1` varchar(255) NOT NULL DEFAULT '',
  `param2` varchar(255) NOT NULL DEFAULT '',
  `param3` varchar(255) NOT NULL DEFAULT '',
  `param4` varchar(255) NOT NULL DEFAULT '',
  `param5` varchar(255) NOT NULL DEFAULT '',
  `param6` varchar(255) NOT NULL DEFAULT '',
  `param7` varchar(255) NOT NULL DEFAULT '',
  `delete_it` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `z_polls`
--

CREATE TABLE `z_polls` (
  `id` int(11) NOT NULL,
  `question` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `end` int(11) NOT NULL DEFAULT 0,
  `start` int(11) NOT NULL DEFAULT 0,
  `answers` int(11) NOT NULL DEFAULT 0,
  `votes_all` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `z_polls_answers`
--

CREATE TABLE `z_polls_answers` (
  `poll_id` int(11) NOT NULL,
  `answer_id` int(11) NOT NULL,
  `answer` varchar(255) NOT NULL,
  `votes` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `z_shop_categories`
--

CREATE TABLE `z_shop_categories` (
  `id` int(11) NOT NULL,
  `name` varchar(32) NOT NULL,
  `description` varchar(255) NOT NULL DEFAULT '',
  `hidden` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `z_shop_categories`
--

INSERT INTO `z_shop_categories` (`id`, `name`, `description`, `hidden`) VALUES
(1, 'item', 'Items', 0),
(2, 'addon', 'Addons', 0),
(3, 'mount', 'Mounts', 0),
(4, 'pacc', 'Premium Account', 0),
(5, 'container', 'Containers', 0),
(6, 'other', 'Other', 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `z_shop_history`
--

CREATE TABLE `z_shop_history` (
  `id` int(11) NOT NULL,
  `comunication_id` int(11) NOT NULL DEFAULT 0,
  `to_name` varchar(255) NOT NULL DEFAULT '0',
  `to_account` int(11) NOT NULL DEFAULT 0,
  `from_nick` varchar(255) NOT NULL DEFAULT '',
  `from_account` int(11) NOT NULL DEFAULT 0,
  `price` int(11) NOT NULL DEFAULT 0,
  `offer_id` int(11) NOT NULL DEFAULT 0,
  `trans_state` varchar(255) NOT NULL,
  `trans_start` int(11) NOT NULL DEFAULT 0,
  `trans_real` int(11) NOT NULL DEFAULT 0,
  `is_pacc` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `z_shop_offer`
--

CREATE TABLE `z_shop_offer` (
  `id` int(11) NOT NULL,
  `points` int(11) NOT NULL DEFAULT 0,
  `itemid1` int(11) NOT NULL DEFAULT 0,
  `count1` int(11) NOT NULL DEFAULT 0,
  `itemid2` int(11) NOT NULL DEFAULT 0,
  `count2` int(11) NOT NULL DEFAULT 0,
  `offer_type` varchar(255) DEFAULT NULL,
  `offer_description` text NOT NULL,
  `offer_name` varchar(255) NOT NULL DEFAULT '',
  `hidden` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `z_shop_offer`
--

INSERT INTO `z_shop_offer` (`id`, `points`, `itemid1`, `count1`, `itemid2`, `count2`, `offer_type`, `offer_description`, `offer_name`, `hidden`) VALUES
(1, 10, 2160, 50, 0, 0, 'item', '50 crystal coins. They weigh 5.00 oz.', '50 Crystal Coins', 0),
(2, 10, 139, 3, 131, 3, 'addon', 'This purchase will give you the full knight outfit.', 'Knight Outfit', 0),
(3, 10, 22, 0, 0, 0, 'mount', 'This purchase will give you the Rented Horse mount.', 'Rented Horse', 0),
(4, 10, 0, 30, 0, 0, 'pacc', '30 Days of Premium Account', 'PACC 30', 0);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `accounts`
--
ALTER TABLE `accounts`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`),
  ADD UNIQUE KEY `name_2` (`name`),
  ADD UNIQUE KEY `name_3` (`name`);

--
-- Indices de la tabla `accounts_storage`
--
ALTER TABLE `accounts_storage`
  ADD PRIMARY KEY (`account_id`,`key`);

--
-- Indices de la tabla `account_bans`
--
ALTER TABLE `account_bans`
  ADD PRIMARY KEY (`account_id`),
  ADD KEY `banned_by` (`banned_by`);

--
-- Indices de la tabla `account_ban_history`
--
ALTER TABLE `account_ban_history`
  ADD PRIMARY KEY (`id`),
  ADD KEY `account_id` (`account_id`),
  ADD KEY `banned_by` (`banned_by`),
  ADD KEY `account_id_2` (`account_id`),
  ADD KEY `account_id_3` (`account_id`),
  ADD KEY `account_id_4` (`account_id`),
  ADD KEY `account_id_5` (`account_id`);

--
-- Indices de la tabla `account_character_sale`
--
ALTER TABLE `account_character_sale`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id_player_UNIQUE` (`id_player`),
  ADD KEY `account_character_sale_ibfk_2` (`id_account`);

--
-- Indices de la tabla `account_viplist`
--
ALTER TABLE `account_viplist`
  ADD UNIQUE KEY `account_player_index` (`account_id`,`player_id`),
  ADD KEY `account_id` (`account_id`),
  ADD KEY `player_id` (`player_id`);

--
-- Indices de la tabla `blessings_history`
--
ALTER TABLE `blessings_history`
  ADD KEY `blessings_history_ibfk_1` (`player_id`);

--
-- Indices de la tabla `boosted_boss`
--
ALTER TABLE `boosted_boss`
  ADD PRIMARY KEY (`date`);

--
-- Indices de la tabla `boosted_creature`
--
ALTER TABLE `boosted_creature`
  ADD PRIMARY KEY (`date`);

--
-- Indices de la tabla `coins_transactions`
--
ALTER TABLE `coins_transactions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `account_id` (`account_id`),
  ADD KEY `coins_transactions_pk` (`account_id`);

--
-- Indices de la tabla `crypto_payments`
--
ALTER TABLE `crypto_payments`
  ADD PRIMARY KEY (`paymentID`),
  ADD UNIQUE KEY `key3` (`boxID`,`orderID`,`userID`,`txID`,`amount`,`addr`),
  ADD KEY `boxID` (`boxID`),
  ADD KEY `boxType` (`boxType`),
  ADD KEY `userID` (`userID`),
  ADD KEY `countryID` (`countryID`),
  ADD KEY `orderID` (`orderID`),
  ADD KEY `amount` (`amount`),
  ADD KEY `amountUSD` (`amountUSD`),
  ADD KEY `coinLabel` (`coinLabel`),
  ADD KEY `unrecognised` (`unrecognised`),
  ADD KEY `addr` (`addr`),
  ADD KEY `txID` (`txID`),
  ADD KEY `txDate` (`txDate`),
  ADD KEY `txConfirmed` (`txConfirmed`),
  ADD KEY `txCheckDate` (`txCheckDate`),
  ADD KEY `processed` (`processed`),
  ADD KEY `processedDate` (`processedDate`),
  ADD KEY `recordCreated` (`recordCreated`),
  ADD KEY `key1` (`boxID`,`orderID`),
  ADD KEY `key2` (`boxID`,`orderID`,`userID`);

--
-- Indices de la tabla `cs_current_offers`
--
ALTER TABLE `cs_current_offers`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `cs_transaction_history`
--
ALTER TABLE `cs_transaction_history`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `daily_reward_history`
--
ALTER TABLE `daily_reward_history`
  ADD PRIMARY KEY (`id`),
  ADD KEY `player_id` (`player_id`);

--
-- Indices de la tabla `free_pass`
--
ALTER TABLE `free_pass`
  ADD KEY `free_pass_ibfk_1` (`player_id`);

--
-- Indices de la tabla `global_storage`
--
ALTER TABLE `global_storage`
  ADD UNIQUE KEY `key` (`key`);

--
-- Indices de la tabla `guilds`
--
ALTER TABLE `guilds`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`),
  ADD UNIQUE KEY `ownerid` (`ownerid`);

--
-- Indices de la tabla `guildwar_kills`
--
ALTER TABLE `guildwar_kills`
  ADD PRIMARY KEY (`id`),
  ADD KEY `warid` (`warid`);

--
-- Indices de la tabla `guild_actions_h`
--
ALTER TABLE `guild_actions_h`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `guild_invites`
--
ALTER TABLE `guild_invites`
  ADD PRIMARY KEY (`player_id`,`guild_id`),
  ADD KEY `guild_id` (`guild_id`);

--
-- Indices de la tabla `guild_membership`
--
ALTER TABLE `guild_membership`
  ADD PRIMARY KEY (`player_id`),
  ADD KEY `guild_id` (`guild_id`),
  ADD KEY `rank_id` (`rank_id`);

--
-- Indices de la tabla `guild_ranks`
--
ALTER TABLE `guild_ranks`
  ADD PRIMARY KEY (`id`),
  ADD KEY `guild_id` (`guild_id`);

--
-- Indices de la tabla `guild_transfer_h`
--
ALTER TABLE `guild_transfer_h`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `guild_wars`
--
ALTER TABLE `guild_wars`
  ADD PRIMARY KEY (`id`),
  ADD KEY `guild1` (`guild1`),
  ADD KEY `guild2` (`guild2`);

--
-- Indices de la tabla `houses`
--
ALTER TABLE `houses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `owner` (`owner`),
  ADD KEY `town_id` (`town_id`);

--
-- Indices de la tabla `house_lists`
--
ALTER TABLE `house_lists`
  ADD KEY `house_id` (`house_id`);

--
-- Indices de la tabla `ip_bans`
--
ALTER TABLE `ip_bans`
  ADD PRIMARY KEY (`ip`),
  ADD KEY `banned_by` (`banned_by`);

--
-- Indices de la tabla `live_casts`
--
ALTER TABLE `live_casts`
  ADD UNIQUE KEY `player_id_2` (`player_id`);

--
-- Indices de la tabla `market_history`
--
ALTER TABLE `market_history`
  ADD PRIMARY KEY (`id`),
  ADD KEY `player_id` (`player_id`,`sale`);

--
-- Indices de la tabla `market_offers`
--
ALTER TABLE `market_offers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sale` (`sale`,`itemtype`),
  ADD KEY `created` (`created`),
  ADD KEY `player_id` (`player_id`);

--
-- Indices de la tabla `pagseguro_transactions`
--
ALTER TABLE `pagseguro_transactions`
  ADD UNIQUE KEY `transaction_code` (`transaction_code`,`status`),
  ADD KEY `name` (`name`),
  ADD KEY `status` (`status`);

--
-- Indices de la tabla `players`
--
ALTER TABLE `players`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`),
  ADD KEY `account_id` (`account_id`),
  ADD KEY `vocation` (`vocation`);

--
-- Indices de la tabla `players_online`
--
ALTER TABLE `players_online`
  ADD PRIMARY KEY (`player_id`);

--
-- Indices de la tabla `player_binary_items`
--
ALTER TABLE `player_binary_items`
  ADD UNIQUE KEY `player_id_2` (`player_id`,`type`);

--
-- Indices de la tabla `player_deaths`
--
ALTER TABLE `player_deaths`
  ADD KEY `player_id` (`player_id`),
  ADD KEY `killed_by` (`killed_by`),
  ADD KEY `mostdamage_by` (`mostdamage_by`);

--
-- Indices de la tabla `player_depotitems`
--
ALTER TABLE `player_depotitems`
  ADD UNIQUE KEY `player_id_2` (`player_id`,`sid`);

--
-- Indices de la tabla `player_former_names`
--
ALTER TABLE `player_former_names`
  ADD PRIMARY KEY (`id`),
  ADD KEY `player_id` (`player_id`);

--
-- Indices de la tabla `player_hirelings`
--
ALTER TABLE `player_hirelings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `player_id` (`player_id`);

--
-- Indices de la tabla `player_inboxitems`
--
ALTER TABLE `player_inboxitems`
  ADD UNIQUE KEY `player_id_2` (`player_id`,`sid`);

--
-- Indices de la tabla `player_items`
--
ALTER TABLE `player_items`
  ADD KEY `player_id` (`player_id`),
  ADD KEY `sid` (`sid`);

--
-- Indices de la tabla `player_kills`
--
ALTER TABLE `player_kills`
  ADD KEY `player_kills_ibfk_1` (`player_id`),
  ADD KEY `player_kills_ibfk_2` (`target`);

--
-- Indices de la tabla `player_namelocks`
--
ALTER TABLE `player_namelocks`
  ADD PRIMARY KEY (`player_id`),
  ADD KEY `namelocked_by` (`namelocked_by`);

--
-- Indices de la tabla `player_preydata`
--
ALTER TABLE `player_preydata`
  ADD PRIMARY KEY (`player_id`);

--
-- Indices de la tabla `player_rewards`
--
ALTER TABLE `player_rewards`
  ADD UNIQUE KEY `player_id_2` (`player_id`,`sid`);

--
-- Indices de la tabla `player_spells`
--
ALTER TABLE `player_spells`
  ADD KEY `player_id` (`player_id`);

--
-- Indices de la tabla `player_storage`
--
ALTER TABLE `player_storage`
  ADD PRIMARY KEY (`player_id`,`key`);

--
-- Indices de la tabla `prey_slots`
--
ALTER TABLE `prey_slots`
  ADD KEY `player_id` (`player_id`);

--
-- Indices de la tabla `quickloot_containers`
--
ALTER TABLE `quickloot_containers`
  ADD KEY `fk_quickloot_containers_player_id` (`player_id`);

--
-- Indices de la tabla `sellchar`
--
ALTER TABLE `sellchar`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `sell_players`
--
ALTER TABLE `sell_players`
  ADD PRIMARY KEY (`player_id`);

--
-- Indices de la tabla `sell_players_history`
--
ALTER TABLE `sell_players_history`
  ADD PRIMARY KEY (`player_id`,`buytime`) USING BTREE;

--
-- Indices de la tabla `server_config`
--
ALTER TABLE `server_config`
  ADD PRIMARY KEY (`config`);

--
-- Indices de la tabla `snowballwar`
--
ALTER TABLE `snowballwar`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`);

--
-- Indices de la tabla `store_history`
--
ALTER TABLE `store_history`
  ADD PRIMARY KEY (`id`),
  ADD KEY `account_id` (`account_id`),
  ADD KEY `store_history_pk` (`account_id`);

--
-- Indices de la tabla `tickets`
--
ALTER TABLE `tickets`
  ADD PRIMARY KEY (`ticket_id`),
  ADD KEY `tickets_ibfk_1` (`ticket_author_acc_id`);

--
-- Indices de la tabla `tickets_reply`
--
ALTER TABLE `tickets_reply`
  ADD PRIMARY KEY (`reply_id`),
  ADD KEY `tickets_reply_ibfk_1` (`ticket_id`);

--
-- Indices de la tabla `tile_store`
--
ALTER TABLE `tile_store`
  ADD KEY `house_id` (`house_id`);

--
-- Indices de la tabla `z_ots_comunication`
--
ALTER TABLE `z_ots_comunication`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `z_polls`
--
ALTER TABLE `z_polls`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `z_shop_categories`
--
ALTER TABLE `z_shop_categories`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `z_shop_history`
--
ALTER TABLE `z_shop_history`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `z_shop_offer`
--
ALTER TABLE `z_shop_offer`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `accounts`
--
ALTER TABLE `accounts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1160;

--
-- AUTO_INCREMENT de la tabla `account_ban_history`
--
ALTER TABLE `account_ban_history`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `account_character_sale`
--
ALTER TABLE `account_character_sale`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `coins_transactions`
--
ALTER TABLE `coins_transactions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `crypto_payments`
--
ALTER TABLE `crypto_payments`
  MODIFY `paymentID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `cs_current_offers`
--
ALTER TABLE `cs_current_offers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=95;

--
-- AUTO_INCREMENT de la tabla `cs_transaction_history`
--
ALTER TABLE `cs_transaction_history`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=147;

--
-- AUTO_INCREMENT de la tabla `daily_reward_history`
--
ALTER TABLE `daily_reward_history`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `guilds`
--
ALTER TABLE `guilds`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT de la tabla `guildwar_kills`
--
ALTER TABLE `guildwar_kills`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `guild_actions_h`
--
ALTER TABLE `guild_actions_h`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `guild_ranks`
--
ALTER TABLE `guild_ranks`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=64;

--
-- AUTO_INCREMENT de la tabla `guild_transfer_h`
--
ALTER TABLE `guild_transfer_h`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `guild_wars`
--
ALTER TABLE `guild_wars`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `houses`
--
ALTER TABLE `houses`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3689;

--
-- AUTO_INCREMENT de la tabla `market_history`
--
ALTER TABLE `market_history`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `market_offers`
--
ALTER TABLE `market_offers`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `players`
--
ALTER TABLE `players`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2105;

--
-- AUTO_INCREMENT de la tabla `player_former_names`
--
ALTER TABLE `player_former_names`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `player_hirelings`
--
ALTER TABLE `player_hirelings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `sellchar`
--
ALTER TABLE `sellchar`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `snowballwar`
--
ALTER TABLE `snowballwar`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `store_history`
--
ALTER TABLE `store_history`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT de la tabla `tickets`
--
ALTER TABLE `tickets`
  MODIFY `ticket_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `tickets_reply`
--
ALTER TABLE `tickets_reply`
  MODIFY `reply_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `z_ots_comunication`
--
ALTER TABLE `z_ots_comunication`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `z_polls`
--
ALTER TABLE `z_polls`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `z_shop_categories`
--
ALTER TABLE `z_shop_categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `z_shop_history`
--
ALTER TABLE `z_shop_history`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `z_shop_offer`
--
ALTER TABLE `z_shop_offer`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `accounts_storage`
--
ALTER TABLE `accounts_storage`
  ADD CONSTRAINT `accounts_storage_ibfk_1` FOREIGN KEY (`account_id`) REFERENCES `accounts` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `account_bans`
--
ALTER TABLE `account_bans`
  ADD CONSTRAINT `account_bans_ibfk_1` FOREIGN KEY (`account_id`) REFERENCES `accounts` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `account_bans_ibfk_2` FOREIGN KEY (`banned_by`) REFERENCES `players` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `account_ban_history`
--
ALTER TABLE `account_ban_history`
  ADD CONSTRAINT `account_ban_history_ibfk_2` FOREIGN KEY (`banned_by`) REFERENCES `players` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `account_ban_history_ibfk_3` FOREIGN KEY (`account_id`) REFERENCES `accounts` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `account_ban_history_ibfk_4` FOREIGN KEY (`account_id`) REFERENCES `accounts` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `account_ban_history_ibfk_5` FOREIGN KEY (`account_id`) REFERENCES `accounts` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `account_ban_history_ibfk_6` FOREIGN KEY (`account_id`) REFERENCES `accounts` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `account_character_sale`
--
ALTER TABLE `account_character_sale`
  ADD CONSTRAINT `account_character_sale_ibfk_1` FOREIGN KEY (`id_player`) REFERENCES `players` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `account_character_sale_ibfk_2` FOREIGN KEY (`id_account`) REFERENCES `accounts` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `account_viplist`
--
ALTER TABLE `account_viplist`
  ADD CONSTRAINT `account_viplist_ibfk_1` FOREIGN KEY (`account_id`) REFERENCES `accounts` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `account_viplist_ibfk_2` FOREIGN KEY (`player_id`) REFERENCES `players` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `blessings_history`
--
ALTER TABLE `blessings_history`
  ADD CONSTRAINT `blessings_history_ibfk_1` FOREIGN KEY (`player_id`) REFERENCES `players` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `free_pass`
--
ALTER TABLE `free_pass`
  ADD CONSTRAINT `free_pass_ibfk_1` FOREIGN KEY (`player_id`) REFERENCES `players` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `guilds`
--
ALTER TABLE `guilds`
  ADD CONSTRAINT `guilds_ibfk_1` FOREIGN KEY (`ownerid`) REFERENCES `players` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `guildwar_kills`
--
ALTER TABLE `guildwar_kills`
  ADD CONSTRAINT `guildwar_kills_ibfk_1` FOREIGN KEY (`warid`) REFERENCES `guild_wars` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `guild_invites`
--
ALTER TABLE `guild_invites`
  ADD CONSTRAINT `guild_invites_ibfk_1` FOREIGN KEY (`player_id`) REFERENCES `players` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `guild_invites_ibfk_2` FOREIGN KEY (`guild_id`) REFERENCES `guilds` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `guild_membership`
--
ALTER TABLE `guild_membership`
  ADD CONSTRAINT `guild_membership_ibfk_1` FOREIGN KEY (`player_id`) REFERENCES `players` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `guild_membership_ibfk_2` FOREIGN KEY (`guild_id`) REFERENCES `guilds` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `guild_membership_ibfk_3` FOREIGN KEY (`rank_id`) REFERENCES `guild_ranks` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `guild_ranks`
--
ALTER TABLE `guild_ranks`
  ADD CONSTRAINT `guild_ranks_ibfk_1` FOREIGN KEY (`guild_id`) REFERENCES `guilds` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `house_lists`
--
ALTER TABLE `house_lists`
  ADD CONSTRAINT `house_lists_ibfk_1` FOREIGN KEY (`house_id`) REFERENCES `houses` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `ip_bans`
--
ALTER TABLE `ip_bans`
  ADD CONSTRAINT `ip_bans_ibfk_1` FOREIGN KEY (`banned_by`) REFERENCES `players` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `live_casts`
--
ALTER TABLE `live_casts`
  ADD CONSTRAINT `live_casts_ibfk_1` FOREIGN KEY (`player_id`) REFERENCES `players` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `market_history`
--
ALTER TABLE `market_history`
  ADD CONSTRAINT `market_history_ibfk_1` FOREIGN KEY (`player_id`) REFERENCES `players` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `market_offers`
--
ALTER TABLE `market_offers`
  ADD CONSTRAINT `market_offers_ibfk_1` FOREIGN KEY (`player_id`) REFERENCES `players` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `players`
--
ALTER TABLE `players`
  ADD CONSTRAINT `players_ibfk_1` FOREIGN KEY (`account_id`) REFERENCES `accounts` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `player_deaths`
--
ALTER TABLE `player_deaths`
  ADD CONSTRAINT `player_deaths_ibfk_1` FOREIGN KEY (`player_id`) REFERENCES `players` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `player_depotitems`
--
ALTER TABLE `player_depotitems`
  ADD CONSTRAINT `player_depotitems_ibfk_1` FOREIGN KEY (`player_id`) REFERENCES `players` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `player_hirelings`
--
ALTER TABLE `player_hirelings`
  ADD CONSTRAINT `player_hirelings_ibfk_1` FOREIGN KEY (`player_id`) REFERENCES `players` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `player_inboxitems`
--
ALTER TABLE `player_inboxitems`
  ADD CONSTRAINT `player_inboxitems_ibfk_1` FOREIGN KEY (`player_id`) REFERENCES `players` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `player_items`
--
ALTER TABLE `player_items`
  ADD CONSTRAINT `player_items_ibfk_1` FOREIGN KEY (`player_id`) REFERENCES `players` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `player_kills`
--
ALTER TABLE `player_kills`
  ADD CONSTRAINT `player_kills_ibfk_1` FOREIGN KEY (`player_id`) REFERENCES `players` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `player_kills_ibfk_2` FOREIGN KEY (`target`) REFERENCES `players` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `player_namelocks`
--
ALTER TABLE `player_namelocks`
  ADD CONSTRAINT `player_namelocks_ibfk_1` FOREIGN KEY (`player_id`) REFERENCES `players` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `player_namelocks_ibfk_2` FOREIGN KEY (`namelocked_by`) REFERENCES `players` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `player_preydata`
--
ALTER TABLE `player_preydata`
  ADD CONSTRAINT `player_preydata_ibfk_1` FOREIGN KEY (`player_id`) REFERENCES `players` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `player_rewards`
--
ALTER TABLE `player_rewards`
  ADD CONSTRAINT `player_rewards_ibfk_1` FOREIGN KEY (`player_id`) REFERENCES `players` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `player_spells`
--
ALTER TABLE `player_spells`
  ADD CONSTRAINT `player_spells_ibfk_1` FOREIGN KEY (`player_id`) REFERENCES `players` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `player_storage`
--
ALTER TABLE `player_storage`
  ADD CONSTRAINT `player_storage_ibfk_1` FOREIGN KEY (`player_id`) REFERENCES `players` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `prey_slots`
--
ALTER TABLE `prey_slots`
  ADD CONSTRAINT `prey_slots_ibfk_1` FOREIGN KEY (`player_id`) REFERENCES `players` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `quickloot_containers`
--
ALTER TABLE `quickloot_containers`
  ADD CONSTRAINT `fk_quickloot_containers_player_id` FOREIGN KEY (`player_id`) REFERENCES `players` (`id`);

--
-- Filtros para la tabla `sellchar`
--
ALTER TABLE `sellchar`
  ADD CONSTRAINT `sellchar_ibfk_1` FOREIGN KEY (`id`) REFERENCES `players` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `sell_players`
--
ALTER TABLE `sell_players`
  ADD CONSTRAINT `sell_players_ibfk_1` FOREIGN KEY (`player_id`) REFERENCES `players` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `sell_players_history`
--
ALTER TABLE `sell_players_history`
  ADD CONSTRAINT `sell_players_history_ibfk_1` FOREIGN KEY (`player_id`) REFERENCES `players` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `tickets`
--
ALTER TABLE `tickets`
  ADD CONSTRAINT `tickets_ibfk_1` FOREIGN KEY (`ticket_author_acc_id`) REFERENCES `accounts` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `tickets_reply`
--
ALTER TABLE `tickets_reply`
  ADD CONSTRAINT `tickets_reply_ibfk_1` FOREIGN KEY (`ticket_id`) REFERENCES `tickets` (`ticket_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `tile_store`
--
ALTER TABLE `tile_store`
  ADD CONSTRAINT `tile_store_ibfk_1` FOREIGN KEY (`house_id`) REFERENCES `houses` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
