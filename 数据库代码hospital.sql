-- phpMyAdmin SQL Dump
-- version 4.9.3
-- https://www.phpmyadmin.net/
--
-- 主机： localhost:3306
-- 生成日期： 2020-12-08 10:59:44
-- 服务器版本： 5.7.26
-- PHP 版本： 7.4.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- 数据库： `hospital`
--
CREATE DATABASE IF NOT EXISTS `hospital` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `hospital`;

-- --------------------------------------------------------

--
-- 表的结构 `appointment`
--

CREATE TABLE `appointment` (
  `id` int(20) NOT NULL,
  `nurseid` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `patientid` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `state` int(1) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `appointment`
--

INSERT INTO `appointment` (`id`, `nurseid`, `patientid`, `state`) VALUES
(14, '300', '300', 1),
(16, '777', '500', 0),
(12, '300', '777', 0);

-- --------------------------------------------------------

--
-- 表的结构 `case_table`
--

CREATE TABLE `case_table` (
  `id` int(20) NOT NULL,
  `patientid` int(20) NOT NULL,
  `doctorid` int(20) NOT NULL,
  `case_history` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `case_table`
--

INSERT INTO `case_table` (`id`, `patientid`, `doctorid`, `case_history`) VALUES
(1, 2019, 300, '您的病历'),
(2, 300, 777, '您的病历详情');

-- --------------------------------------------------------

--
-- 表的结构 `doctor`
--

CREATE TABLE `doctor` (
  `id` int(20) NOT NULL,
  `name` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `password` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `office` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `introduce` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `doctor`
--

INSERT INTO `doctor` (`id`, `name`, `password`, `office`, `introduce`) VALUES
(777, '李四', '123', '心外科', '7777777777777'),
(3019, '赵一二', '1234', '儿科', 'zhaoyiyiyi'),
(123, '张四', '123456', '其他科室', 'zhangsansan');

-- --------------------------------------------------------

--
-- 表的结构 `manager`
--

CREATE TABLE `manager` (
  `id` int(20) NOT NULL,
  `name` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `password` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `manager`
--

INSERT INTO `manager` (`id`, `name`, `password`) VALUES
(1, '苏七', '123456');

-- --------------------------------------------------------

--
-- 表的结构 `nurse`
--

CREATE TABLE `nurse` (
  `id` int(20) NOT NULL,
  `name` varchar(20) NOT NULL,
  `password` varchar(20) NOT NULL,
  `office` varchar(20) NOT NULL,
  `introduce` varchar(200) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `nurse`
--

INSERT INTO `nurse` (`id`, `name`, `password`, `office`, `introduce`) VALUES
(500, '小红', '123456', '其他科室', 'xiaohong222'),
(1, 'wanglianhua', '777777', '其他科室', 'zhangsan111'),
(300, 'wanglianhua', '123', '其他科室', 'zhangsan');

-- --------------------------------------------------------

--
-- 表的结构 `patient`
--

CREATE TABLE `patient` (
  `id` int(20) NOT NULL,
  `name` varchar(20) NOT NULL,
  `password` varchar(20) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `patient`
--

INSERT INTO `patient` (`id`, `name`, `password`) VALUES
(300, '孙五', '123'),
(301, '刘六', '123'),
(302, 'abc', '123456'),
(777, 'lihua', '123');

-- --------------------------------------------------------

--
-- 表的结构 `registration`
--

CREATE TABLE `registration` (
  `id` int(20) NOT NULL,
  `patientid` int(20) NOT NULL,
  `doctorid` int(20) NOT NULL,
  `state` int(1) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `registration`
--

INSERT INTO `registration` (`id`, `patientid`, `doctorid`, `state`) VALUES
(1, 300, 3019, 0),
(2, 301, 3018, 0),
(44, 303, 3333, 0),
(69, 777, 777, 1),
(71, 300, 777, 0),
(50, 303, 123, 0),
(51, 303, 3019, 0),
(52, 303, 777, 0),
(70, 300, 3019, 0),
(66, 300, 777, 0),
(67, 300, 300, 1),
(68, 300, 3019, 0);

--
-- 转储表的索引
--

--
-- 表的索引 `appointment`
--
ALTER TABLE `appointment`
  ADD PRIMARY KEY (`id`),
  ADD KEY `nurseid` (`nurseid`),
  ADD KEY `patientid` (`patientid`);

--
-- 表的索引 `case_table`
--
ALTER TABLE `case_table`
  ADD PRIMARY KEY (`id`),
  ADD KEY `doctorid` (`doctorid`),
  ADD KEY `patientid` (`patientid`);

--
-- 表的索引 `doctor`
--
ALTER TABLE `doctor`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `manager`
--
ALTER TABLE `manager`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `nurse`
--
ALTER TABLE `nurse`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`);

--
-- 表的索引 `patient`
--
ALTER TABLE `patient`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `registration`
--
ALTER TABLE `registration`
  ADD PRIMARY KEY (`id`),
  ADD KEY `doctorid` (`doctorid`),
  ADD KEY `patientid` (`patientid`);

--
-- 在导出的表使用AUTO_INCREMENT
--

--
-- 使用表AUTO_INCREMENT `appointment`
--
ALTER TABLE `appointment`
  MODIFY `id` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- 使用表AUTO_INCREMENT `case_table`
--
ALTER TABLE `case_table`
  MODIFY `id` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- 使用表AUTO_INCREMENT `manager`
--
ALTER TABLE `manager`
  MODIFY `id` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- 使用表AUTO_INCREMENT `patient`
--
ALTER TABLE `patient`
  MODIFY `id` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=778;

--
-- 使用表AUTO_INCREMENT `registration`
--
ALTER TABLE `registration`
  MODIFY `id` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=72;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
