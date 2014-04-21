-- -------------------------------------------
SET AUTOCOMMIT=0;
START TRANSACTION;
SET SQL_QUOTE_SHOW_CREATE = 1;
SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
-- -------------------------------------------
-- -------------------------------------------
-- START BACKUP
-- -------------------------------------------
-- -------------------------------------------
-- TABLE `article`
-- -------------------------------------------
DROP TABLE IF EXISTS `article`;
CREATE TABLE IF NOT EXISTS `article` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `alias` varchar(255) NOT NULL COMMENT '链接别名',
  `category_id` int(10) unsigned NOT NULL COMMENT '分类id',
  `model_name` varchar(30) NOT NULL COMMENT '模型名称',
  `title` varchar(100) NOT NULL COMMENT '标题',
  `title_color` char(6) NOT NULL COMMENT '标题颜色',
  `subtitle` varchar(100) NOT NULL COMMENT '副标题',
  `summary` varchar(255) NOT NULL COMMENT '摘要',
  `picture` char(32) DEFAULT NULL COMMENT '图片hash',
  `source` varchar(100) NOT NULL COMMENT '来源',
  `author` varchar(30) NOT NULL COMMENT '作者',
  `tags` varchar(255) NOT NULL COMMENT '标签',
  `user_id` int(10) unsigned NOT NULL COMMENT '发布用户id',
  `update_user_id` int(10) unsigned NOT NULL COMMENT '更新用户id',
  `status` tinyint(4) NOT NULL COMMENT '状态',
  `template` varchar(30) NOT NULL COMMENT '视图模版',
  `power` int(11) NOT NULL COMMENT '权重',
  `position` tinyint(4) NOT NULL COMMENT '位置',
  `views` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '流量量',
  `created_at` int(10) unsigned NOT NULL COMMENT '创建时间',
  `updated_at` int(10) unsigned DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='文章';

-- -------------------------------------------
-- TABLE `article_profile`
-- -------------------------------------------
DROP TABLE IF EXISTS `article_profile`;
CREATE TABLE IF NOT EXISTS `article_profile` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `article_id` int(10) unsigned NOT NULL COMMENT '文章id',
  `content` text NOT NULL COMMENT '内容',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='文章副表';

-- -------------------------------------------
-- TABLE `category`
-- -------------------------------------------
DROP TABLE IF EXISTS `category`;
CREATE TABLE IF NOT EXISTS `category` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `root` int(10) unsigned DEFAULT NULL,
  `lft` int(10) unsigned NOT NULL,
  `rgt` int(10) unsigned NOT NULL,
  `level` smallint(5) unsigned NOT NULL,
  `name` varchar(255) NOT NULL,
  `model_name` varchar(30) DEFAULT NULL COMMENT '所属模型名称',
  `template` varchar(30) NOT NULL COMMENT '指定视图',
  `status` tinyint(1) NOT NULL COMMENT '是否显示到导航',
  PRIMARY KEY (`id`),
  KEY `root` (`root`),
  KEY `lft` (`lft`),
  KEY `rgt` (`rgt`),
  KEY `level` (`level`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='分类表';

-- -------------------------------------------
-- TABLE `link`
-- -------------------------------------------
DROP TABLE IF EXISTS `link`;
CREATE TABLE IF NOT EXISTS `link` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(30) NOT NULL COMMENT '标题',
  `url` varchar(255) NOT NULL COMMENT '链接',
  `target` tinyint(1) unsigned NOT NULL COMMENT '是否新窗口打开',
  `type` int(1) unsigned NOT NULL COMMENT '类型',
  `power` tinyint(3) unsigned NOT NULL COMMENT '排序',
  `visible` tinyint(1) NOT NULL COMMENT '是否显示',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='链接表';

-- -------------------------------------------
-- TABLE `provinces`
-- -------------------------------------------
DROP TABLE IF EXISTS `provinces`;
CREATE TABLE IF NOT EXISTS `provinces` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `root` int(10) unsigned DEFAULT NULL,
  `lft` int(10) unsigned NOT NULL,
  `rgt` int(10) unsigned NOT NULL,
  `level` smallint(5) unsigned NOT NULL,
  `name` varchar(255) NOT NULL,
  `status` tinyint(1) NOT NULL COMMENT '是否显示',
  PRIMARY KEY (`id`),
  KEY `root` (`root`),
  KEY `lft` (`lft`),
  KEY `rgt` (`rgt`),
  KEY `level` (`level`)
) ENGINE=InnoDB AUTO_INCREMENT=3724 DEFAULT CHARSET=utf8 COMMENT='省市区';

-- -------------------------------------------
-- TABLE `settings`
-- -------------------------------------------
DROP TABLE IF EXISTS `settings`;
CREATE TABLE IF NOT EXISTS `settings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category` varchar(64) NOT NULL DEFAULT 'system',
  `key` varchar(255) NOT NULL,
  `value` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `category_key` (`category`,`key`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- -------------------------------------------
-- TABLE `tbl_migration`
-- -------------------------------------------
DROP TABLE IF EXISTS `tbl_migration`;
CREATE TABLE IF NOT EXISTS `tbl_migration` (
  `version` varchar(255) NOT NULL,
  `apply_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- -------------------------------------------
-- TABLE `user`
-- -------------------------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE IF NOT EXISTS `user` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(30) NOT NULL,
  `password` char(32) NOT NULL,
  `email` varchar(255) NOT NULL,
  `login_at` int(10) unsigned NOT NULL DEFAULT '0',
  `created_at` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户表';

-- -------------------------------------------
-- TABLE DATA article
-- -------------------------------------------
INSERT INTO `article` (`id`,`alias`,`category_id`,`model_name`,`title`,`title_color`,`subtitle`,`summary`,`picture`,`source`,`author`,`tags`,`user_id`,`update_user_id`,`status`,`template`,`power`,`position`,`views`,`created_at`,`updated_at`) VALUES
('1','7b03150efce5249f3e007628b8a32db2','2','article','first test','','','first test content','','','','','1','1','1','article','0','0','0','1395386357','1395388769');



-- -------------------------------------------
-- TABLE DATA article_profile
-- -------------------------------------------
INSERT INTO `article_profile` (`id`,`article_id`,`content`) VALUES
('1','1','<p>first test content</p>');



-- -------------------------------------------
-- TABLE DATA category
-- -------------------------------------------
INSERT INTO `category` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`model_name`,`template`,`status`) VALUES
('1','1','1','4','1','root','','article','0');
INSERT INTO `category` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`model_name`,`template`,`status`) VALUES
('2','1','2','3','2','我的生活','','article','0');



-- -------------------------------------------
-- TABLE DATA link
-- -------------------------------------------
INSERT INTO `link` (`id`,`title`,`url`,`target`,`type`,`power`,`visible`) VALUES
('1','首页','/','1','1','0','1');



-- -------------------------------------------
-- TABLE DATA provinces
-- -------------------------------------------
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1','1','1','7446','1','中国','0');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2','1','2','43','2','北京','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3','1','3','42','3','北京市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('4','1','4','5','4','东城区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('5','1','6','7','4','西城区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('6','1','8','9','4','崇文区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('7','1','10','11','4','宣武区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('8','1','12','13','4','朝阳区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('9','1','14','15','4','丰台区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('10','1','16','17','4','石景山区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('11','1','18','19','4','海淀区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('12','1','20','21','4','门头沟区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('13','1','22','23','4','房山区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('14','1','24','25','4','通州区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('15','1','26','27','4','顺义区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('16','1','28','29','4','昌平区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('17','1','30','31','4','大兴区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('18','1','32','33','4','怀柔区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('19','1','34','35','4','平谷区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('20','1','36','37','4','密云县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('21','1','38','39','4','延庆县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('22','1','40','41','4','其它区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('23','1','44','87','2','天津','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('24','1','45','86','3','天津市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('25','1','46','47','4','和平区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('26','1','48','49','4','河东区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('27','1','50','51','4','河西区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('28','1','52','53','4','南开区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('29','1','54','55','4','河北区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('30','1','56','57','4','红桥区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('31','1','58','59','4','塘沽区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('32','1','60','61','4','汉沽区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('33','1','62','63','4','大港区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('34','1','64','65','4','东丽区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('35','1','66','67','4','西青区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('36','1','68','69','4','津南区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('37','1','70','71','4','北辰区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('38','1','72','73','4','武清区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('39','1','74','75','4','宝坻区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('40','1','76','77','4','滨海新区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('41','1','78','79','4','宁河县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('42','1','80','81','4','静海县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('43','1','82','83','4','蓟县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('44','1','84','85','4','其它区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('45','1','88','485','2','河北省','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('46','1','89','138','3','石家庄市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('47','1','90','91','4','长安区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('48','1','92','93','4','桥东区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('49','1','94','95','4','桥西区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('50','1','96','97','4','新华区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('51','1','98','99','4','井陉矿区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('52','1','100','101','4','裕华区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('53','1','102','103','4','井陉县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('54','1','104','105','4','正定县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('55','1','106','107','4','栾城县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('56','1','108','109','4','行唐县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('57','1','110','111','4','灵寿县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('58','1','112','113','4','高邑县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('59','1','114','115','4','深泽县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('60','1','116','117','4','赞皇县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('61','1','118','119','4','无极县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('62','1','120','121','4','平山县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('63','1','122','123','4','元氏县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('64','1','124','125','4','赵县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('65','1','126','127','4','辛集市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('66','1','128','129','4','藁城市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('67','1','130','131','4','晋州市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('68','1','132','133','4','新乐市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('69','1','134','135','4','鹿泉市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('70','1','136','137','4','其它区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('71','1','139','170','3','唐山市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('72','1','140','141','4','路南区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('73','1','142','143','4','路北区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('74','1','144','145','4','古冶区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('75','1','146','147','4','开平区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('76','1','148','149','4','丰南区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('77','1','150','151','4','丰润区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('78','1','152','153','4','滦县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('79','1','154','155','4','滦南县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('80','1','156','157','4','乐亭县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('81','1','158','159','4','迁西县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('82','1','160','161','4','玉田县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('83','1','162','163','4','唐海县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('84','1','164','165','4','遵化市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('85','1','166','167','4','迁安市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('86','1','168','169','4','其它区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('87','1','171','190','3','秦皇岛市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('88','1','172','173','4','海港区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('89','1','174','175','4','山海关区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('90','1','176','177','4','北戴河区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('91','1','178','179','4','青龙满族自治县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('92','1','180','181','4','昌黎县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('93','1','182','183','4','抚宁县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('94','1','184','185','4','卢龙县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('95','1','186','187','4','其它区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('96','1','188','189','4','经济技术开发区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('97','1','191','232','3','邯郸市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('98','1','192','193','4','邯山区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('99','1','194','195','4','丛台区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('100','1','196','197','4','复兴区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('101','1','198','199','4','峰峰矿区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('102','1','200','201','4','邯郸县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('103','1','202','203','4','临漳县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('104','1','204','205','4','成安县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('105','1','206','207','4','大名县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('106','1','208','209','4','涉县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('107','1','210','211','4','磁县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('108','1','212','213','4','肥乡县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('109','1','214','215','4','永年县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('110','1','216','217','4','邱县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('111','1','218','219','4','鸡泽县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('112','1','220','221','4','广平县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('113','1','222','223','4','馆陶县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('114','1','224','225','4','魏县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('115','1','226','227','4','曲周县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('116','1','228','229','4','武安市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('117','1','230','231','4','其它区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('118','1','233','274','3','邢台市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('119','1','234','235','4','桥东区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('120','1','236','237','4','桥西区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('121','1','238','239','4','邢台县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('122','1','240','241','4','临城县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('123','1','242','243','4','内丘县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('124','1','244','245','4','柏乡县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('125','1','246','247','4','隆尧县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('126','1','248','249','4','任县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('127','1','250','251','4','南和县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('128','1','252','253','4','宁晋县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('129','1','254','255','4','巨鹿县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('130','1','256','257','4','新河县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('131','1','258','259','4','广宗县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('132','1','260','261','4','平乡县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('133','1','262','263','4','威县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('134','1','264','265','4','清河县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('135','1','266','267','4','临西县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('136','1','268','269','4','南宫市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('137','1','270','271','4','沙河市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('138','1','272','273','4','其它区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('139','1','275','330','3','保定市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('140','1','276','277','4','新市区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('141','1','278','279','4','北市区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('142','1','280','281','4','南市区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('143','1','282','283','4','满城县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('144','1','284','285','4','清苑县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('145','1','286','287','4','涞水县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('146','1','288','289','4','阜平县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('147','1','290','291','4','徐水县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('148','1','292','293','4','定兴县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('149','1','294','295','4','唐县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('150','1','296','297','4','高阳县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('151','1','298','299','4','容城县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('152','1','300','301','4','涞源县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('153','1','302','303','4','望都县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('154','1','304','305','4','安新县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('155','1','306','307','4','易县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('156','1','308','309','4','曲阳县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('157','1','310','311','4','蠡县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('158','1','312','313','4','顺平县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('159','1','314','315','4','博野县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('160','1','316','317','4','雄县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('161','1','318','319','4','涿州市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('162','1','320','321','4','定州市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('163','1','322','323','4','安国市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('164','1','324','325','4','高碑店市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('165','1','326','327','4','高开区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('166','1','328','329','4','其它区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('167','1','331','368','3','张家口市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('168','1','332','333','4','桥东区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('169','1','334','335','4','桥西区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('170','1','336','337','4','宣化区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('171','1','338','339','4','下花园区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('172','1','340','341','4','宣化县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('173','1','342','343','4','张北县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('174','1','344','345','4','康保县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('175','1','346','347','4','沽源县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('176','1','348','349','4','尚义县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('177','1','350','351','4','蔚县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('178','1','352','353','4','阳原县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('179','1','354','355','4','怀安县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('180','1','356','357','4','万全县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('181','1','358','359','4','怀来县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('182','1','360','361','4','涿鹿县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('183','1','362','363','4','赤城县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('184','1','364','365','4','崇礼县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('185','1','366','367','4','其它区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('186','1','369','394','3','承德市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('187','1','370','371','4','双桥区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('188','1','372','373','4','双滦区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('189','1','374','375','4','鹰手营子矿区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('190','1','376','377','4','承德县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('191','1','378','379','4','兴隆县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('192','1','380','381','4','平泉县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('193','1','382','383','4','滦平县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('194','1','384','385','4','隆化县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('195','1','386','387','4','丰宁满族自治县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('196','1','388','389','4','宽城满族自治县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('197','1','390','391','4','围场满族蒙古族自治县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('198','1','392','393','4','其它区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('199','1','395','430','3','沧州市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('200','1','396','397','4','新华区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('201','1','398','399','4','运河区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('202','1','400','401','4','沧县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('203','1','402','403','4','青县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('204','1','404','405','4','东光县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('205','1','406','407','4','海兴县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('206','1','408','409','4','盐山县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('207','1','410','411','4','肃宁县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('208','1','412','413','4','南皮县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('209','1','414','415','4','吴桥县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('210','1','416','417','4','献县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('211','1','418','419','4','孟村回族自治县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('212','1','420','421','4','泊头市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('213','1','422','423','4','任丘市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('214','1','424','425','4','黄骅市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('215','1','426','427','4','河间市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('216','1','428','429','4','其它区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('217','1','431','458','3','廊坊市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('218','1','432','433','4','安次区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('219','1','434','435','4','广阳区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('220','1','436','437','4','固安县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('221','1','438','439','4','永清县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('222','1','440','441','4','香河县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('223','1','442','443','4','大城县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('224','1','444','445','4','文安县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('225','1','446','447','4','大厂回族自治县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('226','1','448','449','4','开发区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('227','1','450','451','4','燕郊经济技术开发区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('228','1','452','453','4','霸州市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('229','1','454','455','4','三河市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('230','1','456','457','4','其它区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('231','1','459','484','3','衡水市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('232','1','460','461','4','桃城区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('233','1','462','463','4','枣强县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('234','1','464','465','4','武邑县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('235','1','466','467','4','武强县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('236','1','468','469','4','饶阳县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('237','1','470','471','4','安平县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('238','1','472','473','4','故城县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('239','1','474','475','4','景县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('240','1','476','477','4','阜城县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('241','1','478','479','4','冀州市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('242','1','480','481','4','深州市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('243','1','482','483','4','其它区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('244','1','486','771','2','山西省','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('245','1','487','510','3','太原市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('246','1','488','489','4','小店区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('247','1','490','491','4','迎泽区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('248','1','492','493','4','杏花岭区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('249','1','494','495','4','尖草坪区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('250','1','496','497','4','万柏林区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('251','1','498','499','4','晋源区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('252','1','500','501','4','清徐县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('253','1','502','503','4','阳曲县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('254','1','504','505','4','娄烦县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('255','1','506','507','4','古交市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('256','1','508','509','4','其它区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('257','1','511','536','3','大同市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('258','1','512','513','4','城区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('259','1','514','515','4','矿区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('260','1','516','517','4','南郊区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('261','1','518','519','4','新荣区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('262','1','520','521','4','阳高县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('263','1','522','523','4','天镇县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('264','1','524','525','4','广灵县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('265','1','526','527','4','灵丘县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('266','1','528','529','4','浑源县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('267','1','530','531','4','左云县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('268','1','532','533','4','大同县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('269','1','534','535','4','其它区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('270','1','537','550','3','阳泉市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('271','1','538','539','4','城区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('272','1','540','541','4','矿区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('273','1','542','543','4','郊区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('274','1','544','545','4','平定县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('275','1','546','547','4','盂县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('276','1','548','549','4','其它区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('277','1','551','582','3','长治市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('278','1','552','553','4','长治县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('279','1','554','555','4','襄垣县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('280','1','556','557','4','屯留县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('281','1','558','559','4','平顺县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('282','1','560','561','4','黎城县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('283','1','562','563','4','壶关县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('284','1','564','565','4','长子县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('285','1','566','567','4','武乡县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('286','1','568','569','4','沁县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('287','1','570','571','4','沁源县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('288','1','572','573','4','潞城市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('289','1','574','575','4','城区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('290','1','576','577','4','郊区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('291','1','578','579','4','高新区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('292','1','580','581','4','其它区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('293','1','583','598','3','晋城市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('294','1','584','585','4','城区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('295','1','586','587','4','沁水县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('296','1','588','589','4','阳城县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('297','1','590','591','4','陵川县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('298','1','592','593','4','泽州县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('299','1','594','595','4','高平市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('300','1','596','597','4','其它区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('301','1','599','614','3','朔州市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('302','1','600','601','4','朔城区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('303','1','602','603','4','平鲁区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('304','1','604','605','4','山阴县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('305','1','606','607','4','应县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('306','1','608','609','4','右玉县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('307','1','610','611','4','怀仁县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('308','1','612','613','4','其它区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('309','1','615','640','3','晋中市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('310','1','616','617','4','榆次区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('311','1','618','619','4','榆社县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('312','1','620','621','4','左权县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('313','1','622','623','4','和顺县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('314','1','624','625','4','昔阳县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('315','1','626','627','4','寿阳县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('316','1','628','629','4','太谷县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('317','1','630','631','4','祁县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('318','1','632','633','4','平遥县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('319','1','634','635','4','灵石县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('320','1','636','637','4','介休市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('321','1','638','639','4','其它区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('322','1','641','670','3','运城市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('323','1','642','643','4','盐湖区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('324','1','644','645','4','临猗县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('325','1','646','647','4','万荣县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('326','1','648','649','4','闻喜县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('327','1','650','651','4','稷山县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('328','1','652','653','4','新绛县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('329','1','654','655','4','绛县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('330','1','656','657','4','垣曲县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('331','1','658','659','4','夏县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('332','1','660','661','4','平陆县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('333','1','662','663','4','芮城县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('334','1','664','665','4','永济市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('335','1','666','667','4','河津市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('336','1','668','669','4','其它区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('337','1','671','702','3','忻州市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('338','1','672','673','4','忻府区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('339','1','674','675','4','定襄县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('340','1','676','677','4','五台县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('341','1','678','679','4','代县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('342','1','680','681','4','繁峙县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('343','1','682','683','4','宁武县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('344','1','684','685','4','静乐县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('345','1','686','687','4','神池县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('346','1','688','689','4','五寨县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('347','1','690','691','4','岢岚县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('348','1','692','693','4','河曲县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('349','1','694','695','4','保德县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('350','1','696','697','4','偏关县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('351','1','698','699','4','原平市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('352','1','700','701','4','其它区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('353','1','703','740','3','临汾市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('354','1','704','705','4','尧都区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('355','1','706','707','4','曲沃县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('356','1','708','709','4','翼城县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('357','1','710','711','4','襄汾县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('358','1','712','713','4','洪洞县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('359','1','714','715','4','古县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('360','1','716','717','4','安泽县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('361','1','718','719','4','浮山县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('362','1','720','721','4','吉县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('363','1','722','723','4','乡宁县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('364','1','724','725','4','大宁县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('365','1','726','727','4','隰县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('366','1','728','729','4','永和县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('367','1','730','731','4','蒲县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('368','1','732','733','4','汾西县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('369','1','734','735','4','侯马市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('370','1','736','737','4','霍州市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('371','1','738','739','4','其它区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('372','1','741','770','3','吕梁市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('373','1','742','743','4','离石区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('374','1','744','745','4','文水县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('375','1','746','747','4','交城县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('376','1','748','749','4','兴县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('377','1','750','751','4','临县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('378','1','752','753','4','柳林县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('379','1','754','755','4','石楼县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('380','1','756','757','4','岚县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('381','1','758','759','4','方山县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('382','1','760','761','4','中阳县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('383','1','762','763','4','交口县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('384','1','764','765','4','孝义市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('385','1','766','767','4','汾阳市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('386','1','768','769','4','其它区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('387','1','772','1023','2','内蒙古自治区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('388','1','773','794','3','呼和浩特市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('389','1','774','775','4','新城区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('390','1','776','777','4','回民区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('391','1','778','779','4','玉泉区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('392','1','780','781','4','赛罕区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('393','1','782','783','4','土默特左旗','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('394','1','784','785','4','托克托县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('395','1','786','787','4','和林格尔县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('396','1','788','789','4','清水河县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('397','1','790','791','4','武川县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('398','1','792','793','4','其它区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('399','1','795','816','3','包头市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('400','1','796','797','4','东河区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('401','1','798','799','4','昆都仑区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('402','1','800','801','4','青山区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('403','1','802','803','4','石拐区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('404','1','804','805','4','白云矿区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('405','1','806','807','4','九原区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('406','1','808','809','4','土默特右旗','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('407','1','810','811','4','固阳县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('408','1','812','813','4','达尔罕茂明安联合旗','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('409','1','814','815','4','其它区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('410','1','817','826','3','乌海市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('411','1','818','819','4','海勃湾区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('412','1','820','821','4','海南区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('413','1','822','823','4','乌达区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('414','1','824','825','4','其它区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('415','1','827','854','3','赤峰市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('416','1','828','829','4','红山区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('417','1','830','831','4','元宝山区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('418','1','832','833','4','松山区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('419','1','834','835','4','阿鲁科尔沁旗','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('420','1','836','837','4','巴林左旗','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('421','1','838','839','4','巴林右旗','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('422','1','840','841','4','林西县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('423','1','842','843','4','克什克腾旗','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('424','1','844','845','4','翁牛特旗','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('425','1','846','847','4','喀喇沁旗','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('426','1','848','849','4','宁城县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('427','1','850','851','4','敖汉旗','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('428','1','852','853','4','其它区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('429','1','855','874','3','通辽市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('430','1','856','857','4','科尔沁区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('431','1','858','859','4','科尔沁左翼中旗','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('432','1','860','861','4','科尔沁左翼后旗','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('433','1','862','863','4','开鲁县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('434','1','864','865','4','库伦旗','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('435','1','866','867','4','奈曼旗','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('436','1','868','869','4','扎鲁特旗','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('437','1','870','871','4','霍林郭勒市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('438','1','872','873','4','其它区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('439','1','875','894','3','鄂尔多斯市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('440','1','876','877','4','东胜区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('441','1','878','879','4','达拉特旗','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('442','1','880','881','4','准格尔旗','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('443','1','882','883','4','鄂托克前旗','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('444','1','884','885','4','鄂托克旗','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('445','1','886','887','4','杭锦旗','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('446','1','888','889','4','乌审旗','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('447','1','890','891','4','伊金霍洛旗','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('448','1','892','893','4','其它区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('449','1','895','924','3','呼伦贝尔市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('450','1','896','897','4','海拉尔区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('451','1','898','899','4','阿荣旗','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('452','1','900','901','4','莫力达瓦达斡尔族自治旗','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('453','1','902','903','4','鄂伦春自治旗','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('454','1','904','905','4','鄂温克族自治旗','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('455','1','906','907','4','陈巴尔虎旗','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('456','1','908','909','4','新巴尔虎左旗','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('457','1','910','911','4','新巴尔虎右旗','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('458','1','912','913','4','满洲里市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('459','1','914','915','4','牙克石市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('460','1','916','917','4','扎兰屯市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('461','1','918','919','4','额尔古纳市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('462','1','920','921','4','根河市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('463','1','922','923','4','其它区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('464','1','925','942','3','巴彦淖尔市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('465','1','926','927','4','临河区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('466','1','928','929','4','五原县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('467','1','930','931','4','磴口县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('468','1','932','933','4','乌拉特前旗','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('469','1','934','935','4','乌拉特中旗','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('470','1','936','937','4','乌拉特后旗','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('471','1','938','939','4','杭锦后旗','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('472','1','940','941','4','其它区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('473','1','943','968','3','乌兰察布市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('474','1','944','945','4','集宁区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('475','1','946','947','4','卓资县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('476','1','948','949','4','化德县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('477','1','950','951','4','商都县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('478','1','952','953','4','兴和县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('479','1','954','955','4','凉城县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('480','1','956','957','4','察哈尔右翼前旗','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('481','1','958','959','4','察哈尔右翼中旗','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('482','1','960','961','4','察哈尔右翼后旗','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('483','1','962','963','4','四子王旗','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('484','1','964','965','4','丰镇市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('485','1','966','967','4','其它区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('486','1','969','984','3','兴安盟','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('487','1','970','971','4','乌兰浩特市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('488','1','972','973','4','阿尔山市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('489','1','974','975','4','科尔沁右翼前旗','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('490','1','976','977','4','科尔沁右翼中旗','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('491','1','978','979','4','扎赉特旗','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('492','1','980','981','4','突泉县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('493','1','982','983','4','其它区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('494','1','985','1012','3','锡林郭勒盟','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('495','1','986','987','4','二连浩特市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('496','1','988','989','4','锡林浩特市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('497','1','990','991','4','阿巴嘎旗','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('498','1','992','993','4','苏尼特左旗','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('499','1','994','995','4','苏尼特右旗','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('500','1','996','997','4','东乌珠穆沁旗','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('501','1','998','999','4','西乌珠穆沁旗','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('502','1','1000','1001','4','太仆寺旗','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('503','1','1002','1003','4','镶黄旗','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('504','1','1004','1005','4','正镶白旗','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('505','1','1006','1007','4','正蓝旗','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('506','1','1008','1009','4','多伦县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('507','1','1010','1011','4','其它区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('508','1','1013','1022','3','阿拉善盟','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('509','1','1014','1015','4','阿拉善左旗','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('510','1','1016','1017','4','阿拉善右旗','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('511','1','1018','1019','4','额济纳旗','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('512','1','1020','1021','4','其它区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('513','1','1024','1293','2','辽宁省','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('514','1','1025','1060','3','沈阳市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('515','1','1026','1027','4','和平区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('516','1','1028','1029','4','沈河区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('517','1','1030','1031','4','大东区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('518','1','1032','1033','4','皇姑区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('519','1','1034','1035','4','铁西区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('520','1','1036','1037','4','苏家屯区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('521','1','1038','1039','4','东陵区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('522','1','1040','1041','4','新城子区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('523','1','1042','1043','4','于洪区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('524','1','1044','1045','4','辽中县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('525','1','1046','1047','4','康平县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('526','1','1048','1049','4','法库县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('527','1','1050','1051','4','新民市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('528','1','1052','1053','4','浑南新区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('529','1','1054','1055','4','张士开发区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('530','1','1056','1057','4','沈北新区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('531','1','1058','1059','4','其它区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('532','1','1061','1088','3','大连市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('533','1','1062','1063','4','中山区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('534','1','1064','1065','4','西岗区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('535','1','1066','1067','4','沙河口区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('536','1','1068','1069','4','甘井子区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('537','1','1070','1071','4','旅顺口区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('538','1','1072','1073','4','金州区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('539','1','1074','1075','4','长海县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('540','1','1076','1077','4','开发区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('541','1','1078','1079','4','瓦房店市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('542','1','1080','1081','4','普兰店市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('543','1','1082','1083','4','庄河市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('544','1','1084','1085','4','岭前区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('545','1','1086','1087','4','其它区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('546','1','1089','1108','3','鞍山市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('547','1','1090','1091','4','铁东区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('548','1','1092','1093','4','铁西区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('549','1','1094','1095','4','立山区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('550','1','1096','1097','4','千山区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('551','1','1098','1099','4','台安县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('552','1','1100','1101','4','岫岩满族自治县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('553','1','1102','1103','4','高新区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('554','1','1104','1105','4','海城市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('555','1','1106','1107','4','其它区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('556','1','1109','1126','3','抚顺市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('557','1','1110','1111','4','新抚区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('558','1','1112','1113','4','东洲区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('559','1','1114','1115','4','望花区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('560','1','1116','1117','4','顺城区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('561','1','1118','1119','4','抚顺县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('562','1','1120','1121','4','新宾满族自治县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('563','1','1122','1123','4','清原满族自治县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('564','1','1124','1125','4','其它区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('565','1','1127','1142','3','本溪市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('566','1','1128','1129','4','平山区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('567','1','1130','1131','4','溪湖区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('568','1','1132','1133','4','明山区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('569','1','1134','1135','4','南芬区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('570','1','1136','1137','4','本溪满族自治县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('571','1','1138','1139','4','桓仁满族自治县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('572','1','1140','1141','4','其它区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('573','1','1143','1158','3','丹东市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('574','1','1144','1145','4','元宝区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('575','1','1146','1147','4','振兴区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('576','1','1148','1149','4','振安区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('577','1','1150','1151','4','宽甸满族自治县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('578','1','1152','1153','4','东港市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('579','1','1154','1155','4','凤城市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('580','1','1156','1157','4','其它区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('581','1','1159','1176','3','锦州市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('582','1','1160','1161','4','古塔区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('583','1','1162','1163','4','凌河区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('584','1','1164','1165','4','太和区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('585','1','1166','1167','4','黑山县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('586','1','1168','1169','4','义县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('587','1','1170','1171','4','凌海市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('588','1','1172','1173','4','北镇市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('589','1','1174','1175','4','其它区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('590','1','1177','1192','3','营口市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('591','1','1178','1179','4','站前区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('592','1','1180','1181','4','西市区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('593','1','1182','1183','4','鲅鱼圈区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('594','1','1184','1185','4','老边区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('595','1','1186','1187','4','盖州市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('596','1','1188','1189','4','大石桥市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('597','1','1190','1191','4','其它区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('598','1','1193','1210','3','阜新市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('599','1','1194','1195','4','海州区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('600','1','1196','1197','4','新邱区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('601','1','1198','1199','4','太平区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('602','1','1200','1201','4','清河门区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('603','1','1202','1203','4','细河区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('604','1','1204','1205','4','阜新蒙古族自治县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('605','1','1206','1207','4','彰武县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('606','1','1208','1209','4','其它区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('607','1','1211','1228','3','辽阳市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('608','1','1212','1213','4','白塔区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('609','1','1214','1215','4','文圣区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('610','1','1216','1217','4','宏伟区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('611','1','1218','1219','4','弓长岭区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('612','1','1220','1221','4','太子河区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('613','1','1222','1223','4','辽阳县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('614','1','1224','1225','4','灯塔市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('615','1','1226','1227','4','其它区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('616','1','1229','1240','3','盘锦市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('617','1','1230','1231','4','双台子区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('618','1','1232','1233','4','兴隆台区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('619','1','1234','1235','4','大洼县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('620','1','1236','1237','4','盘山县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('621','1','1238','1239','4','其它区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('622','1','1241','1258','3','铁岭市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('623','1','1242','1243','4','银州区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('624','1','1244','1245','4','清河区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('625','1','1246','1247','4','铁岭县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('626','1','1248','1249','4','西丰县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('627','1','1250','1251','4','昌图县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('628','1','1252','1253','4','调兵山市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('629','1','1254','1255','4','开原市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('630','1','1256','1257','4','其它区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('631','1','1259','1276','3','朝阳市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('632','1','1260','1261','4','双塔区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('633','1','1262','1263','4','龙城区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('634','1','1264','1265','4','朝阳县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('635','1','1266','1267','4','建平县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('636','1','1268','1269','4','喀喇沁左翼蒙古族自治县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('637','1','1270','1271','4','北票市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('638','1','1272','1273','4','凌源市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('639','1','1274','1275','4','其它区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('640','1','1277','1292','3','葫芦岛市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('641','1','1278','1279','4','连山区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('642','1','1280','1281','4','龙港区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('643','1','1282','1283','4','南票区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('644','1','1284','1285','4','绥中县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('645','1','1286','1287','4','建昌县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('646','1','1288','1289','4','兴城市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('647','1','1290','1291','4','其它区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('648','1','1294','1459','2','吉林省','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('649','1','1295','1326','3','长春市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('650','1','1296','1297','4','南关区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('651','1','1298','1299','4','宽城区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('652','1','1300','1301','4','朝阳区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('653','1','1302','1303','4','二道区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('654','1','1304','1305','4','绿园区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('655','1','1306','1307','4','双阳区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('656','1','1308','1309','4','农安县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('657','1','1310','1311','4','九台市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('658','1','1312','1313','4','榆树市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('659','1','1314','1315','4','德惠市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('660','1','1316','1317','4','高新技术产业开发区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('661','1','1318','1319','4','汽车产业开发区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('662','1','1320','1321','4','经济技术开发区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('663','1','1322','1323','4','净月旅游开发区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('664','1','1324','1325','4','其它区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('665','1','1327','1348','3','吉林市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('666','1','1328','1329','4','昌邑区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('667','1','1330','1331','4','龙潭区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('668','1','1332','1333','4','船营区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('669','1','1334','1335','4','丰满区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('670','1','1336','1337','4','永吉县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('671','1','1338','1339','4','蛟河市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('672','1','1340','1341','4','桦甸市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('673','1','1342','1343','4','舒兰市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('674','1','1344','1345','4','磐石市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('675','1','1346','1347','4','其它区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('676','1','1349','1364','3','四平市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('677','1','1350','1351','4','铁西区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('678','1','1352','1353','4','铁东区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('679','1','1354','1355','4','梨树县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('680','1','1356','1357','4','伊通满族自治县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('681','1','1358','1359','4','公主岭市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('682','1','1360','1361','4','双辽市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('683','1','1362','1363','4','其它区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('684','1','1365','1376','3','辽源市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('685','1','1366','1367','4','龙山区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('686','1','1368','1369','4','西安区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('687','1','1370','1371','4','东丰县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('688','1','1372','1373','4','东辽县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('689','1','1374','1375','4','其它区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('690','1','1377','1394','3','通化市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('691','1','1378','1379','4','东昌区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('692','1','1380','1381','4','二道江区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('693','1','1382','1383','4','通化县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('694','1','1384','1385','4','辉南县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('695','1','1386','1387','4','柳河县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('696','1','1388','1389','4','梅河口市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('697','1','1390','1391','4','集安市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('698','1','1392','1393','4','其它区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('699','1','1395','1410','3','白山市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('700','1','1396','1397','4','八道江区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('701','1','1398','1399','4','抚松县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('702','1','1400','1401','4','靖宇县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('703','1','1402','1403','4','长白朝鲜族自治县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('704','1','1404','1405','4','江源市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('705','1','1406','1407','4','临江市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('706','1','1408','1409','4','其它区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('707','1','1411','1424','3','松原市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('708','1','1412','1413','4','宁江区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('709','1','1414','1415','4','前郭尔罗斯蒙古族自治县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('710','1','1416','1417','4','长岭县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('711','1','1418','1419','4','乾安县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('712','1','1420','1421','4','扶余县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('713','1','1422','1423','4','其它区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('714','1','1425','1438','3','白城市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('715','1','1426','1427','4','洮北区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('716','1','1428','1429','4','镇赉县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('717','1','1430','1431','4','通榆县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('718','1','1432','1433','4','洮南市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('719','1','1434','1435','4','大安市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('720','1','1436','1437','4','其它区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('721','1','1439','1458','3','延边朝鲜族自治州','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('722','1','1440','1441','4','延吉市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('723','1','1442','1443','4','图们市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('724','1','1444','1445','4','敦化市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('725','1','1446','1447','4','珲春市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('726','1','1448','1449','4','龙井市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('727','1','1450','1451','4','和龙市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('728','1','1452','1453','4','汪清县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('729','1','1454','1455','4','安图县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('730','1','1456','1457','4','其它区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('731','1','1460','1777','2','黑龙江省','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('732','1','1461','1504','3','哈尔滨市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('733','1','1462','1463','4','道里区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('734','1','1464','1465','4','南岗区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('735','1','1466','1467','4','道外区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('736','1','1468','1469','4','香坊区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('737','1','1470','1471','4','动力区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('738','1','1472','1473','4','平房区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('739','1','1474','1475','4','松北区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('740','1','1476','1477','4','呼兰区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('741','1','1478','1479','4','依兰县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('742','1','1480','1481','4','方正县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('743','1','1482','1483','4','宾县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('744','1','1484','1485','4','巴彦县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('745','1','1486','1487','4','木兰县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('746','1','1488','1489','4','通河县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('747','1','1490','1491','4','延寿县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('748','1','1492','1493','4','阿城市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('749','1','1494','1495','4','双城市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('750','1','1496','1497','4','尚志市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('751','1','1498','1499','4','五常市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('752','1','1500','1501','4','阿城市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('753','1','1502','1503','4','其它区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('754','1','1505','1540','3','齐齐哈尔市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('755','1','1506','1507','4','龙沙区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('756','1','1508','1509','4','建华区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('757','1','1510','1511','4','铁锋区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('758','1','1512','1513','4','昂昂溪区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('759','1','1514','1515','4','富拉尔基区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('760','1','1516','1517','4','碾子山区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('761','1','1518','1519','4','梅里斯达斡尔族区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('762','1','1520','1521','4','龙江县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('763','1','1522','1523','4','依安县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('764','1','1524','1525','4','泰来县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('765','1','1526','1527','4','甘南县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('766','1','1528','1529','4','富裕县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('767','1','1530','1531','4','克山县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('768','1','1532','1533','4','克东县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('769','1','1534','1535','4','拜泉县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('770','1','1536','1537','4','讷河市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('771','1','1538','1539','4','其它区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('772','1','1541','1562','3','鸡西市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('773','1','1542','1543','4','鸡冠区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('774','1','1544','1545','4','恒山区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('775','1','1546','1547','4','滴道区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('776','1','1548','1549','4','梨树区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('777','1','1550','1551','4','城子河区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('778','1','1552','1553','4','麻山区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('779','1','1554','1555','4','鸡东县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('780','1','1556','1557','4','虎林市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('781','1','1558','1559','4','密山市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('782','1','1560','1561','4','其它区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('783','1','1563','1582','3','鹤岗市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('784','1','1564','1565','4','向阳区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('785','1','1566','1567','4','工农区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('786','1','1568','1569','4','南山区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('787','1','1570','1571','4','兴安区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('788','1','1572','1573','4','东山区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('789','1','1574','1575','4','兴山区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('790','1','1576','1577','4','萝北县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('791','1','1578','1579','4','绥滨县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('792','1','1580','1581','4','其它区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('793','1','1583','1602','3','双鸭山市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('794','1','1584','1585','4','尖山区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('795','1','1586','1587','4','岭东区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('796','1','1588','1589','4','四方台区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('797','1','1590','1591','4','宝山区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('798','1','1592','1593','4','集贤县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('799','1','1594','1595','4','友谊县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('800','1','1596','1597','4','宝清县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('801','1','1598','1599','4','饶河县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('802','1','1600','1601','4','其它区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('803','1','1603','1624','3','大庆市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('804','1','1604','1605','4','萨尔图区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('805','1','1606','1607','4','龙凤区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('806','1','1608','1609','4','让胡路区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('807','1','1610','1611','4','红岗区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('808','1','1612','1613','4','大同区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('809','1','1614','1615','4','肇州县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('810','1','1616','1617','4','肇源县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('811','1','1618','1619','4','林甸县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('812','1','1620','1621','4','杜尔伯特蒙古族自治县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('813','1','1622','1623','4','其它区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('814','1','1625','1662','3','伊春市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('815','1','1626','1627','4','伊春区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('816','1','1628','1629','4','南岔区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('817','1','1630','1631','4','友好区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('818','1','1632','1633','4','西林区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('819','1','1634','1635','4','翠峦区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('820','1','1636','1637','4','新青区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('821','1','1638','1639','4','美溪区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('822','1','1640','1641','4','金山屯区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('823','1','1642','1643','4','五营区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('824','1','1644','1645','4','乌马河区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('825','1','1646','1647','4','汤旺河区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('826','1','1648','1649','4','带岭区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('827','1','1650','1651','4','乌伊岭区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('828','1','1652','1653','4','红星区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('829','1','1654','1655','4','上甘岭区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('830','1','1656','1657','4','嘉荫县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('831','1','1658','1659','4','铁力市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('832','1','1660','1661','4','其它区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('833','1','1663','1688','3','佳木斯市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('834','1','1664','1665','4','永红区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('835','1','1666','1667','4','向阳区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('836','1','1668','1669','4','前进区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('837','1','1670','1671','4','东风区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('838','1','1672','1673','4','郊区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('839','1','1674','1675','4','桦南县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('840','1','1676','1677','4','桦川县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('841','1','1678','1679','4','汤原县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('842','1','1680','1681','4','抚远县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('843','1','1682','1683','4','同江市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('844','1','1684','1685','4','富锦市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('845','1','1686','1687','4','其它区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('846','1','1689','1700','3','七台河市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('847','1','1690','1691','4','新兴区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('848','1','1692','1693','4','桃山区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('849','1','1694','1695','4','茄子河区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('850','1','1696','1697','4','勃利县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('851','1','1698','1699','4','其它区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('852','1','1701','1724','3','牡丹江市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('853','1','1702','1703','4','东安区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('854','1','1704','1705','4','阳明区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('855','1','1706','1707','4','爱民区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('856','1','1708','1709','4','西安区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('857','1','1710','1711','4','东宁县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('858','1','1712','1713','4','林口县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('859','1','1714','1715','4','绥芬河市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('860','1','1716','1717','4','海林市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('861','1','1718','1719','4','宁安市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('862','1','1720','1721','4','穆棱市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('863','1','1722','1723','4','其它区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('864','1','1725','1740','3','黑河市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('865','1','1726','1727','4','爱辉区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('866','1','1728','1729','4','嫩江县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('867','1','1730','1731','4','逊克县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('868','1','1732','1733','4','孙吴县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('869','1','1734','1735','4','北安市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('870','1','1736','1737','4','五大连池市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('871','1','1738','1739','4','其它区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('872','1','1741','1764','3','绥化市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('873','1','1742','1743','4','北林区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('874','1','1744','1745','4','望奎县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('875','1','1746','1747','4','兰西县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('876','1','1748','1749','4','青冈县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('877','1','1750','1751','4','庆安县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('878','1','1752','1753','4','明水县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('879','1','1754','1755','4','绥棱县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('880','1','1756','1757','4','安达市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('881','1','1758','1759','4','肇东市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('882','1','1760','1761','4','海伦市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('883','1','1762','1763','4','其它区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('884','1','1765','1776','3','大兴安岭地区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('885','1','1766','1767','4','呼玛县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('886','1','1768','1769','4','塔河县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('887','1','1770','1771','4','漠河县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('888','1','1772','1773','4','加格达奇区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('889','1','1774','1775','4','其它区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('890','1','1778','1823','2','上海','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('891','1','1779','1822','3','上海市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('892','1','1780','1781','4','黄浦区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('893','1','1782','1783','4','卢湾区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('894','1','1784','1785','4','徐汇区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('895','1','1786','1787','4','长宁区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('896','1','1788','1789','4','静安区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('897','1','1790','1791','4','普陀区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('898','1','1792','1793','4','闸北区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('899','1','1794','1795','4','虹口区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('900','1','1796','1797','4','杨浦区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('901','1','1798','1799','4','闵行区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('902','1','1800','1801','4','宝山区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('903','1','1802','1803','4','嘉定区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('904','1','1804','1805','4','浦东新区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('905','1','1806','1807','4','金山区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('906','1','1808','1809','4','松江区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('907','1','1810','1811','4','青浦区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('908','1','1812','1813','4','南汇区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('909','1','1814','1815','4','奉贤区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('910','1','1816','1817','4','川沙区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('911','1','1818','1819','4','崇明县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('912','1','1820','1821','4','其它区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('913','1','1824','2101','2','江苏省','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('914','1','1825','1854','3','南京市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('915','1','1826','1827','4','玄武区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('916','1','1828','1829','4','白下区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('917','1','1830','1831','4','秦淮区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('918','1','1832','1833','4','建邺区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('919','1','1834','1835','4','鼓楼区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('920','1','1836','1837','4','下关区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('921','1','1838','1839','4','浦口区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('922','1','1840','1841','4','栖霞区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('923','1','1842','1843','4','雨花台区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('924','1','1844','1845','4','江宁区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('925','1','1846','1847','4','六合区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('926','1','1848','1849','4','溧水县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('927','1','1850','1851','4','高淳县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('928','1','1852','1853','4','其它区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('929','1','1855','1876','3','无锡市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('930','1','1856','1857','4','崇安区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('931','1','1858','1859','4','南长区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('932','1','1860','1861','4','北塘区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('933','1','1862','1863','4','锡山区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('934','1','1864','1865','4','惠山区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('935','1','1866','1867','4','滨湖区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('936','1','1868','1869','4','江阴市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('937','1','1870','1871','4','宜兴市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('938','1','1872','1873','4','新区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('939','1','1874','1875','4','其它区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('940','1','1877','1902','3','徐州市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('941','1','1878','1879','4','鼓楼区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('942','1','1880','1881','4','云龙区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('943','1','1882','1883','4','九里区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('944','1','1884','1885','4','贾汪区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('945','1','1886','1887','4','泉山区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('946','1','1888','1889','4','丰县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('947','1','1890','1891','4','沛县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('948','1','1892','1893','4','铜山县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('949','1','1894','1895','4','睢宁县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('950','1','1896','1897','4','新沂市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('951','1','1898','1899','4','邳州市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('952','1','1900','1901','4','其它区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('953','1','1903','1920','3','常州市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('954','1','1904','1905','4','天宁区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('955','1','1906','1907','4','钟楼区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('956','1','1908','1909','4','戚墅堰区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('957','1','1910','1911','4','新北区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('958','1','1912','1913','4','武进区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('959','1','1914','1915','4','溧阳市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('960','1','1916','1917','4','金坛市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('961','1','1918','1919','4','其它区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('962','1','1921','1950','3','苏州市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('963','1','1922','1923','4','沧浪区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('964','1','1924','1925','4','平江区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('965','1','1926','1927','4','金阊区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('966','1','1928','1929','4','虎丘区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('967','1','1930','1931','4','吴中区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('968','1','1932','1933','4','相城区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('969','1','1934','1935','4','常熟市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('970','1','1936','1937','4','张家港市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('971','1','1938','1939','4','昆山市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('972','1','1940','1941','4','吴江市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('973','1','1942','1943','4','太仓市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('974','1','1944','1945','4','新区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('975','1','1946','1947','4','园区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('976','1','1948','1949','4','其它区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('977','1','1951','1974','3','南通市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('978','1','1952','1953','4','崇川区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('979','1','1954','1955','4','港闸区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('980','1','1956','1957','4','通州区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('981','1','1958','1959','4','海安县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('982','1','1960','1961','4','如东县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('983','1','1962','1963','4','启东市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('984','1','1964','1965','4','如皋市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('985','1','1966','1967','4','通州市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('986','1','1968','1969','4','海门市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('987','1','1970','1971','4','开发区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('988','1','1972','1973','4','其它区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('989','1','1975','1992','3','连云港市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('990','1','1976','1977','4','连云区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('991','1','1978','1979','4','新浦区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('992','1','1980','1981','4','海州区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('993','1','1982','1983','4','赣榆县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('994','1','1984','1985','4','东海县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('995','1','1986','1987','4','灌云县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('996','1','1988','1989','4','灌南县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('997','1','1990','1991','4','其它区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('998','1','1993','2012','3','淮安市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('999','1','1994','1995','4','清河区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1000','1','1996','1997','4','楚州区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1001','1','1998','1999','4','淮阴区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1002','1','2000','2001','4','清浦区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1003','1','2002','2003','4','涟水县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1004','1','2004','2005','4','洪泽县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1005','1','2006','2007','4','盱眙县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1006','1','2008','2009','4','金湖县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1007','1','2010','2011','4','其它区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1008','1','2013','2034','3','盐城市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1009','1','2014','2015','4','亭湖区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1010','1','2016','2017','4','盐都区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1011','1','2018','2019','4','响水县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1012','1','2020','2021','4','滨海县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1013','1','2022','2023','4','阜宁县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1014','1','2024','2025','4','射阳县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1015','1','2026','2027','4','建湖县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1016','1','2028','2029','4','东台市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1017','1','2030','2031','4','大丰市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1018','1','2032','2033','4','其它区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1019','1','2035','2054','3','扬州市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1020','1','2036','2037','4','广陵区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1021','1','2038','2039','4','邗江区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1022','1','2040','2041','4','维扬区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1023','1','2042','2043','4','宝应县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1024','1','2044','2045','4','仪征市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1025','1','2046','2047','4','高邮市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1026','1','2048','2049','4','江都市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1027','1','2050','2051','4','经济开发区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1028','1','2052','2053','4','其它区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1029','1','2055','2070','3','镇江市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1030','1','2056','2057','4','京口区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1031','1','2058','2059','4','润州区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1032','1','2060','2061','4','丹徒区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1033','1','2062','2063','4','丹阳市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1034','1','2064','2065','4','扬中市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1035','1','2066','2067','4','句容市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1036','1','2068','2069','4','其它区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1037','1','2071','2086','3','泰州市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1038','1','2072','2073','4','海陵区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1039','1','2074','2075','4','高港区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1040','1','2076','2077','4','兴化市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1041','1','2078','2079','4','靖江市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1042','1','2080','2081','4','泰兴市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1043','1','2082','2083','4','姜堰市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1044','1','2084','2085','4','其它区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1045','1','2087','2100','3','宿迁市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1046','1','2088','2089','4','宿城区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1047','1','2090','2091','4','宿豫区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1048','1','2092','2093','4','沭阳县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1049','1','2094','2095','4','泗阳县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1050','1','2096','2097','4','泗洪县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1051','1','2098','2099','4','其它区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1052','1','2102','2327','2','浙江省','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1053','1','2103','2132','3','杭州市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1054','1','2104','2105','4','上城区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1055','1','2106','2107','4','下城区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1056','1','2108','2109','4','江干区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1057','1','2110','2111','4','拱墅区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1058','1','2112','2113','4','西湖区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1059','1','2114','2115','4','滨江区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1060','1','2116','2117','4','萧山区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1061','1','2118','2119','4','余杭区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1062','1','2120','2121','4','桐庐县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1063','1','2122','2123','4','淳安县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1064','1','2124','2125','4','建德市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1065','1','2126','2127','4','富阳市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1066','1','2128','2129','4','临安市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1067','1','2130','2131','4','其它区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1068','1','2133','2158','3','宁波市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1069','1','2134','2135','4','海曙区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1070','1','2136','2137','4','江东区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1071','1','2138','2139','4','江北区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1072','1','2140','2141','4','北仑区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1073','1','2142','2143','4','镇海区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1074','1','2144','2145','4','鄞州区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1075','1','2146','2147','4','象山县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1076','1','2148','2149','4','宁海县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1077','1','2150','2151','4','余姚市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1078','1','2152','2153','4','慈溪市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1079','1','2154','2155','4','奉化市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1080','1','2156','2157','4','其它区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1081','1','2159','2184','3','温州市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1082','1','2160','2161','4','鹿城区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1083','1','2162','2163','4','龙湾区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1084','1','2164','2165','4','瓯海区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1085','1','2166','2167','4','洞头县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1086','1','2168','2169','4','永嘉县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1087','1','2170','2171','4','平阳县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1088','1','2172','2173','4','苍南县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1089','1','2174','2175','4','文成县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1090','1','2176','2177','4','泰顺县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1091','1','2178','2179','4','瑞安市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1092','1','2180','2181','4','乐清市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1093','1','2182','2183','4','其它区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1094','1','2185','2202','3','嘉兴市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1095','1','2186','2187','4','南湖区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1096','1','2188','2189','4','秀洲区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1097','1','2190','2191','4','嘉善县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1098','1','2192','2193','4','海盐县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1099','1','2194','2195','4','海宁市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1100','1','2196','2197','4','平湖市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1101','1','2198','2199','4','桐乡市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1102','1','2200','2201','4','其它区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1103','1','2203','2216','3','湖州市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1104','1','2204','2205','4','吴兴区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1105','1','2206','2207','4','南浔区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1106','1','2208','2209','4','德清县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1107','1','2210','2211','4','长兴县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1108','1','2212','2213','4','安吉县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1109','1','2214','2215','4','其它区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1110','1','2217','2232','3','绍兴市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1111','1','2218','2219','4','越城区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1112','1','2220','2221','4','绍兴县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1113','1','2222','2223','4','新昌县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1114','1','2224','2225','4','诸暨市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1115','1','2226','2227','4','上虞市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1116','1','2228','2229','4','嵊州市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1117','1','2230','2231','4','其它区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1118','1','2233','2254','3','金华市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1119','1','2234','2235','4','婺城区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1120','1','2236','2237','4','金东区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1121','1','2238','2239','4','武义县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1122','1','2240','2241','4','浦江县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1123','1','2242','2243','4','磐安县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1124','1','2244','2245','4','兰溪市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1125','1','2246','2247','4','义乌市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1126','1','2248','2249','4','东阳市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1127','1','2250','2251','4','永康市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1128','1','2252','2253','4','其它区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1129','1','2255','2270','3','衢州市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1130','1','2256','2257','4','柯城区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1131','1','2258','2259','4','衢江区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1132','1','2260','2261','4','常山县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1133','1','2262','2263','4','开化县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1134','1','2264','2265','4','龙游县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1135','1','2266','2267','4','江山市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1136','1','2268','2269','4','其它区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1137','1','2271','2282','3','舟山市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1138','1','2272','2273','4','定海区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1139','1','2274','2275','4','普陀区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1140','1','2276','2277','4','岱山县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1141','1','2278','2279','4','嵊泗县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1142','1','2280','2281','4','其它区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1143','1','2283','2304','3','台州市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1144','1','2284','2285','4','椒江区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1145','1','2286','2287','4','黄岩区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1146','1','2288','2289','4','路桥区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1147','1','2290','2291','4','玉环县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1148','1','2292','2293','4','三门县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1149','1','2294','2295','4','天台县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1150','1','2296','2297','4','仙居县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1151','1','2298','2299','4','温岭市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1152','1','2300','2301','4','临海市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1153','1','2302','2303','4','其它区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1154','1','2305','2326','3','丽水市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1155','1','2306','2307','4','莲都区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1156','1','2308','2309','4','青田县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1157','1','2310','2311','4','缙云县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1158','1','2312','2313','4','遂昌县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1159','1','2314','2315','4','松阳县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1160','1','2316','2317','4','云和县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1161','1','2318','2319','4','庆元县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1162','1','2320','2321','4','景宁畲族自治县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1163','1','2322','2323','4','龙泉市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1164','1','2324','2325','4','其它区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1165','1','2328','2609','2','安徽省','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1166','1','2329','2350','3','合肥市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1167','1','2330','2331','4','瑶海区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1168','1','2332','2333','4','庐阳区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1169','1','2334','2335','4','蜀山区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1170','1','2336','2337','4','包河区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1171','1','2338','2339','4','长丰县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1172','1','2340','2341','4','肥东县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1173','1','2342','2343','4','肥西县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1174','1','2344','2345','4','高新区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1175','1','2346','2347','4','中区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1176','1','2348','2349','4','其它区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1177','1','2351','2368','3','芜湖市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1178','1','2352','2353','4','镜湖区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1179','1','2354','2355','4','弋江区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1180','1','2356','2357','4','鸠江区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1181','1','2358','2359','4','三山区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1182','1','2360','2361','4','芜湖县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1183','1','2362','2363','4','繁昌县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1184','1','2364','2365','4','南陵县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1185','1','2366','2367','4','其它区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1186','1','2369','2386','3','蚌埠市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1187','1','2370','2371','4','龙子湖区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1188','1','2372','2373','4','蚌山区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1189','1','2374','2375','4','禹会区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1190','1','2376','2377','4','淮上区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1191','1','2378','2379','4','怀远县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1192','1','2380','2381','4','五河县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1193','1','2382','2383','4','固镇县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1194','1','2384','2385','4','其它区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1195','1','2387','2402','3','淮南市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1196','1','2388','2389','4','大通区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1197','1','2390','2391','4','田家庵区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1198','1','2392','2393','4','谢家集区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1199','1','2394','2395','4','八公山区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1200','1','2396','2397','4','潘集区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1201','1','2398','2399','4','凤台县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1202','1','2400','2401','4','其它区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1203','1','2403','2414','3','马鞍山市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1204','1','2404','2405','4','金家庄区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1205','1','2406','2407','4','花山区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1206','1','2408','2409','4','雨山区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1207','1','2410','2411','4','当涂县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1208','1','2412','2413','4','其它区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1209','1','2415','2426','3','淮北市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1210','1','2416','2417','4','杜集区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1211','1','2418','2419','4','相山区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1212','1','2420','2421','4','烈山区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1213','1','2422','2423','4','濉溪县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1214','1','2424','2425','4','其它区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1215','1','2427','2438','3','铜陵市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1216','1','2428','2429','4','铜官山区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1217','1','2430','2431','4','狮子山区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1218','1','2432','2433','4','郊区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1219','1','2434','2435','4','铜陵县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1220','1','2436','2437','4','其它区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1221','1','2439','2464','3','安庆市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1222','1','2440','2441','4','迎江区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1223','1','2442','2443','4','大观区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1224','1','2444','2445','4','宜秀区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1225','1','2446','2447','4','怀宁县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1226','1','2448','2449','4','枞阳县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1227','1','2450','2451','4','潜山县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1228','1','2452','2453','4','太湖县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1229','1','2454','2455','4','宿松县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1230','1','2456','2457','4','望江县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1231','1','2458','2459','4','岳西县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1232','1','2460','2461','4','桐城市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1233','1','2462','2463','4','其它区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1234','1','2465','2482','3','黄山市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1235','1','2466','2467','4','屯溪区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1236','1','2468','2469','4','黄山区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1237','1','2470','2471','4','徽州区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1238','1','2472','2473','4','歙县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1239','1','2474','2475','4','休宁县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1240','1','2476','2477','4','黟县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1241','1','2478','2479','4','祁门县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1242','1','2480','2481','4','其它区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1243','1','2483','2502','3','滁州市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1244','1','2484','2485','4','琅琊区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1245','1','2486','2487','4','南谯区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1246','1','2488','2489','4','来安县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1247','1','2490','2491','4','全椒县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1248','1','2492','2493','4','定远县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1249','1','2494','2495','4','凤阳县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1250','1','2496','2497','4','天长市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1251','1','2498','2499','4','明光市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1252','1','2500','2501','4','其它区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1253','1','2503','2522','3','阜阳市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1254','1','2504','2505','4','颍州区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1255','1','2506','2507','4','颍东区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1256','1','2508','2509','4','颍泉区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1257','1','2510','2511','4','临泉县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1258','1','2512','2513','4','太和县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1259','1','2514','2515','4','阜南县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1260','1','2516','2517','4','颍上县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1261','1','2518','2519','4','界首市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1262','1','2520','2521','4','其它区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1263','1','2523','2536','3','宿州市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1264','1','2524','2525','4','埇桥区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1265','1','2526','2527','4','砀山县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1266','1','2528','2529','4','萧县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1267','1','2530','2531','4','灵璧县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1268','1','2532','2533','4','泗县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1269','1','2534','2535','4','其它区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1270','1','2537','2548','3','巢湖市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1271','1','2538','2539','4','居巢区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1272','1','2540','2541','4','庐江县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1273','1','2542','2543','4','无为县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1274','1','2544','2545','4','含山县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1275','1','2546','2547','4','和县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1276','1','2549','2566','3','六安市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1277','1','2550','2551','4','金安区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1278','1','2552','2553','4','裕安区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1279','1','2554','2555','4','寿县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1280','1','2556','2557','4','霍邱县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1281','1','2558','2559','4','舒城县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1282','1','2560','2561','4','金寨县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1283','1','2562','2563','4','霍山县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1284','1','2564','2565','4','其它区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1285','1','2567','2578','3','亳州市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1286','1','2568','2569','4','谯城区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1287','1','2570','2571','4','涡阳县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1288','1','2572','2573','4','蒙城县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1289','1','2574','2575','4','利辛县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1290','1','2576','2577','4','其它区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1291','1','2579','2590','3','池州市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1292','1','2580','2581','4','贵池区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1293','1','2582','2583','4','东至县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1294','1','2584','2585','4','石台县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1295','1','2586','2587','4','青阳县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1296','1','2588','2589','4','其它区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1297','1','2591','2608','3','宣城市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1298','1','2592','2593','4','宣州区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1299','1','2594','2595','4','郎溪县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1300','1','2596','2597','4','广德县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1301','1','2598','2599','4','泾县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1302','1','2600','2601','4','绩溪县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1303','1','2602','2603','4','旌德县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1304','1','2604','2605','4','宁国市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1305','1','2606','2607','4','其它区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1306','1','2610','2817','2','福建省','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1307','1','2611','2640','3','福州市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1308','1','2612','2613','4','鼓楼区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1309','1','2614','2615','4','台江区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1310','1','2616','2617','4','仓山区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1311','1','2618','2619','4','马尾区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1312','1','2620','2621','4','晋安区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1313','1','2622','2623','4','闽侯县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1314','1','2624','2625','4','连江县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1315','1','2626','2627','4','罗源县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1316','1','2628','2629','4','闽清县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1317','1','2630','2631','4','永泰县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1318','1','2632','2633','4','平潭县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1319','1','2634','2635','4','福清市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1320','1','2636','2637','4','长乐市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1321','1','2638','2639','4','其它区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1322','1','2641','2656','3','厦门市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1323','1','2642','2643','4','思明区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1324','1','2644','2645','4','海沧区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1325','1','2646','2647','4','湖里区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1326','1','2648','2649','4','集美区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1327','1','2650','2651','4','同安区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1328','1','2652','2653','4','翔安区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1329','1','2654','2655','4','其它区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1330','1','2657','2670','3','莆田市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1331','1','2658','2659','4','城厢区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1332','1','2660','2661','4','涵江区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1333','1','2662','2663','4','荔城区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1334','1','2664','2665','4','秀屿区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1335','1','2666','2667','4','仙游县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1336','1','2668','2669','4','其它区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1337','1','2671','2698','3','三明市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1338','1','2672','2673','4','梅列区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1339','1','2674','2675','4','三元区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1340','1','2676','2677','4','明溪县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1341','1','2678','2679','4','清流县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1342','1','2680','2681','4','宁化县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1343','1','2682','2683','4','大田县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1344','1','2684','2685','4','尤溪县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1345','1','2686','2687','4','沙县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1346','1','2688','2689','4','将乐县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1347','1','2690','2691','4','泰宁县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1348','1','2692','2693','4','建宁县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1349','1','2694','2695','4','永安市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1350','1','2696','2697','4','其它区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1351','1','2699','2726','3','泉州市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1352','1','2700','2701','4','鲤城区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1353','1','2702','2703','4','丰泽区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1354','1','2704','2705','4','洛江区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1355','1','2706','2707','4','泉港区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1356','1','2708','2709','4','惠安县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1357','1','2710','2711','4','安溪县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1358','1','2712','2713','4','永春县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1359','1','2714','2715','4','德化县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1360','1','2716','2717','4','金门县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1361','1','2718','2719','4','石狮市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1362','1','2720','2721','4','晋江市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1363','1','2722','2723','4','南安市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1364','1','2724','2725','4','其它区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1365','1','2727','2752','3','漳州市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1366','1','2728','2729','4','芗城区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1367','1','2730','2731','4','龙文区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1368','1','2732','2733','4','云霄县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1369','1','2734','2735','4','漳浦县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1370','1','2736','2737','4','诏安县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1371','1','2738','2739','4','长泰县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1372','1','2740','2741','4','东山县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1373','1','2742','2743','4','南靖县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1374','1','2744','2745','4','平和县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1375','1','2746','2747','4','华安县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1376','1','2748','2749','4','龙海市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1377','1','2750','2751','4','其它区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1378','1','2753','2776','3','南平市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1379','1','2754','2755','4','延平区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1380','1','2756','2757','4','顺昌县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1381','1','2758','2759','4','浦城县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1382','1','2760','2761','4','光泽县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1383','1','2762','2763','4','松溪县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1384','1','2764','2765','4','政和县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1385','1','2766','2767','4','邵武市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1386','1','2768','2769','4','武夷山市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1387','1','2770','2771','4','建瓯市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1388','1','2772','2773','4','建阳市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1389','1','2774','2775','4','其它区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1390','1','2777','2794','3','龙岩市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1391','1','2778','2779','4','新罗区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1392','1','2780','2781','4','长汀县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1393','1','2782','2783','4','永定县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1394','1','2784','2785','4','上杭县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1395','1','2786','2787','4','武平县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1396','1','2788','2789','4','连城县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1397','1','2790','2791','4','漳平市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1398','1','2792','2793','4','其它区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1399','1','2795','2816','3','宁德市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1400','1','2796','2797','4','蕉城区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1401','1','2798','2799','4','霞浦县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1402','1','2800','2801','4','古田县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1403','1','2802','2803','4','屏南县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1404','1','2804','2805','4','寿宁县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1405','1','2806','2807','4','周宁县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1406','1','2808','2809','4','柘荣县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1407','1','2810','2811','4','福安市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1408','1','2812','2813','4','福鼎市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1409','1','2814','2815','4','其它区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1410','1','2818','3069','2','江西省','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1411','1','2819','2846','3','南昌市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1412','1','2820','2821','4','东湖区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1413','1','2822','2823','4','西湖区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1414','1','2824','2825','4','青云谱区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1415','1','2826','2827','4','湾里区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1416','1','2828','2829','4','青山湖区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1417','1','2830','2831','4','南昌县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1418','1','2832','2833','4','新建县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1419','1','2834','2835','4','安义县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1420','1','2836','2837','4','进贤县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1421','1','2838','2839','4','红谷滩新区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1422','1','2840','2841','4','经济技术开发区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1423','1','2842','2843','4','昌北区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1424','1','2844','2845','4','其它区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1425','1','2847','2858','3','景德镇市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1426','1','2848','2849','4','昌江区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1427','1','2850','2851','4','珠山区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1428','1','2852','2853','4','浮梁县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1429','1','2854','2855','4','乐平市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1430','1','2856','2857','4','其它区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1431','1','2859','2872','3','萍乡市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1432','1','2860','2861','4','安源区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1433','1','2862','2863','4','湘东区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1434','1','2864','2865','4','莲花县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1435','1','2866','2867','4','上栗县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1436','1','2868','2869','4','芦溪县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1437','1','2870','2871','4','其它区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1438','1','2873','2900','3','九江市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1439','1','2874','2875','4','庐山区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1440','1','2876','2877','4','浔阳区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1441','1','2878','2879','4','九江县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1442','1','2880','2881','4','武宁县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1443','1','2882','2883','4','修水县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1444','1','2884','2885','4','永修县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1445','1','2886','2887','4','德安县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1446','1','2888','2889','4','星子县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1447','1','2890','2891','4','都昌县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1448','1','2892','2893','4','湖口县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1449','1','2894','2895','4','彭泽县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1450','1','2896','2897','4','瑞昌市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1451','1','2898','2899','4','其它区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1452','1','2901','2908','3','新余市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1453','1','2902','2903','4','渝水区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1454','1','2904','2905','4','分宜县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1455','1','2906','2907','4','其它区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1456','1','2909','2918','3','鹰潭市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1457','1','2910','2911','4','月湖区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1458','1','2912','2913','4','余江县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1459','1','2914','2915','4','贵溪市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1460','1','2916','2917','4','其它区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1461','1','2919','2960','3','赣州市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1462','1','2920','2921','4','章贡区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1463','1','2922','2923','4','赣县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1464','1','2924','2925','4','信丰县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1465','1','2926','2927','4','大余县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1466','1','2928','2929','4','上犹县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1467','1','2930','2931','4','崇义县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1468','1','2932','2933','4','安远县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1469','1','2934','2935','4','龙南县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1470','1','2936','2937','4','定南县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1471','1','2938','2939','4','全南县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1472','1','2940','2941','4','宁都县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1473','1','2942','2943','4','于都县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1474','1','2944','2945','4','兴国县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1475','1','2946','2947','4','会昌县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1476','1','2948','2949','4','寻乌县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1477','1','2950','2951','4','石城县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1478','1','2952','2953','4','黄金区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1479','1','2954','2955','4','瑞金市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1480','1','2956','2957','4','南康市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1481','1','2958','2959','4','其它区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1482','1','2961','2990','3','吉安市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1483','1','2962','2963','4','吉州区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1484','1','2964','2965','4','青原区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1485','1','2966','2967','4','吉安县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1486','1','2968','2969','4','吉水县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1487','1','2970','2971','4','峡江县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1488','1','2972','2973','4','新干县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1489','1','2974','2975','4','永丰县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1490','1','2976','2977','4','泰和县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1491','1','2978','2979','4','遂川县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1492','1','2980','2981','4','万安县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1493','1','2982','2983','4','安福县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1494','1','2984','2985','4','永新县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1495','1','2986','2987','4','井冈山市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1496','1','2988','2989','4','其它区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1497','1','2991','3014','3','宜春市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1498','1','2992','2993','4','袁州区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1499','1','2994','2995','4','奉新县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1500','1','2996','2997','4','万载县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1501','1','2998','2999','4','上高县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1502','1','3000','3001','4','宜丰县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1503','1','3002','3003','4','靖安县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1504','1','3004','3005','4','铜鼓县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1505','1','3006','3007','4','丰城市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1506','1','3008','3009','4','樟树市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1507','1','3010','3011','4','高安市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1508','1','3012','3013','4','其它区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1509','1','3015','3040','3','抚州市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1510','1','3016','3017','4','临川区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1511','1','3018','3019','4','南城县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1512','1','3020','3021','4','黎川县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1513','1','3022','3023','4','南丰县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1514','1','3024','3025','4','崇仁县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1515','1','3026','3027','4','乐安县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1516','1','3028','3029','4','宜黄县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1517','1','3030','3031','4','金溪县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1518','1','3032','3033','4','资溪县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1519','1','3034','3035','4','东乡县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1520','1','3036','3037','4','广昌县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1521','1','3038','3039','4','其它区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1522','1','3041','3068','3','上饶市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1523','1','3042','3043','4','信州区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1524','1','3044','3045','4','上饶县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1525','1','3046','3047','4','广丰县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1526','1','3048','3049','4','玉山县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1527','1','3050','3051','4','铅山县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1528','1','3052','3053','4','横峰县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1529','1','3054','3055','4','弋阳县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1530','1','3056','3057','4','余干县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1531','1','3058','3059','4','鄱阳县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1532','1','3060','3061','4','万年县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1533','1','3062','3063','4','婺源县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1534','1','3064','3065','4','德兴市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1535','1','3066','3067','4','其它区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1536','1','3070','3429','2','山东省','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1537','1','3071','3094','3','济南市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1538','1','3072','3073','4','历下区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1539','1','3074','3075','4','市中区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1540','1','3076','3077','4','槐荫区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1541','1','3078','3079','4','天桥区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1542','1','3080','3081','4','历城区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1543','1','3082','3083','4','长清区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1544','1','3084','3085','4','平阴县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1545','1','3086','3087','4','济阳县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1546','1','3088','3089','4','商河县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1547','1','3090','3091','4','章丘市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1548','1','3092','3093','4','其它区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1549','1','3095','3124','3','青岛市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1550','1','3096','3097','4','市南区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1551','1','3098','3099','4','市北区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1552','1','3100','3101','4','四方区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1553','1','3102','3103','4','黄岛区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1554','1','3104','3105','4','崂山区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1555','1','3106','3107','4','李沧区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1556','1','3108','3109','4','城阳区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1557','1','3110','3111','4','开发区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1558','1','3112','3113','4','胶州市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1559','1','3114','3115','4','即墨市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1560','1','3116','3117','4','平度市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1561','1','3118','3119','4','胶南市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1562','1','3120','3121','4','莱西市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1563','1','3122','3123','4','其它区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1564','1','3125','3144','3','淄博市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1565','1','3126','3127','4','淄川区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1566','1','3128','3129','4','张店区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1567','1','3130','3131','4','博山区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1568','1','3132','3133','4','临淄区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1569','1','3134','3135','4','周村区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1570','1','3136','3137','4','桓台县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1571','1','3138','3139','4','高青县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1572','1','3140','3141','4','沂源县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1573','1','3142','3143','4','其它区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1574','1','3145','3160','3','枣庄市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1575','1','3146','3147','4','市中区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1576','1','3148','3149','4','薛城区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1577','1','3150','3151','4','峄城区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1578','1','3152','3153','4','台儿庄区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1579','1','3154','3155','4','山亭区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1580','1','3156','3157','4','滕州市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1581','1','3158','3159','4','其它区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1582','1','3161','3178','3','东营市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1583','1','3162','3163','4','东营区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1584','1','3164','3165','4','河口区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1585','1','3166','3167','4','垦利县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1586','1','3168','3169','4','利津县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1587','1','3170','3171','4','广饶县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1588','1','3172','3173','4','西城区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1589','1','3174','3175','4','东城区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1590','1','3176','3177','4','其它区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1591','1','3179','3206','3','烟台市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1592','1','3180','3181','4','芝罘区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1593','1','3182','3183','4','福山区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1594','1','3184','3185','4','牟平区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1595','1','3186','3187','4','莱山区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1596','1','3188','3189','4','长岛县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1597','1','3190','3191','4','龙口市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1598','1','3192','3193','4','莱阳市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1599','1','3194','3195','4','莱州市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1600','1','3196','3197','4','蓬莱市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1601','1','3198','3199','4','招远市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1602','1','3200','3201','4','栖霞市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1603','1','3202','3203','4','海阳市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1604','1','3204','3205','4','其它区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1605','1','3207','3236','3','潍坊市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1606','1','3208','3209','4','潍城区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1607','1','3210','3211','4','寒亭区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1608','1','3212','3213','4','坊子区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1609','1','3214','3215','4','奎文区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1610','1','3216','3217','4','临朐县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1611','1','3218','3219','4','昌乐县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1612','1','3220','3221','4','开发区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1613','1','3222','3223','4','青州市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1614','1','3224','3225','4','诸城市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1615','1','3226','3227','4','寿光市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1616','1','3228','3229','4','安丘市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1617','1','3230','3231','4','高密市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1618','1','3232','3233','4','昌邑市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1619','1','3234','3235','4','其它区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1620','1','3237','3264','3','济宁市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1621','1','3238','3239','4','市中区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1622','1','3240','3241','4','任城区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1623','1','3242','3243','4','微山县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1624','1','3244','3245','4','鱼台县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1625','1','3246','3247','4','金乡县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1626','1','3248','3249','4','嘉祥县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1627','1','3250','3251','4','汶上县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1628','1','3252','3253','4','泗水县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1629','1','3254','3255','4','梁山县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1630','1','3256','3257','4','曲阜市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1631','1','3258','3259','4','兖州市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1632','1','3260','3261','4','邹城市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1633','1','3262','3263','4','其它区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1634','1','3265','3280','3','泰安市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1635','1','3266','3267','4','泰山区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1636','1','3268','3269','4','岱岳区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1637','1','3270','3271','4','宁阳县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1638','1','3272','3273','4','东平县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1639','1','3274','3275','4','新泰市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1640','1','3276','3277','4','肥城市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1641','1','3278','3279','4','其它区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1642','1','3281','3292','3','威海市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1643','1','3282','3283','4','环翠区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1644','1','3284','3285','4','文登市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1645','1','3286','3287','4','荣成市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1646','1','3288','3289','4','乳山市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1647','1','3290','3291','4','其它区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1648','1','3293','3304','3','日照市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1649','1','3294','3295','4','东港区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1650','1','3296','3297','4','岚山区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1651','1','3298','3299','4','五莲县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1652','1','3300','3301','4','莒县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1653','1','3302','3303','4','其它区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1654','1','3305','3312','3','莱芜市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1655','1','3306','3307','4','莱城区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1656','1','3308','3309','4','钢城区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1657','1','3310','3311','4','其它区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1658','1','3313','3340','3','临沂市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1659','1','3314','3315','4','兰山区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1660','1','3316','3317','4','罗庄区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1661','1','3318','3319','4','河东区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1662','1','3320','3321','4','沂南县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1663','1','3322','3323','4','郯城县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1664','1','3324','3325','4','沂水县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1665','1','3326','3327','4','苍山县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1666','1','3328','3329','4','费县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1667','1','3330','3331','4','平邑县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1668','1','3332','3333','4','莒南县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1669','1','3334','3335','4','蒙阴县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1670','1','3336','3337','4','临沭县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1671','1','3338','3339','4','其它区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1672','1','3341','3368','3','德州市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1673','1','3342','3343','4','德城区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1674','1','3344','3345','4','陵县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1675','1','3346','3347','4','宁津县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1676','1','3348','3349','4','庆云县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1677','1','3350','3351','4','临邑县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1678','1','3352','3353','4','齐河县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1679','1','3354','3355','4','平原县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1680','1','3356','3357','4','夏津县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1681','1','3358','3359','4','武城县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1682','1','3360','3361','4','开发区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1683','1','3362','3363','4','乐陵市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1684','1','3364','3365','4','禹城市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1685','1','3366','3367','4','其它区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1686','1','3369','3388','3','聊城市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1687','1','3370','3371','4','东昌府区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1688','1','3372','3373','4','阳谷县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1689','1','3374','3375','4','莘县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1690','1','3376','3377','4','茌平县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1691','1','3378','3379','4','东阿县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1692','1','3380','3381','4','冠县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1693','1','3382','3383','4','高唐县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1694','1','3384','3385','4','临清市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1695','1','3386','3387','4','其它区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1696','1','3389','3406','3','滨州市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1697','1','3390','3391','4','滨城区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1698','1','3392','3393','4','惠民县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1699','1','3394','3395','4','阳信县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1700','1','3396','3397','4','无棣县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1701','1','3398','3399','4','沾化县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1702','1','3400','3401','4','博兴县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1703','1','3402','3403','4','邹平县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1704','1','3404','3405','4','其它区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1705','1','3407','3428','3','菏泽市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1706','1','3408','3409','4','牡丹区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1707','1','3410','3411','4','曹县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1708','1','3412','3413','4','单县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1709','1','3414','3415','4','成武县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1710','1','3416','3417','4','巨野县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1711','1','3418','3419','4','郓城县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1712','1','3420','3421','4','鄄城县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1713','1','3422','3423','4','定陶县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1714','1','3424','3425','4','东明县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1715','1','3426','3427','4','其它区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1716','1','3430','3819','2','河南省','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1717','1','3431','3462','3','郑州市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1718','1','3432','3433','4','中原区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1719','1','3434','3435','4','二七区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1720','1','3436','3437','4','管城回族区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1721','1','3438','3439','4','金水区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1722','1','3440','3441','4','上街区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1723','1','3442','3443','4','惠济区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1724','1','3444','3445','4','中牟县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1725','1','3446','3447','4','巩义市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1726','1','3448','3449','4','荥阳市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1727','1','3450','3451','4','新密市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1728','1','3452','3453','4','新郑市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1729','1','3454','3455','4','登封市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1730','1','3456','3457','4','郑东新区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1731','1','3458','3459','4','高新区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1732','1','3460','3461','4','其它区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1733','1','3463','3486','3','开封市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1734','1','3464','3465','4','龙亭区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1735','1','3466','3467','4','顺河回族区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1736','1','3468','3469','4','鼓楼区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1737','1','3470','3471','4','禹王台区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1738','1','3472','3473','4','金明区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1739','1','3474','3475','4','杞县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1740','1','3476','3477','4','通许县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1741','1','3478','3479','4','尉氏县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1742','1','3480','3481','4','开封县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1743','1','3482','3483','4','兰考县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1744','1','3484','3485','4','其它区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1745','1','3487','3518','3','洛阳市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1746','1','3488','3489','4','老城区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1747','1','3490','3491','4','西工区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1748','1','3492','3493','4','廛河回族区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1749','1','3494','3495','4','涧西区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1750','1','3496','3497','4','吉利区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1751','1','3498','3499','4','洛龙区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1752','1','3500','3501','4','孟津县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1753','1','3502','3503','4','新安县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1754','1','3504','3505','4','栾川县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1755','1','3506','3507','4','嵩县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1756','1','3508','3509','4','汝阳县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1757','1','3510','3511','4','宜阳县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1758','1','3512','3513','4','洛宁县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1759','1','3514','3515','4','伊川县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1760','1','3516','3517','4','偃师市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1761','1','3519','3542','3','平顶山市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1762','1','3520','3521','4','新华区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1763','1','3522','3523','4','卫东区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1764','1','3524','3525','4','石龙区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1765','1','3526','3527','4','湛河区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1766','1','3528','3529','4','宝丰县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1767','1','3530','3531','4','叶县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1768','1','3532','3533','4','鲁山县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1769','1','3534','3535','4','郏县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1770','1','3536','3537','4','舞钢市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1771','1','3538','3539','4','汝州市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1772','1','3540','3541','4','其它区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1773','1','3543','3564','3','安阳市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1774','1','3544','3545','4','文峰区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1775','1','3546','3547','4','北关区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1776','1','3548','3549','4','殷都区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1777','1','3550','3551','4','龙安区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1778','1','3552','3553','4','安阳县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1779','1','3554','3555','4','汤阴县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1780','1','3556','3557','4','滑县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1781','1','3558','3559','4','内黄县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1782','1','3560','3561','4','林州市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1783','1','3562','3563','4','其它区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1784','1','3565','3578','3','鹤壁市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1785','1','3566','3567','4','鹤山区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1786','1','3568','3569','4','山城区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1787','1','3570','3571','4','淇滨区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1788','1','3572','3573','4','浚县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1789','1','3574','3575','4','淇县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1790','1','3576','3577','4','其它区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1791','1','3579','3606','3','新乡市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1792','1','3580','3581','4','红旗区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1793','1','3582','3583','4','卫滨区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1794','1','3584','3585','4','凤泉区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1795','1','3586','3587','4','牧野区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1796','1','3588','3589','4','新乡县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1797','1','3590','3591','4','获嘉县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1798','1','3592','3593','4','原阳县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1799','1','3594','3595','4','延津县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1800','1','3596','3597','4','封丘县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1801','1','3598','3599','4','长垣县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1802','1','3600','3601','4','卫辉市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1803','1','3602','3603','4','辉县市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1804','1','3604','3605','4','其它区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1805','1','3607','3632','3','焦作市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1806','1','3608','3609','4','解放区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1807','1','3610','3611','4','中站区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1808','1','3612','3613','4','马村区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1809','1','3614','3615','4','山阳区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1810','1','3616','3617','4','修武县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1811','1','3618','3619','4','博爱县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1812','1','3620','3621','4','武陟县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1813','1','3622','3623','4','温县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1814','1','3624','3625','4','济源市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1815','1','3626','3627','4','沁阳市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1816','1','3628','3629','4','孟州市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1817','1','3630','3631','4','其它区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1818','1','3633','3648','3','濮阳市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1819','1','3634','3635','4','华龙区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1820','1','3636','3637','4','清丰县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1821','1','3638','3639','4','南乐县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1822','1','3640','3641','4','范县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1823','1','3642','3643','4','台前县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1824','1','3644','3645','4','濮阳县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1825','1','3646','3647','4','其它区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1826','1','3649','3664','3','许昌市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1827','1','3650','3651','4','魏都区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1828','1','3652','3653','4','许昌县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1829','1','3654','3655','4','鄢陵县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1830','1','3656','3657','4','襄城县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1831','1','3658','3659','4','禹州市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1832','1','3660','3661','4','长葛市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1833','1','3662','3663','4','其它区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1834','1','3665','3678','3','漯河市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1835','1','3666','3667','4','源汇区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1836','1','3668','3669','4','郾城区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1837','1','3670','3671','4','召陵区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1838','1','3672','3673','4','舞阳县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1839','1','3674','3675','4','临颍县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1840','1','3676','3677','4','其它区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1841','1','3679','3694','3','三门峡市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1842','1','3680','3681','4','湖滨区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1843','1','3682','3683','4','渑池县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1844','1','3684','3685','4','陕县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1845','1','3686','3687','4','卢氏县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1846','1','3688','3689','4','义马市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1847','1','3690','3691','4','灵宝市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1848','1','3692','3693','4','其它区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1849','1','3695','3724','3','南阳市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1850','1','3696','3697','4','宛城区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1851','1','3698','3699','4','卧龙区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1852','1','3700','3701','4','南召县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1853','1','3702','3703','4','方城县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1854','1','3704','3705','4','西峡县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1855','1','3706','3707','4','镇平县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1856','1','3708','3709','4','内乡县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1857','1','3710','3711','4','淅川县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1858','1','3712','3713','4','社旗县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1859','1','3714','3715','4','唐河县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1860','1','3716','3717','4','新野县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1861','1','3718','3719','4','桐柏县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1862','1','3720','3721','4','邓州市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1863','1','3722','3723','4','其它区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1864','1','3725','3746','3','商丘市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1865','1','3726','3727','4','梁园区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1866','1','3728','3729','4','睢阳区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1867','1','3730','3731','4','民权县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1868','1','3732','3733','4','睢县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1869','1','3734','3735','4','宁陵县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1870','1','3736','3737','4','柘城县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1871','1','3738','3739','4','虞城县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1872','1','3740','3741','4','夏邑县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1873','1','3742','3743','4','永城市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1874','1','3744','3745','4','其它区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1875','1','3747','3770','3','信阳市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1876','1','3748','3749','4','浉河区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1877','1','3750','3751','4','平桥区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1878','1','3752','3753','4','罗山县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1879','1','3754','3755','4','光山县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1880','1','3756','3757','4','新县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1881','1','3758','3759','4','商城县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1882','1','3760','3761','4','固始县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1883','1','3762','3763','4','潢川县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1884','1','3764','3765','4','淮滨县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1885','1','3766','3767','4','息县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1886','1','3768','3769','4','其它区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1887','1','3771','3794','3','周口市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1888','1','3772','3773','4','川汇区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1889','1','3774','3775','4','扶沟县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1890','1','3776','3777','4','西华县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1891','1','3778','3779','4','商水县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1892','1','3780','3781','4','沈丘县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1893','1','3782','3783','4','郸城县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1894','1','3784','3785','4','淮阳县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1895','1','3786','3787','4','太康县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1896','1','3788','3789','4','鹿邑县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1897','1','3790','3791','4','项城市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1898','1','3792','3793','4','其它区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1899','1','3795','3818','3','驻马店市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1900','1','3796','3797','4','驿城区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1901','1','3798','3799','4','西平县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1902','1','3800','3801','4','上蔡县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1903','1','3802','3803','4','平舆县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1904','1','3804','3805','4','正阳县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1905','1','3806','3807','4','确山县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1906','1','3808','3809','4','泌阳县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1907','1','3810','3811','4','汝南县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1908','1','3812','3813','4','遂平县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1909','1','3814','3815','4','新蔡县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1910','1','3816','3817','4','其它区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1911','1','3820','4087','2','湖北省','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1912','1','3821','3850','3','武汉市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1913','1','3822','3823','4','江岸区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1914','1','3824','3825','4','江汉区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1915','1','3826','3827','4','硚口区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1916','1','3828','3829','4','汉阳区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1917','1','3830','3831','4','武昌区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1918','1','3832','3833','4','青山区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1919','1','3834','3835','4','洪山区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1920','1','3836','3837','4','东西湖区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1921','1','3838','3839','4','汉南区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1922','1','3840','3841','4','蔡甸区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1923','1','3842','3843','4','江夏区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1924','1','3844','3845','4','黄陂区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1925','1','3846','3847','4','新洲区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1926','1','3848','3849','4','其它区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1927','1','3851','3866','3','黄石市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1928','1','3852','3853','4','黄石港区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1929','1','3854','3855','4','西塞山区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1930','1','3856','3857','4','下陆区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1931','1','3858','3859','4','铁山区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1932','1','3860','3861','4','阳新县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1933','1','3862','3863','4','大冶市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1934','1','3864','3865','4','其它区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1935','1','3867','3888','3','十堰市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1936','1','3868','3869','4','茅箭区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1937','1','3870','3871','4','张湾区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1938','1','3872','3873','4','郧县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1939','1','3874','3875','4','郧西县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1940','1','3876','3877','4','竹山县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1941','1','3878','3879','4','竹溪县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1942','1','3880','3881','4','房县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1943','1','3882','3883','4','丹江口市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1944','1','3884','3885','4','城区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1945','1','3886','3887','4','其它区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1946','1','3889','3922','3','宜昌市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1947','1','3890','3891','4','西陵区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1948','1','3892','3893','4','伍家岗区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1949','1','3894','3895','4','点军区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1950','1','3896','3897','4','猇亭区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1951','1','3898','3899','4','夷陵区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1952','1','3900','3901','4','远安县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1953','1','3902','3903','4','兴山县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1954','1','3904','3905','4','秭归县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1955','1','3906','3907','4','长阳土家族自治县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1956','1','3908','3909','4','五峰土家族自治县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1957','1','3910','3911','4','葛洲坝区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1958','1','3912','3913','4','开发区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1959','1','3914','3915','4','宜都市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1960','1','3916','3917','4','当阳市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1961','1','3918','3919','4','枝江市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1962','1','3920','3921','4','其它区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1963','1','3923','3944','3','襄阳市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1964','1','3924','3925','4','襄城区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1965','1','3926','3927','4','樊城区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1966','1','3928','3929','4','襄州区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1967','1','3930','3931','4','南漳县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1968','1','3932','3933','4','谷城县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1969','1','3934','3935','4','保康县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1970','1','3936','3937','4','老河口市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1971','1','3938','3939','4','枣阳市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1972','1','3940','3941','4','宜城市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1973','1','3942','3943','4','其它区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1974','1','3945','3954','3','鄂州市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1975','1','3946','3947','4','梁子湖区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1976','1','3948','3949','4','华容区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1977','1','3950','3951','4','鄂城区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1978','1','3952','3953','4','其它区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1979','1','3955','3968','3','荆门市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1980','1','3956','3957','4','东宝区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1981','1','3958','3959','4','掇刀区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1982','1','3960','3961','4','京山县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1983','1','3962','3963','4','沙洋县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1984','1','3964','3965','4','钟祥市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1985','1','3966','3967','4','其它区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1986','1','3969','3986','3','孝感市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1987','1','3970','3971','4','孝南区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1988','1','3972','3973','4','孝昌县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1989','1','3974','3975','4','大悟县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1990','1','3976','3977','4','云梦县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1991','1','3978','3979','4','应城市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1992','1','3980','3981','4','安陆市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1993','1','3982','3983','4','汉川市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1994','1','3984','3985','4','其它区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1995','1','3987','4006','3','荆州市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1996','1','3988','3989','4','沙市区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1997','1','3990','3991','4','荆州区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1998','1','3992','3993','4','公安县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('1999','1','3994','3995','4','监利县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2000','1','3996','3997','4','江陵县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2001','1','3998','3999','4','石首市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2002','1','4000','4001','4','洪湖市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2003','1','4002','4003','4','松滋市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2004','1','4004','4005','4','其它区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2005','1','4007','4030','3','黄冈市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2006','1','4008','4009','4','黄州区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2007','1','4010','4011','4','团风县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2008','1','4012','4013','4','红安县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2009','1','4014','4015','4','罗田县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2010','1','4016','4017','4','英山县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2011','1','4018','4019','4','浠水县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2012','1','4020','4021','4','蕲春县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2013','1','4022','4023','4','黄梅县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2014','1','4024','4025','4','麻城市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2015','1','4026','4027','4','武穴市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2016','1','4028','4029','4','其它区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2017','1','4031','4048','3','咸宁市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2018','1','4032','4033','4','咸安区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2019','1','4034','4035','4','嘉鱼县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2020','1','4036','4037','4','通城县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2021','1','4038','4039','4','崇阳县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2022','1','4040','4041','4','通山县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2023','1','4042','4043','4','赤壁市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2024','1','4044','4045','4','温泉城区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2025','1','4046','4047','4','其它区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2026','1','4049','4058','3','随州市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2027','1','4050','4051','4','曾都区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2028','1','4052','4053','4','随县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2029','1','4054','4055','4','广水市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2030','1','4056','4057','4','其它区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2031','1','4059','4086','3','恩施土家族苗族自治州','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2032','1','4060','4061','4','恩施市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2033','1','4062','4063','4','利川市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2034','1','4064','4065','4','建始县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2035','1','4066','4067','4','巴东县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2036','1','4068','4069','4','宣恩县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2037','1','4070','4071','4','咸丰县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2038','1','4072','4073','4','来凤县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2039','1','4074','4075','4','鹤峰县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2040','1','4076','4077','4','其它区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2041','1','4078','4079','4','仙桃市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2042','1','4080','4081','4','潜江市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2043','1','4082','4083','4','天门市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2044','1','4084','4085','4','神农架林区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2045','1','4088','4389','2','湖南省','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2046','1','4089','4110','3','长沙市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2047','1','4090','4091','4','芙蓉区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2048','1','4092','4093','4','天心区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2049','1','4094','4095','4','岳麓区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2050','1','4096','4097','4','开福区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2051','1','4098','4099','4','雨花区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2052','1','4100','4101','4','长沙县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2053','1','4102','4103','4','望城县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2054','1','4104','4105','4','宁乡县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2055','1','4106','4107','4','浏阳市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2056','1','4108','4109','4','其它区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2057','1','4111','4132','3','株洲市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2058','1','4112','4113','4','荷塘区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2059','1','4114','4115','4','芦淞区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2060','1','4116','4117','4','石峰区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2061','1','4118','4119','4','天元区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2062','1','4120','4121','4','株洲县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2063','1','4122','4123','4','攸县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2064','1','4124','4125','4','茶陵县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2065','1','4126','4127','4','炎陵县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2066','1','4128','4129','4','醴陵市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2067','1','4130','4131','4','其它区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2068','1','4133','4146','3','湘潭市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2069','1','4134','4135','4','雨湖区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2070','1','4136','4137','4','岳塘区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2071','1','4138','4139','4','湘潭县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2072','1','4140','4141','4','湘乡市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2073','1','4142','4143','4','韶山市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2074','1','4144','4145','4','其它区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2075','1','4147','4174','3','衡阳市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2076','1','4148','4149','4','珠晖区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2077','1','4150','4151','4','雁峰区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2078','1','4152','4153','4','石鼓区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2079','1','4154','4155','4','蒸湘区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2080','1','4156','4157','4','南岳区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2081','1','4158','4159','4','衡阳县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2082','1','4160','4161','4','衡南县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2083','1','4162','4163','4','衡山县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2084','1','4164','4165','4','衡东县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2085','1','4166','4167','4','祁东县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2086','1','4168','4169','4','耒阳市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2087','1','4170','4171','4','常宁市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2088','1','4172','4173','4','其它区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2089','1','4175','4202','3','邵阳市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2090','1','4176','4177','4','双清区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2091','1','4178','4179','4','大祥区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2092','1','4180','4181','4','北塔区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2093','1','4182','4183','4','邵东县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2094','1','4184','4185','4','新邵县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2095','1','4186','4187','4','邵阳县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2096','1','4188','4189','4','隆回县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2097','1','4190','4191','4','洞口县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2098','1','4192','4193','4','绥宁县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2099','1','4194','4195','4','新宁县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2100','1','4196','4197','4','城步苗族自治县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2101','1','4198','4199','4','武冈市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2102','1','4200','4201','4','其它区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2103','1','4203','4224','3','岳阳市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2104','1','4204','4205','4','岳阳楼区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2105','1','4206','4207','4','云溪区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2106','1','4208','4209','4','君山区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2107','1','4210','4211','4','岳阳县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2108','1','4212','4213','4','华容县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2109','1','4214','4215','4','湘阴县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2110','1','4216','4217','4','平江县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2111','1','4218','4219','4','汨罗市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2112','1','4220','4221','4','临湘市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2113','1','4222','4223','4','其它区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2114','1','4225','4246','3','常德市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2115','1','4226','4227','4','武陵区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2116','1','4228','4229','4','鼎城区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2117','1','4230','4231','4','安乡县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2118','1','4232','4233','4','汉寿县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2119','1','4234','4235','4','澧县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2120','1','4236','4237','4','临澧县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2121','1','4238','4239','4','桃源县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2122','1','4240','4241','4','石门县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2123','1','4242','4243','4','津市市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2124','1','4244','4245','4','其它区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2125','1','4247','4258','3','张家界市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2126','1','4248','4249','4','永定区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2127','1','4250','4251','4','武陵源区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2128','1','4252','4253','4','慈利县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2129','1','4254','4255','4','桑植县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2130','1','4256','4257','4','其它区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2131','1','4259','4274','3','益阳市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2132','1','4260','4261','4','资阳区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2133','1','4262','4263','4','赫山区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2134','1','4264','4265','4','南县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2135','1','4266','4267','4','桃江县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2136','1','4268','4269','4','安化县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2137','1','4270','4271','4','沅江市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2138','1','4272','4273','4','其它区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2139','1','4275','4300','3','郴州市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2140','1','4276','4277','4','北湖区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2141','1','4278','4279','4','苏仙区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2142','1','4280','4281','4','桂阳县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2143','1','4282','4283','4','宜章县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2144','1','4284','4285','4','永兴县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2145','1','4286','4287','4','嘉禾县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2146','1','4288','4289','4','临武县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2147','1','4290','4291','4','汝城县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2148','1','4292','4293','4','桂东县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2149','1','4294','4295','4','安仁县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2150','1','4296','4297','4','资兴市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2151','1','4298','4299','4','其它区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2152','1','4301','4326','3','永州市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2153','1','4302','4303','4','零陵区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2154','1','4304','4305','4','冷水滩区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2155','1','4306','4307','4','祁阳县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2156','1','4308','4309','4','东安县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2157','1','4310','4311','4','双牌县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2158','1','4312','4313','4','道县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2159','1','4314','4315','4','江永县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2160','1','4316','4317','4','宁远县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2161','1','4318','4319','4','蓝山县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2162','1','4320','4321','4','新田县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2163','1','4322','4323','4','江华瑶族自治县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2164','1','4324','4325','4','其它区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2165','1','4327','4354','3','怀化市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2166','1','4328','4329','4','鹤城区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2167','1','4330','4331','4','中方县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2168','1','4332','4333','4','沅陵县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2169','1','4334','4335','4','辰溪县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2170','1','4336','4337','4','溆浦县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2171','1','4338','4339','4','会同县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2172','1','4340','4341','4','麻阳苗族自治县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2173','1','4342','4343','4','新晃侗族自治县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2174','1','4344','4345','4','芷江侗族自治县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2175','1','4346','4347','4','靖州苗族侗族自治县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2176','1','4348','4349','4','通道侗族自治县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2177','1','4350','4351','4','洪江市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2178','1','4352','4353','4','其它区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2179','1','4355','4368','3','娄底市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2180','1','4356','4357','4','娄星区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2181','1','4358','4359','4','双峰县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2182','1','4360','4361','4','新化县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2183','1','4362','4363','4','冷水江市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2184','1','4364','4365','4','涟源市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2185','1','4366','4367','4','其它区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2186','1','4369','4388','3','湘西土家族苗族自治州','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2187','1','4370','4371','4','吉首市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2188','1','4372','4373','4','泸溪县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2189','1','4374','4375','4','凤凰县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2190','1','4376','4377','4','花垣县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2191','1','4378','4379','4','保靖县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2192','1','4380','4381','4','古丈县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2193','1','4382','4383','4','永顺县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2194','1','4384','4385','4','龙山县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2195','1','4386','4387','4','其它区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2196','1','4390','4723','2','广东省','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2197','1','4391','4420','3','广州市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2198','1','4392','4393','4','荔湾区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2199','1','4394','4395','4','越秀区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2200','1','4396','4397','4','海珠区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2201','1','4398','4399','4','天河区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2202','1','4400','4401','4','白云区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2203','1','4402','4403','4','黄埔区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2204','1','4404','4405','4','番禺区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2205','1','4406','4407','4','花都区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2206','1','4408','4409','4','南沙区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2207','1','4410','4411','4','萝岗区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2208','1','4412','4413','4','增城市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2209','1','4414','4415','4','从化市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2210','1','4416','4417','4','东山区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2211','1','4418','4419','4','其它区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2212','1','4421','4444','3','韶关市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2213','1','4422','4423','4','武江区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2214','1','4424','4425','4','浈江区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2215','1','4426','4427','4','曲江区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2216','1','4428','4429','4','始兴县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2217','1','4430','4431','4','仁化县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2218','1','4432','4433','4','翁源县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2219','1','4434','4435','4','乳源瑶族自治县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2220','1','4436','4437','4','新丰县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2221','1','4438','4439','4','乐昌市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2222','1','4440','4441','4','南雄市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2223','1','4442','4443','4','其它区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2224','1','4445','4460','3','深圳市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2225','1','4446','4447','4','罗湖区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2226','1','4448','4449','4','福田区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2227','1','4450','4451','4','南山区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2228','1','4452','4453','4','宝安区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2229','1','4454','4455','4','龙岗区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2230','1','4456','4457','4','盐田区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2231','1','4458','4459','4','其它区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2232','1','4461','4474','3','珠海市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2233','1','4462','4463','4','香洲区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2234','1','4464','4465','4','斗门区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2235','1','4466','4467','4','金湾区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2236','1','4468','4469','4','金唐区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2237','1','4470','4471','4','南湾区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2238','1','4472','4473','4','其它区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2239','1','4475','4492','3','汕头市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2240','1','4476','4477','4','龙湖区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2241','1','4478','4479','4','金平区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2242','1','4480','4481','4','濠江区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2243','1','4482','4483','4','潮阳区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2244','1','4484','4485','4','潮南区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2245','1','4486','4487','4','澄海区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2246','1','4488','4489','4','南澳县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2247','1','4490','4491','4','其它区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2248','1','4493','4506','3','佛山市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2249','1','4494','4495','4','禅城区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2250','1','4496','4497','4','南海区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2251','1','4498','4499','4','顺德区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2252','1','4500','4501','4','三水区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2253','1','4502','4503','4','高明区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2254','1','4504','4505','4','其它区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2255','1','4507','4524','3','江门市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2256','1','4508','4509','4','蓬江区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2257','1','4510','4511','4','江海区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2258','1','4512','4513','4','新会区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2259','1','4514','4515','4','台山市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2260','1','4516','4517','4','开平市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2261','1','4518','4519','4','鹤山市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2262','1','4520','4521','4','恩平市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2263','1','4522','4523','4','其它区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2264','1','4525','4546','3','湛江市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2265','1','4526','4527','4','赤坎区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2266','1','4528','4529','4','霞山区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2267','1','4530','4531','4','坡头区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2268','1','4532','4533','4','麻章区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2269','1','4534','4535','4','遂溪县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2270','1','4536','4537','4','徐闻县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2271','1','4538','4539','4','廉江市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2272','1','4540','4541','4','雷州市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2273','1','4542','4543','4','吴川市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2274','1','4544','4545','4','其它区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2275','1','4547','4562','3','茂名市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2276','1','4548','4549','4','茂南区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2277','1','4550','4551','4','茂港区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2278','1','4552','4553','4','电白县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2279','1','4554','4555','4','高州市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2280','1','4556','4557','4','化州市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2281','1','4558','4559','4','信宜市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2282','1','4560','4561','4','其它区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2283','1','4563','4582','3','肇庆市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2284','1','4564','4565','4','端州区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2285','1','4566','4567','4','鼎湖区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2286','1','4568','4569','4','广宁县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2287','1','4570','4571','4','怀集县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2288','1','4572','4573','4','封开县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2289','1','4574','4575','4','德庆县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2290','1','4576','4577','4','高要市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2291','1','4578','4579','4','四会市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2292','1','4580','4581','4','其它区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2293','1','4583','4596','3','惠州市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2294','1','4584','4585','4','惠城区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2295','1','4586','4587','4','惠阳区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2296','1','4588','4589','4','博罗县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2297','1','4590','4591','4','惠东县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2298','1','4592','4593','4','龙门县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2299','1','4594','4595','4','其它区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2300','1','4597','4616','3','梅州市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2301','1','4598','4599','4','梅江区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2302','1','4600','4601','4','梅县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2303','1','4602','4603','4','大埔县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2304','1','4604','4605','4','丰顺县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2305','1','4606','4607','4','五华县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2306','1','4608','4609','4','平远县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2307','1','4610','4611','4','蕉岭县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2308','1','4612','4613','4','兴宁市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2309','1','4614','4615','4','其它区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2310','1','4617','4628','3','汕尾市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2311','1','4618','4619','4','城区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2312','1','4620','4621','4','海丰县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2313','1','4622','4623','4','陆河县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2314','1','4624','4625','4','陆丰市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2315','1','4626','4627','4','其它区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2316','1','4629','4644','3','河源市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2317','1','4630','4631','4','源城区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2318','1','4632','4633','4','紫金县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2319','1','4634','4635','4','龙川县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2320','1','4636','4637','4','连平县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2321','1','4638','4639','4','和平县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2322','1','4640','4641','4','东源县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2323','1','4642','4643','4','其它区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2324','1','4645','4656','3','阳江市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2325','1','4646','4647','4','江城区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2326','1','4648','4649','4','阳西县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2327','1','4650','4651','4','阳东县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2328','1','4652','4653','4','阳春市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2329','1','4654','4655','4','其它区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2330','1','4657','4676','3','清远市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2331','1','4658','4659','4','清城区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2332','1','4660','4661','4','佛冈县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2333','1','4662','4663','4','阳山县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2334','1','4664','4665','4','连山壮族瑶族自治县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2335','1','4666','4667','4','连南瑶族自治县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2336','1','4668','4669','4','清新县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2337','1','4670','4671','4','英德市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2338','1','4672','4673','4','连州市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2339','1','4674','4675','4','其它区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2340','1','4677','4678','3','东莞市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2341','1','4679','4680','3','中山市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2342','1','4681','4692','3','潮州市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2343','1','4682','4683','4','湘桥区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2344','1','4684','4685','4','潮安县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2345','1','4686','4687','4','饶平县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2346','1','4688','4689','4','枫溪区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2347','1','4690','4691','4','其它区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2348','1','4693','4708','3','揭阳市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2349','1','4694','4695','4','榕城区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2350','1','4696','4697','4','揭东县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2351','1','4698','4699','4','揭西县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2352','1','4700','4701','4','惠来县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2353','1','4702','4703','4','普宁市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2354','1','4704','4705','4','东山区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2355','1','4706','4707','4','其它区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2356','1','4709','4722','3','云浮市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2357','1','4710','4711','4','云城区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2358','1','4712','4713','4','新兴县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2359','1','4714','4715','4','郁南县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2360','1','4716','4717','4','云安县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2361','1','4718','4719','4','罗定市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2362','1','4720','4721','4','其它区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2363','1','4724','4999','2','广西壮族自治区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2364','1','4725','4752','3','南宁市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2365','1','4726','4727','4','兴宁区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2366','1','4728','4729','4','青秀区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2367','1','4730','4731','4','江南区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2368','1','4732','4733','4','西乡塘区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2369','1','4734','4735','4','良庆区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2370','1','4736','4737','4','邕宁区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2371','1','4738','4739','4','武鸣县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2372','1','4740','4741','4','隆安县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2373','1','4742','4743','4','马山县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2374','1','4744','4745','4','上林县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2375','1','4746','4747','4','宾阳县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2376','1','4748','4749','4','横县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2377','1','4750','4751','4','其它区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2378','1','4753','4776','3','柳州市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2379','1','4754','4755','4','城中区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2380','1','4756','4757','4','鱼峰区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2381','1','4758','4759','4','柳南区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2382','1','4760','4761','4','柳北区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2383','1','4762','4763','4','柳江县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2384','1','4764','4765','4','柳城县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2385','1','4766','4767','4','鹿寨县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2386','1','4768','4769','4','融安县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2387','1','4770','4771','4','融水苗族自治县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2388','1','4772','4773','4','三江侗族自治县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2389','1','4774','4775','4','其它区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2390','1','4777','4814','3','桂林市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2391','1','4778','4779','4','秀峰区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2392','1','4780','4781','4','叠彩区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2393','1','4782','4783','4','象山区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2394','1','4784','4785','4','七星区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2395','1','4786','4787','4','雁山区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2396','1','4788','4789','4','阳朔县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2397','1','4790','4791','4','临桂县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2398','1','4792','4793','4','灵川县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2399','1','4794','4795','4','全州县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2400','1','4796','4797','4','兴安县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2401','1','4798','4799','4','永福县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2402','1','4800','4801','4','灌阳县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2403','1','4802','4803','4','龙胜各族自治县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2404','1','4804','4805','4','资源县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2405','1','4806','4807','4','平乐县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2406','1','4808','4809','4','荔浦县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2407','1','4810','4811','4','恭城瑶族自治县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2408','1','4812','4813','4','其它区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2409','1','4815','4832','3','梧州市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2410','1','4816','4817','4','万秀区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2411','1','4818','4819','4','蝶山区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2412','1','4820','4821','4','长洲区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2413','1','4822','4823','4','苍梧县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2414','1','4824','4825','4','藤县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2415','1','4826','4827','4','蒙山县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2416','1','4828','4829','4','岑溪市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2417','1','4830','4831','4','其它区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2418','1','4833','4844','3','北海市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2419','1','4834','4835','4','海城区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2420','1','4836','4837','4','银海区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2421','1','4838','4839','4','铁山港区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2422','1','4840','4841','4','合浦县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2423','1','4842','4843','4','其它区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2424','1','4845','4856','3','防城港市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2425','1','4846','4847','4','港口区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2426','1','4848','4849','4','防城区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2427','1','4850','4851','4','上思县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2428','1','4852','4853','4','东兴市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2429','1','4854','4855','4','其它区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2430','1','4857','4868','3','钦州市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2431','1','4858','4859','4','钦南区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2432','1','4860','4861','4','钦北区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2433','1','4862','4863','4','灵山县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2434','1','4864','4865','4','浦北县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2435','1','4866','4867','4','其它区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2436','1','4869','4882','3','贵港市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2437','1','4870','4871','4','港北区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2438','1','4872','4873','4','港南区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2439','1','4874','4875','4','覃塘区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2440','1','4876','4877','4','平南县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2441','1','4878','4879','4','桂平市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2442','1','4880','4881','4','其它区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2443','1','4883','4898','3','玉林市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2444','1','4884','4885','4','玉州区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2445','1','4886','4887','4','容县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2446','1','4888','4889','4','陆川县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2447','1','4890','4891','4','博白县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2448','1','4892','4893','4','兴业县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2449','1','4894','4895','4','北流市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2450','1','4896','4897','4','其它区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2451','1','4899','4926','3','百色市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2452','1','4900','4901','4','右江区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2453','1','4902','4903','4','田阳县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2454','1','4904','4905','4','田东县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2455','1','4906','4907','4','平果县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2456','1','4908','4909','4','德保县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2457','1','4910','4911','4','靖西县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2458','1','4912','4913','4','那坡县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2459','1','4914','4915','4','凌云县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2460','1','4916','4917','4','乐业县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2461','1','4918','4919','4','田林县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2462','1','4920','4921','4','西林县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2463','1','4922','4923','4','隆林各族自治县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2464','1','4924','4925','4','其它区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2465','1','4927','4938','3','贺州市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2466','1','4928','4929','4','八步区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2467','1','4930','4931','4','昭平县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2468','1','4932','4933','4','钟山县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2469','1','4934','4935','4','富川瑶族自治县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2470','1','4936','4937','4','其它区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2471','1','4939','4964','3','河池市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2472','1','4940','4941','4','金城江区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2473','1','4942','4943','4','南丹县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2474','1','4944','4945','4','天峨县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2475','1','4946','4947','4','凤山县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2476','1','4948','4949','4','东兰县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2477','1','4950','4951','4','罗城仫佬族自治县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2478','1','4952','4953','4','环江毛南族自治县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2479','1','4954','4955','4','巴马瑶族自治县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2480','1','4956','4957','4','都安瑶族自治县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2481','1','4958','4959','4','大化瑶族自治县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2482','1','4960','4961','4','宜州市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2483','1','4962','4963','4','其它区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2484','1','4965','4980','3','来宾市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2485','1','4966','4967','4','兴宾区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2486','1','4968','4969','4','忻城县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2487','1','4970','4971','4','象州县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2488','1','4972','4973','4','武宣县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2489','1','4974','4975','4','金秀瑶族自治县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2490','1','4976','4977','4','合山市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2491','1','4978','4979','4','其它区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2492','1','4981','4998','3','崇左市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2493','1','4982','4983','4','江洲区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2494','1','4984','4985','4','扶绥县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2495','1','4986','4987','4','宁明县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2496','1','4988','4989','4','龙州县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2497','1','4990','4991','4','大新县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2498','1','4992','4993','4','天等县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2499','1','4994','4995','4','凭祥市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2500','1','4996','4997','4','其它区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2501','1','5000','5057','2','海南省','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2502','1','5001','5012','3','海口市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2503','1','5002','5003','4','秀英区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2504','1','5004','5005','4','龙华区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2505','1','5006','5007','4','琼山区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2506','1','5008','5009','4','美兰区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2507','1','5010','5011','4','其它区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2508','1','5013','5056','3','三亚市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2509','1','5014','5015','4','五指山市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2510','1','5016','5017','4','琼海市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2511','1','5018','5019','4','儋州市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2512','1','5020','5021','4','文昌市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2513','1','5022','5023','4','万宁市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2514','1','5024','5025','4','东方市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2515','1','5026','5027','4','定安县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2516','1','5028','5029','4','屯昌县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2517','1','5030','5031','4','澄迈县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2518','1','5032','5033','4','临高县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2519','1','5034','5035','4','白沙黎族自治县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2520','1','5036','5037','4','昌江黎族自治县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2521','1','5038','5039','4','乐东黎族自治县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2522','1','5040','5041','4','陵水黎族自治县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2523','1','5042','5043','4','保亭黎族苗族自治县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2524','1','5044','5045','4','琼中黎族苗族自治县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2525','1','5046','5047','4','西沙群岛','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2526','1','5048','5049','4','南沙群岛','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2527','1','5050','5051','4','中沙群岛的岛礁及其海域','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2528','1','5052','5053','4','高新区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2529','1','5054','5055','4','其它区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2530','1','5058','5143','2','重庆','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2531','1','5059','5142','3','重庆市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2532','1','5060','5061','4','万州区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2533','1','5062','5063','4','涪陵区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2534','1','5064','5065','4','渝中区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2535','1','5066','5067','4','大渡口区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2536','1','5068','5069','4','江北区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2537','1','5070','5071','4','沙坪坝区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2538','1','5072','5073','4','九龙坡区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2539','1','5074','5075','4','南岸区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2540','1','5076','5077','4','北碚区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2541','1','5078','5079','4','万盛区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2542','1','5080','5081','4','双桥区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2543','1','5082','5083','4','渝北区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2544','1','5084','5085','4','巴南区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2545','1','5086','5087','4','黔江区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2546','1','5088','5089','4','长寿区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2547','1','5090','5091','4','綦江县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2548','1','5092','5093','4','潼南县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2549','1','5094','5095','4','铜梁县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2550','1','5096','5097','4','大足县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2551','1','5098','5099','4','荣昌县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2552','1','5100','5101','4','璧山县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2553','1','5102','5103','4','梁平县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2554','1','5104','5105','4','城口县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2555','1','5106','5107','4','丰都县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2556','1','5108','5109','4','垫江县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2557','1','5110','5111','4','武隆县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2558','1','5112','5113','4','忠县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2559','1','5114','5115','4','开县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2560','1','5116','5117','4','云阳县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2561','1','5118','5119','4','奉节县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2562','1','5120','5121','4','巫山县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2563','1','5122','5123','4','巫溪县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2564','1','5124','5125','4','石柱土家族自治县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2565','1','5126','5127','4','秀山土家族苗族自治县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2566','1','5128','5129','4','酉阳土家族苗族自治县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2567','1','5130','5131','4','彭水苗族土家族自治县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2568','1','5132','5133','4','江津区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2569','1','5134','5135','4','合川区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2570','1','5136','5137','4','永川区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2571','1','5138','5139','4','南川区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2572','1','5140','5141','4','其它区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2573','1','5144','5595','2','四川省','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2574','1','5145','5186','3','成都市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2575','1','5146','5147','4','锦江区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2576','1','5148','5149','4','青羊区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2577','1','5150','5151','4','金牛区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2578','1','5152','5153','4','武侯区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2579','1','5154','5155','4','成华区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2580','1','5156','5157','4','龙泉驿区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2581','1','5158','5159','4','青白江区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2582','1','5160','5161','4','新都区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2583','1','5162','5163','4','温江区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2584','1','5164','5165','4','金堂县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2585','1','5166','5167','4','双流县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2586','1','5168','5169','4','郫县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2587','1','5170','5171','4','大邑县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2588','1','5172','5173','4','蒲江县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2589','1','5174','5175','4','新津县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2590','1','5176','5177','4','都江堰市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2591','1','5178','5179','4','彭州市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2592','1','5180','5181','4','邛崃市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2593','1','5182','5183','4','崇州市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2594','1','5184','5185','4','其它区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2595','1','5187','5202','3','自贡市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2596','1','5188','5189','4','自流井区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2597','1','5190','5191','4','贡井区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2598','1','5192','5193','4','大安区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2599','1','5194','5195','4','沿滩区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2600','1','5196','5197','4','荣县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2601','1','5198','5199','4','富顺县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2602','1','5200','5201','4','其它区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2603','1','5203','5216','3','攀枝花市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2604','1','5204','5205','4','东区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2605','1','5206','5207','4','西区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2606','1','5208','5209','4','仁和区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2607','1','5210','5211','4','米易县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2608','1','5212','5213','4','盐边县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2609','1','5214','5215','4','其它区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2610','1','5217','5234','3','泸州市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2611','1','5218','5219','4','江阳区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2612','1','5220','5221','4','纳溪区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2613','1','5222','5223','4','龙马潭区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2614','1','5224','5225','4','泸县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2615','1','5226','5227','4','合江县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2616','1','5228','5229','4','叙永县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2617','1','5230','5231','4','古蔺县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2618','1','5232','5233','4','其它区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2619','1','5235','5250','3','德阳市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2620','1','5236','5237','4','旌阳区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2621','1','5238','5239','4','中江县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2622','1','5240','5241','4','罗江县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2623','1','5242','5243','4','广汉市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2624','1','5244','5245','4','什邡市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2625','1','5246','5247','4','绵竹市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2626','1','5248','5249','4','其它区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2627','1','5251','5274','3','绵阳市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2628','1','5252','5253','4','涪城区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2629','1','5254','5255','4','游仙区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2630','1','5256','5257','4','三台县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2631','1','5258','5259','4','盐亭县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2632','1','5260','5261','4','安县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2633','1','5262','5263','4','梓潼县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2634','1','5264','5265','4','北川羌族自治县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2635','1','5266','5267','4','平武县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2636','1','5268','5269','4','高新区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2637','1','5270','5271','4','江油市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2638','1','5272','5273','4','其它区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2639','1','5275','5292','3','广元市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2640','1','5276','5277','4','利州区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2641','1','5278','5279','4','元坝区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2642','1','5280','5281','4','朝天区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2643','1','5282','5283','4','旺苍县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2644','1','5284','5285','4','青川县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2645','1','5286','5287','4','剑阁县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2646','1','5288','5289','4','苍溪县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2647','1','5290','5291','4','其它区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2648','1','5293','5306','3','遂宁市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2649','1','5294','5295','4','船山区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2650','1','5296','5297','4','安居区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2651','1','5298','5299','4','蓬溪县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2652','1','5300','5301','4','射洪县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2653','1','5302','5303','4','大英县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2654','1','5304','5305','4','其它区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2655','1','5307','5320','3','内江市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2656','1','5308','5309','4','市中区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2657','1','5310','5311','4','东兴区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2658','1','5312','5313','4','威远县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2659','1','5314','5315','4','资中县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2660','1','5316','5317','4','隆昌县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2661','1','5318','5319','4','其它区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2662','1','5321','5346','3','乐山市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2663','1','5322','5323','4','市中区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2664','1','5324','5325','4','沙湾区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2665','1','5326','5327','4','五通桥区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2666','1','5328','5329','4','金口河区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2667','1','5330','5331','4','犍为县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2668','1','5332','5333','4','井研县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2669','1','5334','5335','4','夹江县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2670','1','5336','5337','4','沐川县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2671','1','5338','5339','4','峨边彝族自治县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2672','1','5340','5341','4','马边彝族自治县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2673','1','5342','5343','4','峨眉山市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2674','1','5344','5345','4','其它区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2675','1','5347','5368','3','南充市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2676','1','5348','5349','4','顺庆区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2677','1','5350','5351','4','高坪区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2678','1','5352','5353','4','嘉陵区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2679','1','5354','5355','4','南部县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2680','1','5356','5357','4','营山县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2681','1','5358','5359','4','蓬安县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2682','1','5360','5361','4','仪陇县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2683','1','5362','5363','4','西充县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2684','1','5364','5365','4','阆中市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2685','1','5366','5367','4','其它区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2686','1','5369','5384','3','眉山市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2687','1','5370','5371','4','东坡区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2688','1','5372','5373','4','仁寿县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2689','1','5374','5375','4','彭山县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2690','1','5376','5377','4','洪雅县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2691','1','5378','5379','4','丹棱县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2692','1','5380','5381','4','青神县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2693','1','5382','5383','4','其它区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2694','1','5385','5408','3','宜宾市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2695','1','5386','5387','4','翠屏区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2696','1','5388','5389','4','宜宾县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2697','1','5390','5391','4','南溪县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2698','1','5392','5393','4','江安县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2699','1','5394','5395','4','长宁县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2700','1','5396','5397','4','高县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2701','1','5398','5399','4','珙县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2702','1','5400','5401','4','筠连县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2703','1','5402','5403','4','兴文县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2704','1','5404','5405','4','屏山县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2705','1','5406','5407','4','其它区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2706','1','5409','5424','3','广安市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2707','1','5410','5411','4','广安区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2708','1','5412','5413','4','岳池县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2709','1','5414','5415','4','武胜县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2710','1','5416','5417','4','邻水县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2711','1','5418','5419','4','华蓥市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2712','1','5420','5421','4','市辖区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2713','1','5422','5423','4','其它区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2714','1','5425','5442','3','达州市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2715','1','5426','5427','4','通川区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2716','1','5428','5429','4','达县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2717','1','5430','5431','4','宣汉县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2718','1','5432','5433','4','开江县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2719','1','5434','5435','4','大竹县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2720','1','5436','5437','4','渠县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2721','1','5438','5439','4','万源市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2722','1','5440','5441','4','其它区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2723','1','5443','5462','3','雅安市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2724','1','5444','5445','4','雨城区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2725','1','5446','5447','4','名山县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2726','1','5448','5449','4','荥经县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2727','1','5450','5451','4','汉源县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2728','1','5452','5453','4','石棉县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2729','1','5454','5455','4','天全县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2730','1','5456','5457','4','芦山县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2731','1','5458','5459','4','宝兴县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2732','1','5460','5461','4','其它区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2733','1','5463','5474','3','巴中市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2734','1','5464','5465','4','巴州区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2735','1','5466','5467','4','通江县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2736','1','5468','5469','4','南江县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2737','1','5470','5471','4','平昌县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2738','1','5472','5473','4','其它区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2739','1','5475','5486','3','资阳市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2740','1','5476','5477','4','雁江区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2741','1','5478','5479','4','安岳县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2742','1','5480','5481','4','乐至县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2743','1','5482','5483','4','简阳市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2744','1','5484','5485','4','其它区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2745','1','5487','5516','3','阿坝藏族羌族自治州','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2746','1','5488','5489','4','汶川县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2747','1','5490','5491','4','理县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2748','1','5492','5493','4','茂县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2749','1','5494','5495','4','松潘县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2750','1','5496','5497','4','九寨沟县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2751','1','5498','5499','4','金川县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2752','1','5500','5501','4','小金县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2753','1','5502','5503','4','黑水县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2754','1','5504','5505','4','马尔康县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2755','1','5506','5507','4','壤塘县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2756','1','5508','5509','4','阿坝县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2757','1','5510','5511','4','若尔盖县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2758','1','5512','5513','4','红原县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2759','1','5514','5515','4','其它区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2760','1','5517','5556','3','甘孜藏族自治州','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2761','1','5518','5519','4','康定县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2762','1','5520','5521','4','泸定县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2763','1','5522','5523','4','丹巴县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2764','1','5524','5525','4','九龙县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2765','1','5526','5527','4','雅江县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2766','1','5528','5529','4','道孚县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2767','1','5530','5531','4','炉霍县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2768','1','5532','5533','4','甘孜县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2769','1','5534','5535','4','新龙县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2770','1','5536','5537','4','德格县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2771','1','5538','5539','4','白玉县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2772','1','5540','5541','4','石渠县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2773','1','5542','5543','4','色达县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2774','1','5544','5545','4','理塘县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2775','1','5546','5547','4','巴塘县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2776','1','5548','5549','4','乡城县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2777','1','5550','5551','4','稻城县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2778','1','5552','5553','4','得荣县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2779','1','5554','5555','4','其它区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2780','1','5557','5594','3','凉山彝族自治州','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2781','1','5558','5559','4','西昌市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2782','1','5560','5561','4','木里藏族自治县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2783','1','5562','5563','4','盐源县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2784','1','5564','5565','4','德昌县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2785','1','5566','5567','4','会理县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2786','1','5568','5569','4','会东县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2787','1','5570','5571','4','宁南县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2788','1','5572','5573','4','普格县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2789','1','5574','5575','4','布拖县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2790','1','5576','5577','4','金阳县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2791','1','5578','5579','4','昭觉县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2792','1','5580','5581','4','喜德县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2793','1','5582','5583','4','冕宁县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2794','1','5584','5585','4','越西县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2795','1','5586','5587','4','甘洛县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2796','1','5588','5589','4','美姑县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2797','1','5590','5591','4','雷波县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2798','1','5592','5593','4','其它区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2799','1','5596','5811','2','贵州省','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2800','1','5597','5622','3','贵阳市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2801','1','5598','5599','4','南明区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2802','1','5600','5601','4','云岩区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2803','1','5602','5603','4','花溪区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2804','1','5604','5605','4','乌当区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2805','1','5606','5607','4','白云区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2806','1','5608','5609','4','小河区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2807','1','5610','5611','4','开阳县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2808','1','5612','5613','4','息烽县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2809','1','5614','5615','4','修文县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2810','1','5616','5617','4','金阳开发区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2811','1','5618','5619','4','清镇市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2812','1','5620','5621','4','其它区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2813','1','5623','5634','3','六盘水市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2814','1','5624','5625','4','钟山区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2815','1','5626','5627','4','六枝特区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2816','1','5628','5629','4','水城县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2817','1','5630','5631','4','盘县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2818','1','5632','5633','4','其它区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2819','1','5635','5666','3','遵义市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2820','1','5636','5637','4','红花岗区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2821','1','5638','5639','4','汇川区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2822','1','5640','5641','4','遵义县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2823','1','5642','5643','4','桐梓县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2824','1','5644','5645','4','绥阳县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2825','1','5646','5647','4','正安县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2826','1','5648','5649','4','道真仡佬族苗族自治县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2827','1','5650','5651','4','务川仡佬族苗族自治县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2828','1','5652','5653','4','凤冈县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2829','1','5654','5655','4','湄潭县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2830','1','5656','5657','4','余庆县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2831','1','5658','5659','4','习水县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2832','1','5660','5661','4','赤水市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2833','1','5662','5663','4','仁怀市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2834','1','5664','5665','4','其它区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2835','1','5667','5682','3','安顺市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2836','1','5668','5669','4','西秀区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2837','1','5670','5671','4','平坝县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2838','1','5672','5673','4','普定县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2839','1','5674','5675','4','镇宁布依族苗族自治县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2840','1','5676','5677','4','关岭布依族苗族自治县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2841','1','5678','5679','4','紫云苗族布依族自治县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2842','1','5680','5681','4','其它区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2843','1','5683','5706','3','铜仁地区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2844','1','5684','5685','4','铜仁市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2845','1','5686','5687','4','江口县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2846','1','5688','5689','4','玉屏侗族自治县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2847','1','5690','5691','4','石阡县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2848','1','5692','5693','4','思南县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2849','1','5694','5695','4','印江土家族苗族自治县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2850','1','5696','5697','4','德江县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2851','1','5698','5699','4','沿河土家族自治县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2852','1','5700','5701','4','松桃苗族自治县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2853','1','5702','5703','4','万山特区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2854','1','5704','5705','4','其它区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2855','1','5707','5726','3','黔西南布依族苗族自治州','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2856','1','5708','5709','4','兴义市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2857','1','5710','5711','4','兴仁县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2858','1','5712','5713','4','普安县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2859','1','5714','5715','4','晴隆县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2860','1','5716','5717','4','贞丰县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2861','1','5718','5719','4','望谟县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2862','1','5720','5721','4','册亨县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2863','1','5722','5723','4','安龙县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2864','1','5724','5725','4','其它区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2865','1','5727','5746','3','毕节地区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2866','1','5728','5729','4','毕节市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2867','1','5730','5731','4','大方县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2868','1','5732','5733','4','黔西县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2869','1','5734','5735','4','金沙县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2870','1','5736','5737','4','织金县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2871','1','5738','5739','4','纳雍县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2872','1','5740','5741','4','威宁彝族回族苗族自治县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2873','1','5742','5743','4','赫章县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2874','1','5744','5745','4','其它区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2875','1','5747','5782','3','黔东南苗族侗族自治州','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2876','1','5748','5749','4','凯里市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2877','1','5750','5751','4','黄平县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2878','1','5752','5753','4','施秉县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2879','1','5754','5755','4','三穗县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2880','1','5756','5757','4','镇远县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2881','1','5758','5759','4','岑巩县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2882','1','5760','5761','4','天柱县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2883','1','5762','5763','4','锦屏县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2884','1','5764','5765','4','剑河县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2885','1','5766','5767','4','台江县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2886','1','5768','5769','4','黎平县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2887','1','5770','5771','4','榕江县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2888','1','5772','5773','4','从江县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2889','1','5774','5775','4','雷山县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2890','1','5776','5777','4','麻江县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2891','1','5778','5779','4','丹寨县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2892','1','5780','5781','4','其它区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2893','1','5783','5810','3','黔南布依族苗族自治州','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2894','1','5784','5785','4','都匀市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2895','1','5786','5787','4','福泉市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2896','1','5788','5789','4','荔波县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2897','1','5790','5791','4','贵定县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2898','1','5792','5793','4','瓮安县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2899','1','5794','5795','4','独山县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2900','1','5796','5797','4','平塘县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2901','1','5798','5799','4','罗甸县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2902','1','5800','5801','4','长顺县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2903','1','5802','5803','4','龙里县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2904','1','5804','5805','4','惠水县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2905','1','5806','5807','4','三都水族自治县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2906','1','5808','5809','4','其它区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2907','1','5812','6135','2','云南省','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2908','1','5813','5844','3','昆明市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2909','1','5814','5815','4','五华区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2910','1','5816','5817','4','盘龙区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2911','1','5818','5819','4','官渡区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2912','1','5820','5821','4','西山区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2913','1','5822','5823','4','东川区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2914','1','5824','5825','4','呈贡县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2915','1','5826','5827','4','晋宁县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2916','1','5828','5829','4','富民县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2917','1','5830','5831','4','宜良县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2918','1','5832','5833','4','石林彝族自治县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2919','1','5834','5835','4','嵩明县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2920','1','5836','5837','4','禄劝彝族苗族自治县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2921','1','5838','5839','4','寻甸回族彝族自治县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2922','1','5840','5841','4','安宁市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2923','1','5842','5843','4','其它区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2924','1','5845','5866','3','曲靖市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2925','1','5846','5847','4','麒麟区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2926','1','5848','5849','4','马龙县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2927','1','5850','5851','4','陆良县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2928','1','5852','5853','4','师宗县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2929','1','5854','5855','4','罗平县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2930','1','5856','5857','4','富源县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2931','1','5858','5859','4','会泽县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2932','1','5860','5861','4','沾益县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2933','1','5862','5863','4','宣威市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2934','1','5864','5865','4','其它区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2935','1','5867','5888','3','玉溪市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2936','1','5868','5869','4','红塔区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2937','1','5870','5871','4','江川县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2938','1','5872','5873','4','澄江县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2939','1','5874','5875','4','通海县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2940','1','5876','5877','4','华宁县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2941','1','5878','5879','4','易门县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2942','1','5880','5881','4','峨山彝族自治县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2943','1','5882','5883','4','新平彝族傣族自治县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2944','1','5884','5885','4','元江哈尼族彝族傣族自治县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2945','1','5886','5887','4','其它区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2946','1','5889','5902','3','保山市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2947','1','5890','5891','4','隆阳区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2948','1','5892','5893','4','施甸县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2949','1','5894','5895','4','腾冲县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2950','1','5896','5897','4','龙陵县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2951','1','5898','5899','4','昌宁县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2952','1','5900','5901','4','其它区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2953','1','5903','5928','3','昭通市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2954','1','5904','5905','4','昭阳区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2955','1','5906','5907','4','鲁甸县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2956','1','5908','5909','4','巧家县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2957','1','5910','5911','4','盐津县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2958','1','5912','5913','4','大关县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2959','1','5914','5915','4','永善县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2960','1','5916','5917','4','绥江县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2961','1','5918','5919','4','镇雄县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2962','1','5920','5921','4','彝良县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2963','1','5922','5923','4','威信县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2964','1','5924','5925','4','水富县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2965','1','5926','5927','4','其它区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2966','1','5929','5942','3','丽江市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2967','1','5930','5931','4','古城区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2968','1','5932','5933','4','玉龙纳西族自治县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2969','1','5934','5935','4','永胜县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2970','1','5936','5937','4','华坪县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2971','1','5938','5939','4','宁蒗彝族自治县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2972','1','5940','5941','4','其它区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2973','1','5943','5966','3','普洱市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2974','1','5944','5945','4','思茅区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2975','1','5946','5947','4','宁洱哈尼族彝族自治县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2976','1','5948','5949','4','墨江哈尼族自治县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2977','1','5950','5951','4','景东彝族自治县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2978','1','5952','5953','4','景谷傣族彝族自治县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2979','1','5954','5955','4','镇沅彝族哈尼族拉祜族自治县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2980','1','5956','5957','4','江城哈尼族彝族自治县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2981','1','5958','5959','4','孟连傣族拉祜族佤族自治县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2982','1','5960','5961','4','澜沧拉祜族自治县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2983','1','5962','5963','4','西盟佤族自治县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2984','1','5964','5965','4','其它区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2985','1','5967','5986','3','临沧市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2986','1','5968','5969','4','临翔区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2987','1','5970','5971','4','凤庆县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2988','1','5972','5973','4','云县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2989','1','5974','5975','4','永德县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2990','1','5976','5977','4','镇康县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2991','1','5978','5979','4','双江拉祜族佤族布朗族傣族自治县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2992','1','5980','5981','4','耿马傣族佤族自治县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2993','1','5982','5983','4','沧源佤族自治县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2994','1','5984','5985','4','其它区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2995','1','5987','6010','3','楚雄彝族自治州','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2996','1','5988','5989','4','楚雄市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2997','1','5990','5991','4','双柏县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2998','1','5992','5993','4','牟定县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('2999','1','5994','5995','4','南华县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3000','1','5996','5997','4','姚安县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3001','1','5998','5999','4','大姚县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3002','1','6000','6001','4','永仁县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3003','1','6002','6003','4','元谋县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3004','1','6004','6005','4','武定县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3005','1','6006','6007','4','禄丰县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3006','1','6008','6009','4','其它区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3007','1','6011','6040','3','红河哈尼族彝族自治州','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3008','1','6012','6013','4','个旧市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3009','1','6014','6015','4','开远市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3010','1','6016','6017','4','蒙自县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3011','1','6018','6019','4','屏边苗族自治县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3012','1','6020','6021','4','建水县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3013','1','6022','6023','4','石屏县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3014','1','6024','6025','4','弥勒县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3015','1','6026','6027','4','泸西县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3016','1','6028','6029','4','元阳县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3017','1','6030','6031','4','红河县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3018','1','6032','6033','4','金平苗族瑶族傣族自治县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3019','1','6034','6035','4','绿春县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3020','1','6036','6037','4','河口瑶族自治县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3021','1','6038','6039','4','其它区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3022','1','6041','6060','3','文山壮族苗族自治州','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3023','1','6042','6043','4','文山县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3024','1','6044','6045','4','砚山县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3025','1','6046','6047','4','西畴县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3026','1','6048','6049','4','麻栗坡县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3027','1','6050','6051','4','马关县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3028','1','6052','6053','4','丘北县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3029','1','6054','6055','4','广南县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3030','1','6056','6057','4','富宁县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3031','1','6058','6059','4','其它区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3032','1','6061','6070','3','西双版纳傣族自治州','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3033','1','6062','6063','4','景洪市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3034','1','6064','6065','4','勐海县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3035','1','6066','6067','4','勐腊县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3036','1','6068','6069','4','其它区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3037','1','6071','6098','3','大理白族自治州','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3038','1','6072','6073','4','大理市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3039','1','6074','6075','4','漾濞彝族自治县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3040','1','6076','6077','4','祥云县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3041','1','6078','6079','4','宾川县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3042','1','6080','6081','4','弥渡县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3043','1','6082','6083','4','南涧彝族自治县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3044','1','6084','6085','4','巍山彝族回族自治县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3045','1','6086','6087','4','永平县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3046','1','6088','6089','4','云龙县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3047','1','6090','6091','4','洱源县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3048','1','6092','6093','4','剑川县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3049','1','6094','6095','4','鹤庆县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3050','1','6096','6097','4','其它区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3051','1','6099','6112','3','德宏傣族景颇族自治州','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3052','1','6100','6101','4','瑞丽市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3053','1','6102','6103','4','潞西市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3054','1','6104','6105','4','梁河县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3055','1','6106','6107','4','盈江县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3056','1','6108','6109','4','陇川县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3057','1','6110','6111','4','其它区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3058','1','6113','6124','3','怒江傈僳族自治州','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3059','1','6114','6115','4','泸水县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3060','1','6116','6117','4','福贡县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3061','1','6118','6119','4','贡山独龙族怒族自治县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3062','1','6120','6121','4','兰坪白族普米族自治县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3063','1','6122','6123','4','其它区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3064','1','6125','6134','3','迪庆藏族自治州','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3065','1','6126','6127','4','香格里拉县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3066','1','6128','6129','4','德钦县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3067','1','6130','6131','4','维西傈僳族自治县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3068','1','6132','6133','4','其它区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3069','1','6136','6311','2','西藏自治区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3070','1','6137','6156','3','拉萨市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3071','1','6138','6139','4','城关区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3072','1','6140','6141','4','林周县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3073','1','6142','6143','4','当雄县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3074','1','6144','6145','4','尼木县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3075','1','6146','6147','4','曲水县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3076','1','6148','6149','4','堆龙德庆县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3077','1','6150','6151','4','达孜县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3078','1','6152','6153','4','墨竹工卡县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3079','1','6154','6155','4','其它区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3080','1','6157','6182','3','昌都地区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3081','1','6158','6159','4','昌都县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3082','1','6160','6161','4','江达县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3083','1','6162','6163','4','贡觉县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3084','1','6164','6165','4','类乌齐县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3085','1','6166','6167','4','丁青县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3086','1','6168','6169','4','察雅县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3087','1','6170','6171','4','八宿县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3088','1','6172','6173','4','左贡县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3089','1','6174','6175','4','芒康县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3090','1','6176','6177','4','洛隆县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3091','1','6178','6179','4','边坝县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3092','1','6180','6181','4','其它区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3093','1','6183','6210','3','山南地区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3094','1','6184','6185','4','乃东县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3095','1','6186','6187','4','扎囊县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3096','1','6188','6189','4','贡嘎县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3097','1','6190','6191','4','桑日县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3098','1','6192','6193','4','琼结县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3099','1','6194','6195','4','曲松县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3100','1','6196','6197','4','措美县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3101','1','6198','6199','4','洛扎县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3102','1','6200','6201','4','加查县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3103','1','6202','6203','4','隆子县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3104','1','6204','6205','4','错那县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3105','1','6206','6207','4','浪卡子县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3106','1','6208','6209','4','其它区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3107','1','6211','6250','3','日喀则地区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3108','1','6212','6213','4','日喀则市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3109','1','6214','6215','4','南木林县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3110','1','6216','6217','4','江孜县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3111','1','6218','6219','4','定日县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3112','1','6220','6221','4','萨迦县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3113','1','6222','6223','4','拉孜县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3114','1','6224','6225','4','昂仁县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3115','1','6226','6227','4','谢通门县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3116','1','6228','6229','4','白朗县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3117','1','6230','6231','4','仁布县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3118','1','6232','6233','4','康马县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3119','1','6234','6235','4','定结县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3120','1','6236','6237','4','仲巴县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3121','1','6238','6239','4','亚东县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3122','1','6240','6241','4','吉隆县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3123','1','6242','6243','4','聂拉木县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3124','1','6244','6245','4','萨嘎县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3125','1','6246','6247','4','岗巴县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3126','1','6248','6249','4','其它区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3127','1','6251','6274','3','那曲地区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3128','1','6252','6253','4','那曲县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3129','1','6254','6255','4','嘉黎县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3130','1','6256','6257','4','比如县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3131','1','6258','6259','4','聂荣县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3132','1','6260','6261','4','安多县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3133','1','6262','6263','4','申扎县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3134','1','6264','6265','4','索县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3135','1','6266','6267','4','班戈县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3136','1','6268','6269','4','巴青县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3137','1','6270','6271','4','尼玛县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3138','1','6272','6273','4','其它区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3139','1','6275','6292','3','阿里地区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3140','1','6276','6277','4','普兰县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3141','1','6278','6279','4','札达县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3142','1','6280','6281','4','噶尔县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3143','1','6282','6283','4','日土县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3144','1','6284','6285','4','革吉县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3145','1','6286','6287','4','改则县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3146','1','6288','6289','4','措勤县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3147','1','6290','6291','4','其它区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3148','1','6293','6310','3','林芝地区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3149','1','6294','6295','4','林芝县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3150','1','6296','6297','4','工布江达县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3151','1','6298','6299','4','米林县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3152','1','6300','6301','4','墨脱县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3153','1','6302','6303','4','波密县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3154','1','6304','6305','4','察隅县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3155','1','6306','6307','4','朗县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3156','1','6308','6309','4','其它区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3157','1','6312','6567','2','陕西省','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3158','1','6313','6342','3','西安市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3159','1','6314','6315','4','新城区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3160','1','6316','6317','4','碑林区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3161','1','6318','6319','4','莲湖区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3162','1','6320','6321','4','灞桥区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3163','1','6322','6323','4','未央区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3164','1','6324','6325','4','雁塔区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3165','1','6326','6327','4','阎良区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3166','1','6328','6329','4','临潼区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3167','1','6330','6331','4','长安区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3168','1','6332','6333','4','蓝田县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3169','1','6334','6335','4','周至县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3170','1','6336','6337','4','户县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3171','1','6338','6339','4','高陵县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3172','1','6340','6341','4','其它区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3173','1','6343','6354','3','铜川市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3174','1','6344','6345','4','王益区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3175','1','6346','6347','4','印台区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3176','1','6348','6349','4','耀州区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3177','1','6350','6351','4','宜君县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3178','1','6352','6353','4','其它区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3179','1','6355','6382','3','宝鸡市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3180','1','6356','6357','4','渭滨区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3181','1','6358','6359','4','金台区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3182','1','6360','6361','4','陈仓区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3183','1','6362','6363','4','凤翔县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3184','1','6364','6365','4','岐山县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3185','1','6366','6367','4','扶风县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3186','1','6368','6369','4','眉县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3187','1','6370','6371','4','陇县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3188','1','6372','6373','4','千阳县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3189','1','6374','6375','4','麟游县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3190','1','6376','6377','4','凤县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3191','1','6378','6379','4','太白县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3192','1','6380','6381','4','其它区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3193','1','6383','6414','3','咸阳市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3194','1','6384','6385','4','秦都区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3195','1','6386','6387','4','杨陵区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3196','1','6388','6389','4','渭城区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3197','1','6390','6391','4','三原县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3198','1','6392','6393','4','泾阳县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3199','1','6394','6395','4','乾县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3200','1','6396','6397','4','礼泉县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3201','1','6398','6399','4','永寿县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3202','1','6400','6401','4','彬县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3203','1','6402','6403','4','长武县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3204','1','6404','6405','4','旬邑县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3205','1','6406','6407','4','淳化县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3206','1','6408','6409','4','武功县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3207','1','6410','6411','4','兴平市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3208','1','6412','6413','4','其它区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3209','1','6415','6440','3','渭南市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3210','1','6416','6417','4','临渭区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3211','1','6418','6419','4','华县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3212','1','6420','6421','4','潼关县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3213','1','6422','6423','4','大荔县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3214','1','6424','6425','4','合阳县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3215','1','6426','6427','4','澄城县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3216','1','6428','6429','4','蒲城县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3217','1','6430','6431','4','白水县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3218','1','6432','6433','4','富平县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3219','1','6434','6435','4','韩城市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3220','1','6436','6437','4','华阴市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3221','1','6438','6439','4','其它区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3222','1','6441','6470','3','延安市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3223','1','6442','6443','4','宝塔区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3224','1','6444','6445','4','延长县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3225','1','6446','6447','4','延川县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3226','1','6448','6449','4','子长县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3227','1','6450','6451','4','安塞县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3228','1','6452','6453','4','志丹县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3229','1','6454','6455','4','吴起县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3230','1','6456','6457','4','甘泉县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3231','1','6458','6459','4','富县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3232','1','6460','6461','4','洛川县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3233','1','6462','6463','4','宜川县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3234','1','6464','6465','4','黄龙县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3235','1','6466','6467','4','黄陵县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3236','1','6468','6469','4','其它区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3237','1','6471','6496','3','汉中市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3238','1','6472','6473','4','汉台区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3239','1','6474','6475','4','南郑县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3240','1','6476','6477','4','城固县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3241','1','6478','6479','4','洋县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3242','1','6480','6481','4','西乡县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3243','1','6482','6483','4','勉县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3244','1','6484','6485','4','宁强县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3245','1','6486','6487','4','略阳县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3246','1','6488','6489','4','镇巴县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3247','1','6490','6491','4','留坝县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3248','1','6492','6493','4','佛坪县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3249','1','6494','6495','4','其它区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3250','1','6497','6524','3','榆林市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3251','1','6498','6499','4','榆阳区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3252','1','6500','6501','4','神木县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3253','1','6502','6503','4','府谷县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3254','1','6504','6505','4','横山县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3255','1','6506','6507','4','靖边县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3256','1','6508','6509','4','定边县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3257','1','6510','6511','4','绥德县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3258','1','6512','6513','4','米脂县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3259','1','6514','6515','4','佳县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3260','1','6516','6517','4','吴堡县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3261','1','6518','6519','4','清涧县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3262','1','6520','6521','4','子洲县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3263','1','6522','6523','4','其它区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3264','1','6525','6548','3','安康市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3265','1','6526','6527','4','汉滨区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3266','1','6528','6529','4','汉阴县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3267','1','6530','6531','4','石泉县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3268','1','6532','6533','4','宁陕县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3269','1','6534','6535','4','紫阳县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3270','1','6536','6537','4','岚皋县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3271','1','6538','6539','4','平利县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3272','1','6540','6541','4','镇坪县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3273','1','6542','6543','4','旬阳县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3274','1','6544','6545','4','白河县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3275','1','6546','6547','4','其它区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3276','1','6549','6566','3','商洛市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3277','1','6550','6551','4','商州区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3278','1','6552','6553','4','洛南县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3279','1','6554','6555','4','丹凤县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3280','1','6556','6557','4','商南县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3281','1','6558','6559','4','山阳县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3282','1','6560','6561','4','镇安县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3283','1','6562','6563','4','柞水县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3284','1','6564','6565','4','其它区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3285','1','6568','6795','2','甘肃省','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3286','1','6569','6588','3','兰州市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3287','1','6570','6571','4','城关区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3288','1','6572','6573','4','七里河区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3289','1','6574','6575','4','西固区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3290','1','6576','6577','4','安宁区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3291','1','6578','6579','4','红古区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3292','1','6580','6581','4','永登县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3293','1','6582','6583','4','皋兰县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3294','1','6584','6585','4','榆中县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3295','1','6586','6587','4','其它区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3296','1','6589','6590','3','嘉峪关市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3297','1','6591','6598','3','金昌市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3298','1','6592','6593','4','金川区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3299','1','6594','6595','4','永昌县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3300','1','6596','6597','4','其它区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3301','1','6599','6612','3','白银市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3302','1','6600','6601','4','白银区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3303','1','6602','6603','4','平川区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3304','1','6604','6605','4','靖远县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3305','1','6606','6607','4','会宁县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3306','1','6608','6609','4','景泰县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3307','1','6610','6611','4','其它区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3308','1','6613','6630','3','天水市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3309','1','6614','6615','4','秦州区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3310','1','6616','6617','4','麦积区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3311','1','6618','6619','4','清水县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3312','1','6620','6621','4','秦安县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3313','1','6622','6623','4','甘谷县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3314','1','6624','6625','4','武山县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3315','1','6626','6627','4','张家川回族自治县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3316','1','6628','6629','4','其它区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3317','1','6631','6642','3','武威市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3318','1','6632','6633','4','凉州区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3319','1','6634','6635','4','民勤县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3320','1','6636','6637','4','古浪县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3321','1','6638','6639','4','天祝藏族自治县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3322','1','6640','6641','4','其它区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3323','1','6643','6658','3','张掖市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3324','1','6644','6645','4','甘州区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3325','1','6646','6647','4','肃南裕固族自治县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3326','1','6648','6649','4','民乐县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3327','1','6650','6651','4','临泽县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3328','1','6652','6653','4','高台县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3329','1','6654','6655','4','山丹县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3330','1','6656','6657','4','其它区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3331','1','6659','6676','3','平凉市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3332','1','6660','6661','4','崆峒区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3333','1','6662','6663','4','泾川县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3334','1','6664','6665','4','灵台县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3335','1','6666','6667','4','崇信县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3336','1','6668','6669','4','华亭县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3337','1','6670','6671','4','庄浪县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3338','1','6672','6673','4','静宁县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3339','1','6674','6675','4','其它区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3340','1','6677','6694','3','酒泉市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3341','1','6678','6679','4','肃州区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3342','1','6680','6681','4','金塔县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3343','1','6682','6683','4','安西县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3344','1','6684','6685','4','肃北蒙古族自治县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3345','1','6686','6687','4','阿克塞哈萨克族自治县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3346','1','6688','6689','4','玉门市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3347','1','6690','6691','4','敦煌市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3348','1','6692','6693','4','其它区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3349','1','6695','6714','3','庆阳市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3350','1','6696','6697','4','西峰区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3351','1','6698','6699','4','庆城县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3352','1','6700','6701','4','环县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3353','1','6702','6703','4','华池县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3354','1','6704','6705','4','合水县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3355','1','6706','6707','4','正宁县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3356','1','6708','6709','4','宁县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3357','1','6710','6711','4','镇原县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3358','1','6712','6713','4','其它区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3359','1','6715','6732','3','定西市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3360','1','6716','6717','4','安定区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3361','1','6718','6719','4','通渭县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3362','1','6720','6721','4','陇西县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3363','1','6722','6723','4','渭源县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3364','1','6724','6725','4','临洮县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3365','1','6726','6727','4','漳县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3366','1','6728','6729','4','岷县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3367','1','6730','6731','4','其它区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3368','1','6733','6754','3','陇南市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3369','1','6734','6735','4','武都区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3370','1','6736','6737','4','成县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3371','1','6738','6739','4','文县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3372','1','6740','6741','4','宕昌县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3373','1','6742','6743','4','康县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3374','1','6744','6745','4','西和县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3375','1','6746','6747','4','礼县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3376','1','6748','6749','4','徽县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3377','1','6750','6751','4','两当县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3378','1','6752','6753','4','其它区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3379','1','6755','6774','3','临夏回族自治州','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3380','1','6756','6757','4','临夏市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3381','1','6758','6759','4','临夏县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3382','1','6760','6761','4','康乐县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3383','1','6762','6763','4','永靖县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3384','1','6764','6765','4','广河县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3385','1','6766','6767','4','和政县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3386','1','6768','6769','4','东乡族自治县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3387','1','6770','6771','4','积石山保安族东乡族撒拉族自治县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3388','1','6772','6773','4','其它区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3389','1','6775','6794','3','甘南藏族自治州','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3390','1','6776','6777','4','合作市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3391','1','6778','6779','4','临潭县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3392','1','6780','6781','4','卓尼县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3393','1','6782','6783','4','舟曲县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3394','1','6784','6785','4','迭部县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3395','1','6786','6787','4','玛曲县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3396','1','6788','6789','4','碌曲县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3397','1','6790','6791','4','夏河县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3398','1','6792','6793','4','其它区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3399','1','6796','6915','2','青海省','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3400','1','6797','6814','3','西宁市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3401','1','6798','6799','4','城东区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3402','1','6800','6801','4','城中区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3403','1','6802','6803','4','城西区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3404','1','6804','6805','4','城北区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3405','1','6806','6807','4','大通回族土族自治县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3406','1','6808','6809','4','湟中县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3407','1','6810','6811','4','湟源县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3408','1','6812','6813','4','其它区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3409','1','6815','6830','3','海东地区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3410','1','6816','6817','4','平安县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3411','1','6818','6819','4','民和回族土族自治县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3412','1','6820','6821','4','乐都县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3413','1','6822','6823','4','互助土族自治县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3414','1','6824','6825','4','化隆回族自治县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3415','1','6826','6827','4','循化撒拉族自治县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3416','1','6828','6829','4','其它区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3417','1','6831','6842','3','海北藏族自治州','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3418','1','6832','6833','4','门源回族自治县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3419','1','6834','6835','4','祁连县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3420','1','6836','6837','4','海晏县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3421','1','6838','6839','4','刚察县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3422','1','6840','6841','4','其它区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3423','1','6843','6854','3','黄南藏族自治州','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3424','1','6844','6845','4','同仁县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3425','1','6846','6847','4','尖扎县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3426','1','6848','6849','4','泽库县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3427','1','6850','6851','4','河南蒙古族自治县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3428','1','6852','6853','4','其它区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3429','1','6855','6868','3','海南藏族自治州','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3430','1','6856','6857','4','共和县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3431','1','6858','6859','4','同德县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3432','1','6860','6861','4','贵德县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3433','1','6862','6863','4','兴海县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3434','1','6864','6865','4','贵南县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3435','1','6866','6867','4','其它区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3436','1','6869','6884','3','果洛藏族自治州','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3437','1','6870','6871','4','玛沁县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3438','1','6872','6873','4','班玛县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3439','1','6874','6875','4','甘德县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3440','1','6876','6877','4','达日县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3441','1','6878','6879','4','久治县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3442','1','6880','6881','4','玛多县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3443','1','6882','6883','4','其它区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3444','1','6885','6900','3','玉树藏族自治州','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3445','1','6886','6887','4','玉树县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3446','1','6888','6889','4','杂多县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3447','1','6890','6891','4','称多县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3448','1','6892','6893','4','治多县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3449','1','6894','6895','4','囊谦县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3450','1','6896','6897','4','曲麻莱县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3451','1','6898','6899','4','其它区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3452','1','6901','6914','3','海西蒙古族藏族自治州','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3453','1','6902','6903','4','格尔木市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3454','1','6904','6905','4','德令哈市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3455','1','6906','6907','4','乌兰县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3456','1','6908','6909','4','都兰县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3457','1','6910','6911','4','天峻县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3458','1','6912','6913','4','其它区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3459','1','6916','6981','2','宁夏回族自治区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3460','1','6917','6932','3','银川市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3461','1','6918','6919','4','兴庆区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3462','1','6920','6921','4','西夏区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3463','1','6922','6923','4','金凤区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3464','1','6924','6925','4','永宁县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3465','1','6926','6927','4','贺兰县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3466','1','6928','6929','4','灵武市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3467','1','6930','6931','4','其它区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3468','1','6933','6942','3','石嘴山市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3469','1','6934','6935','4','大武口区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3470','1','6936','6937','4','惠农区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3471','1','6938','6939','4','平罗县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3472','1','6940','6941','4','其它区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3473','1','6943','6956','3','吴忠市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3474','1','6944','6945','4','利通区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3475','1','6946','6947','4','红寺堡区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3476','1','6948','6949','4','盐池县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3477','1','6950','6951','4','同心县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3478','1','6952','6953','4','青铜峡市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3479','1','6954','6955','4','其它区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3480','1','6957','6970','3','固原市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3481','1','6958','6959','4','原州区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3482','1','6960','6961','4','西吉县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3483','1','6962','6963','4','隆德县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3484','1','6964','6965','4','泾源县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3485','1','6966','6967','4','彭阳县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3486','1','6968','6969','4','其它区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3487','1','6971','6980','3','中卫市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3488','1','6972','6973','4','沙坡头区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3489','1','6974','6975','4','中宁县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3490','1','6976','6977','4','海原县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3491','1','6978','6979','4','其它区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3492','1','6982','7239','2','新疆维吾尔自治区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3493','1','6983','7004','3','乌鲁木齐市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3494','1','6984','6985','4','天山区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3495','1','6986','6987','4','沙依巴克区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3496','1','6988','6989','4','新市区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3497','1','6990','6991','4','水磨沟区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3498','1','6992','6993','4','头屯河区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3499','1','6994','6995','4','达坂城区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3500','1','6996','6997','4','东山区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3501','1','6998','6999','4','米东区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3502','1','7000','7001','4','乌鲁木齐县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3503','1','7002','7003','4','其它区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3504','1','7005','7016','3','克拉玛依市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3505','1','7006','7007','4','独山子区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3506','1','7008','7009','4','克拉玛依区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3507','1','7010','7011','4','白碱滩区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3508','1','7012','7013','4','乌尔禾区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3509','1','7014','7015','4','其它区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3510','1','7017','7026','3','吐鲁番地区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3511','1','7018','7019','4','吐鲁番市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3512','1','7020','7021','4','鄯善县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3513','1','7022','7023','4','托克逊县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3514','1','7024','7025','4','其它区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3515','1','7027','7036','3','哈密地区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3516','1','7028','7029','4','哈密市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3517','1','7030','7031','4','巴里坤哈萨克自治县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3518','1','7032','7033','4','伊吾县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3519','1','7034','7035','4','其它区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3520','1','7037','7056','3','昌吉回族自治州','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3521','1','7038','7039','4','昌吉市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3522','1','7040','7041','4','阜康市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3523','1','7042','7043','4','米泉市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3524','1','7044','7045','4','呼图壁县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3525','1','7046','7047','4','玛纳斯县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3526','1','7048','7049','4','奇台县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3527','1','7050','7051','4','吉木萨尔县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3528','1','7052','7053','4','木垒哈萨克自治县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3529','1','7054','7055','4','其它区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3530','1','7057','7066','3','博尔塔拉蒙古自治州','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3531','1','7058','7059','4','博乐市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3532','1','7060','7061','4','精河县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3533','1','7062','7063','4','温泉县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3534','1','7064','7065','4','其它区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3535','1','7067','7088','3','巴音郭楞蒙古自治州','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3536','1','7068','7069','4','库尔勒市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3537','1','7070','7071','4','轮台县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3538','1','7072','7073','4','尉犁县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3539','1','7074','7075','4','若羌县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3540','1','7076','7077','4','且末县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3541','1','7078','7079','4','焉耆回族自治县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3542','1','7080','7081','4','和静县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3543','1','7082','7083','4','和硕县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3544','1','7084','7085','4','博湖县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3545','1','7086','7087','4','其它区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3546','1','7089','7110','3','阿克苏地区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3547','1','7090','7091','4','阿克苏市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3548','1','7092','7093','4','温宿县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3549','1','7094','7095','4','库车县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3550','1','7096','7097','4','沙雅县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3551','1','7098','7099','4','新和县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3552','1','7100','7101','4','拜城县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3553','1','7102','7103','4','乌什县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3554','1','7104','7105','4','阿瓦提县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3555','1','7106','7107','4','柯坪县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3556','1','7108','7109','4','其它区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3557','1','7111','7122','3','克孜勒苏柯尔克孜自治州','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3558','1','7112','7113','4','阿图什市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3559','1','7114','7115','4','阿克陶县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3560','1','7116','7117','4','阿合奇县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3561','1','7118','7119','4','乌恰县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3562','1','7120','7121','4','其它区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3563','1','7123','7150','3','喀什地区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3564','1','7124','7125','4','喀什市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3565','1','7126','7127','4','疏附县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3566','1','7128','7129','4','疏勒县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3567','1','7130','7131','4','英吉沙县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3568','1','7132','7133','4','泽普县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3569','1','7134','7135','4','莎车县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3570','1','7136','7137','4','叶城县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3571','1','7138','7139','4','麦盖提县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3572','1','7140','7141','4','岳普湖县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3573','1','7142','7143','4','伽师县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3574','1','7144','7145','4','巴楚县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3575','1','7146','7147','4','塔什库尔干塔吉克自治县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3576','1','7148','7149','4','其它区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3577','1','7151','7170','3','和田地区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3578','1','7152','7153','4','和田市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3579','1','7154','7155','4','和田县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3580','1','7156','7157','4','墨玉县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3581','1','7158','7159','4','皮山县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3582','1','7160','7161','4','洛浦县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3583','1','7162','7163','4','策勒县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3584','1','7164','7165','4','于田县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3585','1','7166','7167','4','民丰县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3586','1','7168','7169','4','其它区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3587','1','7171','7194','3','伊犁哈萨克自治州','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3588','1','7172','7173','4','伊宁市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3589','1','7174','7175','4','奎屯市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3590','1','7176','7177','4','伊宁县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3591','1','7178','7179','4','察布查尔锡伯自治县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3592','1','7180','7181','4','霍城县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3593','1','7182','7183','4','巩留县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3594','1','7184','7185','4','新源县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3595','1','7186','7187','4','昭苏县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3596','1','7188','7189','4','特克斯县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3597','1','7190','7191','4','尼勒克县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3598','1','7192','7193','4','其它区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3599','1','7195','7212','3','塔城地区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3600','1','7196','7197','4','塔城市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3601','1','7198','7199','4','乌苏市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3602','1','7200','7201','4','额敏县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3603','1','7202','7203','4','沙湾县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3604','1','7204','7205','4','托里县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3605','1','7206','7207','4','裕民县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3606','1','7208','7209','4','和布克赛尔蒙古自治县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3607','1','7210','7211','4','其它区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3608','1','7213','7238','3','阿勒泰地区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3609','1','7214','7215','4','阿勒泰市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3610','1','7216','7217','4','布尔津县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3611','1','7218','7219','4','富蕴县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3612','1','7220','7221','4','福海县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3613','1','7222','7223','4','哈巴河县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3614','1','7224','7225','4','青河县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3615','1','7226','7227','4','吉木乃县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3616','1','7228','7229','4','其它区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3617','1','7230','7231','4','石河子市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3618','1','7232','7233','4','阿拉尔市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3619','1','7234','7235','4','图木舒克市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3620','1','7236','7237','4','五家渠市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3621','1','7240','7395','2','台湾省','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3622','1','7241','7268','3','台北市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3623','1','7242','7243','4','中正区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3624','1','7244','7245','4','大同区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3625','1','7246','7247','4','中山区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3626','1','7248','7249','4','松山区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3627','1','7250','7251','4','大安区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3628','1','7252','7253','4','万华区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3629','1','7254','7255','4','信义区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3630','1','7256','7257','4','士林区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3631','1','7258','7259','4','北投区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3632','1','7260','7261','4','内湖区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3633','1','7262','7263','4','南港区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3634','1','7264','7265','4','文山区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3635','1','7266','7267','4','其它区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3636','1','7269','7294','3','高雄市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3637','1','7270','7271','4','新兴区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3638','1','7272','7273','4','前金区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3639','1','7274','7275','4','芩雅区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3640','1','7276','7277','4','盐埕区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3641','1','7278','7279','4','鼓山区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3642','1','7280','7281','4','旗津区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3643','1','7282','7283','4','前镇区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3644','1','7284','7285','4','三民区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3645','1','7286','7287','4','左营区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3646','1','7288','7289','4','楠梓区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3647','1','7290','7291','4','小港区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3648','1','7292','7293','4','其它区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3649','1','7295','7310','3','台南市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3650','1','7296','7297','4','中西区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3651','1','7298','7299','4','东区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3652','1','7300','7301','4','南区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3653','1','7302','7303','4','北区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3654','1','7304','7305','4','安平区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3655','1','7306','7307','4','安南区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3656','1','7308','7309','4','其它区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3657','1','7311','7330','3','台中市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3658','1','7312','7313','4','中区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3659','1','7314','7315','4','东区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3660','1','7316','7317','4','南区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3661','1','7318','7319','4','西区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3662','1','7320','7321','4','北区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3663','1','7322','7323','4','北屯区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3664','1','7324','7325','4','西屯区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3665','1','7326','7327','4','南屯区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3666','1','7328','7329','4','其它区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3667','1','7331','7332','3','金门县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3668','1','7333','7334','3','南投县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3669','1','7335','7352','3','基隆市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3670','1','7336','7337','4','仁爱区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3671','1','7338','7339','4','信义区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3672','1','7340','7341','4','中正区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3673','1','7342','7343','4','中山区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3674','1','7344','7345','4','安乐区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3675','1','7346','7347','4','暖暖区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3676','1','7348','7349','4','七堵区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3677','1','7350','7351','4','其它区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3678','1','7353','7362','3','新竹市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3679','1','7354','7355','4','东区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3680','1','7356','7357','4','北区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3681','1','7358','7359','4','香山区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3682','1','7360','7361','4','其它区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3683','1','7363','7370','3','嘉义市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3684','1','7364','7365','4','东区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3685','1','7366','7367','4','西区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3686','1','7368','7369','4','其它区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3687','1','7371','7372','3','新北市','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3688','1','7373','7374','3','宜兰县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3689','1','7375','7376','3','新竹县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3690','1','7377','7378','3','桃园县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3691','1','7379','7380','3','苗栗县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3692','1','7381','7382','3','彰化县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3693','1','7383','7384','3','嘉义县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3694','1','7385','7386','3','云林县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3695','1','7387','7388','3','屏东县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3696','1','7389','7390','3','台东县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3697','1','7391','7392','3','花莲县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3698','1','7393','7394','3','澎湖县','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3699','1','7396','7439','2','香港特别行政区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3700','1','7397','7406','3','香港岛','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3701','1','7398','7399','4','中西区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3702','1','7400','7401','4','湾仔','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3703','1','7402','7403','4','东区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3704','1','7404','7405','4','南区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3705','1','7407','7418','3','九龙','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3706','1','7408','7409','4','九龙城区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3707','1','7410','7411','4','油尖旺区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3708','1','7412','7413','4','深水埗区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3709','1','7414','7415','4','黄大仙区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3710','1','7416','7417','4','观塘区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3711','1','7419','7438','3','新界','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3712','1','7420','7421','4','北区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3713','1','7422','7423','4','大埔区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3714','1','7424','7425','4','沙田区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3715','1','7426','7427','4','西贡区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3716','1','7428','7429','4','元朗区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3717','1','7430','7431','4','屯门区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3718','1','7432','7433','4','荃湾区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3719','1','7434','7435','4','葵青区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3720','1','7436','7437','4','离岛区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3721','1','7440','7445','2','澳门特别行政区','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3722','1','7441','7442','3','澳门半岛','1');
INSERT INTO `provinces` (`id`,`root`,`lft`,`rgt`,`level`,`name`,`status`) VALUES
('3723','1','7443','7444','3','离岛','1');



-- -------------------------------------------
-- TABLE DATA settings
-- -------------------------------------------
INSERT INTO `settings` (`id`,`category`,`key`,`value`) VALUES
('1','site','watermark','a:5:{s:6:\"closed\";s:1:\"1\";s:10:\"proportion\";s:0:\"\";s:12:\"right_margin\";s:0:\"\";s:13:\"bottom_margin\";s:0:\"\";s:4:\"file\";N;}');



-- -------------------------------------------
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
COMMIT;
-- -------------------------------------------
-- -------------------------------------------
-- END BACKUP
-- -------------------------------------------
