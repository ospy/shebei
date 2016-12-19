/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50173
Source Host           : localhost:3306
Source Database       : shebei

Target Server Type    : MYSQL
Target Server Version : 50173
File Encoding         : 65001

Date: 2016-12-17 21:03:06
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for zhuanyi
-- ----------------------------
DROP TABLE IF EXISTS `zhuanyi`;
CREATE TABLE `zhuanyi` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `sbid` int(10) DEFAULT NULL,
  `oldkeshi` int(10) DEFAULT NULL,
  `newkeshi` int(10) DEFAULT NULL,
  `pizhunren` char(20) DEFAULT NULL,
  `diaobodate` date DEFAULT NULL,
  `beizhu` varchar(200) DEFAULT NULL,
  `newdidian` varchar(100) DEFAULT NULL,
  `olddidian` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of zhuanyi
-- ----------------------------
INSERT INTO `zhuanyi` VALUES ('1', '1', '2', '3', '测试人', '2016-12-09', '备注', '新地点', '45床');
