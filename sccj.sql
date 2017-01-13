/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50173
Source Host           : localhost:3306
Source Database       : shebei

Target Server Type    : MYSQL
Target Server Version : 50173
File Encoding         : 65001

Date: 2017-01-13 09:05:04
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `sccj`
-- ----------------------------
DROP TABLE IF EXISTS `sccj`;
CREATE TABLE `sccj` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `CBM` varchar(5) NOT NULL,
  `cjname` varchar(60) DEFAULT NULL,
  `CPYM` varchar(50) DEFAULT NULL,
  `CGB` varchar(8) DEFAULT NULL,
  `CDWDZ` varchar(40) DEFAULT NULL,
  `CDWYB` varchar(6) DEFAULT NULL,
  `CLXR` varchar(8) DEFAULT NULL,
  `CDH` varchar(15) DEFAULT NULL,
  `BENABLE` tinyint(4) DEFAULT NULL,
  `IKWZL` int(11) DEFAULT NULL,
  `CBZ` varchar(100) DEFAULT NULL,
  `CZLG` varchar(60) DEFAULT NULL,
  `CDAH` varchar(30) DEFAULT NULL,
  `CQQ` varchar(30) DEFAULT NULL,
  `CEmail` varchar(60) DEFAULT NULL,
  `CCZ` varchar(20) DEFAULT NULL,
  `CSJCJ` varchar(60) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sccj
-- ----------------------------
INSERT INTO `sccj` VALUES ('1', '01', '成都欧赛医疗器械有限公司', 'CDOSYLQXYXGS', '', '', '', '', '', '0', '8', null, '', '', '', '', '', '');
INSERT INTO `sccj` VALUES ('2', '02', '东丽株式会社', 'DLZSHS', '', '', '', '', '', '1', '8', null, '', '', '', '', '', '');
INSERT INTO `sccj` VALUES ('3', '03', '贝恩医疗设备广州有限公司', 'BEYLSBGZYXGS', '', '', '', '', '', '1', '8', null, '', '', '', '', '', '');
INSERT INTO `sccj` VALUES ('4', '04', '马来西亚', 'MLXY', '', '', '', '', '', '1', '8', null, '', '', '', '', '', '');
INSERT INTO `sccj` VALUES ('5', '05', '成都新津事丰医疗公司', 'CDXJSFYLGS', '', '', '', '', '', '1', '8', null, '', '', '', '', '', '');
INSERT INTO `sccj` VALUES ('6', '06', '湖北达医疗公司', 'HBDYLGS', '', '', '', '', '', '1', '8', null, '', '', '', '', '', '');
INSERT INTO `sccj` VALUES ('7', '07', '苏州碧迪医疗公司', 'SZBDYLGS', '', '', '', '', '', '1', '8', null, '', '', '', '', '', '');
INSERT INTO `sccj` VALUES ('8', '08', '广州百合医疗科技', 'GZBHYLKJ', '', '', '', '', '', '1', '8', null, '', '', '', '', '', '');
INSERT INTO `sccj` VALUES ('9', '09', '珠海丽珠公司', 'ZHLZGS', '', '', '', '', '', '1', '8', null, '', '', '', '', '', '');
INSERT INTO `sccj` VALUES ('10', '10', '宁波天益医疗器械有限公司', 'NBTYYLQXYXGS', '', '', '', '', '', '1', '8', null, '', '', '', '', '', '');
INSERT INTO `sccj` VALUES ('11', '11', '佛山特种医用导管有限公司', 'FSTCYYDGYXGS', '', '', '', '', '', '1', '8', null, '', '', '', '', '', '');
INSERT INTO `sccj` VALUES ('12', '12', '河南曙光健士医疗', 'HNSGJSYL', '', '', '', '', '', '1', '8', null, '', '', '', '', '', '');
INSERT INTO `sccj` VALUES ('13', '13', '广东丽珠公司', 'GDLZGS', '', '', '', '', '', '1', '8', null, '', '', '', '', '', '');
INSERT INTO `sccj` VALUES ('14', '14', '济宁市恒泰医疗用品有限公司', 'JNSHTYLYPYXGS', '', '', '', '', '', '1', '8', null, '', '', '', '', '', '');
INSERT INTO `sccj` VALUES ('15', '15', '石家庄采柏生物技术', 'SJZCBSWJS', '', '', '', '', '', '1', '8', null, '', '', '', '', '', '');
INSERT INTO `sccj` VALUES ('16', '16', '江苏鱼跃医疗设备有限公司', 'JSYYYLSBYXGS', '', '', '', '', '', '1', '8', null, '', '', '', '', '', '');
INSERT INTO `sccj` VALUES ('17', '17', '泰州市美诺医疗器械有限公司', 'TZSMNYLQXYXGS', '', '', '', '', '', '1', '8', null, '', '', '', '', '', '');
INSERT INTO `sccj` VALUES ('18', '18', '成都明森医疗器械有限公司', 'CDMSYLQXYXGS', '', '', '', '', '', '1', '8', null, '', '', '', '', '', '');
INSERT INTO `sccj` VALUES ('19', '19', '深圳迈瑞', 'SZMR', '', '', '', '', '', '1', '8', null, '', '', '', '', '', '');
INSERT INTO `sccj` VALUES ('20', '20', '希森美康', 'XSMK', '', '', '', '', '', '1', '8', null, '', '', '', '', '', '');
INSERT INTO `sccj` VALUES ('21', '21', '利尔康', 'LEK', '', '', '', '', '', '1', '8', null, '', '', '', '', '', '');
INSERT INTO `sccj` VALUES ('22', '22', '大连JMS医疗器具有限公司', 'DLJMSYLQJYXGS', '', '', '', '', '', '1', '8', null, '', '', '', '', '', '');
INSERT INTO `sccj` VALUES ('23', '23', '费森尤斯医疗用品集团公司', 'FSYSYLYPJTGS', '', '', '', '', '', '1', '8', null, '', '', '', '', '', '');
INSERT INTO `sccj` VALUES ('24', '24', 'Gambro Dialysatoren GmbH', 'GAMBRO DIALYSATOREN GMBH', '', '', '', '', '', '1', '8', null, '', '', '', '', '', '');
INSERT INTO `sccj` VALUES ('25', '25', 'Fresernius Medical Care AG&Co.kGaA', 'FRESERNIUS MEDICAL CARE AG&CO.KGAA', '', '', '', '', '', '1', '8', null, '', '', '', '', '', '');
INSERT INTO `sccj` VALUES ('26', '26', '成都市科龙化工试剂厂', 'CDSKLHGSJC', '', '', '', '', '', '1', '8', null, '', '', '', '', '', '');
INSERT INTO `sccj` VALUES ('27', '27', '上海利康消毒高科技有限公司', 'SHLKXDGKJYXGS', '', '', '', '', '', '1', '8', null, '', '', '', '', '', '');
INSERT INTO `sccj` VALUES ('28', '28', '江苏华飞医疗科技有限公司', 'JSHFYLKJYXGS', '', '', '', '', '', '1', '8', null, '', '', '', '', '', '');
INSERT INTO `sccj` VALUES ('29', '29', '深圳锦瑞', 'SZJR', '', '', '', '', '', '1', '8', null, '', '', '', '', '', '');
INSERT INTO `sccj` VALUES ('30', '30', '上海科华', 'SHKH', '', '', '', '', '', '1', '8', null, '', '', '', '', '', '');
INSERT INTO `sccj` VALUES ('31', '31', '迈克生物', 'MKSW', '', '', '', '', '', '1', '8', null, '', '', '', '', '', '');
INSERT INTO `sccj` VALUES ('32', '32', '北京万华', 'BJWH', '', '', '', '', '', '1', '8', null, '', '', '', '', '', '');
INSERT INTO `sccj` VALUES ('33', '33', '上海血液', 'SHXY', '', '', '', '', '', '1', '8', null, '', '', '', '', '', '');
INSERT INTO `sccj` VALUES ('34', '34', '北京金豪', 'BJJH', '', '', '', '', '', '1', '8', null, '', '', '', '', '', '');
INSERT INTO `sccj` VALUES ('35', '35', '英诺华', 'YNH', '', '', '', '', '', '1', '8', null, '', '', '', '', '', '');
INSERT INTO `sccj` VALUES ('36', '36', '浙江爱康', 'ZJAK', '', '', '', '', '', '1', '8', null, '', '', '', '', '', '');
INSERT INTO `sccj` VALUES ('37', '37', '北京源德', 'BJYD', '', '', '', '', '', '1', '8', null, '', '', '', '', '', '');
INSERT INTO `sccj` VALUES ('38', '38', '江苏永宁', 'JSYN', '', '', '', '', '', '1', '8', null, '', '', '', '', '', '');
INSERT INTO `sccj` VALUES ('39', '39', '江苏省永宁医疗有限公司', 'JSSYNYLYXGS', '', '', '', '', '', '1', '8', null, '', '', '', '', '', '');
INSERT INTO `sccj` VALUES ('40', '40', '江西科伦医疗器械制造有限公司', 'JXKLYLQXZZYXGS', '', '', '', '', '', '1', '8', null, '', '', '', '', '', '');
INSERT INTO `sccj` VALUES ('41', '41', '岳阳民康医用材料有限公司', 'YYMKYYCLYXGS', '', '', '', '', '', '1', '8', null, '', '', '', '', '', '');
INSERT INTO `sccj` VALUES ('42', '42', '山东新华医疗生物技术有限公司', 'SDXHYLSWJSYXGS', '', '', '', '', '', '1', '8', null, '', '', '', '', '', '');
INSERT INTO `sccj` VALUES ('43', '43', '山东新华医疗器械股份有限公司', 'SDXHYLQXGFYXGS', '', '', '', '', '', '1', '8', null, '', '', '', '', '', '');
