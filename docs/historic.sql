/*
Navicat MySQL Data Transfer

Source Server         : 10.8.78.188
Source Server Version : 50643
Source Host           : 10.8.78.188:3306
Source Database       : historic

Target Server Type    : MYSQL
Target Server Version : 50643
File Encoding         : 65001

Date: 2019-04-10 11:06:42
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
