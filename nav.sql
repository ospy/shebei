/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50173
Source Host           : localhost:3306
Source Database       : shebei

Target Server Type    : MYSQL
Target Server Version : 50173
File Encoding         : 65001

Date: 2016-12-08 17:26:27
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `nav`
-- ----------------------------
DROP TABLE IF EXISTS `nav`;
CREATE TABLE `nav` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `text` char(20) DEFAULT NULL,
  `state` char(10) DEFAULT NULL,
  `iconCls` char(20) DEFAULT NULL,
  `url` char(50) DEFAULT NULL,
  `nid` int(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of nav
-- ----------------------------
INSERT INTO `nav` VALUES ('1', '系统模块', 'closed', 'icon-tip', null, '0');
INSERT INTO `nav` VALUES ('2', '管理员管理', 'open', 'icon-tip', 'manager', '1');
INSERT INTO `nav` VALUES ('3', '会员模块', 'closed', 'icon-man', null, '0');
INSERT INTO `nav` VALUES ('4', '会员管理', 'open', 'icon-man', 'useradmin', '3');
INSERT INTO `nav` VALUES ('5', '科室设置', 'closed', 'icon-tip', null, '0');
INSERT INTO `nav` VALUES ('6', '科室管理', 'open', 'icon-tip', 'admin/keshi', '5');
INSERT INTO `nav` VALUES ('7', '设备管理', 'closed', 'icon-tip', null, '0');
INSERT INTO `nav` VALUES ('8', '综合管理', 'open', 'icon-tip', 'admin/shebei', '7');
