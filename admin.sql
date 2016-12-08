/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50173
Source Host           : localhost:3306
Source Database       : shebei

Target Server Type    : MYSQL
Target Server Version : 50173
File Encoding         : 65001

Date: 2016-12-07 17:20:00
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `admin`
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin` (
  `id` int(9) NOT NULL AUTO_INCREMENT,
  `user` varchar(10) NOT NULL,
  `password` varchar(40) NOT NULL,
  `email` varchar(20) NOT NULL,
  `date` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of admin
-- ----------------------------
INSERT INTO `admin` VALUES ('1', 'zhangsan1', '', 'werw@163.com', '2016-12-06 20:35:45');
INSERT INTO `admin` VALUES ('2', 'lisi2', '', 'werw@163.com', '2016-12-05 20:36:37');
INSERT INTO `admin` VALUES ('3', 'zhangsan3', '', 'werw@163.com', '2016-12-07 20:35:45');
INSERT INTO `admin` VALUES ('4', 'lisi4', '', 'werw@163.com', '2016-12-04 20:36:37');
INSERT INTO `admin` VALUES ('5', 'zhangsan5', '', 'werw@163.com', '2016-12-02 20:35:45');
INSERT INTO `admin` VALUES ('6', 'lisi6', '', 'werw@163.com', '2016-12-01 20:36:37');
INSERT INTO `admin` VALUES ('7', 'zhangsan7', '', 'werw@163.com', '2016-12-08 20:35:45');
INSERT INTO `admin` VALUES ('8', 'lisi8', '', 'werw@163.com', '2016-12-09 20:36:37');
INSERT INTO `admin` VALUES ('9', 'zhangsan9', '', 'werw@163.com', '2016-12-06 20:35:45');
INSERT INTO `admin` VALUES ('10', 'lisi10', '', 'werw@163.com', '2016-12-05 20:36:37');
INSERT INTO `admin` VALUES ('11', 'zhangsan11', '', 'werw@163.com', '2016-12-06 20:35:45');
INSERT INTO `admin` VALUES ('12', 'lisi12', '', 'werw@163.com', '2016-12-05 20:36:37');
INSERT INTO `admin` VALUES ('13', 'zhangsan13', '', 'werw@163.com', '2016-12-06 20:35:45');
INSERT INTO `admin` VALUES ('14', 'lisi14', '', 'werw@163.com', '2016-12-05 20:36:37');
INSERT INTO `admin` VALUES ('15', 'zhangsan15', '', 'werw@163.com', '2016-12-06 20:35:45');
INSERT INTO `admin` VALUES ('16', 'lisi16', '', 'werw@163.com', '2016-12-05 20:36:37');
INSERT INTO `admin` VALUES ('17', 'zhangsan17', '', 'werw@163.com', '2016-12-06 20:35:45');
INSERT INTO `admin` VALUES ('18', 'lisi18', '', 'werw@163.com', '2016-12-05 20:36:37');
