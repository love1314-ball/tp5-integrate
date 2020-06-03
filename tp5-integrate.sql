/*
Navicat MySQL Data Transfer

Source Server         : 本地MySQL数据库
Source Server Version : 50726
Source Host           : localhost:3306
Source Database       : tp5-integrate

Target Server Type    : MYSQL
Target Server Version : 50726
File Encoding         : 65001

Date: 2020-06-03 18:16:25
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for ob_ad
-- ----------------------------
DROP TABLE IF EXISTS `ob_ad`;
CREATE TABLE `ob_ad` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `category` varchar(32) NOT NULL DEFAULT '0' COMMENT '分类',
  `name` varchar(255) NOT NULL DEFAULT '' COMMENT '分类名称',
  `description` varchar(255) DEFAULT '' COMMENT '描述',
  `url` varchar(255) DEFAULT '' COMMENT '链接',
  `target` varchar(10) DEFAULT '' COMMENT '打开方式',
  `image` varchar(255) DEFAULT '' COMMENT '图片',
  `sort_order` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '状态',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='广告';

-- ----------------------------
-- Records of ob_ad
-- ----------------------------

-- ----------------------------
-- Table structure for ob_admin
-- ----------------------------
DROP TABLE IF EXISTS `ob_admin`;
CREATE TABLE `ob_admin` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(32) NOT NULL DEFAULT '' COMMENT '管理员用户名',
  `password` varchar(32) NOT NULL DEFAULT '' COMMENT '管理员密码',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '0禁用/1启动',
  `last_login_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '上次登录时间',
  `last_login_ip` varchar(16) NOT NULL DEFAULT '' COMMENT '上次登录IP',
  `login_count` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '登录次数',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='管理员';

-- ----------------------------
-- Records of ob_admin
-- ----------------------------
INSERT INTO `ob_admin` VALUES ('1', 'admin', 'e10adc3949ba59abbe56e057f20f883e', '1', '1591169264', '127.0.0.1', '30', '0', '1591169264');
INSERT INTO `ob_admin` VALUES ('2', 'demo', 'e10adc3949ba59abbe56e057f20f883e', '1', '1545449154', '127.0.0.1', '2', '1539076102', '1545449154');

-- ----------------------------
-- Table structure for ob_admin_log
-- ----------------------------
DROP TABLE IF EXISTS `ob_admin_log`;
CREATE TABLE `ob_admin_log` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `admin_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT '管理员id',
  `username` varchar(32) NOT NULL DEFAULT '' COMMENT '管理员用户名',
  `useragent` varchar(255) NOT NULL DEFAULT '' COMMENT 'User-Agent',
  `ip` varchar(16) NOT NULL DEFAULT '' COMMENT 'ip地址',
  `url` varchar(255) NOT NULL DEFAULT '' COMMENT '请求链接',
  `method` varchar(32) NOT NULL DEFAULT '' COMMENT '请求类型',
  `type` varchar(32) NOT NULL DEFAULT '' COMMENT '资源类型',
  `param` text NOT NULL COMMENT '请求参数',
  `remark` varchar(255) NOT NULL DEFAULT '' COMMENT '日志备注',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='管理员日志';

-- ----------------------------
-- Records of ob_admin_log
-- ----------------------------
INSERT INTO `ob_admin_log` VALUES ('1', '1', 'admin', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36', '127.0.0.1', 'http://www.openbms.com/admin/database/del/time/1552277088.html', 'POST', 'json', '{\"time\":\"1552277088\"}', '删除了数据', '1552277146');
INSERT INTO `ob_admin_log` VALUES ('2', '1', 'admin', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.169 Safari/537.36', '127.0.0.1', 'http://www.qinxue.com/admin.html', 'POST', 'json', '{\"username\":\"admin\",\"password\":\"123456\",\"captcha\":\"3e8q\"}', '登录了后台系统', '1586596387');
INSERT INTO `ob_admin_log` VALUES ('3', '1', 'admin', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.169 Safari/537.36', '127.0.0.1', 'http://www.qinxue.com/admin/config/setting.html', 'POST', 'json', '{\"lejRej\":\"\\/upload\\/image\\/20200411\\/83798ea1a2d0ab7cdcd777f54f5945b4.jpg\",\"mbk5ez\":\"OpenBMS\",\"nel5aK\":\"OpenBMS \\u5f00\\u6e90\\u540e\\u53f0\\u7ba1\\u7406\\u7cfb\\u7edf\",\"vbmOeY\":\"OpenBMS,\\u5f00\\u6e90\\u540e\\u53f0\\u7ba1\\u7406\\u7cfb\\u7edf\",\"penRe7\":\"OpenBMS,\\u5f00\\u6e90\\u540e\\u53f0\\u7ba1\\u7406\\u7cfb\\u7edf,Open Background Management System \\u5f00\\u6e90\\u540e\\u53f0\\u7ba1\\u7406\\u7cfb\\u7edf\",\"xbojag\":\"\",\"mep2bM\":\"\",\"zbq2dp\":\"\"}', '更新基本设置', '1586596403');
INSERT INTO `ob_admin_log` VALUES ('4', '1', 'admin', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.169 Safari/537.36', '127.0.0.1', 'http://www.qinxue.com/admin/index/clear.html', 'POST', 'json', '[]', '清除了系统缓存', '1586596407');
INSERT INTO `ob_admin_log` VALUES ('5', '1', 'admin', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.169 Safari/537.36', '127.0.0.1', 'http://www.qinxue.com/admin/index/clear.html', 'POST', 'json', '[]', '清除了系统缓存', '1586596534');
INSERT INTO `ob_admin_log` VALUES ('6', '1', 'admin', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.169 Safari/537.36', '127.0.0.1', 'http://www.qinxue.com/admin.html', 'POST', 'json', '{\"username\":\"admin\",\"password\":\"123456\",\"captcha\":\"urcf\"}', '登录了后台系统', '1586597954');
INSERT INTO `ob_admin_log` VALUES ('7', '1', 'admin', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.169 Safari/537.36', '127.0.0.1', 'http://www.qinxue.com/admin/auth/editrule.html?id=2', 'POST', 'json', '{\"id\":\"2\",\"name\":\"\\u7528\\u6237\",\"url\":\"\",\"icon\":\"fa fa-users\",\"type\":\"nav\",\"index\":\"0\",\"sort_order\":\"3\",\"pid\":\"0\"}', '修改了权限规则', '1586604743');
INSERT INTO `ob_admin_log` VALUES ('8', '1', 'admin', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.169 Safari/537.36', '127.0.0.1', 'http://www.qinxue.com/admin/auth/editrule.html?id=9', 'POST', 'json', '{\"id\":\"9\",\"name\":\"\\u7528\\u6237\\u7ba1\\u7406\",\"url\":\"admin\\/user\\/index\",\"icon\":\"fa fa-users\",\"type\":\"nav\",\"index\":\"1\",\"sort_order\":\"0\",\"pid\":\"2\"}', '修改了权限规则', '1586604752');
INSERT INTO `ob_admin_log` VALUES ('9', '1', 'admin', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.169 Safari/537.36', '127.0.0.1', 'http://www.qinxue.com/admin/auth/editrule.html?id=10', 'POST', 'json', '{\"id\":\"10\",\"name\":\"\\u4f1a\\u5458\\u65e5\\u5fd7\",\"url\":\"admin\\/user\\/log\",\"icon\":\"fa fa-clock-o\",\"type\":\"auth\",\"index\":\"1\",\"sort_order\":\"0\",\"pid\":\"2\"}', '修改了权限规则', '1586604777');
INSERT INTO `ob_admin_log` VALUES ('10', '1', 'admin', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.169 Safari/537.36', '127.0.0.1', 'http://www.qinxue.com/admin/user/del/id/2014.html', 'POST', 'json', '{\"id\":\"2014\"}', '删除了用户', '1586604848');
INSERT INTO `ob_admin_log` VALUES ('11', '1', 'admin', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.169 Safari/537.36', '127.0.0.1', 'http://www.qinxue.com/admin/auth/addrule.html?id=0', 'POST', 'json', '{\"id\":\"\",\"name\":\"\\u66f2\\u79cd\\u7ba1\\u7406\",\"url\":\"admin\\/Song\\/index\",\"icon\":\"fa fa-bell-o cc_pointer\",\"type\":\"nav\",\"index\":\"0\",\"sort_order\":\"0\",\"pid\":\"0\"}', '添加了权限规则', '1586605125');
INSERT INTO `ob_admin_log` VALUES ('12', '1', 'admin', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.169 Safari/537.36', '127.0.0.1', 'http://www.qinxue.com/admin/auth/addrule.html?id=56', 'POST', 'json', '{\"id\":\"\",\"name\":\"\\u589e\\u52a0\\u5206\\u7c7b\",\"url\":\"admin\\/Song\\/add\",\"icon\":\"\",\"type\":\"nav\",\"index\":\"0\",\"sort_order\":\"0\",\"pid\":\"56\"}', '添加了权限规则', '1586605168');
INSERT INTO `ob_admin_log` VALUES ('13', '1', 'admin', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.169 Safari/537.36', '127.0.0.1', 'http://www.qinxue.com/admin/auth/addrule.html?id=0', 'POST', 'json', '{\"id\":\"\",\"name\":\"\\u620f\\u66f2\",\"url\":\"admin\\/Play\\/index\",\"icon\":\"fa fa-female cc_pointer\",\"type\":\"nav\",\"index\":\"0\",\"sort_order\":\"0\",\"pid\":\"0\"}', '添加了权限规则', '1586605325');
INSERT INTO `ob_admin_log` VALUES ('14', '1', 'admin', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.169 Safari/537.36', '127.0.0.1', 'http://www.qinxue.com/admin/auth/addrule.html?id=58', 'POST', 'json', '{\"id\":\"\",\"name\":\"\\u589e\\u52a0\\u620f\\u66f2\",\"url\":\"admin\\/Play\\/add\",\"icon\":\"\",\"type\":\"nav\",\"index\":\"0\",\"sort_order\":\"0\",\"pid\":\"58\"}', '添加了权限规则', '1586605352');
INSERT INTO `ob_admin_log` VALUES ('15', '1', 'admin', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.169 Safari/537.36', '127.0.0.1', 'http://www.qinxue.com/admin/auth/addrule.html?id=56', 'POST', 'json', '{\"id\":\"\",\"name\":\"\\u66f2\\u79cd\\u7ba1\\u7406\",\"url\":\"admin\\/Song\\/index\",\"icon\":\"\",\"type\":\"nav\",\"index\":\"0\",\"sort_order\":\"0\",\"pid\":\"56\"}', '添加了权限规则', '1586605756');
INSERT INTO `ob_admin_log` VALUES ('16', '1', 'admin', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.169 Safari/537.36', '127.0.0.1', 'http://www.qinxue.com/admin/auth/editrule.html?id=57', 'POST', 'json', '{\"id\":\"57\",\"name\":\"\\u589e\\u52a0\\u5206\\u7c7b\",\"url\":\"admin\\/Song\\/add\",\"icon\":\"\",\"type\":\"auth\",\"index\":\"0\",\"sort_order\":\"0\",\"pid\":\"56\"}', '修改了权限规则', '1586605802');
INSERT INTO `ob_admin_log` VALUES ('17', '1', 'admin', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.169 Safari/537.36', '127.0.0.1', 'http://www.qinxue.com/admin/auth/addrule.html?id=58', 'POST', 'json', '{\"id\":\"\",\"name\":\"\\u620f\\u66f2\\u5217\\u8868\",\"url\":\"admin\\/Play\\/index\",\"icon\":\"\",\"type\":\"nav\",\"index\":\"0\",\"sort_order\":\"0\",\"pid\":\"58\"}', '添加了权限规则', '1586605831');
INSERT INTO `ob_admin_log` VALUES ('18', '1', 'admin', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.169 Safari/537.36', '127.0.0.1', 'http://www.qinxue.com/admin/auth/editrule.html?id=59', 'POST', 'json', '{\"id\":\"59\",\"name\":\"\\u589e\\u52a0\\u620f\\u66f2\",\"url\":\"admin\\/Play\\/add\",\"icon\":\"\",\"type\":\"auth\",\"index\":\"0\",\"sort_order\":\"0\",\"pid\":\"58\"}', '修改了权限规则', '1586605837');
INSERT INTO `ob_admin_log` VALUES ('19', '1', 'admin', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.169 Safari/537.36', '127.0.0.1', 'http://www.qinxue.com/admin/play/del/id/1.html', 'POST', 'json', '{\"id\":\"1\"}', '删除了用户', '1586609614');
INSERT INTO `ob_admin_log` VALUES ('20', '1', 'admin', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.163 Safari/537.36', '127.0.0.1', 'http://www.tp5-integrate.com/admin.html', 'POST', 'json', '{\"username\":\"admin\",\"password\":\"123456\",\"captcha\":\"fwnm\"}', '登录了后台系统', '1590894183');
INSERT INTO `ob_admin_log` VALUES ('21', '1', 'admin', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.163 Safari/537.36', '127.0.0.1', 'http://www.tp5-integrate.com/admin/index/clear.html', 'POST', 'json', '[]', '清除了系统缓存', '1590897213');
INSERT INTO `ob_admin_log` VALUES ('22', '1', 'admin', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.163 Safari/537.36', '127.0.0.1', 'http://www.tp5-integrate.com/admin/index/clear.html', 'POST', 'json', '[]', '清除了系统缓存', '1590905436');
INSERT INTO `ob_admin_log` VALUES ('23', '1', 'admin', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.163 Safari/537.36', '127.0.0.1', 'http://www.tp5-integrate.com/admin.html', 'POST', 'xml', '{\"username\":\"admin\",\"password\":\"123456\",\"captcha\":\"ql4x\"}', '登录了后台系统', '1591146018');
INSERT INTO `ob_admin_log` VALUES ('24', '1', 'admin', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.163 Safari/537.36', '127.0.0.1', 'http://www.tp5-integrate.com/admin.html', 'POST', 'xml', '{\"username\":\"admin\",\"password\":\"123456\",\"captcha\":\"vxsl\"}', '登录了后台系统', '1591149334');
INSERT INTO `ob_admin_log` VALUES ('25', '1', 'admin', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.163 Safari/537.36', '127.0.0.1', 'http://www.tp5-integrate.com/admin/auth/addrule.html?id=62', 'POST', 'json', '{\"id\":\"\",\"name\":\"\\u62fc\\u56e2\\u8be6\\u7ec6\",\"url\":\"admin\\/Group\\/dumpling\",\"icon\":\"\",\"type\":\"nav\",\"index\":\"0\",\"sort_order\":\"0\",\"pid\":\"62\"}', '添加了权限规则', '1591151432');
INSERT INTO `ob_admin_log` VALUES ('26', '1', 'admin', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.163 Safari/537.36', '127.0.0.1', 'http://www.tp5-integrate.com/admin/auth/editrule.html?id=66', 'POST', 'json', '{\"id\":\"66\",\"name\":\"\\u62fc\\u56e2\\u8be6\\u7ec6\",\"url\":\"admin\\/Group\\/dumpling\",\"icon\":\"\",\"type\":\"auth\",\"index\":\"0\",\"sort_order\":\"0\",\"pid\":\"62\"}', '修改了权限规则', '1591151449');
INSERT INTO `ob_admin_log` VALUES ('27', '1', 'admin', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.163 Safari/537.36', '127.0.0.1', 'http://www.tp5-integrate.com/admin/auth/editrule.html?id=1', 'POST', 'json', '{\"id\":\"1\",\"name\":\"\\u6587\\u7ae0\",\"url\":\"\",\"icon\":\"fa fa-book\",\"type\":\"auth\",\"index\":\"0\",\"sort_order\":\"2\",\"pid\":\"0\"}', '修改了权限规则', '1591151564');
INSERT INTO `ob_admin_log` VALUES ('28', '1', 'admin', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.163 Safari/537.36', '127.0.0.1', 'http://www.tp5-integrate.com/admin/auth/editrule.html?id=2', 'POST', 'json', '{\"id\":\"2\",\"name\":\"\\u7528\\u6237\",\"url\":\"\",\"icon\":\"\",\"type\":\"nav\",\"index\":\"0\",\"sort_order\":\"3\",\"pid\":\"0\"}', '修改了权限规则', '1591151577');
INSERT INTO `ob_admin_log` VALUES ('29', '1', 'admin', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.163 Safari/537.36', '127.0.0.1', 'http://www.tp5-integrate.com/admin/auth/editrule.html?id=3', 'POST', 'json', '{\"id\":\"3\",\"name\":\"\\u6269\\u5c55\",\"url\":\"\",\"icon\":\"fa fa-puzzle-piece\",\"type\":\"auth\",\"index\":\"0\",\"sort_order\":\"4\",\"pid\":\"0\"}', '修改了权限规则', '1591151583');
INSERT INTO `ob_admin_log` VALUES ('30', '1', 'admin', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.163 Safari/537.36', '127.0.0.1', 'http://www.tp5-integrate.com/admin/auth/editrule.html?id=4', 'POST', 'json', '{\"id\":\"4\",\"name\":\"\\u8bbe\\u7f6e\",\"url\":\"\",\"icon\":\"fa fa-gear\",\"type\":\"auth\",\"index\":\"0\",\"sort_order\":\"5\",\"pid\":\"0\"}', '修改了权限规则', '1591151587');
INSERT INTO `ob_admin_log` VALUES ('31', '1', 'admin', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.163 Safari/537.36', '127.0.0.1', 'http://www.tp5-integrate.com/admin/auth/editrule.html?id=16', 'POST', 'json', '{\"id\":\"16\",\"name\":\"\\u7ba1\\u7406\\u5458\",\"url\":\"admin\\/admin\\/index\",\"icon\":\"fa fa-user\",\"type\":\"auth\",\"index\":\"0\",\"sort_order\":\"0\",\"pid\":\"5\"}', '修改了权限规则', '1591151594');
INSERT INTO `ob_admin_log` VALUES ('32', '1', 'admin', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.163 Safari/537.36', '127.0.0.1', 'http://www.tp5-integrate.com/admin/auth/editrule.html?id=17', 'POST', 'json', '{\"id\":\"17\",\"name\":\"\\u6743\\u9650\\u7ec4\",\"url\":\"admin\\/auth\\/group\",\"icon\":\"fa fa-users\",\"type\":\"auth\",\"index\":\"0\",\"sort_order\":\"1\",\"pid\":\"5\"}', '修改了权限规则', '1591151600');
INSERT INTO `ob_admin_log` VALUES ('33', '1', 'admin', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.92 Safari/537.36', '127.0.0.1', 'http://www.tp5-integrate.com/admin.html', 'POST', 'json', '{\"username\":\"admin\",\"password\":\"123456\",\"captcha\":\"twmd\"}', '登录了后台系统', '1591169264');

-- ----------------------------
-- Table structure for ob_article
-- ----------------------------
DROP TABLE IF EXISTS `ob_article`;
CREATE TABLE `ob_article` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `cid` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT '分类ID',
  `title` varchar(255) NOT NULL DEFAULT '' COMMENT '标题',
  `image` varchar(255) DEFAULT '' COMMENT '图片',
  `author` varchar(255) DEFAULT '' COMMENT '作者',
  `summary` text COMMENT '简介',
  `photo` text COMMENT '相册',
  `content` longtext COMMENT '内容',
  `view` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '点击量',
  `is_top` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否置顶',
  `is_hot` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否推荐',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '状态',
  `sort_order` int(11) NOT NULL DEFAULT '100' COMMENT '排序',
  `keywords` varchar(255) DEFAULT '' COMMENT '关键字',
  `description` varchar(255) DEFAULT '' COMMENT '描述',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='文章';

-- ----------------------------
-- Records of ob_article
-- ----------------------------
INSERT INTO `ob_article` VALUES ('1', '1', '初识模块化开发工具', '', '', '初识模块化开发工具：git 是分布式代码管理工具，管理代码的npm 是包管理工具，管理插件、工具啊，是个转换器，他是哪来的了，他是伴随node下载下来的，版本也是伴随node变化；node 是个后台的环境；首先安装node，然后用命令安装browserify：npm install -g brows ...', '', '', '0', '0', '0', '1', '100', '', '', '1541840580', '1541840580');
INSERT INTO `ob_article` VALUES ('2', '1', 'window.open方法被浏览器拦截的处理方式', '', '', '问题现象 当我们在一个 ajax 回调中执行 window.open 方法时，新页面会被浏览器拦截。 原因 在 Chrome 的安全机制里，非用户直接触发的 window.open 方法，是会被拦截的。 处理 $(\'#jump-btn\').on(\'click\', function () { // 打 ...', '', '', '0', '0', '0', '1', '100', '', '', '1541840601', '1541840601');
INSERT INTO `ob_article` VALUES ('3', '1', '理解JavaScript中的柯里化', '', '', '函数式编程是一种编程风格，这种编程风格就是试图将传递函数作为参数（即将作为回调函数）和返回一个函数，但没有函数副作用（函数副作用即会改变程序的状态）。 有很多语言采用这种编程风格，其中包括JavaScript、Haskell、Clojure、Erlang和Scala等一些很流行的编程语言。 ...', '', '', '0', '0', '0', '1', '100', '', '', '1541840625', '1541840625');
INSERT INTO `ob_article` VALUES ('4', '1', '小程序开发框架', '', '', '小程序开发框架，支持百度小程序、微信小程序、支付宝小程序 ...', '', '', '0', '0', '0', '1', '100', '', '', '1541840645', '1541840645');
INSERT INTO `ob_article` VALUES ('5', '1', 'JavaScript异步、事件循环与消息队列、微任务与宏任务', '', '', '关于JavaScript异步、事件循环与消息队、微任务与宏任务的总结 ...', '', '', '0', '0', '0', '1', '100', '', '', '1541840663', '1541840663');
INSERT INTO `ob_article` VALUES ('6', '1', '关于Array中的srot()方法和compare()方法', '', '', 'Array中的srot()方法 sort()方法是用来重排序的方法。在默认情况下，sort()方法按升序排列数组项 即最小的值位于最前面，最大的值排在最后面。 我们看看官方是怎么说的： arrayObj.srot(sortFunction) 参数 arrayObj 必选项。任意Array对象 sor ...', '', '', '0', '0', '0', '1', '100', '', '', '1541840681', '1541840681');
INSERT INTO `ob_article` VALUES ('7', '1', '使用Arcgis进行画面(线)并计算大小(长度)', '', '', '在使用Arcgis API for JavaScript进行做地图开发的过程中，在地图进行画线、画面是经常使用的功能。本文主要介绍这一功能。 本文适用Arcgis API版本：Arcgis API for JS 4.x以上。 方案分析： 方案分析： 首先要初始化&nbsp;map&nbsp;和&nbsp;mapView（2D m ...', '', '', '0', '0', '0', '1', '100', '', '', '1541840700', '1541840700');
INSERT INTO `ob_article` VALUES ('8', '1', 'sass使用中出现的问题', '', '', '问题一：ruby按照官方文档安装后更换gem源时，报错Error fetching https://gems.ruby-china.org/: bad response Not Found 404 (https://gems.ruby-china.org/specs.4.8.gz)；不知就里，在网上 ...', '', '', '0', '0', '0', '1', '100', '', '', '1541840718', '1541840718');
INSERT INTO `ob_article` VALUES ('9', '1', 'xss 跨站脚本攻击', '', '', '攻击原理 XSS（cross-site scripting跨域脚本攻击）攻击是最常见的Web攻击，它允许恶意web用户将代码植入到提供给其它用户使用的页面中。 xss 与其他的攻击方式相比缺点明显，如下： 1、耗时间 2、有一定几率不成功 3、没有相应的软件来完成自动化攻击 4、前期需要基本的htm ...', '', '', '0', '0', '0', '1', '100', '', '', '1541840736', '1541840736');
INSERT INTO `ob_article` VALUES ('10', '2', 'JSON解析', '', '', '以下为网络上搜集的关于JSON的资料，整合为随笔记录，供以后回顾。 百度：https://baike.baidu.com/item/JSON/2462549?fr=aladdin 一. 数据格式 1.数组方式： [ {\"key1\": \"value1\"}, {\"key2\": \"value2\"} ] 2 ...', '', '', '0', '0', '0', '1', '100', '', '', '1541840756', '1541840756');
INSERT INTO `ob_article` VALUES ('11', '1', 'visual studio2017 创建Vue项目', '', '', '1:打开Visual studio 2017后 按图片操作新建项目 也可以使用快捷键Ctrl+Shift+N 进入创建项目页面 2:选择JavaScript 里的Node.js创建对应的Vue项目 如果没有javaScript对应的node.js选项 打开最下面的visual studio安装程序  ...', '', '', '0', '0', '0', '1', '100', '', '', '1541840778', '1541840778');
INSERT INTO `ob_article` VALUES ('12', '1', 'javascript  数组 常用方法', '', '', '前言 学学忘忘 闲来做个笔记 整理下数组常用方法。 Array 数组常用方法 创建数组的基本方式有两种 1.第一种是使用Array构造函数， var arr = new Array(); 使用构造函数方式的话&nbsp;var arr = new Array(20),则表示创建了一个lenght值为20的数组 ...', '', '', '0', '0', '0', '1', '100', '', '', '1541840793', '1541840793');
INSERT INTO `ob_article` VALUES ('13', '1', '学了两天 react，乱讲一下学习思路，顺便弄了一个脚手架', '', '', '之前一直用 vue 做一些小项目，最近接触了一个项目是用 react 做前端，虽然本身是做后端开发的，但是前端还是要了解一点的。 现在的项目基本上都是前后端分离的，后端就先不提了。前端的框架也是层出不穷，使用最多的就是 angular、vue、react 。angular 是前几年用的比较多，最近好 ...', '', '', '0', '0', '0', '1', '100', '', '', '1541840808', '1541840808');
INSERT INTO `ob_article` VALUES ('14', '2', 'PHP 中的CURL 模拟表单的post提交', '', '', '废话不多说啦，直接上代码： 这里需要注意的是： 要想以 x-www-form-urlencoded 方式发送，最关键是发送的数据格式。 方式from-data试发送的数据用的是array格式，而方式为 x-www-form-urlencoded 时需要用key=value&key=value的格式发 ...', '', '', '0', '0', '0', '1', '100', '', '', '1541840846', '1541840846');
INSERT INTO `ob_article` VALUES ('15', '2', ' PHP解决跨域问题', '', '', '在做项目的过程中经常需要跨域访问。这里主要介绍一下 PHP 中怎么解决跨域问题。 1、允许所有域名访问 2、允许单个域名访问 3、允许多个域名访问 在实际项目中最好指定能跨域访问的域名，增加安全性。可以写在一个公共类里面，封装一个方法调用。 ...', '', '', '0', '0', '0', '1', '100', '', '', '1541840863', '1541840863');
INSERT INTO `ob_article` VALUES ('16', '1', '接口技术的实现:规范用户类的成员与类型', '', '', '', '', '', '0', '0', '0', '1', '100', '', '', '1541840882', '1546139921');

-- ----------------------------
-- Table structure for ob_auth_group
-- ----------------------------
DROP TABLE IF EXISTS `ob_auth_group`;
CREATE TABLE `ob_auth_group` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL DEFAULT '',
  `description` varchar(255) NOT NULL DEFAULT '',
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `rules` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='权限组';

-- ----------------------------
-- Records of ob_auth_group
-- ----------------------------
INSERT INTO `ob_auth_group` VALUES ('1', '超级管理员', '', '1', '6,44,43,1,8,34,35,36,7,2,9,28,29,30,10,54,3,11,25,26,27,46,4,12,14,13,45,55,5,16,17,15,18');

-- ----------------------------
-- Table structure for ob_auth_group_access
-- ----------------------------
DROP TABLE IF EXISTS `ob_auth_group_access`;
CREATE TABLE `ob_auth_group_access` (
  `uid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `group_id` smallint(5) unsigned NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='权限授权';

-- ----------------------------
-- Records of ob_auth_group_access
-- ----------------------------
INSERT INTO `ob_auth_group_access` VALUES ('1', '1');
INSERT INTO `ob_auth_group_access` VALUES ('2', '1');

-- ----------------------------
-- Table structure for ob_auth_rule
-- ----------------------------
DROP TABLE IF EXISTS `ob_auth_rule`;
CREATE TABLE `ob_auth_rule` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `pid` int(11) unsigned NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  `url` varchar(255) NOT NULL DEFAULT '',
  `icon` varchar(64) NOT NULL DEFAULT '',
  `sort_order` int(11) NOT NULL DEFAULT '0' COMMENT '排序',
  `type` char(4) NOT NULL DEFAULT '' COMMENT 'nav,auth',
  `index` tinyint(1) NOT NULL DEFAULT '0' COMMENT '快捷导航',
  `status` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=67 DEFAULT CHARSET=utf8 COMMENT='权限规则';

-- ----------------------------
-- Records of ob_auth_rule
-- ----------------------------
INSERT INTO `ob_auth_rule` VALUES ('1', '0', '文章', '', 'fa fa-book', '2', 'auth', '0', '1');
INSERT INTO `ob_auth_rule` VALUES ('2', '0', '用户', '', '', '3', 'nav', '0', '1');
INSERT INTO `ob_auth_rule` VALUES ('3', '0', '扩展', '', 'fa fa-puzzle-piece', '4', 'auth', '0', '1');
INSERT INTO `ob_auth_rule` VALUES ('4', '0', '设置', '', 'fa fa-gear', '5', 'auth', '0', '1');
INSERT INTO `ob_auth_rule` VALUES ('5', '0', '权限', '', 'fa fa-lock', '6', 'nav', '0', '1');
INSERT INTO `ob_auth_rule` VALUES ('6', '0', '控制台', 'admin/index/index', '', '1', 'auth', '0', '1');
INSERT INTO `ob_auth_rule` VALUES ('7', '1', '分类管理', 'admin/category/index', 'fa fa-navicon', '2', 'nav', '1', '1');
INSERT INTO `ob_auth_rule` VALUES ('8', '1', '文章管理', 'admin/article/index', 'fa fa-book', '1', 'nav', '1', '1');
INSERT INTO `ob_auth_rule` VALUES ('9', '2', '用户管理', 'admin/user/index', 'fa fa-users', '0', 'nav', '1', '1');
INSERT INTO `ob_auth_rule` VALUES ('10', '2', '会员日志', 'admin/user/log', 'fa fa-clock-o', '0', 'auth', '1', '1');
INSERT INTO `ob_auth_rule` VALUES ('11', '3', '广告管理', 'admin/ad/index', 'fa fa-image', '1', 'nav', '0', '1');
INSERT INTO `ob_auth_rule` VALUES ('12', '4', '基本设置', 'admin/config/setting', 'fa fa-cog', '1', 'nav', '1', '1');
INSERT INTO `ob_auth_rule` VALUES ('13', '4', '系统设置', 'admin/config/system', 'fa fa-wrench', '3', 'nav', '1', '1');
INSERT INTO `ob_auth_rule` VALUES ('14', '4', '设置管理', 'admin/config/index', 'fa fa-bars', '2', 'nav', '0', '1');
INSERT INTO `ob_auth_rule` VALUES ('15', '5', '权限规则', 'admin/auth/rule', 'fa fa-th-list', '3', 'nav', '0', '1');
INSERT INTO `ob_auth_rule` VALUES ('16', '5', '管理员', 'admin/admin/index', 'fa fa-user', '0', 'auth', '0', '1');
INSERT INTO `ob_auth_rule` VALUES ('17', '5', '权限组', 'admin/auth/group', 'fa fa-users', '1', 'auth', '0', '1');
INSERT INTO `ob_auth_rule` VALUES ('18', '5', '管理员日志', 'admin/admin/log', 'fa fa-clock-o', '5', 'nav', '0', '1');
INSERT INTO `ob_auth_rule` VALUES ('19', '14', '添加', 'admin/config/add', '', '0', 'auth', '0', '1');
INSERT INTO `ob_auth_rule` VALUES ('20', '14', '编辑', 'admin/config/edit', '', '0', 'auth', '0', '1');
INSERT INTO `ob_auth_rule` VALUES ('21', '14', '删除', 'admin/config/del', '', '0', 'auth', '0', '1');
INSERT INTO `ob_auth_rule` VALUES ('22', '15', '添加', 'admin/auth/addRule', '', '0', 'auth', '0', '1');
INSERT INTO `ob_auth_rule` VALUES ('23', '15', '编辑', 'admin/auth/editRule', '', '0', 'auth', '0', '1');
INSERT INTO `ob_auth_rule` VALUES ('24', '15', '删除', 'admin/auth/delRule', '', '0', 'auth', '0', '1');
INSERT INTO `ob_auth_rule` VALUES ('25', '11', '添加', 'admin/ad/add', '', '0', 'auth', '0', '1');
INSERT INTO `ob_auth_rule` VALUES ('26', '11', '编辑', 'admin/ad/edit', '', '0', 'auth', '0', '1');
INSERT INTO `ob_auth_rule` VALUES ('27', '11', '删除', 'admin/ad/del', '', '0', 'auth', '0', '1');
INSERT INTO `ob_auth_rule` VALUES ('28', '9', '添加', 'admin/user/add', '', '0', 'auth', '0', '1');
INSERT INTO `ob_auth_rule` VALUES ('29', '9', '编辑', 'admin/user/edit', '', '0', 'auth', '0', '1');
INSERT INTO `ob_auth_rule` VALUES ('30', '9', '删除', 'admin/user/del', '', '0', 'auth', '0', '1');
INSERT INTO `ob_auth_rule` VALUES ('31', '7', '添加', 'admin/category/add', '', '0', 'auth', '0', '1');
INSERT INTO `ob_auth_rule` VALUES ('32', '7', '编辑', 'admin/category/edit', '', '0', 'auth', '0', '1');
INSERT INTO `ob_auth_rule` VALUES ('33', '7', '删除', 'admin/category/del', '', '0', 'auth', '0', '1');
INSERT INTO `ob_auth_rule` VALUES ('34', '8', '添加', 'admin/article/add', '', '0', 'auth', '0', '1');
INSERT INTO `ob_auth_rule` VALUES ('35', '8', '编辑', 'admin/article/edit', '', '0', 'auth', '0', '1');
INSERT INTO `ob_auth_rule` VALUES ('36', '8', '删除', 'admin/article/del', '', '0', 'auth', '0', '1');
INSERT INTO `ob_auth_rule` VALUES ('37', '16', '添加', 'admin/admin/add', '', '0', 'auth', '0', '1');
INSERT INTO `ob_auth_rule` VALUES ('38', '16', '编辑', 'admin/admin/edit', '', '0', 'auth', '0', '1');
INSERT INTO `ob_auth_rule` VALUES ('39', '16', '删除', 'admin/admin/del', '', '0', 'auth', '0', '1');
INSERT INTO `ob_auth_rule` VALUES ('40', '17', '添加', 'admin/auth/addGroup', '', '0', 'auth', '0', '1');
INSERT INTO `ob_auth_rule` VALUES ('41', '17', '编辑', 'admin/auth/editGroup', '', '0', 'auth', '0', '1');
INSERT INTO `ob_auth_rule` VALUES ('42', '17', '删除', 'admin/auth/delGroup', '', '0', 'auth', '0', '1');
INSERT INTO `ob_auth_rule` VALUES ('43', '6', '修改密码', 'admin/index/editPassword', '', '2', 'auth', '0', '1');
INSERT INTO `ob_auth_rule` VALUES ('44', '6', '清除缓存', 'admin/index/clear', '', '1', 'auth', '0', '1');
INSERT INTO `ob_auth_rule` VALUES ('45', '4', '上传设置', 'admin/config/upload', 'fa fa-upload', '4', 'nav', '0', '1');
INSERT INTO `ob_auth_rule` VALUES ('46', '3', '数据管理', 'admin/database/index', 'fa fa-database', '4', 'nav', '1', '1');
INSERT INTO `ob_auth_rule` VALUES ('47', '46', '还原', 'admin/database/import', '', '0', 'auth', '0', '1');
INSERT INTO `ob_auth_rule` VALUES ('48', '46', '备份', 'admin/database/backup', '', '0', 'auth', '0', '1');
INSERT INTO `ob_auth_rule` VALUES ('49', '46', '优化', 'admin/database/optimize', '', '0', 'auth', '0', '1');
INSERT INTO `ob_auth_rule` VALUES ('50', '46', '修复', 'admin/database/repair', '', '0', 'auth', '0', '1');
INSERT INTO `ob_auth_rule` VALUES ('51', '46', '下载', 'admin/database/download', '', '0', 'auth', '0', '1');
INSERT INTO `ob_auth_rule` VALUES ('52', '46', '删除', 'admin/database/del', '', '0', 'auth', '0', '1');
INSERT INTO `ob_auth_rule` VALUES ('53', '18', '一键清空', 'admin/admin/truncate', '', '0', 'auth', '0', '1');
INSERT INTO `ob_auth_rule` VALUES ('54', '10', '一键清空', 'admin/user/truncate', '', '0', 'auth', '0', '1');
INSERT INTO `ob_auth_rule` VALUES ('55', '4', '邮件设置', 'admin/config/email', 'fa fa-envelope', '5', 'nav', '0', '1');
INSERT INTO `ob_auth_rule` VALUES ('56', '0', '分类管理', 'admin/Classify/index', '', '0', 'auth', '0', '1');
INSERT INTO `ob_auth_rule` VALUES ('57', '56', '增加分类', 'admin/Classify/add', '', '0', 'auth', '0', '1');
INSERT INTO `ob_auth_rule` VALUES ('58', '0', '商品管理', 'admin/Goods/index', '', '0', 'nav', '0', '1');
INSERT INTO `ob_auth_rule` VALUES ('59', '58', '增加商品', 'admin/Goods/add', '', '0', 'auth', '0', '1');
INSERT INTO `ob_auth_rule` VALUES ('60', '56', '分类管理', 'admin/Classify/index', '', '0', 'nav', '0', '1');
INSERT INTO `ob_auth_rule` VALUES ('61', '58', '商品列表', 'admin/Goods/index', '', '0', 'nav', '0', '1');
INSERT INTO `ob_auth_rule` VALUES ('62', '0', '拼团管理', 'admin/group/index', '', '0', 'nav', '0', '1');
INSERT INTO `ob_auth_rule` VALUES ('63', '62', '拼团列表', 'admin/group/index', '', '0', 'nav', '0', '1');
INSERT INTO `ob_auth_rule` VALUES ('64', '0', '订单管理', 'admin/Order/index', '', '0', 'nav', '0', '1');
INSERT INTO `ob_auth_rule` VALUES ('65', '64', '订单详细', 'admin/Order/particular', '', '0', 'nav', '0', '1');
INSERT INTO `ob_auth_rule` VALUES ('66', '62', '拼团详细', 'admin/Group/dumpling', '', '0', 'auth', '0', '1');

-- ----------------------------
-- Table structure for ob_category
-- ----------------------------
DROP TABLE IF EXISTS `ob_category`;
CREATE TABLE `ob_category` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `pid` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT '上级分类ID',
  `category_name` varchar(255) NOT NULL DEFAULT '' COMMENT '标题',
  `sort_order` int(11) NOT NULL DEFAULT '100' COMMENT '排序',
  `keywords` varchar(255) DEFAULT '' COMMENT '关键字',
  `description` varchar(255) DEFAULT '' COMMENT '描述',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='分类';

-- ----------------------------
-- Records of ob_category
-- ----------------------------
INSERT INTO `ob_category` VALUES ('1', '0', '前端开发', '100', '', '');
INSERT INTO `ob_category` VALUES ('2', '0', '后端开发', '100', '', '');
INSERT INTO `ob_category` VALUES ('3', '0', '移动互联', '100', '', '');
INSERT INTO `ob_category` VALUES ('4', '0', '人工智能', '100', '', '');

-- ----------------------------
-- Table structure for ob_config
-- ----------------------------
DROP TABLE IF EXISTS `ob_config`;
CREATE TABLE `ob_config` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `group` varchar(32) NOT NULL DEFAULT '' COMMENT '配置分组',
  `title` varchar(255) NOT NULL DEFAULT '' COMMENT '配置标题',
  `name` varchar(255) NOT NULL DEFAULT '' COMMENT '配置标识',
  `type` varchar(32) NOT NULL DEFAULT '' COMMENT '配置类型',
  `value` text NOT NULL COMMENT '默认值',
  `options` text COMMENT '选项值',
  `sort_order` int(11) NOT NULL DEFAULT '100' COMMENT '排序',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '状态',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='配置';

-- ----------------------------
-- Records of ob_config
-- ----------------------------
INSERT INTO `ob_config` VALUES ('1', 'website', '网站logo', 'logo', 'image', '/upload/image/20200411/83798ea1a2d0ab7cdcd777f54f5945b4.jpg', '', '100', '1');
INSERT INTO `ob_config` VALUES ('2', 'website', '网站名称', 'site_name', 'input', 'OpenBMS', '', '100', '1');
INSERT INTO `ob_config` VALUES ('3', 'website', '网站标题', 'site_title', 'input', 'OpenBMS 开源后台管理系统', '', '100', '1');
INSERT INTO `ob_config` VALUES ('4', 'website', '网站关键字', 'site_keywords', 'input', 'OpenBMS,开源后台管理系统', '', '100', '1');
INSERT INTO `ob_config` VALUES ('5', 'website', '网站描述', 'site_description', 'textarea', 'OpenBMS,开源后台管理系统,Open Background Management System 开源后台管理系统', '', '100', '1');
INSERT INTO `ob_config` VALUES ('6', 'website', '版权信息', 'site_copyright', 'input', '', '', '100', '1');
INSERT INTO `ob_config` VALUES ('7', 'website', 'ICP备案号', 'site_icp', 'input', '', '', '100', '1');
INSERT INTO `ob_config` VALUES ('8', 'website', '统计代码', 'site_code', 'textarea', '', '', '100', '1');
INSERT INTO `ob_config` VALUES ('9', 'contact', '公司名称', 'company', 'input', '', '', '100', '1');
INSERT INTO `ob_config` VALUES ('10', 'contact', '公司地址', 'address', 'input', '', '', '100', '1');
INSERT INTO `ob_config` VALUES ('11', 'contact', '联系电话', 'tel', 'input', '', '', '100', '1');
INSERT INTO `ob_config` VALUES ('12', 'contact', '联系邮箱', 'email', 'input', '', '', '100', '1');

-- ----------------------------
-- Table structure for ob_goods
-- ----------------------------
DROP TABLE IF EXISTS `ob_goods`;
CREATE TABLE `ob_goods` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `goods_name` varchar(255) DEFAULT NULL,
  `goods_introduce` varchar(255) DEFAULT NULL COMMENT '商品介绍',
  `goods_image` varchar(255) DEFAULT NULL,
  `goods_group` varchar(255) DEFAULT NULL COMMENT '设置拼团的人数',
  `goods_group_price` decimal(10,2) DEFAULT NULL COMMENT '拼团价格',
  `goods_price` decimal(10,2) DEFAULT NULL COMMENT '单独购买价格',
  `goods_carousel` text COMMENT '商品详情轮播图',
  `goods_duration` int(4) DEFAULT '24' COMMENT '设置拼团时间（多长时间拼团失效）',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COMMENT='商品管理';

-- ----------------------------
-- Records of ob_goods
-- ----------------------------
INSERT INTO `ob_goods` VALUES ('4', '上衣', '工装上衣就是好，传上去很好看的啊.', '/static/upimg/20200531/2cb0ba1ab2aa49811897d4f63d160362.jpg', '2', '45.00', '65.00', 'http://www.tp5-integrate.com/static/uploads/20200601/80beab78d181c1b45538c0271a29bce7.jpg,http://www.tp5-integrate.com/static/uploads/20200601/ed8e8fc0572271d25d0a788fb2540526.jpg,http://www.tp5-integrate.com/static/uploads/20200601/8efb1a9f8261455d643d2200560d1cb6.jpg,http://www.tp5-integrate.com/static/uploads/20200601/7d31cc70ccfe3006af75c8ac522c359d.jpg,http://www.tp5-integrate.com/static/uploads/20200601/0e8a3b54423c7b0c0ddedec86ced0130.jpg,', '24');
INSERT INTO `ob_goods` VALUES ('5', '鞋子', '海绵宝宝球鞋就是帅', '/static/upimg/20200531/83cec53057e8f5dd81ef09b29dfd5811.jpg', '3', '1500.00', '2500.00', 'http://www.tp5-integrate.com/static/uploads/20200601/8a0d9fe1544bbd716290ca1a074cd164.jpg,http://www.tp5-integrate.com/static/uploads/20200601/58111eb59104647453366d6cf98f4b9a.jpg,http://www.tp5-integrate.com/static/uploads/20200601/701312ca9c270552afd6b2a60c795519.jpg,http://www.tp5-integrate.com/static/uploads/20200601/465a29b34adf0af47eb3d531df9c97a0.jpg,http://www.tp5-integrate.com/static/uploads/20200601/ecf3b99e51ff1599e0c60921c5b3558f.jpg,', '12');
INSERT INTO `ob_goods` VALUES ('6', '海鲜', '美味的海鲜', '/static/upimg/20200531/934abe2c7fa1ea1ff511295f195ca4c2.jpg', '3', '998.00', '1998.00', 'http://www.tp5-integrate.com/static/uploads/20200601/fbded570b6128e815de94068b46301f7.jpg,http://www.tp5-integrate.com/static/uploads/20200601/c41e803bcdbaafd861ba693d077f21c8.jpg,http://www.tp5-integrate.com/static/uploads/20200601/a929ce8931f722b4189aee30db1f2108.jpg,', '12');
INSERT INTO `ob_goods` VALUES ('7', '沙发', '好沙发', '/static/upimg/20200531/ec924125285e8d974b00af654a634140.jpg', '4', '1500.00', '2500.00', 'http://www.tp5-integrate.com/static/uploads/20200601/95ef02e38235a0af36a4c1ae630efaf1.jpg,http://www.tp5-integrate.com/static/uploads/20200601/f6425fc1d9f32d127d12683042883a1f.jpg,', '12');
INSERT INTO `ob_goods` VALUES ('8', '遥控飞机', '遥控飞机指可以远距离控制飞行的飞行器。最早出现在中国大陆地方是以单机销售（即飞机和遥控器分开销售），这样对消费成本会很高，而且当时科技不是很发达，也不能完全如愿的按照自己的想法去飞，需要很麻烦的调试飞机以及遥控器，造成消费群体的局限性。随着科技的发达，遥控飞机大部分都一体机销售，而且厂家已经调试好，对于一些初学机型已经达到到手飞的状态，而且价格也相对较低。遥控飞机已经进入了普通家庭中，其中以玩乐为主导方向；也有部分发烧友对其进行改装，以达到更多的娱乐方式（如航拍，载重等）。', '/static/upimg/20200531/64fcef704dd4ff4e1f6a6cd30104cc8f.jpg', '3', '150.00', '250.00', 'http://www.tp5-integrate.com/static/uploads/20200601/5bdd1a9a00ef4fc9c45e454eb20e3653.jpg,http://www.tp5-integrate.com/static/uploads/20200601/f4fb9f2bc543ea56e3b0a4d0b6bee646.jpg,http://www.tp5-integrate.com/static/uploads/20200601/8bb2f1ae4295c3a9805cdaf3327e297d.jpg,http://www.tp5-integrate.com/static/uploads/20200601/a89fb91f7ec1f2f8f597c345493caef7.jpg,http://www.tp5-integrate.com/static/uploads/20200601/6639fbfedbba8766c49e7e6e4992d220.jpg,', '12');

-- ----------------------------
-- Table structure for ob_group
-- ----------------------------
DROP TABLE IF EXISTS `ob_group`;
CREATE TABLE `ob_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_phone` varchar(255) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL COMMENT '本用户id',
  `superior_user_id` int(11) DEFAULT '0' COMMENT '上级用户id /如果自己是团主为0/或者自己购买，不参团',
  `group_master` varchar(255) DEFAULT NULL COMMENT '开团的主人/开团的人/为团主0/非团主1',
  `group_follow` varchar(255) DEFAULT NULL COMMENT '跟团的人/团主的group_id/如果自己开团上级id为0',
  `goods_id` int(11) DEFAULT NULL COMMENT '商品id',
  `goods_single` varchar(12) DEFAULT '0' COMMENT '0代表参加拼团  /1代表自己购买，不参加任何团，购买过后直接发货',
  `group_add_time` bigint(20) DEFAULT NULL COMMENT '团主下单时间',
  `group_finish_time` varchar(255) DEFAULT NULL COMMENT '设置拼团规定结束(团主）',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=126 DEFAULT CHARSET=utf8 COMMENT='拼团记录表';

-- ----------------------------
-- Records of ob_group
-- ----------------------------
INSERT INTO `ob_group` VALUES ('83', '15090472769', '3', '0', '0', '0', '4', '0', '1591069235', '2020-06-03 11:40:35');
INSERT INTO `ob_group` VALUES ('84', '15090472769', '3', '0', '0', '0', '4', '1', '1591069244', '2020-06-03 11:40:44');
INSERT INTO `ob_group` VALUES ('85', '15090472769', '3', '0', '0', '0', '5', '0', '1591069253', '2020-06-02 23:40:53');
INSERT INTO `ob_group` VALUES ('86', '15090472769', '3', '0', '0', '0', '5', '1', '1591069260', '2020-06-02 23:41:00');
INSERT INTO `ob_group` VALUES ('87', '15090472769', '3', '0', '0', '0', '5', '0', '1591069265', '2020-06-02 23:41:05');
INSERT INTO `ob_group` VALUES ('88', '15090472762', '55', '0', '0', '0', '4', '1', '1591069307', '2020-06-03 11:41:47');
INSERT INTO `ob_group` VALUES ('91', '15090472762', '55', '0', '0', '0', '4', '0', '1591083556', '2020-06-03 15:39:16');
INSERT INTO `ob_group` VALUES ('92', '15090472762', '55', '3', '1', '83', '4', '0', '1591084270', '2020-06-03 15:51:10');
INSERT INTO `ob_group` VALUES ('93', '15090472762', '55', '0', '0', '0', '6', '1', '1591101276', '2020-06-03 08:34:36');
INSERT INTO `ob_group` VALUES ('94', '15090472762', '55', '0', '0', '0', '6', '0', '1591101286', '2020-06-03 08:34:46');
INSERT INTO `ob_group` VALUES ('95', '15090472776', '10', '0', '0', '0', '6', '1', '1591101347', '2020-06-03 08:35:47');
INSERT INTO `ob_group` VALUES ('96', '15090472776', '10', '0', '0', '0', '6', '0', '1591101361', '2020-06-03 08:36:01');
INSERT INTO `ob_group` VALUES ('97', '15090472776', '10', '55', '1', '94', '6', '0', '1591101374', '2020-06-03 08:36:14');
INSERT INTO `ob_group` VALUES ('98', '15090472780', '14', '55', '1', '94', '6', '0', '1591101440', '2020-06-03 08:37:20');
INSERT INTO `ob_group` VALUES ('99', '15090472780', '14', '10', '1', '96', '6', '0', '1591101457', '2020-06-03 08:37:37');
INSERT INTO `ob_group` VALUES ('100', '15090472762', '55', '10', '1', '96', '6', '0', '1591101493', '2020-06-03 08:38:13');
INSERT INTO `ob_group` VALUES ('101', '15090472776', '10', '55', '1', '91', '4', '0', '1591101722', '2020-06-03 20:42:02');
INSERT INTO `ob_group` VALUES ('102', '15090472776', '10', '0', '0', '0', '4', '0', '1591101729', '2020-06-03 20:42:09');
INSERT INTO `ob_group` VALUES ('103', '15090472762', '55', '10', '1', '102', '4', '0', '1591101738', '2020-06-03 20:42:19');
INSERT INTO `ob_group` VALUES ('104', '15090472762', '55', '0', '0', '0', '7', '0', '1591102790', '2020-06-03 08:59:50');
INSERT INTO `ob_group` VALUES ('105', '15090472787', '21', '55', '1', '104', '7', '0', '1591102862', '2020-06-03 09:01:02');
INSERT INTO `ob_group` VALUES ('106', '15090472790', '24', '55', '1', '104', '7', '0', '1591102905', '2020-06-03 09:01:45');
INSERT INTO `ob_group` VALUES ('107', '15090472794', '28', '55', '1', '104', '7', '0', '1591102956', '2020-06-03 09:02:37');
INSERT INTO `ob_group` VALUES ('108', '15090472794', '28', '0', '0', '0', '7', '0', '1591102967', '2020-06-03 09:02:47');
INSERT INTO `ob_group` VALUES ('109', '15090472790', '24', '28', '1', '108', '7', '0', '1591102983', '2020-06-03 09:03:03');
INSERT INTO `ob_group` VALUES ('110', '15090472787', '21', '28', '1', '108', '7', '0', '1591102992', '2020-06-03 09:03:12');
INSERT INTO `ob_group` VALUES ('111', '15090472769', '3', '0', '0', '0', '7', '0', '1591153407', '2020-06-03 23:03:27');
INSERT INTO `ob_group` VALUES ('112', '15090472769', '3', '0', '0', '0', '8', '0', '1591155994', '2020-06-03 23:46:34');
INSERT INTO `ob_group` VALUES ('113', '15090472769', '3', '0', '0', '0', '8', '0', '1591156121', '2020-06-03 23:48:41');
INSERT INTO `ob_group` VALUES ('114', '15090472769', '3', '0', '0', '0', '6', '0', '1591156211', '2020-06-03 23:50:11');
INSERT INTO `ob_group` VALUES ('119', '15090472769', '3', '0', '0', '0', '4', '0', '1591169111', '2020-06-04 15:25:11');
INSERT INTO `ob_group` VALUES ('120', '15090472779', '13', '0', '0', '0', '4', '0', '1591169139', '2020-06-04 15:25:39');
INSERT INTO `ob_group` VALUES ('121', '15090472769', '3', '0', '0', '0', '4', '0', '1591169146', '2020-06-04 15:25:46');
INSERT INTO `ob_group` VALUES ('122', '15090472780', '14', '0', '0', '0', '4', '0', '1591169179', '2020-06-04 15:26:19');
INSERT INTO `ob_group` VALUES ('123', '15090472780', '14', '0', '0', '0', '4', '0', '1591178034', '2020-06-04 17:53:54');
INSERT INTO `ob_group` VALUES ('124', '15090472780', '14', '0', '0', '0', '5', '0', '1591178049', '2020-06-04 05:54:09');
INSERT INTO `ob_group` VALUES ('125', '15090472780', '14', '3', '1', '111', '7', '0', '1591178112', '2020-06-04 05:55:12');

-- ----------------------------
-- Table structure for ob_order
-- ----------------------------
DROP TABLE IF EXISTS `ob_order`;
CREATE TABLE `ob_order` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_phone` bigint(15) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `order_mark` bigint(40) DEFAULT NULL COMMENT '订单号',
  `goods_id` int(11) DEFAULT NULL COMMENT '商品id',
  `order_add_time` bigint(20) DEFAULT NULL COMMENT '下单时间',
  `group_alone` int(2) DEFAULT '0' COMMENT '是否拼团购买了/0代表拼团/1代表未拼团',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 COMMENT='订单表';

-- ----------------------------
-- Records of ob_order
-- ----------------------------
INSERT INTO `ob_order` VALUES ('3', '15090472769', '3', '2356935623516085', '6', '1591156211', '1');
INSERT INTO `ob_order` VALUES ('4', '15090472769', '3', '1514606257570260', '4', '1591168495', '1');
INSERT INTO `ob_order` VALUES ('5', '15090472769', '3', '604369396006152', '4', '1591168518', '1');
INSERT INTO `ob_order` VALUES ('6', '15090472769', '3', '3912011738364056', '4', '1591168535', '1');
INSERT INTO `ob_order` VALUES ('7', '15090472769', '3', '6825641282879249', '4', '1591168926', '1');
INSERT INTO `ob_order` VALUES ('9', '15090472779', '13', '7263350003245075', '4', '1591169139', '1');
INSERT INTO `ob_order` VALUES ('10', '15090472769', '3', '6458755152247877', '4', '1591169146', '1');
INSERT INTO `ob_order` VALUES ('11', '15090472780', '14', '7694486519523202', '4', '1591169179', '1');
INSERT INTO `ob_order` VALUES ('12', '15090472780', '14', '3429994003777108', '4', '1591178034', '1');
INSERT INTO `ob_order` VALUES ('13', '15090472780', '14', '5836490240943526', '5', '1591178049', '1');
INSERT INTO `ob_order` VALUES ('14', '15090472780', '14', '5459752426533771', '7', '1591178112', '0');

-- ----------------------------
-- Table structure for ob_play
-- ----------------------------
DROP TABLE IF EXISTS `ob_play`;
CREATE TABLE `ob_play` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `play_name` varchar(255) DEFAULT NULL COMMENT '戏曲名字',
  `video` varchar(255) DEFAULT NULL COMMENT '视频地址',
  `song_id` int(11) DEFAULT NULL COMMENT '那个类的戏曲',
  `picture` varchar(255) DEFAULT NULL COMMENT '图片介绍',
  `particular` text COMMENT '文字描述',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ob_play
-- ----------------------------
INSERT INTO `ob_play` VALUES ('6', '是的范德萨', '/static/upimg/20200411/706424e9068213bda40b8678d3125b01.mp4', '2', '/static/upimg/20200411/da671fc4cec1440833977aae1f377ce7.jpg', '曲艺是中华民族各种“说唱艺术”的统称，它是由民间口头文学和歌唱艺术经过长期发展演变形成的一种独特的艺术形式。据不完全统计，至今活跃在中国民间的各族曲艺曲种有 4 0 0个左 右 ，仅中原地区拥有和流传的曲种就多达高数，其中，河南坠子、三弦书、板头曲、大调曲子、河洛大鼓等曲种在全国都很有影响，被列人国家非物质文化遗产名录。');
INSERT INTO `ob_play` VALUES ('7', '中原曲艺', '/static/upimg/20200411/5f740b048bd9cb36989d62b07b6bbb63.mp4', '2', '/static/upimg/20200411/267f9bc766e965eeb7a2e625619824d4.jpg', '曲艺是中华民族各种“说唱艺术”的统称，它是由民间口头文学和歌唱艺术经过长期发展演变形成的一种独特的艺术形式。据不完全统计，至今活跃在中国民间的各族曲艺曲种有 4 0 0个左 右 ，仅中原地区拥有和流传的曲种就多达高数，其中，河南坠子、三弦书、板头曲、大调曲子、河洛大鼓等曲种在全国都很有影响，被列人国家非物质文化遗产名录。');

-- ----------------------------
-- Table structure for ob_song
-- ----------------------------
DROP TABLE IF EXISTS `ob_song`;
CREATE TABLE `ob_song` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pid` int(11) DEFAULT NULL COMMENT '暂时无用',
  `song_name` varchar(255) DEFAULT NULL COMMENT '导航名字',
  `introduce` varchar(255) DEFAULT NULL COMMENT '曲类的介绍',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ob_song
-- ----------------------------
INSERT INTO `ob_song` VALUES ('2', null, '中华', '中国年画');
INSERT INTO `ob_song` VALUES ('5', null, '周杰伦', '周杰伦很强');
INSERT INTO `ob_song` VALUES ('6', null, '周润发', '周润发很强');

-- ----------------------------
-- Table structure for ob_system
-- ----------------------------
DROP TABLE IF EXISTS `ob_system`;
CREATE TABLE `ob_system` (
  `name` varchar(255) NOT NULL DEFAULT '',
  `value` text NOT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='系统配置';

-- ----------------------------
-- Records of ob_system
-- ----------------------------
INSERT INTO `ob_system` VALUES ('administrator', 'admin');
INSERT INTO `ob_system` VALUES ('colse_explain', '');
INSERT INTO `ob_system` VALUES ('default_editor', 'ueditor');
INSERT INTO `ob_system` VALUES ('email_server', 'a:7:{s:4:\"host\";s:0:\"\";s:6:\"secure\";s:3:\"tls\";s:4:\"port\";s:0:\"\";s:8:\"username\";s:0:\"\";s:8:\"password\";s:0:\"\";s:8:\"fromname\";s:0:\"\";s:5:\"email\";s:0:\"\";}');
INSERT INTO `ob_system` VALUES ('page_number', '10');
INSERT INTO `ob_system` VALUES ('upload_image', 'a:15:{s:8:\"is_thumb\";s:1:\"1\";s:9:\"max_width\";s:4:\"1200\";s:10:\"max_height\";s:4:\"3600\";s:8:\"is_water\";s:1:\"0\";s:12:\"water_source\";s:0:\"\";s:12:\"water_locate\";s:1:\"1\";s:11:\"water_alpha\";s:0:\"\";s:7:\"is_text\";s:1:\"0\";s:4:\"text\";s:0:\"\";s:9:\"text_font\";s:0:\"\";s:11:\"text_locate\";s:1:\"1\";s:9:\"text_size\";s:0:\"\";s:10:\"text_color\";s:0:\"\";s:11:\"text_offset\";s:0:\"\";s:10:\"text_angle\";s:0:\"\";}');
INSERT INTO `ob_system` VALUES ('website_status', '1');

-- ----------------------------
-- Table structure for ob_user
-- ----------------------------
DROP TABLE IF EXISTS `ob_user`;
CREATE TABLE `ob_user` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `phone` bigint(15) DEFAULT NULL COMMENT '用户名',
  `password` varchar(255) NOT NULL DEFAULT '' COMMENT '密码',
  `mailbox` varchar(255) DEFAULT NULL COMMENT '邮箱',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=56 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='会员';

-- ----------------------------
-- Records of ob_user
-- ----------------------------
INSERT INTO `ob_user` VALUES ('1', '1111111110', 'e10adc3949ba59abbe56e057f20f883e', '1111111110@163.com');
INSERT INTO `ob_user` VALUES ('2', '15090472768', 'e10adc3949ba59abbe56e057f20f883e', '15090472768@163.com');
INSERT INTO `ob_user` VALUES ('3', '15090472769', 'e10adc3949ba59abbe56e057f20f883e', '15090472769@163.com');
INSERT INTO `ob_user` VALUES ('4', '15090472770', 'e10adc3949ba59abbe56e057f20f883e', '15090472770@163.com');
INSERT INTO `ob_user` VALUES ('5', '15090472771', 'e10adc3949ba59abbe56e057f20f883e', '15090472771@163.com');
INSERT INTO `ob_user` VALUES ('6', '15090472772', 'e10adc3949ba59abbe56e057f20f883e', '15090472772@163.com');
INSERT INTO `ob_user` VALUES ('7', '15090472773', 'e10adc3949ba59abbe56e057f20f883e', '15090472773@163.com');
INSERT INTO `ob_user` VALUES ('8', '15090472774', 'e10adc3949ba59abbe56e057f20f883e', '15090472774@163.com');
INSERT INTO `ob_user` VALUES ('9', '15090472775', 'e10adc3949ba59abbe56e057f20f883e', '15090472775@163.com');
INSERT INTO `ob_user` VALUES ('10', '15090472776', 'e10adc3949ba59abbe56e057f20f883e', '15090472776@163.com');
INSERT INTO `ob_user` VALUES ('11', '15090472777', 'e10adc3949ba59abbe56e057f20f883e', '15090472777@163.com');
INSERT INTO `ob_user` VALUES ('12', '15090472778', 'e10adc3949ba59abbe56e057f20f883e', '15090472778@163.com');
INSERT INTO `ob_user` VALUES ('13', '15090472779', 'e10adc3949ba59abbe56e057f20f883e', '15090472779@163.com');
INSERT INTO `ob_user` VALUES ('14', '15090472780', 'e10adc3949ba59abbe56e057f20f883e', '15090472780@163.com');
INSERT INTO `ob_user` VALUES ('15', '15090472781', 'e10adc3949ba59abbe56e057f20f883e', '15090472781@163.com');
INSERT INTO `ob_user` VALUES ('16', '15090472782', 'e10adc3949ba59abbe56e057f20f883e', '15090472782@163.com');
INSERT INTO `ob_user` VALUES ('17', '15090472783', 'e10adc3949ba59abbe56e057f20f883e', '15090472783@163.com');
INSERT INTO `ob_user` VALUES ('18', '15090472784', 'e10adc3949ba59abbe56e057f20f883e', '15090472784@163.com');
INSERT INTO `ob_user` VALUES ('19', '15090472785', 'e10adc3949ba59abbe56e057f20f883e', '15090472785@163.com');
INSERT INTO `ob_user` VALUES ('20', '15090472786', 'e10adc3949ba59abbe56e057f20f883e', '15090472786@163.com');
INSERT INTO `ob_user` VALUES ('21', '15090472787', 'e10adc3949ba59abbe56e057f20f883e', '15090472787@163.com');
INSERT INTO `ob_user` VALUES ('22', '15090472788', 'e10adc3949ba59abbe56e057f20f883e', '15090472788@163.com');
INSERT INTO `ob_user` VALUES ('23', '15090472789', 'e10adc3949ba59abbe56e057f20f883e', '15090472789@163.com');
INSERT INTO `ob_user` VALUES ('24', '15090472790', 'e10adc3949ba59abbe56e057f20f883e', '15090472790@163.com');
INSERT INTO `ob_user` VALUES ('25', '15090472791', 'e10adc3949ba59abbe56e057f20f883e', '15090472791@163.com');
INSERT INTO `ob_user` VALUES ('26', '15090472792', 'e10adc3949ba59abbe56e057f20f883e', '15090472792@163.com');
INSERT INTO `ob_user` VALUES ('27', '15090472793', 'e10adc3949ba59abbe56e057f20f883e', '15090472793@163.com');
INSERT INTO `ob_user` VALUES ('28', '15090472794', 'e10adc3949ba59abbe56e057f20f883e', '15090472794@163.com');
INSERT INTO `ob_user` VALUES ('29', '15090472795', 'e10adc3949ba59abbe56e057f20f883e', '15090472795@163.com');
INSERT INTO `ob_user` VALUES ('30', '15090472796', 'e10adc3949ba59abbe56e057f20f883e', '15090472796@163.com');
INSERT INTO `ob_user` VALUES ('31', '15090472797', 'e10adc3949ba59abbe56e057f20f883e', '15090472797@163.com');
INSERT INTO `ob_user` VALUES ('32', '15090472798', 'e10adc3949ba59abbe56e057f20f883e', '15090472798@163.com');
INSERT INTO `ob_user` VALUES ('33', '15090472799', 'e10adc3949ba59abbe56e057f20f883e', '15090472799@163.com');
INSERT INTO `ob_user` VALUES ('34', '15090472800', 'e10adc3949ba59abbe56e057f20f883e', '15090472800@163.com');
INSERT INTO `ob_user` VALUES ('35', '15090472801', 'e10adc3949ba59abbe56e057f20f883e', '15090472801@163.com');
INSERT INTO `ob_user` VALUES ('36', '15090472802', 'e10adc3949ba59abbe56e057f20f883e', '15090472802@163.com');
INSERT INTO `ob_user` VALUES ('37', '15090472803', 'e10adc3949ba59abbe56e057f20f883e', '15090472803@163.com');
INSERT INTO `ob_user` VALUES ('38', '15090472804', 'e10adc3949ba59abbe56e057f20f883e', '15090472804@163.com');
INSERT INTO `ob_user` VALUES ('39', '15090472805', 'e10adc3949ba59abbe56e057f20f883e', '15090472805@163.com');
INSERT INTO `ob_user` VALUES ('40', '15090472806', 'e10adc3949ba59abbe56e057f20f883e', '15090472806@163.com');
INSERT INTO `ob_user` VALUES ('41', '15090472807', 'e10adc3949ba59abbe56e057f20f883e', '15090472807@163.com');
INSERT INTO `ob_user` VALUES ('42', '15090472808', 'e10adc3949ba59abbe56e057f20f883e', '15090472808@163.com');
INSERT INTO `ob_user` VALUES ('43', '15090472809', 'e10adc3949ba59abbe56e057f20f883e', '15090472809@163.com');
INSERT INTO `ob_user` VALUES ('44', '15090472810', 'e10adc3949ba59abbe56e057f20f883e', '15090472810@163.com');
INSERT INTO `ob_user` VALUES ('45', '15090472811', 'e10adc3949ba59abbe56e057f20f883e', '15090472811@163.com');
INSERT INTO `ob_user` VALUES ('46', '15090472812', 'e10adc3949ba59abbe56e057f20f883e', '15090472812@163.com');
INSERT INTO `ob_user` VALUES ('47', '15090472813', 'e10adc3949ba59abbe56e057f20f883e', '15090472813@163.com');
INSERT INTO `ob_user` VALUES ('48', '15090472814', 'e10adc3949ba59abbe56e057f20f883e', '15090472814@163.com');
INSERT INTO `ob_user` VALUES ('49', '15090472815', 'e10adc3949ba59abbe56e057f20f883e', '15090472815@163.com');
INSERT INTO `ob_user` VALUES ('50', '15090472816', 'e10adc3949ba59abbe56e057f20f883e', '15090472816@163.com');
INSERT INTO `ob_user` VALUES ('51', '15090472817', 'e10adc3949ba59abbe56e057f20f883e', '15090472817@163.com');
INSERT INTO `ob_user` VALUES ('52', '15090472818', 'e10adc3949ba59abbe56e057f20f883e', '15090472818@163.com');
INSERT INTO `ob_user` VALUES ('53', '15090472819', 'e10adc3949ba59abbe56e057f20f883e', '15090472819@163.com');
INSERT INTO `ob_user` VALUES ('54', '15090472820', 'e10adc3949ba59abbe56e057f20f883e', '15090472820@163.com');
INSERT INTO `ob_user` VALUES ('55', '15090472762', 'e10adc3949ba59abbe56e057f20f883e', '15090472762@163.com');

-- ----------------------------
-- Table structure for ob_user_log
-- ----------------------------
DROP TABLE IF EXISTS `ob_user_log`;
CREATE TABLE `ob_user_log` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT '管理员id',
  `username` varchar(32) NOT NULL DEFAULT '' COMMENT '管理员用户名',
  `useragent` varchar(255) NOT NULL DEFAULT '' COMMENT 'User-Agent',
  `ip` varchar(16) NOT NULL DEFAULT '' COMMENT 'ip地址',
  `url` varchar(255) NOT NULL DEFAULT '' COMMENT '请求链接',
  `method` varchar(32) NOT NULL DEFAULT '' COMMENT '请求类型',
  `type` varchar(32) NOT NULL DEFAULT '' COMMENT '资源类型',
  `param` text NOT NULL COMMENT '请求参数',
  `remark` varchar(255) NOT NULL DEFAULT '' COMMENT '日志备注',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='会员日志';

-- ----------------------------
-- Records of ob_user_log
-- ----------------------------
