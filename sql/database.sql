-- phpMyAdmin SQL Dump
-- version 4.8.0.1
-- https://www.phpmyadmin.net/
--
-- 主機: 127.0.0.1
-- 產生時間： 2018 年 07 月 19 日 17:17
-- 伺服器版本: 10.1.32-MariaDB
-- PHP 版本： 7.2.5

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- 資料庫： `database`
--

-- --------------------------------------------------------

--
-- 資料表結構 `crash-log`
--

CREATE TABLE `crash-log` (
  `id` int(11) NOT NULL,
  `user` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `message` longtext CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `source` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `backup` longtext CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `GM` varchar(5) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `reg_ip` varchar(20) DEFAULT NULL,
  `reg_date` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `update_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 資料表結構 `project`
--

CREATE TABLE `project` (
  `id` int(6) UNSIGNED NOT NULL,
  `user` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `project_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `project_dec` longtext CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `project_lang` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `public` varchar(5) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `url` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `star` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `UID` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `code` longtext CHARACTER SET utf8 COLLATE utf8_bin,
  `follower` varchar(255) NOT NULL,
  `reg_date` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `update_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 資料表結構 `username`
--

CREATE TABLE `username` (
  `id` int(6) UNSIGNED NOT NULL,
  `user` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `nick` varchar(15) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `password` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `email` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `profile_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `Record` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `GM` varchar(5) NOT NULL,
  `reg_ip` varchar(20) DEFAULT NULL,
  `reg_date` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `update_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 已匯出資料表的索引
--

--
-- 資料表索引 `crash-log`
--
ALTER TABLE `crash-log`
  ADD PRIMARY KEY (`id`);

--
-- 資料表索引 `username`
--
ALTER TABLE `username`
  ADD PRIMARY KEY (`id`);

--
-- 在匯出的資料表使用 AUTO_INCREMENT
--

--
-- 使用資料表 AUTO_INCREMENT `crash-log`
--
ALTER TABLE `crash-log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- 使用資料表 AUTO_INCREMENT `username`
--
ALTER TABLE `username`
  MODIFY `id` int(6) UNSIGNED NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
