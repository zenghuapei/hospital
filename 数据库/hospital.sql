/*
Navicat MySQL Data Transfer

Source Server         : mysql
Source Server Version : 50540
Source Host           : localhost:3306
Source Database       : test

Target Server Type    : MYSQL
Target Server Version : 50540
File Encoding         : 65001

Date: 2016-04-19 20:51:52
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for booking
-- ----------------------------
DROP TABLE IF EXISTS `booking`;
CREATE TABLE `booking` (
  `booking_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '预约信息ID',
  `booking_state` varchar(20) DEFAULT NULL COMMENT '预约状态',
  `booknow` datetime DEFAULT NULL COMMENT '挂号时间',
  `doctor_id` int(11) DEFAULT NULL COMMENT '医生ID',
  `user_id` int(11) DEFAULT NULL COMMENT '用户ID',
  `book_name` varchar(50) DEFAULT NULL COMMENT '姓名',
  `book_idCard` varchar(18) DEFAULT NULL COMMENT '身份证号',
  `book_num` varchar(12) DEFAULT NULL COMMENT '电话',
  `book_address` varchar(100) DEFAULT NULL COMMENT '地址',
  `book_xuhao` int(11) DEFAULT NULL COMMENT '序号',
  PRIMARY KEY (`booking_id`)
) ENGINE=MyISAM AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of booking
-- ----------------------------
INSERT INTO `booking` VALUES ('12', '取号成功', '2016-04-04 22:54:47', '1', '36', 'GFFDGDF', '45654645', '345345', 'FDGDFGDF', '1');
INSERT INTO `booking` VALUES ('13', '取号成功', '2016-04-07 20:22:43', '1', '36', 'gffdhfdghgf', '54645645', '3434535', 'dfsgsdgs', '1');
INSERT INTO `booking` VALUES ('14', '取号成功', '2016-04-07 20:23:54', '1', '36', 'dfgdsgd', '34545345', 'd2334324', 'fsdfsdfsdfs', '2');
INSERT INTO `booking` VALUES ('15', '取号成功', '2016-04-18 21:15:53', '1', null, 'sdfsdfs', '234234', '3423', 'sdfsda', null);
INSERT INTO `booking` VALUES ('16', '取号成功', '2016-04-18 21:17:57', '1', null, 'dfgdfs', '34534', '34534', 'dfgsdg', null);
INSERT INTO `booking` VALUES ('17', '预约成功', '2016-04-19 20:50:18', '1', '35', 'fdgdfsg', '343534543', '345345345', 'dfgsgse', null);

-- ----------------------------
-- Table structure for doctor_info
-- ----------------------------
DROP TABLE IF EXISTS `doctor_info`;
CREATE TABLE `doctor_info` (
  `doctor_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '医生ID',
  `doctor_brief` varchar(2000) NOT NULL COMMENT '简介',
  `doctor_code` varchar(12) DEFAULT NULL COMMENT '医生编号',
  `doctor_name` varchar(20) DEFAULT NULL COMMENT '医生姓名',
  `doctor_pic` varchar(200) DEFAULT NULL COMMENT '医生照片',
  `doctor_post` varchar(10) DEFAULT NULL COMMENT '职称',
  `doctor_sex` varchar(10) DEFAULT NULL COMMENT '医生性别',
  `doctor_specialty` varchar(30) DEFAULT NULL COMMENT '专业名称',
  `doctor_type` varchar(10) DEFAULT NULL COMMENT '医生类别',
  `doctor_xl` varchar(30) DEFAULT NULL COMMENT '学历',
  `doctor_years` int(5) DEFAULT NULL COMMENT '从医年数',
  `email` varchar(30) DEFAULT NULL COMMENT 'e-mail',
  `subject_id` int(11) DEFAULT NULL COMMENT '科室ID',
  PRIMARY KEY (`doctor_id`)
) ENGINE=MyISAM AUTO_INCREMENT=39 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of doctor_info
-- ----------------------------
INSERT INTO `doctor_info` VALUES ('1', '擅长自体及异基因造血干细胞移植治疗白血病、淋巴瘤、多发性骨髓瘤等恶性血液病', '1017', '王劲', null, '副主任医师', '男', 'sdfsd6', 'sfdsf6', '本科', '10', 'sdfsd', '5');
INSERT INTO `doctor_info` VALUES ('2', 'xfdsfsdfs', '1018', '技术', null, '普通医师', '女', 'dfd', 'dfd', '本科', '5', 'dfd', '5');
INSERT INTO `doctor_info` VALUES ('3', '', '1001', '技术1', null, '普通医师', '女', null, null, '本科', '5', 'dfd', '5');
INSERT INTO `doctor_info` VALUES ('30', '地方大师傅士大夫的', null, '地方大师', null, '电费', '男', '放过', '巅峰时代', '电费', '5', '45453', '7');
INSERT INTO `doctor_info` VALUES ('31', '地方大师傅士大夫的', null, '地方大师', null, '电费', '男', '放过', '巅峰时代', '电费', '5', '45453', '7');
INSERT INTO `doctor_info` VALUES ('33', '打发士大夫', null, '大师傅似的', null, '士大夫', '男', '巅峰时代', '似的发射点', '电风扇', '5', '343534', '7');
INSERT INTO `doctor_info` VALUES ('14', '', '1002', '技术2', null, '普通医师', '女', null, null, '本科', '5', 'dfd', '5');
INSERT INTO `doctor_info` VALUES ('15', '', '1003', '技术3', null, '普通医师', '女', null, null, '本科', '5', 'dfd', '6');
INSERT INTO `doctor_info` VALUES ('16', '', '1004', '技术4', null, '普通医师', '女', null, null, '本科', '5', 'dfd', '6');
INSERT INTO `doctor_info` VALUES ('17', '', '1005', '技术5', null, '普通医师', '女', null, null, '本科', '5', 'dfd', '7');
INSERT INTO `doctor_info` VALUES ('18', '', '1006', '技术6', null, '普通医师', '女', null, null, '本科', '5', 'dfd', '7');
INSERT INTO `doctor_info` VALUES ('19', '', '1007', '技术7', null, '普通医师', '女', null, null, '本科', '5', 'dfd', '8');
INSERT INTO `doctor_info` VALUES ('20', '', '1008', '技术8', null, '普通医师', '女', null, null, '本科', '5', 'dfd', '8');
INSERT INTO `doctor_info` VALUES ('21', '', '1009', '技术9', null, '普通医师', '女', null, null, '本科', '5', 'dfd', '9');
INSERT INTO `doctor_info` VALUES ('22', '', '1010', '技术10', null, '普通医师', '女', null, null, '本科', '5', 'dfd', '9');
INSERT INTO `doctor_info` VALUES ('23', '', '1011', '技术11', null, '普通医师', '女', null, null, '本科', '5', 'dfd', '10');
INSERT INTO `doctor_info` VALUES ('24', '', '1012', '技术12', null, '普通医师', '女', null, null, '本科', '5', 'dfd', '10');
INSERT INTO `doctor_info` VALUES ('25', '', '1013', '技术13', null, '普通医师', '女', null, null, '本科', '5', 'dfd', '11');
INSERT INTO `doctor_info` VALUES ('26', '', '1014', '技术14', null, '普通医师', '女', null, null, '本科', '5', 'dfd', '11');
INSERT INTO `doctor_info` VALUES ('27', '', '1015', '技术15', null, '普通医师', '女', null, null, '本科', '5', 'dfd', '12');
INSERT INTO `doctor_info` VALUES ('28', '', '1016', '技术16', null, '普通医师', '女', null, null, '本科', '5', 'dfd', '12');
INSERT INTO `doctor_info` VALUES ('35', 'sdfdsfds', null, 'sdfsdf', null, 'dsfds', '女', 'dfsdf', 'sdfsdf', 'fdsfds', '55', 'dfsdf', '7');
INSERT INTO `doctor_info` VALUES ('36', 'dsfsdfsd', null, '45', null, 'dsfsd', '女', 'sdfsd', 'sdfsd', 'dfsd', '4', 'sdfds', '7');
INSERT INTO `doctor_info` VALUES ('37', 'fdsfsdf', null, '34', null, 'sdfd', '男', 'sdfsdf', 'sdfds', 'dfsd', '4', 'sdfsd', '5');
INSERT INTO `doctor_info` VALUES ('38', 'fgfdgfdgf', null, '56', null, 'fgdf', '男', 'fg', 'dfg', 'fgdf', '4', 'fgdfgdf', '7');

-- ----------------------------
-- Table structure for duty_info
-- ----------------------------
DROP TABLE IF EXISTS `duty_info`;
CREATE TABLE `duty_info` (
  `duty_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '值班信息ID',
  `duty_time` varchar(20) DEFAULT NULL COMMENT '值班时间',
  `duty_interval` varchar(30) DEFAULT NULL COMMENT '时间间隔',
  `doctor_id` int(11) DEFAULT NULL COMMENT '医生ID',
  `max_booknum` int(11) DEFAULT NULL COMMENT '最大预约数',
  `subject_id` int(11) DEFAULT NULL COMMENT '科室ID',
  `duty_date` date DEFAULT NULL COMMENT '出诊日期',
  `subject_PrentId` int(11) DEFAULT NULL,
  PRIMARY KEY (`duty_id`)
) ENGINE=MyISAM AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of duty_info
-- ----------------------------
INSERT INTO `duty_info` VALUES ('14', '8:00-12:00', '星期二', '1', '2', '5', '2016-04-19', '1');

-- ----------------------------
-- Table structure for menu
-- ----------------------------
DROP TABLE IF EXISTS `menu`;
CREATE TABLE `menu` (
  `menu_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '菜单ID',
  `menu_name` varchar(30) DEFAULT NULL COMMENT '菜单名称',
  `menu_url` varchar(30) DEFAULT NULL COMMENT '菜单连接',
  `parent_id` int(11) DEFAULT NULL COMMENT '父级ID',
  `menu_desc` int(11) DEFAULT NULL COMMENT '排序号',
  PRIMARY KEY (`menu_id`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of menu
-- ----------------------------
INSERT INTO `menu` VALUES ('1', '医生信息管理', '/view/doctorInfoList.jsp', '5', '1');
INSERT INTO `menu` VALUES ('2', '用户信息管理', '/view/userInfoList.jsp', '5', '2');
INSERT INTO `menu` VALUES ('3', '预约信息管理', '/view/bookingList.jsp', '5', '3');
INSERT INTO `menu` VALUES ('4', '管理员信息管理', '/view/userAdminList.jsp', '5', '4');
INSERT INTO `menu` VALUES ('5', '系统功能', null, '0', null);
INSERT INTO `menu` VALUES ('6', '科室信息管理', '/view/subjectList.jsp', '5', '5');
INSERT INTO `menu` VALUES ('7', '窗口挂号', '/view/registered.jsp', '5', '6');
INSERT INTO `menu` VALUES ('8', '值班信息管理', '/view/dutyList.jsp', '5', '7');

-- ----------------------------
-- Table structure for subject
-- ----------------------------
DROP TABLE IF EXISTS `subject`;
CREATE TABLE `subject` (
  `subject_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '科室ID',
  `subject_describe` varchar(2000) DEFAULT NULL COMMENT '科室描述',
  `subject_name` varchar(30) DEFAULT NULL COMMENT '科室名称',
  `parent_id` int(11) DEFAULT NULL COMMENT '父级id',
  `subject_level` int(11) DEFAULT NULL COMMENT '级别',
  PRIMARY KEY (`subject_id`)
) ENGINE=MyISAM AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of subject
-- ----------------------------
INSERT INTO `subject` VALUES ('1', null, '内科', null, '1');
INSERT INTO `subject` VALUES ('2', null, '外科', null, '1');
INSERT INTO `subject` VALUES ('3', null, '专科', null, '1');
INSERT INTO `subject` VALUES ('4', null, '其他', null, '1');
INSERT INTO `subject` VALUES ('5', '士大夫大师傅', '血液内科门诊', '1', '2');
INSERT INTO `subject` VALUES ('6', null, '心血管内科门诊', '1', '2');
INSERT INTO `subject` VALUES ('7', null, '胸外科门诊', '2', '2');
INSERT INTO `subject` VALUES ('8', null, '心血管外科门诊', '2', '2');
INSERT INTO `subject` VALUES ('9', null, '产科门诊', '3', '2');
INSERT INTO `subject` VALUES ('10', null, '儿科门诊', '3', '2');
INSERT INTO `subject` VALUES ('11', null, '肿瘤生物治疗门诊', '4', '2');
INSERT INTO `subject` VALUES ('12', null, '静脉置管护理门诊', '4', '2');
INSERT INTO `subject` VALUES ('15', null, null, null, '2');

-- ----------------------------
-- Table structure for user_admin
-- ----------------------------
DROP TABLE IF EXISTS `user_admin`;
CREATE TABLE `user_admin` (
  `admin_id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(20) DEFAULT NULL COMMENT '密码',
  `account` varchar(20) DEFAULT NULL COMMENT '账号',
  `admin_name` varchar(50) DEFAULT NULL COMMENT '姓名',
  `admin_sex` varchar(10) DEFAULT NULL COMMENT '性别',
  `admin_register` date DEFAULT NULL COMMENT '注册时间',
  PRIMARY KEY (`admin_id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user_admin
-- ----------------------------
INSERT INTO `user_admin` VALUES ('1', 'admin', 'admin', 'dfsdf', null, null);
INSERT INTO `user_admin` VALUES ('3', 'qqqqqq', 'qqqqq', 'qqqqqq', null, null);
INSERT INTO `user_admin` VALUES ('4', 'wwwwww', 'wwwwww', 'wwwwww', '女', '2016-04-16');
INSERT INTO `user_admin` VALUES ('5', 'dddddd', 'dddddd', 'dddddd', '男', '2016-04-16');

-- ----------------------------
-- Table structure for user_info
-- ----------------------------
DROP TABLE IF EXISTS `user_info`;
CREATE TABLE `user_info` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `user_name` varchar(50) DEFAULT NULL COMMENT '用户名',
  `account` varchar(50) DEFAULT NULL COMMENT '账号',
  `password` varchar(50) DEFAULT NULL COMMENT '密码',
  `sex` varchar(20) DEFAULT NULL COMMENT '性别',
  `id_card` varchar(18) DEFAULT NULL COMMENT '身份证号',
  `relationway` varchar(12) DEFAULT NULL COMMENT '联系电话',
  `address` varchar(50) DEFAULT NULL COMMENT '地址',
  `user_type` int(2) DEFAULT NULL COMMENT '用户类型',
  `user_register` datetime DEFAULT NULL COMMENT '注册时间',
  PRIMARY KEY (`user_id`)
) ENGINE=MyISAM AUTO_INCREMENT=57 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user_info
-- ----------------------------
INSERT INTO `user_info` VALUES ('54', 'd12345', 'd12345', 'd12345', null, null, '15202350749', null, '1', null);
INSERT INTO `user_info` VALUES ('55', 'w12345', 'w12345', 'w12345', null, null, '15202350745', null, '1', null);
INSERT INTO `user_info` VALUES ('35', '张三', 'admin', 'admin', null, null, null, null, '2', null);
INSERT INTO `user_info` VALUES ('36', 'dfsdfsd18', '123456', 'q123456', '男', '342342l', '15202dfd25', '重庆市dsfsds5', '1', '2016-03-30 20:43:50');
