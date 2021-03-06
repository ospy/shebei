/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50173
Source Host           : localhost:3306
Source Database       : shebei

Target Server Type    : MYSQL
Target Server Version : 50173
File Encoding         : 65001

Date: 2016-12-12 22:47:54
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for admin
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
INSERT INTO `admin` VALUES ('1', 'zhangsan', '', 'werw@163.com', '2016-12-06 20:35:45');
INSERT INTO `admin` VALUES ('2', 'lisi', '', 'werw@163.com', '2016-12-05 20:36:37');
INSERT INTO `admin` VALUES ('3', 'zhangsan3', '', 'werw@163.com', '2016-12-06 20:35:45');
INSERT INTO `admin` VALUES ('4', 'lisi4', '', 'werw@163.com', '2016-12-05 20:36:37');
INSERT INTO `admin` VALUES ('5', 'zhangsan5', '', 'werw@163.com', '2016-12-06 20:35:45');
INSERT INTO `admin` VALUES ('6', 'lisi6', '', 'werw@163.com', '2016-12-05 20:36:37');
INSERT INTO `admin` VALUES ('7', 'zhangsan7', '', 'werw@163.com', '2016-12-06 20:35:45');
INSERT INTO `admin` VALUES ('8', 'lisi8', '', 'werw@163.com', '2016-12-05 20:36:37');
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

-- ----------------------------
-- Table structure for jingxiaoshang
-- ----------------------------
DROP TABLE IF EXISTS `jingxiaoshang`;
CREATE TABLE `jingxiaoshang` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `jxsname` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of jingxiaoshang
-- ----------------------------
INSERT INTO `jingxiaoshang` VALUES ('1', '经销商1');
INSERT INTO `jingxiaoshang` VALUES ('2', '经销商2');
INSERT INTO `jingxiaoshang` VALUES ('3', '经销商3');
INSERT INTO `jingxiaoshang` VALUES ('4', '经销商4');

-- ----------------------------
-- Table structure for keshi
-- ----------------------------
DROP TABLE IF EXISTS `keshi`;
CREATE TABLE `keshi` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `keshiname` char(20) NOT NULL,
  `keshimanager` char(20) NOT NULL,
  `keshiposition` char(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of keshi
-- ----------------------------
INSERT INTO `keshi` VALUES ('1', '一病区', '彭建群', '5楼');
INSERT INTO `keshi` VALUES ('2', '血透一部', '李宪超', '2楼');
INSERT INTO `keshi` VALUES ('3', '血透二部', '周忠群', '3楼');
INSERT INTO `keshi` VALUES ('4', '血透三部', '曾清', '3楼');
INSERT INTO `keshi` VALUES ('5', '二病区', '任启蓉', '6楼');
INSERT INTO `keshi` VALUES ('6', '检验科', '李志珍', '1楼');
INSERT INTO `keshi` VALUES ('7', '护理院', '李春芳', '7楼');

-- ----------------------------
-- Table structure for nav
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

-- ----------------------------
-- Table structure for sccj
-- ----------------------------
DROP TABLE IF EXISTS `sccj`;
CREATE TABLE `sccj` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `cjname` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sccj
-- ----------------------------
INSERT INTO `sccj` VALUES ('1', '山东新华医疗器械有限公司');
INSERT INTO `sccj` VALUES ('2', '厂家2');
INSERT INTO `sccj` VALUES ('3', '厂家3');

-- ----------------------------
-- Table structure for shebei
-- ----------------------------
DROP TABLE IF EXISTS `shebei`;
CREATE TABLE `shebei` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `sbcode` char(20) DEFAULT NULL COMMENT '设备编号',
  `sbname` char(20) DEFAULT NULL COMMENT '设备名称',
  `groupdl` char(20) DEFAULT NULL COMMENT '医保大类',
  `groupxl` char(20) DEFAULT NULL COMMENT '医保小类',
  `sykeshi` int(10) DEFAULT NULL COMMENT '科室',
  `xhtype` char(20) DEFAULT NULL COMMENT '设备型号',
  `pinpai` char(20) DEFAULT NULL COMMENT '品牌',
  `chandi` char(20) DEFAULT NULL COMMENT '产地',
  `peizhi` char(50) DEFAULT NULL,
  `jishuguige` char(50) DEFAULT NULL,
  `buydate` date DEFAULT NULL COMMENT '购买日期',
  `useyears` int(10) DEFAULT NULL,
  `begindate` date DEFAULT NULL,
  `sbleixing` char(10) DEFAULT NULL COMMENT '设备类型',
  `ccbianhao` char(20) DEFAULT NULL COMMENT '出厂编号',
  `bjiliang` char(5) DEFAULT NULL COMMENT '是否是计量设备',
  `chuchangdate` date DEFAULT NULL COMMENT '出厂日期',
  `sscj` int(5) DEFAULT NULL COMMENT '生产厂家',
  `shuliang` int(5) DEFAULT '1' COMMENT '数量',
  `danwei` char(1) DEFAULT NULL COMMENT '单位',
  `danjia` double(10,2) DEFAULT NULL COMMENT '单价',
  `beizhu` varchar(500) DEFAULT NULL COMMENT '备注',
  `syzhuangtai` char(20) DEFAULT NULL COMMENT '使用状态',
  `didian` char(20) DEFAULT NULL COMMENT '存放地点',
  `glfenlei` char(20) DEFAULT NULL,
  `glfenleibm` char(20) DEFAULT NULL,
  `glfenleimc` char(50) DEFAULT NULL,
  `jingxiaoshang` int(50) DEFAULT NULL COMMENT '经销商',
  `sbdengji` int(5) DEFAULT NULL COMMENT '设备等级',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of shebei
-- ----------------------------
INSERT INTO `shebei` VALUES ('1', 'LCX01', '医用血液冷藏箱\r\n', '3|辅助设备', '306|血库设备', '2', 'HXC-158', '海尔', '中国', '标配', '未知', '2016-12-01', '5', '2016-12-01', null, null, null, '2016-12-01', '1', '1', null, null, null, null, null, null, null, null, '4', '3');
INSERT INTO `shebei` VALUES ('2', 'LCX02', '医用冷藏箱', '3|辅助设备', '302|制冷设备', '2', 'HYC-68', '海尔', '中国', '标配', '未知', '2016-12-01', '5', '2016-12-01', null, null, null, '2016-12-01', '1', '1', null, '100.00', null, null, null, null, null, null, '3', '3');
INSERT INTO `shebei` VALUES ('3', '', '', '故障维修', '故障维修', '1', '', '', '', '', '', '2016-12-01', '5', '2016-12-03', '专用设备', '', 'null', '2016-12-02', '1', '1', '', '0.00', '', '', '', '', '', '', '2', '3');
INSERT INTO `shebei` VALUES ('4', '', '', '故障维修', '故障维修', '3', '', '', '', '', '', '0000-00-00', '5', '2016-12-06', '专用设备', '', 'null', '2016-11-28', '2', '1', '', '0.00', '', '', '', '', '', '', '3', '3');
INSERT INTO `shebei` VALUES ('5', '特殊t', '', '故障维修', '故障维修', '7', '', '', '', '', '', '0000-00-00', '5', '0000-00-00', '专用设备', '', 'null', '0000-00-00', '1', '1', '', '0.00', '', '', '', '', '', '', '4', '2');

-- ----------------------------
-- Table structure for weixiu
-- ----------------------------
DROP TABLE IF EXISTS `weixiu`;
CREATE TABLE `weixiu` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `sbid` int(10) DEFAULT NULL,
  `bxren` char(10) DEFAULT NULL,
  `bxdate` datetime DEFAULT NULL,
  `wxdate` datetime DEFAULT NULL,
  `wxren` char(20) DEFAULT NULL COMMENT '维修人',
  `ysren` char(20) DEFAULT NULL,
  `ysdate` datetime DEFAULT NULL,
  `wxzhuangtai` char(20) DEFAULT NULL,
  `wxleixing` char(20) DEFAULT NULL,
  `wxkeshi` int(10) DEFAULT NULL,
  `wxjine` double(10,2) DEFAULT NULL,
  `wxyuanyin` varchar(500) DEFAULT NULL,
  `wxneirong` varchar(500) DEFAULT NULL,
  `yanshoujilu` varchar(500) DEFAULT NULL,
  `beizhu` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of weixiu
-- ----------------------------
INSERT INTO `weixiu` VALUES ('1', '1', '张三', '2016-12-06 20:09:37', '2016-12-07 20:09:49', '李四', null, null, null, null, '2', null, null, null, null, null);
INSERT INTO `weixiu` VALUES ('2', '1', '王五', '2016-12-01 20:10:49', '2016-12-02 20:10:53', '李四', null, null, null, null, '2', null, null, null, null, null);
INSERT INTO `weixiu` VALUES ('3', '2', '张三', '2016-11-14 20:11:32', '2016-11-16 20:11:36', '李六', '验收人', '2016-12-07 00:00:00', '已结束', '保养', '2', '10.23', '常规保养', '保养主机', '合格', '未出发票');
INSERT INTO `weixiu` VALUES ('4', '2', '报修人', '2016-12-08 17:09:32', '2016-12-09 17:09:46', '维修人', '验收人员', '2016-12-10 00:00:00', '已结束', '保养', '5', '10.00', '保养原因', '保养内容', '验收记录', '备注');
INSERT INTO `weixiu` VALUES ('5', '2', '', '2016-12-07 17:25:23', '2016-12-08 17:25:26', '', '', '2016-12-09 00:00:00', '在修', '故障维修', '2', '20.00', '', '', '', '');
INSERT INTO `weixiu` VALUES ('6', '2', 'ces', '2016-12-06 22:37:46', '0000-00-00 00:00:00', '', '', '0000-00-00 00:00:00', '在修', '故障维修', '7', '256.67', '', '', '', '');
INSERT INTO `weixiu` VALUES ('7', '3', 'test', '2016-12-01 21:45:45', '0000-00-00 00:00:00', '', '', '0000-00-00 00:00:00', '在修', '故障维修', '2', '0.00', '', '', '', '');
INSERT INTO `weixiu` VALUES ('8', '3', 'test', '2016-12-06 22:20:14', '0000-00-00 00:00:00', '', '', '0000-00-00 00:00:00', '在修', '故障维修', '2', '0.00', '', '', '', '');
