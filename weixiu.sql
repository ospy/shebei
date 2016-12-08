/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50173
Source Host           : localhost:3306
Source Database       : shebei

Target Server Type    : MYSQL
Target Server Version : 50173
File Encoding         : 65001

Date: 2016-12-08 23:11:26
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for weixiu
-- ----------------------------
DROP TABLE IF EXISTS `weixiu`;
CREATE TABLE `weixiu` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `sbid` int(10) DEFAULT NULL,
  `bgren` char(10) DEFAULT NULL,
  `bgdate` datetime DEFAULT NULL,
  `wxdate` datetime DEFAULT NULL,
  `wxren` char(20) DEFAULT NULL COMMENT '维修人',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of weixiu
-- ----------------------------
INSERT INTO `weixiu` VALUES ('1', '1', '张三', '2016-12-06 20:09:37', '2016-12-07 20:09:49', '李四');
INSERT INTO `weixiu` VALUES ('2', '1', '王五', '2016-12-01 20:10:49', '2016-12-02 20:10:53', '李四');
INSERT INTO `weixiu` VALUES ('3', '2', '张三', '2016-11-14 20:11:32', '2016-11-16 20:11:36', '李六');
