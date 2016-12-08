/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50173
Source Host           : localhost:3306
Source Database       : shebei

Target Server Type    : MYSQL
Target Server Version : 50173
File Encoding         : 65001

Date: 2016-12-08 17:26:14
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `shebei`
-- ----------------------------
DROP TABLE IF EXISTS `shebei`;
CREATE TABLE `shebei` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `code` char(20) DEFAULT NULL,
  `name` char(20) DEFAULT NULL,
  `groupdl` char(20) DEFAULT NULL,
  `groupxl` char(20) DEFAULT NULL,
  `keshi` int(10) DEFAULT NULL,
  `xhtype` char(20) DEFAULT NULL COMMENT '是否大型设备标识',
  `pinpai` char(20) DEFAULT NULL,
  `chandi` char(20) DEFAULT NULL,
  `peizhi` char(50) DEFAULT NULL,
  `jishuguige` char(50) DEFAULT NULL,
  `buydate` datetime DEFAULT NULL COMMENT '购买日期',
  `useyears` int(10) DEFAULT NULL,
  `begindate` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of shebei
-- ----------------------------
INSERT INTO `shebei` VALUES ('1', 'LCX01', '医用血液冷藏箱\r\n', '3|辅助设备', '306|血库设备', '12', 'HXC-158', '海尔', '中国', '标配', '未知', '2016-12-02 16:35:55', '5', '2016-12-08 16:36:14');
INSERT INTO `shebei` VALUES ('2', 'LCX02', '医用冷藏箱', '3|辅助设备', '302|制冷设备', '12', 'HYC-68', '海尔', '中国', '标配', '未知', '2016-11-23 17:01:39', '5', '2016-12-08 17:01:47');
