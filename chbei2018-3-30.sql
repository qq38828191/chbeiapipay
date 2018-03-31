/*
Navicat MySQL Data Transfer

Source Server         : 1
Source Server Version : 50711
Source Host           : localhost:3306
Source Database       : chbei

Target Server Type    : MYSQL
Target Server Version : 50711
File Encoding         : 65001

Date: 2018-03-30 18:05:26
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `chbei_agent`
-- ----------------------------
DROP TABLE IF EXISTS `chbei_agent`;
CREATE TABLE `chbei_agent` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `agent_employeeid` int(50) DEFAULT NULL COMMENT '代理编号',
  `agent_phone` int(11) DEFAULT NULL COMMENT '代理电话',
  `agent_name` varchar(100) DEFAULT '' COMMENT '代理名称',
  `agent_powerid` int(6) DEFAULT NULL COMMENT '代理权限',
  `agent_account` varchar(50) DEFAULT '' COMMENT '代理账号',
  `agent_password` varchar(50) DEFAULT '' COMMENT '代理密码',
  `agent_address` varchar(255) DEFAULT '' COMMENT '联系地址',
  `agent_creationtime` datetime DEFAULT NULL COMMENT '创建时间',
  `agent_email` varchar(50) DEFAULT NULL COMMENT '代理邮箱',
  `agent_islock` int(2) DEFAULT '0' COMMENT '是否锁定(1、锁定，0、正常)',
  `agent_commission` decimal(11,3) DEFAULT NULL COMMENT '代理提成',
  `agent_haveroyalty` decimal(11,3) DEFAULT NULL COMMENT '已经提成',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='代理表';

-- ----------------------------
-- Records of chbei_agent
-- ----------------------------
INSERT INTO `chbei_agent` VALUES ('1', '1', '1', '1', '1', '1', '', '1', '2018-02-27 10:54:19', '1', '1', '1.000', '1.000');
INSERT INTO `chbei_agent` VALUES ('2', '2222', null, '2', '2', '2', '2', '2', '2018-03-21 10:54:51', '1', '1', '1.000', '1.000');

-- ----------------------------
-- Table structure for `chbei_agentpower`
-- ----------------------------
DROP TABLE IF EXISTS `chbei_agentpower`;
CREATE TABLE `chbei_agentpower` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `agentpower_id` int(11) DEFAULT NULL COMMENT '代理权限ID',
  `agentpower_switch` int(11) DEFAULT '0' COMMENT '代理开关',
  `agentpower_logintime` varchar(100) DEFAULT '' COMMENT '代理限制时间',
  `agentpower_loginip` varchar(100) DEFAULT '' COMMENT '代理登陆IP限制',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='代理权限表';

-- ----------------------------
-- Records of chbei_agentpower
-- ----------------------------

-- ----------------------------
-- Table structure for `chbei_article`
-- ----------------------------
DROP TABLE IF EXISTS `chbei_article`;
CREATE TABLE `chbei_article` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `article_id` int(11) NOT NULL COMMENT '文章ID',
  `article_text` longtext COMMENT '文章内容',
  `article_cretime` datetime DEFAULT NULL COMMENT '创建时间',
  `article_modtime` date DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='文章表';

-- ----------------------------
-- Records of chbei_article
-- ----------------------------

-- ----------------------------
-- Table structure for `chbei_asynchronous`
-- ----------------------------
DROP TABLE IF EXISTS `chbei_asynchronous`;
CREATE TABLE `chbei_asynchronous` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `orderid` varchar(50) DEFAULT '' COMMENT '订单号',
  `url` text COMMENT '异步通知地址',
  `relust` longtext COMMENT '返回内容',
  `number` int(11) DEFAULT NULL COMMENT '通知次数',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='异步通知记录表';

-- ----------------------------
-- Records of chbei_asynchronous
-- ----------------------------

-- ----------------------------
-- Table structure for `chbei_finance`
-- ----------------------------
DROP TABLE IF EXISTS `chbei_finance`;
CREATE TABLE `chbei_finance` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `finance_id` int(11) NOT NULL COMMENT '财务ID',
  `finance_name` varchar(100) DEFAULT '' COMMENT '财务明细名称',
  `finance_amount` varchar(255) DEFAULT '' COMMENT '财务明细金额',
  `finance_transferfunds` varchar(255) DEFAULT '' COMMENT '财务明细入账金额',
  `finance_transferamount` varchar(255) DEFAULT '' COMMENT '财务明细出账金额',
  `finance_exchange` varchar(100) DEFAULT '' COMMENT '财务明细兑换金额',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='财务表';

-- ----------------------------
-- Records of chbei_finance
-- ----------------------------

-- ----------------------------
-- Table structure for `chbei_issued`
-- ----------------------------
DROP TABLE IF EXISTS `chbei_issued`;
CREATE TABLE `chbei_issued` (
  `issued_id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`issued_id`)
) ENGINE=InnoDB AUTO_INCREMENT=56 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of chbei_issued
-- ----------------------------
INSERT INTO `chbei_issued` VALUES ('1');
INSERT INTO `chbei_issued` VALUES ('55');

-- ----------------------------
-- Table structure for `chbei_journal`
-- ----------------------------
DROP TABLE IF EXISTS `chbei_journal`;
CREATE TABLE `chbei_journal` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `log_id` int(11) NOT NULL COMMENT '日志id',
  `log_content` varchar(255) DEFAULT '' COMMENT '日志内容',
  `log_time` datetime DEFAULT NULL COMMENT '日志时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='日志表';

-- ----------------------------
-- Records of chbei_journal
-- ----------------------------

-- ----------------------------
-- Table structure for `chbei_manage`
-- ----------------------------
DROP TABLE IF EXISTS `chbei_manage`;
CREATE TABLE `chbei_manage` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `man_employeeid` int(50) DEFAULT NULL COMMENT '管理编号',
  `man_phone` int(11) DEFAULT NULL COMMENT '管理电话',
  `man_name` varchar(100) DEFAULT '' COMMENT '管理名称',
  `man_powerid` int(6) DEFAULT NULL COMMENT '管理权限',
  `man_account` varchar(50) DEFAULT '' COMMENT '管理说明',
  `man_password` varchar(50) DEFAULT '' COMMENT '管理密码',
  `man_address` varchar(255) DEFAULT '' COMMENT '联系地址',
  `man_creationtime` datetime DEFAULT NULL COMMENT '创建时间',
  `man_email` varchar(50) DEFAULT NULL COMMENT '管理邮箱',
  `man_islock` int(2) DEFAULT '0' COMMENT '是否锁定(1、锁定，0、正常)',
  `man_commission` decimal(11,3) DEFAULT NULL COMMENT '管理提成',
  `man_haveroyalty` decimal(11,3) DEFAULT NULL COMMENT '已经提成',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='管理表';

-- ----------------------------
-- Records of chbei_manage
-- ----------------------------
INSERT INTO `chbei_manage` VALUES ('1', '1', '1', 'admin', '1', '1', 'admin', '1', '2018-03-23 17:16:18', '111', '0', '1.000', '1.000');

-- ----------------------------
-- Table structure for `chbei_manpower`
-- ----------------------------
DROP TABLE IF EXISTS `chbei_manpower`;
CREATE TABLE `chbei_manpower` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `manpower_id` int(11) NOT NULL COMMENT '管理员ID',
  `manpower_switch` int(11) DEFAULT '0' COMMENT '管理员开关',
  `manpower_loginip` varchar(50) DEFAULT '' COMMENT '管理员登录IP',
  `manpower_saferules` varchar(100) DEFAULT '' COMMENT '管理员安全规则',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='管理权限表';

-- ----------------------------
-- Records of chbei_manpower
-- ----------------------------

-- ----------------------------
-- Table structure for `chbei_menu`
-- ----------------------------
DROP TABLE IF EXISTS `chbei_menu`;
CREATE TABLE `chbei_menu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `menu_id` int(11) DEFAULT NULL COMMENT '菜单ID',
  `menu_node` int(50) DEFAULT NULL COMMENT '节点是否父子',
  `menu_ownership` int(50) DEFAULT NULL COMMENT '节点归属',
  `menu_url` varchar(200) DEFAULT '' COMMENT '地址',
  `menu_name` varchar(50) DEFAULT '' COMMENT '名称',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='菜单表';

-- ----------------------------
-- Records of chbei_menu
-- ----------------------------

-- ----------------------------
-- Table structure for `chbei_menupower`
-- ----------------------------
DROP TABLE IF EXISTS `chbei_menupower`;
CREATE TABLE `chbei_menupower` (
  `menupower_id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`menupower_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='菜单权限表';

-- ----------------------------
-- Records of chbei_menupower
-- ----------------------------

-- ----------------------------
-- Table structure for `chbei_notification`
-- ----------------------------
DROP TABLE IF EXISTS `chbei_notification`;
CREATE TABLE `chbei_notification` (
  `notification_id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`notification_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of chbei_notification
-- ----------------------------

-- ----------------------------
-- Table structure for `chbei_order`
-- ----------------------------
DROP TABLE IF EXISTS `chbei_order`;
CREATE TABLE `chbei_order` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(100) DEFAULT NULL COMMENT '订单id',
  `merchantname` varchar(255) COLLATE utf8_bin DEFAULT '' COMMENT '商户名称',
  `merchantorders` varchar(100) COLLATE utf8_bin DEFAULT '' COMMENT '商户订单',
  `order_amount` varchar(11) COLLATE utf8_bin DEFAULT '' COMMENT '订单金额',
  `actualamount` varchar(11) COLLATE utf8_bin DEFAULT '' COMMENT '实际金额',
  `payresults` varchar(100) COLLATE utf8_bin DEFAULT '' COMMENT '支付结果',
  `feedback` int(11) DEFAULT NULL COMMENT '0是 1否 是否反馈',
  `starttime` varchar(50) COLLATE utf8_bin DEFAULT '' COMMENT '开始时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of chbei_order
-- ----------------------------
INSERT INTO `chbei_order` VALUES ('1', '1', '1', '1', '1', '1', '1', '1', '2018-01-25');
INSERT INTO `chbei_order` VALUES ('2', '2', '2', '2', '2', '2', '2', '2', '2018-03-26');
INSERT INTO `chbei_order` VALUES ('3', '21', '广州市海珠区', '广州市', '1', '1', '1', '1', '2018-03-21');
INSERT INTO `chbei_order` VALUES ('4', '23', 'haizhu', '1241', '1212', '1212', '1212', '12121', '2018-03-19');

-- ----------------------------
-- Table structure for `chbei_orders`
-- ----------------------------
DROP TABLE IF EXISTS `chbei_orders`;
CREATE TABLE `chbei_orders` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `orderid` varchar(50) NOT NULL DEFAULT '' COMMENT '订单编号',
  `p0_Cmd` varchar(20) NOT NULL DEFAULT '' COMMENT '业务类型',
  `r1_Code` int(2) NOT NULL COMMENT '支付结果',
  `p1_MerId` int(11) NOT NULL COMMENT '商户编号',
  `r2_TrxId` varchar(100) DEFAULT '' COMMENT '易宝支付交易流水号',
  `p2_Order` varchar(50) DEFAULT '' COMMENT '商户订单号',
  `p3_Amt` decimal(11,3) DEFAULT NULL COMMENT '支付金额',
  `p4_Cur` varchar(10) NOT NULL DEFAULT '' COMMENT '交易币种',
  `p5_Pid` varchar(20) DEFAULT '' COMMENT '商品名称',
  `p6_Pcat` varchar(20) DEFAULT '' COMMENT '商品种类',
  `p7_Pdesc` varchar(200) DEFAULT '' COMMENT '商品描述',
  `p8_Url` varchar(200) DEFAULT '' COMMENT '商户接收支付成功数据的地址',
  `p9_SAF` int(2) DEFAULT NULL COMMENT '送货地址',
  `pa_MP` varchar(200) DEFAULT '' COMMENT '商户扩展信息',
  `pd_FrpId` varchar(50) DEFAULT '' COMMENT '支付通道编码',
  `open_id` varchar(200) CHARACTER SET latin1 DEFAULT '' COMMENT '微信open_id',
  `ro_BankOrderId` varchar(50) DEFAULT '' COMMENT '银行订单号',
  `rp_PayDate` datetime DEFAULT NULL COMMENT '支付成功时间',
  `ru_Trxtime` datetime DEFAULT NULL COMMENT '交易结果通知时间',
  `pr_NeedResponse` int(1) DEFAULT NULL COMMENT '应答机制',
  `CreateTime` datetime DEFAULT NULL COMMENT '创建时间',
  `hmac` varchar(32) NOT NULL DEFAULT '' COMMENT '签名数据',
  `ip` varchar(50) DEFAULT '' COMMENT '用户ip地址',
  `success` int(2) DEFAULT NULL COMMENT '是否反馈',
  `remark` text COMMENT '反馈后得到的内容',
  `amount` decimal(11,3) DEFAULT NULL COMMENT '实际金额',
  `deducted` decimal(11,3) DEFAULT NULL,
  `islock` int(2) DEFAULT NULL COMMENT '是否锁定',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='订单表';

-- ----------------------------
-- Records of chbei_orders
-- ----------------------------

-- ----------------------------
-- Table structure for `chbei_passage`
-- ----------------------------
DROP TABLE IF EXISTS `chbei_passage`;
CREATE TABLE `chbei_passage` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `passage_id` int(11) NOT NULL COMMENT '主键',
  `passage_name` varchar(255) DEFAULT '' COMMENT '通道名称',
  `passage_abstract` varchar(255) DEFAULT '' COMMENT '通道描述',
  `passage_attribute` varchar(100) DEFAULT '' COMMENT '通道属性',
  `passage_service` varchar(100) DEFAULT '' COMMENT '通道服务',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='通道表';

-- ----------------------------
-- Records of chbei_passage
-- ----------------------------

-- ----------------------------
-- Table structure for `chbei_pay`
-- ----------------------------
DROP TABLE IF EXISTS `chbei_pay`;
CREATE TABLE `chbei_pay` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pay_id` int(11) DEFAULT NULL,
  `pay_account` varchar(255) DEFAULT '' COMMENT '支付说明',
  `pay_bank` varchar(200) DEFAULT '' COMMENT '支付银行',
  `pay_record` varchar(200) DEFAULT '' COMMENT '支付记录',
  `pay_money` varchar(200) DEFAULT '' COMMENT '支付金额',
  `pay_paytime` datetime DEFAULT NULL COMMENT '支付时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='支付表';

-- ----------------------------
-- Records of chbei_pay
-- ----------------------------

-- ----------------------------
-- Table structure for `chbei_picupload`
-- ----------------------------
DROP TABLE IF EXISTS `chbei_picupload`;
CREATE TABLE `chbei_picupload` (
  `picupload_id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`picupload_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of chbei_picupload
-- ----------------------------

-- ----------------------------
-- Table structure for `chbei_ratass`
-- ----------------------------
DROP TABLE IF EXISTS `chbei_ratass`;
CREATE TABLE `chbei_ratass` (
  `ratass_id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`ratass_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of chbei_ratass
-- ----------------------------

-- ----------------------------
-- Table structure for `chbei_recharge`
-- ----------------------------
DROP TABLE IF EXISTS `chbei_recharge`;
CREATE TABLE `chbei_recharge` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `recharge_id` int(11) NOT NULL,
  `recharge_name` varchar(255) DEFAULT '' COMMENT '充值名称',
  `recharge_class` varchar(100) DEFAULT '',
  `recharge_money` varchar(100) DEFAULT '' COMMENT '充值金额',
  `recharge_description` varchar(255) DEFAULT '' COMMENT '充值简介',
  `recharge_time` datetime DEFAULT NULL COMMENT '充值时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of chbei_recharge
-- ----------------------------

-- ----------------------------
-- Table structure for `chbei_users`
-- ----------------------------
DROP TABLE IF EXISTS `chbei_users`;
CREATE TABLE `chbei_users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_did` int(11) DEFAULT NULL COMMENT '用户ID',
  `user_name` varchar(100) DEFAULT '' COMMENT '名称（企业写企业名称，个人写个人姓名）',
  `user_pwds` varchar(100) DEFAULT '' COMMENT '用户密码',
  `user_email` varchar(50) DEFAULT '' COMMENT '用户邮箱',
  `user_phone` varchar(11) DEFAULT '' COMMENT '用户手机',
  `user_qq` varchar(50) DEFAULT '' COMMENT '用户QQ',
  `user_webName` varchar(100) DEFAULT '' COMMENT '用户网站名称',
  `user_websiteurl` varchar(100) DEFAULT '' COMMENT '用户网址',
  `user_herolist` int(2) DEFAULT NULL COMMENT '1商业、2制造业、3服务业、4农业牧渔也、5党政机关、6其它行业',
  `user_huge` int(2) DEFAULT NULL COMMENT '0企业、1个人',
  `user_contacts` varchar(100) NOT NULL COMMENT '联系人名称',
  `user_idcard` varchar(100) NOT NULL DEFAULT '' COMMENT '身份证，如果是企业的话是营业执照licence',
  `user_address` varchar(100) NOT NULL DEFAULT '' COMMENT '联系地址',
  `user_time` datetime NOT NULL COMMENT '注册时间',
  `user_islock` int(2) DEFAULT NULL COMMENT '是否锁定(0、正常，1、锁定)',
  `user_isnet` int(2) DEFAULT NULL COMMENT '是否开通网银（1、开通，0、未开通）',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of chbei_users
-- ----------------------------
INSERT INTO `chbei_users` VALUES ('1', '1', 'admin', '123456', '111', '11', '111', '111', '111', '1111', '111', '111', '1111', '1111', '2018-03-22 11:03:05', '1111', '1111');

-- ----------------------------
-- Table structure for `chbei_userspayment`
-- ----------------------------
DROP TABLE IF EXISTS `chbei_userspayment`;
CREATE TABLE `chbei_userspayment` (
  `id` int(50) NOT NULL,
  `user_id` int(50) DEFAULT NULL COMMENT '用户ID',
  `payment` varchar(100) NOT NULL DEFAULT '' COMMENT '支付密码',
  `key` varchar(100) NOT NULL DEFAULT '' COMMENT '密钥',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of chbei_userspayment
-- ----------------------------

-- ----------------------------
-- Table structure for `chbei_userspower`
-- ----------------------------
DROP TABLE IF EXISTS `chbei_userspower`;
CREATE TABLE `chbei_userspower` (
  `powerid` int(11) NOT NULL,
  PRIMARY KEY (`powerid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of chbei_userspower
-- ----------------------------

-- ----------------------------
-- Table structure for `chbei_user_gateway`
-- ----------------------------
DROP TABLE IF EXISTS `chbei_user_gateway`;
CREATE TABLE `chbei_user_gateway` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `users_gateway_id` int(11) DEFAULT NULL COMMENT '用户通道ID',
  `users_gateway_name` varchar(50) DEFAULT '' COMMENT '用户通道名称',
  `users_gateway_merid` longblob COMMENT '用户通道商户ID',
  `users_gateway_publickey` longtext COMMENT '用户通道KEY/公钥',
  `users_gateway_privatekey` longtext COMMENT '用户通道私钥',
  `users_gateway_function` int(11) DEFAULT NULL COMMENT '通道标识',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='用户通道表';

-- ----------------------------
-- Records of chbei_user_gateway
-- ----------------------------
INSERT INTO `chbei_user_gateway` VALUES ('1', '1', '123456', 0x00000102B36211C7, '1231231', '12313', '21321');

-- ----------------------------
-- Table structure for `chbei_websitesetting`
-- ----------------------------
DROP TABLE IF EXISTS `chbei_websitesetting`;
CREATE TABLE `chbei_websitesetting` (
  `id` int(11) NOT NULL,
  `website_name` varchar(255) DEFAULT '',
  `website_keyword` varchar(100) DEFAULT '',
  `website_description` varchar(255) DEFAULT '',
  `website_email` varchar(100) DEFAULT '',
  `website_qq` varchar(100) DEFAULT '',
  `website_copyright` varchar(100) DEFAULT '',
  `website_rpc` varchar(100) DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of chbei_websitesetting
-- ----------------------------

-- ----------------------------
-- Table structure for `test`
-- ----------------------------
DROP TABLE IF EXISTS `test`;
CREATE TABLE `test` (
  `id` int(11) NOT NULL,
  `test` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `username` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `pss` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of test
-- ----------------------------
INSERT INTO `test` VALUES ('1', '444444', '55555', '666666');
INSERT INTO `test` VALUES ('2', '444444', '55555', '666666');
