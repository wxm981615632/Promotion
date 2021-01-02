/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50553
Source Host           : localhost:3306
Source Database       : xhadmin

Target Server Type    : MYSQL
Target Server Version : 50553
File Encoding         : 65001

Date: 2020-10-17 17:25:45
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `cd_access`
-- ----------------------------
DROP TABLE IF EXISTS `cd_access`;
CREATE TABLE `cd_access` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '分组ID',
  `purviewval` longtext COMMENT '分组对应权限值',
  `role_id` smallint(4) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `group_id` (`role_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2984 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cd_access
-- ----------------------------
INSERT INTO `cd_access` VALUES ('2334', '/admin/Sys.Menu/index?app_id=1', '14');
INSERT INTO `cd_access` VALUES ('2333', '/admin/System', '14');
INSERT INTO `cd_access` VALUES ('2332', '/admin/Link/import', '14');
INSERT INTO `cd_access` VALUES ('2331', '/admin/Link/view', '14');
INSERT INTO `cd_access` VALUES ('2330', '/admin/Link/delete', '14');
INSERT INTO `cd_access` VALUES ('2329', '/admin/Link/update', '14');
INSERT INTO `cd_access` VALUES ('2328', '/admin/Link/add', '14');
INSERT INTO `cd_access` VALUES ('2327', '/admin/Link/updateExt', '14');
INSERT INTO `cd_access` VALUES ('2326', '/admin/Link/index', '14');
INSERT INTO `cd_access` VALUES ('2325', '/admin/Link', '14');
INSERT INTO `cd_access` VALUES ('2503', 'admin/Sys.Menu/index?app_id=1', '18');
INSERT INTO `cd_access` VALUES ('2502', 'admin/System/index', '18');
INSERT INTO `cd_access` VALUES ('2501', 'admin/Supplier/updatePass', '18');
INSERT INTO `cd_access` VALUES ('2500', 'admin/Supplier/view', '18');
INSERT INTO `cd_access` VALUES ('2499', 'admin/Supplier/delete', '18');
INSERT INTO `cd_access` VALUES ('2498', 'admin/Supplier/update', '18');
INSERT INTO `cd_access` VALUES ('2497', 'admin/Supplier/add', '18');
INSERT INTO `cd_access` VALUES ('2495', 'admin/Supplier/index', '18');
INSERT INTO `cd_access` VALUES ('2496', 'admin/Supplier/updateExt', '18');
INSERT INTO `cd_access` VALUES ('2494', 'admin/Supplier/index', '18');
INSERT INTO `cd_access` VALUES ('2983', 'admin/Base/password', '19');
INSERT INTO `cd_access` VALUES ('2980', 'admin/LinkCatagory/delete', '19');
INSERT INTO `cd_access` VALUES ('2979', 'admin/LinkCatagory/update', '19');
INSERT INTO `cd_access` VALUES ('2978', 'admin/LinkCatagory/add', '19');
INSERT INTO `cd_access` VALUES ('2977', 'admin/LinkCatagory/updateExt', '19');
INSERT INTO `cd_access` VALUES ('2974', 'admin/Cms.Position/delete', '19');
INSERT INTO `cd_access` VALUES ('2975', 'admin/LinkCatagory', '19');
INSERT INTO `cd_access` VALUES ('2976', 'admin/LinkCatagory/index', '19');
INSERT INTO `cd_access` VALUES ('2982', 'admin/Index/main', '19');
INSERT INTO `cd_access` VALUES ('2981', 'admin/LinkCatagory/view', '19');
INSERT INTO `cd_access` VALUES ('2973', 'admin/Cms.Position/update', '19');
INSERT INTO `cd_access` VALUES ('2972', 'admin/Cms.Position/add', '19');
INSERT INTO `cd_access` VALUES ('2971', 'admin/Cms.Position/updateExt', '19');
INSERT INTO `cd_access` VALUES ('2970', 'admin/Cms.Position/index', '19');
INSERT INTO `cd_access` VALUES ('2969', 'admin/Cms.Position', '19');
INSERT INTO `cd_access` VALUES ('2968', 'admin/Cms.Frament/delete', '19');
INSERT INTO `cd_access` VALUES ('2967', 'admin/Cms.Frament/update', '19');
INSERT INTO `cd_access` VALUES ('2965', 'admin/Cms.Frament/updateExt', '19');
INSERT INTO `cd_access` VALUES ('2966', 'admin/Cms.Frament/add', '19');
INSERT INTO `cd_access` VALUES ('2964', 'admin/Cms.Frament/index', '19');
INSERT INTO `cd_access` VALUES ('2963', 'admin/Cms.Frament', '19');
INSERT INTO `cd_access` VALUES ('2962', 'admin/Cms.Content/move', '19');
INSERT INTO `cd_access` VALUES ('2961', 'admin/Cms.Content/delPosition', '19');
INSERT INTO `cd_access` VALUES ('2960', 'admin/Cms.Content/setPosition', '19');
INSERT INTO `cd_access` VALUES ('2958', 'admin/Cms.Content/delete', '19');
INSERT INTO `cd_access` VALUES ('2959', 'admin/Cms.Content/setSort', '19');
INSERT INTO `cd_access` VALUES ('2956', 'admin/Cms.Content/add', '19');
INSERT INTO `cd_access` VALUES ('2957', 'admin/Cms.Content/update', '19');
INSERT INTO `cd_access` VALUES ('2955', 'admin/Cms.Content/updateExt', '19');
INSERT INTO `cd_access` VALUES ('2954', 'admin/Cms.Content/index', '19');
INSERT INTO `cd_access` VALUES ('2953', 'admin/Cms.Content', '19');
INSERT INTO `cd_access` VALUES ('2952', 'admin/Cms.Catagory/setSort', '19');
INSERT INTO `cd_access` VALUES ('2951', 'admin/Cms.Catagory/delete', '19');
INSERT INTO `cd_access` VALUES ('2950', 'admin/Cms.Catagory/update', '19');
INSERT INTO `cd_access` VALUES ('2949', 'admin/Cms.Catagory/add', '19');
INSERT INTO `cd_access` VALUES ('2947', 'admin/Cms.Catagory/index', '19');
INSERT INTO `cd_access` VALUES ('2948', 'admin/Cms.Catagory/updateExt', '19');
INSERT INTO `cd_access` VALUES ('2945', 'admin/Cms', '19');
INSERT INTO `cd_access` VALUES ('2946', 'admin/Cms.Catagory', '19');
INSERT INTO `cd_access` VALUES ('2944', 'admin/Base/password', '17');
INSERT INTO `cd_access` VALUES ('2943', 'admin/Index/main', '17');
INSERT INTO `cd_access` VALUES ('2942', 'admin/System', '17');
INSERT INTO `cd_access` VALUES ('2941', 'admin/Member/view', '17');
INSERT INTO `cd_access` VALUES ('2940', 'admin/Member/delete', '17');
INSERT INTO `cd_access` VALUES ('2939', 'admin/Member/update', '17');
INSERT INTO `cd_access` VALUES ('2938', 'admin/Member/add', '17');
INSERT INTO `cd_access` VALUES ('2937', 'admin/Member/updateExt', '17');
INSERT INTO `cd_access` VALUES ('2936', 'admin/Member/index', '17');
INSERT INTO `cd_access` VALUES ('2935', 'admin/Member', '17');
INSERT INTO `cd_access` VALUES ('2813', 'admin/Link/delete', '20');
INSERT INTO `cd_access` VALUES ('2812', 'admin/Link/update', '20');
INSERT INTO `cd_access` VALUES ('2811', 'admin/Link/add', '20');
INSERT INTO `cd_access` VALUES ('2810', 'admin/Link/updateExt', '20');
INSERT INTO `cd_access` VALUES ('2809', 'admin/Link/index', '20');
INSERT INTO `cd_access` VALUES ('2808', 'admin/Link', '20');
INSERT INTO `cd_access` VALUES ('2814', 'admin/Link/view', '20');

-- ----------------------------
-- Table structure for `cd_action`
-- ----------------------------
DROP TABLE IF EXISTS `cd_action`;
CREATE TABLE `cd_action` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `menu_id` int(9) NOT NULL COMMENT '模块ID',
  `name` varchar(255) DEFAULT NULL COMMENT '动作名称',
  `action_name` varchar(128) NOT NULL COMMENT '动作名称',
  `type` tinyint(4) NOT NULL,
  `icon` varchar(32) DEFAULT NULL COMMENT 'icon图标',
  `pagesize` varchar(5) DEFAULT '20' COMMENT '每页显示数据条数',
  `is_view` tinyint(4) DEFAULT '0' COMMENT '是否按钮',
  `button_status` tinyint(4) DEFAULT NULL COMMENT '按钮是否显示列表',
  `sql_query` mediumtext COMMENT 'sql数据源',
  `block_name` varchar(255) DEFAULT NULL COMMENT '注释',
  `remark` varchar(255) DEFAULT NULL COMMENT '打开页面尺寸',
  `fields` text COMMENT '操作的字段',
  `note` varchar(255) DEFAULT NULL COMMENT '备注',
  `lable_color` varchar(12) DEFAULT NULL COMMENT '按钮背景色',
  `relate_table` varchar(32) DEFAULT NULL COMMENT '关联表',
  `relate_field` varchar(32) DEFAULT NULL COMMENT '关联字段',
  `list_field` varchar(255) DEFAULT NULL COMMENT '查询的字段',
  `bs_icon` varchar(32) DEFAULT NULL COMMENT '按钮图标',
  `sortid` mediumint(9) DEFAULT '0' COMMENT '排序',
  `orderby` varchar(250) DEFAULT NULL COMMENT '配置排序',
  `default_orderby` varchar(50) DEFAULT NULL COMMENT '默认排序',
  `tree_config` varchar(50) DEFAULT NULL,
  `jump` varchar(120) DEFAULT NULL COMMENT '按钮跳转地址',
  `is_controller_create` tinyint(4) DEFAULT '1' COMMENT '是否生成控制其方法',
  `is_service_create` tinyint(4) DEFAULT NULL COMMENT '是否生成服务层方法',
  `is_view_create` tinyint(4) DEFAULT NULL COMMENT '视图生成',
  `cache_time` mediumint(9) DEFAULT NULL COMMENT '缓存时间',
  `log_status` tinyint(4) DEFAULT NULL COMMENT '是否生成日志',
  `api_auth` tinyint(4) DEFAULT NULL COMMENT '接口是否鉴权',
  `sms_auth` tinyint(4) DEFAULT NULL COMMENT '短信验证',
  `captcha_auth` tinyint(4) DEFAULT NULL COMMENT '列表选中方式 1多选 2单选',
  `request_type` varchar(20) DEFAULT NULL COMMENT '请求类型',
  `do_condition` varchar(50) DEFAULT NULL COMMENT '操作条件',
  `select_type` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `menu_id` (`menu_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2402 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cd_action
-- ----------------------------
INSERT INTO `cd_action` VALUES ('78', '18', '首页数据列表', 'index', '1', '', '', '0', '0', 'select a.*,group_concat(b.name) as role_name from pre_user as a left join pre_role as b on find_in_set(b.role_id,a.role_id)  group by a.user_id', '', '', '', '', 'primary', '', '', '', '', '1', '', '', '', '', '1', '1', '1', null, null, null, null, '0', null, '', '2');
INSERT INTO `cd_action` VALUES ('80', '18', '添加', 'add', '3', '', '20', '1', '0', '', '添加账户', '800px|550px', 'name,user,pwd,role_id,note,status,create_time', '', 'primary', '', '', '', 'fa fa-plus', '3', '', '', '', '', '1', '1', '1', null, null, null, null, '0', null, '', null);
INSERT INTO `cd_action` VALUES ('81', '18', '修改', 'update', '4', '', '', '1', '1', '', '修改账户', '800px|500px', 'name,user,role_id,note,status,create_time', '', 'success', '', '', '', 'fa fa-edit', '4', '', '', '', '', '1', '1', '1', null, null, null, null, '0', null, '', null);
INSERT INTO `cd_action` VALUES ('82', '18', '修改密码', 'updatePassword', '9', '', '', '1', '0', '', '修改密码', '600px|300px', 'pwd', '', 'warning', '', '', '', '', '6', '', '', '', null, null, null, null, null, null, null, null, '0', null, null, null);
INSERT INTO `cd_action` VALUES ('85', '19', '首页数据列表', 'index', '1', '', '', '0', '0', '', '', '600px|250px', '', '', 'primary', '', '', '', '', '1', '', '', 'pid,name', '', '1', '1', '1', null, null, null, null, '0', null, '', '1');
INSERT INTO `cd_action` VALUES ('87', '19', '添加', 'add', '3', '', '', '1', '0', '', '添加分组', '800px|400px', 'pid,name,status,description', '', 'primary', '', '', '', 'fa fa-plus', '3', '', '', '', '', '1', '1', '1', null, null, null, null, '0', null, '', null);
INSERT INTO `cd_action` VALUES ('88', '19', '修改', 'update', '4', '', '', '1', '1', '', '修改分组', '800px|400px', 'pid,name,status,description', '', 'primary', '', '', '', 'fa fa-edit', '4', '', '', '', '', '1', '1', '1', null, null, null, null, '0', null, '', null);
INSERT INTO `cd_action` VALUES ('2131', '19', '修改状态', 'updateExt', '16', null, '', '0', '0', '', '修改排序开关按钮操作', '', '', null, 'primary', '', '', '', '', '324', null, '', '', '', '1', '1', '1', null, null, null, null, null, null, '', null);
INSERT INTO `cd_action` VALUES ('2132', '19', '设置权限', 'auth', '11', null, '', '1', '1', '', '弹窗连接', '100%|100%', '', null, 'primary', '', '', '', 'fa fa-plus', '2131', null, '', '', '/Base/auth', '1', '1', '1', null, null, null, null, null, null, '', '2');
INSERT INTO `cd_action` VALUES ('106', '19', '查看用户', 'viewUser', '11', '', '', '1', '1', '', '弹窗连接', '100%|100%', 'status', '', 'success', '', '', '', 'fa fa-eye', '8', '', '', '', '/User/index', '1', '1', '1', null, null, null, null, '0', null, '', '2');
INSERT INTO `cd_action` VALUES ('324', '19', '删除', 'delete', '5', null, '', '1', '1', '', '删除数据', '', '', null, 'danger', '', '', '', 'fa fa-trash', '2132', '', '', '', '', '0', '1', '1', null, null, null, null, '0', null, '', null);
INSERT INTO `cd_action` VALUES ('462', '18', '删除', 'delete', '5', null, '', '1', '1', '', '删除数据', '', '', null, 'danger', '', '', '', 'fa fa-trash', '462', null, '', '', '', '0', '1', '1', null, null, null, null, '0', null, '', null);
INSERT INTO `cd_action` VALUES ('2133', '18', '修改状态', 'updateExt', '16', null, '', '0', '0', '', '修改排序开关按钮操作', '', '', null, 'primary', '', '', '', '', '2133', null, '', '', '', '1', '1', '1', null, null, null, null, null, null, '', null);
INSERT INTO `cd_action` VALUES ('2140', '670', '首页数据列表', 'index', '1', null, '20', '0', null, null, null, null, null, null, null, null, null, null, null, '1', null, null, null, null, '1', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `cd_action` VALUES ('2160', '673', '删除', 'delete', '5', null, '20', '1', '1', null, '删除', '', '', null, 'danger', null, null, null, 'fa fa-trash', '2160', null, null, null, null, '1', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `cd_action` VALUES ('2159', '673', '修改', 'update', '4', null, '20', '1', '1', null, '修改', '800px|500px', 'title,upload_replace,thumb_status,thumb_width,thumb_height,thumb_type', null, 'success', null, null, null, 'fa fa-pencil', '2159', null, null, null, null, '1', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `cd_action` VALUES ('2144', '670', '删除', 'delete', '5', null, '20', '1', '1', null, '删除', '', '', null, 'danger', null, null, null, 'fa fa-trash', '2144', null, null, null, null, '1', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `cd_action` VALUES ('2145', '670', '查看详情', 'view', '15', null, '20', '1', '0', '', '查看详情', '800px|600px', 'application_name,username,url,ip,useragent,content,errmsg,type,create_time', null, 'info', '', '', '', 'fa fa-eye', '2145', null, '', '', '', '1', '1', '1', null, null, null, null, null, null, null, '2');
INSERT INTO `cd_action` VALUES ('2146', '670', '导出', 'dumpData', '12', null, '20', '1', '0', null, '导出', '', '', null, 'warning', null, null, null, 'fa fa-download', '2146', null, null, null, null, '1', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `cd_action` VALUES ('2158', '673', '添加', 'add', '3', null, '20', '1', '0', null, '添加', '800px|500px', 'title,upload_replace,thumb_status,thumb_width,thumb_height,thumb_type', null, 'primary', null, null, null, 'fa fa-plus', '2158', null, null, null, null, '1', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `cd_action` VALUES ('2157', '673', '修改排序开关按钮操作', 'updateExt', '16', null, '20', '0', null, null, null, null, null, null, null, null, null, null, null, '2', null, null, null, null, '1', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `cd_action` VALUES ('2156', '673', '首页数据列表', 'index', '1', null, '20', '0', null, null, null, null, null, null, null, null, null, null, null, '1', null, null, null, null, '1', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `cd_action` VALUES ('2275', '41', '首页方法', 'index', '1', null, '', '1', '0', '', '', '', '', null, 'primary', '', '', '', '', '2275', null, '', '', '', '1', '1', '1', null, null, null, null, null, null, null, '2');

-- ----------------------------
-- Table structure for `cd_application`
-- ----------------------------
DROP TABLE IF EXISTS `cd_application`;
CREATE TABLE `cd_application` (
  `app_id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(250) DEFAULT NULL,
  `app_dir` varchar(250) DEFAULT NULL,
  `status` tinyint(4) DEFAULT NULL,
  `app_type` tinyint(4) DEFAULT NULL,
  `login_table` varchar(250) DEFAULT NULL,
  `login_fields` varchar(250) DEFAULT NULL,
  `domain` varchar(250) DEFAULT NULL,
  `pk` varchar(50) DEFAULT NULL COMMENT '登录表主键',
  PRIMARY KEY (`app_id`)
) ENGINE=MyISAM AUTO_INCREMENT=208 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cd_application
-- ----------------------------
INSERT INTO `cd_application` VALUES ('1', '后台管理', 'admin', '1', '1', '', '', '', null);

-- ----------------------------
-- Table structure for `cd_config`
-- ----------------------------
DROP TABLE IF EXISTS `cd_config`;
CREATE TABLE `cd_config` (
  `name` varchar(50) NOT NULL,
  `data` varchar(255) NOT NULL,
  KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cd_config
-- ----------------------------
INSERT INTO `cd_config` VALUES ('water_status', '0');
INSERT INTO `cd_config` VALUES ('site_title', 'xhadmin后台管理系统');
INSERT INTO `cd_config` VALUES ('keyword', 'xhadmin,一键生成,不写一行代码');
INSERT INTO `cd_config` VALUES ('description', '停车管理系统');
INSERT INTO `cd_config` VALUES ('site_logo', '/uploads/admin/202010/5f8ab80c1e43d.jpg');
INSERT INTO `cd_config` VALUES ('file_size', '100');
INSERT INTO `cd_config` VALUES ('copyright', '寒塘冷月 qq:274363574');
INSERT INTO `cd_config` VALUES ('file_type', 'gif,png,jpg,jpeg,doc,docx,xls,xlsx,csv,pdf,rar,zip,txt,mp4,flv');
INSERT INTO `cd_config` VALUES ('domain', '');
INSERT INTO `cd_config` VALUES ('water_position', '5');
INSERT INTO `cd_config` VALUES ('water_logo', '');
INSERT INTO `cd_config` VALUES ('pz', '{&quot;关键词&quot;:&quot;xhadmin,一键生成&quot;,&quot;描述&quot;:&quot;快速开发&quot;}');

-- ----------------------------
-- Table structure for `cd_field`
-- ----------------------------
DROP TABLE IF EXISTS `cd_field`;
CREATE TABLE `cd_field` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `menu_id` int(9) NOT NULL COMMENT '模块ID',
  `name` varchar(64) NOT NULL COMMENT '字段名称',
  `field` varchar(32) NOT NULL,
  `type` smallint(4) NOT NULL COMMENT '表单类型1输入框 2下拉框 3单选框 4多选框 5上传图片 6编辑器 7时间',
  `list_show` tinyint(4) DEFAULT NULL COMMENT '列表显示',
  `search_show` tinyint(4) DEFAULT NULL COMMENT '搜索显示',
  `search_type` tinyint(4) DEFAULT NULL COMMENT '1精确匹配 2模糊搜索',
  `config` varchar(255) DEFAULT NULL COMMENT '下拉框或者单选框配置',
  `is_post` tinyint(4) DEFAULT NULL COMMENT '是否前台录入',
  `is_field` tinyint(4) DEFAULT NULL,
  `align` varchar(24) DEFAULT NULL COMMENT '表格显示位置',
  `note` varchar(255) DEFAULT NULL COMMENT '提示信息',
  `message` varchar(255) DEFAULT NULL COMMENT '错误提示',
  `validate` varchar(32) DEFAULT NULL COMMENT '验证方式',
  `rule` mediumtext COMMENT '验证规则',
  `sortid` mediumint(9) DEFAULT '0' COMMENT '排序号',
  `sql` varchar(255) DEFAULT NULL COMMENT '字段配置数据源sql',
  `tab_menu_name` varchar(30) DEFAULT NULL COMMENT '所属选项卡名称',
  `default_value` varchar(255) DEFAULT NULL,
  `datatype` varchar(32) DEFAULT NULL COMMENT '字段数据类型',
  `length` varchar(5) DEFAULT NULL COMMENT '字段长度',
  `indexdata` varchar(20) DEFAULT NULL COMMENT '索引',
  PRIMARY KEY (`id`),
  KEY `menu_id` (`menu_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2694 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cd_field
-- ----------------------------
INSERT INTO `cd_field` VALUES ('134', '18', '编号', 'user_id', '1', '1', '0', '0', '', '0', '1', 'center', '', '', '', '', '1', '', '', '', '', '', '');
INSERT INTO `cd_field` VALUES ('135', '18', '真实姓名', 'name', '1', '1', '0', '0', '', '1', '1', 'center', '', '用户名不能为空', 'notEmpty', '', '2', '', '', '', '', '', '');
INSERT INTO `cd_field` VALUES ('136', '18', '用户名', 'user', '1', '1', '1', '0', '', '1', '1', 'center', '', '用户名不能为空', 'notEmpty', '', '3', '', '', '', '', '', '');
INSERT INTO `cd_field` VALUES ('137', '18', '密码', 'pwd', '5', '0', '0', '0', '', '1', '1', 'center', '', '6-21位数字字母组合', 'notEmpty', '/^(?![0-9]+$)(?![a-zA-Z]+$)[0-9A-Za-z]{6,20}$/', '4', '', '', '', '', '', '');
INSERT INTO `cd_field` VALUES ('138', '18', '所属分组', 'role_id', '27', '0', '1', '0', '', '1', '1', 'center', '', '', '', '', '5', 'select role_id,name,pid from pre_role', '', '', 'varchar', '250', '');
INSERT INTO `cd_field` VALUES ('140', '18', '备注', 'note', '1', '1', '0', '0', '', '1', '1', 'center', '', '', '', '', '7', '', '', '', '', '', '');
INSERT INTO `cd_field` VALUES ('141', '18', '状态', 'status', '23', '1', '1', '0', '开启|1,关闭|0', '1', '1', 'center', '', '', '', '', '7', '', '', '', 'tinyint', '4', '');
INSERT INTO `cd_field` VALUES ('142', '18', '创建时间', 'create_time', '12', '1', '0', '0', '', '1', '1', 'center', '', '', '', '', '8', '', '', '', '', '', '');
INSERT INTO `cd_field` VALUES ('143', '18', '所属分组', 'role_name', '1', '1', '0', '0', '', '0', '0', 'center', '', '', '', '', '5', '', '', '', '', '', '');
INSERT INTO `cd_field` VALUES ('144', '19', '编号', 'role_id', '1', '1', '0', null, '', '0', '0', 'center', '', '', '', '', '1', '', '', null, null, null, null);
INSERT INTO `cd_field` VALUES ('145', '19', '角色', 'name', '1', '1', '0', '0', '', '1', '0', 'left', '', '名称不能为空', 'notEmpty', '', '3', '', '', '', '', '', '');
INSERT INTO `cd_field` VALUES ('146', '19', '状态', 'status', '23', '1', '0', '0', '开启|1,关闭|0', '1', '0', 'center', '', '', '', '', '2387', '', '', '', 'tinyint', '4', '');
INSERT INTO `cd_field` VALUES ('2388', '19', '描述', 'description', '6', '0', '0', '0', '', '1', '1', 'center', '', '', '', '', '2388', '', '', '', 'text', '0', '');
INSERT INTO `cd_field` VALUES ('2411', '673', '编号', 'id', '1', '1', '0', null, null, '0', '0', 'center', null, null, null, null, '1', null, null, null, 'int', '11', null);
INSERT INTO `cd_field` VALUES ('2412', '673', '配置名称', 'title', '1', '1', '1', '0', null, '1', '0', 'center', null, null, null, null, '2412', null, null, null, 'varchar', '250', null);
INSERT INTO `cd_field` VALUES ('2413', '673', '覆盖同名文件', 'upload_replace', '23', '1', '0', '0', '开启|1,关闭|0', '1', '0', 'center', '', '', '', '', '2414', '', '', '', 'tinyint', '4', '');
INSERT INTO `cd_field` VALUES ('2414', '673', '缩图开关', 'thumb_status', '23', '1', '0', '0', '开启|1,关闭|0', '1', '0', 'center', '', '', '', '', '2413', '', '', '', 'tinyint', '4', '');
INSERT INTO `cd_field` VALUES ('2415', '673', '缩放宽度', 'thumb_width', '1', '1', '0', '0', '', '1', '0', 'center', '单位px', '', '', '', '2415', '', '', '', 'varchar', '250', '');
INSERT INTO `cd_field` VALUES ('194', '41', '站点名称', 'site_title', '1', '0', '0', null, '', '1', '0', 'center', '', '', 'notEmpty', '', '194', '', '基本设置', '', '', '', '');
INSERT INTO `cd_field` VALUES ('195', '41', '关键词站点', 'keyword', '28', '0', '0', null, '', '1', '0', 'center', '', '', '', '', '196', '', '基本设置', '', null, null, null);
INSERT INTO `cd_field` VALUES ('196', '41', '站点描述', 'description', '6', '0', '0', null, '', '1', '0', 'center', '', '', '', '', '197', '', '基本设置', null, null, null, null);
INSERT INTO `cd_field` VALUES ('198', '41', '站点LOGO', 'site_logo', '8', '0', '0', null, '', '1', '0', 'center', '', '', '', '', '195', '', '基本设置', null, null, null, null);
INSERT INTO `cd_field` VALUES ('200', '41', '上传文件大小', 'file_size', '1', '0', '0', '0', '', '1', '0', 'center', '', '', '', '', '200', '', '上传配置', null, null, null, null);
INSERT INTO `cd_field` VALUES ('1462', '41', '站点版权', 'copyright', '1', null, '0', null, '', '1', null, 'center', '', '', '', '', '700', null, '基本设置', '', null, null, null);
INSERT INTO `cd_field` VALUES ('488', '41', '文件类型', 'file_type', '6', '0', '0', '0', '', '1', '0', 'center', '', '', '', '', '488', '', '上传配置', null, null, null, null);
INSERT INTO `cd_field` VALUES ('700', '41', '绑定域名', 'domain', '1', '0', '0', '0', '', '1', '1', 'center', '上传目录绑定域名访问，请解析域名到 /public/upload目录  前面带上http://  非必填项', '', '', '', '2144', '', '上传配置', '', '', '', '');
INSERT INTO `cd_field` VALUES ('2143', '41', '水印位置', 'water_position', '29', null, null, null, '左上角水印|1,上居中水印|2,右上角水印|3,左居中水印|4,居中水印|5,右居中水印|6,左下角水印|7,下居中水印|8,右下角水印|9', '1', null, 'center', '', '', '', '', '2142', '', '上传配置', '', null, null, null);
INSERT INTO `cd_field` VALUES ('2142', '41', '水印状态', 'water_status', '3', null, null, null, '正常|1|success,禁用|0|danger', '1', null, 'center', '', '', '', '', '1462', '', '上传配置', '0', null, null, null);
INSERT INTO `cd_field` VALUES ('2144', '41', '水印图片', 'water_logo', '8', null, null, null, '', '1', null, 'center', '', '', '', '', '2143', '', '上传配置', '', null, null, null);
INSERT INTO `cd_field` VALUES ('2416', '673', '缩放高度', 'thumb_height', '1', '1', '0', '0', '', '1', '0', 'center', '单位px', '', '', '', '2416', '', '', '', 'varchar', '250', '');
INSERT INTO `cd_field` VALUES ('2417', '673', '缩图方式', 'thumb_type', '2', '1', '1', '0', '等比例缩放|1,缩放后填充|2,居中裁剪|3,左上角裁剪|4,右下角裁剪|5,固定尺寸缩放|6', '1', '0', 'center', '', '', '', '', '2417', '', '', '', 'smallint', '6', '');
INSERT INTO `cd_field` VALUES ('2401', '670', '创建时间', 'create_time', '12', '1', '1', '0', '', '1', '1', 'center', '', '', '', '', '2402', '', '', '', 'int', '11', '');
INSERT INTO `cd_field` VALUES ('2400', '670', '异常信息', 'errmsg', '1', '0', '0', '0', '', '1', '1', 'center', '', '', '', '', '2400', '', '', '', 'varchar', '250', '');
INSERT INTO `cd_field` VALUES ('2402', '670', '类型', 'type', '3', '1', '1', '0', '登录日志|1|primary,操作日志|2|success,异常日志|3|danger', '1', '1', 'center', '', '', '', '', '2401', '', '', '', 'smallint', '6', '');
INSERT INTO `cd_field` VALUES ('2399', '670', '请求内容', 'content', '6', '0', '0', '0', '', '1', '1', 'center', '', '', '', '', '2399', '', '', '', 'text', '0', '');
INSERT INTO `cd_field` VALUES ('2397', '670', 'ip', 'ip', '1', '1', '1', '0', '', '1', '1', 'center', '', '', '', '', '2397', '', '', '', 'varchar', '250', '');
INSERT INTO `cd_field` VALUES ('2398', '670', 'useragent', 'useragent', '1', '0', '0', '0', '', '1', '1', 'center', '', '', '', '', '2398', '', '', '', 'varchar', '250', '');
INSERT INTO `cd_field` VALUES ('2396', '670', '请求url', 'url', '1', '1', '1', '0', '', '1', '1', 'center', '', '', '', '', '2396', '', '', '', 'varchar', '250', '');
INSERT INTO `cd_field` VALUES ('2394', '670', '应用名称', 'application_name', '2', '1', '1', '0', '', '1', '1', 'center', '', '', '', '', '2394', 'select app_dir,app_dir from cd_application', '', '', 'varchar', '50', '');
INSERT INTO `cd_field` VALUES ('2395', '670', '操作用户', 'username', '1', '1', '1', '0', '', '1', '1', 'center', '', '', '', '', '2395', '', '', '', 'varchar', '250', '');
INSERT INTO `cd_field` VALUES ('2387', '19', '所属父类', 'pid', '2', '0', '0', '0', '', '1', '1', 'center', '', '', '', '', '2', 'select role_id,name,pid from cd_role', '', '', 'smallint', '6', '');
INSERT INTO `cd_field` VALUES ('2393', '670', '编号', 'id', '1', '1', '0', null, null, '0', '1', 'center', null, null, null, null, '1', null, null, null, 'int', '11', null);
INSERT INTO `cd_field` VALUES ('2686', '41', '系统配置', 'pz', '32', null, null, null, '', '1', null, 'center', '', '', '', '', '2686', '', '基本设置', '', null, null, null);

-- ----------------------------
-- Table structure for `cd_file`
-- ----------------------------
DROP TABLE IF EXISTS `cd_file`;
CREATE TABLE `cd_file` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `filepath` varchar(255) DEFAULT NULL COMMENT '图片路径',
  `hash` varchar(32) DEFAULT NULL COMMENT '文件hash值',
  `create_time` int(10) DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=99 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cd_file
-- ----------------------------

-- ----------------------------
-- Table structure for `cd_log`
-- ----------------------------
DROP TABLE IF EXISTS `cd_log`;
CREATE TABLE `cd_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `application_name` varchar(50) DEFAULT NULL COMMENT '应用名称',
  `username` varchar(250) DEFAULT NULL COMMENT '操作用户',
  `url` varchar(250) DEFAULT NULL COMMENT '请求url',
  `ip` varchar(250) DEFAULT NULL COMMENT 'ip',
  `useragent` varchar(250) DEFAULT NULL COMMENT 'useragent',
  `content` text COMMENT '请求内容',
  `errmsg` varchar(250) DEFAULT NULL COMMENT '异常信息',
  `create_time` int(11) DEFAULT NULL COMMENT '创建时间',
  `type` smallint(6) DEFAULT NULL COMMENT '类型',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8209 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cd_log
-- ----------------------------

-- ----------------------------
-- Table structure for `cd_menu`
-- ----------------------------
DROP TABLE IF EXISTS `cd_menu`;
CREATE TABLE `cd_menu` (
  `menu_id` int(11) NOT NULL AUTO_INCREMENT,
  `pid` mediumint(9) DEFAULT '0' COMMENT '父级id',
  `controller_name` varchar(32) DEFAULT NULL COMMENT '模块名称',
  `title` varchar(64) DEFAULT NULL COMMENT '模块标题',
  `pk_id` varchar(36) DEFAULT NULL COMMENT '主键名',
  `table_name` varchar(32) DEFAULT NULL COMMENT '模块数据库表',
  `is_create` tinyint(4) DEFAULT NULL COMMENT '是否允许生成模块',
  `status` tinyint(4) DEFAULT NULL COMMENT '0隐藏 10显示',
  `sortid` mediumint(9) DEFAULT '0' COMMENT '排序号',
  `table_status` tinyint(4) DEFAULT NULL COMMENT '是否生成数据库表',
  `is_url` tinyint(4) DEFAULT NULL COMMENT '是否只是url链接',
  `url` varchar(64) DEFAULT NULL,
  `menu_icon` varchar(32) DEFAULT NULL COMMENT 'icon字体图标',
  `tab_menu` varchar(250) DEFAULT NULL COMMENT 'tab选项卡菜单配置',
  `app_id` int(11) DEFAULT NULL COMMENT '所属模块',
  `is_submit` tinyint(4) DEFAULT NULL COMMENT '是否允许投稿',
  `upload_config_id` smallint(5) DEFAULT NULL COMMENT '上传配置id',
  PRIMARY KEY (`menu_id`),
  KEY `controller_name` (`controller_name`) USING BTREE,
  KEY `module_id` (`app_id`)
) ENGINE=MyISAM AUTO_INCREMENT=721 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cd_menu
-- ----------------------------
INSERT INTO `cd_menu` VALUES ('12', '0', 'System', '系统管理', '', '', '0', '1', '1000', '0', '0', '', 'fa fa-gears', '', '1', '0', '0');
INSERT INTO `cd_menu` VALUES ('17', '12', '', '后台首页', '', '', '0', '1', '1', '0', '1', 'admin/Index/main', 'fa fa-home', '', '1', '0', '0');
INSERT INTO `cd_menu` VALUES ('18', '12', 'User', '用户管理', 'user_id', 'user', '1', '1', '4', '1', '0', '', 'fa fa-user-secret', '', '1', '0', '0');
INSERT INTO `cd_menu` VALUES ('19', '12', 'Role', '角色管理', 'role_id', 'role', '1', '1', '5', '1', '0', '', 'fa fa-user', '', '1', '0', '0');
INSERT INTO `cd_menu` VALUES ('21', '12', '', '菜单管理', '', '', '0', '1', '3', '0', '1', 'admin/Sys.Menu/index', '', '', '1', '0', '0');
INSERT INTO `cd_menu` VALUES ('41', '12', 'Config', '系统配置', '', '', '1', '1', '525', '0', '0', 'admin/Base/config', 'glyphicon glyphicon-cog', '基本设置|上传配置', '1', '0', '0');
INSERT INTO `cd_menu` VALUES ('647', '0', null, '系统管理', null, null, '0', '1', '0', '0', '0', null, 'fa fa-gears', null, null, null, null);
INSERT INTO `cd_menu` VALUES ('80', '12', 'Application', '应用管理', '', '', '0', '1', '2', '0', '0', 'admin/Sys.Application/index', '', '', '1', '0', '0');
INSERT INTO `cd_menu` VALUES ('670', '12', 'Log', '日志管理', 'id', 'log', '1', '1', '673', '1', null, '', '', '', '1', '0', '0');
INSERT INTO `cd_menu` VALUES ('673', '12', 'UploadConfig', '上传配置', 'id', 'upload_config', '1', '1', '692', '0', null, '', '', '', '1', '0', '0');
INSERT INTO `cd_menu` VALUES ('648', '0', null, '系统管理', null, null, '0', '1', '648', '0', '0', null, 'fa fa-gears', null, null, null, null);
INSERT INTO `cd_menu` VALUES ('605', '12', '', '修改密码', '', '', '0', '0', '670', '0', null, 'admin/Base/password', '', '', '1', '0', '0');
INSERT INTO `cd_menu` VALUES ('652', '651', null, '后台首页', null, null, '0', '1', '1', '0', '1', '//Index/main.html', 'fa fa-gears', null, null, null, null);
INSERT INTO `cd_menu` VALUES ('651', '0', null, '系统管理', null, null, '0', '1', '651', '0', '0', null, 'fa fa-gears', null, null, null, null);
INSERT INTO `cd_menu` VALUES ('650', '648', null, '修改密码', null, null, '0', '1', '2', '0', '1', '//Base/password', 'fa fa-gears', null, null, null, null);
INSERT INTO `cd_menu` VALUES ('649', '648', null, '后台首页', null, null, '0', '1', '1', '0', '1', '//Index/main.html', 'fa fa-gears', null, null, null, null);
INSERT INTO `cd_menu` VALUES ('653', '651', null, '修改密码', null, null, '0', '1', '2', '0', '1', '//Base/password', 'fa fa-gears', null, null, null, null);
INSERT INTO `cd_menu` VALUES ('656', '0', null, '系统管理', null, null, '0', '1', '656', '0', '0', null, 'fa fa-gears', null, null, null, null);
INSERT INTO `cd_menu` VALUES ('657', '656', null, '后台首页', null, null, '0', '1', '1', '0', '1', '//Index/main.html', 'fa fa-gears', null, null, null, null);
INSERT INTO `cd_menu` VALUES ('658', '656', null, '修改密码', null, null, '0', '1', '2', '0', '1', '//Base/password', 'fa fa-gears', null, null, null, null);

-- ----------------------------
-- Table structure for `cd_node`
-- ----------------------------
DROP TABLE IF EXISTS `cd_node`;
CREATE TABLE `cd_node` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(50) NOT NULL,
  `val` varchar(255) NOT NULL,
  `pid` int(4) NOT NULL,
  `sortid` int(4) NOT NULL,
  `status` tinyint(4) DEFAULT '10' COMMENT '状态',
  `is_menu` tinyint(4) DEFAULT NULL,
  `icon` varchar(60) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=270 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cd_node
-- ----------------------------

-- ----------------------------
-- Table structure for `cd_role`
-- ----------------------------
DROP TABLE IF EXISTS `cd_role`;
CREATE TABLE `cd_role` (
  `role_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `name` varchar(36) DEFAULT NULL COMMENT '分组名称',
  `status` tinyint(4) DEFAULT NULL COMMENT '状态 10正常 0禁用',
  `pid` smallint(6) DEFAULT NULL COMMENT '所属父类',
  `description` text COMMENT '描述',
  PRIMARY KEY (`role_id`)
) ENGINE=MyISAM AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cd_role
-- ----------------------------
INSERT INTO `cd_role` VALUES ('1', '超级管理员', '1', '0', '超级管理员');

-- ----------------------------
-- Table structure for `cd_upload_config`
-- ----------------------------
DROP TABLE IF EXISTS `cd_upload_config`;
CREATE TABLE `cd_upload_config` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(250) DEFAULT NULL COMMENT '配置名称',
  `upload_replace` tinyint(4) DEFAULT NULL COMMENT '覆盖同名文件',
  `thumb_status` tinyint(4) DEFAULT NULL COMMENT '缩图开关',
  `thumb_width` varchar(250) DEFAULT NULL COMMENT '缩放宽度',
  `thumb_height` varchar(250) DEFAULT NULL COMMENT '缩放高度',
  `thumb_type` smallint(6) DEFAULT NULL COMMENT '缩图方式',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cd_upload_config
-- ----------------------------
INSERT INTO `cd_upload_config` VALUES ('1', '默认配置', '0', '1', '600', '400', '3');

-- ----------------------------
-- Table structure for `cd_user`
-- ----------------------------
DROP TABLE IF EXISTS `cd_user`;
CREATE TABLE `cd_user` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `name` varchar(250) DEFAULT NULL COMMENT '真实姓名',
  `user` varchar(250) DEFAULT NULL COMMENT '用户名',
  `pwd` varchar(250) DEFAULT NULL COMMENT '密码',
  `role_id` varchar(250) DEFAULT NULL COMMENT '所属分组',
  `note` varchar(250) DEFAULT NULL COMMENT '备注',
  `status` tinyint(4) DEFAULT NULL COMMENT '状态',
  `create_time` int(11) DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`user_id`)
) ENGINE=MyISAM AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cd_user
-- ----------------------------
INSERT INTO `cd_user` VALUES ('1', '寒塘冷月', 'admin', '6a5888d05ceb8033ebf0a3dfbf2b416e', '1', '超级管理员', '1', '1548558919');
