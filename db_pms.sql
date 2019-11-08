/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50539
Source Host           : localhost:3306
Source Database       : db_pms

Target Server Type    : MYSQL
Target Server Version : 50539
File Encoding         : 65001

Date: 2019-08-28 12:58:33
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `t_image`
-- ----------------------------
DROP TABLE IF EXISTS `t_image`;
CREATE TABLE `t_image` (
  `img_id` int(11) NOT NULL AUTO_INCREMENT,
  `item_id` int(11) NOT NULL,
  `img_name` varchar(50) NOT NULL DEFAULT '',
  `img_url` varchar(200) NOT NULL DEFAULT '',
  `img_type` int(11) NOT NULL COMMENT '类型',
  PRIMARY KEY (`img_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_image
-- ----------------------------
INSERT INTO `t_image` VALUES ('1', '1', '兔子', '/upload/images/20190828125658275.jpg', '1');
INSERT INTO `t_image` VALUES ('2', '1', '树', '/upload/images/20190828125705128.jpg', '1');
INSERT INTO `t_image` VALUES ('3', '1', '气球', '/upload/images/20190828125716598.jpg', '1');

-- ----------------------------
-- Table structure for `t_item`
-- ----------------------------
DROP TABLE IF EXISTS `t_item`;
CREATE TABLE `t_item` (
  `item_id` int(11) NOT NULL AUTO_INCREMENT,
  `item_name` varchar(50) NOT NULL DEFAULT '',
  `item_price` float(10,0) NOT NULL COMMENT '价格',
  `prod_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP COMMENT '生产日期',
  PRIMARY KEY (`item_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_item
-- ----------------------------
INSERT INTO `t_item` VALUES ('1', '衣服0', '99', '2019-08-08 16:22:53');
INSERT INTO `t_item` VALUES ('2', '衣服1', '100', '2019-08-08 16:22:53');
INSERT INTO `t_item` VALUES ('3', '衣服2', '101', '2019-08-08 16:22:53');
INSERT INTO `t_item` VALUES ('4', '衣服3', '102', '2019-08-08 16:22:53');
INSERT INTO `t_item` VALUES ('5', '衣服4', '103', '2019-08-08 16:22:53');
INSERT INTO `t_item` VALUES ('6', '衣服5', '104', '2019-08-08 16:22:53');
INSERT INTO `t_item` VALUES ('7', '衣服6', '105', '2019-08-08 16:22:53');
INSERT INTO `t_item` VALUES ('8', '衣服7', '106', '2019-08-08 16:22:53');
INSERT INTO `t_item` VALUES ('9', '衣服8', '107', '2019-08-08 16:22:53');
INSERT INTO `t_item` VALUES ('10', '衣服9', '108', '2019-08-08 16:22:53');

-- ----------------------------
-- Table structure for `t_menu`
-- ----------------------------
DROP TABLE IF EXISTS `t_menu`;
CREATE TABLE `t_menu` (
  `menu_id` int(11) NOT NULL AUTO_INCREMENT,
  `menu_name` varchar(50) NOT NULL DEFAULT '',
  `parent_id` int(11) NOT NULL DEFAULT '0' COMMENT '父级id',
  `menu_icon` varchar(100) NOT NULL DEFAULT '',
  `menu_url` varchar(150) NOT NULL DEFAULT '#',
  `menu_flag` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`menu_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_menu
-- ----------------------------
INSERT INTO `t_menu` VALUES ('1', '系统管理', '0', 'fa-cogs', '#', '1');
INSERT INTO `t_menu` VALUES ('2', '用户管理', '1', 'fa-user-circle', 'user/list/1', '1');
INSERT INTO `t_menu` VALUES ('3', '角色管理', '1', 'fa-id-card', 'role/list/1', '1');
INSERT INTO `t_menu` VALUES ('4', '权限管理', '1', 'fa-window-restore', 'menu/list/1', '1');
INSERT INTO `t_menu` VALUES ('5', '商品管理', '0', 'fa-truck', '#', '1');
INSERT INTO `t_menu` VALUES ('6', '图片管理', '5', 'fa-picture-o', 'image/list/1', '1');
INSERT INTO `t_menu` VALUES ('7', '物品管理', '5', 'fa-shopping-basket', 'image/list/1', '1');

-- ----------------------------
-- Table structure for `t_role`
-- ----------------------------
DROP TABLE IF EXISTS `t_role`;
CREATE TABLE `t_role` (
  `role_id` int(11) NOT NULL AUTO_INCREMENT,
  `role_name` varchar(20) NOT NULL DEFAULT '',
  `role_description` varchar(50) DEFAULT '',
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_role
-- ----------------------------
INSERT INTO `t_role` VALUES ('1', 'superAdmin', '超级管理员');
INSERT INTO `t_role` VALUES ('2', 'admin', '管理员');
INSERT INTO `t_role` VALUES ('3', 'user', '用户');
INSERT INTO `t_role` VALUES ('4', 'merchant', '商家');
INSERT INTO `t_role` VALUES ('5', 'visitor', '游客');

-- ----------------------------
-- Table structure for `t_role_menu`
-- ----------------------------
DROP TABLE IF EXISTS `t_role_menu`;
CREATE TABLE `t_role_menu` (
  `roleid` int(11) NOT NULL,
  `menuid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_role_menu
-- ----------------------------
INSERT INTO `t_role_menu` VALUES ('2', '1');
INSERT INTO `t_role_menu` VALUES ('2', '2');
INSERT INTO `t_role_menu` VALUES ('2', '3');
INSERT INTO `t_role_menu` VALUES ('2', '4');
INSERT INTO `t_role_menu` VALUES ('3', '1');
INSERT INTO `t_role_menu` VALUES ('3', '3');
INSERT INTO `t_role_menu` VALUES ('3', '5');
INSERT INTO `t_role_menu` VALUES ('3', '6');
INSERT INTO `t_role_menu` VALUES ('6', '5');
INSERT INTO `t_role_menu` VALUES ('6', '6');
INSERT INTO `t_role_menu` VALUES ('1', '1');
INSERT INTO `t_role_menu` VALUES ('1', '2');
INSERT INTO `t_role_menu` VALUES ('1', '3');
INSERT INTO `t_role_menu` VALUES ('1', '4');
INSERT INTO `t_role_menu` VALUES ('1', '5');
INSERT INTO `t_role_menu` VALUES ('1', '6');
INSERT INTO `t_role_menu` VALUES ('1', '7');
INSERT INTO `t_role_menu` VALUES ('4', '5');
INSERT INTO `t_role_menu` VALUES ('4', '6');
INSERT INTO `t_role_menu` VALUES ('4', '7');

-- ----------------------------
-- Table structure for `t_user`
-- ----------------------------
DROP TABLE IF EXISTS `t_user`;
CREATE TABLE `t_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL DEFAULT '',
  `password` varchar(50) NOT NULL DEFAULT '',
  `phone` char(11) NOT NULL DEFAULT '',
  `nickname` varchar(50) NOT NULL DEFAULT '',
  `email` varchar(20) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_user
-- ----------------------------
INSERT INTO `t_user` VALUES ('1', 'user', '010203', '15768453217', 'user', 'user@qq.com');
INSERT INTO `t_user` VALUES ('2', '张三', 'zs', '15365874951', '小张', 'zhangsan@qq.com');
INSERT INTO `t_user` VALUES ('3', '孙七', 'sq', '18795632487', '小孙', 'sunqi@163.com');
INSERT INTO `t_user` VALUES ('4', '小明', 'xm', '16598472357', '小小', 'ming@qq.com');
INSERT INTO `t_user` VALUES ('5', '李四', 'ls', '15684835974', '小李', 'lisi@qq.com');
INSERT INTO `t_user` VALUES ('6', '王五', 'ww', '15615453625', '小王', 'wangwu@qq.com');
INSERT INTO `t_user` VALUES ('7', '高大山', 'gds', '15698476235', '大山', 'dashan@qq.com');
INSERT INTO `t_user` VALUES ('8', '谢大海', 'xdh', '15632687461', '大海', 'dahai@qq.com');
INSERT INTO `t_user` VALUES ('9', '彭万里', 'pwl', '15469587513', '万里', 'wangli@qq.com');
INSERT INTO `t_user` VALUES ('10', '刘永生', 'lys', '15686954723', '永生', 'ys@qq.com');
INSERT INTO `t_user` VALUES ('11', 'Tom', 'tom', '15098746581', '汤姆', 'tom@qq.com');
INSERT INTO `t_user` VALUES ('12', 'Jack', 'jack', '15268427954', '杰克', 'jack@qq.com');
INSERT INTO `t_user` VALUES ('13', '赵六', 'zl', '15098765784', '小赵', 'zhaol@qq.com');

-- ----------------------------
-- Table structure for `t_userinfo`
-- ----------------------------
DROP TABLE IF EXISTS `t_userinfo`;
CREATE TABLE `t_userinfo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL,
  `name` varchar(50) NOT NULL DEFAULT '',
  `sex` int(1) NOT NULL,
  `birthday` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_userinfo
-- ----------------------------
INSERT INTO `t_userinfo` VALUES ('1', '1', '张三1', '1', '2019-08-09 09:43:16');
INSERT INTO `t_userinfo` VALUES ('2', '2', '张三2', '1', '2019-08-09 09:43:16');
INSERT INTO `t_userinfo` VALUES ('3', '3', '张三3', '1', '2019-08-09 09:43:16');
INSERT INTO `t_userinfo` VALUES ('4', '4', '张三4', '1', '2019-08-09 09:43:16');
INSERT INTO `t_userinfo` VALUES ('5', '5', '张三5', '1', '2019-08-09 09:43:16');
INSERT INTO `t_userinfo` VALUES ('6', '6', '张三6', '1', '2019-08-09 09:43:16');
INSERT INTO `t_userinfo` VALUES ('7', '7', '张三7', '1', '2019-08-09 09:43:16');
INSERT INTO `t_userinfo` VALUES ('8', '8', '张三8', '1', '2019-08-09 09:43:16');
INSERT INTO `t_userinfo` VALUES ('9', '9', '张三9', '1', '2019-08-09 09:43:16');
INSERT INTO `t_userinfo` VALUES ('10', '10', '张三10', '1', '2019-08-09 09:43:16');

-- ----------------------------
-- Table structure for `t_user_role`
-- ----------------------------
DROP TABLE IF EXISTS `t_user_role`;
CREATE TABLE `t_user_role` (
  `userid` int(11) NOT NULL,
  `roleid` int(11) NOT NULL DEFAULT '4'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_user_role
-- ----------------------------
INSERT INTO `t_user_role` VALUES ('13', '3');
INSERT INTO `t_user_role` VALUES ('13', '5');
INSERT INTO `t_user_role` VALUES ('6', '3');
INSERT INTO `t_user_role` VALUES ('6', '4');
INSERT INTO `t_user_role` VALUES ('7', '2');
INSERT INTO `t_user_role` VALUES ('7', '6');
INSERT INTO `t_user_role` VALUES ('8', '3');
INSERT INTO `t_user_role` VALUES ('8', '4');
INSERT INTO `t_user_role` VALUES ('9', '3');
INSERT INTO `t_user_role` VALUES ('9', '5');
INSERT INTO `t_user_role` VALUES ('10', '4');
INSERT INTO `t_user_role` VALUES ('10', '6');
INSERT INTO `t_user_role` VALUES ('11', '2');
INSERT INTO `t_user_role` VALUES ('11', '3');
INSERT INTO `t_user_role` VALUES ('12', '3');
INSERT INTO `t_user_role` VALUES ('12', '5');
INSERT INTO `t_user_role` VALUES ('12', '6');
INSERT INTO `t_user_role` VALUES ('3', '1');
INSERT INTO `t_user_role` VALUES ('3', '2');
INSERT INTO `t_user_role` VALUES ('3', '3');
INSERT INTO `t_user_role` VALUES ('3', '5');
INSERT INTO `t_user_role` VALUES ('1', '1');
INSERT INTO `t_user_role` VALUES ('1', '2');
INSERT INTO `t_user_role` VALUES ('1', '3');
INSERT INTO `t_user_role` VALUES ('1', '4');
INSERT INTO `t_user_role` VALUES ('1', '5');
INSERT INTO `t_user_role` VALUES ('2', '1');
INSERT INTO `t_user_role` VALUES ('2', '2');
INSERT INTO `t_user_role` VALUES ('2', '3');
INSERT INTO `t_user_role` VALUES ('4', '3');
INSERT INTO `t_user_role` VALUES ('4', '5');
INSERT INTO `t_user_role` VALUES ('4', '4');
INSERT INTO `t_user_role` VALUES ('5', '3');
INSERT INTO `t_user_role` VALUES ('5', '5');
INSERT INTO `t_user_role` VALUES ('5', '4');
