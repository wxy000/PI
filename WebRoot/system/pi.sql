-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: 2018-02-14 12:26:46
-- 服务器版本： 5.7.19
-- PHP Version: 7.1.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `pi`
--

-- --------------------------------------------------------

--
-- 表的结构 `calendar`
--

DROP TABLE IF EXISTS `calendar`;
CREATE TABLE IF NOT EXISTS `calendar` (
  `calendarid` int(11) NOT NULL AUTO_INCREMENT,
  `start_time` varchar(100) NOT NULL,
  `end_time` varchar(100) NOT NULL,
  `calendartitle` varchar(255) NOT NULL,
  `calendarcontent` text,
  `userId` int(11) NOT NULL,
  PRIMARY KEY (`calendarid`),
  KEY `userId` (`userId`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `calendar`
--

INSERT INTO `calendar` (`calendarid`, `start_time`, `end_time`, `calendartitle`, `calendarcontent`, `userId`) VALUES
(1, '2018-02-12 15:00:00', '2018-02-14 18:00:00', '测试', 'cccccccccccccccccccssssssssssssssssssssssss', 1),
(2, '2018-02-20 12:25:00', '2018-02-20 13:30:00', '午饭', '', 1),
(3, '2018-02-12 16:00:00', '2018-02-12 18:00:00', '串门', '多去别人家坐坐，交流感情', 1),
(7, '2018-10-08 00:00:00', '2018-10-08 00:04:00', 'cs', '', 1),
(8, '2018-10-08 05:00:00', '2018-10-09 00:00:00', 'ccss', 'ccss', 1),
(9, '2018-10-08 08:00:00', '2018-10-10 00:00:00', '///', '???', 1),
(11, '2018-10-08 03:04:00', '2018-10-14 00:00:00', 'xxx', 'xxxx', 1),
(14, '2018-02-16 00:00:00', '2018-02-17 00:00:00', '过年啦', '开心不^o^', 1),
(15, '2018-02-15 00:00:00', '2018-02-16 00:00:00', '除夕了耶', '啦啦啦啦啦啦啦啦', 1);

-- --------------------------------------------------------

--
-- 表的结构 `files`
--

DROP TABLE IF EXISTS `files`;
CREATE TABLE IF NOT EXISTS `files` (
  `fileid` int(11) NOT NULL AUTO_INCREMENT,
  `filename` varchar(100) DEFAULT NULL,
  `singer` varchar(100) DEFAULT NULL,
  `author` varchar(100) DEFAULT NULL,
  `time` bigint(20) DEFAULT NULL,
  `path` varchar(255) NOT NULL,
  `userId` int(11) NOT NULL,
  `type` int(11) NOT NULL,
  PRIMARY KEY (`fileid`),
  KEY `userId` (`userId`)
) ENGINE=InnoDB AUTO_INCREMENT=60 DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `files`
--

INSERT INTO `files` (`fileid`, `filename`, `singer`, `author`, `time`, `path`, `userId`, `type`) VALUES
(2, 'DOAR CU TINE', 'Activ', '苏荷酒吧', 211, '/system/music/Activ - DOAR CU TINE.mp3', 1, 2),
(3, 'Better off Alone', 'Alice Deejay', 'Who Needs Guitars Anyway?', 215, '/system/music/Alice Deejay - Better off Alone.mp3', 1, 2),
(6, 'Rolling In The Deep', 'Adele', 'Rolling In The Deep', 228, '/system/music/Adele - Rolling In The Deep.mp3', 1, 2),
(7, '更多伤感歌曲百度一下：听歌123音乐网', '新歌首发www.tingge123.com', '最新伤感歌曲www.tingge123.com', 256, '/system/music/2002年的第一场雪-刀郎.mp3', 4, 2),
(8, 'Rolling In The Deep', 'Adele', 'Rolling In The Deep', 228, '/system/music/Adele - Rolling In The Deep.mp3', 4, 2),
(9, 'No Limit', '2 Unlimited', 'No Limits', 227, '/system/music/2 Unlimited - No Limit.mp3', 4, 2),
(10, 'Best Day Of My Life', 'American Authors', 'American Authors', 193, '/system/music/American Authors - Best Day Of My Life.mp3', 4, 2),
(11, 'Better off Alone', 'Alice Deejay', 'Who Needs Guitars Anyway?', 215, '/system/music/Alice Deejay - Better off Alone.mp3', 4, 2),
(12, 'DOAR CU TINE', 'Activ', '苏荷酒吧', 211, '/system/music/Activ - DOAR CU TINE.mp3', 4, 2),
(13, '朋友', '周华健', '不朽之名曲 （第三期）', 269, '/system/music/周华健 - 朋友.mp3', 1, 2),
(21, 'Solo Tu (加快版)', 'Highland', '最新热歌慢摇76', 235, '/system/music/Highland - Solo Tu (加快版).mp3', 1, 2),
(22, 'Solo Tu', 'Highland', 'Bella Stella', 224, '/system/music/Highland - Solo Tu.mp3', 1, 2),
(23, 'Opening Credits', 'Hans Zimmer/Lorne Balfe', 'Call of Duty: Modern Warfare 2', 195, '/system/music/Hans Zimmer,Lorne Balfe - Opening Credits.mp3', 1, 2),
(24, 'We Will Rock You', 'Houseboys', '广告传奇2', 201, '/system/music/Houseboys - We Will Rock You.mp3', 1, 2),
(25, 'Heart Of Asia', 'Watergate', 'Best 2000: Nothin\' But the Best Dance Hits', 187, '/system/music/Watergate - Heart Of Asia.mp3', 1, 2),
(36, '2', NULL, NULL, NULL, '/system/images/content/2.jpg', 1, 4),
(37, '3', NULL, NULL, NULL, '/system/images/content/3.jpg', 1, 4),
(39, '5', NULL, NULL, NULL, '/system/images/content/5.jpg', 1, 4),
(40, 'CN_2017-08-25_1366x768.JPG20180208162926796', NULL, NULL, 0, '/system/images/content/CN_2017-08-25_1366x768.JPG20180208162926796.JPG', 1, 4),
(41, 'CN_2017-08-26_1366x768.JPG20180208162926733', NULL, NULL, 0, '/system/images/content/CN_2017-08-26_1366x768.JPG20180208162926733.JPG', 1, 4),
(42, 'CN_2017-08-27_1366x768.JPG20180208162926779', NULL, NULL, 0, '/system/images/content/CN_2017-08-27_1366x768.JPG20180208162926779.JPG', 1, 4),
(43, '回忆那么伤', '孙子涵', '双子涵', 236, '/system/music/孙子涵 - 回忆那么伤.mp3', 1, 2),
(44, 'CN_2017-08-31_1366x768.JPG20180208194514323', NULL, NULL, 0, '/system/images/content/CN_2017-08-31_1366x768.JPG20180208194514323.JPG', 1, 4),
(46, 'CN_2017-12-04_1366x768.JPG20180208200222598', NULL, NULL, 0, '/system/images/content/CN_2017-12-04_1366x768.JPG20180208200222598.JPG', 1, 4),
(47, 'CN_2017-12-06_1366x768.JPG20180208200222697', NULL, NULL, 0, '/system/images/content/CN_2017-12-06_1366x768.JPG20180208200222697.JPG', 1, 4),
(48, 'CN_2017-12-05_1366x768.JPG20180208200222704', NULL, NULL, 0, '/system/images/content/CN_2017-12-05_1366x768.JPG20180208200222704.JPG', 1, 4),
(49, 'CN_2017-12-07_1366x768.JPG20180208200222721', NULL, NULL, 0, '/system/images/content/CN_2017-12-07_1366x768.JPG20180208200222721.JPG', 1, 4),
(50, 'CN_2017-12-08_1366x768.JPG20180208200222735', NULL, NULL, 0, '/system/images/content/CN_2017-12-08_1366x768.JPG20180208200222735.JPG', 1, 4),
(52, '高一化学必修一', NULL, NULL, NULL, '/system/doc/高一化学必修一.pdf', 1, 1),
(54, '高一数学必修一', NULL, NULL, NULL, '/system/doc/高一数学必修一.pdf', 1, 1),
(55, '高一物理必修一', NULL, NULL, NULL, '/system/doc/高一物理必修一.pdf', 1, 1),
(56, '鬼工山庄黑科技合集', NULL, NULL, NULL, '/system/doc/鬼工山庄黑科技合集.doc', 1, 1),
(57, 'excel', NULL, NULL, NULL, '/system/doc/excel.xlsx', 1, 1),
(58, '光良 - 童话', NULL, NULL, 379600, '/system/video/光良 - 童话.mp4', 1, 3),
(59, '孙子涵 - 烹爱', NULL, NULL, 247600, '/system/video/孙子涵 - 烹爱.mp4', 1, 3);

-- --------------------------------------------------------

--
-- 表的结构 `friends`
--

DROP TABLE IF EXISTS `friends`;
CREATE TABLE IF NOT EXISTS `friends` (
  `friendId` int(100) NOT NULL AUTO_INCREMENT,
  `userId` int(100) NOT NULL,
  `friendName` varchar(100) NOT NULL,
  `friendPhone` varchar(100) NOT NULL,
  `friendCompany` varchar(100) NOT NULL,
  `friendQQ` varchar(100) NOT NULL,
  `friendEmail` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`friendId`),
  KEY `user_id` (`userId`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `friends`
--

INSERT INTO `friends` (`friendId`, `userId`, `friendName`, `friendPhone`, `friendCompany`, `friendQQ`, `friendEmail`) VALUES
(1, 1, '张三三', '15896236548', '腾讯', '364589621', 'zhangsan@qq.com'),
(2, 1, '李四', '15896324569', '阿里巴巴', '369875632', 'ls@163.com'),
(3, 1, '王五', '15896234789', '腾讯', '236542563', 'ww@qq.com'),
(4, 2, '吴晓丽', '13876453296', '百度', '3756354859', 'wuliaoli@qq.com'),
(5, 1, '吴刚', '13948574804', '速递有限公司', '85750365532', 'wug@163.com'),
(6, 1, '郝黎', '15734758685', '北京新型机电有限公司', '2857593932', 'haoli@qq.com'),
(7, 1, '宋丽娟', '18937564092', '国家电力', '6754930454', 'slj@outlook.com'),
(8, 1, '郑少东', '17434598764', '阿里巴巴', '39405068436', 'zsd@gmail.com'),
(10, 1, '惠成功', '17846539087', '职介所', '382760958', 'hcg@qq.com'),
(11, 1, '公孙泽', '18976540923', '美信互连', '2876904148', 'gsz@163.com');

-- --------------------------------------------------------

--
-- 表的结构 `user`
--

DROP TABLE IF EXISTS `user`;
CREATE TABLE IF NOT EXISTS `user` (
  `userId` int(100) NOT NULL AUTO_INCREMENT,
  `userName` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `work` varchar(100) DEFAULT NULL,
  `realName` varchar(100) DEFAULT NULL,
  `sex` varchar(4) DEFAULT NULL,
  `phone` varchar(100) DEFAULT NULL,
  `photopath` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `notes` text,
  PRIMARY KEY (`userId`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `user`
--

INSERT INTO `user` (`userId`, `userName`, `password`, `work`, `realName`, `sex`, `phone`, `photopath`, `email`, `notes`) VALUES
(1, 'admin', '123', '管理员', '李四', '男', '17862821585', '/system/images/header/20180206162340882.jpg', 'lisi@163.com', '假定的管理员'),
(2, 'abc', '123456', '测试员', '张三', '女', '15563893561', '/system/images/header/20180201161917167.jpg', 'zhangsan@QQ.com', '作者安排的测试账号'),
(4, 'wxy', '123456', '学生', '王世杰', '男', '13785960478', '/system/images/header/20180202111108979.jpg', '294057256@qq.com', '测试账号之一'),
(5, 'aaa', '123456', '测试员', '王五', '女', '13756473834', '/system/images/header/20180201194546325.jpg', 'aaa@qq.com', '新增一个成员');

--
-- 限制导出的表
--

--
-- 限制表 `calendar`
--
ALTER TABLE `calendar`
  ADD CONSTRAINT `calendar_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `user` (`userId`);

--
-- 限制表 `files`
--
ALTER TABLE `files`
  ADD CONSTRAINT `files_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `user` (`userId`);

--
-- 限制表 `friends`
--
ALTER TABLE `friends`
  ADD CONSTRAINT `user_id` FOREIGN KEY (`userId`) REFERENCES `user` (`userId`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
