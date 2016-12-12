/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50173
Source Host           : localhost:3306
Source Database       : shebei

Target Server Type    : MYSQL
Target Server Version : 50173
File Encoding         : 65001

Date: 2016-12-12 13:03:39
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `shebei`
-- ----------------------------
DROP TABLE IF EXISTS `shebei`;
CREATE TABLE `shebei` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `code` char(20) DEFAULT NULL COMMENT '设备编号',
  `name` char(20) DEFAULT NULL COMMENT '设备名称',
  `groupdl` char(20) DEFAULT NULL COMMENT '医保大类',
  `groupxl` char(20) DEFAULT NULL COMMENT '医保小类',
  `keshi` int(10) DEFAULT NULL COMMENT '科室',
  `xhtype` char(20) DEFAULT NULL COMMENT '设备型号',
  `pinpai` char(20) DEFAULT NULL COMMENT '品牌',
  `chandi` char(20) DEFAULT NULL COMMENT '产地',
  `peizhi` char(50) DEFAULT NULL,
  `jishuguige` char(50) DEFAULT NULL,
  `buydate` datetime DEFAULT NULL COMMENT '购买日期',
  `useyears` int(10) DEFAULT NULL,
  `begindate` datetime DEFAULT NULL,
  `sbleixing` char(10) DEFAULT NULL COMMENT '设备类型',
  `ccbianhao` char(20) DEFAULT NULL COMMENT '出厂编号',
  `bjiliang` bit(1) DEFAULT NULL COMMENT '是否是计量设备',
  `chuchangdate` datetime DEFAULT NULL COMMENT '出厂日期',
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
  `jingxiaoshang` char(50) DEFAULT NULL COMMENT '经销商',
  `sbdengji` int(5) DEFAULT NULL COMMENT '设备等级',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of shebei
-- ----------------------------
INSERT INTO `shebei` VALUES ('1', 'LCX01', '医用血液冷藏箱\r\n', '3|辅助设备', '306|血库设备', '12', 'HXC-158', '海尔', '中国', '标配', '未知', '2016-12-02 16:35:55', '5', '2016-12-08 16:36:14', null, null, null, null, null, '1', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `shebei` VALUES ('2', 'LCX02', '医用冷藏箱', '3|辅助设备', '302|制冷设备', '12', 'HYC-68', '海尔', '中国', '标配', '未知', '2016-11-23 17:01:39', '5', '2016-12-08 17:01:47', null, null, null, null, null, '1', null, null, null, null, null, null, null, null, null, null);
