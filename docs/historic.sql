/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50643
Source Host           : localhost:3306
Source Database       : historic

Target Server Type    : MYSQL
Target Server Version : 50643
File Encoding         : 65001

Date: 2019-04-12 17:17:36
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for admin_user
-- ----------------------------
DROP TABLE IF EXISTS `admin_user`;
CREATE TABLE `admin_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '用户表主键',
  `tenantid` int(11) NOT NULL COMMENT '租户id，0为系统用户',
  `name` varchar(20) NOT NULL COMMENT '用户名',
  `psw` varchar(32) NOT NULL COMMENT '用户密码MD5加密',
  `email` varchar(32) NOT NULL COMMENT '用户邮箱',
  `creator` int(11) NOT NULL COMMENT '创建人，0为初始化',
  `createtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  `flag` int(1) NOT NULL DEFAULT '1' COMMENT '用户状态，1启用，0禁用',
  `logintime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '最后登录时间',
  `updateuser` int(11) DEFAULT NULL COMMENT '更新者id',
  `updatetime` timestamp NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of admin_user
-- ----------------------------
INSERT INTO `admin_user` VALUES ('-1', '0', 'root', 'E10ADC3949BA59ABBE56E057F20F883E', 'carlosxiao@dr.com', '0', '2019-04-10 10:53:29', '1', '2017-04-07 22:23:15', '-1', '2019-04-10 02:53:22');

-- ----------------------------
-- Table structure for menu
-- ----------------------------
DROP TABLE IF EXISTS `menu`;
CREATE TABLE `menu` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `name` varchar(32) NOT NULL COMMENT '菜单名称',
  `url` varchar(500) DEFAULT NULL COMMENT '网址',
  `icon` varchar(20) DEFAULT NULL COMMENT '显示的图标',
  `menutype` enum('0','1','2') NOT NULL DEFAULT '0' COMMENT '类型，0 菜单，1 连接网址,2 隐藏连接',
  `display` int(11) NOT NULL DEFAULT '1' COMMENT '显示排序',
  `parentid` int(11) NOT NULL DEFAULT '0' COMMENT '父级的id，引用本表id字段',
  `creator` int(11) NOT NULL DEFAULT '0' COMMENT '创建者id，0为超级管理员',
  `createtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updateuser` int(11) DEFAULT NULL COMMENT '更新者id',
  `updatetime` timestamp NULL DEFAULT NULL COMMENT '更新时间',
  `flag` enum('0','1') NOT NULL DEFAULT '1' COMMENT '是否启用，0 禁用，1启用',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of menu
-- ----------------------------
INSERT INTO `menu` VALUES ('1', '系统首页', '/admin/index', null, '2', '1', '0', '0', '2017-03-31 20:16:57', '0', null, '1');
INSERT INTO `menu` VALUES ('2', '修改密码', '/admin/user/updatepass', 'fa-wrench', '2', '0', '0', '0', '2017-04-05 21:33:39', '0', null, '1');
INSERT INTO `menu` VALUES ('3', '系统配置', '12', 'fa-wrench', '0', '1', '0', '0', '2017-03-31 20:16:43', '0', '2017-04-05 20:30:53', '1');
INSERT INTO `menu` VALUES ('4', '菜单配置', '/admin/menu', 'fa-list', '0', '1', '3', '0', '2017-03-31 20:16:45', '0', '2017-04-05 20:31:10', '1');
INSERT INTO `menu` VALUES ('5', '角色管理', '/admin/role', null, '0', '2', '3', '0', '2017-03-31 20:16:48', '0', null, '1');
INSERT INTO `menu` VALUES ('6', '角色权限', '/admin/role/menu', null, '2', '0', '3', '0', '2017-03-31 20:16:52', '0', null, '1');
INSERT INTO `menu` VALUES ('7', '用户管理', '/admin/user', null, '1', '2', '3', '0', '2017-03-31 20:16:54', '0', null, '1');
INSERT INTO `menu` VALUES ('8', '新增菜单', '/admin/menu/edit', null, '2', '0', '4', '0', '2017-03-31 20:17:01', '0', null, '1');
INSERT INTO `menu` VALUES ('9', '删除菜单', '/admin/menu/delete', null, '2', '0', '4', '0', '2017-03-31 20:17:04', '0', null, '1');
INSERT INTO `menu` VALUES ('10', '编辑角色', '/admin/role/edit', null, '2', '0', '5', '0', '2017-03-31 20:17:06', '0', null, '1');
INSERT INTO `menu` VALUES ('11', '删除角色', '/admin/role/delete', null, '2', '0', '5', '0', '2017-03-31 20:17:07', '0', null, '1');
INSERT INTO `menu` VALUES ('12', '角色资源管理', '/admin/role/menu', null, '2', '0', '5', '0', '2017-03-31 20:17:08', '0', null, '1');
INSERT INTO `menu` VALUES ('13', '编辑用户', '/admin/user/edit', null, '2', '0', '7', '0', '2017-03-31 20:17:09', '0', null, '1');
INSERT INTO `menu` VALUES ('14', '删除用户', '/admin/user/delete', null, '2', '0', '7', '0', '2017-03-31 20:17:10', '0', null, '1');
INSERT INTO `menu` VALUES ('15', '用户角色管理', '/admin/user/role', null, '2', '0', '7', '0', '2017-03-31 20:17:12', '0', null, '1');
INSERT INTO `menu` VALUES ('16', '菜单配置', '', null, '2', '0', '7', '20', '2017-04-02 11:38:28', '0', null, '1');
INSERT INTO `menu` VALUES ('17', '商品管理', '', 'fa-shopping-bag', '0', '2', '0', '-1', '2019-04-10 11:02:17', null, null, '1');
INSERT INTO `menu` VALUES ('18', '订单管理', '', 'fa-tasks', '0', '3', '0', '-1', '2019-04-10 11:02:46', null, null, '1');

-- ----------------------------
-- Table structure for role
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '角色表主键',
  `name` varchar(20) NOT NULL COMMENT '角色名称',
  `createtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `creator` int(11) DEFAULT '0' COMMENT '用户id，0为角色，有关联时则为用户的单独权限',
  `description` varchar(200) DEFAULT NULL COMMENT '角色描述',
  `updateuser` int(11) DEFAULT NULL COMMENT '更新者id',
  `updatetime` timestamp NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of role
-- ----------------------------
INSERT INTO `role` VALUES ('1', '超级用户', '2018-03-05 23:00:43', '-1', '拥有系统所有权限,不能删除', '-1', '2018-03-05 09:00:44');

-- ----------------------------
-- Table structure for role_menu
-- ----------------------------
DROP TABLE IF EXISTS `role_menu`;
CREATE TABLE `role_menu` (
  `roleid` int(11) NOT NULL COMMENT '角色id',
  `menuid` int(11) NOT NULL COMMENT '菜单id',
  `flag` int(1) NOT NULL DEFAULT '1' COMMENT '1为有权限，0为没有权限（防止以后会出现角色有权限但是个人没有权限的情况）',
  `creator` int(11) NOT NULL COMMENT '创建人，0为初始化',
  `createtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`menuid`,`roleid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of role_menu
-- ----------------------------

-- ----------------------------
-- Table structure for user_role
-- ----------------------------
DROP TABLE IF EXISTS `user_role`;
CREATE TABLE `user_role` (
  `userid` int(11) NOT NULL COMMENT '用户id',
  `roleid` int(11) NOT NULL COMMENT '角色id',
  `creator` int(11) NOT NULL COMMENT '创建人，0为初始化',
  `createtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`userid`,`roleid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of user_role
-- ----------------------------
INSERT INTO `user_role` VALUES ('-1', '1', '-1', '2018-03-05 23:37:04');


-- ----------------------------
-- Table structure for area
-- ----------------------------
DROP TABLE IF EXISTS `area`;
CREATE TABLE `area` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL COMMENT '名称',
  `parent_id` bigint(20) NOT NULL,
  `common` int(4) NOT NULL,
  `type` varchar(16) NOT NULL COMMENT '类型:省,市',
  `create_time` datetime NOT NULL COMMENT '创建时间 ',
  `update_time` datetime NOT NULL COMMENT '更新时间 ',
  PRIMARY KEY (`id`),
  UNIQUE KEY `area_name_UNIQUE` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=371 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of area
-- ----------------------------
INSERT INTO `area` VALUES ('1', '安徽省', '0', '0', 'PROVINCE', '1970-01-01 00:00:00', '1970-01-01 00:00:00');
INSERT INTO `area` VALUES ('2', '安庆市', '1', '0', 'CITY', '1970-01-01 00:00:00', '1970-01-01 00:00:00');
INSERT INTO `area` VALUES ('3', '蚌埠市', '1', '0', 'CITY', '1970-01-01 00:00:00', '1970-01-01 00:00:00');
INSERT INTO `area` VALUES ('4', '亳州市', '1', '0', 'CITY', '1970-01-01 00:00:00', '1970-01-01 00:00:00');
INSERT INTO `area` VALUES ('5', '巢湖市', '1', '0', 'CITY', '1970-01-01 00:00:00', '1970-01-01 00:00:00');
INSERT INTO `area` VALUES ('6', '池州市', '1', '0', 'CITY', '1970-01-01 00:00:00', '1970-01-01 00:00:00');
INSERT INTO `area` VALUES ('7', '滁州市', '1', '0', 'CITY', '1970-01-01 00:00:00', '1970-01-01 00:00:00');
INSERT INTO `area` VALUES ('8', '阜阳市', '1', '0', 'CITY', '1970-01-01 00:00:00', '1970-01-01 00:00:00');
INSERT INTO `area` VALUES ('9', '合肥市', '1', '0', 'CITY', '1970-01-01 00:00:00', '1970-01-01 00:00:00');
INSERT INTO `area` VALUES ('10', '淮北市', '1', '0', 'CITY', '1970-01-01 00:00:00', '1970-01-01 00:00:00');
INSERT INTO `area` VALUES ('11', '淮南市', '1', '0', 'CITY', '1970-01-01 00:00:00', '1970-01-01 00:00:00');
INSERT INTO `area` VALUES ('12', '黄山市', '1', '0', 'CITY', '1970-01-01 00:00:00', '1970-01-01 00:00:00');
INSERT INTO `area` VALUES ('13', '六安市', '1', '0', 'CITY', '1970-01-01 00:00:00', '1970-01-01 00:00:00');
INSERT INTO `area` VALUES ('14', '马鞍山市', '1', '0', 'CITY', '1970-01-01 00:00:00', '1970-01-01 00:00:00');
INSERT INTO `area` VALUES ('15', '宿州市', '1', '0', 'CITY', '1970-01-01 00:00:00', '1970-01-01 00:00:00');
INSERT INTO `area` VALUES ('16', '铜陵市', '1', '0', 'CITY', '1970-01-01 00:00:00', '1970-01-01 00:00:00');
INSERT INTO `area` VALUES ('17', '芜湖市', '1', '0', 'CITY', '1970-01-01 00:00:00', '1970-01-01 00:00:00');
INSERT INTO `area` VALUES ('18', '宣城市', '1', '0', 'CITY', '1970-01-01 00:00:00', '1970-01-01 00:00:00');
INSERT INTO `area` VALUES ('19', '香港特别行政区', '0', '0', 'PROVINCE', '1970-01-01 00:00:00', '1970-01-01 00:00:00');
INSERT INTO `area` VALUES ('20', '澳门特别行政区', '0', '0', 'PROVINCE', '1970-01-01 00:00:00', '1970-01-01 00:00:00');
INSERT INTO `area` VALUES ('21', '福建省', '0', '0', 'PROVINCE', '1970-01-01 00:00:00', '1970-01-01 00:00:00');
INSERT INTO `area` VALUES ('22', '福州市', '21', '0', 'CITY', '1970-01-01 00:00:00', '1970-01-01 00:00:00');
INSERT INTO `area` VALUES ('23', '龙岩市', '21', '0', 'CITY', '1970-01-01 00:00:00', '1970-01-01 00:00:00');
INSERT INTO `area` VALUES ('24', '南平市', '21', '0', 'CITY', '1970-01-01 00:00:00', '1970-01-01 00:00:00');
INSERT INTO `area` VALUES ('25', '宁德市', '21', '0', 'CITY', '1970-01-01 00:00:00', '1970-01-01 00:00:00');
INSERT INTO `area` VALUES ('26', '莆田市', '21', '0', 'CITY', '1970-01-01 00:00:00', '1970-01-01 00:00:00');
INSERT INTO `area` VALUES ('27', '泉州市', '21', '0', 'CITY', '1970-01-01 00:00:00', '1970-01-01 00:00:00');
INSERT INTO `area` VALUES ('28', '三明市', '21', '0', 'CITY', '1970-01-01 00:00:00', '1970-01-01 00:00:00');
INSERT INTO `area` VALUES ('29', '厦门市', '21', '0', 'CITY', '1970-01-01 00:00:00', '1970-01-01 00:00:00');
INSERT INTO `area` VALUES ('30', '漳州市', '21', '0', 'CITY', '1970-01-01 00:00:00', '1970-01-01 00:00:00');
INSERT INTO `area` VALUES ('31', '甘肃省', '0', '0', 'PROVINCE', '1970-01-01 00:00:00', '1970-01-01 00:00:00');
INSERT INTO `area` VALUES ('32', '白银市', '31', '0', 'CITY', '1970-01-01 00:00:00', '1970-01-01 00:00:00');
INSERT INTO `area` VALUES ('33', '定西市', '31', '0', 'CITY', '1970-01-01 00:00:00', '1970-01-01 00:00:00');
INSERT INTO `area` VALUES ('34', '甘南藏族自治州', '31', '0', 'CITY', '1970-01-01 00:00:00', '1970-01-01 00:00:00');
INSERT INTO `area` VALUES ('35', '嘉峪关市', '31', '0', 'CITY', '1970-01-01 00:00:00', '1970-01-01 00:00:00');
INSERT INTO `area` VALUES ('36', '金昌市', '31', '0', 'CITY', '1970-01-01 00:00:00', '1970-01-01 00:00:00');
INSERT INTO `area` VALUES ('37', '酒泉市', '31', '0', 'CITY', '1970-01-01 00:00:00', '1970-01-01 00:00:00');
INSERT INTO `area` VALUES ('38', '兰州市', '31', '0', 'CITY', '1970-01-01 00:00:00', '1970-01-01 00:00:00');
INSERT INTO `area` VALUES ('39', '临夏回族自治州', '31', '0', 'CITY', '1970-01-01 00:00:00', '1970-01-01 00:00:00');
INSERT INTO `area` VALUES ('40', '陇南市', '31', '0', 'CITY', '1970-01-01 00:00:00', '1970-01-01 00:00:00');
INSERT INTO `area` VALUES ('41', '平凉市', '31', '0', 'CITY', '1970-01-01 00:00:00', '1970-01-01 00:00:00');
INSERT INTO `area` VALUES ('42', '庆阳市', '31', '0', 'CITY', '1970-01-01 00:00:00', '1970-01-01 00:00:00');
INSERT INTO `area` VALUES ('43', '天水市', '31', '0', 'CITY', '1970-01-01 00:00:00', '1970-01-01 00:00:00');
INSERT INTO `area` VALUES ('44', '武威市', '31', '0', 'CITY', '1970-01-01 00:00:00', '1970-01-01 00:00:00');
INSERT INTO `area` VALUES ('45', '张掖市', '31', '0', 'CITY', '1970-01-01 00:00:00', '1970-01-01 00:00:00');
INSERT INTO `area` VALUES ('46', '广东省', '0', '0', 'PROVINCE', '1970-01-01 00:00:00', '1970-01-01 00:00:00');
INSERT INTO `area` VALUES ('47', '潮州市', '46', '0', 'CITY', '1970-01-01 00:00:00', '1970-01-01 00:00:00');
INSERT INTO `area` VALUES ('48', '东莞市', '46', '0', 'CITY', '1970-01-01 00:00:00', '1970-01-01 00:00:00');
INSERT INTO `area` VALUES ('49', '佛山市', '46', '0', 'CITY', '1970-01-01 00:00:00', '1970-01-01 00:00:00');
INSERT INTO `area` VALUES ('50', '广州市', '46', '0', 'CITY', '1970-01-01 00:00:00', '1970-01-01 00:00:00');
INSERT INTO `area` VALUES ('51', '河源市', '46', '0', 'CITY', '1970-01-01 00:00:00', '1970-01-01 00:00:00');
INSERT INTO `area` VALUES ('52', '惠州市', '46', '0', 'CITY', '1970-01-01 00:00:00', '1970-01-01 00:00:00');
INSERT INTO `area` VALUES ('53', '江门市', '46', '0', 'CITY', '1970-01-01 00:00:00', '1970-01-01 00:00:00');
INSERT INTO `area` VALUES ('54', '揭阳市', '46', '0', 'CITY', '1970-01-01 00:00:00', '1970-01-01 00:00:00');
INSERT INTO `area` VALUES ('55', '茂名市', '46', '0', 'CITY', '1970-01-01 00:00:00', '1970-01-01 00:00:00');
INSERT INTO `area` VALUES ('56', '梅州市', '46', '0', 'CITY', '1970-01-01 00:00:00', '1970-01-01 00:00:00');
INSERT INTO `area` VALUES ('57', '清远市', '46', '0', 'CITY', '1970-01-01 00:00:00', '1970-01-01 00:00:00');
INSERT INTO `area` VALUES ('58', '汕头市', '46', '0', 'CITY', '1970-01-01 00:00:00', '1970-01-01 00:00:00');
INSERT INTO `area` VALUES ('59', '汕尾市', '46', '0', 'CITY', '1970-01-01 00:00:00', '1970-01-01 00:00:00');
INSERT INTO `area` VALUES ('60', '韶关市', '46', '0', 'CITY', '1970-01-01 00:00:00', '1970-01-01 00:00:00');
INSERT INTO `area` VALUES ('61', '深圳市', '46', '0', 'CITY', '1970-01-01 00:00:00', '1970-01-01 00:00:00');
INSERT INTO `area` VALUES ('62', '阳江市', '46', '0', 'CITY', '1970-01-01 00:00:00', '1970-01-01 00:00:00');
INSERT INTO `area` VALUES ('63', '云浮市', '46', '0', 'CITY', '1970-01-01 00:00:00', '1970-01-01 00:00:00');
INSERT INTO `area` VALUES ('64', '湛江市', '46', '0', 'CITY', '1970-01-01 00:00:00', '1970-01-01 00:00:00');
INSERT INTO `area` VALUES ('65', '肇庆市', '46', '0', 'CITY', '1970-01-01 00:00:00', '1970-01-01 00:00:00');
INSERT INTO `area` VALUES ('66', '中山市', '46', '0', 'CITY', '1970-01-01 00:00:00', '1970-01-01 00:00:00');
INSERT INTO `area` VALUES ('67', '珠海市', '46', '0', 'CITY', '1970-01-01 00:00:00', '1970-01-01 00:00:00');
INSERT INTO `area` VALUES ('68', '广西壮族自治区', '0', '0', 'PROVINCE', '1970-01-01 00:00:00', '1970-01-01 00:00:00');
INSERT INTO `area` VALUES ('69', '百色市', '68', '0', 'CITY', '1970-01-01 00:00:00', '1970-01-01 00:00:00');
INSERT INTO `area` VALUES ('70', '北海市', '68', '0', 'CITY', '1970-01-01 00:00:00', '1970-01-01 00:00:00');
INSERT INTO `area` VALUES ('71', '崇左市', '68', '0', 'CITY', '1970-01-01 00:00:00', '1970-01-01 00:00:00');
INSERT INTO `area` VALUES ('72', '防城港市', '68', '0', 'CITY', '1970-01-01 00:00:00', '1970-01-01 00:00:00');
INSERT INTO `area` VALUES ('73', '贵港市', '68', '0', 'CITY', '1970-01-01 00:00:00', '1970-01-01 00:00:00');
INSERT INTO `area` VALUES ('74', '桂林市', '68', '0', 'CITY', '1970-01-01 00:00:00', '1970-01-01 00:00:00');
INSERT INTO `area` VALUES ('75', '河池市', '68', '0', 'CITY', '1970-01-01 00:00:00', '1970-01-01 00:00:00');
INSERT INTO `area` VALUES ('76', '贺州市', '68', '0', 'CITY', '1970-01-01 00:00:00', '1970-01-01 00:00:00');
INSERT INTO `area` VALUES ('77', '来宾市', '68', '0', 'CITY', '1970-01-01 00:00:00', '1970-01-01 00:00:00');
INSERT INTO `area` VALUES ('78', '柳州市', '68', '0', 'CITY', '1970-01-01 00:00:00', '1970-01-01 00:00:00');
INSERT INTO `area` VALUES ('79', '南宁市', '68', '0', 'CITY', '1970-01-01 00:00:00', '1970-01-01 00:00:00');
INSERT INTO `area` VALUES ('80', '钦州市', '68', '0', 'CITY', '1970-01-01 00:00:00', '1970-01-01 00:00:00');
INSERT INTO `area` VALUES ('81', '梧州市', '68', '0', 'CITY', '1970-01-01 00:00:00', '1970-01-01 00:00:00');
INSERT INTO `area` VALUES ('82', '玉林市', '68', '0', 'CITY', '1970-01-01 00:00:00', '1970-01-01 00:00:00');
INSERT INTO `area` VALUES ('83', '贵州省', '0', '0', 'PROVINCE', '1970-01-01 00:00:00', '1970-01-01 00:00:00');
INSERT INTO `area` VALUES ('84', '安顺市', '83', '0', 'CITY', '1970-01-01 00:00:00', '1970-01-01 00:00:00');
INSERT INTO `area` VALUES ('85', '毕节地区', '83', '0', 'CITY', '1970-01-01 00:00:00', '1970-01-01 00:00:00');
INSERT INTO `area` VALUES ('86', '贵阳市', '83', '0', 'CITY', '1970-01-01 00:00:00', '1970-01-01 00:00:00');
INSERT INTO `area` VALUES ('87', '六盘水市', '83', '0', 'CITY', '1970-01-01 00:00:00', '1970-01-01 00:00:00');
INSERT INTO `area` VALUES ('88', '黔东南苗族侗族自治州', '83', '0', 'CITY', '1970-01-01 00:00:00', '1970-01-01 00:00:00');
INSERT INTO `area` VALUES ('89', '黔南布依族苗族自治州', '83', '0', 'CITY', '1970-01-01 00:00:00', '1970-01-01 00:00:00');
INSERT INTO `area` VALUES ('90', '黔西南布依族苗族自治州', '83', '0', 'CITY', '1970-01-01 00:00:00', '1970-01-01 00:00:00');
INSERT INTO `area` VALUES ('91', '铜仁地区', '83', '0', 'CITY', '1970-01-01 00:00:00', '1970-01-01 00:00:00');
INSERT INTO `area` VALUES ('92', '遵义市', '83', '0', 'CITY', '1970-01-01 00:00:00', '1970-01-01 00:00:00');
INSERT INTO `area` VALUES ('93', '海南省', '0', '0', 'PROVINCE', '1970-01-01 00:00:00', '1970-01-01 00:00:00');
INSERT INTO `area` VALUES ('94', '海口市', '93', '0', 'CITY', '1970-01-01 00:00:00', '1970-01-01 00:00:00');
INSERT INTO `area` VALUES ('95', '三亚市', '93', '0', 'CITY', '1970-01-01 00:00:00', '1970-01-01 00:00:00');
INSERT INTO `area` VALUES ('96', '三沙市', '93', '0', 'CITY', '1970-01-01 00:00:00', '1970-01-01 00:00:00');
INSERT INTO `area` VALUES ('97', '儋州市', '93', '0', 'CITY', '1970-01-01 00:00:00', '1970-01-01 00:00:00');
INSERT INTO `area` VALUES ('98', '省直辖县级行政区划', '93', '0', 'CITY', '1970-01-01 00:00:00', '1970-01-01 00:00:00');
INSERT INTO `area` VALUES ('99', '河北省', '0', '0', 'PROVINCE', '1970-01-01 00:00:00', '1970-01-01 00:00:00');
INSERT INTO `area` VALUES ('100', '保定市', '99', '0', 'CITY', '1970-01-01 00:00:00', '1970-01-01 00:00:00');
INSERT INTO `area` VALUES ('101', '沧州市', '99', '0', 'CITY', '1970-01-01 00:00:00', '1970-01-01 00:00:00');
INSERT INTO `area` VALUES ('102', '承德市', '99', '0', 'CITY', '1970-01-01 00:00:00', '1970-01-01 00:00:00');
INSERT INTO `area` VALUES ('103', '邯郸市', '99', '0', 'CITY', '1970-01-01 00:00:00', '1970-01-01 00:00:00');
INSERT INTO `area` VALUES ('104', '衡水市', '99', '0', 'CITY', '1970-01-01 00:00:00', '1970-01-01 00:00:00');
INSERT INTO `area` VALUES ('105', '廊坊市', '99', '0', 'CITY', '1970-01-01 00:00:00', '1970-01-01 00:00:00');
INSERT INTO `area` VALUES ('106', '秦皇岛市', '99', '0', 'CITY', '1970-01-01 00:00:00', '1970-01-01 00:00:00');
INSERT INTO `area` VALUES ('107', '石家庄市', '99', '0', 'CITY', '1970-01-01 00:00:00', '1970-01-01 00:00:00');
INSERT INTO `area` VALUES ('108', '唐山市', '99', '0', 'CITY', '1970-01-01 00:00:00', '1970-01-01 00:00:00');
INSERT INTO `area` VALUES ('109', '邢台市', '99', '0', 'CITY', '1970-01-01 00:00:00', '1970-01-01 00:00:00');
INSERT INTO `area` VALUES ('110', '张家口市', '99', '0', 'CITY', '1970-01-01 00:00:00', '1970-01-01 00:00:00');
INSERT INTO `area` VALUES ('111', '河南省', '0', '0', 'PROVINCE', '1970-01-01 00:00:00', '1970-01-01 00:00:00');
INSERT INTO `area` VALUES ('112', '安阳市', '111', '0', 'CITY', '1970-01-01 00:00:00', '1970-01-01 00:00:00');
INSERT INTO `area` VALUES ('113', '鹤壁市', '111', '0', 'CITY', '1970-01-01 00:00:00', '1970-01-01 00:00:00');
INSERT INTO `area` VALUES ('114', '焦作市', '111', '0', 'CITY', '1970-01-01 00:00:00', '1970-01-01 00:00:00');
INSERT INTO `area` VALUES ('115', '开封市', '111', '0', 'CITY', '1970-01-01 00:00:00', '1970-01-01 00:00:00');
INSERT INTO `area` VALUES ('116', '洛阳市', '111', '0', 'CITY', '1970-01-01 00:00:00', '1970-01-01 00:00:00');
INSERT INTO `area` VALUES ('117', '漯河市', '111', '0', 'CITY', '1970-01-01 00:00:00', '1970-01-01 00:00:00');
INSERT INTO `area` VALUES ('118', '南阳市', '111', '0', 'CITY', '1970-01-01 00:00:00', '1970-01-01 00:00:00');
INSERT INTO `area` VALUES ('119', '平顶山市', '111', '0', 'CITY', '1970-01-01 00:00:00', '1970-01-01 00:00:00');
INSERT INTO `area` VALUES ('120', '濮阳市', '111', '0', 'CITY', '1970-01-01 00:00:00', '1970-01-01 00:00:00');
INSERT INTO `area` VALUES ('121', '三门峡市', '111', '0', 'CITY', '1970-01-01 00:00:00', '1970-01-01 00:00:00');
INSERT INTO `area` VALUES ('122', '商丘市', '111', '0', 'CITY', '1970-01-01 00:00:00', '1970-01-01 00:00:00');
INSERT INTO `area` VALUES ('123', '新乡市', '111', '0', 'CITY', '1970-01-01 00:00:00', '1970-01-01 00:00:00');
INSERT INTO `area` VALUES ('124', '信阳市', '111', '0', 'CITY', '1970-01-01 00:00:00', '1970-01-01 00:00:00');
INSERT INTO `area` VALUES ('125', '许昌市', '111', '0', 'CITY', '1970-01-01 00:00:00', '1970-01-01 00:00:00');
INSERT INTO `area` VALUES ('126', '郑州市', '111', '0', 'CITY', '1970-01-01 00:00:00', '1970-01-01 00:00:00');
INSERT INTO `area` VALUES ('127', '周口市', '111', '0', 'CITY', '1970-01-01 00:00:00', '1970-01-01 00:00:00');
INSERT INTO `area` VALUES ('128', '驻马店市', '111', '0', 'CITY', '1970-01-01 00:00:00', '1970-01-01 00:00:00');
INSERT INTO `area` VALUES ('129', '黑龙江省', '0', '0', 'PROVINCE', '1970-01-01 00:00:00', '1970-01-01 00:00:00');
INSERT INTO `area` VALUES ('130', '大庆市', '129', '0', 'CITY', '1970-01-01 00:00:00', '1970-01-01 00:00:00');
INSERT INTO `area` VALUES ('131', '大兴安岭地区', '129', '0', 'CITY', '1970-01-01 00:00:00', '1970-01-01 00:00:00');
INSERT INTO `area` VALUES ('132', '哈尔滨市', '129', '0', 'CITY', '1970-01-01 00:00:00', '1970-01-01 00:00:00');
INSERT INTO `area` VALUES ('133', '鹤岗市', '129', '0', 'CITY', '1970-01-01 00:00:00', '1970-01-01 00:00:00');
INSERT INTO `area` VALUES ('134', '黑河市', '129', '0', 'CITY', '1970-01-01 00:00:00', '1970-01-01 00:00:00');
INSERT INTO `area` VALUES ('135', '鸡西市', '129', '0', 'CITY', '1970-01-01 00:00:00', '1970-01-01 00:00:00');
INSERT INTO `area` VALUES ('136', '佳木斯市', '129', '0', 'CITY', '1970-01-01 00:00:00', '1970-01-01 00:00:00');
INSERT INTO `area` VALUES ('137', '牡丹江市', '129', '0', 'CITY', '1970-01-01 00:00:00', '1970-01-01 00:00:00');
INSERT INTO `area` VALUES ('138', '七台河市', '129', '0', 'CITY', '1970-01-01 00:00:00', '1970-01-01 00:00:00');
INSERT INTO `area` VALUES ('139', '齐齐哈尔市', '129', '0', 'CITY', '1970-01-01 00:00:00', '1970-01-01 00:00:00');
INSERT INTO `area` VALUES ('140', '双鸭山市', '129', '0', 'CITY', '1970-01-01 00:00:00', '1970-01-01 00:00:00');
INSERT INTO `area` VALUES ('141', '绥化市', '129', '0', 'CITY', '1970-01-01 00:00:00', '1970-01-01 00:00:00');
INSERT INTO `area` VALUES ('142', '伊春市', '129', '0', 'CITY', '1970-01-01 00:00:00', '1970-01-01 00:00:00');
INSERT INTO `area` VALUES ('143', '湖北省', '0', '0', 'PROVINCE', '1970-01-01 00:00:00', '1970-01-01 00:00:00');
INSERT INTO `area` VALUES ('144', '鄂州市', '143', '0', 'CITY', '1970-01-01 00:00:00', '1970-01-01 00:00:00');
INSERT INTO `area` VALUES ('145', '恩施土家族苗族自治州', '143', '0', 'CITY', '1970-01-01 00:00:00', '1970-01-01 00:00:00');
INSERT INTO `area` VALUES ('146', '黄冈市', '143', '0', 'CITY', '1970-01-01 00:00:00', '1970-01-01 00:00:00');
INSERT INTO `area` VALUES ('147', '黄石市', '143', '0', 'CITY', '1970-01-01 00:00:00', '1970-01-01 00:00:00');
INSERT INTO `area` VALUES ('148', '荆门市', '143', '0', 'CITY', '1970-01-01 00:00:00', '1970-01-01 00:00:00');
INSERT INTO `area` VALUES ('149', '荆州市', '143', '0', 'CITY', '1970-01-01 00:00:00', '1970-01-01 00:00:00');
INSERT INTO `area` VALUES ('150', '十堰市', '143', '0', 'CITY', '1970-01-01 00:00:00', '1970-01-01 00:00:00');
INSERT INTO `area` VALUES ('151', '随州市', '143', '0', 'CITY', '1970-01-01 00:00:00', '1970-01-01 00:00:00');
INSERT INTO `area` VALUES ('152', '武汉市', '143', '0', 'CITY', '1970-01-01 00:00:00', '1970-01-01 00:00:00');
INSERT INTO `area` VALUES ('153', '咸宁市', '143', '0', 'CITY', '1970-01-01 00:00:00', '1970-01-01 00:00:00');
INSERT INTO `area` VALUES ('154', '襄樊市', '143', '0', 'CITY', '1970-01-01 00:00:00', '1970-01-01 00:00:00');
INSERT INTO `area` VALUES ('155', '孝感市', '143', '0', 'CITY', '1970-01-01 00:00:00', '1970-01-01 00:00:00');
INSERT INTO `area` VALUES ('156', '宜昌市', '143', '0', 'CITY', '1970-01-01 00:00:00', '1970-01-01 00:00:00');
INSERT INTO `area` VALUES ('157', '湖南省', '0', '0', 'PROVINCE', '1970-01-01 00:00:00', '1970-01-01 00:00:00');
INSERT INTO `area` VALUES ('158', '长沙市', '157', '0', 'CITY', '1970-01-01 00:00:00', '1970-01-01 00:00:00');
INSERT INTO `area` VALUES ('159', '常德市', '157', '0', 'CITY', '1970-01-01 00:00:00', '1970-01-01 00:00:00');
INSERT INTO `area` VALUES ('160', '郴州市', '157', '0', 'CITY', '1970-01-01 00:00:00', '1970-01-01 00:00:00');
INSERT INTO `area` VALUES ('161', '衡阳市', '157', '0', 'CITY', '1970-01-01 00:00:00', '1970-01-01 00:00:00');
INSERT INTO `area` VALUES ('162', '怀化市', '157', '0', 'CITY', '1970-01-01 00:00:00', '1970-01-01 00:00:00');
INSERT INTO `area` VALUES ('163', '娄底市', '157', '0', 'CITY', '1970-01-01 00:00:00', '1970-01-01 00:00:00');
INSERT INTO `area` VALUES ('164', '邵阳市', '157', '0', 'CITY', '1970-01-01 00:00:00', '1970-01-01 00:00:00');
INSERT INTO `area` VALUES ('165', '湘潭市', '157', '0', 'CITY', '1970-01-01 00:00:00', '1970-01-01 00:00:00');
INSERT INTO `area` VALUES ('166', '湘西土家族苗族自治州', '157', '0', 'CITY', '1970-01-01 00:00:00', '1970-01-01 00:00:00');
INSERT INTO `area` VALUES ('167', '益阳市', '157', '0', 'CITY', '1970-01-01 00:00:00', '1970-01-01 00:00:00');
INSERT INTO `area` VALUES ('168', '永州市', '157', '0', 'CITY', '1970-01-01 00:00:00', '1970-01-01 00:00:00');
INSERT INTO `area` VALUES ('169', '岳阳市', '157', '0', 'CITY', '1970-01-01 00:00:00', '1970-01-01 00:00:00');
INSERT INTO `area` VALUES ('170', '张家界市', '157', '0', 'CITY', '1970-01-01 00:00:00', '1970-01-01 00:00:00');
INSERT INTO `area` VALUES ('171', '株洲市', '157', '0', 'CITY', '1970-01-01 00:00:00', '1970-01-01 00:00:00');
INSERT INTO `area` VALUES ('172', '吉林省', '0', '0', 'PROVINCE', '1970-01-01 00:00:00', '1970-01-01 00:00:00');
INSERT INTO `area` VALUES ('173', '白城市', '172', '0', 'CITY', '1970-01-01 00:00:00', '1970-01-01 00:00:00');
INSERT INTO `area` VALUES ('174', '白山市', '172', '0', 'CITY', '1970-01-01 00:00:00', '1970-01-01 00:00:00');
INSERT INTO `area` VALUES ('175', '长春市', '172', '0', 'CITY', '1970-01-01 00:00:00', '1970-01-01 00:00:00');
INSERT INTO `area` VALUES ('176', '吉林市', '172', '0', 'CITY', '1970-01-01 00:00:00', '1970-01-01 00:00:00');
INSERT INTO `area` VALUES ('177', '辽源市', '172', '0', 'CITY', '1970-01-01 00:00:00', '1970-01-01 00:00:00');
INSERT INTO `area` VALUES ('178', '四平市', '172', '0', 'CITY', '1970-01-01 00:00:00', '1970-01-01 00:00:00');
INSERT INTO `area` VALUES ('179', '松原市', '172', '0', 'CITY', '1970-01-01 00:00:00', '1970-01-01 00:00:00');
INSERT INTO `area` VALUES ('180', '通化市', '172', '0', 'CITY', '1970-01-01 00:00:00', '1970-01-01 00:00:00');
INSERT INTO `area` VALUES ('181', '延边朝鲜族自治州', '172', '0', 'CITY', '1970-01-01 00:00:00', '1970-01-01 00:00:00');
INSERT INTO `area` VALUES ('182', '江苏省', '0', '0', 'PROVINCE', '1970-01-01 00:00:00', '1970-01-01 00:00:00');
INSERT INTO `area` VALUES ('183', '常州市', '182', '0', 'CITY', '1970-01-01 00:00:00', '1970-01-01 00:00:00');
INSERT INTO `area` VALUES ('184', '淮安市', '182', '0', 'CITY', '1970-01-01 00:00:00', '1970-01-01 00:00:00');
INSERT INTO `area` VALUES ('185', '连云港市', '182', '0', 'CITY', '1970-01-01 00:00:00', '1970-01-01 00:00:00');
INSERT INTO `area` VALUES ('186', '南京市', '182', '0', 'CITY', '1970-01-01 00:00:00', '1970-01-01 00:00:00');
INSERT INTO `area` VALUES ('187', '南通市', '182', '0', 'CITY', '1970-01-01 00:00:00', '1970-01-01 00:00:00');
INSERT INTO `area` VALUES ('188', '苏州市', '182', '0', 'CITY', '1970-01-01 00:00:00', '1970-01-01 00:00:00');
INSERT INTO `area` VALUES ('189', '宿迁市', '182', '0', 'CITY', '1970-01-01 00:00:00', '1970-01-01 00:00:00');
INSERT INTO `area` VALUES ('190', '泰州市', '182', '0', 'CITY', '1970-01-01 00:00:00', '1970-01-01 00:00:00');
INSERT INTO `area` VALUES ('191', '无锡市', '182', '0', 'CITY', '1970-01-01 00:00:00', '1970-01-01 00:00:00');
INSERT INTO `area` VALUES ('192', '徐州市', '182', '0', 'CITY', '1970-01-01 00:00:00', '1970-01-01 00:00:00');
INSERT INTO `area` VALUES ('193', '盐城市', '182', '0', 'CITY', '1970-01-01 00:00:00', '1970-01-01 00:00:00');
INSERT INTO `area` VALUES ('194', '扬州市', '182', '0', 'CITY', '1970-01-01 00:00:00', '1970-01-01 00:00:00');
INSERT INTO `area` VALUES ('195', '镇江市', '182', '0', 'CITY', '1970-01-01 00:00:00', '1970-01-01 00:00:00');
INSERT INTO `area` VALUES ('196', '江西省', '0', '0', 'PROVINCE', '1970-01-01 00:00:00', '1970-01-01 00:00:00');
INSERT INTO `area` VALUES ('197', '抚州市', '196', '0', 'CITY', '1970-01-01 00:00:00', '1970-01-01 00:00:00');
INSERT INTO `area` VALUES ('198', '赣州市', '196', '0', 'CITY', '1970-01-01 00:00:00', '1970-01-01 00:00:00');
INSERT INTO `area` VALUES ('199', '吉安市', '196', '0', 'CITY', '1970-01-01 00:00:00', '1970-01-01 00:00:00');
INSERT INTO `area` VALUES ('200', '景德镇市', '196', '0', 'CITY', '1970-01-01 00:00:00', '1970-01-01 00:00:00');
INSERT INTO `area` VALUES ('201', '九江市', '196', '0', 'CITY', '1970-01-01 00:00:00', '1970-01-01 00:00:00');
INSERT INTO `area` VALUES ('202', '南昌市', '196', '0', 'CITY', '1970-01-01 00:00:00', '1970-01-01 00:00:00');
INSERT INTO `area` VALUES ('203', '萍乡市', '196', '0', 'CITY', '1970-01-01 00:00:00', '1970-01-01 00:00:00');
INSERT INTO `area` VALUES ('204', '上饶市', '196', '0', 'CITY', '1970-01-01 00:00:00', '1970-01-01 00:00:00');
INSERT INTO `area` VALUES ('205', '新余市', '196', '0', 'CITY', '1970-01-01 00:00:00', '1970-01-01 00:00:00');
INSERT INTO `area` VALUES ('206', '宜春市', '196', '0', 'CITY', '1970-01-01 00:00:00', '1970-01-01 00:00:00');
INSERT INTO `area` VALUES ('207', '鹰潭市', '196', '0', 'CITY', '1970-01-01 00:00:00', '1970-01-01 00:00:00');
INSERT INTO `area` VALUES ('208', '辽宁省', '0', '0', 'PROVINCE', '1970-01-01 00:00:00', '1970-01-01 00:00:00');
INSERT INTO `area` VALUES ('209', '鞍山市', '208', '0', 'CITY', '1970-01-01 00:00:00', '1970-01-01 00:00:00');
INSERT INTO `area` VALUES ('210', '本溪市', '208', '0', 'CITY', '1970-01-01 00:00:00', '1970-01-01 00:00:00');
INSERT INTO `area` VALUES ('211', '朝阳市', '208', '0', 'CITY', '1970-01-01 00:00:00', '1970-01-01 00:00:00');
INSERT INTO `area` VALUES ('212', '大连市', '208', '0', 'CITY', '1970-01-01 00:00:00', '1970-01-01 00:00:00');
INSERT INTO `area` VALUES ('213', '丹东市', '208', '0', 'CITY', '1970-01-01 00:00:00', '1970-01-01 00:00:00');
INSERT INTO `area` VALUES ('214', '抚顺市', '208', '0', 'CITY', '1970-01-01 00:00:00', '1970-01-01 00:00:00');
INSERT INTO `area` VALUES ('215', '阜新市', '208', '0', 'CITY', '1970-01-01 00:00:00', '1970-01-01 00:00:00');
INSERT INTO `area` VALUES ('216', '葫芦岛市', '208', '0', 'CITY', '1970-01-01 00:00:00', '1970-01-01 00:00:00');
INSERT INTO `area` VALUES ('217', '锦州市', '208', '0', 'CITY', '1970-01-01 00:00:00', '1970-01-01 00:00:00');
INSERT INTO `area` VALUES ('218', '辽阳市', '208', '0', 'CITY', '1970-01-01 00:00:00', '1970-01-01 00:00:00');
INSERT INTO `area` VALUES ('219', '盘锦市', '208', '0', 'CITY', '1970-01-01 00:00:00', '1970-01-01 00:00:00');
INSERT INTO `area` VALUES ('220', '沈阳市', '208', '0', 'CITY', '1970-01-01 00:00:00', '1970-01-01 00:00:00');
INSERT INTO `area` VALUES ('221', '铁岭市', '208', '0', 'CITY', '1970-01-01 00:00:00', '1970-01-01 00:00:00');
INSERT INTO `area` VALUES ('222', '营口市', '208', '0', 'CITY', '1970-01-01 00:00:00', '1970-01-01 00:00:00');
INSERT INTO `area` VALUES ('223', '内蒙古自治区', '0', '0', 'PROVINCE', '1970-01-01 00:00:00', '1970-01-01 00:00:00');
INSERT INTO `area` VALUES ('224', '阿拉善盟', '223', '0', 'CITY', '1970-01-01 00:00:00', '1970-01-01 00:00:00');
INSERT INTO `area` VALUES ('225', '巴彦淖尔市', '223', '0', 'CITY', '1970-01-01 00:00:00', '1970-01-01 00:00:00');
INSERT INTO `area` VALUES ('226', '包头市', '223', '0', 'CITY', '1970-01-01 00:00:00', '1970-01-01 00:00:00');
INSERT INTO `area` VALUES ('227', '赤峰市', '223', '0', 'CITY', '1970-01-01 00:00:00', '1970-01-01 00:00:00');
INSERT INTO `area` VALUES ('228', '鄂尔多斯市', '223', '0', 'CITY', '1970-01-01 00:00:00', '1970-01-01 00:00:00');
INSERT INTO `area` VALUES ('229', '呼和浩特市', '223', '0', 'CITY', '1970-01-01 00:00:00', '1970-01-01 00:00:00');
INSERT INTO `area` VALUES ('230', '呼伦贝尔市', '223', '0', 'CITY', '1970-01-01 00:00:00', '1970-01-01 00:00:00');
INSERT INTO `area` VALUES ('231', '通辽市', '223', '0', 'CITY', '1970-01-01 00:00:00', '1970-01-01 00:00:00');
INSERT INTO `area` VALUES ('232', '乌海市', '223', '0', 'CITY', '1970-01-01 00:00:00', '1970-01-01 00:00:00');
INSERT INTO `area` VALUES ('233', '乌兰察布市', '223', '0', 'CITY', '1970-01-01 00:00:00', '1970-01-01 00:00:00');
INSERT INTO `area` VALUES ('234', '锡林郭勒盟', '223', '0', 'CITY', '1970-01-01 00:00:00', '1970-01-01 00:00:00');
INSERT INTO `area` VALUES ('235', '兴安盟', '223', '0', 'CITY', '1970-01-01 00:00:00', '1970-01-01 00:00:00');
INSERT INTO `area` VALUES ('236', '宁夏回族自治区', '0', '0', 'PROVINCE', '1970-01-01 00:00:00', '1970-01-01 00:00:00');
INSERT INTO `area` VALUES ('237', '固原市', '236', '0', 'CITY', '1970-01-01 00:00:00', '1970-01-01 00:00:00');
INSERT INTO `area` VALUES ('238', '石嘴山市', '236', '0', 'CITY', '1970-01-01 00:00:00', '1970-01-01 00:00:00');
INSERT INTO `area` VALUES ('239', '吴忠市', '236', '0', 'CITY', '1970-01-01 00:00:00', '1970-01-01 00:00:00');
INSERT INTO `area` VALUES ('240', '银川市', '236', '0', 'CITY', '1970-01-01 00:00:00', '1970-01-01 00:00:00');
INSERT INTO `area` VALUES ('241', '中卫市', '236', '0', 'CITY', '1970-01-01 00:00:00', '1970-01-01 00:00:00');
INSERT INTO `area` VALUES ('242', '青海省', '0', '0', 'PROVINCE', '1970-01-01 00:00:00', '1970-01-01 00:00:00');
INSERT INTO `area` VALUES ('243', '果洛藏族自治州', '242', '0', 'CITY', '1970-01-01 00:00:00', '1970-01-01 00:00:00');
INSERT INTO `area` VALUES ('244', '海北藏族自治州', '242', '0', 'CITY', '1970-01-01 00:00:00', '1970-01-01 00:00:00');
INSERT INTO `area` VALUES ('245', '海东地区', '242', '0', 'CITY', '1970-01-01 00:00:00', '1970-01-01 00:00:00');
INSERT INTO `area` VALUES ('246', '海南藏族自治州', '242', '0', 'CITY', '1970-01-01 00:00:00', '1970-01-01 00:00:00');
INSERT INTO `area` VALUES ('247', '海西蒙古族藏族自治州', '242', '0', 'CITY', '1970-01-01 00:00:00', '1970-01-01 00:00:00');
INSERT INTO `area` VALUES ('248', '黄南藏族自治州', '242', '0', 'CITY', '1970-01-01 00:00:00', '1970-01-01 00:00:00');
INSERT INTO `area` VALUES ('249', '西宁市', '242', '0', 'CITY', '1970-01-01 00:00:00', '1970-01-01 00:00:00');
INSERT INTO `area` VALUES ('250', '玉树藏族自治州', '242', '0', 'CITY', '1970-01-01 00:00:00', '1970-01-01 00:00:00');
INSERT INTO `area` VALUES ('251', '山东省', '0', '0', 'PROVINCE', '1970-01-01 00:00:00', '1970-01-01 00:00:00');
INSERT INTO `area` VALUES ('252', '滨州市', '251', '0', 'CITY', '1970-01-01 00:00:00', '1970-01-01 00:00:00');
INSERT INTO `area` VALUES ('253', '德州市', '251', '0', 'CITY', '1970-01-01 00:00:00', '1970-01-01 00:00:00');
INSERT INTO `area` VALUES ('254', '东营市', '251', '0', 'CITY', '1970-01-01 00:00:00', '1970-01-01 00:00:00');
INSERT INTO `area` VALUES ('255', '菏泽市', '251', '0', 'CITY', '1970-01-01 00:00:00', '1970-01-01 00:00:00');
INSERT INTO `area` VALUES ('256', '济南市', '251', '0', 'CITY', '1970-01-01 00:00:00', '1970-01-01 00:00:00');
INSERT INTO `area` VALUES ('257', '济宁市', '251', '0', 'CITY', '1970-01-01 00:00:00', '1970-01-01 00:00:00');
INSERT INTO `area` VALUES ('258', '莱芜市', '251', '0', 'CITY', '1970-01-01 00:00:00', '1970-01-01 00:00:00');
INSERT INTO `area` VALUES ('259', '聊城市', '251', '0', 'CITY', '1970-01-01 00:00:00', '1970-01-01 00:00:00');
INSERT INTO `area` VALUES ('260', '临沂市', '251', '0', 'CITY', '1970-01-01 00:00:00', '1970-01-01 00:00:00');
INSERT INTO `area` VALUES ('261', '青岛市', '251', '0', 'CITY', '1970-01-01 00:00:00', '1970-01-01 00:00:00');
INSERT INTO `area` VALUES ('262', '日照市', '251', '0', 'CITY', '1970-01-01 00:00:00', '1970-01-01 00:00:00');
INSERT INTO `area` VALUES ('263', '泰安市', '251', '0', 'CITY', '1970-01-01 00:00:00', '1970-01-01 00:00:00');
INSERT INTO `area` VALUES ('264', '威海市', '251', '0', 'CITY', '1970-01-01 00:00:00', '1970-01-01 00:00:00');
INSERT INTO `area` VALUES ('265', '潍坊市', '251', '0', 'CITY', '1970-01-01 00:00:00', '1970-01-01 00:00:00');
INSERT INTO `area` VALUES ('266', '烟台市', '251', '0', 'CITY', '1970-01-01 00:00:00', '1970-01-01 00:00:00');
INSERT INTO `area` VALUES ('267', '枣庄市', '251', '0', 'CITY', '1970-01-01 00:00:00', '1970-01-01 00:00:00');
INSERT INTO `area` VALUES ('268', '淄博市', '251', '0', 'CITY', '1970-01-01 00:00:00', '1970-01-01 00:00:00');
INSERT INTO `area` VALUES ('269', '山西省', '0', '0', 'PROVINCE', '1970-01-01 00:00:00', '1970-01-01 00:00:00');
INSERT INTO `area` VALUES ('270', '长治市', '269', '0', 'CITY', '1970-01-01 00:00:00', '1970-01-01 00:00:00');
INSERT INTO `area` VALUES ('271', '大同市', '269', '0', 'CITY', '1970-01-01 00:00:00', '1970-01-01 00:00:00');
INSERT INTO `area` VALUES ('272', '晋城市', '269', '0', 'CITY', '1970-01-01 00:00:00', '1970-01-01 00:00:00');
INSERT INTO `area` VALUES ('273', '晋中市', '269', '0', 'CITY', '1970-01-01 00:00:00', '1970-01-01 00:00:00');
INSERT INTO `area` VALUES ('274', '临汾市', '269', '0', 'CITY', '1970-01-01 00:00:00', '1970-01-01 00:00:00');
INSERT INTO `area` VALUES ('275', '吕梁市', '269', '0', 'CITY', '1970-01-01 00:00:00', '1970-01-01 00:00:00');
INSERT INTO `area` VALUES ('276', '朔州市', '269', '0', 'CITY', '1970-01-01 00:00:00', '1970-01-01 00:00:00');
INSERT INTO `area` VALUES ('277', '太原市', '269', '0', 'CITY', '1970-01-01 00:00:00', '1970-01-01 00:00:00');
INSERT INTO `area` VALUES ('278', '忻州市', '269', '0', 'CITY', '1970-01-01 00:00:00', '1970-01-01 00:00:00');
INSERT INTO `area` VALUES ('279', '阳泉市', '269', '0', 'CITY', '1970-01-01 00:00:00', '1970-01-01 00:00:00');
INSERT INTO `area` VALUES ('280', '运城市', '269', '0', 'CITY', '1970-01-01 00:00:00', '1970-01-01 00:00:00');
INSERT INTO `area` VALUES ('281', '陕西省', '0', '0', 'PROVINCE', '1970-01-01 00:00:00', '1970-01-01 00:00:00');
INSERT INTO `area` VALUES ('282', '安康市', '281', '0', 'CITY', '1970-01-01 00:00:00', '1970-01-01 00:00:00');
INSERT INTO `area` VALUES ('283', '宝鸡市', '281', '0', 'CITY', '1970-01-01 00:00:00', '1970-01-01 00:00:00');
INSERT INTO `area` VALUES ('284', '汉中市', '281', '0', 'CITY', '1970-01-01 00:00:00', '1970-01-01 00:00:00');
INSERT INTO `area` VALUES ('285', '商洛市', '281', '0', 'CITY', '1970-01-01 00:00:00', '1970-01-01 00:00:00');
INSERT INTO `area` VALUES ('286', '铜川市', '281', '0', 'CITY', '1970-01-01 00:00:00', '1970-01-01 00:00:00');
INSERT INTO `area` VALUES ('287', '渭南市', '281', '0', 'CITY', '1970-01-01 00:00:00', '1970-01-01 00:00:00');
INSERT INTO `area` VALUES ('288', '西安市', '281', '0', 'CITY', '1970-01-01 00:00:00', '1970-01-01 00:00:00');
INSERT INTO `area` VALUES ('289', '咸阳市', '281', '0', 'CITY', '1970-01-01 00:00:00', '1970-01-01 00:00:00');
INSERT INTO `area` VALUES ('290', '延安市', '281', '0', 'CITY', '1970-01-01 00:00:00', '1970-01-01 00:00:00');
INSERT INTO `area` VALUES ('291', '榆林市', '281', '0', 'CITY', '1970-01-01 00:00:00', '1970-01-01 00:00:00');
INSERT INTO `area` VALUES ('292', '四川省', '0', '0', 'PROVINCE', '1970-01-01 00:00:00', '1970-01-01 00:00:00');
INSERT INTO `area` VALUES ('293', '阿坝藏族羌族自治州', '292', '0', 'CITY', '1970-01-01 00:00:00', '1970-01-01 00:00:00');
INSERT INTO `area` VALUES ('294', '巴中市', '292', '0', 'CITY', '1970-01-01 00:00:00', '1970-01-01 00:00:00');
INSERT INTO `area` VALUES ('295', '成都市', '292', '0', 'CITY', '1970-01-01 00:00:00', '1970-01-01 00:00:00');
INSERT INTO `area` VALUES ('296', '达州市', '292', '0', 'CITY', '1970-01-01 00:00:00', '1970-01-01 00:00:00');
INSERT INTO `area` VALUES ('297', '德阳市', '292', '0', 'CITY', '1970-01-01 00:00:00', '1970-01-01 00:00:00');
INSERT INTO `area` VALUES ('298', '甘孜藏族自治州', '292', '0', 'CITY', '1970-01-01 00:00:00', '1970-01-01 00:00:00');
INSERT INTO `area` VALUES ('299', '广安市', '292', '0', 'CITY', '1970-01-01 00:00:00', '1970-01-01 00:00:00');
INSERT INTO `area` VALUES ('300', '广元市', '292', '0', 'CITY', '1970-01-01 00:00:00', '1970-01-01 00:00:00');
INSERT INTO `area` VALUES ('301', '乐山市', '292', '0', 'CITY', '1970-01-01 00:00:00', '1970-01-01 00:00:00');
INSERT INTO `area` VALUES ('302', '凉山彝族自治州', '292', '0', 'CITY', '1970-01-01 00:00:00', '1970-01-01 00:00:00');
INSERT INTO `area` VALUES ('303', '泸州市', '292', '0', 'CITY', '1970-01-01 00:00:00', '1970-01-01 00:00:00');
INSERT INTO `area` VALUES ('304', '眉山市', '292', '0', 'CITY', '1970-01-01 00:00:00', '1970-01-01 00:00:00');
INSERT INTO `area` VALUES ('305', '绵阳市', '292', '0', 'CITY', '1970-01-01 00:00:00', '1970-01-01 00:00:00');
INSERT INTO `area` VALUES ('306', '内江市', '292', '0', 'CITY', '1970-01-01 00:00:00', '1970-01-01 00:00:00');
INSERT INTO `area` VALUES ('307', '南充市', '292', '0', 'CITY', '1970-01-01 00:00:00', '1970-01-01 00:00:00');
INSERT INTO `area` VALUES ('308', '攀枝花市', '292', '0', 'CITY', '1970-01-01 00:00:00', '1970-01-01 00:00:00');
INSERT INTO `area` VALUES ('309', '遂宁市', '292', '0', 'CITY', '1970-01-01 00:00:00', '1970-01-01 00:00:00');
INSERT INTO `area` VALUES ('310', '雅安市', '292', '0', 'CITY', '1970-01-01 00:00:00', '1970-01-01 00:00:00');
INSERT INTO `area` VALUES ('311', '宜宾市', '292', '0', 'CITY', '1970-01-01 00:00:00', '1970-01-01 00:00:00');
INSERT INTO `area` VALUES ('312', '资阳市', '292', '0', 'CITY', '1970-01-01 00:00:00', '1970-01-01 00:00:00');
INSERT INTO `area` VALUES ('313', '自贡市', '292', '0', 'CITY', '1970-01-01 00:00:00', '1970-01-01 00:00:00');
INSERT INTO `area` VALUES ('314', '西藏自治区', '0', '0', 'PROVINCE', '1970-01-01 00:00:00', '1970-01-01 00:00:00');
INSERT INTO `area` VALUES ('315', '阿里地区', '314', '0', 'CITY', '1970-01-01 00:00:00', '1970-01-01 00:00:00');
INSERT INTO `area` VALUES ('316', '昌都地区', '314', '0', 'CITY', '1970-01-01 00:00:00', '1970-01-01 00:00:00');
INSERT INTO `area` VALUES ('317', '拉萨市', '314', '0', 'CITY', '1970-01-01 00:00:00', '1970-01-01 00:00:00');
INSERT INTO `area` VALUES ('318', '林芝地区', '314', '0', 'CITY', '1970-01-01 00:00:00', '1970-01-01 00:00:00');
INSERT INTO `area` VALUES ('319', '那曲地区', '314', '0', 'CITY', '1970-01-01 00:00:00', '1970-01-01 00:00:00');
INSERT INTO `area` VALUES ('320', '日喀则地区', '314', '0', 'CITY', '1970-01-01 00:00:00', '1970-01-01 00:00:00');
INSERT INTO `area` VALUES ('321', '山南地区', '314', '0', 'CITY', '1970-01-01 00:00:00', '1970-01-01 00:00:00');
INSERT INTO `area` VALUES ('322', '新疆维吾尔自治区', '0', '0', 'PROVINCE', '1970-01-01 00:00:00', '1970-01-01 00:00:00');
INSERT INTO `area` VALUES ('323', '阿克苏地区', '322', '0', 'CITY', '1970-01-01 00:00:00', '1970-01-01 00:00:00');
INSERT INTO `area` VALUES ('324', '阿勒泰地区', '322', '0', 'CITY', '1970-01-01 00:00:00', '1970-01-01 00:00:00');
INSERT INTO `area` VALUES ('325', '巴音郭楞蒙古自治州', '322', '0', 'CITY', '1970-01-01 00:00:00', '1970-01-01 00:00:00');
INSERT INTO `area` VALUES ('326', '博尔塔拉蒙古自治州', '322', '0', 'CITY', '1970-01-01 00:00:00', '1970-01-01 00:00:00');
INSERT INTO `area` VALUES ('327', '昌吉回族自治州', '322', '0', 'CITY', '1970-01-01 00:00:00', '1970-01-01 00:00:00');
INSERT INTO `area` VALUES ('328', '哈密地区', '322', '0', 'CITY', '1970-01-01 00:00:00', '1970-01-01 00:00:00');
INSERT INTO `area` VALUES ('329', '和田地区', '322', '0', 'CITY', '1970-01-01 00:00:00', '1970-01-01 00:00:00');
INSERT INTO `area` VALUES ('330', '喀什地区', '322', '0', 'CITY', '1970-01-01 00:00:00', '1970-01-01 00:00:00');
INSERT INTO `area` VALUES ('331', '克拉玛依市', '322', '0', 'CITY', '1970-01-01 00:00:00', '1970-01-01 00:00:00');
INSERT INTO `area` VALUES ('332', '克孜勒苏柯尔克孜自治州', '322', '0', 'CITY', '1970-01-01 00:00:00', '1970-01-01 00:00:00');
INSERT INTO `area` VALUES ('333', '塔城地区', '322', '0', 'CITY', '1970-01-01 00:00:00', '1970-01-01 00:00:00');
INSERT INTO `area` VALUES ('334', '吐鲁番地区', '322', '0', 'CITY', '1970-01-01 00:00:00', '1970-01-01 00:00:00');
INSERT INTO `area` VALUES ('335', '乌鲁木齐市', '322', '0', 'CITY', '1970-01-01 00:00:00', '1970-01-01 00:00:00');
INSERT INTO `area` VALUES ('336', '伊犁哈萨克自治州', '322', '0', 'CITY', '1970-01-01 00:00:00', '1970-01-01 00:00:00');
INSERT INTO `area` VALUES ('337', '自治区直辖县级行政区划', '322', '0', 'CITY', '1970-01-01 00:00:00', '1970-01-01 00:00:00');
INSERT INTO `area` VALUES ('338', '云南省', '0', '0', 'PROVINCE', '1970-01-01 00:00:00', '1970-01-01 00:00:00');
INSERT INTO `area` VALUES ('339', '保山市', '338', '0', 'CITY', '1970-01-01 00:00:00', '1970-01-01 00:00:00');
INSERT INTO `area` VALUES ('340', '楚雄彝族自治州', '338', '0', 'CITY', '1970-01-01 00:00:00', '1970-01-01 00:00:00');
INSERT INTO `area` VALUES ('341', '大理白族自治州', '338', '0', 'CITY', '1970-01-01 00:00:00', '1970-01-01 00:00:00');
INSERT INTO `area` VALUES ('342', '德宏傣族景颇族自治州', '338', '0', 'CITY', '1970-01-01 00:00:00', '1970-01-01 00:00:00');
INSERT INTO `area` VALUES ('343', '迪庆藏族自治州', '338', '0', 'CITY', '1970-01-01 00:00:00', '1970-01-01 00:00:00');
INSERT INTO `area` VALUES ('344', '红河哈尼族彝族自治州', '338', '0', 'CITY', '1970-01-01 00:00:00', '1970-01-01 00:00:00');
INSERT INTO `area` VALUES ('345', '昆明市', '338', '0', 'CITY', '1970-01-01 00:00:00', '1970-01-01 00:00:00');
INSERT INTO `area` VALUES ('346', '丽江市', '338', '0', 'CITY', '1970-01-01 00:00:00', '1970-01-01 00:00:00');
INSERT INTO `area` VALUES ('347', '临沧市', '338', '0', 'CITY', '1970-01-01 00:00:00', '1970-01-01 00:00:00');
INSERT INTO `area` VALUES ('348', '怒江僳僳族自治州', '338', '0', 'CITY', '1970-01-01 00:00:00', '1970-01-01 00:00:00');
INSERT INTO `area` VALUES ('349', '普洱市', '338', '0', 'CITY', '1970-01-01 00:00:00', '1970-01-01 00:00:00');
INSERT INTO `area` VALUES ('350', '曲靖市', '338', '0', 'CITY', '1970-01-01 00:00:00', '1970-01-01 00:00:00');
INSERT INTO `area` VALUES ('351', '文山壮族苗族自治州', '338', '0', 'CITY', '1970-01-01 00:00:00', '1970-01-01 00:00:00');
INSERT INTO `area` VALUES ('352', '西双版纳傣族自治州', '338', '0', 'CITY', '1970-01-01 00:00:00', '1970-01-01 00:00:00');
INSERT INTO `area` VALUES ('353', '玉溪市', '338', '0', 'CITY', '1970-01-01 00:00:00', '1970-01-01 00:00:00');
INSERT INTO `area` VALUES ('354', '昭通市', '338', '0', 'CITY', '1970-01-01 00:00:00', '1970-01-01 00:00:00');
INSERT INTO `area` VALUES ('355', '浙江省', '0', '0', 'PROVINCE', '1970-01-01 00:00:00', '1970-01-01 00:00:00');
INSERT INTO `area` VALUES ('356', '杭州市', '355', '0', 'CITY', '1970-01-01 00:00:00', '1970-01-01 00:00:00');
INSERT INTO `area` VALUES ('357', '湖州市', '355', '0', 'CITY', '1970-01-01 00:00:00', '1970-01-01 00:00:00');
INSERT INTO `area` VALUES ('358', '嘉兴市', '355', '0', 'CITY', '1970-01-01 00:00:00', '1970-01-01 00:00:00');
INSERT INTO `area` VALUES ('359', '金华市', '355', '0', 'CITY', '1970-01-01 00:00:00', '1970-01-01 00:00:00');
INSERT INTO `area` VALUES ('360', '丽水市', '355', '0', 'CITY', '1970-01-01 00:00:00', '1970-01-01 00:00:00');
INSERT INTO `area` VALUES ('361', '宁波市', '355', '0', 'CITY', '1970-01-01 00:00:00', '1970-01-01 00:00:00');
INSERT INTO `area` VALUES ('362', '衢州市', '355', '0', 'CITY', '1970-01-01 00:00:00', '1970-01-01 00:00:00');
INSERT INTO `area` VALUES ('363', '绍兴市', '355', '0', 'CITY', '1970-01-01 00:00:00', '1970-01-01 00:00:00');
INSERT INTO `area` VALUES ('364', '台州市', '355', '0', 'CITY', '1970-01-01 00:00:00', '1970-01-01 00:00:00');
INSERT INTO `area` VALUES ('365', '温州市', '355', '0', 'CITY', '1970-01-01 00:00:00', '1970-01-01 00:00:00');
INSERT INTO `area` VALUES ('366', '舟山市', '355', '0', 'CITY', '1970-01-01 00:00:00', '1970-01-01 00:00:00');
INSERT INTO `area` VALUES ('367', '北京市', '0', '0', 'PROVINCE', '1970-01-01 00:00:00', '1970-01-01 00:00:00');
INSERT INTO `area` VALUES ('368', '重庆市', '0', '0', 'PROVINCE', '1970-01-01 00:00:00', '1970-01-01 00:00:00');
INSERT INTO `area` VALUES ('369', '上海市', '0', '0', 'PROVINCE', '1970-01-01 00:00:00', '1970-01-01 00:00:00');
INSERT INTO `area` VALUES ('370', '天津市', '0', '0', 'PROVINCE', '1970-01-01 00:00:00', '1970-01-01 00:00:00');

-- ----------------------------
-- Table structure for category
-- ----------------------------
DROP TABLE IF EXISTS `category`;
CREATE TABLE `category` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增长id',
  `name` varchar(50) NOT NULL COMMENT '类目名称',
  `lev` int(11) NOT NULL DEFAULT '1' COMMENT '类目的层级',
  `parent` int(11) DEFAULT '0' COMMENT '父类目id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='商品类目表';

-- ----------------------------
-- Records of category
-- ----------------------------

-- ----------------------------
-- Table structure for favorite
-- ----------------------------
DROP TABLE IF EXISTS `favorite`;
CREATE TABLE `favorite` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `member_id` bigint(20) NOT NULL COMMENT '用户标识',
  `product_id` bigint(20) NOT NULL COMMENT '商品标识',
  `create_time` datetime NOT NULL COMMENT '创建时间 ',
  `update_time` datetime NOT NULL COMMENT '更新时间 ',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='商品收藏表';

-- ----------------------------
-- Records of favorite
-- ----------------------------

-- ----------------------------
-- Table structure for goods
-- ----------------------------
DROP TABLE IF EXISTS `goods`;
CREATE TABLE `goods` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '商品id，主键，自增长',
  `name` varchar(100) NOT NULL COMMENT '商品名称，不能为空',
  `short_name` varchar(100) DEFAULT NULL COMMENT '商品短名称',
  `category_id` int(11) not null COMMENT '商品分类标识',
  `length` double DEFAULT NULL COMMENT '商品的长度',
  `width` double DEFAULT NULL COMMENT '商品的宽度',
  `height` double DEFAULT NULL COMMENT '商品的高度',
  `weight` double DEFAULT NULL COMMENT '商品的重量',
  `cost_price` double DEFAULT NULL COMMENT '商品成本价',
  `selling_price` double NOT NULL COMMENT '商品售价,不能为空',
  `original_price` double DEFAULT NULL COMMENT '商品原价',
  `detail` text COMMENT '商品的详情信息',
  `basic_stock` int(11) DEFAULT '0' COMMENT '商品的库存，默认值为0',
  `upperShelf` char(1) DEFAULT 'N' COMMENT '商品是否上架，默认为否',
  `examine` char(1) DEFAULT 'N' COMMENT '是否审核，默认为否',
  `deleted` char(1) DEFAULT 'N' COMMENT '是否为逻辑删除状态，默认为否',
  `create_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '商品创建时间，不能为空，默认为0',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '商品修改时间，不能为空，默认为数据插入时间，数据更改时，自动同步为修改时的时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='商品基本信息表';

-- ----------------------------
-- Table structure for goods_image
-- ----------------------------
DROP TABLE IF EXISTS `goods_image`;
CREATE TABLE `goods_image` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增长主键id',
  `goods_id` int(11) DEFAULT NULL COMMENT '商品的id',
  `image_url` varchar(256) not null comment '图片地址',
  `type` int(11) DEFAULT NULL COMMENT '图片类型，主图/副图',
  `sort` int(11) DEFAULT NULL COMMENT '排序',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='商品图片映射表';

-- ----------------------------
-- Table structure for member
-- ----------------------------
DROP TABLE IF EXISTS `member`;
CREATE TABLE `member` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(64) NOT NULL,
  `password` varchar(32) NOT NULL,
  `telphone` varchar(11) DEFAULT NULL,
  `email` varchar(32) DEFAULT NULL,
  `register_ip` varchar(255) DEFAULT NULL,
  `register_date` datetime DEFAULT NULL,
  `created_time` datetime DEFAULT NULL,
  `updated_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of member
-- ----------------------------

CREATE TABLE `cart` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `product_id` int(11) DEFAULT NULL COMMENT '商品id',
  `quantity` int(11) DEFAULT NULL COMMENT '数量',
  `checked` int(11) DEFAULT NULL COMMENT '是否选择,1=已勾选,0=未勾选',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `user_id_index` (`user_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=146 DEFAULT CHARSET=utf8;

CREATE TABLE `order` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '订单id',
  `order_no` bigint(20) DEFAULT NULL COMMENT '订单号',
  `user_id` int(11) DEFAULT NULL COMMENT '用户id',
  `shipping_id` int(11) DEFAULT NULL,
  `payment` decimal(20,2) DEFAULT NULL COMMENT '实际付款金额,单位是元,保留两位小数',
  `payment_type` int(4) DEFAULT NULL COMMENT '支付类型,1-在线支付',
  `postage` int(10) DEFAULT NULL COMMENT '运费,单位是元',
  `status` int(10) DEFAULT NULL COMMENT '订单状态:0-已取消-10-未付款，20-已付款，40-已发货，50-交易成功，60-交易关闭',
  `payment_time` datetime DEFAULT NULL COMMENT '支付时间',
  `send_time` datetime DEFAULT NULL COMMENT '发货时间',
  `end_time` datetime DEFAULT NULL COMMENT '交易完成时间',
  `close_time` datetime DEFAULT NULL COMMENT '交易关闭时间',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `order_no_index` (`order_no`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=118 DEFAULT CHARSET=utf8;

CREATE TABLE `order_item` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '订单子表id',
  `user_id` int(11) DEFAULT NULL,
  `order_no` bigint(20) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL COMMENT '商品id',
  `product_name` varchar(100) DEFAULT NULL COMMENT '商品名称',
  `product_image` varchar(500) DEFAULT NULL COMMENT '商品图片地址',
  `current_unit_price` decimal(20,2) DEFAULT NULL COMMENT '生成订单时的商品单价，单位是元,保留两位小数',
  `quantity` int(10) DEFAULT NULL COMMENT '商品数量',
  `total_price` decimal(20,2) DEFAULT NULL COMMENT '商品总价,单位是元,保留两位小数',
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `order_no_index` (`order_no`) USING BTREE,
  KEY `order_no_user_id_index` (`user_id`,`order_no`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=135 DEFAULT CHARSET=utf8;

CREATE TABLE `pay_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL COMMENT '用户id',
  `order_no` bigint(20) DEFAULT NULL COMMENT '订单号',
  `pay_platform` int(10) DEFAULT NULL COMMENT '支付平台:1-支付宝,2-微信',
  `platform_number` varchar(200) DEFAULT NULL COMMENT '支付宝支付流水号',
  `platform_status` varchar(20) DEFAULT NULL COMMENT '支付宝支付状态',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=utf8;

CREATE TABLE `shipping` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL COMMENT '用户id',
  `receiver_name` varchar(20) DEFAULT NULL COMMENT '收货姓名',
  `receiver_phone` varchar(20) DEFAULT NULL COMMENT '收货固定电话',
  `receiver_mobile` varchar(20) DEFAULT NULL COMMENT '收货移动电话',
  `receiver_province` varchar(20) DEFAULT NULL COMMENT '省份',
  `receiver_city` varchar(20) DEFAULT NULL COMMENT '城市',
  `receiver_district` varchar(20) DEFAULT NULL COMMENT '区/县',
  `receiver_address` varchar(200) DEFAULT NULL COMMENT '详细地址',
  `receiver_zip` varchar(6) DEFAULT NULL COMMENT '邮编',
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8;

-- 计算传入字符串的总length
DELIMITER $$

DROP function IF EXISTS `func_split_TotalLength` $$

CREATE FUNCTION `func_split_TotalLength`

(f_string varchar(1000),f_delimiter varchar(5)) RETURNS int(11)

BEGIN

    return 1+(length(f_string) - length(replace(f_string,f_delimiter,'')));

END$$

DELIMITER;
-- 拆分传入的字符串，返回拆分后的新字符串
DELIMITER $$

DROP function IF EXISTS `func_split` $$

CREATE  FUNCTION `func_split`

(f_string varchar(1000),f_delimiter varchar(5),f_order int) RETURNS varchar(255) CHARSET utf8

BEGIN
        declare result varchar(255) default '';

        set result = reverse(substring_index(reverse(substring_index(f_string,f_delimiter,f_order)),f_delimiter,1));

        return result;

END$$

DELIMITER;
-- 更新角色权限的存储过程
delimiter $$
DROP PROCEDURE IF EXISTS `role_menu_update` ;

CREATE PROCEDURE `role_menu_update`

(IN menuids varchar(3000),IN i_roleid INT,IN userid INT)

BEGIN

-- 拆分结果

DECLARE cnt INT DEFAULT 0;

DECLARE i INT DEFAULT 0;

SET cnt = func_split_TotalLength(menuids,',');
DELETE FROM role_menu WHERE roleid = i_roleid;

WHILE i < cnt

DO

    SET i = i + 1;

    INSERT INTO role_menu(roleid,menuid,creator) VALUES (i_roleid,func_split(menuids,',',i),userid);

END WHILE;

END $$

-- 更新用户角色信息
delimiter $$
DROP PROCEDURE IF EXISTS `user_role_update` ;

CREATE PROCEDURE `user_role_update`

(IN roleids varchar(3000),IN i_userid INT,IN i_creator INT)

BEGIN

-- 拆分结果

DECLARE cnt INT DEFAULT 0;

DECLARE i INT DEFAULT 0;

SET cnt = func_split_TotalLength(roleids,',');
DELETE FROM user_role WHERE userid = i_userid;

WHILE i < cnt

DO

    SET i = i + 1;

    INSERT INTO user_role(userid,roleid,creator) VALUES (i_userid,func_split(roleids,',',i),i_creator);

END WHILE;

END $$

-- 删除菜单的存储过程
DROP PROCEDURE IF EXISTS `delete_menu`;
CREATE  PROCEDURE `delete_menu`(IN `menuid` int)
BEGIN

	DECLARE rowNUM INT DEFAULT 0;
	create temporary table if not exists menu_del_temp -- 不存在则创建临时表
  (
     id INT
  );
	create temporary table if not exists menu_del_temp2 -- 不存在则创建临时表
  (
     id INT
  );
create temporary table if not exists menu_del_temp3 -- 不存在则创建临时表
  (
     id INT
  );
	TRUNCATE TABLE menu_del_temp2;
	TRUNCATE TABLE menu_del_temp; -- 清空临时表
		INSERT INTO menu_del_temp SELECT id FROM  menu where parentid=menuid;
	-- DELETE FROM category WHERE ID IN (SELECT id FROM category_del_temp);
	INSERT INTO menu_del_temp2 SELECT id FROM  menu where parentid IN (SELECT id FROM menu_del_temp);
	SELECT COUNT(id) INTO rowNUM FROM menu_del_temp2;
	WHILE rowNUM > 0 DO
		INSERT INTO menu_del_temp SELECT id FROM menu_del_temp2;
		TRUNCATE TABLE menu_del_temp3;
		INSERT INTO menu_del_temp3 SELECT id FROM menu_del_temp2;
		TRUNCATE TABLE menu_del_temp2;
		INSERT INTO menu_del_temp2 SELECT id FROM  menu where parentid IN (SELECT id FROM menu_del_temp3);
		SELECT COUNT(id) INTO rowNUM FROM menu_del_temp2;
	END WHILE;
	INSERT INTO menu_del_temp(id) values(menuid);
	DELETE FROM menu WHERE id IN (SELECT id FROM menu_del_temp);
	DELETE FROM role_menu WHERE menuid IN (SELECT id FROM menu_del_temp);
END;