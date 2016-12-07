/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50173
Source Host           : localhost:3306
Source Database       : shebei

Target Server Type    : MYSQL
Target Server Version : 50173
File Encoding         : 65001

Date: 2016-12-07 17:17:08
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `keshi`
-- ----------------------------
DROP TABLE IF EXISTS `keshi`;
CREATE TABLE `keshi` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `keshiname` char(20) NOT NULL,
  `keshimanager` char(20) NOT NULL,
  `keshiposition` char(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of keshi
-- ----------------------------
INSERT INTO `keshi` VALUES ('1', '一病区', '彭建群', '5楼');
INSERT INTO `keshi` VALUES ('2', '血透一部', '李宪超', '2楼');
INSERT INTO `keshi` VALUES ('3', '血透二部', '周忠群', '3楼');
INSERT INTO `keshi` VALUES ('4', '33', '333', '333');
