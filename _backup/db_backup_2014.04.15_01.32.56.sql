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
-- TABLE `contact`
-- -------------------------------------------
DROP TABLE IF EXISTS `contact`;
CREATE TABLE IF NOT EXISTS `contact` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL,
  `title` varchar(255) NOT NULL,
  `phone` varchar(30) NOT NULL,
  `email` varchar(255) NOT NULL,
  `content` text NOT NULL,
  `ip` varchar(255) NOT NULL,
  `updated_at` int(10) unsigned NOT NULL,
  `created_at` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='留言';

-- -------------------------------------------
-- TABLE `link`
-- -------------------------------------------
DROP TABLE IF EXISTS `link`;
CREATE TABLE IF NOT EXISTS `link` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pid` int(10) unsigned NOT NULL,
  `title` varchar(30) NOT NULL COMMENT '标题',
  `url` varchar(255) NOT NULL COMMENT '链接',
  `target` tinyint(1) unsigned NOT NULL COMMENT '是否新窗口打开',
  `type` int(1) unsigned NOT NULL COMMENT '类型',
  `power` tinyint(3) unsigned NOT NULL COMMENT '排序',
  `visible` tinyint(1) NOT NULL COMMENT '是否显示',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COMMENT='链接表';

-- -------------------------------------------
-- TABLE `post`
-- -------------------------------------------
DROP TABLE IF EXISTS `post`;
CREATE TABLE IF NOT EXISTS `post` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `category_id` int(10) unsigned NOT NULL COMMENT '分类',
  `model` varchar(10) NOT NULL COMMENT '所属模型',
  `title` varchar(128) NOT NULL COMMENT '标题',
  `alias` varchar(128) NOT NULL COMMENT '别名',
  `image_name` varchar(255) DEFAULT NULL COMMENT '图片',
  `file_name` varchar(255) NOT NULL DEFAULT '' COMMENT '文件',
  `tinyint1` tinyint(1) NOT NULL DEFAULT '0',
  `int10` int(10) unsigned NOT NULL DEFAULT '0',
  `char32` char(32) NOT NULL DEFAULT '',
  `varchar30` varchar(30) NOT NULL DEFAULT '',
  `varchar50` varchar(50) NOT NULL DEFAULT '',
  `varchar100` varchar(100) NOT NULL DEFAULT '',
  `varchar128` varchar(128) NOT NULL DEFAULT '',
  `content` text COMMENT '内容',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '状态',
  `weight` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  `view` varchar(30) NOT NULL COMMENT '视图文件',
  `created_at` int(10) unsigned NOT NULL DEFAULT '0',
  `updated_at` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `alias` (`alias`)
) ENGINE=InnoDB AUTO_INCREMENT=98 DEFAULT CHARSET=utf8 COMMENT='单篇文章';

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
INSERT INTO `link` (`id`,`pid`,`title`,`url`,`target`,`type`,`power`,`visible`) VALUES
('1','0','首页','/','1','1','0','1');
INSERT INTO `link` (`id`,`pid`,`title`,`url`,`target`,`type`,`power`,`visible`) VALUES
('2','0','关于我们','/c/2','1','1','0','1');
INSERT INTO `link` (`id`,`pid`,`title`,`url`,`target`,`type`,`power`,`visible`) VALUES
('3','0','最新动态','/c/6','0','1','0','1');
INSERT INTO `link` (`id`,`pid`,`title`,`url`,`target`,`type`,`power`,`visible`) VALUES
('4','0','众谋作品','/c/8','0','1','0','1');
INSERT INTO `link` (`id`,`pid`,`title`,`url`,`target`,`type`,`power`,`visible`) VALUES
('5','0','专业设备','/site/page/view/equipment','0','1','0','1');
INSERT INTO `link` (`id`,`pid`,`title`,`url`,`target`,`type`,`power`,`visible`) VALUES
('6','0','服务客户','/c/5','0','1','0','1');
INSERT INTO `link` (`id`,`pid`,`title`,`url`,`target`,`type`,`power`,`visible`) VALUES
('7','0','联系我们','/site/page/view/contact','0','1','0','1');



-- -------------------------------------------
-- TABLE DATA post
-- -------------------------------------------
INSERT INTO `post` (`id`,`category_id`,`model`,`title`,`alias`,`image_name`,`file_name`,`tinyint1`,`int10`,`char32`,`varchar30`,`varchar50`,`varchar100`,`varchar128`,`content`,`status`,`weight`,`view`,`created_at`,`updated_at`) VALUES
('1','1','post','企业文化','8e6b27f095a33a3d8474f6937ddd896f','','','0','0','','','','','企业文化','<p>
      <br>
	<span   style=\"font-size: 18px; \"><strong>企业使命：</strong>凝聚智慧，慧就健康<br>
	<br>
	<strong>企业团队文化：</strong>交流、学习、调整<br>
	<br>
	<strong>企业行动文化：</strong>大道行于至简，卓越源于执着<br>
	<br>
	<strong>企业品质文化：</strong>只与卓越为伍</span></p>','1','100','post','1387730061','1394443703');
INSERT INTO `post` (`id`,`category_id`,`model`,`title`,`alias`,`image_name`,`file_name`,`tinyint1`,`int10`,`char32`,`varchar30`,`varchar50`,`varchar100`,`varchar128`,`content`,`status`,`weight`,`view`,`created_at`,`updated_at`) VALUES
('3','1','post','集团介绍','824914af710980d176e34ce1707145a8','','','0','0','','','','','广东博士俱乐部集团简介','<p>
	<span  style=\"font-size: 16px; \">    广东博士俱乐部集团是全球性的博士资源整合运营机构。秉承“大道行于至简，卓越源于执着”的企业文化，以“凝聚智慧、慧就健康”为企业使命，充分凝聚<st1>国内外博士、院士的智慧，整合高等院校、科研院所、科技类社会组织等资源，在区域、行业、企业建立博士服务站和人才驿站，把广大科技工作者的创新智慧凝聚到实施创新驱动发展战略中，为区域、行业、企事业单位、社会组织等提供人才、科技、健康、文化、生态等专业服务。</st1></span></p><p>
	<span  style=\"font-size: 16px; \"><st1><br>
	</st1></span></p><p>
	<st1><span  style=\"font-size: 16px; \">    广东博士俱乐部集团与广州市科协共建了广州市科技创新联盟、广州市科技类社会组织孵化培育基地；发起成立了广东健康产业促进会、广州市科技类社会组织服务中心两个社团组织；投资兴建了广州市科技类社会组织孵化培育基地交流中心、广东博士长盛谷温泉养生基地。</span></st1></p><p>
	<st1><span  style=\"font-size: 16px; \"><br>
	</span></st1></p><p>
	<st1><span  style=\"font-size: 16px; \">    广东博士俱乐部集团将紧贴时代脉搏，抓住实施创新驱动发展战略的新机遇，在促进科技创新与经济社会发展深度融合中发挥应有的作用。</span></st1></p>','1','99','post','1387811687','1395105734');
INSERT INTO `post` (`id`,`category_id`,`model`,`title`,`alias`,`image_name`,`file_name`,`tinyint1`,`int10`,`char32`,`varchar30`,`varchar50`,`varchar100`,`varchar128`,`content`,`status`,`weight`,`view`,`created_at`,`updated_at`) VALUES
('4','26','project','综合服务','5be3e669670046bc00fdf944f399de4b','d88a31b261506b888d3ea3c765b4cb34.jpg','','0','0','','','','','一、科技类社会组织服务
文秘服务：代办注册、代办变更和年检服务；前台秘书服务：为入孵协会提供收发传真、代联系收发件服务、联系停车位服务、代购办公用品服务等行政服务；二、财税专业服务
财务专业服务：...','<p><strong><span   style=\"font-size: 16px; \">一、科技类社会组织服务</span></strong></p><ul><li><span   style=\"font-size: 16px; \">文秘服务：代办注册、代办变更和年检服务；</span></li><li><span   style=\"font-size: 16px; \">前台秘书服务：为入孵协会提供收发传真、代联系收发件服务、联系停车位服务、代购办公用品服务等行政服务；</span></li></ul><p><strong><span   style=\"font-size: 16px; \">二、财税专业服务</span></strong></p><ul><li><span   style=\"font-size: 16px; \">财务专业服务：代理记帐、代办年检；审查企业会计报表，出具审计报告；验证企业资本，出具验资报告；办理企业合并、分立、清算事宜中的审计业务，出具有关的报告等；</span></li><li><span   style=\"font-size: 16px; \">项目可行性研究：包括企业股份制改造、上市、企业兼并、重组的评价、论证及策划；</span></li><li><span   style=\"font-size: 16px; \">税务专业服务：税务咨询（顾问）、税收筹划、减免退税申报、企业所得税汇算清缴、税前弥补亏损和财产损失鉴证及其他税务服务并出具有关的报告等；</span></li></ul><p><strong><span   style=\"font-size: 16px; \">三、资产评估专业服务</span></strong></p><ul><li><span   style=\"font-size: 16px; \">整体资产评估：包括企业股份制改造，企业兼并、中外合资、合作、投资入股、产权转让、重组、清算等；</span></li><li><span   style=\"font-size: 16px; \">单项资产评估：包括各类房屋建筑物、机器设备、流动资产、在建工程、土地使用权及专利权、商标、商誉等无形资产的评估，为合资、合作、投资入股、产权转让、抵押、招商、融资、保险、拍卖、清算、租赁、产权纠纷、协助法院办案提供相应的价值依据；</span></li><li><span   style=\"font-size: 16px; \">与评估相关的其他咨询业务、市场调查及预测服务等；</span></li></ul><p><strong><span   style=\"font-size: 16px; \">四、项目管理服务</span></strong></p><ul><li><span   style=\"font-size: 16px; \">项目咨询、申报、实施、结题验收等服务。</span></li></ul><p><strong><span   style=\"font-size: 16px; \">五、高新企业申报服务</span></strong></p><ul><li><span   style=\"font-size: 16px; \">高新技术企业认定服务（含复审）：包括研发费用专项审计、加计扣除专项审计、高新技术企业申报材料编制；</span></li></ul><p style=\"text-align: center; \">
	<img width=\"298\" height=\"392\" src=\"/upload/images/b08c5c87fb08cb2ef6b9909e45f6987f.jpg\" style=\"text-align: center; \"></p>','10','100','news','1387897426','1394761554');
INSERT INTO `post` (`id`,`category_id`,`model`,`title`,`alias`,`image_name`,`file_name`,`tinyint1`,`int10`,`char32`,`varchar30`,`varchar50`,`varchar100`,`varchar128`,`content`,`status`,`weight`,`view`,`created_at`,`updated_at`) VALUES
('6','8','post','集团总部','b195c3ac9d2dfad82638478e66fb67f0','','','0','0','','','','','广东博士俱乐部集团广州总部','<p><br>
邮箱：info@gdphd.com
	<br>
	电话：（020）86676226 
	<br>
			传真：（020）86676069
	<br>
			地址：广州市越秀区环市中路205号恒生大厦B座13楼
</p>
<center><img src=\"http://www.gdphd.com/attachment/core/page/2012_12/26_16/64376eb79e779593.jpg.cthumb.jpg\"></center>','1','99','post','1387899421','1391761061');
INSERT INTO `post` (`id`,`category_id`,`model`,`title`,`alias`,`image_name`,`file_name`,`tinyint1`,`int10`,`char32`,`varchar30`,`varchar50`,`varchar100`,`varchar128`,`content`,`status`,`weight`,`view`,`created_at`,`updated_at`) VALUES
('7','8','post','长盛谷养生基地','3143f2b826d51f3744ab7636815c32b3','','','0','0','','','','','广东博士俱乐部长盛谷温泉养生基地','<p>
	<br>
	邮箱：info@relaxvalley.com
	<br>
	电话：（0763）4638188 
	<br>
			传真：（0763）4638348
	<br>
			地址：广东省清远市佛冈县汤塘镇黄花路口直入300米</p><center><p><img src=\"/upload/images/02e4cc37da3e1f76972c64027a5da643.jpg\" alt=\"\"></p></center>','1','100','post','1387899539','1394792172');
INSERT INTO `post` (`id`,`category_id`,`model`,`title`,`alias`,`image_name`,`file_name`,`tinyint1`,`int10`,`char32`,`varchar30`,`varchar50`,`varchar100`,`varchar128`,`content`,`status`,`weight`,`view`,`created_at`,`updated_at`) VALUES
('8','10','news','中国科协系统领导莅临广东博士俱乐部考察调研','f525ea22ce02391a49bccd02c14dfac0','9a252e5266bbdf7073eade1c7cddd81b.jpg','','0','0','','','','','2012年4月26日，中国科学技术协会组织人事部王慧梅副部长一行，在广东省科学技术协会组织人事部冯日光部长、广州市科学技术协会杨晓副主席的陪同下莅临广东博士俱乐部考察调研，并与博士俱乐部及博士会员代表...','<p>2012年4月26日，中国科学技术协会组织人事部王慧梅副部长一行，在广东省科学技术协会组织人事部冯日光部长、广州市科学技术协会杨晓副主席的陪同下莅临广东博士俱乐部考察调研，并与博士俱乐部及博士会员代表共20余人进行了座谈。</p><p>  
座谈会由广东博士俱乐部集团总裁助理赵根文先生主持，博士俱乐部集团常务副总裁刘著明先生做了详细的工作汇报，集团总裁冯德平先生就博士集团未来发展规划做了介绍。</p><p>  
中科协组织人事部副部长王慧梅女士及市科协副主席杨晓先生在座谈会上就如何做好发挥科协人才优势、共促广东转型升级及科技人才服务工作做了广泛深入的探讨，几位博士代表也从自己的角度谈了各自的看法。</p><p>  
此次座谈会，俱乐部领导与科协新老朋友汇聚一堂，进行了亲切友好的交谈。科协领导就如何做好企业服务、科技人才服务以及促进和推动科技发展提供了意见和建议。</p><p>  会议结束后，参加会议的各位领导在交流中心合影留念。此次指导活动于22点结束。</p><p style=\"text-align: center;\"><img src=\"/upload/images/9a252e5266bbdf7073eade1c7cddd81b.jpg\"></p><p style=\"text-align: center;\"></p><p style=\"text-align: center;\"><img src=\"/upload/images/c2b8c2c726315f7449ac329662a3b1c6.jpg\"></p><p style=\"text-align: center;\"></p><p style=\"text-align: center;\"><img src=\"/upload/images/5c3e1c8ef2882748db40ba0cab4e92cc.jpg\"></p><p style=\"text-align: center;\"></p><p style=\"text-align: center;\"><img src=\"/upload/images/e9cd827037efc769a0a7de0f86b42d84.jpg\"></p>','1','100','news','1388064806','1389340650');
INSERT INTO `post` (`id`,`category_id`,`model`,`title`,`alias`,`image_name`,`file_name`,`tinyint1`,`int10`,`char32`,`varchar30`,`varchar50`,`varchar100`,`varchar128`,`content`,`status`,`weight`,`view`,`created_at`,`updated_at`) VALUES
('9','10','news','广州成立全国首家科技类社会组织孵化培育基地','b982f1c7a27254ee4946ff53dc463dc9','d6f9f8e6e6c5651f7d4db42ebbf97d7e.jpg','','0','0','','','','','       2012年12月27日上午，我国首家科技类社会组织孵化培育基地正式成立。基地揭牌仪式在恒生大厦举行。       广州市科技类社会组织孵化培育基地（下称“孵化培育基地”）是在广州市科学技...','<p>       2012年12月27日上午，我国首家科技类社会组织孵化培育基地正式成立。基地揭牌仪式在恒生大厦举行。</p><p>       广州市科技类社会组织孵化培育基地（下称“孵化培育基地”）是在广州市科学技术协会指导下成立的，由广州市学会学研究会、广州市科技创新联盟、广东博士俱乐部有限公司具体承办和运营管理的综合办公、联合协作、资源整合、项目带动和网络延伸等集约化综合服务平台。基地主要以实现社会组织良性发展的集聚效应、经济效应和示范效应为目的而建立的科技类社会组织孵化培育平台，以优化资源配置、推动组织发展、激发创新活力为宗旨，通过提供基础设施与服务，整合社会资源，实现资源、信息互通，优势互补，构建科技类社会组织的培训指导、孵化扶持、管理服务、咨询代理等一站式服务体系，解决科技类社会组织在发展过程中遇到的场地、资金、项目和管理等难题，帮助社会组织成长发展。基地也具备“科技集市”功能，通过实物、论文、电子等方式，展示学会组织的科研成果。同时，基地也是科技类社会组织之家，通过定期召集相关学会举办联谊活动、学术交流、科技成果展示、科普宣传和科技服务、党建工作服务等，为入驻单位搭建多元化的交流平台。基地为入驻会员单位提供办公卡座、无线宽带接入、前台秘书服务、物业管理服务、会客区接待、党建活动以及会员之家学术交流、联谊活动等免费服务。也可以根据会员单位需求，提供其他增值服务项目，比如策划学术交流、科技论坛、科普宣传、科技成果推广等活动，洽谈跟进科技服务业务，代理知识产权和专利申报，网站制作建设和托管，专业财务管理等。另外基地还将为具备资格的科技类社会组织提供协助承接政府职能转移，协助科技类社会组织建立相关行业领域的标准等高端服务。</p><p>       进入基地的条件：广州市科协团体会员可自动获得“孵化基地”的会员单位资格；其他科技类社会组织须提出入会申请，经过孵化培育基地管理办公室登记后，经管理委员会审批同意后成为“孵化培育基地”会员。所有会员单位均可优先享受“孵化培育基地”免费提供的基础服务。有志向成立科技类社会组织的个人或者团体也可以向孵化培育基地请求支持，基地可以给予业务指导等服务。科技类社会团体不同于其他社团，它有同行学术共同体的自然禀赋，有人才评价、项目评价和科技评价等第三方公立的属性，有科学道德学风建设自律的职责，但是并不意味着有这个能力。禀赋是有的，能力是需要培养的。所以通过孵化培育基地，重点培养科技类社会组织服务创新、服务政府和服务社会、服务科技工作者以及自身发展的能力。</p><p style=\"text-align: center;\"><img src=\"/upload/images/d6f9f8e6e6c5651f7d4db42ebbf97d7e.jpg\"></p><p style=\"text-align: center;\">科技类社会组织孵化培育基地揭牌仪式合影</p><p style=\"text-align: center;\"><img src=\"/upload/images/473e19b184b471f4e7a724eecef25d99.jpg\"></p><p style=\"text-align: center;\">市科协冯元书记发表讲话</p><p style=\"text-align: center;\"><img src=\"/upload/images/e2a723d090aa02c16e1224238afbc905.jpg\"></p><p style=\"text-align: center;\">孵化培育基地管理方与学会代表签署孵化培育基地入会协议书</p><p style=\"text-align: center;\"><img src=\"/upload/images/eb0d45a4030160a2af100b72100e15a1.jpg\"></p><p style=\"text-align: center;\">参观科技类社会组织孵化培育基地党员活动室</p><p style=\"text-align: center;\"><img src=\"/upload/images/21e470e134a800c1cdde617f3e3eb10e.jpg\"></p><p style=\"text-align: center;\">参观孵化培育基地</p><p style=\"text-align: center;\"><img src=\"/upload/images/9c8a0c840268c505b99b11a43bee46cf.jpg\"></p><p style=\"text-align: center;\">科协学会学术部工作会议</p><p style=\"text-align: center;\"><img src=\"/upload/images/4410bfb2e945dddfc1a7325408ca153b.jpg\"></p><p style=\"text-align: center;\">学会代表提问</p>','1','100','news','1388067552','1389340315');
INSERT INTO `post` (`id`,`category_id`,`model`,`title`,`alias`,`image_name`,`file_name`,`tinyint1`,`int10`,`char32`,`varchar30`,`varchar50`,`varchar100`,`varchar128`,`content`,`status`,`weight`,`view`,`created_at`,`updated_at`) VALUES
('10','11','news','关于推进人才集聚工程的实施意见','80523be8892752bca600f544d52a3e03','62ae9d6352aa50d9c6815705856d63f1.jpg','','0','0','','','','','
	    为深入贯彻科学发展观，全面落实省第十一次党代会、市第十次党代会精神，根据《中共广州市委、广州市人民政府关于全面推进新型城市化发展的决定》，就推进人才集聚工程（简称“633”人才工程），提...','<p>
	    为深入贯彻科学发展观，全面落实省第十一次党代会、市第十次党代会精神，根据《中共广州市委、广州市人民政府关于全面推进新型城市化发展的决定》，就推进人才集聚工程（简称“633”人才工程），提出以下实施意见。</p><p align=\"left\">
	　　一、总体目标</p><p align=\"left\">
	　　1.目标。2012年起5年内，大力实施“产业提升、科技创新、城乡一体、文化引领、民生幸福、国际交流”六大人才行动计划，着力构建“交流培养、创新创业、服务保障”三大人才开发支撑体系，实现“重点引进和培养高层次人才达到2000名左右，全市大专以上学历人才资源总量达到320万名左右，人才贡献率达到40%”的三大人才发展目标，初步把广州建设成为辐射华南、服务全国、连通世界的“国际人才港”，为人才强市和新型城市化发展提供坚实的人才保证和智力支持。</p><p align=\"left\">
	　　二、实施六大人才行动计划</p><p align=\"left\">
	　　（一）产业提升人才行动计划。围绕发展战略性主导产业，以提升产业竞争力为核心，重点培养一批具有开拓创新精神和市场拓展引领能力的优秀企业家，大力吸引培养一批产业结构优化升级紧缺的专业技术人才，着力打造一支门类齐全、技艺精湛的高技能人才队伍，实施如下重点项目：</p><p align=\"left\">
	　　2.战略性主导产业紧缺人才开发项目。5年内市、区（县级市）两级在战略性主导产业领域重点引进和培养1万名左右具有博士、硕士学位的企业紧缺人才。对战略性主导产业领域企业引进的紧缺人才，分2年给予政府安家补助；对战略性主导产业领域企业现有的紧缺人才，5年内享受政府薪酬补贴。研究制定战略性主导产业领域紧缺人才目录发布制度，定期向社会公布。（牵头单位：市发展改革委，配合单位：市委组织部、市人力资源和社会保障局，各区、县级市）</p><p align=\"left\">
	　　3.羊城企业家培养项目。加强市管企业领导人员队伍建设，5年内重点引进100名市管企业中高级经营管理人才，选拔100名正职后备人才、200名副职后备人才，培养100名优秀企业家。（牵头单位：市委组织部，配合单位：市国资委）</p><p align=\"left\">
	　　4.民营企业家素质提升项目。组织开展民营骨干企业高层管理人员轮训，5年内市、区（县级市）两级重点支持300名经营管理领军人才赴境外培训，1000名经营管理团队核心人才参加国内著名高校专题研修，3000名经营管理专业技术人才参加本地业务能力培训，对参加培训的人员给予一定比例的政府培训补贴。（牵头单位：市经贸委，配合单位：市人力资源和社会保障局、市工商联，各区、县级市）</p><p align=\"left\">
	　　5.高技能人才精工项目。5年内市、区（县级市）两级重点评选资助200名技能突出人才、2000名技能重点人才和10000名产业急需青年高技能人才，鼓励并资助250名技能型人才出国（境）培训。对于技能突出人才和重点人才5年内享受政府薪酬补贴。产业急需青年高技能人才，上岗后给予一次性奖励。加强技能大师工作室建设，发挥工艺创新、带徒传技作用。对新设立的技能大师工作室，由市财政给予一次性资助；对技能大师工作室技艺传承人在聘期内给予岗位津贴。（牵头单位：市人力资源和社会保障局，配合单位：市教育局，各区、县级市）</p><p align=\"left\">
	　　6.金融高级人才开发项目。围绕我市建设区域金融中心的目标任务，5年内重点引进30名金融高级管理人才和50名金融高级专业人才，跟踪培养300名金融骨干人才。（牵头单位：市金融办，配合单位：市发展改革委、市人力资源和社会保障局，各区、县级市）</p><p align=\"left\">
	　　7.专业技术人才知识更新项目。5年内重点培训15万名紧跟科技发展前沿、创新能力强的中高级紧缺专业技术人才，重点扶持50个市级示范性高级研修班和50场次知识更新名家讲座，建设一批市级示范性继续教育基地。（牵头单位：市人力资源和社会保障局，配合单位：各区、县级市）</p><p align=\"left\">
	　　8.“赢在广州”大学生创业扶持项目。5年内重点扶持100个左右具有发展前景的创业项目，培养产生100名“大学生创业能手”，在登记注册、启动资金、贷款贴息等方面给予扶持。（牵头单位：市人力资源和社会保障局，配合单位：市工商局、市金融办、团市委，各区、县级市）</p><p align=\"left\">
	　　（二）科技创新人才行动计划。围绕加快建设国家创新型城市，突出培养造就创新型科技人才，大力引进科研创新团队和领军人才来穗发展，大力开发青年英才，实施如下重点项目：</p><p align=\"left\">
	　　9.“百人计划”拓展项目。深入实施“创新创业领军人才百人计划”，探索设立“百人计划”团队项目、创新人才短期项目、青年项目和外国专家项目。5年内重点引进扶持200名左右能够突破关键技术、发展高新技术产业、带动新兴学科的创新创业领军人才。（牵头单位：市委组织部，配合单位：市科技和信息化局、市人力资源和社会保障局）</p><p align=\"left\">
	　　10.“羊城学者”特聘岗位项目。根据我市战略性主导产业、重点学科和公共管理领域建设发展需要，面向全市高校、科研机构和企事业单位择优设立50个“羊城学者”特聘岗位，遴选中青年优秀学术人才、技术研发尖子，加快培养造就具有国际先进、国内领先水平的学科带头人、科技领军人才，促进学科专业快速发展、企业自主创新和产学研结合。（牵头单位：市委组织部，配合单位：各有关单位）</p><p align=\"left\">
	　　11.121人才梯队项目。重点培养不少于10名站在世界科技前沿的中国科学院、中国工程院院士后备人才，不少于20名具有国内领先水平的“新世纪百千万人才工程”国家级人选后备人才，不少于100名在学科专业领域起骨干带头作用的享受国务院政府特殊津贴的后备人才。（牵头单位：市人力资源和社会保障局，配合单位：各区、县级市）</p><p align=\"left\">
	　　12.博士后培养项目。深入实施博士后培养工程，5年内培养资助博士后研究人员不少于400名。加大企业博士后工作站在站研究人员资助力度，支持鼓励博士后科研项目进行成果转化。（牵头单位：市人力资源和社会保障局，配合单位：各区、县级市）</p><p align=\"left\">
	　　13.珠江科技新星项目。加大对35岁以下青年科技人员扶持培养力度，每年选拔资助不少于100名青年科技人员，连续3年每年给予科研经费资助，支持其独立开展科学研究、应用开发、成果转化等自主创新活动。（牵头单位：市科技和信息化局，配合单位：各区、县级市）</p><p align=\"left\">
	　　14.“菁英计划”留学项目。着眼于人才的战略性培养，进一步扩大“菁英计划”的实施范围和规模，5年内选拔不少于200名优秀青年学生、青年人才到国外一流大学攻读博士学位，进一步加强派出学生的跟踪培养和回国使用管理服务工作。（牵头单位：市教育局，配合单位：市人力资源和社会保障局、市国资委）</p><p align=\"left\">
	　　15.“百会进千企”金桥项目。5年内组织和发动100家科技类社会组织，加强与1000家企业开展科技创新交流与合作。重点建设30家学会科技服务站，筹建50家企业研发中心以及院士专家工作站，选拔资助不少于200名非公有制企业中青年科技人才，培训2000名企业一线科技创新人才，推进科技成果转化。（牵头单位：市科协，配合单位：市发展改革委、市科技和信息化局、市国资委、市经贸委）</p><p align=\"left\">
	　　（三）城乡一体人才行动计划。围绕“美丽城乡行动计划”，进一步加强公共服务管理人才队伍建设和农村实用人才队伍建设，促进城乡协调发展，实施如下重点项目：</p><p align=\"left\">
	　　16.大学生村官培养项目。加大选拔大学生村官力度，实行本土化选聘、合同化管理，鼓励和引导优秀高校毕业生到村任职。在全面实现“一村一名大学生村官”的基础上，有条件的地方力争实现“一村两名或多名大学生村官”目标。（牵头单位：市委组织部，配合单位：各区、县级市）</p><p align=\"left\">
	　　17.城市运行管理人才开发项目。根据城市环境治理、垃圾处理、数字城管等城市重点项目管理的需要，5年内重点引进和培养20名城市管理专家，培养100名城市管理高层次专门人才，进一步提升城市管理水平。（牵头单位：市城管委，配合单位：各区、县级市）</p><p align=\"left\">
	　　18.农村基层和北部山区人才支持项目。建立完善人才柔性流动机制，5年内选拔资助500名优秀教师、医生、科技人员、社会工作者、文化工作者、中青年党政人才到农村基层和北部山区工作，在服务期内给予入选者基层工作岗位补助，并在职务和职称晋升、工资福利等方面采取倾斜政策。（牵头单位：市人力资源和社会保障局，配合单位：市委组织部，各区、县级市）</p><p align=\"left\">
	　　19.农村实用人才培养项目。加大新型农民科技培训力度，培养造就一批农业生产骨干、农民脱贫致富带头人、农村实用技术推广人员、专业合作组织管理人员和农村经纪人，5年内培训新型农民达到40000名。（牵头单位：市农业局，配合单位：市科协，各有关区、县级市）</p><p align=\"left\">
	　　（四）文化引领人才行动计划。围绕培育世界文化名城，加快文化人才吸引培养步伐，形成一支年龄结构合理、专业门类齐全的高素质文化人才队伍，实施如下重点项目：</p><p align=\"left\">
	　　20.羊城文化名家资助项目。培育造就一批引领文化改革发展步伐、代表广州城市文化形象的名家大师，5年内遴选评定“羊城文化名家”达到50名，在聘期内给予入选名家业务扶持经费资助。加强文化人才梯队建设，选拔培养10名在全国有影响的青年拔尖人才，60名在全省有影响的青年优秀人才，100名在全市起骨干作用的青年后备人才。（牵头单位：市委宣传部，配合单位：各有关单位，各区、县级市）</p><p align=\"left\">
	　　21.文化创意产业领军人才项目。以提高本土原创竞争力为核心，5年内引进和培养文化创意产业领军人才不少于100名，建设1到2个大型的具有产学研合作功能的文化创意产业人才培养基地。（牵头单位：市文化广电新闻出版局，配合单位：各有关单位，各区、县级市）</p><p align=\"left\">
	　　22.体育各类领军人才项目。加大体育各类领军人才引进和培养力度，5年内引进和培养著名教练员、著名国际级裁判员、复合型管理人才、科研人才、体育产品研发人才、体育竞赛表演中介人才和体育产业人才不少于30名。（牵头单位：市体育局，配合单位：市人力资源和社会保障局，各区、县级市）</p><p align=\"left\">
	　　（五）民生幸福人才行动计划。强化以人为本的城市服务管理理念，加快发展社会事业，推进基本公共服务均等化，不断提高城乡居民的和谐感和幸福感，实施如下重点项目：</p><p align=\"left\">
	　　23.高素质教育人才队伍建设项目。加快建设一支高素质、创新型教育人才队伍，5年内选拔认定教育专家10名、名校长100名、名教师200名。（牵头单位：市教育局，配合单位：市人力资源和社会保障局，各区、县级市）</p><p align=\"left\">
	　　24.医疗卫生人才保障项目。重点围绕重大疾病预防诊治、医学科技创新、中医药现代化等领域，培养造就医学杰出骨干人才，抓紧培养突发公共卫生事件应急人才，多种途径培养全科医生，加快培养农村和社区基层医疗卫生人才。5年内选拔资助高层次医疗卫生专家不少于100名，高层次医疗卫生人才不少于500名。（牵头单位：市卫生局，配合单位：市人力资源和社会保障局，各区、县级市）</p><p align=\"left\">
	　　25.社会工作人才培养项目。加快培养造就一支职业化、专业化的社会工作人才队伍，每年资助培养社会工作督导员50名、中级社会工作人才及社会工作管理人才100名、社会工作从业人员3000名。（牵头单位：市民政局，配合单位：市人力资源和社会保障局，各区、县级市）</p><p align=\"left\">
	　　26.民主法治人才项目。根据依法治市工作需要，5年内重点引进和培养500名法院、检察院、公安、司法行政、政府法制系统人才以及综治、维稳、突发性群体事件管理、律师、公证、法学理论等高层次民主法治专门人才。（牵头单位：市委政法委，配合单位：市法院、市检察院、市公安局、市司法局、市法制办，各区、县级市）</p><p align=\"left\">
	　　27.杰出青年人才支持项目。由市财政给予项目启动资助，5年内在社会管理、企业管理、重点学科、文化艺术等领域重点引进、培养和扶持100名杰出青年人才，形成一批各领域高层次领军人才的重要后备力量。（牵头单位：团市委，配合单位：市人力资源和社会保障局）</p><p align=\"left\">
	　　（六）国际交流人才行动计划。进一步加强人才开发国际化交流合作，加快引进和培养具有世界眼光、通晓国际规则、熟悉多元文化的复合型国际化人才，实施如下重点项目：</p><p align=\"left\">
	　　28.“红棉计划”创业项目。5年内遴选扶持500家以上在穗初创型海外人才企业。对入选企业给予创业启动资金，由企业所在区（县级市）提供配套孵化培育服务。（牵头单位：市留交办，配合单位：各有关单位，各区、县级市）</p><p align=\"left\">
	　　29.百名高端外国专家引进项目。5年内引进不少于200名诺贝尔奖获得者、外国科学院院士和知名专家来穗进行学术交流、技术指导和业务合作，并给予相应的项目资助。（牵头单位：市人力资源和社会保障局）</p><p align=\"left\">
	　　30.千名国际人才培训项目。5年内选派不少于1000名经济社会发展重点领域紧缺人才赴海外培训，培养具有国际视野、熟悉国际规则、掌握国际先进技术的国际化人才。（牵头单位：市人力资源和社会保障局，配合单位：各有关单位，各区、县级市）</p><p align=\"left\">
	　　31.高校合作项目。进一步加强与国内重点高校和广州地区高校的合作，重点推进落实与北京大学、清华大学的全面合作框架协议、人才交流输送协议、“菁英计划”专项合作协议，在战略咨询、产学研合作、干部交流、人才培训、就业创业等方面深入开展合作，并给予相应政策扶持。（牵头单位：市委组织部，配合单位：市发展改革委、市人力资源和社会保障局、市科技和信息化局、市教育局，各区、县级市）</p><p align=\"left\">
	　　三、构建三大人才开发支撑体系</p><p align=\"left\">
	　　（一）人才交流培养体系。进一步完善人才交流服务功能，以中国留学人员广州科技交流会（简称“留交会”）为平台，不断拓展海外人才交流渠道，深化人才研究的广度和深度，加快建设高技能人才公共实训鉴定基地，形成功能全面的人才交流培养体系，实施如下重点项目：</p><p align=\"left\">
	　　32.中国留学人员广州科技交流会。坚持创新办会，进一步优化“3＋N”的创办模式（人才交流、创新论坛、展览展示＋N场推介会），整合提升“留交会”功能，充分发挥“留交会”在引进海外高层次人才方面的积极作用，将其打造成为具有全球影响力的国际人才交流平台。进一步推动“留交会”海外人才引进工作常态化，在留学人员集中的重点城市、区域建立“接触广州”人才联络站（海外人才工作站），逐步形成全球性人才引进工作网络。（牵头单位：市留交办，配合单位：各有关单位，各区、县级市）</p><p align=\"left\">
	　　33.人才研究智库。大力发展民间智库，以南方国际人才研究院为主要载体，构建市场化、国际化、专业化的研究网络。设立“高层次人才发展咨询委员会”，聘请国家有关部门以及高校、科研院所等方面的专家学者担任决策顾问，充分发挥决策咨询作用。建立海外高层次人才库，打造海内外高层次人才猎头平台。（牵头单位：市委组织部，配合单位：市科技和信息化局、市人力资源和社会保障局、市留交办）</p><p align=\"left\">
	　　34.高技能人才公共实训鉴定基地。按照“一体、两翼、七点”的战略布局，构建区域分布合理、培养层次多样的高技能人才实训鉴定体系，以满足广州产业结构优化升级对技能人才的需求。（牵头单位：市人力资源和社会保障局，配合单位：各有关单位，各区、县级市）</p><p align=\"left\">
	　　（二）人才创新创业体系。建立健全促进科技成果转化应用的政策措施，搭建多样化的人才创新创业对接平台，进一步优化人才创新创业环境，实施如下重点项目：</p><p align=\"left\">
	　　35.“千人计划”南方创业服务中心。按照“企业主办、市场运作、国际接轨、政府扶持”的组建原则，充分整合政产学研资源，为“千人计划”专家和高层次人才创业发展提供全链条、专业化、个性化的综合服务，建设成为具有“交流、服务、创业”三大功能的国际化人才聚集发展平台。5年内直接服务“千人计划”等各类高端人才2000名，转化国际领先（先进）技术成果1000项，培育创办具有国际竞争力的科技型企业100家，带动一批战略性新兴产业及相关产业发展壮大，形成高层次人才规模效应，打造成为国内示范、国际知名的人才服务业高端品牌。（牵头单位：市委组织部，配合单位：市科技和信息化局、市人力资源和社会保障局、市财政局、越秀区）</p><p align=\"left\">
	　　36.人才特区。按照以点带面、分步实施、统筹推进的原则，重点推进南沙新区“粤港澳人才合作特别示范区”建设，积极申报国家级人才特区，贯彻落实有关特殊政策。同时，选择广州开发区、天河区作为我市人才特区试点区域，实行特殊政策、特殊机制、特事特办，率先在我市经济社会发展中确立人才优先发展的战略布局，构建与国际接轨、与社会主义市场经济体制相适应、有利于科学发展的人才体制机制。（牵头单位：市委组织部，配合单位：市人力资源和社会保障局、市科技和信息化局，各有关区、县级市）</p><p align=\"left\">
	　　（三）人才服务保障体系。创新人才服务保障内容和方式，着力完善人才服务机构的专业化服务功能，加大政府人才公共服务力度，为各类人才充分发挥才干创造良好的环境，实施如下重点项目：</p><p align=\"left\">
	　　37.人才资源服务产业园。大力发展人才服务业，重点扶持中国南方人才市场等在行业中起示范带动作用的人才资源服务机构，鼓励国际著名人力资源企业在我市开展人才服务，引导各类人力资源服务机构参与高层次人才和紧缺人才的引进和培养，加快建设中国南方人才资源服务产业园。（牵头单位：市人力资源和社会保障局，配合单位：市委组织部、各有关单位，各区、县级市）</p><p align=\"left\">
	　　38.人才公寓。统筹各类产业园区、工业园区、科技园区以及企事业单位等方面资源，5年内市、区（县级市）两级筹集建设1000套专家公寓和10000套人才公寓，协助解决纳入人才集聚工程的相关人才的住房问题。（牵头单位：市住房保障办，配合单位：市规划局、市国土房管局，各区、县级市）</p><p align=\"left\">
	　　39.广州人才信息管理平台。大力实施“智慧人才”工程，整合人才集聚工程建设相关业务和人才数据库资源，开发全市人才信息管理应用系统，推动区域内人才资源共享，全面提升广州人才工作信息化水平。（牵头单位：市人力资源和社会保障局，配合单位：市委组织部、各有关单位，各区、县级市）</p><p align=\"left\">
	　　四、创新人才工作体制机制</p><p align=\"left\">
	　　40.健全党管人才领导体制和工作格局。建立健全各级党委统一领导、组织部门牵头抓总、职能部门各司其职、用人单位主体执行、社会力量广泛参与的工作格局。市和各区（县级市）要全面建立人才工作领导小组，由党委或政府主要负责同志担任领导小组组长。在现有市人才工作领导小组及其办公室的组织架构基础上，研究设立人才工作专门机构，重点抓好人才工作战略思想研究、总体规划制定、重要政策统筹、创新工程策划、重点人才培养、重大典型宣传和全市人才工作队伍、人才政策、人才工程及人才资金投入整合工作。进一步加强区（县级市）人才工作力量，做到机构、编制、人员、经费四个到位。（牵头单位：市委组织部，配合单位：市编办、市人力资源和社会保障局、各有关单位，各区、县级市）</p><p align=\"left\">
	　　41.确立人才优先投入机制。大幅度增加人才发展投入，大幅度提高人才支出占财政支出比例，使我市人才投入规模进入全国大城市前列。不断加大市各级财政专项资金、重大建设和科研项目经费用于人才开发的比重，重点保障人才集聚工程各项目的组织实施；扩大“广州市高层次人才专项扶持资金”规模，根据实际工作进度落实年度资金预算；各区（县级市）要建立人才发展专项资金，纳入本区（县级市）财政预算体系。进一步提高人才投入资金使用效益，对按现有经费渠道和现行财政体制分级承担的人才项目投入，要逐步归并到市、区（县级市）人才发展专项资金中统筹管理；新增人才项目投入原则上在市、区（县级市）人才发展专项资金中列支。（牵头单位：市财政局，配合单位：市委组织部、各有关单位，各区、县级市）</p><p align=\"left\">
	　　42.创新人才管理服务方式。坚持党管人才与尊重人才成长规律、发挥市场在人才资源配置中的基础作用相结合，推进人才工作法制建设，形成有利于人才发展的良好环境。完善科学决策、分工协作、沟通交流、督促落实、绩效评估等人才工作运行机制，形成整体工作合力。建立健全多元化投入机制，鼓励引导社会、用人单位和个人以及各类风险投资基金投资人才资源开发。完善分配制度，探索鼓励拥有特殊才能和自主知识产权的人才，以技术要素、知识产权等作为股份参与企业利润分配。制定政府购买服务政策，发展和规范各类人才社会中介组织，不断提高人才服务效率和水平。放宽人才政策实施的条件限制，加大对在穗中央、省部属各类高层次人才的支持服务力度。（牵头单位：市委组织部，配合单位：各有关单位，各区、县级市）</p><p align=\"left\">
	　　五、强化组织实施</p><p align=\"left\">
	　　43.加强组织领导。市人才工作领导小组负责全市人才集聚工程实施的统筹协调和宏观指导。各项目牵头单位对项目组织实施负总责，会同配合单位于2012年10月底前牵头制定完成具体实施细则；各配合单位要加强协作、各负其责，确保各项目组织实施落实到位。各区（县级市）要于2012年底前制定完成具体贯彻落实意见，强化属地责任，共同推进人才集聚工程的实施。（牵头单位：市委组织部，配合单位：各项目牵头单位，各区、县级市）</p><p align=\"left\">
	　　44.完善责任考核。落实党政领导班子人才工作目标责任制，把人才工作纳入各级党政领导班子和领导干部考核评价体系，建立健全全市人才工作监测、评估、考核机制，强化量化考核和绩效评估，推动人才工作任务落实。（牵头单位：市委组织部，配合单位：各项目牵头单位，各区、县级市）</p><p>
	　　45.营造良好环境。加强科学人才观的宣传和政策舆论的引导，大力营造尊重人才、见贤思齐的社会环境，鼓励创新、宽容失败的工作环境，待遇适当、无后顾之忧的生活环境，公开平等、竞争择优的制度环境。多层次、多渠道宣传广州人才工作和人才发展环境，打造“国际人才港”品牌。（牵头单位：市委组织部，配合单位：市委宣传部、各有关单位，各区、县级市）</p>','1','100','news','1388067625','1389341131');
INSERT INTO `post` (`id`,`category_id`,`model`,`title`,`alias`,`image_name`,`file_name`,`tinyint1`,`int10`,`char32`,`varchar30`,`varchar50`,`varchar100`,`varchar128`,`content`,`status`,`weight`,`view`,`created_at`,`updated_at`) VALUES
('11','5','member','xxx博士','82b7b20908d93ed1947986b3fcc64582','48b4718b2478b9d48215501b9436acdb.jpg','','0','0','','','','','安德鲁·扎卡里·菲尔(Andrew Zachary Fire，1959年4月27日-)生于加州，是美国斯坦福医学院病理学和遗传学教授，2006年因与马萨诸塞大学医学院分子医学教授克雷格·梅洛在真核生物...','<p>安德鲁·扎卡里·菲尔(Andrew Zachary Fire，1959年4月27日-)生于加州，是美国斯坦福医学院病理学和遗传学教授，2006年因与马萨诸塞大学医学院分子医学教授克雷格·梅洛在真核生物中发现RNA干扰现象，证明了双链RNA能高效特异性地阻断相应基因的表达——菲尔将此称为RNAi(RNA interference)，而共同获得2006年诺贝尔生理学或医学奖。</p><center><img alt=\"美国斯坦福医学院病理学和遗传学教授Andrew Zachary Fire简介\" 安德鲁·菲尔\"=\"\" src=\"http://www.bio1000.com/uploads/allimg/131128/1452261555-0.jpg\"></center>
<p>安德鲁·菲尔</p><p>安德鲁·菲尔于1983年毕业于麻省理工学院，获得博士学位。随后在英国剑桥大学的雪梨·布伦纳教授的研究组做博士后。1986年转入美国卡耐基研究所开始关于RNA干扰的研究工作。1986年起在约翰·霍普金斯大学担任教席。2003年，菲尔在美国斯坦福医学院担任病理学和遗传学教授。</p><p><strong>个人资料：</strong></p><p>菲尔1959年出生在美国加利福尼亚州圣克拉拉县，本科在加利福尼亚大学伯克利分校主修数学，仅用3年时间就拿到学位。他逐渐对涉及生命奥秘的遗传学产生兴趣，并将其作为自己终身的学术追求。法尔曾在美国和英国多所高校和研究机构求学和工作，1998年在美国卡内基学会工作期间，他与梅洛等合作发现了RNA干扰机制。 1998年，菲尔与好友梅洛等人在《自然》杂志上共同发表了有关发现RNA干扰机制的论文，被同行称为“近一段时间来分子生物学最激动人心的发现之一”。</p><p><strong>理论贡献：</strong></p><p>安德鲁·菲尔和克雷格·梅洛发现了一个有关控制基因信息流程的关键机制。</p><p>人们的基因组通过从细胞核里的DNA向蛋白质的合成机制发出生产蛋白质的指令运作，这些指令通过mRNA传送。他们发现一种可以从特定基因降解mRNA的方式，在这种RNA干扰现象中，双链RNA(double-stranded RNA)以一种非常明确的方式抑制了基因表达。 安德鲁·菲尔这项技术被用于全球的实验室来确定各种病症中哪种基因起到了重要作用。</p><p>植物、动物、人类都存在RNA干扰现象，这对于基因表达的管理、参与对病毒感染的防护、控制活跃基因具有重要意义。RNA干扰是一个生物过程，在这个过程中双链RNA以一种非常明确的方式抑制了基因表达。自1998年发现以来，RNA干扰已经作为一种强大的“基因沉默”技术而出现。RNA干扰作为研究基因运行的一种研究方法已被广泛应用于基础科学，它可能在将来产生新的治疗方法。科学家认为，RNA干扰技术不仅是研究基因功能的一种强大工具，不久的未来，这种技术也许能用来直接从源头上让致病基因“沉默”，以治疗癌症甚至艾滋病，在农业上也将大有可为。从这个角度来说，“沉默”真的是金。安德鲁·菲尔这项技术被用于全球的实验室来确定各种病症中哪种基因起到了重要作用。</p>','1','100','member','1388241855','1388413502');
INSERT INTO `post` (`id`,`category_id`,`model`,`title`,`alias`,`image_name`,`file_name`,`tinyint1`,`int10`,`char32`,`varchar30`,`varchar50`,`varchar100`,`varchar128`,`content`,`status`,`weight`,`view`,`created_at`,`updated_at`) VALUES
('12','6','post','博士一览','249f188c06a776d844625bd9be27c0ee','','','0','0','','','','','广东博士','<ul class=\"people\">
			
<li>
		<a href=\"/site/82b7b20908d93ed1947986b3fcc64582\"><img src=\"/upload/images/48b4718b2478b9d48215501b9436acdb.jpg\" width=\"125px\" height=\"160\"></a>
		
<p><a href=\"http://yiicms.dev/site/82b7b20908d93ed1947986b3fcc64582\">安德鲁·菲尔</a></p></li>		</ul>','1','100','post','1388243439','0');
INSERT INTO `post` (`id`,`category_id`,`model`,`title`,`alias`,`image_name`,`file_name`,`tinyint1`,`int10`,`char32`,`varchar30`,`varchar50`,`varchar100`,`varchar128`,`content`,`status`,`weight`,`view`,`created_at`,`updated_at`) VALUES
('13','7','job','商务专员','1c1d5ac09b398a9b072d3fdd3f877b29','','','0','2','','2年','21-35岁','面议','本科','<p><p>岗位职责：</p><p>1、产品渠道设计；</p><p>2、商务推广策划；</p><p>3、商务推广与商务客户维护；</p><p>4、参与商务活动设计方案；</p><p>5、协助上级完成部门的日常工作。</p><p>任职要求：</p><p>1、本科，市场营销及相关专业，2年以上工作经验，1年以上本职工作经验</p><p>2、熟悉电子商务流程；</p><p>3、对商务推广有一定的经验；</p><p>4、有操作过商务推广活动经验优先；</p><p>5、有开拓和创新精神，吃苦耐劳；</p><p>6、有悉科技服务类商务推广经验优先录用。</p></p>','1','100','job','1388245584','1392195855');
INSERT INTO `post` (`id`,`category_id`,`model`,`title`,`alias`,`image_name`,`file_name`,`tinyint1`,`int10`,`char32`,`varchar30`,`varchar50`,`varchar100`,`varchar128`,`content`,`status`,`weight`,`view`,`created_at`,`updated_at`) VALUES
('14','7','job','经理助理','f924f43d8efeb73a58dadbf4fb6a0caf','','','0','2','','不限','25-35岁','面议','本科','<p><p>工作职责：</p><p>1、负责协助部门经理处理日常事务工作；</p><p>2、严格执行本部门制定的各项规章制度及各个项目计划；</p><p>3、协助部门开展科技服务项目；</p><p>4、负责编制各种与科技服务相关的方案及文件；</p><p>5、负责科技服务站日常运营与管理；</p><p>6、及时向经理反映科技服务项目实施、运作；</p><p>7、每月定期或不定期组织各部门对科技服务的各项工作进行检查纠正，并形成书面材料予以通报。</p><p>技能要求：</p><p>1、有创新精神，具备团队协作能力；</p><p>2、能吃苦耐劳；</p><p>3、具有良好的沟通能力、学习能力、书面表达能力。</p></p>','1','100','job','1388248346','1392195393');
INSERT INTO `post` (`id`,`category_id`,`model`,`title`,`alias`,`image_name`,`file_name`,`tinyint1`,`int10`,`char32`,`varchar30`,`varchar50`,`varchar100`,`varchar128`,`content`,`status`,`weight`,`view`,`created_at`,`updated_at`) VALUES
('20','5','member','Craig Cameron Mello','95ba20d195c482247dc4990f1cf47f59','f079996c5379a2a3ae46a1f22cc3ef73.jpg','','0','0','','','','','克雷格·梅洛(Craig Cameron Mello,1960年10月18日-)是美国马萨诸塞大学医学院分子医学教授。2006年因与斯坦福医学院病理学和遗传学教授安德鲁·法厄发现rna干扰现象而共同获...','<p>克雷格·梅洛(Craig Cameron Mello,1960年10月18日-)是美国马萨诸塞大学医学院分子医学教授。2006年因与斯坦福医学院病理学和遗传学教授安德鲁·法厄发现rna干扰现象而共同获得2006年诺贝尔生理学或医学奖。 美国马萨诸塞大学医学院分子医学教授Craig Cameron Mello简介 </p><p style=\"text-align: center;\"><img src=\"http://www.bio1000.com/uploads/allimg/131128/145S1E94-0.jpg\"></p><p>Craig Cameron Mello 1982年获得美国布朗大学学士学位，1990年在哈佛大学获得博士学位。1994年加入马萨诸塞州大学医学院任分子医学教授。</p>','1','100','member','1388412471','1388413508');
INSERT INTO `post` (`id`,`category_id`,`model`,`title`,`alias`,`image_name`,`file_name`,`tinyint1`,`int10`,`char32`,`varchar30`,`varchar50`,`varchar100`,`varchar128`,`content`,`status`,`weight`,`view`,`created_at`,`updated_at`) VALUES
('21','5','member','施一公','9a5b4ac7b5796555b501e5c1ff0e28ac','d291e9b56775efb964dce90fe3d579bf.jpg','','0','0','','','','','5月21日，欧洲分子生物学组织(EMBO, European molecular Biology Organization)公布了新当选成员名单，清华大学施一公教授入选EMBO外籍成员。此次共有52名...','<p>5月21日，欧洲分子生物学组织(EMBO, European molecular Biology Organization)公布了新当选成员名单，清华大学施一公教授入选EMBO外籍成员。</p><p>此次共有52名优秀的生命科学家入选，其中43名来自欧洲及其毗邻国家，9名外籍成员分别来自美国、中国、加拿大、日本和印度，其中2名成员来自中国，另一位入选的中国科学家是中国农业科学院院长、中科院院士李家洋研究员。</p><p style=\"text-align: center;\"><img src=\"http://www.bio1000.com/uploads/allimg/130527/091T154S-0.jpg\"></p><p>施一公继入选美国院士、中科院院士后又入选EMBO外籍成员</p><p>图为施一公近照。</p><p>欧洲分子生物学组织成立于1964年，旨在推动欧洲及世界的生命科学发展。每年选举优秀的生物学家为其成员，至今共有近1600名欧洲及外籍成员，其中57位为诺贝尔奖获得者。</p><p>人物简介：</p><p>施一公，1989年毕业于清华大学生物系，1995年获美国约翰霍普金斯大学医学院分子生物物理学博士(1995)，历任美国普林斯顿大学分子生物学系助理教授、副教授、教授、讲席教授(1998—2008)。他2006年开始着手在清华大学建设实验室，2008年全时回国工作，现任清华大学生命科学学院院长。其领导的实验室主要运用X-射线晶体学，结合其它生物物理和生物化学方法研究生命科学的基本问题，在细胞凋亡调节机制、生物大分子机器组装与功能、重要膜蛋白结构与机理三个主要研究领域做出了重要的原创贡献，迄今发表SCI论文125篇，其中34篇以通讯作者发表于《自然》、《科学》、《细胞》，被SCI引用14000余次。其团队取得的科研成果于2010、2011年连续两次入选“中国高校十大科技进展”，2012年被《科学》“年度十大进展”重点引用并入选“中国科学十大进展”。</p><p>施一公于2003年获得国际蛋白协会颁发的“鄂文西格青年科学家奖”;2008年当选美国霍华德休斯医学研究院研究员(HHM I Investigator，因全职回国而婉拒);2010年获国际赛克勒生物物理学奖、香港求是科技基金会“杰出科学家奖”、谈家桢生命科学终身成就奖;2011年获华人生物学家协会颁发的吴瑞奖(终身成就奖);2013年获得英国约克大学荣誉博士学位。2013年4月入选美国人文与科学院和美国科学院外籍院士。</p>','1','100','member','1388412608','1388413515');
INSERT INTO `post` (`id`,`category_id`,`model`,`title`,`alias`,`image_name`,`file_name`,`tinyint1`,`int10`,`char32`,`varchar30`,`varchar50`,`varchar100`,`varchar128`,`content`,`status`,`weight`,`view`,`created_at`,`updated_at`) VALUES
('22','5','member','罗斯曼','3ce3bbf53cd61fcdf2dfdf78c590fa9b','22c54148669701c3bde8257764a5efdc.jpg','','0','0','','','','','2013年诺贝尔生理学或医学奖揭晓，诺奖得主之一罗斯曼在听到获奖消息后非常震惊，要求先给自己十分钟洗澡镇定一下，再接受诺贝尔媒体的采访。2013年诺贝尔生理学或医学奖得主罗斯曼得知获奖消息非常震惊Ja...','<p>2013年诺贝尔生理学或医学奖揭晓，诺奖得主之一罗斯曼在听到获奖消息后非常震惊，要求先给自己十分钟洗澡镇定一下，再接受诺贝尔媒体的采访。</p><p>2013年诺贝尔生理学或医学奖得主罗斯曼得知获奖消息非常震惊</p><p style=\"text-align: center;\"><img src=\"http://www.bio1000.com/uploads/allimg/131008/0939293023-0.jpg\"></p><p style=\"text-align: center;\">James E. Rothman</p><p>“蛋白质在细胞中运作时，其原理与物理机械类似，这非常令人着迷。”美国耶鲁大学生物医学教授詹姆斯·E·罗斯曼在获得2013年度诺贝尔生理学或医学奖后，在电话里向记者这样描述他的工作。</p><p>因“揭示了细胞运输的精确控制机制”，罗斯曼与加州大学伯克利分校的细胞生物学家兰迪·谢克曼，以及目前在斯坦福大学任职的德国科学家托马斯·聚德霍夫共同获得了2013年度诺贝尔生理学或医学奖。</p><p>三位科学家发现了细胞中囊泡像船队一样运送货物至精确目的地的作用方式，这对大脑沟通方式、激素释放和部分免疫系统至关重要。</p><p>“囊泡像是一个邮包，它们必须到达特定的地址。”英国曼彻斯特大学科学家丽莎·斯万顿这样形容道。她表示：“三位科学家揭示了其准确运输的机制，大大推动了该领域的发展。他们彻底改变了人们对细胞如何运作的理解。”</p><p>罗斯曼在听到获奖消息后非常震惊，要求先给自己十分钟洗澡镇定一下，再接受诺贝尔媒体的采访。“我非常高兴与谢克曼、聚德霍夫共同获得这个奖项。”他说。</p><p>谢克曼在得知自己获奖后称：“我的第一反应是‘噢，上帝啊!’第二反应也是如此。”他发现了酵母菌中调节细胞囊泡运输机制的基因，揭示三个基因的突变导致了“类似于糟糕的公共交通系统的状况”。</p><p>“这些美妙的发现对了解人体非常重要，同时对神经系统疾病、糖尿病和免疫失调等各器官疾病的研究有显著意义。”瑞典卡罗琳研究所临床肿瘤学教授简英奇·亨特在一个新闻发布会上如是说。</p><p>新罕布什尔州达特茅斯大学分子生物学家贝尔·维克尼认为，这份奖“早就应该来了”。他称，该奖“反映了一个分子生物学的根本难题，而这些科学家以三种非常不同的方式加以解决。”</p>','1','100','member','1388412749','1388413520');
INSERT INTO `post` (`id`,`category_id`,`model`,`title`,`alias`,`image_name`,`file_name`,`tinyint1`,`int10`,`char32`,`varchar30`,`varchar50`,`varchar100`,`varchar128`,`content`,`status`,`weight`,`view`,`created_at`,`updated_at`) VALUES
('23','12','news','第二期“人防工程管理”学术沙龙顺利举行','e5f2e0ce1c971ea647861e7ea0501b1e','66b753e8c5c54ac79c94f639bcc2f029.jpg','','0','0','','','','','由广东省民防协会主办、广东博士俱乐部承办的第二期“人防工程管理”学术沙龙于12月14日在广东博士俱乐部交流中心顺利举行。广东省民防协会会长唐甸华、广东省人防办法宣处处长高伯宁、副处长孙有立、广州市国土...
','<p>
	由广东省民防协会主办、<st1>广东博士俱乐部承办的第二期“人防工程管理”学术沙龙于<st1>12月14日在<st1>广东博士俱乐部交流中心顺利举行。</st1></st1></st1></p><p>
	广东省民防协会会长唐甸华、广东省人防办法宣处处长高伯宁、副处长孙有立、广州市国土资源和房屋管理局房改指导处处长张建明、广东省民防协会专家委员会主任安关峰、广东省民防协会专家委员会副主任李飏以及相关专业的代表等二十多人出席了本次活动。</p><p>
	会上，唐甸华会长首先介绍了此次沙龙的主要目的，为即将在<st1>12月28日举行的“人防工程管理”学术论坛所关注的议题进一步深入探讨。并从人防工程在法律法规建设、人员配备、人员培训、人防工程管理责任及经费五个层面指出当前人防工程管理所存在的不足。希望通过沙龙的形式与业界专家互动交流，听取各位专家意见和建议，为政府完善人防工程管理法律法规，人防工程管理制度有重要意义。</st1></p><p>
	省民防协会专家委员会安关峰主任也围绕建立健全的法律法规、完善组织架构体系、创新盈利模式、宣传教育培训等方面发表了自己的看法和建议。到会的各位专家也分别在会上发表了自己的见解。并预祝<st1>12月28日的论坛圆满成功。活动在热烈的讨论中结束。</st1></p><p style=\"text-align: center;\">
	<st1><br>
	</st1></p><p style=\"text-align: center;\">
	<img src=\"/upload/images/66b753e8c5c54ac79c94f639bcc2f029.jpg\" alt=\"\"></p><p style=\"text-align: center;\">
	广东省民防协会唐甸华会长发言</p><p style=\"text-align: center;\">
	<img src=\"/upload/images/6a882a410ab38d7275aec29a7c9a766a.jpg\"></p><p style=\"text-align: center;\">
	专家代表发言一</p><p style=\"text-align: center;\">
	<img src=\"/upload/images/e26d1909735d6e2450a643a9578e0aed.jpg\"></p><p style=\"text-align: center;\">
	专家代表发言二</p><p style=\"text-align: center;\">
	<img src=\"/upload/images/49463c300e74cdbf87a2e7dfb8b4938b.jpg\"></p><p style=\"text-align: center;\">
	广东省民防协会专家委员会主<st1>任安博士作会议总结</st1></p><p style=\"text-align: center;\">
	<img src=\"/upload/images/a9319d186d9ab04d05a0568ffac96c23.jpg\"></p><p style=\"text-align: center;\">
	广东省民防协会“人防工程管理”学术沙龙专家合影</p>','5','88','news','1388415311','1388736260');
INSERT INTO `post` (`id`,`category_id`,`model`,`title`,`alias`,`image_name`,`file_name`,`tinyint1`,`int10`,`char32`,`varchar30`,`varchar50`,`varchar100`,`varchar128`,`content`,`status`,`weight`,`view`,`created_at`,`updated_at`) VALUES
('24','19','project','科技服务','7bfa99bc7ff9f033d5047b5d411bda27','388b1888a67c13353f51a87b356b14b7.jpg','','0','0','','','','','一、知识产权服务；二、科学技术服务；三、科技成果服务；四、商会协会服务','<p style=\"text-align: center; \">
	<span  style=\"font-size: 20px; \"><strong>服务范围：知识产权服务、科技成果服务、科学技术服务、商会协会服务</strong></span></p><p style=\"text-align: center; \">
	<span  style=\"font-size: 20px; \"><br>
	</span></p><p style=\"text-align: center; \">
	<span  style=\"font-size: 20px; \"><br>
	</span></p><p align=\"left\" style=\"text-align: left; color: rgb(0, 102, 255); font-weight: bold; \">
	<span  style=\"font-size: 18px; \">
	知识产权服务</span></p><ul>
	
<li><span  style=\"font-size: 18px; \">信息服务：检索分析、数据库建设</span></li>	
<li><span  style=\"font-size: 18px; \">代理服务：申请、注册、登记、申报</span></li>	
<li><span  style=\"font-size: 18px; \">应用转化服务：质押融资、托管、经营</span></li>	
<li><span  style=\"font-size: 18px; \">咨询服务：法律服务、管理咨询、战略咨询</span></li>	
<li><span  style=\"font-size: 18px; \">交易服务：评估、转让、置换</span></li>	
<li><span  style=\"font-size: 18px; \">培训服务：知识产权普及、推广应用</span></li></ul><p align=\"left\" style=\"text-align: left; color: rgb(0, 102, 255); font-weight: bold; \">
	<span  style=\"font-size: 18px; \">
	科学技术服务</span></p><ul>
	
<li><span  style=\"font-size: 18px; \">科学技术培训服务：人才培训、技术培训</span></li>	
<li><span  style=\"font-size: 18px; \">科学技术推广服务：交流、普及、升级和改造</span></li>	
<li><span  style=\"font-size: 18px; \">科学技术评估与鉴证：咨询、评估和鉴定</span></li></ul><p align=\"left\" style=\"text-align: left; color: rgb(0, 102, 255); font-weight: bold; \">
	<span  style=\"font-size: 18px; \">
	科技成果服务</span></p><ul>
	
<li><span  style=\"font-size: 18px; \">科技成果的展览展示服务</span></li>	
<li><span  style=\"font-size: 18px; \">科技成果评估和鉴定服务</span></li>	
<li><span  style=\"font-size: 18px; \">科技成果推广服务：科技成果传播、产学研服务</span></li>	
<li><span  style=\"font-size: 18px; \">科技成果转化服务：科技成果的孵化、培育、应用</span></li>	
<li><span  style=\"font-size: 18px; \">科技成果管理服务：科技成果的收集、登记、统计、分析、跟踪</span></li></ul><p align=\"left\" style=\"text-align: left; color: rgb(0, 102, 255); font-weight: bold; \">
	<span  style=\"font-size: 18px; \">
	商会协会服务</span></p><ul>
	
<li><span  style=\"font-size: 18px; \">学会之家：联谊活动、学术交流、科技成果展示、科普宣传和科技服务</span></li>	
<li><span  style=\"font-size: 18px; \">培育基地：培训指导、孵化扶持、管理服务、咨询代理</span></li>	
<li><span  style=\"font-size: 18px; \">信息平台：科技信息、科普信息、创新信息、政务信息</span></li>	
<li><span  style=\"font-size: 18px; \">科技集市：科技人才、科技类社会组织、科技成果展示、成果转化的交流平台</span></li>	
<li><span  style=\"font-size: 18px; \">商务服务：商务礼仪、托管服务</span></li></ul>','10','90','news','1388587315','1392192650');
INSERT INTO `post` (`id`,`category_id`,`model`,`title`,`alias`,`image_name`,`file_name`,`tinyint1`,`int10`,`char32`,`varchar30`,`varchar50`,`varchar100`,`varchar128`,`content`,`status`,`weight`,`view`,`created_at`,`updated_at`) VALUES
('25','17','project','人才服务','36550d8c512be22cdf88cff19a2a1f21','38fe19fcddd640e3296f8ce6ebd4fe3c.jpg','','0','0','','','','','
	服务范围：高端人才服务、企业人力资源服务、基础人才服务
	
		高端人才服务：人才测评、猎头服务、科研合作、在职研究生项目等；
	
	企业人力资源服务：代理招聘、劳务派遣、人事代理、校企...','<p style=\"text-align: center; \">
	<span  style=\"font-size: 20px; \"><strong>服务范围：高端人才服务、企业人力资源服务、基础人才服务</strong></span></p><p style=\"text-align: center; \"><span  style=\"font-size: 20px; \"><strong><br></strong></span></p><p style=\"text-align: center; \"></p><p align=\"left\" style=\"text-align: left;  font-weight: bold; \">
	</p><p><span  style=\"font-size: 16px; \"><strong>
		高端人才服务：</strong>人才测评、猎头服务、科研合作、在职研究生项目等；
	</span></p><p><span  style=\"font-size: 16px; \"><strong>
	企业人力资源服务：</strong>代理招聘、劳务派遣、人事代理、校企办学等；</span></p><p><span  style=\"font-size: 16px; \"><strong>
	基础人才服务：</strong>职业教育、合作办学、技能培训、学历提升等；</span></p>','10','80','news','1388587943','1393317197');
INSERT INTO `post` (`id`,`category_id`,`model`,`title`,`alias`,`image_name`,`file_name`,`tinyint1`,`int10`,`char32`,`varchar30`,`varchar50`,`varchar100`,`varchar128`,`content`,`status`,`weight`,`view`,`created_at`,`updated_at`) VALUES
('26','20','phd','博士的由来','0cd0f15d01475ca169cc086b1494a131','','','0','0','','','','','    中国古代指专门精通某一门学问或传授经学的官名。秦朝有诸子、诗赋等博士，汉朝有五经博士。唐朝有太学博士、太医博士、律学博士等，都是教授官。明清时，仍然设有此官职，只是稍有不同。明朝的宋濂《送东阳...','<p><p>    中国古代指专门精通某一门学问或传授经学的官名。秦朝有诸子、诗赋等博士，汉朝有五经博士。唐朝有太学博士、太医博士、律学博士等，<st1>都是教授官。明清时，仍然设有此官职，只是稍有不同。明朝的宋濂《送东阳马生序》中说：“有司业、博士为之师。”</st1></p><p><st1>    中国古代指博学多才，通晓古今的人。中国古代对有某种技艺或从事某种专业的人的尊称，犹如后世的师傅。如唐朝人称陆羽为茶博士，后来对卖茶的伙计就称为茶博士。又称卖酒的人为酒博士，磨工为磨博士。明朝黄省曾《吴风录》：至今称呼椎油作面佣夫皆为博士。</st1></p><p><st1>    而现在则用作学位的名称。博士是教育机构授予的最高一级学位。如哲学博士（PhD），医学博士（MD），<st1>文学博士（DLitt），教育博士（EdD）。Ph.D就是博士学位的英文简写，Ph.D英文的全名是Doctor of Philosophy，按照英文的字面意思，Ph.D就是哲学博士，但英文的Ph.D又是从两种其他文字演变过来的，Doctor原本是一个拉丁文，意思是“教导”，Philosophy由两个希腊文合起来，Philo的意思是“喜爱”，sophy的意思是“智慧”。</st1></st1></p><p><st1><st1>    所以博士最原始的用法是，形容一个被公认喜爱智慧并且能够教导人的人。</st1></st1></p></p>','1','100','news','1388589326','1394176954');
INSERT INTO `post` (`id`,`category_id`,`model`,`title`,`alias`,`image_name`,`file_name`,`tinyint1`,`int10`,`char32`,`varchar30`,`varchar50`,`varchar100`,`varchar128`,`content`,`status`,`weight`,`view`,`created_at`,`updated_at`) VALUES
('27','10','news','凝聚博士专家智慧 创新人防工程管理','e7b06ded71d61ba8e11d2b570a851097','3ebfbb0f6a414d1c650b80224a6ce604.jpg','','0','0','','','','','    在广东省人民防空办公室的大力支持和指导下，由广东省民防协会主办、广东博士俱乐部集团承办、广州市科技类社会组织服务中心协办的“凝聚博士专家智慧，创新人防工程管理”论坛于12月28日在广州市科学技...','<p>    在广东省人民防空办公室的大力支持和指导下，由广东省民防协会主办、广东博士俱乐部集团承办、广州市科技类社会组织服务中心协办的“凝聚博士专家智慧，创新人防工程管理”论坛于12月28日在广州市科学技术协会学术报告厅隆重举行。广东省人防办、广东省民防协会、各市人防系统领导、博士、专家及关心支持人防事业的业界精英共250多人出席了本次论坛。</p><p>    广东省人防办副主任范先军在论坛上发表了重要讲话，对广东省民防协会通过组建民防专家委员会，举办民防论坛，凝聚博士、专家、业界精 英的智慧，为创新人防工程管理体系建言献策的做法给予充分肯定并提出了殷切希望。</p><p>    参加本次论坛的近百名博士、专家紧紧围绕“凝聚博士智慧 创新人防管理”的论坛宗旨展开智慧碰撞，从人防工程管理体系的法律法规、组织体系、运营模式、宣传教育和培训体系展开热烈讨论。梁永宽博士、李彰明博士、何海东博士、李飏博士、刘添俊博士、安关峰博士、刘继承教授、李奇林教授等博士、专家在论坛上做了主旨发言。专家学者一致认为：广东省人防工程建设经过多年努力，已取得显著成效，人防工程建设总量已位居全国前列。但由于人防工程环境和结构的特殊性，人防工程的管理与地面工程管理相比，存在专业性更强、救援难度更大等复杂现象，一旦发生战争或出现重大自然灾害等突发事件，人防工程如何在组织群众快速、有序、高效地实施转移、隐蔽和有效防护中发挥应有作用，是一个值得认真研究和努力破解的大课题。</p><p>    广东省民防协会唐甸华会长指出：在世界总体局势平稳、局部局势紧张、自然灾害频发的今天，构建完善的人防工程管理体系显得尤为重要！举办“人防工程管理学术论坛”的目的就是为了更好地凝聚博士专家的智慧，对广东省人防工程的管理进行深入探讨和研究，为人防工程管理体系和人防工程管理员的认证体系建设展开智慧碰撞，并形成《人防工程管理体系白皮书》，向政府主管部门建言献策，为我省人防建设及社会经济发展作出应有的贡献！</p>','10','87','news','1388634662','1388741090');
INSERT INTO `post` (`id`,`category_id`,`model`,`title`,`alias`,`image_name`,`file_name`,`tinyint1`,`int10`,`char32`,`varchar30`,`varchar50`,`varchar100`,`varchar128`,`content`,`status`,`weight`,`view`,`created_at`,`updated_at`) VALUES
('28','11','news','关于走新型城市化发展道路建设廉洁广州的决定','6bcc468c3d8ef378d6b31056adb861d4','','','0','0','','','','','廉洁广州总体目标　　建设廉洁政治，让廉洁成为广州政治活动的基本准则；　　建设廉洁市场，让廉洁成为广州经济活动的普遍规则；　　建设廉洁文化，让廉洁成为广州文化名城的重要特色；　　建设廉洁社会，让廉洁成为...','<p>廉洁广州总体目标</p><p>　　建设廉洁政治，让廉洁成为广州政治活动的基本准则；</p><p>　　建设廉洁市场，让廉洁成为广州经济活动的普遍规则；</p><p>　　建设廉洁文化，让廉洁成为广州文化名城的重要特色；</p><p>　　建设廉洁社会，让廉洁成为广州社会各界的自觉追求；</p><p>　　力争到2020年，初步树立起与新型城市化发展要求相适应、与国家中心城市地位相匹配、与人民群众愿望相呼应的廉洁广州形象。</p><p>　　廉洁广州建设主要任务</p><p>　　廉洁清明政治</p><p>　　建设廉洁清明政治，重点要打造廉洁高效政府、建设廉洁公正司法、强化对权力的监督制约、严肃查处腐败行为；</p><p>　　廉洁城市文化</p><p>　　建设廉洁城市文化，重点要加强廉洁诚信教育、加大廉洁文化产品供给、深化群众性廉洁文化活动、拓展廉洁文化阵地和载体；</p><p>　　廉洁诚信市场</p><p>　　建设廉洁诚信市场，重点要优化营商环境、完善公共资源交易市场运行机制、培育廉洁从业市场主体、健全市场信用体系、完善市场监管体系；</p><p>　　廉洁公平社会</p><p>　　建设廉洁公平社会，重点要加大民生领域防治腐败力度、加强社会组织反腐倡廉建设、拓展群众参与廉洁建设渠道。</p><p>　　为深入贯彻广东省第十一次党代会、广州市第十次党代会精神，不断提高反腐倡廉建设水平，更好服务、保障、促进广州新型城市化发展和国家中心城市建设，特就建设廉洁广州作出如下决定。</p><p>　　一、充分认识建设廉洁广州的重要意义</p><p>　　改革开放以来，我市坚持“两手抓、两手都要硬”，在大力推进改革开放和现代化建设的同时，高度重视党风廉政建设和反腐败工作，反腐倡廉建设总体呈现出全面发展、深入推进的良好态势。同时，也面临不少新情况新问题，成效明显和问题突出并存、防治力度加大和腐败现象易发多发并存、群众对反腐败期望值不断上升和腐败现象短期内难以根治并存的总体态势没有改变，反腐败斗争形势依然严峻、任务依然艰巨。实践证明，越是改革开放、越是经济社会快速发展，越要重视和加强反腐倡廉建设。国务院颁布实施的《珠江三角洲地区改革发展规划纲要（2008-2020年）》，明确要求广州强化国家中心城市、综合性门户城市和区域文化教育中心地位，建设成为广东宜居城乡的“首善之区”，建成面向世界、服务全国的国际大都市。市第十次党代会作出“12338”决策部署，强调要走出一条具有广州特色的新型城市化发展道路，率先转型升级、建设幸福广州。廉洁增强党的生命力，廉洁提升城市的竞争力，廉洁催生社会的凝聚力。走新型城市化发展道路，应该也必须走一条廉洁之路；建设国家中心城市，应该也必须建设一座廉洁之城；提升市民群众的幸福指数，应该也必须提升城市的廉洁指数。建设廉洁广州，是践行党对建设廉洁政治的庄严承诺、保持党的先进性和纯洁性的重大举措，是顺应市民群众期待、推动全民共建共享廉洁社会的必然要求，是走新型城市化发展道路、建设国家中心城市的应有之义和重要保障。</p><p>　　二、建设廉洁广州的指导思想、基本原则和总体目标</p><p>　　（一）指导思想。高举中国特色社会主义伟大旗帜，以邓小平理论和“三个代表”重要思想为指导，深入贯彻落实科学发展观，坚持标本兼治、综合治理、惩防并举、注重预防，以完善和延伸惩防腐败体系为重点，通过积极倡导、有效约束和严厉惩治，使廉洁思想、廉洁准则、廉洁文化渗透到我市政治、经济、文化、社会各个领域及其各个层面，廉洁的要求在城市各领域、各成员普遍内化于心、外化于行、刚化于矩，努力建设党政清廉、市场守廉、文化育廉、社会崇廉的廉洁广州。</p><p>　　（二）基本原则。建设廉洁广州，必须坚持以下原则：</p><p>　　——围绕中心、服务发展。坚持把廉洁广州建设纳入广州国家中心城市建设和新型城市化发展总体布局，贯穿于政治、经济、文化、社会建设等各个领域，体现在党的建设的各个方面。</p><p>　　——全民参与、共建共享。坚持党委领导、政府引领、干部率先、社会参与，充分调动各方面积极性，努力形成全民共建共享廉洁广州的良好格局。</p><p>　　——改革创新、先行先试。积极探索更加科学有效防治腐败的途径，在反腐倡廉体制机制改革方面勇于尝试，在重点领域和关键环节率先突破。</p><p>　　——统筹兼顾、重在建设。处理好当前与长远、全面与重点的关系，坚持分步实施、重点突破，推动廉洁广州建设取得实效。</p><p>　　（三）总体目标。力争到2020年，努力实现消极腐败现象得到有效遏制、法规制度基本完备、权力运行规范有序、廉洁诚信观念深入人心、城市廉洁程度不断提升的目标，初步树立起与新型城市化发展要求相适应、与国家中心城市地位相匹配、与人民群众愿望相呼应的廉洁广州形象。</p><p>　　——建设廉洁政治，让廉洁成为广州政治活动的基本准则。着眼于加强社会主义民主政治建设，以规范权力运行为核心，着力营造权力配置科学合理、权力监督制约到位、权力运行阳光透明、党员干部廉洁自律、民主法治公平公正的良好政务环境。</p><p>　　——建设廉洁市场，让廉洁成为广州经济活动的普遍规则。着眼于建设国际商贸中心，以健全市场监管和市场信用体系为保障，着力营造市场规范有序、资源配置高效、行业廉洁从业、企业诚信经营的良好市场环境。</p><p>　　——建设廉洁文化，让廉洁成为广州文化名城的重要特色。着眼于培育世界文化名城，以形成尊廉崇廉的文化认同为目标，着力营造廉荣贪耻、尚洁修身、诚实守信、爱岗敬业的良好文化环境。</p><p>　　——建设廉洁社会，让廉洁成为广州社会各界的自觉追求。着眼于加强社会建设、创新社会管理，以促进民生幸福为根本，推动反腐倡廉建设向社会领域拓展，着力形成全民参与、全面覆盖的反腐倡廉建设格局。</p><p>　　三、建设廉洁清明政治</p><p>　　（一）打造廉洁高效政府。坚持依法行政，推进法治政府建设，进一步提高行政机关及其工作人员依法行政的意识和能力；实行行政执法责任制，严格规范行政自由裁量权行使，健全行政决策纠错机制和责任追究制；完善重大行政决策程序规则，把公众参与、专家论证、风险评估、合法性审查和集体讨论作为必经程序加以规范。推进阳光政务建设，严格执行政府信息公开条例，及时、准确、全面公开各项政府信息。推进服务型政府建设，深化行政审批制度改革，推动管理重心下移，提高服务水平；构建公共服务型财政体制，加大对公共服务和公共产品的投入；强化政府绩效管理，切实提高行政效能。</p><p>　　（二）建设廉洁公正司法。深化司法监督机制改革，优化司法职权配置，完善审判与执行分权制衡工作机制、检察机关制衡监督工作机制。规范司法自由裁量权的行使，健全司法纠错机制和司法救济制度。落实司法公开制度，加强阳光审务、阳光检务、阳光警务、阳光狱务建设。健全依法独立公正行使审判权、检察权的保障机制。加大对司法行为的监督力度。加强对刑事立案、侦查活动、审判活动、刑罚执行与监管活动的法律监督和社会监督，确保法律法规公正有效实施。</p><p>　　（三）强化对权力的监督制约。以规范权力运行为核心，建立健全决策权、执行权、监督权既相互制约又相互协调的权力结构和运行机制。建立健全市一级预防腐败机构，研究制定我市预防腐败的地方性法规。全面深入开展廉政风险防控工作，以岗位廉政风险排查为基础，以加强行政审批权、行政处罚权监督为重点，建立健全智能化廉政风险防控体系。加强对领导干部特别是对“一把手”的监督，落实党政正职不直接分管人、财、物和行政审批等制度。坚持和完善民主集中制，完善领导班子议事规则。严格执行领导干部述职述廉、诫勉谈话、质询函询、经济责任审计、报告个人重大事项等制度，探索实行党员领导干部家庭财产党内申报制度。健全公职人员任职、地域、公务等利益回避制度，建立完善防止利益冲突机制。全面推进基层党组织党务公开，深化政务、司法、村务和厂务公开机制建设，加大公共企事业单位办事公开力度。抓好纪检监察派驻机构统一管理，加强街镇基层纪检监察组织建设。充分发挥党的纪律监督、人大依法监督、政协民主监督、政府行政执法监督和司法监督的作用，发挥新闻媒体和公众舆论的监督功能。</p><p>　　（四）严肃查处腐败行为。旗帜鲜明地反腐败，始终保持惩治腐败的高压态势，严肃查处党员干部违纪违法行为。坚持依纪依法、安全文明办案，重点查办发生在领导机关和领导干部中的违纪违法案件，严重损害群众利益的案件，严重扰乱市场秩序案件背后的腐败问题，重大群体性事件及重大事故背后的腐败案件等。加大基层办案力度，认真解决发生在群众身边的腐败问题。把惩治作为一种更有效的预防，通过查办案件完善治本措施，有针对性地加强教育、完善制度、强化监督，把惩治成果更好地转化为预防成果。</p><p>　　四、建设廉洁诚信市场</p><p>　　（一）优化营商环境。贯彻公开公正透明和精简高效原则，进一步减少和规范行政审批。强化政府在经济调节、市场监管、社会管理和公共服务方面的职能，促进政府职能转变。加快以备案制为主的企业投资管理体制改革，探索“宽入严管”的企业登记管理新体系，降低市场准入成本。创新政府管理与服务，推广网上办事与审批，推进网络参政问政制度化。</p><p>　　（二）完善公共资源交易市场运行机制。搭建统一平台，建设市、区（县级市）、街（镇）三级公共资源交易平台，推进公共资源统一集中进场交易。扩大市场运作范围，逐步实现各项公共资源统一通过市场化进行配置。加强信息数字交易服务平台建设，进一步规范信息发布、投标资格审查、投标报价、开标评标、中标结果公示等交易程序。坚持市场优先原则，加快公共资源配置、公共资产交易、公共产品生产领域法规制度建设，降低行业准入门槛，消除市场准入障碍，允许和鼓励各种社会主体以多种形式参与。整合监督资源，健全监督机制，创新监管方式，确保公共资源交易市场机制健康运行。</p><p>　　（三）培育廉洁从业市场主体。完善公司法人治理结构和激励约束机制，规范国有企业党委会、董事会、经理层、监事会议事规则。落实完善国有资产监管有关制度，健全国有资本经营预算、企业业绩考核、境外国有资产监管、资产损失责任追究等制度。健全国有企业领导人员选拔任用、财务管理、薪酬管理、轮岗交流等制度，严格规范领导人员经营管理行为。加强国有企业纪检监察工作，深入开展企业效能监察，探索建立国有企业派驻巡查纪检监察机构。指导非公经济组织按照现代企业制度完善企业内部治理结构，建立权责明确、有效制衡的监管机制，把反腐倡廉的要求融入企业内部控制和经营管理流程。</p><p>　　（四）健全市场信用体系。加强企业信用信息征信工作，整合各部门诚信管理平台，建立统一公开共享的信用信息管理系统。健全信用等级评价机制，定期公布企业信用评级。建立和完善商业贿赂犯罪档案查询系统，并将有关记录作为市场准入和退出的依据。健全个人和企业信用信息披露制度和失信惩戒机制，在工程建设、政府采购、政府投资等领域实行信用准入制。</p><p>　　（五）完善市场监管体系。严厉打击欺行霸市、制假售假、商业贿赂，以及在统计、审计、评估、清算过程中存在的弄虚作假、欺诈等违法违规行为。以整顿和规范市场秩序为突破口，强化政府监管职能，整合执法资源，构建行政执法、行业自律、舆论监督和群众参与相结合的市场监管体系。完善市场准入体系和产品质量、服务质量、价格、金融监管体系，健全市场监管法规体系，创新市场监管方式方法，强化市场信用监管、行业自律和消费者权益保护等基础性工作。</p><p>　　五、建设廉洁城市文化</p><p>　　（一）加强廉洁诚信教育。深入开展纪律教育学习月活动，以领导干部为重点，深入开展理想信念教育、党性党风党纪教育和从政道德教育。大力加强政治品质和道德品行教育，促使党员干部模范践行社会公德、职业道德、个人品德、家庭美德。深入开展示范教育、警示教育和岗位廉政教育，把培育廉洁价值理念贯穿于党员干部培养、选拔、管理和使用全过程。结合企业文化建设和文明行业创建活动，加强行业职业道德教育，引导从业人员廉洁从业、诚信经营。加强社会公德教育，着力培养公民道德意识、诚信意识、法治意识，使廉洁守法、诚实守信成为全社会崇尚的价值取向。</p><p>　　（二）加大廉洁文化产品供给。把廉洁题材纳入各类艺术创作、影视制作及报刊、图书、音像出版计划，重点规划、扶持一批体现廉洁主题的创作项目，着力打造一批思想性艺术性强、群众喜闻乐见、富有广州文化特色的优秀廉洁文化作品。鼓励支持各级公共文化事业单位、专业艺术团体、广播影视机构、文化企业提供质优价廉的廉洁文化产品和服务。</p><p>　　（三）深化群众性廉洁文化活动。把廉洁文化活动与深化文明城市建设、推动美丽城乡建设相融合，深入开展廉政文化进机关、进社区、进学校、进家庭、进农村、进企业活动。按照“群众乐于参与、便于参与”的原则，大力扶持群众业余廉洁文化活动，指导、吸引群众参与、开展各类廉洁文化活动，开展廉洁文化“一区一品牌、一社区一特色”创建活动。</p><p>　　（四）拓展廉洁文化阵地和载体。充分挖掘广州作为岭南文化中心地、古代海上丝绸之路发祥地、中国近现代革命策源地、当代改革开放前沿地的文化资源，深化革命优良传统教育、廉洁文化教育、廉政研究、反腐倡廉培训及警示教育和影视制作六大基地建设。精心办好反腐倡廉媒体栏目。构建技术先进、传输快捷、覆盖广泛、形式生动的廉政文化产品传播平台，充分发挥大众传媒在传播廉洁文化中的重要作用。</p><p>　　六、建设廉洁公平社会</p><p>　　（一）加大民生领域防治腐败力度。深入推进纠风和专项治理，关注热点民生，重点整治群众反映强烈的教育、医疗、拆迁、劳动就业、食品安全、环境保护、社会治安、保障房建设等方面存在的突出问题。加强对中央和省、市关于惠民利民政策措施落实情况的监督检查，严肃查处损害群众利益的案件，切实维护群众合法权益。着力抓好基层党风廉政建设。</p><p>　　（二）加强社会组织反腐倡廉建设。积极培育和规范发展行业协会等社会组织，注重培育和提升社会组织参与社会管理和公共服务的能力。加强政府主管部门对社会组织的监管，加强社会领域党组织建设，指导社会组织进一步完善内部治理结构，推动社会组织建立廉洁从业委员会，完善和落实行业公约、行为规范、服务标准和反腐承诺。</p><p>　　（三）拓展群众参与廉洁建设渠道。充分发挥市民群众的积极性、主动性、创造性，组织开展廉洁机关、廉洁城区、廉洁企业、廉洁行业、廉洁家庭、廉洁校园、廉洁村居等创建活动。建立廉洁广州新闻发布、案件查处情况公开制度，举办“纪检监察开放日”活动，促进纪检监察工作更加透明规范。建立健全基层“两代表一委员”工作室，发挥党代表、人大代表、政协委员、特邀监察员、政风行风督察员的作用，倾听社会各界对反腐倡廉的意见建议。健全信访工作责任制，健全反腐倡廉网络举报、舆情监测研判、调查处理机制。认真落实保护举报人和证人办法，对突破重大案件有功的实名举报人实行奖励。推广建立社区党风廉政监察站、村务监督委员会，探索开展社区和农村廉情预警防控工作。发挥社会预防腐败机构作用，支持专家学者、咨询机构参与重大决策部署和政策法规制度的评估、论证。</p><p>　　七、落实工作措施和要求</p><p>　　（一）加强组织领导。市成立廉洁广州建设领导小组，市委主要领导任组长，办公室设在市纪委监察局。各区（县级市）、各部门是建设廉洁广州的责任主体，要结合实际制定具体工作意见或实施方案，明确工作任务、实施步骤和责任分工，抓好工作落实、分类推进。各级纪检监察机关要主动担负起组织协调、监督检查的责任，加强指导、有序推进，务求取得实际成效。</p><p>　　（二）强化评估考核。建立健全廉洁广州建设情况监督检查机制，把推进廉洁广州建设情况纳入领导班子和领导干部年度和任期考核的重要内容，列为党风廉政建设责任制考核的重点内容。建立廉洁广州建设情况通报交流制度。制定廉洁广州建设考核评估指标体系，探索引入第三方评价，定期对廉洁广州建设成效进行考核评估，建立廉洁广州建设奖惩机制。</p><p>　　（三）营造良好氛围。制定宣传计划，强化舆论引导，充分运用广播、电视、报纸和互联网等新闻媒体，大力宣传市委、市政府建设廉洁广州的决策部署，广泛宣传建设廉洁广州的好经验、好做法，加大先进典型的培养宣传力度。</p>','5','100','news','1388634981','1394614691');
INSERT INTO `post` (`id`,`category_id`,`model`,`title`,`alias`,`image_name`,`file_name`,`tinyint1`,`int10`,`char32`,`varchar30`,`varchar50`,`varchar100`,`varchar128`,`content`,`status`,`weight`,`view`,`created_at`,`updated_at`) VALUES
('29','14','news','关于推进党建创新工程的实施意见','66e4b08c21f159ef5e82b5f12e1b6a51','','','0','0','','','','','    为深入贯彻科学发展观，全面落实省第十一次党代会、市第十次党代会精神，根据《中共广州市委、广州市人民政府关于全面推进新型城市化发展的决定》，就推进党建创新工程，提出以下实施意见。　　一、目标任务...','<p>       为深入贯彻科学发展观，全面落实省第十一次党代会、市第十次党代会精神，根据《中共广州市委、广州市人民政府关于全面推进新型城市化发展的决定》，就推进党建创新工程，提出以下实施意见。</p><p>　　一、目标任务</p><p>　　1.以党的先进性和纯洁性建设为主线，以提高党的建设科学化水平为目标，以党建工作重心下移为抓手，以改革创新为动力，大力加强和改进党的思想建设、组织建设、作风建设、反腐倡廉建设和制度建设，进一步健全党员干部能力素质的提升机制，民主公开、竞争择优的选人用人科学机制，干部直接联系群众的常态机制，党员干部保持先进性和纯洁性的长效机制，全面构建起科学规范、运转有序的党内建设制度体系，为广州实施新型城市化发展战略提供坚强的组织保证。</p><p>　　二、思想理论武装行动计划</p><p>　　2.强化党性教育。坚持从政治修养、理论修养、作风修养和纪律修养等方面着手，教育党员干部讲政治、顾大局、守纪律，永葆共产党人的政治本色，增强政治敏锐性。及时学习宣传和贯彻落实中央和省委、市委的决策部署，在政治上、思想上、行动上自觉与中央保持高度一致，在大是大非面前始终做到头脑清醒、立场坚定，把智慧力量全面凝聚到推动新型城市化发展上来。（牵头单位：市委宣传部，配合单位：市委党校、市委组织部）</p><p>　　3.建设学习型党组织。组织党员、干部深入学习和掌握马克思列宁主义、毛泽东思想，深入学习掌握包括邓小平理论、“三个代表”重要思想以及科学发展观等重大战略思想在内的中国特色社会主义理论体系，自觉用科学发展观武装头脑、指导实践、推动工作。开展党的先进性和纯洁性学习教育，增强党性意识、创新意识和宗旨意识，提高科学执政能力和领导水平。坚持理论联系实际，引导党员、干部认真学习哲学、历史、现代市场经济、现代管理知识和世界前沿理论、科技创新知识，及时更新观念、解放思想、推动创新，提高战略思维、创新思维、辩证思维能力；认真研究解决群众最关心最直接的实际问题、新型城市化发展的重大问题、党的建设突出问题，增强工作的针对性、原则性、系统性、预见性和创造性。完善和落实党委（党组）中心组理论学习制度，各级党委（党组）中心组集中学习时间每年不少于8天，每年至少召开1次务虚会，市、区（县级市）党委中心组每两个月至少举办1次学习报告会。坚持每两年集中开展1次党性分析活动。市委每月举办1次广州学习论坛。（牵头单位：市委宣传部，配合单位：市委党校、市委组织部）</p><p>　　4.开展党员干部大轮训。深化新型城市化发展学习考察调研，加强党校培训主阵地、主渠道建设，用好用活国内外高校和科研机构优质资源，不断创新培训方法。认真实施党政机关、企事业单位领导干部和后备干部培训工程，重点抓好党政正职的集中培训，每年安排100名左右领导干部到国（境）外培训，局级以上党政领导干部5年内累计参加脱产培训不少于3个月，切实提高领导新型城市化发展的能力和水平；认真推进干部培训网络大学堂建设，丰富培训内容，为领导干部提供有针对性的网络培训指导和服务。认真实施基层党员干部大培训工程，重点抓好街（镇）党政正职、社区（村）和“两新”组织党组织书记的培训，重视抓好党代表、党小组长、居（村）民代表等培训，着力提高基层党员干部解决实际问题的能力；大力开展“送培训下基层”活动，把更多培训资源向基层倾斜。（牵头单位：市委组织部，配合单位：市委党校、市人力资源和社会保障局、市国资委、市科技和信息化局、市卫生局、市教育局）</p><p>　　三、建设高素质干部队伍行动计划</p><p>　　5.提升领导干部能力素质。认真贯彻落实省委关于加强市、县领导班子建设的意见和市委的实施意见，加强领导班子和领导干部能力建设，着力打造一支素质高、执行力强、敢于攻坚克难、敢于担当的干部队伍，优化领导班子结构，提高领导班子整体素质，为推动新型城市化发展，率先转型升级、建设幸福广州提供坚强的组织保证。选拔一批在经济、科技、法律、城市建设管理和社会管理等领域具有较高水平和能力的优秀干部进入各级领导班子。（牵头单位：市委组织部）</p><p>　　6.深化干部人事制度改革。坚持德才兼备、以德为先的用人标准，把德的表现作为干部选拔任用的首要依据。坚持“以干论官”和“以事评官”，选用想干事、爱干事的干部，重用会干事、干成事的干部。突出加强干部德的考核，把群众和服务对象的口碑作为评价干部德的重要因素，完善干部德的考核方式办法，考准考实干部的德。进一步完善各级党政领导班子和领导干部年度考核工作，强化考核结果运用。全面考核干部实绩，从实绩看德才，凭德才用干部。进一步完善和扩展专项考核，在落实重大部署、完成重大任务中考察识别干部。进一步提高选人用人公信度，扩大干部工作民主，提高公开透明程度，完善差额考察、延伸考察和考察对象公示措施，增强考察准确性，全面准确地评价干部。进一步加大干部交流力度，重点做好主要领导干部、关键岗位干部、有培养前途的优秀年轻干部的交流和培养选拔工作，加大市直部门和区（县级市）、街（镇）之间干部交流任职的力度。进一步推进竞争性选拔干部工作，完善公开选拔、公开遴选、竞争上岗和差额选拔等方式，提高竞争性选拔干部的质量，推进竞争性选拔干部工作经常化、制度化、规范化。探索建立干部职务与职级相结合制度，进一步调动干部积极性。（牵头单位：市委组织部）</p><p>　　7.加强干部队伍战略性培养。把基层一线作为培养锻炼干部的基础阵地，坚持从基层培养选拔机关领导干部，完善机关干部到基层锻炼工作制度，有计划地安排缺乏基层工作经历的机关年轻干部到基层锻炼，实施干部队伍建设“三挂三选三交流”工程。健全机关干部挂职锻炼制度，安排缺乏基层工作经验的机关干部到基层单位挂职锻炼，推进“70后”、“80后”处、科级干部双向挂职工作。实施千名博士引进工程和千名优秀年轻干部“引进来”、“走出去”工程，把更多优秀年轻干部集聚到广州新型城市化发展的事业中来。安排新录用机关公务员到基层单位工作一年，以锻炼干部、充实基层。重视做好大学生村官培养工作，招录优秀大学毕业生到基层任职。从新型城市化长远发展和人才战略储备需要出发，加大培养锻炼年轻干部工作力度。（牵头单位：市委组织部）</p><p>　　8.培育企事业领导人才。实施羊城企业家培养工程，制定市管企业经营管理人才队伍建设规划，集聚和培育一批优秀企业家，形成符合企业特点、充满生机活力的企业家梯队建设机制，强化市管企业领导班子建设。实施羊城高校领导人才培养工程，突出高校领导班子办学治校能力建设，集聚和培育一批优秀高校领导人才，形成具有高校特点、科学合理的高校领导人才选拔培养机制，强化市属高校领导班子建设。实施市管企业、市属高校领导班子结构优化工程，拓宽选人用人的视野和渠道，选好配强党政正职领导，注重选拔一批优秀年轻干部担任正职领导，到2015年每个市管企业、市属高校领导班子中50岁以下的成员应超过一半，其中40岁左右的成员应有一至两名。（牵头单位：市委组织部，配合单位：市国资委、市教育局）</p><p>　　9.创新党管人才工作。健全党管人才领导体制和工作格局，发挥党委（党组）在人才工作中的核心领导作用，形成组织部门牵头抓总，职能部门各司其职、密切配合的人才工作格局，完善党管人才的科学决策、分工协作、沟通交流和督促落实机制。创新党管人才方式方法，以高层次和高技能人才为重点，统筹推进各类人才队伍建设，加快“人才特区”建设。实行人才工作目标责任制，建立健全人才工作考核制度。坚持人才投资优先保证，建立健全政府、社会、用人单位和个人多元化投入机制。（牵头单位：市委组织部，配合单位：市人力资源和社会保障局）</p><p>　　四、固本强基行动计划</p><p>　　10.优化基层党组织设置。创新村级党组织设置模式，构建起党在农村工作中横向到边、纵向到底的组织架构。创新街道社区党组织设置模式，探索实行街道“大党工委”制，形成区域化大党建格局，增强党在城市基层的创造力、凝聚力和战斗力。创新“两新”组织党组织设置模式，分类运用单独组建、园区联建、挂靠组建、商会带建等多种方式，确保到2014年，“两新”组织党组织的覆盖率达到75%以上，党的工作实现全覆盖。健全“两新”组织党组织领导体制和工作机构。加强和改进国有企业、机关、高校党建工作，更好地发挥基层党组织的战斗堡垒作用和党员的先锋模范作用。创新离退休党支部设置方式、活动方式和活动内容，充分发挥离退休干部党组织在建设幸福广州中的积极作用。（牵头单位：市委组织部，配合单位：市“两新”组织党工委、市国资委、市直机关工委、市教育局、市委老干部局、市民政局、市农业局、市编办、市非公有制经济组织党工委、市社会组织党工委）</p><p>　　11.健全基层党内服务体系。进一步加大投入，完善基层党组织、党员“零距离服务网络”，到2013年全市各街（镇）至少建立1个党员服务站。发挥区（县级市）党员服务中心、街（镇）党员服务站、社区（村）党员之家的作用，打造市级党内服务平台。健全市和区（县级市）、街（镇）、社区（村）党员志愿者四级服务网络，进一步推动党员志愿服务经常化、制度化。（牵头单位：市委组织部，配合单位：市民政局、市农业局、市非公有制经济组织党工委、市社会组织党工委）</p><p>　　12.建设便民服务直通车。建立健全镇（街）“政务服务中心”、行政村“公共服务站”、自然村“公共服务点”便民服务网络（简称“一点一站一中心”），充分发挥党员先锋模范作用，将服务下沉到基层、送到村民家门口，为群众提供全方位、一体化的便捷服务。2013年底全面完成“一点一站一中心”站点场所建设。（牵头单位：市委组织部，配合单位：市民政局、市财政局、市农业局）</p><p>　　13.整合社区党建资源。统筹社区党建资源，切实从人员、经费、活动场所等多方面加大对社区党建工作的投入，不断增强社区党组织整合各种资源、协调各方力量的能力。推动驻社区单位积极联系和服务所驻社区，发动驻社区单位党组织以自身的各种资源和优势，积极支持和参与社区党建工作，形成社区共驻共建共享机制。（牵头单位：市委组织部）</p><p>　　14.建设“五强”带头人队伍。拓宽基层党组织带头人来源渠道，创新培养管理机制，着力打造思想政治素质强、科学发展本领强、民主团结能力强、群众工作能力强、廉洁自觉性强的基层党组织带头人队伍。选好配强基层党组织书记，探索从区（县级市）直部门和街（镇）机关中选派优秀干部担任村“第一书记”，完善长期任职村党组织书记的退出机制及安置办法，在社区党委（党总支）配备专职副书记（与居委会副主任同等待遇），打造一支政治强、业务精、作风好、肯奉献的基层党务干部队伍。对担任社区（村）“两委”正职累计满15年、正常离任且在任职期间获得市级以上综合性荣誉称号的优秀社区（村）党组织书记或居（村）委会主任，男性从60岁、女性从55岁起发放政府奖励津贴。（牵头单位：市委组织部，配合单位：市人力资源和社会保障局、市总工会、市民政局、市农业局、市非公有制经济组织党工委、市社会组织党工委）</p><p>　　15.强化基层党建经费保障。进一步健全社区党建工作经费保障机制，逐步形成以财政投入为主、党费和社会支持为补充的社区党建经费保障体系。建立稳定规范的农村基层组织工作经费保障制度，探索完善市、区（县级市）财政和村集体统筹解决村干部待遇报酬机制，完善村干部补贴激励制度。采取固定补贴与一次性补贴相结合的方式，建立离任村干部生活补贴制度。健全以财政投入为主的“两新”组织党建工作经费制度。制定党建工作经费规范使用管理规定。（牵头单位：市委组织部，配合单位：市财政局、市民政局、市农业局、市人力资源和社会保障局、市非公有制经济组织党工委、市社会组织党工委）</p><p>　　五、创新党员教育管理行动计划</p><p>　　16.开展在职党员进社区活动。动员在职党员主动到居住地社区报到，亮出党员身份，参与社区党建和社区服务各项工作，接受群众监督，成为组团式联系服务群众的骨干力量，实现在职党员走进社区、联系群众的全覆盖。从2013年起，将在职党员干部参与社区活动、服务基层群众的表现情况，作为年度考核、评先评优、提拔使用等参考依据。（牵头单位：市委组织部，配合单位：市直机关工委、市民政局、市非公有制经济组织党工委、市社会组织党工委）</p><p>　　17.实施农村“四个培养”工程。坚持把党员培养成能人、把能人培养成党员、把党员能人培养成村干部、把优秀村干部培养成村党组织书记。到2017年，村“两委”成员中党员能人比例达到30%，能人村书记、主任比例达到40%，农村党员、干部队伍结构进一步改善。实施羊城村官上大学工程，全面提升农村干部队伍能力素质。（牵头单位：市委组织部，配合单位：市民政局、市农业局、市教育局）</p><p>　　18.开展“两新”组织“双强六好”党组织创建活动。结合“两新”组织实际，以党建强、发展强为目标，按照生产经营好、企业文化好、劳动关系好、党组织班子好、党员队伍好、社会评价好的标准，广泛开展“双强六好”党组织创建活动和党员示范岗、党员责任区、党员公开承诺活动，促进企业党组织履职尽责创先进、广大党员立足岗位争优秀。（牵头单位：市“两新”组织党工委，配合单位：市非公有制经济组织党工委、市社会组织党工委）</p><p>　　19.实施高端人才党建工程。在高端人才聚集地成立高端人才党组织，发挥党组织的政治核心和政治引领作用，把高端人才紧紧凝聚到党组织周围。重视在高端人才中发展党员工作，不断激发和调动高端人才的政治热情。建立党政领导干部直接联系高端人才党员制度，为各类高端人才提供良好的创新创业环境。（牵头单位：市委组织部，配合单位：市“两新”组织党工委、市人力资源和社会保障局）</p><p>　　20.创新流动党员管理服务。加强与流出地党组织的沟通联系，探索多种形式建立流动党员党组织，把流动党员纳入党组织的教育管理和服务，打造流动党员的“新家”。采取动态管理方式，构建主动接纳、主动服务、主动关爱流动党员的工作机制。充分发挥流动党员作用。（牵头单位：市委组织部）</p><p>　　21.加强党员教育管理信息化建设。结合智慧城市建设，加强“广州党建网”、“广州党员干部现代远程教育网”建设，探索开办广州党建电视频道，全面推广全市党员、党组织管理信息系统。在“两新”组织、流动党员服务中心、机关事业单位和学校等领域建立远程教育站点，实现远程教育站点的全覆盖。以互联网为依托，开设党建QQ群、党建共享邮箱等，开展“网上组织生活”，办好“空中课堂”。（牵头单位：市委组织部，配合单位：广州广播电视台、市直机关工委、市教育局、市非公有制经济组织党工委、市社会组织党工委）</p><p>　　22.健全党内激励关怀帮扶机制。采用财政投入、党员捐献等多种方式，大力发展各级党内关爱互助金，建立困难党员信息库，加大帮扶力度。更加注重在基层一线培育、表彰优秀共产党员和优秀党务工作者。更加注重关心基层干部，每三年评选表彰一批市级优秀基层党组织书记和优秀干部（享受同级先进工作者待遇），定期组织优秀基层党组织书记和优秀干部参加休假疗养。（牵头单位：市委组织部，配合单位：市人力资源和社会保障局、市民政局、市农业局、市财政局）</p><p>　　23.健全党员联系服务群众制度。健全党员创先争优长效机制，继续开展“羊城先锋行动”，积极组织党员参加党员责任区、党员示范岗和社会公益等活动。依托扶贫帮困信息平台，在社区（村）、“两新”组织、国有企事业单位等领域，开展党员联系户活动，组织有帮扶能力的党员帮助联系户排忧解难。（牵头单位：市委组织部，配合单位：市直机关工委、市国资委、市教育局、市农业局、市非公有制经济组织党工委、市社会组织党工委）</p><p>　　六、发展党内民主行动计划</p><p>　　24.完善党内民主决策机制。坚持和完善民主集中制，坚持民主基础上的集中和集中指导下的民主相结合、集体领导和个人分工负责相结合，进一步规范决策程序和议事规则。健全重大事项民主决策和公示制度、督查落实制度和决策失误责任追究制度等。认真落实一报告两评议制度，进一步发挥全委会在重大问题决策和重要干部选拔任用中的作用。（牵头单位：市委组织部，配合单位：市纪委、市委办公厅）</p><p>　　25.推进基层党组织民主选举。在社区普遍推行“三推一评一选”，在村普遍推行“两推一选”。在机关各级党组织、高校学生党组织、中小学非校本级的党组织、“两新”组织党组织推行领导班子“公推直选”。建立健全党员定期评议基层党组织领导班子成员等制度，推行基层党组织领导班子成员任职承诺，进一步落实党员的知情权、参与权、选举权和监督权。（牵头单位：市委组织部，配合单位：市直机关工委、市教育局、市国资委、市民政局、市非公有制经济组织党工委、市社会组织党工委）</p><p>　　26.促进党代表履职常态化。扩大党代表对党委重大决策的参与，充分发挥党代表民主监督作用。全市性重大问题决策前，广泛征求党代表的意见，全市性重要文件的起草，邀请党代表参与。完善党代表视察、调研制度，每年组织党代表开展视察、调研不少于1次。邀请党代表列席本地区领导班子民主生活会，参加重要干部民主推荐、公推公选等活动。统筹安排各级党代表到工作室履职，做到区域领域全覆盖、代表全参与、活动全开展，党代表到工作室开展活动每年不少于2次。市、区（县级市）领导班子成员中的党代表每2个月组团到党代表工作室接待党员群众。深入推进党代表任期制，及时总结推广党代会常任制试点经验。（牵头单位：市委组织部）</p><p>　　27.健全基层民主管理制度。在农村基层全面推行“五民主工作法”（即村民民主提事、民主决事、民主理事、民主监事和新村民民主参与），保证村民依法行使民主权利。（牵头单位：市委组织部，配合单位：市民政局、市农业局）</p><p>　　28.扩大基层党员政治参与。进一步优化党代会代表结构，逐步增加基层代表特别是来自生产一线的代表，探索推选基层一线优秀党员进入各区（县级市）党的委员会。市、区（县级市）召开有关重要会议，评议、推荐、考察领导班子和领导干部，根据有关要求邀请基层党员参加。（牵头单位：市委组织部）</p><p>　　29.完善民情表达机制。拓宽基层党组织与群众定期沟通的有效途径，推行“民主恳谈会”、“民情议事会”、“民情快车道”等形式，建立健全“居（村）事群议”的多元互动机制。（牵头单位：市委组织部，配合单位：市民政局、市农业局、市社工委）</p><p>　　七、改进机关作风行动计划</p><p>　　30.强化群众路线教育。强化机关干部宗旨意识和群众路线教育，引导机关党员干部坚定理想信念、加强党性锻炼，坚持立党为公、执政为民，把为人民服务的宗旨意识、党性原则、群众观念转化为服务群众的实际行动，进一步发挥党密切联系群众的优势。（牵头单位：市直机关工委，配合单位：市委党校、市委宣传部、市委组织部）</p><p>　　31.坚持“一线工作法”。大兴调查研究、密切联系群众之风，认真落实机关党员干部“三深入”（深入实际、深入基层、深入群众）制度。推行“一线工作法”，切实做到“工作在一线落实、问题在一线解决、成效在一线体现、考核在一线实施”。开展领导干部蹲点调研活动。在不同类型、不同层面、不同领域基层党组织中建立领导干部联系点，实现领导干部直接联系基层和群众的全覆盖。控制文山会海，腾出更多时间、更多精力下沉到基层开展工作，解决实际问题。（牵头单位：市直机关工委，配合单位：市委办公厅、市委组织部）</p><p>　　32.健全机关与基层结对共建机制。构建城乡党组织互帮互助机制，组织城区基层党组织与农村基层党组织深入开展“一帮一”结对共建活动，组织机关党组织与“两新”组织党组织开展结对共建活动。采取“一社区（村、企业）一名干部”的形式，开展机关干部直接联系社区、村和企业活动。在全市机关和事业单位中广泛开展“四民”公开承诺（即感情亲民、政策惠民、服务便民、实事利民）活动，增强联系基层、服务群众实效。（牵头单位：市直机关工委，配合单位：市委组织部）</p><p>　　33.健全机关作风整改机制。以基层评议机关活动为载体，扩大群众评议监督机关作风的参与面。设立机关作风监测点，开展明查暗访和网上征集意见，扩大日常评议监督渠道。把评议活动向区（县级市）、街（镇）延伸，形成三级机关作风建设联动机制。借助媒体强化监督。把各部门机关作风评议情况与领导班子、领导干部考核结合起来，切实运用好评议结果。（牵头单位：市直机关工委）</p><p>　　34.大力治理“庸懒散”。实施机关干部绩效考核，把推动新型城市化发展的实绩作为干部选拔、任用、考评的重要依据。研究调整不适宜担任现职干部的办法，让能者上、庸者下。完善问责制，对能力不足、得过且过、不作为、慢作为、自由散漫的干部，视情形采取责令公开道歉、停职检查、引咎辞职、责令辞职、免职等方式予以问责。（牵头单位：市直机关工委，配合单位：市纪委、市委办公厅、市委组织部、市政府办公厅、市人力资源和社会保障局）</p><p>　　八、反腐倡廉行动计划</p><p>　　35.带头建设廉洁广州。认真贯彻落实廉洁广州建设要求，把推进廉洁广州建设情况纳入领导班子和领导干部年度和任期考核的重要内容，列为党风廉政建设责任制考核的重点内容。广大共产党员带头推动廉洁政治、廉洁市场、廉洁文化、廉洁社会建设，努力成为建设廉洁广州的表率。（牵头单位：市纪委，配合单位：市委组织部）</p><p>　　36.深化反腐倡廉宣传教育。把培育廉洁价值理念纳入党员干部教育培训计划和党委（党组）理论中心组学习内容，深入开展党性党风教育、政治品质和道德品行教育、警示教育和岗位廉政风险教育。继续推进廉政文化进机关、社区、学校、农村、企业、家庭，完善反腐倡廉舆论引导机制。（牵头单位：市纪委，配合单位：市委组织部、市委宣传部、市直机关工委、市民政局、市教育局）</p>','5','90','news','1388642437','1388642490');
INSERT INTO `post` (`id`,`category_id`,`model`,`title`,`alias`,`image_name`,`file_name`,`tinyint1`,`int10`,`char32`,`varchar30`,`varchar50`,`varchar100`,`varchar128`,`content`,`status`,`weight`,`view`,`created_at`,`updated_at`) VALUES
('30','12','news','孵化基地出席参加广州市科协 “中国科协会员日”活动','75feeba53ee572b2e28a17b6d5afbb52','4c290f1190bd9c62fac4d6bf2d114efb.jpg','','0','0','','','','','       12月23-24日，广州市科协在增城举办“中国科协会员日”活动，邀请市科协团体会员代表和各区县科协代表共150人座谈联谊。广州市科技类社会组织孵化培育基地、广东博士俱乐部作为广州市科协团...','<p>       12月23-24日，广州市科协在增城举办“中国科协会员日”活动，邀请市科协团体会员代表和各区县科协代表共150人座谈联谊。广州市科技类社会组织孵化培育基地、广东博士俱乐部作为广州市科协团体会员、企事业单位会员参加了本次活动。</p><p style=\"text-align: center;\">       <img src=\"/upload/images/4c290f1190bd9c62fac4d6bf2d114efb.jpg\" alt=\"\"></p><p style=\"text-align: center;\">大会现场</p><p>       市科协党组书记、副主席冯元在座谈会指出，市科协将继续打造好“中国科协会员日”的活动品牌，扩大科协联系科技工作者的渠道；学会作为联系科技工作者的基础，市科协将坚持以抓好学会工作为突破口，创新科协组织的活动方式，建立学会科技服务站。并对学会科技服务站进行授牌。</p><p style=\"text-align: center;\"><img src=\"/upload/images/29c608a12f6d1a6616bbab966887f20a.jpg\"></p><p style=\"text-align: center;\">会上科协冯元书记发表重要讲话</p><p>       在本次会员日活动上，冯元书记充分肯定了广州市科技类社会组织孵化培育基地的工作，并分别为广州市科技类社会组织孵化培育基地科技服务站和广东博士俱乐部科技服务站授牌。</p><p style=\"text-align: center;\"><img src=\"/upload/images/02516bdfcf56d18e5d446214eac95c03.jpg\"></p><p style=\"text-align: center;\">广州市科协领导为广州市科技类社会组织孵化培育基地、广东博士俱乐部科技服务站授牌</p>','10','88','news','1388643079','1388645710');
INSERT INTO `post` (`id`,`category_id`,`model`,`title`,`alias`,`image_name`,`file_name`,`tinyint1`,`int10`,`char32`,`varchar30`,`varchar50`,`varchar100`,`varchar128`,`content`,`status`,`weight`,`view`,`created_at`,`updated_at`) VALUES
('31','12','news','省、市科学技术协会领导莅临广州市科技类社会组织孵化培育基地考察','6a7228ff9e62c453cfa802872ef1533e','4bf9dca5b3dca1332e863c25e19b339f.jpg','','0','0','','','','','       2013年12月2日下午，广东省科学技术协会党组书记何真、办公室主任吴仕高等省科协领导一行，在广州市科学技术协会学会党组书记冯元、副主席杨晓、叶显玉，秘书长邓宇进、学会部部长何志勤的陪同...','<p>       2013年12月2日下午，广东省科学技术协会党组书记何真、办公室主任吴仕高等省科协领导一行，在广州市科学技术协会学会党组书记冯元、副主席杨晓、叶显玉，秘书长邓宇进、学会部部长何志勤的陪同下考察了广州市科技类社会组织孵化培育基地，并在广州市科技类社会组织孵化培育基地赵根文秘书长的引领下参观了孵化培育基地。</p><p>       杨晓副主席对孵化培育基地的运营情况以及孵化培育基地的开放性、公益性及进驻门槛等作了详细的介绍，省科协领导对孵化培育基地的硬件设施及创新服务等软件配套工作给予极大肯定，并就如何办好科技类社会组织孵化培育基地、做好科技人才服务、党建工作以及促进和推动科技类社会组织的发展提出了建设性意见。何真书记同时勉励孵化培育基地要充分发挥培育基地的孵化、培育职能，为科技类协会的发展提供实效的服务。</p><p style=\"text-align: center;\"><img src=\"/upload/images/4bf9dca5b3dca1332e863c25e19b339f.jpg\"></p><p style=\"text-align: center;\">省、市科协领导参观孵化培育基地党员活动中心</p><p style=\"text-align: center;\"><img src=\"/upload/images/cdd7a0c276cb6037c2b12c18c9ab6fec.jpg\"></p><p style=\"text-align: center;\">省、市科协领导参观博士俱乐部</p>','5','100','news','1388644272','0');
INSERT INTO `post` (`id`,`category_id`,`model`,`title`,`alias`,`image_name`,`file_name`,`tinyint1`,`int10`,`char32`,`varchar30`,`varchar50`,`varchar100`,`varchar128`,`content`,`status`,`weight`,`view`,`created_at`,`updated_at`) VALUES
('32','12','news','广东省民防协会人防工程管理学术沙龙顺利举行','e79ecbd73f8f2ab75deea7c09eae944c','f2ed0fa90bb98103b0f7f3b430c661f1.jpg','','0','0','','','','','在广东省人民防空办公室的大力支持和指导下，由广东省民防协会主办、广东博士俱乐部承办的“人防工程管理”学术沙龙于12月1日在广东博士俱乐部交流中心顺利举行。广东省民防协会会长唐甸华、广东省民防协会专家委...','<p>       在广东省人民防空办公室的大力支持和指导下，由广东省民防协会主办、广东博士俱乐部承办的“人防工程管理”学术沙龙于12月1日在广东博士俱乐部交流中心顺利举行。广东省民防协会会长唐甸华、广东省民防协会专家委员会主任安关峰、广东省民防协会专家委员会副主任李彰明、陈长缨、李奇林、李飏、各专业委员会的代表、相关部门领导和相关专业的代表出席了会议。</p><p>       会上，唐甸华会长首先介绍了此次沙龙的主题，阐述了目前广东省人民防空事业的现状，并列举了一些人防工程出现的管理问题，证明广东省人防工程管理体系建设的必要性和迫切性。针对人防工程建成后的管理、维护及使用存在的不足之处，必须要通过专家的研讨、媒体的宣扬，引起公众、政府及国家对人防工程管理事业的重视，从而健全人防工程管理的体系，让人防工程能够更好的服务社会。随后，到会的各领域专家也积极发表了自己的见解。广州中医药大学第二附属医院急诊科主任周红提出应加强人防工程管理人员培训的力度，让人防设备和工程能从现在的“没人会用”转变到“有人会用”乃至“人人会用”的程度；她还提出人防工程管理人员培训应包含应急，急救方面的课程。老工程师协会的冯海涛工程师也提出了人防工程管理不到位导致很多设备在关键时刻都形同虚设，制定现代人防设备管理新标准刻不容缓。另外，其他专家代表也从人防工程的科学使用、人防工程的在法律法规的建立以及管理体系建设和宣传教育等不同角度提出了自己的见解和建议。</p><p>       沙龙最后由安关峰主任作出总结，提出人防工程管理需要从技术、法律、管理、医疗四大方面进行建设。并提出要从体系建设，科学使用，应急急救，宣传教育四个部分去构建广东省现代人防工程管理体系。省民防协会专家委员会将在近期把社会各界的建议进行深入研究，最后将研究成果编制成人防工程管理体系白皮书，并呈交相关部门。</p><p>  最后，沙龙在各专家代表的热烈研讨中圆满结束。</p><p style=\"text-align: center;\"><img src=\"/upload/images/f2ed0fa90bb98103b0f7f3b430c661f1.jpg\"></p><p style=\"text-align: center;\">广东省民防协会唐甸华会长发言</p><p style=\"text-align: center;\"><img src=\"/upload/images/862c7688ffcb3c360bcdf477c25ece98.jpg\"></p><p style=\"text-align: center;\">专家代表发言(一)</p><p style=\"text-align: center;\"><img src=\"/upload/images/c20721ca011c6bef4e870ae6e50d4328.jpg\"></p><p style=\"text-align: center;\">专家代表发言(二)</p><p style=\"text-align: center;\"><img src=\"/upload/images/4dde08cdab5fcbf893800e23784bfc1e.jpg\"></p><p style=\"text-align: center;\">广东省民防协会专家委员会主任作会议总结</p><p style=\"text-align: center;\"><img src=\"/upload/images/fe0e400106226f4a52af217f211c266d.jpg\"></p><p style=\"text-align: center;\">广东省民防协会“人防工程管理”学术沙龙专家合影 </p>','1','100','news','1388644847','1389258115');
INSERT INTO `post` (`id`,`category_id`,`model`,`title`,`alias`,`image_name`,`file_name`,`tinyint1`,`int10`,`char32`,`varchar30`,`varchar50`,`varchar100`,`varchar128`,`content`,`status`,`weight`,`view`,`created_at`,`updated_at`) VALUES
('34','0','single','科技服务中心','kj','','','0','0','','','','','科技服务中心','<p>
	<span  style=\"font-size: 18px;\"></span><span  style=\"font-size:14px;\">广东博士科技服务中心是广东博士俱乐部有限公司专业从事知识产权申报与交易、科学技术培训与推广、科技成果培育与转化的科技服务机构。</span></p><p>
	<span  style=\"font-size: 14px; \">    本中心依托广东博士俱乐部庞大的博士、专家队伍，整合高校、科研机构、科技类社会组织及行业协会资源，运用先进的科学技术和信息化管理手段，打造一支高效、专业的科技服务团队，承接政府职能转移，为企事业单位、社会组织等提供优质的科技服务。</span><span  style=\"font-size: 14px; \"></span></p><p>
	    广东博士科技服务中心秉承\"科技服务社会，创新引领未来\"的服务理念，坚定 \"做科技服务引领者\"的发展目标，为科技强省做出应有贡献!</p><p align=\"center\" style=\"text-align: center;\"></p><p align=\"left\" style=\"text-align: left; color: rgb(0, 102, 255); font-weight: bold; \">
	<span  style=\"font-size: 22px; \">服务范围：</span></p><p align=\"left\" style=\"text-align: left; color: #06F; font-weight: bold; font-size: 16px;\">
	知识产权服务</p><ul>
	
<li>信息服务：检索分析、数据库建设</li>	
<li>代理服务：申请、注册、登记、申报</li>	
<li>应用转化服务：质押融资、托管、经营</li>	
<li>咨询服务：法律服务、管理咨询、战略咨询</li>	
<li>交易服务：评估、转让、置换</li>	
<li>培训服务：知识产权普及、推广应用</li></ul><p align=\"left\" style=\"text-align: left; color: #06F; font-weight: bold; font-size: 16px;\">
	科学技术服务</p><ul>
	
<li>科学技术培训服务：人才培训、技术培训</li>	
<li>科学技术推广服务：交流、普及、升级和改造</li>	
<li>科学技术评估与鉴证：咨询、评估和鉴定</li></ul><p align=\"left\" style=\"text-align: left; color: #06F; font-weight: bold; font-size: 16px\">
	科技成果服务</p><ul>
	
<li>科技成果的展览展示服务</li>	
<li>科技成果评估和鉴定服务</li>	
<li>科技成果推广服务：科技成果传播、产学研服务</li>	
<li>科技成果转化服务：科技成果的孵化、培育、应用</li>	
<li>科技成果管理服务：科技成果的收集、登记、统计、分析、跟踪</li></ul><p align=\"left\" style=\"text-align: left; color: #03C; font-weight: bold; font-size: 16px;\">
	商会协会服务</p><ul>
	
<li>学会之家：联谊活动、学术交流、科技成果展示、科普宣传和科技服务</li>	
<li>培育基地：培训指导、孵化扶持、管理服务、咨询代理</li>	
<li>信息平台：科技信息、科普信息、创新信息、政务信息</li>	
<li>科技集市：科技人才、科技类社会组织、科技成果展示、成果转化的交流平台</li>	
<li>商务服务：商务礼仪、托管服务</li></ul><p align=\"center\">
	<img src=\"/upload/images/191604eacfad02e4f290581b4aac11d6.jpg\">
	<img src=\"/upload/images/d686014db9a8914bc7a15525f0eb634d.jpg\"></p>','1','100','single','1389172684','1394609157');
INSERT INTO `post` (`id`,`category_id`,`model`,`title`,`alias`,`image_name`,`file_name`,`tinyint1`,`int10`,`char32`,`varchar30`,`varchar50`,`varchar100`,`varchar128`,`content`,`status`,`weight`,`view`,`created_at`,`updated_at`) VALUES
('35','0','single','人才服务中心','rq','','','0','0','','','','','人才服务中心','<p>
	<span  style=\"font-size: 16px; \">    广东博士俱乐部人才服务中心是广东博士俱乐部有限公司专为高端人才提供经营服务；为企业提供人力资源整体解决方案；为基础人才提供技能、学历提升服务的专业机构。</span></p><p>
	<span  style=\"font-size: 16px; \">    本中心依托广东博士俱乐部庞大的博士、专家队伍，整合高校、科研究所、社会团体等资源，运用先进的人才服务理念和现代的信息管理手段，打造一支高效、专业的人才服务团队，承接政府职能转移，并为企业提供优质的人才服务。</span></p><p>
	<span  style=\"font-size: 16px; \">    广东博士俱乐部人才服务中心秉承“服务人才，造福社会”的服务理念，为人才强省和人才强企做出应有贡献！</span></p><p>
	<span  style=\"font-size: 16px; \"></span></p>
<table width=\"2\" border=\"0\" cellpadding=\"10\" align=\"center\">
<tbody>
<tr>
	<td>
		<img src=\"/upload/images/a0aece27ac067d701f6cc87e22781a08.jpg\" width=\"250\" height=\"167\" alt=\"\">
	</td>
	<td>
		<img src=\"/upload/images/ebfd64d5dc1dbd5ba1e29f271e1d26f2.jpg\" width=\"250\" height=\"167\">
	</td>
	<td>
		<img src=\"/upload/images/d952adf49085e99b3dd19193d7ea3ebb.jpg\" width=\"250\" height=\"167\">
	</td>
</tr>
</tbody>
</table><p align=\"center\" style=\"text-align: center;\"></p><p align=\"left\" style=\"text-align: left; font-weight: bold; font-size: 16px;\">
	<br>
	服务范围：</p><ul>
	
<li><span  style=\"font-size: 16px; \">高端人才服务：人才测评、猎头服务、科研合作、在职研究生项目等；人才经营服务</span></li>	
<li><span  style=\"font-size: 16px; \">企业人力资源服务：代理招聘、劳务派遣、人事代理、校企办学等；</span></li>	
<li><span  style=\"font-size: 16px; \">基础人才服务：职业教育、合作办学、技能培训、学历提升等；</span></li></ul>','1','100','single','1389173253','1393312092');
INSERT INTO `post` (`id`,`category_id`,`model`,`title`,`alias`,`image_name`,`file_name`,`tinyint1`,`int10`,`char32`,`varchar30`,`varchar50`,`varchar100`,`varchar128`,`content`,`status`,`weight`,`view`,`created_at`,`updated_at`) VALUES
('36','10','news','博士俱乐部应邀出席从化经济开发区科协举办的塑料产业科技创新联盟成立大会暨科技服务站挂牌仪式','f7afe2b6eef2af5e55b3d9fd0974426d','eec1adf3e53aceee858aea0fb8f511aa.jpg','','0','0','','','','','       2013年12月31日，由从化经济开发区科协牵头组织、从化经济开发区大力支持的，从化地区22家塑料企业及研究机构发起的从化塑料产业科技创新联盟成立大会在从化市华胜塑料制品有限公司会议厅召...','<p>       2013年12月31日，由从化经济开发区科协牵头组织、从化经济开发区大力支持的，从化地区22家塑料企业及研究机构发起的从化塑料产业科技创新联盟成立大会在从化市华胜塑料制品有限公司会议厅召开。广东博士俱乐部赵根文秘书长应邀出席了本次大会及科技服务站的挂牌仪式。</p><p style=\"text-align: center;\"></p><p style=\"text-align: center;\"><img src=\"/upload/images/eec1adf3e53aceee858aea0fb8f511aa.jpg\"></p><p style=\"text-align: center;\"><strong>从化经济开发区科协李世友主席主持本次大会</strong></p><p style=\"text-align: center;\"><strong><br></strong></p><p style=\"text-align: center;\"><img src=\"/upload/images/1087f5363880460ad6315736f81a3e9f.jpg\"></p><p style=\"text-align: center;\"><strong>广东博士俱乐部赵根文秘书长出席了本次会议</strong></p><p style=\"text-align: center;\"><strong><br></strong></p><p>       据悉，成立塑料产业科技创新联盟，目的是促进塑料产业通过合作与科技创新，形成产业抱团发展，同时通过建立塑料产业科技服务站作为科技创新服务平台，协助联盟企业开展产品研发和工艺技术提升。</p><p style=\"text-align: center;\"><img src=\"/upload/images/4af81944fddf57e2ed2ffe3af4bd8d1d.jpg\"></p><p style=\"text-align: center;\"><strong>科技服务站揭牌仪式</strong></p><p style=\"text-align: center;\"><strong></strong>       会后，从化经济开发区科协李主席在与俱乐部赵根文秘书长的交流中表示，为促进当地的塑料产业技术发展，十分希望博士俱乐部在园区建立博士服务总站，覆盖整个园区以满足其对人才和技术的需求，通过建立博士科技服务总站的形式把人才、技术引入园区，为企业的技术研发和技术升级以及提高企业的核心竞争力发挥积极的作用。</p><p style=\"text-align: center;\"><img src=\"/upload/images/fff5a038b27daaa467878009869cf345.jpg\"></p><p style=\"text-align: center;\"><strong>会后部分嘉宾合影</strong></p>','5','100','news','1389257343','1394613264');
INSERT INTO `post` (`id`,`category_id`,`model`,`title`,`alias`,`image_name`,`file_name`,`tinyint1`,`int10`,`char32`,`varchar30`,`varchar50`,`varchar100`,`varchar128`,`content`,`status`,`weight`,`view`,`created_at`,`updated_at`) VALUES
('37','7','job','会员经理','ee060f56d205f17c701b04e721f5d3eb','','','0','2','','3年以上','28-36岁','面议','本科以上','<p>工作职责：</p><p>1、协助秘书长完成俱乐部各项接待工作以及对外关系公关与关系维护工作。</p><p>2、协助秘书长做好会员发展以及与会员关系维护。</p><p>3、配合俱乐部相关部门完成组织的各项活动，与俱乐部各部门内外部人员保持良好的沟通。</p><p>4、积极主动的协助秘书长所开展的各项工作。</p><p>5、完成集团领导交办的其他工作。</p><p>任职要求：</p><p>1、本科或以上学历，文科类或公共关系类相关专业；</p><p>2、具有政府相关部门、协会、行业、商会3年以上工作经验，熟悉政府或社团组织办公程序和运营管理；</p><p>3、优秀的人际关系及沟通技巧，丰富的团队管理经验及人脉资源；</p><p>4、为人热情，开朗，具有高度敬业精神和团队协作精神、较强的工作责任感，工作严谨、细致、高效；</p><p>5、有较强的沟通、组织、协调、策划能力，有创新进取意识，有一定社会阅历及社会资源；</p><p>6、较强的文字编辑及整理能力。</p>','1','99','job','1389258693','1392197319');
INSERT INTO `post` (`id`,`category_id`,`model`,`title`,`alias`,`image_name`,`file_name`,`tinyint1`,`int10`,`char32`,`varchar30`,`varchar50`,`varchar100`,`varchar128`,`content`,`status`,`weight`,`view`,`created_at`,`updated_at`) VALUES
('39','12','news','辽宁省科协考察团到访广州市科技类社会组织孵化培育基地','091a16e9d9dc612bd73a905013add57e','86aa61602881d0f6bc83710631c17c1a.jpg','','0','0','','','','','       11月27日上午，辽宁省科协考察团在市科协党组成员、副主席杨晓、学会部部长何志勤陪同下参观了广州市科技类社会组织孵化培育基地。赵根文秘书长向考察团代表介绍了孵化培育基地的相关情况。   ...','<p>       11月27日上午，辽宁省科协考察团在市科协党组成员、副主席杨晓、学会部部长何志勤陪同下参观了广州市科技类社会组织孵化培育基地。赵根文秘书长向考察团代表介绍了孵化培育基地的相关情况。</p><p style=\"text-align: center; \"><img src=\"http://42.96.192.215:8888/upload/images/4bde1e0363da2b11d49bb29f1fc60065.jpg\"></p><p style=\"text-align: center; \"><p>辽宁省科协一行参观孵化培育基地</p><p><p><img src=\"/upload/images/038ef0113d3f9b3ab0b35cb4f0bbd4e9.jpg\"></p><p><p>辽宁科协冯玉沈副巡视员参观基地党员活动中心</p></p></p></p><p>       辽宁省科协考察团代表与广州市科协代表还就提升学会能力，培育学会承接政府职能转移能力等相关问题进行了交流和探讨。杨晓副主席介绍了广州科协在提升学会能力，承接政府职能转移方面所做的相关工作，强调科协是党联系科学工作者的纽带，科技团体是科协最有力的保障，要坚持不懈的做好学会工作，让学会增强自身发展能力，完善自身建设，使学会达到承接政府职能转移的所必需条件和标准。</p><p><p>       冯玉沈副巡视员表示，广州科协与企业共建孵化培育基地的创新模式非常值得学习和借鉴，希望广州科协和孵化培育基地的同志能到辽宁考察，加强双方的交流和互动。</p></p><p><p style=\"text-align: center; \"><img src=\"/upload/images/4dde4a6e3fb3d1c7f53ab14f72cab8e4.jpg\"></p><p style=\"text-align: center; \"><p>座谈会交流</p></p><p style=\"text-align: center; \"><p><img src=\"/upload/images/95d800c6889c01ed0a9e8398f547ec9a.jpg\"></p></p><p style=\"text-align: center; \"><p>广州市科协副主席在交流会上发言</p><p><p><img src=\"/upload/images/42ebad6ead6f5ab6c9c4d454ff329bf3.jpg\"></p></p><p><p>辽宁科协冯玉沈副巡视员发言        </p></p></p></p>','1','100','news','1389593533','1389594095');
INSERT INTO `post` (`id`,`category_id`,`model`,`title`,`alias`,`image_name`,`file_name`,`tinyint1`,`int10`,`char32`,`varchar30`,`varchar50`,`varchar100`,`varchar128`,`content`,`status`,`weight`,`view`,`created_at`,`updated_at`) VALUES
('40','12','news','广州市科协领导视察广州市科技类社会组织孵化培育基地党建工作','4166670adc234412441715c7bd037ec1','','','0','0','','','','','       11月20日，广州市科学技术协会副主席叶显玉、学会学术部部长何志勤在广州市科技类社会组织孵化培育基地赵根文秘书长的陪同下，对广州市科技类社会组织孵化培育基地党建工作进行了视察。     ...','<p>       11月20日，广州市科学技术协会副主席叶显玉、学会学术部部长何志勤在广州市科技类社会组织孵化培育基地赵根文秘书长的陪同下，对广州市科技类社会组织孵化培育基地党建工作进行了视察。</p><p>       科协领导一行参观了孵化培育基地党员活动室、党建室、孵化培育基地办公区，叶主席询问了孵化培育基地党建相关工作情况，对科技类社会组织开展党建工作及申报枢纽型社会组织予以肯定，并提出建议和意见。叶主席指出在党员队伍建设方面，要抓好党员质量，推进党的建设。另一方面，党务工作和业务工作不能分离，党务工作有利于推动经济发展，两者紧密相联。何部长强调党建工作是当前的核心工作，要加快孵化培育基地党支委的成立工作，希望能在本月底完成。同时希望在党支委成立后，做好组织生活、活动，使党支委真正发挥到实处，促进孵化培育基地党建工作健康长期发展。</p>','1','100','news','1389594707','0');
INSERT INTO `post` (`id`,`category_id`,`model`,`title`,`alias`,`image_name`,`file_name`,`tinyint1`,`int10`,`char32`,`varchar30`,`varchar50`,`varchar100`,`varchar128`,`content`,`status`,`weight`,`view`,`created_at`,`updated_at`) VALUES
('41','12','news','广东健康产业促进会医学专家委员会第一次会议圆满闭幕','88d59830b2f535c11735fb3597c278a3','','','0','0','','','','','        广东健康产业促进会医学专家委员会第一次会议于11月15日在广东博士长盛谷温泉养生基地顺利召开。广东健康产业促进会领导、来自广东省人民医院、中山大学中西医结合研究院、广东省中医药学会、广...','<p>        广东健康产业促进会医学专家委员会第一次会议于11月15日在广东博士长盛谷温泉养生基地顺利召开。广东健康产业促进会领导、来自广东省人民医院、中山大学中西医结合研究院、广东省中医药学会、广东省中医院、中山大学第一附属医院、广东省中西医结合医院、广州中医药大学、中山大学肿瘤医院、广东省中医二院、黄埔区中医学会、广州市第十二人民医院、广州医学院、中山六院体检中心等省内医疗机构的20位医学专家、秘书处工作人员共30多人出席了本次会议，共同为医学专家委员会的发展建言献策。</p><p>        会议由广东健康产业促进会副秘书长刘星羽主持。经过充分的酝酿和讨论，会议一致通过了医学专家委员会的组织构架，并选出了医学专家委员会的主任、副主任、秘书长、副秘书长，产生了第一届医学专家委员会领导班子。</p><p>       大会全票通过由中山大学中西医结合研究所所长、博士生导师、中西医主任医师吴伟康教授担任健促会医学专家委员会主任；选举中山大学附属第六医院影像检验中心副主任、陈一方教授担任秘书长；选举黄埔中医药学会会长、郝建军教授以及中山大学中山医学院病理生理学教研室主任邓宇斌教授担任副主任；选举广东省第二中医院综合科主任、主任医师吕雄教授担任副秘书长。</p><p>       新当选的医学专家委员会第一届领导班子纷纷表示，将积极履行好自己的职责，齐心协力把医学专家委员会办好，不辜负全体会员的信任与重托，为广东健康产业促进会的发展贡献力量。</p>','1','100','news','1389594839','0');
INSERT INTO `post` (`id`,`category_id`,`model`,`title`,`alias`,`image_name`,`file_name`,`tinyint1`,`int10`,`char32`,`varchar30`,`varchar50`,`varchar100`,`varchar128`,`content`,`status`,`weight`,`view`,`created_at`,`updated_at`) VALUES
('42','12','news','聆听大师哲语，感悟梦想力量','cbf725a24e3c5c62afffe6f8c7e44a9a','','','0','0','','','','','       11月5日下午，应广东海峡两岸交流促进会和广东侨界人文学会的邀请，“台湾星云大师广东行”活动之一 
“看见梦想的力量”专题讲座暨赠书仪式在广州中山纪念堂举行。中央社会主义学院党组书记叶...','<p>       11月5日下午，应广东海峡两岸交流促进会和广东侨界人文学会的邀请，“台湾星云大师广东行”活动之一 
“看见梦想的力量”专题讲座暨赠书仪式在广州中山纪念堂举行。中央社会主义学院党组书记叶小文，两岸交流基金会理事长王富卿，民革中央副主席何丕洁，广东省委常委、省委统战部部长林雄，广东省政协副主席唐豪等嘉宾及听众共3000多人参加活动。</p><p>       星云大师一生孜孜以求,倡导“人间佛教”,提倡佛教要服务于社会，“从寺院到家庭，从山林到社会，从谈玄到服务，从出家到在家。”为推动人间佛教作出了巨大的贡献。</p><p>       星云大师以其和谐、充满大智慧的慈悲之心，以“梦想的力量”为题作开示和传播福音。近两个小时的演讲中，星云大师通过讲述六祖慧能、地藏王菩萨、唐玄奘、赵朴初和太虚大师这五位佛教界人士的故事和“段子”，阐述梦想的力量。将丰富高深的佛学文化道理与自己的人生经历和寻找佛陀的心路历程结合在一起，娓娓道来，引起听众的共鸣。</p><p>　    广东博士俱乐部集团组织全体干部参加了本次专题讲座，聆听大师教悔，感悟梦想力量，感召智慧正能量！</p>','1','100','news','1389594993','0');
INSERT INTO `post` (`id`,`category_id`,`model`,`title`,`alias`,`image_name`,`file_name`,`tinyint1`,`int10`,`char32`,`varchar30`,`varchar50`,`varchar100`,`varchar128`,`content`,`status`,`weight`,`view`,`created_at`,`updated_at`) VALUES
('43','12','news','广州翻译协会暨广州科技翻译协会2013学术年会在广东博士长盛谷温泉养生基地圆满闭幕','07b88f54a3220a2bdc4c18f5a35258e1','','','0','0','','','','','       11月的广东秋高气爽，景色宜人，由广州市翻译协会暨广州科技翻译协会（“两译协”）举办的2013年学术年会于11月2~3日在山清水秀、风光旖旎的佛冈广东博士长盛谷温泉养生基地召开，广州翻译...','<p>       11月的广东秋高气爽，景色宜人，由广州市翻译协会暨广州科技翻译协会（“两译协”）举办的2013年学术年会于11月2~3日在山清水秀、风光旖旎的佛冈广东博士长盛谷温泉养生基地召开，广州翻译协会会长仲伟合教授、广州翻译协会副会长平洪教授、广州翻译协会副会长穆雷教授、广州翻译协会前理事严嘉瑞高级工程师、广州科技翻译协会前会长刘福安教授、广州翻译协会副会长王东风教授、广东博士俱乐部赵根文秘书长等领导出席了此次年会。来自广州各大高校和翻译公司的专家、学者及译界同仁们汇聚一堂，利用此次大会的机会密切交流，畅谈在翻译实践和学术研究的过程中的心得体会。</p>','1','100','news','1389595123','0');
INSERT INTO `post` (`id`,`category_id`,`model`,`title`,`alias`,`image_name`,`file_name`,`tinyint1`,`int10`,`char32`,`varchar30`,`varchar50`,`varchar100`,`varchar128`,`content`,`status`,`weight`,`view`,`created_at`,`updated_at`) VALUES
('44','11','news','关于推进民主法治建设的实施意见','80893f20688633f06c083467f0f817e1','','','0','0','','','','','
	    为深入贯彻科学发展观，全面落实省第十一次党代会、市第十次党代会精神，根据《中共广州市委、广州市人民政府关于全面推进新型城市化发展的决定》，就推进我市民主法治建设提出以下实施意见。
	一...','<p>
	    为深入贯彻科学发展观，全面落实省第十一次党代会、市第十次党代会精神，根据《中共广州市委、广州市人民政府关于全面推进新型城市化发展的决定》，就推进我市民主法治建设提出以下实施意见。</p><p align=\"left\">
	一、总体要求和目标任务</p><p align=\"left\">
	    1.总体要求。坚持党的领导、人民当家作主和依法治国有机统一，开拓创新、先行先试，循序渐进、稳步发展，积极吸收借鉴国内外先进城市成功经验，大胆探索具有广州特色的新途径、新形式、新机制，着力推进民主政治建设制度化、规范化、程序化，不断提高民主法治建设水平，为广州全面推进新型城市化发展提供有力的政治保证和法治保障。</p><p align=\"left\">
	    2.目标任务。今后五年，以制度建设为核心，实现以下目标任务：重大决策机制进一步完善，决策的科学化、民主化、法制化水平不断提高；民主权利保障制度进一步健全，人民享有的民主权利更加充分；社会力量进一步汇聚，民主法治建设合力进一步形成；地方性法规规章更加完备，公共权力运行更加规范；依法行政水平进一步提高，司法更加公正高效；全社会法治意识普遍增强，法律权威进一步树立；权力制约和监督机制进一步健全，监督实效明显提高；公民合法权益得到切实尊重和保障，社会公平正义进一步彰显。</p><p align=\"left\">
	二、完善重大事项决策机制</p><p align=\"left\">
	    3.健全党委重大决策工作机制。健全党内民主决策机制，建立和完善党委重大决策程序规定。坚持“三不决策”（没有经过认真调查研究的不决策，没有提出两个或两个以上方案的不决策，没有经过可行性研究和咨询论证的不决策）制度，进一步完善“三重一大”（重大事项决策、重要人事任免、重大项目安排和大额资金的使用）决策程序，健全酝酿、提议、论证、研究、审议、决策机制，加强党委与人大、政府、政协决策工作的衔接，充分发挥党委在决策中统筹领导、协调各方的作用。充分发挥全委会对重大问题的决策作用，完善全委会、常委会议事规则和决策程序，推行和完善全委会和常委会讨论决定重大问题和任用重要干部票决制。加强重大事项决策咨询，充分听取人大、政协、各民主党派、工商联、无党派人士的意见和建议，重视人民团体、社会组织、研究机构、专家学者和干部群众的意见和建议。（牵头单位：市委办公厅，配合单位：市委政研室）</p><p align=\"left\">
	    4.健全人大常委会讨论决定重大事项工作机制。各级党委要支持和保证人大常委会依法行使重大事项讨论决定权。严格落实市人大常委会讨论决定重大事项办法。对应当由人大常委会讨论决定的重大事项，都要纳入人大常委会讨论决定事项范围。建立人大常委会与“一府两院”有关重大事项的常态化沟通机制和定期工作协调机制。“一府两院”在每年年底提出下一年度应由人大常委会讨论决定的重大事项建议议题，经政府常务会议或法院审判委员会会议、检察院检察委员会会议讨论通过后，由人大常委会主任会议决定是否纳入年度讨论决定重大事项计划。人大常委会讨论决定重大事项要开展专家咨询论证，广泛听取民意，着力提高讨论决定重大事项水平。（牵头单位：市人大常委会办公厅，配合单位：市委办公厅、市政府办公厅、市法院、市检察院）</p><p align=\"left\">
	    5.健全政府重大行政决策工作机制。严格执行广州市政府重大行政决策程序规定和重大决策听证办法，完善行政决策风险评估机制。坚持把公众参与、专家论证、风险评估、合法性审查、集体讨论决定等作为重大决策必经程序。认真落实重大事项报同级人大或其常委会审议制度和政协民主协商制度。增强行政决策透明度和公众参与度，完善重大行政决策预公开制度。培育和发展公共政策咨询机构，建立咨询委员会制度。建立重大行政决策实施情况定期评估制度，探索实行决策后第三方评估。对违反决策规定、出现重大决策失误、造成重大损失的，要按照谁决策、谁负责的原则严格追究责任。（牵头单位：市政府办公厅，配合单位：市政府研究室、市法制办）</p><p align=\"left\">
	    6.完善政治协商纳入决策机制。各级党委要认真贯彻市委政治协商规程的有关规定，每年根据年度工作重点或同级政协党组提出的建议，研究确定与各民主党派、无党派人士进行政治协商的年度计划，以及在政协同各民主党派和各界代表人士政治协商的年度计划。坚持就重大问题在决策之前和决策执行过程中进行协商的原则，做到对重大问题的协商在党委决策之前、人大表决之前、政府实施之前，加强重大问题在决策执行过程中的协商。由党委或党委、政府联合作出的本行政区域内有关政治、经济、文化、社会和生态发展大局的重要决议、决定、意见，应当经过政治协商。凡是经过协商的重要议题，在提交党委、政府讨论时，应当附上协商意见。重要协商成果要列入党委常委会会议或政府常务会议进行研究，形成采用成果的意见，作为党委、政府决策的重要依据。建立健全协商意见督办落实联席会议制度，落实督办责任。（牵头单位：市委办公厅，配合单位：市政府办公厅、市政协办公厅）</p><p align=\"left\">
	    7.推动决策征询民意工作。进一步明确重大行政决策的范围，制定并公布强制听证事项目录。主动回应社会关切，建立民意吸纳反馈制度，健全涉及群众利益的重大事项决策公示和社会听证制度。发挥人民团体、社会组织、大众传媒等的社会利益表达功能，注重引导民意的集中形成和有效表达。（牵头单位：市委办公厅，配合单位：市政府办公厅）</p><p align=\"left\">
	三、扩大公民有序政治参与</p><p align=\"left\">
	    8.拓宽公民有序政治参与渠道。坚持差额选举制度和联合提名候选人制度，依法保障选举人的选举权利。通过来信来访、市长信箱、政风行风热线等渠道，推进市民群众与党政部门之间的直接沟通对话。通过《羊城论坛》、《政协委员之声》、广州人大网、广州政协网、大洋网等平台，拓宽群众知情知政、表达民意的渠道。实行电视和互联网直播市人大常委会会议，推进立法听证、行政听证制度化，探索把法律监督、重大事项决定等列入听证范围。（牵头单位：市委办公厅，配合单位：市人大常委会办公厅、市政府办公厅、市政协办公厅）</p><p align=\"left\">
	    9.完善直接联系群众制度。坚持领导干部定期接访和下访等制度，党政主要负责人要定期约访群众，镇（街道）干部要即时接访群众，村（社区）干部要上门走访群众。党政主要领导要认真阅批群众来信，及时研究处理群众反映的问题；发生敏感问题或重大事件时，要及时与群众直接对话。各级干部要经常深入基层联系群众，主动发现并认真研究解决群众的具体困难。各级社会工作委员会要定期分析社情民意，研究解决群众关注的热点、难点问题。各单位各部门要畅通群众诉求表达渠道，落实维护群众权益的措施。完善信访工作机制，改进信访工作方法和考核办法。（牵头单位：市信访局，配合单位：市社工委）</p><p align=\"left\">
	    10.支持人大代表、政协委员依法依规履职。加强各级人大代表与选民和选举单位的联系，在全市街道和较大社区设立人大代表之家，定期安排各级人大代表接待群众，支持人大代表收集和反映民意，推动解决关系群众切身利益的问题。支持政协委员深入基层、深入界别，积极建言献策。进一步保障和规范代表议案、建议的提出和办理工作，完善议案决议落实和代表建议办理工作机制，加强对落实和办理情况的检查监督，坚持落实和办理情况定期报告制度。完善办理政协提案办法，坚持党政主要领导领衔督办重点提案制度，落实提案承办单位分管领导负责制，及时反馈提案办理情况。（牵头单位：市委办公厅，配合单位：市人大常委会办公厅、市政府办公厅、市政协办公厅）</p><p align=\"left\">
	    11.发挥统一战线凝心聚力作用。深入推进“同心工程”，拓展民主党派、工商联和无党派人士参政议政渠道。完善民主党派负责人参与重要外事、内事活动制度。健全市委主要领导到基层调研邀请民主党派负责人参加的制度。深化各级中共党员领导与民主党派、工商联负责人和无党派代表人士联系交友制度。健全政府部门与民主党派、工商联的对口联系制度。落实党外代表人士建言献策“直通车”制度。深入开展民族团结进步创建活动，充分发挥少数民族群众、宗教界人士和信教群众在构建和谐社会中的积极作用。积极探索和拓展新的社会阶层人士有序政治参与的途径。（牵头单位：市委统战部，配合单位：市政府办公厅、市民族宗教局）</p><p align=\"left\">
	    12.发挥工青妇等群团组织的桥梁纽带作用。各级工会、共青团、妇联等群团组织要密切联系广大职工、青年和妇女儿童等群体，听取和反映他们的意见和要求，组织和代表他们参与社会协商对话、参与国家和社会事务的民主管理和民主监督。工青妇等群团组织要发挥好枢纽型社会组织作用，加强对其成员的服务，建立维护成员合法权益的长效机制。（牵头单位：市总工会、团市委、市妇联）</p><p align=\"left\">
	四、发展基层民主</p><p align=\"left\">
	    13.完善村（居）委会自治制度。坚持村民委员会成员直选，全面推进居民委员会成员直选。完善村（居）委会换届选举工作制度，确保选举依法依规。坚决查处拉票、贿选等不正当行为，严密防范、严厉打击利用宗族势力、黑恶势力以及非法组织等干扰破坏选举的活动。逐步减少居委会协管、协办政府行政性事务，充分发挥其自治组织功能。完善社区自治组织体系，努力实现社区居委会专职人员向社会工作职业化、专业化方向发展。继续优化村委会干部的年龄、知识结构，探索专业社会工作者驻村服务。凡涉及村（居）民利益的重要事项，都要由村（居）民会议或代表会议集体讨论决定，保障群众依法直接行使民主权利。深入推进村（居）务公开，不断健全财务第三方管理制度。（牵头单位：市民政局，配合单位：市委组织部、市社工委）</p><p align=\"left\">
	    14.完善企事业单位民主管理制度。依法在企事业单位建立工会组织，健全职工代表大会制度，充分发挥工会和职工代表大会作用。依法制定劳动规章制度，健全工会民主选举制度。认真落实《广州市劳动关系三方协商规定》，及时调处劳动纠纷，促进劳动关系和谐稳定。支持职工参与企事业单位民主管理，健全职工董事、职工监事等制度。推进建立区域性、行业性工会。（牵头单位：市总工会，配合单位：市国资委、市人力资源和社会保障局、市经贸委、市工商联）</p><p align=\"left\">
	    15.激发社会组织活力。坚持培育发展和监督管理并重，充分发挥社会组织独特优势。进一步降低准入门槛，简化登记程序。大力推行社会组织“去行政化”改革，加强社会组织法人治理，促进社会组织民间化、自治化发展。加快推进社会组织“去垄断化”改革，积极引导社会组织完善内部治理结构，形成公开、公平、公正的竞争激励环境。加强对社会组织的服务、监督和管理，增强社会组织的自治能力。（牵头单位：市民政局）</p><p align=\"left\">
	五、加强法治广州建设</p><p align=\"left\">
	    16.加强和改进立法工作。健全立法项目论证制度，选准选好立法项目。继续完善经济领域立法，加强城市建设管理和以改善民生为重点的社会领域立法。建立健全法规规章多元起草机制，杜绝部门利益法制化。拓宽民主立法渠道，凡制定涉及群众切身利益的地方性法规和政府规章，都要向社会公开征求意见。探索实行立法项目成本效益分析，建立健全立法后评估、公众意见反馈、法规规章定期清理、规章有效期等制度。（牵头单位：市人大常委会法工委，配合单位：市法制办）</p><p align=\"left\">
	    17.加快法治政府建设。加强对权力运行的规范和制约，确保行政权力在法律范围内运行。建立权责明确、行为规范、便民高效、保障有力的行政执法体制，推动行政执法重心下移，加大对镇（街）综合执法工作的保障力度。完善行政执法程序制度，健全行政执法人员资格审查、持证上岗制度。加强执法协作和执法争议的协调，实现政府部门之间信息互通和资源共享。进一步规范行政执法自由裁量权。畅通行政复议渠道，建立行政复议简易程序、行政复议专家咨询和论证制度。全面推行政府部门聘请法律顾问制度，加大政府购买法律服务力度，发挥律师、公证等法律服务工作在促进依法行政方面的作用。健全依法行政考核制，将依法行政作为一级指标纳入领导班子和领导干部考评体系。完善行政问责制，严格执行行政执法责任制和过错责任追究制。（牵头单位：市法制办，配合单位：市政府办公厅、市监察局）</p><p align=\"left\">
	    18.维护司法公正和权威。支持法院、检察院依法独立行使审判权和检察权，禁止干预司法机关依法独立办案。司法机关要严格执法办案，提高办案质量，维护司法公正。加强和改进执行工作。建立重大疑难涉法涉诉信访案件专家评审制度和信访复核公开听证制度。深化司法工作改革，优化司法机关内部职权配置，全面推进量刑规范化工作，实施案件简繁分流。拓宽公众监督司法工作的渠道，扩大人民陪审员、人民监督员中基层群众的比例。继续深化审判公开、“阳光检务”，增强司法活动的公开性和透明度。推进案件评查工作常态化，及时整改带普遍性、倾向性的问题。严明司法纪律，严惩司法腐败。（牵头单位：市委政法委，配合单位：市法院、市检察院）</p><p align=\"left\">
	    19.建立“三打两建”长效机制。认真总结“三打两建”（打击欺行霸市、打击制假售假、打击商业贿赂，建设社会信用体系、建设市场监管体系）工作经验，坚持以打促建，着力加强信息平台和载体建设，推进社会信用体系和市场监管体系建设，建立健全信用监督管理和失信惩戒制度，促进在市场监管各环节建章立制。强化企业依法诚信经营意识，引导企业承担社会责任。（牵头单位：市委政法委，配合单位：市发展改革委、市工商局）</p><p align=\"left\">
	    20.拓宽保障公民权利救济渠道。整合律师、公证、司法鉴定、法律援助、基层法律服务资源，建立完善法制宣传、人民调解、法律服务三结合的工作机制。完善基层法律服务网络，推进城乡法律服务均衡发展。依法保障律师执业权利，改善律师执业环境。规范法律服务市场秩序，加大对各类法律服务咨询公司的监管力度，规范律师执业行为和公民代理行为，鼓励和支持社会法律志愿力量参与公益性法律服务。建立完善法律服务人员诚信档案。加大司法救助、法律援助力度，依法缓减免诉讼费。加大财政保障力度，将法律援助经费纳入市、区（县级市）财政预算，更好地维护困难群众合法权益。（牵头单位：市司法局，配合单位：市法院、市财政局、市工商局）</p><p align=\"left\">
	    21.深化普法宣传。广泛深入开展以宪法为核心、以与公民生产生活密切相关的法律法规为重点的全民法制宣传教育，培养公民依法行使权利、履行义务的意识。加强司法权威意识、程序意识、证据意识教育，促使公民自觉承担司法裁判风险，尊重司法裁判结果，履行司法裁判义务。认真实施“六五”普法，创新普法宣教方式，善于利用报纸、广播、电视、互联网、手机等传播途径和载体，增强普法效果。（牵头单位：市司法局）</p><p align=\"left\">
	六、加快建设服务型政府</p><p align=\"left\">
	    22.强化政府服务职能。完善公共财政体制，依法保障基本公共服务支出，积极推进基本公共服务均等化。创新公共服务方式，加大政府职能转移和购买服务的力度。逐步将行业管理、社会生活服务管理等职能转移给有资质条件的社会组织。扩大政府购买服务范围，制定政府购买服务的标准和规范。推进政府服务规范化，完善行政机关向社会提供行政服务行为的规章制度，明确服务内容、标准、程序和时限。严格落实中央和省有关规定，取消不合理的行政事业性收费。整合行政资源，降低行政成本，提高行政效率和服务水平。（牵头单位：市财政局，配合单位：市政府办公厅、市法制办）</p><p align=\"left\">
	    23.深化行政管理体制改革。按照建设“小政府、大社会”的目标，进一步转变政府职能。加快推进政府职责、机构和编制法制化，合理界定部门权限，明确职责分工。按照精简、统一、效能的原则，加大机构整合力度，统筹党委、政府机构设置，优化政府部门行政权力配置，推进市和区（县级市）大部门体制改革，构建大规划、大经济、大监管、大卫生、大农业、大交通、大建设、大文化等大部门格局。进一步理顺市、区（县级市）两级政府事权关系，创新两级财政管理体制。在继续下放事权的同时，完善财政、人员管理等配套保障政策。研究探索垂直管理体制改革，理顺垂直管理部门与区（县级市）政府的权责关系，强化区级政府行政权。推进简政强镇事权改革，增强镇政府的管理职能。积极推进行政区划调整，优化街镇社区设置。（牵头单位：市编办，配合单位：市政府办公厅、市财政局）</p><p align=\"left\">
	    24.深化行政审批制度改革。贯彻落实省委办公厅、省政府办公厅印发的《关于加快转变政府职能深化行政审批制度改革的意见》。加大简政放权力度，清理压减行政审批事项，重点在投资建设、社会事业、非行政许可审批领域清理、减少和调整行政审批事项。对于公民、企业和社会组织能够自主决定、自担风险、自行调节、自律管理的事项，政府不再审批。能够通过法律手段和经济手段解决的事项，取消政府管制。能够通过事中、事后监管达到管理目的的事项，取消事前行政许可。优化行政审批流程，减少环节，压缩时限，实行跨部门并联审批。开展商事登记制度改革，加快推进以备案制为主的企业设立管理体制，降低市场准入成本。推进区（县级市）综合政务服务体系建设，打造“一站式”便民服务平台并逐渐覆盖镇（街）、村（居），实行“阳光审批”。推进服务质量公开承诺制。严格落实问责制度，加强行政审批绩效管理。健全行政审批投诉受理、处理和结果公开制度，严格责任追究，对违法设定和实施行政审批事项侵害当事人合法权益的，要依法追究责任。（牵头单位：市法制办，配合单位：市政府办公厅、市工商局）</p><p align=\"left\">
	    25.深入推进政务公开。政府工作要以公开为原则，不公开为例外，除涉及国家秘密、商业秘密和个人隐私的事项，一律向社会公开。重点推进财政预算决算、“三公”经费和行政经费、保障性住房、食品安全、环境保护、招投标、安全生产、征地拆迁、价格和收费等信息的公开。完善政府新闻发布制度，健全舆情危机处理工作机制。建立健全监管体系，构建行政效能投诉网络，完善政务公开评议制度。将政务公开作为党政领导干部年度考核的重要内容，完善责任追究制度。加强对政务信息公开情况的督查，对不公开、半公开、假公开的，要严肃批评、限期整改；对因此造成严重后果的，要依法追究相关人员的责任。（牵头单位：市政府办公厅，配合单位：市财政局、市监察局等部门）</p><p align=\"left\">
	七、加强对权力运行的监督制约</p><p align=\"left\">
	    26.加强党内监督。深入贯彻落实党内监督条例，推动党内监督制度化。健全常委个人定期向常委会报告工作、常委会定期向全委会报告工作并接受监督等制度。推行地方党委委员、纪委委员开展党内询问和质询制度。坚持党员领导干部报告个人重大事项、述职述廉、民主评议、诫勉谈话等制度。完善党内民主生活会和组织生活会制度。建立健全党代表参与重大决策、参加重要干部推荐和民主评议、列席党委有关会议、联系党员群众的制度和办法。推进党务公开，完善和落实党内情况通报、情况反映、重大决策征求意见、党务信息发布等制度，建立党委新闻发言人制度，拓宽党员意见表达渠道。坚持和完善民主集中制，严格执行集体领导和个人分工负责制度，落实党政正职不直接分管人、财、物和行政审批制度。深入推进惩防腐败体系建设，在严肃查处党员干部违纪违法行为的同时，着力加强权力运行监督制约机制建设，探索实行党员领导干部家庭财产党内申报、防止利益冲突和利益回避制度。（牵头单位：市纪委，配合单位：市委办公厅、市委组织部）</p><p align=\"left\">
	    27.加强人大监督。把贯彻落实新型城市化发展重大决策部署作为监督的重点。完善监督议题确定机制，选准选好监督议题。深化对财政预算的监督，完善市人大常委会加强预算审查监督工作规定，推进“公共财政”、“阳光财政”建设。加大对司法工作的监督力度，落实市人大常委会监督司法工作规定，增强监督司法工作的针对性和有效性。建立完善对政府垂直管理部门以及市属国家级开发区的法律监督和工作监督机制，防止出现监督空白。综合运用听取和审议专项工作报告、执法检查、专题调研、专题询问、工作评议、满意度测评、质询、特定问题调查等方式方法，增强监督刚性和实效。（牵头单位：市人大常委会办公厅，配合单位：市政府办公厅、市法院、市检察院）</p><p align=\"left\">
	    28.加强民主监督。坚持市委每年确定一至两项重要工作交由市政协组织开展专题视察，加大对重点工作民主监督的力度。健全党外人士特约监督员制度，适当增加民主党派、工商联成员担任特约人员的数量，拓宽政府和司法机关聘任特约人员的领域。规范邀请民主党派、工商联参加有关调研、视察、检查和对口联系、情况通报等制度，积极为民主党派、工商联知情问政创造条件。创新民主监督形式，探索开展视察与评议相结合的监督形式。建立健全民主监督意见办理反馈机制，实施对办复情况的跟踪和评价。（牵头单位：市委办公厅，配合单位：市委统战部、市政府办公厅、市政协办公厅）</p><p align=\"left\">
	    29.加强行政监督。强化政府内部层级监督和专门监督，创新层级监督机制。加强对规章和规范性文件制定、执行的监督，强化行政复议纠错功能。加强行政监察，提高行政效能。加大智能监察力度，构建廉政风险智能防控体系。强化审计监督，深化财政审计，严格执行领导干部经济责任审计制度，建立完善政府专项资金绩效考评机制。（牵头单位：市监察局，配合单位：市政府办公厅、市法制办、市审计局）</p><p align=\"left\">
	    30.加强司法监督。注重发挥司法机关的监督职能，健全审判、检察、公安机关分工负责、互相配合、互相制约的工作机制，形成监督合力。鼓励、倡导行政机关负责人出庭应诉。行政机关要自觉履行人民法院作出的判决和裁定。（牵头单位：市委政法委，配合单位：市法院、市检察院、市公安局、市法制办）</p><p align=\"left\">
	    31.加强社会监督。加强新闻舆论监督平台建设，保障新闻机构和新闻采编人员依法从事采访活动的权益。探索实现新闻舆论监督法制化、制度化、常态化的有效途径，依法管理和规范舆论监督，维护舆论监督的正常秩序。通过设置意见箱、设立热线电话、召开座谈会、上门走访等多种形式，主动接受群众监督。完善公民批评、检举、评议公职人员制度。深入开展基层评议机关活动和民主评议政风行风活动。建立健全对人民群众和新闻媒体反映问题以及网络舆情的处理反馈机制，及时回应社会公众反映的问题，认真调查核实，依法处理并反馈或向社会公布处理结果。建立完善舆论监督、群众监督保障机制，坚决制止和严肃处理对舆论监督和群众监督的打击报复行为。（牵头单位：市委宣传部，配合单位：市直机关工委）</p><p align=\"left\">
	八、发挥互联网等新兴媒体在推进民主法治建设中的积极作用</p><p align=\"left\">
	    32.加快电子政务建设。以广州政府网和各部门、各区（县级市）政务网站为依托，推行“网上审批”、“并联审批”、“一站式”电子政务服务。不断扩大网上业务办理范围，积极探索推行网上预约、网上咨询、网上受理、网上审批、网上办复，增强网上服务功能。加强行政审批电子监察，进一步完善市、区（县级市）电子监察系统，全程监督行政审批项目从受理到办结的各个环节，及时纠正违规行为。（牵头单位：市科技和信息化局，配合单位：市政府办公厅、市法制办、市政务办、市监察局）</p><p align=\"left\">
	    33.强化网上信息发布。探索利用“中国广州发布”平台及网络论坛、博客、微博、手机短信等新兴媒体，与市政府门户网站相结合，及时公开政府信息。探索建立网上新闻发布会和网络新闻发言人制度。引导网民以积极理性的态度依法依规有序参与公共生活，推动网络民主的有序化，防止对正常司法活动造成干扰，维护社会稳定，促进公平正义。（牵头单位：市委宣传部）</p><p align=\"left\">
	    34.打造网络问政平台。创新政民互动模式，实施网络问政，推动虚拟社会和现实社会同步响应、协调策应。建立网上百姓热线系统。整合网络资源，形成以市政府门户网站为主体，由市政府部门网站、各区（县级市）政府网站组成的开放有序的网络体系和问政平台。定期开展部门、领导和网民网上在线访谈、网下见面座谈活动，实现双向交流沟通。建立完善网络问政处置反馈机制，推动网络反映问题尤其是民生热点难点问题的解决。（牵头单位：市政府办公厅）</p><p align=\"left\">
	九、强化工作保障</p><p>
	    35.加强组织领导和督促检查。全市各级各部门要高度重视推进民主法治建设的重要作用，加强组织领导，认真抓好本实施意见的贯彻落实。对需要制定有关制度措施的，要抓紧研究制定；对需要健全完善制度措施的，要抓紧健全完善；对已制定施行的制度措施，要认真贯彻执行；对违反有关制度规定的，要严格追究责任。各牵头单位和实施单位主要领导要亲自抓、负总责，分管领导要具体负责，抓紧制定贯彻落实实施意见的具体工作方案，进一步明确工作措施、进度安排及任务分工，落实工作责任，确保实施意见落到实处。除上级党委、政府就有关工作有明确时限要求的外，各牵头单位和实施单位要在本实施意见施行后一年内完成有关工作制度、配套措施的制定工作；特别重大复杂的，要在试点探索的基础上两年内完成有关工作制度、配套措施的制定工作。各级各部门要加强督促检查，及时研究解决工作中的突出问题，加强队伍建设，落实工作力量、工作经费等方面的保障。建立工作情况检查、通报和交流制度。把推进民主法治建设情况纳入各级领导班子和领导干部年度和任期考核的重要内容。（牵头单位：市委办公厅，配合单位：市委组织部、市政府办公厅、市人力资源和社会保障局）</p>','1','100','news','1389595683','0');
INSERT INTO `post` (`id`,`category_id`,`model`,`title`,`alias`,`image_name`,`file_name`,`tinyint1`,`int10`,`char32`,`varchar30`,`varchar50`,`varchar100`,`varchar128`,`content`,`status`,`weight`,`view`,`created_at`,`updated_at`) VALUES
('45','11','news','关于推进民生幸福工程的实施意见','52af36c3c539a263bc8d3d601702ace1','','','0','0','','','','','
	    为深入贯彻科学发展观，全面落实省第十一次党代会、市第十次党代会精神，根据《中共广州市委、广州市人民政府关于全面推进新型城市化发展的决定》，就推进民生幸福工程提出以下实施意见。
	一、推...','<p>
	    为深入贯彻科学发展观，全面落实省第十一次党代会、市第十次党代会精神，根据《中共广州市委、广州市人民政府关于全面推进新型城市化发展的决定》，就推进民生幸福工程提出以下实施意见。</p><p align=\"left\">
	一、推进民生幸福工程总体目标</p><p align=\"left\">
	    1．总体目标。到2015年，全市基本建成覆盖城乡、功能完善、布局合理、规范科学、管理有效、适度普惠的基本公共服务体系，全市居民平等享有就业保障、社会保障、住房保障、公共教育、公共医疗、公共安全等基本公共服务，努力实现学有所教、劳有所得、病有所医、老有所养、残有所助、住有所居，不断提高城乡居民的安全感、和谐感和幸福感。</p><p align=\"left\">
	二、构建更加积极的就业保障体系</p><p align=\"left\">
	    2．创造更多就业机会。年均开发2万个以上的公益性公共服务岗位，优先安排本市就业困难群体和零就业家庭劳动力。促进农村劳动力就地就近就业。逐步提高现代服务业人员占社会从业人员比重。提高就业补贴标准，鼓励用人单位聘用本市就业困难人员。2012－2015年，城镇年均新增就业人数24万以上，城镇登记失业率控制在3.5%以内。（牵头单位：市人力资源和社会保障局，配合单位：市发展改革委）</p><p align=\"left\">
	    3．发展职业技能教育培训。着力打造职业教育规模和品牌，加强中高职三二分段衔接，建设适应“12338”战略需要的职业教育专业。高水平建设广州教育城。鼓励社会资本创办民办职业技能培训机构。到2014年，各区（县级市）建有1所公办职业技能培训学校。加大“职业技能培训券”工作实施力度，有就业和培训意愿的户籍劳动者享受终身技能提升培训服务。到2015年，建成1~2所国家示范性高等职业院校，6~8所国家级中等职业教育改革发展示范学校和10~12所省示范性中职学校。（牵头单位：市发展改革委，配合单位：市教育局、市人力资源和社会保障局）</p><p align=\"left\">
	    4.促进高校毕业生创业就业。实施“创业带动就业”三年行动计划。出台促进高校毕业生创业就业办法。定期公布大学生就业形势和发布就业指引。搭建用人单位和高校毕业生沟通协调平台。在高校集中区域建设1~2个国家级大学生创业孵化基地。2012~2015年，有就业意愿的广州生源困难家庭毕业生当年实现100%就业。（牵头单位：市人力资源和社会保障局，配合单位：市教育局、团市委）</p><p align=\"left\">
	    5.完善公共就业服务。举办各类就业人员专场招聘会。增设公共就业介绍服务机构免费项目，完善职业介绍机构指导监管制度。健全就业动态监控和失业预警机制，注重就业困难群体人文关怀。2014年前建成广州“智慧社保”信息系统。深化“充分就业社区”创建工作，到2015年，全市“充分就业社区”达标率达到70%以上。（牵头单位：市人力资源和社会保障局）</p><p align=\"left\">
	    6.提高劳动者收入水平。完善最低工资保障机制。建立健全工资指导线备案制度，健全劳动力市场指导价位和企业人工成本信息调查发布制度。积极稳妥扩大工资集体协商覆盖率。逐步提高中等收入者比重，增加中低收入者收入。（牵头单位：市人力资源和社会保障局）</p><p align=\"left\">
	    7.保障劳动者合法权益。实行劳动监察网格化管理。规范企业劳动保障和劳动关系信用评价制度。依法规范企业劳动合同签订行为，逐步提高企业集体合同签订率。建立劳动保障监察系统监控平台，发展和完善各种类型的劳动人事争议调解组织。依法审理劳动争议案件，维护劳动者的合法权益。2012~2015年，劳动人事争议仲裁年均结案率达到95%以上。（牵头单位：市人力资源和社会保障局，配合单位：市编办、市司法局、市法院）</p><p align=\"left\">
	三、构建覆盖城乡的社会保险体系</p><p align=\"left\">
	    8.促进基本养老保险可持续发展。逐步统一城镇企业职工基本养老保险费率，建立健全基本养老保险异地转移接续的经办管理服务制度。按国家和省的统一规定，稳步推进公务员和事业单位养老保险制度改革。到2015年，城镇职工和城乡居民养老保险参保人数达到780万人以上，稳步提高企业退休人员和城乡居民社会养老保险待遇水平。（牵头单位：市人力资源和社会保障局，配合单位：市财政局）</p><p align=\"left\">
	    9.完善基本医疗保险制度。建立城乡基本医疗保险市级统筹制度。到2015年，城镇职工和城镇居民医疗保险人数达到840万人以上，城乡三项基本医疗保险参保率达到95%以上，城镇居民医保和新农合政府补助标准逐步提高，城镇职工、城镇居民医保和新农合在政策范围内住院医疗费用支付比例总体平均达到75%左右、门诊支付比例提高到50%以上。（牵头单位：市人力资源和社会保障局，配合单位：市卫生局）</p><p align=\"left\">
	    10.扩大失业保险覆盖面。失业保险全面覆盖非公经济组织和社会组织从业人员、农村转移劳动力等群体。合理确定并稳步提高失业保险待遇标准。到2015年，失业保险参保人数达到424万人。（牵头单位：市人力资源和社会保障局）</p><p align=\"left\">
	    11．提高工伤保险保障水平。建立健全工伤预防、补偿及康复“三位一体”的新型工伤保险体系，稳步提高工伤保险待遇标准。将事业单位以及异地务工人员、非全日制职工、灵活就业人员纳入工伤保险制度统筹管理。研究开展公务员和参照公务员法管理的事业单位工作人员参加工伤保险工作。到2015年，工伤保险参保人数达到480万人。（牵头单位：市人力资源和社会保障局）</p><p align=\"left\">
	     12.拓展生育保险保障范围。适度调整生育保险产前检查常规项目和定额标准。探索制定职工未就业配偶生育医疗管理办法。将异地务工人员等纳入生育保险制度统筹管理。到2015年，生育保险参保人数达到320万人。（牵头单位：市人力资源和社会保障局，配合单位：市卫生局）</p><p align=\"left\">
	四、构建双轨并行的多层次住房供应体系</p><p align=\"left\">
	    13.建立以租为主的住房保障体系。实行廉租住房和公共租赁住房并轨运行的住房保障机制。建立健全以城镇低收入住房困难家庭为重点保障对象，以公共租赁住房为供给主体的新型住房保障制度。2012~2015年，建设和筹集保障性住房95000套（户），其中租赁型保障房占60%以上。坚持“轮候解决，困难优先”，新增双特困户“发现1户、解决1户”，城镇低收入住房困难家庭保障性住房轮候时间不超过5年。（牵头单位：市国土房管局，配合单位：市规划局、市建委、市发展改革委、市财政局、市民政局）</p><p align=\"left\">
	    14.适度扩大住房保障面。建立健全住房保障收入线准入标准动态调整机制。2012年，将廉租住房保障收入线标准由家庭年人均可支配收入9600元以下提高到15600元以下。到2015年，住房保障收入线准入标准不低于我市上年度城镇家庭年人均可支配收入的60%。（牵头单位：市国土房管局，配合单位：市民政局）</p><p align=\"left\">
	    15.促进房地产市场平稳健康发展。坚决贯彻落实国家房地产调控政策，调整住房供应结构，抑制投机性住房需求，保持房地产市场稳定。2012－2015年，中低价位、中小户型普通商品住房和保障性住房的年度土地供应量不低于居住用地供应总量的70%。（牵头单位：市国土房管局，配合单位：市规划局、市建委）</p><p align=\"left\">
	    16.加强城乡房屋安全管理。加强房屋安全普查和房屋日常巡查，抓好危房改造工作，有效监控和治理危房。及时发现、修复城市零散危房。逐步解决农村老、孤、寡、残等无能力改造自住危房人群的住房问题。（牵头单位：市国土房管局，配合单位：市农业局，各区、县级市政府）</p><p align=\"left\">
	五、构建优质均衡的公共教育体系</p><p align=\"left\">
	    17.合理配置公共教育资源。全面实施城乡学校结对计划，建立公办学校优质师资结对帮扶制度，推动优质教育资源向两个新城区、三个城市副中心和农村等教育薄弱地区配置。编制区（县级市）中小学布点规划和建设控制性导则。力争全部区（县级市）通过义务教育规范化学校建设督导验收。（牵头单位：市教育局，配合单位：市发展改革委、市规划局，各区、县级市政府）</p><p align=\"left\">
	    18.切实加强学前教育。重点发展公办幼儿园、普惠性民办幼儿园、农村学前教育，支持企事业单位、街镇、村集体举办幼儿园。资助我市低收入困难家庭儿童、孤儿、残疾儿童及其他优抚对象接受普惠性学前教育。注重0~3岁幼儿家庭教育。到2013年，各区（县级市）公办幼儿园占比达30%以上，全部镇均建有1所以上公办中心幼儿园；适龄残疾儿童三年学前教育率达到85%以上。0~3岁幼儿家庭教育普及率逐年提高。（牵头单位：市教育局，配合单位：市民政局、市人口计生局、市残联，各区、县级市政府）</p><p align=\"left\">
	    19.不断深化基础教育改革。建立和完善基础教育质量评估与检测体系，改革学校评价制度，全面推进素质教育。不断提高特殊教育的质量水平。到2015年，小学适龄儿童入学率100%，初中生年辍学率1%以下，高中优质学位率95%以上，80%的区（县级市）达到教育现代化先进区（县级市）的创建目标。（牵头单位：市教育局，配合单位：各区、县级市政府）</p><p align=\"left\">
	    20.大力扶持民办教育发展。出台促进民办教育发展意见，落实各项鼓励和扶持政策，促进和规范民办教育发展。完善民办教育发展规划和评估制度、民办学校综合监管和退出机制。充分发挥民办学校自身及其相关社会组织作用。逐步推进民办学校教师在资格认定、业务进修、职称评审等方面与公办教师同等待遇。到2015年，支持建设一批优质民办学校，民办教育整体办学水平稳步提高。（牵头单位：市教育局，配合单位：市人力资源和社会保障局、市民政局，各区、县级市政府）</p><p align=\"left\">
	    21.积极推广全民终身教育。发挥高等教育服务社会的作用，积极拓展社区教育、家庭教育和农村终身教育网络，推进终身教育平台建设。到2015年，建成4个国家级社区教育实验区，市级以上示范镇成人文化技术学校比例达到93%。（牵头单位：市教育局，配合单位：市人力资源和社会保障局、市民政局、市科技和信息化局）</p><p align=\"left\">
	六、构建均等优质的公共医疗体系</p><p align=\"left\">
	    22.优化医疗资源布局。出台广州区域卫生规划和医疗机构设施布局规划，巩固、优化、提升都会区医疗卫生规划布局，建设广州市健康医学医疗中心，新增医疗卫生资源优先向两个新城区、三个城市副中心配置。大力推进市属医院基本建设项目，加快花都、番禺、南沙、萝岗、从化、增城等区域医疗中心建设。到2015年，各区（县级市）有1所三级甲等综合医院。（牵头单位：市卫生局，配合单位：市发展改革委、市规划局、市财政局）</p><p align=\"left\">
	    23.实施基本药物制度。政府开办的基层医疗卫生机构全部配备和使用基本药物，实行药品零差率销售。将非政府开办的基层医疗卫生机构纳入实施基本药物范围，到2012年底，全市行政村卫生站实施基本药物制度。推进公立医院医药改革，逐步取消“以药补医”，理顺补偿机制。（牵头单位：市卫生局）</p><p align=\"left\">
	    24.提升基层医疗服务水平。推行居民健康责任医师团队网格化管理，原则上按照每3至10万居民或街道所辖范围规划设置1个社区卫生服务中心，构建15分钟社区卫生服务圈。建立基层医疗机构与大医院联动服务机制，探索“社区首诊、分级诊疗、双向转诊”。到2015年，100%的镇卫生院、村卫生站建设达标；每千人病床数达到5张，每万人全科医师数达到2人以上；基层医疗机构诊疗人次占比不低于50%。（牵头单位：市卫生局，配合单位：市人力资源和社会保障局）</p><p align=\"left\">
	    25.鼓励社会办医。鼓励社会资本创办康复、护理、精神卫生、老年病等专科医疗机构，发展高端和特需医疗服务。民办医疗机构在准入、服务质量监管、医疗保险定点资格等方面享受公立医院同等待遇。到2015年，全市民办医疗机构实际床位数、门诊服务量均达到全市总量的15%以上。（牵头单位：市卫生局，配合单位：市人力资源和社会保障局）</p><p align=\"left\">
	    26.增强公共医疗卫生服务能力。健全疾病防控、职业卫生、应急救治等专业公共卫生服务网络。制定广州市医疗健康服务规划，发展健康体检、健康保险和健康管理。加强中医药强市建设，实施“治未病”健康促进工程。到2012年底，基本公共卫生服务项目达到11大类37项。到2015年，人均基本公共卫生服务经费达到50元以上；全市公立医疗机构中医药服务提供率达到100%；户籍居民平均期望寿命超过80岁。（牵头单位：市卫生局，配合单位：市人力资源和社会保障局、市科技和信息化局、市财政局）</p><p align=\"left\">
	    27.促进卫生信息化建设。实施“智慧健康工程”，建设卫生信息专网和基于健康档案的区域卫生信息平台，建立健康档案和电子病历基础数据资源库，全市居民健康档案建档率达到75%以上。推进数字化医院建设，促进云计算、物联网、无线技术应用，基本完成集约式预约挂号系统、集约式诊疗费用自助支付系统、医学影像中心建设，实现全市基层医疗卫生机构信息系统全覆盖。（牵头单位：市卫生局，配合单位：市科技和信息化局、市财政局）</p><p align=\"left\">
	    28.加强人口计生管理服务。完善覆盖城乡居民的多层次人口计生服务体系。制定独生子女父母奖励标准与社会养老待遇水平挂钩制度。建立人口预测预警信息平台，健全流动人口计生管理服务机制。（牵头单位：市人口计生局，配合单位：市人力资源和社会保障局、市流动人员出租屋管理办）</p><p align=\"left\">
	七、构建和谐稳定的公共安全体系</p><p align=\"left\">
	    29.完善社会治安防控体系。优化治安防控基础设施空间布局，大力整合全市视频监控资源，推进“视频监管一网控”，公安机关掌握的视频探头完好率95%以上，社会自建视频探头完好率90%以上。规范群防群治队伍建设，强化城乡社区警务工作。严厉打击各类刑事犯罪和多发性犯罪，有效控制万人治安和刑事警情数，进一步提升群众安全感和满意度。（牵头单位：市公安局）</p><p align=\"left\">
	    30.加快“食得放心”城市监督管理体系建设。全面推进“食得放心”城市建设工作。强化农产品源头监管，开展农民科学种养、安全种养等培训教育。深化食品安全治理整顿。到2015年，建成食品检验监测、食品安全信用监管、主要食用农产品全流程信息化溯源监管等3个平台，完善食品供应保障和食品安全监管、风险监测、责任、标准、制度、行政执法、社会监督等8大体系。开展“诚信守法企业”创建活动。强化行政执法与刑事司法的衔接，充分发挥食品药品犯罪侦查队伍的作用，严厉打击食品领域违法犯罪行为。到2015年，食品生产企业抽检覆盖率100%、不合格食品处理执行率100%。（牵头单位：市食安办，配合单位：市经贸委、市公安局、市农业局、市卫生局、市工商局、市司法局、市质监局、市城管委、市环保局、市食品药品监管局，各区、县级市政府）</p><p align=\"left\">
	    31.强化药品安全监管。严格药品流通市场准入条件，加强基层药品监管设施建设，推动药品生产企业实施药品质量受权人制度。强化行政执法与刑事司法的衔接，严厉打击药品领域违法犯罪行为。到2015年，全市基本药物品种抽检覆盖率100%，重大药品安全事故处置率100％。（牵头单位：市食品药品监管局，配合单位：市经贸委、市公安局、市卫生局、市邮政局，各区、县级市政府）</p><p align=\"left\">
	    32.夯实城乡公共安全基础。加快城乡结合部和农村的综治信访维稳中心、司法所、调解室、法律援助站、派出所、警务室等基础建设。运用先进通讯技术和网络系统，全面构建城乡公共安全综合防控网络。（牵头单位：市委政法委，配合单位：市发展改革委、市公安局、市司法局）</p><p align=\"left\">
	    33.落实安全生产监管责任。建设全国安全社区，强化安全生产隐患排查整治，防止重特大事故发生。到2013年，冶金、机械等工贸行业（领域）规模以上企业的安全生产标准化达标。到2015年，全市安全生产应急救援队伍达到15支；村级组织按规定配备安全生产巡查人员，最大限度防止和减少安全生产事故发生。（牵头单位：市安监局，配合单位：各区、县级市政府）</p><p align=\"left\">
	    34.提高城乡应急避险和快速反应能力。健全应急反应指挥体系，完善公共预警机制和应急预案，加大人口疏散基地与应急避险场所建设力度，充实应急队伍，加强应急演练，普及应急知识。将水、电、气、防震、防空、防火、群体突发事件等应急救助系统纳入城乡统一指挥调度系统。开展全国综合减灾示范社区创建活动，到2015年，全市10%的城乡社区达标。（牵头单位：市应急办，配合单位：市民政局、市民防办、市应急委成员单位，各区、县级市政府）</p><p align=\"left\">
	八、构建适度普惠的民生福利保障体系</p><p align=\"left\">
	    35.提高社会救助水平。建立居民家庭经济状况核对机制、最低生活保障与促进就业机制、社会救助与社会服务联动机制。完善低保标准调整机制，逐步缩小城乡低保标准差距，适度提高计划生育困难家庭社会救助水平。到2015年，农村“五保”供养标准达到当地农村居民上年度人均收入水平。（牵头单位：市民政局，配合单位：市财政局、市人口计生局，各区、县级市政府）</p><p align=\"left\">
	    36.扩大专项社会救助覆盖面。到2012年底，困难群众医疗救助报销比例提高至90%，年度报销限额提高至4万元，将困难职业病人、在本市大中专院校就读的非本市户籍困难学生纳入医疗救助范围；建立健全重特大疾病专项医疗救助制度，年度报销限额最高10万元。探索建立商业保险参与重特大疾病医疗救助机制。积极稳步推进殡葬改革工作。到2015年，逐步实现城乡居民基本殡葬服务均等化。（牵头单位：市民政局，配合单位：市财政局、市人力资源和社会保障局、市卫生局、市教育局）</p><p align=\"left\">
	    37.拓展社区居家养老服务。建立健全居家养老服务和星光老年之家分类评估制度，推动居家养老服务规范化、专业化发展。到2015年，市、区（县级市）和1万名老人以上的街（镇）各建有1个综合性居家养老服务示范中心；每个街（镇）有1所日间托老机构。对经济困难且需要照料的本市户籍老人提供政府购买居家养老服务，直接享受居家养老服务的老人占全市老人总数的6%以上。（牵头单位：市民政局，配合单位：市财政局，各区、县级市政府）</p><p align=\"left\">
	    38.加快养老机构建设。出台养老服务机构设施用地规划，预留发展用地。完善养老机构标准体系和评估体系。建立健全公办养老机构床位轮候制度，制定特殊困难老人入住养老机构补贴政策。逐步提高民办社会福利机构运营资助和新增床位资助标准。推行养老机构意外责任保险，探索养老服务岗位政府补贴制度。积极推进市第二老人院和各区（县级市）养老机构建设。到2015年，全市养老床位数达到5.6万张，每千名老人拥有床位40张；各区（县级市）至少有1所200张床位以上的省二级以上养老机构。（牵头单位：市民政局，配合单位：市财政局、市规划局，各区、县级市政府）</p><p align=\"left\">
	    39.加强农村养老服务。明晰农村敬老院房屋产权，开展消防安全改造和验收。到2015年，10名以上“五保”、孤寡老人且有入住需求的行政村都建有互助式安居点，并配备资金及专职管理人员；每个行政村有1个100平方米以上的老年人活动站点；居家养老服务逐步覆盖农村。（牵头单位：市民政局，配合单位：市公安消防局，各有关区、县级市政府）</p><p align=\"left\">
	    40.落实优抚安置政策。建立健全优抚对象抚恤补助标准自然增长机制、城乡一体化优抚制度、优抚对象医疗保障制度。落实军队离休退休干部政治和生活待遇。深化退役士兵安置改革，积极推进城乡退役士兵安置待遇一体化。建立政府与优抚安置对象的沟通协调平台，妥善解决优抚安置对象实际困难。（牵头单位：市民政局，配合单位：市财政局、市人力资源和社会保障局，各区、县级市政府）</p><p align=\"left\">
	    41.发展慈善募捐事业。推进慈善事业管理体制改革，精心组织实施募捐条例和广东扶贫济困日暨广州慈善日活动，打造“阳光慈善”。2012~2015年，共募集社会捐赠5亿元以上。加强福利彩票销售宣传和监督，规范福彩公益金使用管理，2012~2015年，年均销售福利彩票30亿元以上，市本级年筹集公益金3亿元以上。（牵头单位：市民政局）</p><p align=\"left\">
	九、构建共建共享的幸福社区体系</p><p align=\"left\">
	    42.开展幸福社区创建活动。发动社区居民共同参与幸福社区的规划、建设、管理和服务，推进羊城幸福家庭促进计划，有效提升公共服务水平，切实提高社区居民幸福感。2013年3月前，完成全市26个市级幸福社区试点工作。到2015年，全市幸福社区创建达标率50%以上。（牵头单位：市民政局，配合单位：市人口计生局，各区、县级市政府）</p><p align=\"left\">
	    43.激发社区自治活力。规范社区活动经费使用，促进社区群众性活动开展。赋予社区居委会监督政府部门社区服务工作成效的职责，提高社区居委会办公经费保障标准。引导驻社区学校、单位、组织参与社区建设和社区服务。设立社区公益创投资金，资助社区公益项目。到2015年，全市公众志愿服务参与率达到20%，80%以上的驻社区单位和社区签订共建协议，每个城镇社区拥有3个以上的社区社会组织。（牵头单位：市民政局，配合单位：市教育局、团市委，各区、县级市政府）</p><p align=\"left\">
	    44.加强转制社区服务管理。逐步剥离转制社区经济联社社会事务管理职责。加大转制社区公共服务投入，在尊重社区居民意愿、民俗的前提下统一规划建设。到2015年，逐步理顺和规范转制社区的环卫、市政设施、治安等经费保障工作，转制社区居民享受均等化公共服务。（牵头单位：市社工委，配合单位：市公安局、市财政局、市卫生局、市建委、市城管委、市规划局，各区、县级市政府）</p><p align=\"left\">
	    45.完善社区公共服务。加强“五个一”工程建设（一个家庭综合服务中心、一个文化活动中心、一个体育休闲公园、一个卫生服务中心、一个视频监控系统），完善医疗卫生、教育、交通出行、信息通讯等民生服务配套设施。推进“智慧社区”建设。制定实施肉菜（农贸）市场总体布局规划和建设标准，推进肉菜（农贸）市场农产品直供直销、农超对接和平价商店建设，在北部地区探索建立有机农产品交易市场。逐步推进流动商贩临时疏导点建设和管理工作。逐步提高社区环境卫生综合水平。（牵头单位：市发展改革委，配合单位：市经贸委、市民政局、市人力资源和社会保障局、市规划局、市物价局、市工商局、市人口计生局、市文化广电新闻出版局、市城管委，各区、县级市政府）</p><p align=\"left\">
	    46.提升社区服务专业化水平。积极培育发展社区社会组织，引导和鼓励社区社会组织承担政府购买或资助的社区服务项目。大力推行“社工+义工（志愿者）”联动服务模式，为社区各类有需要的居民提供专业化、个性化的优质服务。加快发展满足城乡居民需求的家庭服务业。（牵头单位：市民政局，配合单位：市经贸委）</p><p align=\"left\">
	    47.推行社区全民健身计划。组织全民健身活动，开展市民体质测定。到2015年，每万人拥有社会体育指导员20名以上，城乡居民体质达标率达到95%以上，每个街道建有1个健身小广场（公园）、每个镇建有1个全民健身广场、每个居委会（行政村）建有1个健身点。（牵头单位：市体育局）</p><p align=\"left\">
	    48.营造和谐共建的社区氛围。规范物业服务企业的准入退出机制。积极推动条件成熟的小区成立业主组织，引导业主组织依法规范协同管理小区公共事务。推进“民主法治示范社区”创建活动。健全物业纠纷调处和社区人民调解工作机制，形成社区居委会、物业服务企业、业主组织代表共同参与的联合调处体系。（牵头单位：市国土房管局，配合单位：市司法局，各区、县级市政府）</p><p align=\"left\">
	    49.加强公共文化建设。加快广州美术馆等重要文化设施建设。推进学习型社区建设。向基层倾斜公共文化资源，积极开展文化建设对口帮扶，全面推进城乡公共文化建设，进一步完善重点区域、重点镇（含中心镇）公共文化设施功能配套。逐步向社会免费开放图书馆、文化馆、博物馆等公共设施。到2015年，全部文化站力争达省一级以上标准，实现农村“10里文化圈”。（牵头单位：市文化广电新闻出版局）</p><p align=\"left\">
	十、构建全面完善的特殊群体保障体系</p><p align=\"left\">
	    50.提高老年人优待水平。每年为65周岁以上的户籍特殊困难老年人提供1次定点免费体检和保健指导，逐步建立完善老年人健康档案。（牵头单位：市民政局，配合单位：市财政局、市卫生局）</p><p align=\"left\">
	    51.维护妇女儿童合法权益。到2015年，建成新广州儿童公园，力争各区（县级市）各建有1所儿童公园；有条件的财政投入综合性公园，按园区陆地面积5%－10%的比例设置儿童户外公共活动场地，并设置一定比例免费游乐设施。每个社区（村）设有1个儿童活动场所并设置免费游乐设施。重点关注妇女癌症、母婴生命安全、新生儿出生缺陷干预、出生人口性别比偏高和重症儿童救治。严厉打击非医学需要的胎儿性别鉴定和选择性别的人工终止妊娠行为。完善孤儿的安置、医疗、教育、就业、住房等保障体系，适时调整孤儿养育标准。加快推进市第二福利院、市福利院特殊教育康复楼建设。（牵头单位：市妇联，配合单位：市民政局、市卫生局、市规划局、市林业和园林局、市人口计生局、市体育局，各区、县级市政府）</p><p align=\"left\">
	    52.加强残疾人社会保障和公共服务。加快推进残疾人无障碍环境建设。增加残疾人就业的培训项目和公益性岗位。逐步将19个以上残疾人医疗康复训练项目及残疾人辅助器具适配国家目录纳入医保统筹。加大“志愿在康园”计划实施力度。逐年提高残疾人康复资助标准。到2014年，力争各区（县级市）建有1个精神康复综合服务机构。到2015年，建成使用广州市康复实验学校、农村特殊学校、康宁果园场，每个街（镇）建有1个残疾人社区康复（托管）站。（牵头单位：市残联，配合单位：市发展改革委、市财政局、市人力资源和社会保障局、市卫生局、团市委）</p><p align=\"left\">
	    53.加强社区矫正、刑释解教和吸毒三类人员帮教管控。加快信息化管理系统建设，落实三类人员的监管措施和社会适应性帮扶工作，预防和减少重新违法犯罪行为，维护社会和谐稳定。到2015年，有就业和技能培训意向的全市刑释解教人员安置率达到95%以上，帮教率达到98%以上，有就业和技能培训意愿的本市户籍刑释解教人员劳动技能培训率达到100%。（牵头单位：市司法局，配合单位：市公安局、市人力资源和社会保障局，各区、县级市政府）</p><p align=\"left\">
	    54.加强流浪乞讨人员救助管理。修订流浪乞讨人员救助管理办法。做好流浪乞讨危重病人、精神病人救治救助工作，加强市、区（县级市）流动救助服务队伍建设，强化街头主动救助。加大流浪未成年人救助保护力度，严厉打击组织、胁迫、诱骗未成年人乞讨等违法犯罪行为。（牵头单位：市民政局，配合单位：市公安局、市卫生局、市城管局，各区、县级市政府）</p><p align=\"left\">
	十一、构建开放包容的异地务工人员服务体系</p><p align=\"left\">
	    55.拓展基本公共服务范围。依托政府管理平台和社会组织，建设区（县级市）异地务工人员综合服务中心，构建政府、用人单位、社会组织等共同参与的异地务工人员社会化服务体系。将异地务工人员纳入慈善医疗、应急救助范围。社会保障、计划生育、法律援助、文体娱乐等基本公共服务逐步向异地务工人员覆盖。（牵头单位：市人力资源和社会保障局，配合单位：市民政局、市司法局、市文化广电新闻出版局、市体育局、市人口计生局、市流动人员出租屋管理办，各区、县级市政府）</p><p align=\"left\">
	    56.强化就业援助服务。每个街（镇）建有就业服务站，提供就业指引和劳动纠纷法律服务。建立企业、劳动者、政府三方参与的异地务工人员就业培训机制，向居住一年以上且办理就业登记的异地务工人员发放免费职业培训券。2012~2015年，年均推荐异地务工人员就业10万人次。（牵头单位：市人力资源和社会保障局，配合单位：市司法局、市民政局、市财政局，各区、县级市政府）</p><p align=\"left\">
	    57.扩大社会保险范围。将与企业建立稳定劳动关系的异地务工人员纳入城镇职工基本养老保险和医疗保险范围。加大异地务工人员参与社会保险监管力度。到2015年，建立劳动关系的异地务工人员基本参加工伤保险。（牵头单位：市人力资源和社会保障局，配合单位：市地税局）</p><p align=\"left\">
	    58.改善居住条件。支持开发区、园区集中建设面向用工单位或园区就业人员配租的集体宿舍、员工公寓。市、区（县级市）政府每年安排一定数量公共租赁住房，通过积分制解决部分优秀异地务工人员住房困难问题。（牵头单位：市国土房管局，配合单位：市人力资源和社会保障局）</p><p align=\"left\">
	    59.拓宽参与社会服务管理渠道。积极探索异地务工人员参与村（居）民自治的方式方法，引导异地务工人员合理有序参与居住地的社会服务管理，吸纳优秀异地务工人员参政议政。加强异地务工人员党团组织建设。有序推动异地务工人员服务协会规范发展，鼓励各类社会组织积极参与异地务工人员服务，实现异地务工人员自我服务、自我管理、自我提高。（牵头单位：市社工委，配合单位：市委组织部、市民政局、市总工会、团市委，各区、县级市政府）</p><p>
	    60.增强归属感和责任感。探索和完善异地务工人员“积分制入户”及其子女教育、住房保障、城乡社会保险制度衔接等方面的具体配套政策。健全异地务工人员评优制度和积分评价体系。强化政府服务职能，完善异地务工人员利益诉求机制，及时了解掌握异地务工人员合理需求，切实维护好异地务工人员的合法权益。加大异地务工人员及其子女的关爱志愿服务，积极帮助异地务工人员适应、融入城市生活。（牵头单位：市社工委，配合单位：市发展改革委、市公安局、市民政局、市人力资源和社会保障局、市教育局、市司法局，各区、县级市政府）</p>','1','100','news','1389595808','0');
INSERT INTO `post` (`id`,`category_id`,`model`,`title`,`alias`,`image_name`,`file_name`,`tinyint1`,`int10`,`char32`,`varchar30`,`varchar50`,`varchar100`,`varchar128`,`content`,`status`,`weight`,`view`,`created_at`,`updated_at`) VALUES
('46','11','news','关于推进科技创新工程实施意见','432c61505457d626c2ea2f622c331f52','','','0','0','','','','','
	    为深入贯彻科学发展观，全面落实省第十一次党代会、市第十次党代会精神，根据《中共中央、国务院关于深化科技体制改革加快国家创新体系建设的意见》和《中共广州市委、广州市人民政府关于全面推进新型...','<p>
	    为深入贯彻科学发展观，全面落实省第十一次党代会、市第十次党代会精神，根据《中共中央、国务院关于深化科技体制改革加快国家创新体系建设的意见》和《中共广州市委、广州市人民政府关于全面推进新型城市化发展的决定》，现就推进科技创新工程提出以下实施意见。</p><p align=\"left\">
	　　一、发展目标</p><p align=\"left\">
	　　1.实施创新驱动战略，把创新作为城市发展的核心动力。推进全省自主创新综合示范区建设，打造具有国际影响力的华南科技创新中心，到2015年将广州建设成为国家创新型城市。</p><p align=\"left\">
	　　创新平台建设取得新突破。构建具有国际先进水平的科技园区和科研机构集聚区，建成一个具有国际领先水平的国家级超级计算中心，建设一批国家重点实验室、国家工程技术研究中心、国家工程实验室，打造一批国际科技合作基地，引进一批国际级研发中心。</p><p align=\"left\">
	　　创新型企业集群发展壮大。大中型工业企业设立研发机构的比例达35%，全市开展研发活动的规模以上工业企业占比达12%。培育5家以上年销售收入过百亿元、2家以上年销售收入达500亿元的高新技术企业，新增30家以上科技企业上市、60家创新型企业、300家科技小巨人企业。规模以上工业高新技术产品年产值超过10000亿元，占规模以上工业总产值的比重达45%。</p><p align=\"left\">
	　　高端创新创业人才加速集聚。培养一批优秀创新型人才和企业家，吸引一批拥有自主知识产权或掌握核心技术、具有海外自主创业经验的创业领军人才；建设一批科学家工作室；75%以上科技人员落户企业。</p><p align=\"left\">
	　　科技创新投入大幅提升。全社会研发（R&D）经费支出占GDP比重提高到2.5%以上；企业研发投入强度明显提升，规模以上工业企业R&D经费支出占全社会R&D经费支出比重逐步增加。</p><p align=\"left\">
	　　科技成果转化能力显著提升。争取国家“863”计划、国家科技支撑计划、科技重大专项成果在广州实现产业化项目30项以上，每百万人口年发明专利授权量达350件，50%以上的专利由企业申请，形成国家科技成果转化应用基地。</p><p align=\"left\">
	　　科技创新成果更加惠及民生。创新成果更广泛应用于生命健康、节能减排、生态环保、城市管理等领域，数字家庭、智慧社区、智慧医疗、智能交通、智慧社保等进一步普及。公民具备基本科学素质的比例超过8%。</p><p align=\"left\">
	　　二、主要任务</p><p align=\"left\">
	　　2.建设重大创新平台。推进广州高新区各园区、中新广州知识城、广州国际创新城、广州国际生物岛等科技园区建设。着力构建中国软件名城。推广土地资本、金融资本、产业资本融合发展模式，推动大学科技园、民营科技园、专业镇发展壮大。重点支持建设一批科技前孵化器、科技企业孵化器和加速器，建设15家以上国家级科技企业孵化器，面积500万平方米以上，在孵企业6000家以上。依托广州超级计算中心，发展生物健康、工业设计、文化创意等一批大数据产业。加快建设光电子与纳米材料、发光材料与器件、机器人、呼吸疾病等一批国家级重点实验室，优化提升移动通讯、基因工程药物、数字家庭等一批国家级工程技术研究中心。推进专利信息服务平台建设和推广应用，为企业技术创新提供支撑。（牵头单位：市科技和信息化局，配合单位：市发展改革委、市经贸委、市规划局、市知识产权局，各区、县级市政府）</p><p align=\"left\">
	　　3.推进协同创新。深化珠三角区域科技合作，发挥广州中心城市龙头带动、集聚辐射作用，在重大技术攻关、科技基础设施、公共服务平台、科技服务体系等领域，开拓合作渠道，建立合作机制，有效整合区域创新资源。建立地方、企业和高等院校、科研院所协同创新联盟。积极拓展与国内外大院大所合作方式与渠道，在科技园区布局设立一批科技合作基地，引进高端资源。支持企业与高等院校、科研院所开展产学研用协同创新，设立校企联合研发机构。建立产学研用创新联盟、区域创新联盟、科技园区联盟、创业投资联盟等一批协同创新合作平台。支持和鼓励各创新主体根据自身特点和优势，探索多种形式的协同创新模式。（牵头单位：市科技和信息化局，配合单位：市发展改革委、市经贸委、市教育局、市知识产权局，各区、县级市政府）</p><p align=\"left\">
	　　4.提升企业技术创新能力。支持大型企业设立研发中心，引导中小型企业联合设立行业研发中心和研发联盟，增强企业自主知识产权的创造、应用和转化能力。落实好企业研发费用税前加计扣除政策。制订科技企业成长路线图行动计划和相关政策，针对科技企业不同成长阶段予以政策支持。对创新型企业和科技小巨人企业，按企业研发投入额度由市、区（县级市）两级财政给予一定比例的资金资助。实行“一对一”特别帮扶措施，推进企业创新能力建设。对成长扩张期科技企业，积极引导其利用资本市场规范发展，对改制上市的予以奖励和成本补助。（牵头单位：市科技和信息化局，配合单位：市知识产权局、市经贸委、市财政局、市国税局、市地税局、市国资委、市金融办，各区、县级市政府）</p><p align=\"left\">
	　　5.支持申报国家、省重大科技项目。企业申报或者联合高等院校、科研院所申报国家、省重大科技项目获得支持的，组织单位有明确配套要求和配套比例的，市财政按项目要求的比例予以配套；组织单位有明确配套要求，但没有明确配套比例的，市财政视财力情况予以配套资金支持。（牵头单位：市科技和信息化局，配合单位：市发展改革委、市财政局，各区、县级市政府）</p><p align=\"left\">
	　　6.培育和引进创新创业人才。加快建设“千人计划”南方创业服务中心，实施“红棉计划”、创新创业领军人才“百人”计划、珠江科技新星培育计划，引进和培养海内外人才创新创业。创新“3+N”主题办会模式，不断提升广州留交会人才聚集效应。扶持科学家工作室开展创新活动。实施科技人员创业工程，支持科技人员创办科技型企业。加强与高等院校、科研院所、企业合作，建设一批特色专业学院、技师学院，有针对性地选拔资助优秀学生赴海外留学深造，培养战略性新兴产业发展急需的专业人才和技能人才。建设国家级区域性人才信息资源中心和服务中心，形成珠三角高端科技创新人才聚集地。（牵头单位：市人才办，配合单位：市科技和信息化局、市教育局、市人力资源和社会保障局）</p><p align=\"left\">
	　　7.激励科技人员创新创业。鼓励高等院校、科研院所以科技成果作价入股的企业、国有控股的院所转制企业、高新技术企业实施企业股权激励以及分红激励试点，对作出突出贡献的人员给予股权奖励、股份期权、分红权、科技成果收益分成等激励。推动高等院校、科研院所与企业之间人才双向交流，鼓励符合条件的企业优秀领军人才在高等院校、科研院所评聘职称、兼职、授课、培养研究生，支持高校教师和科研人员到企业兼职服务并取得收入。（牵头单位：市人才办，配合单位：市科技和信息化局、市教育局、市人力资源和社会保障局、市经贸委、市国资委）</p><p align=\"left\">
	　　8.推进创新资源共享。完善科技创新资源共享机制，市财政设立专项资金，实行公共创新平台开放共享补助政策，推动创新平台和科研仪器设备向企业、社会开放。建立财政性资金购买科研仪器设备审查制度和大型仪器设备信息公开制度，推进科技资源共享。（牵头单位：市科技和信息化局，配合单位：市发展改革委、市财政局、市国资委、市教育局）</p><p align=\"left\">
	　　9.促进科技成果转化。争取国家和省的支持，赋予广州地区高等院校、科研院所对科技成果处置和收益有更大自主权。实施重大科技成果转化示范工程，运用贷款贴息、股权投资、无偿资助等方式支持重大技术成果转化，建立自主创新产品推广应用机制。探索政府以股权投资方式参与重大科技成果产业化。加强国家专利技术广州展示交易中心、广州技术产权交易所建设，加大市专利发展专项扶持力度，推进知识产权交易，促进企业重点专利技术产品成果产业化。充分发挥广州股权交易中心的作用，支持非公开上市科技企业进行产权交易。（牵头单位：市科技和信息化局，配合单位：市财政局、市发展改革委、市金融办、市国资委、市知识产权局）</p><p align=\"left\">
	　　10.培育创新型产业集群。重点支持产业上下游技术协同创新，组织战略性新兴产业和传统优势产业核心关键技术攻关。以智慧城市建设推动电子信息产业结构优化升级，大力发展电子商务、软件、云计算、物联网、互联网、高端电子、数字家庭等新兴产业，催生一批新一代信息技术新模式、新业态。围绕建设广州国际生物岛、广州国际健康医疗中心、广州国际健康产业城，实施一批生物技术重大项目，打造生物与健康产业创新集群。以广州科学城、番禺节能科技园等为载体，加快节能环保、新能源、新材料与高端制造等产业技术创新。（牵头单位：市发展改革委，配合单位：市科技和信息化局、市经贸委、广州开发区管委会、越秀区政府、白云区政府、番禺区政府）</p><p align=\"left\">
	　　11.加强国际科技交流合作。高标准推进广州国际创新城建设，加快广州国际科技合作交流中心、中乌联合研究院和广东—独联体国际科技合作联盟、伯明翰大学广州中心等一批国际科技合作创新平台建设，打造国际科技孵化基地，增强国际创新资源集聚的能力。引进高端创新资源，支持境外研发机构和跨国企业来穗开展技术研发、转移和成果转化。（牵头单位：市科技和信息化局，配合单位：市发展改革委、市财政局、市外经贸局、番禺区政府、白云区政府、天河区政府）</p><p align=\"left\">
	　　12.促进引进技术消化吸收再创新。利用财政性资金或国有资本引进重大技术、装备的，应当编制引进技术消化吸收再创新方案，并经科技主管部门联合有关部门组织专家论证。重点支持企业和研发机构对引进境外技术进行消化吸收再创新，协调落实相关优惠政策，对同步设立核心技术研发机构的重大外商投资项目，根据其对地方经济社会贡献，按比例给予一定补贴，用于技术研究开发。对企业引进消化吸收再创新的成果，获得各级科学技术奖或专利的，给予奖励。鼓励企业将引进消化吸收再创新的产品和服务参与政府采购。（牵头单位：市科技和信息化局，配合单位：市财政局、市外经贸局、市经贸委）</p><p align=\"left\">
	　　13.促进科技金融结合。完善科技金融服务平台，推动科技创新链条与金融创新链条的有机融合，形成多元化、多层次、多渠道的科技投融资体系。推进国家科技与金融结合试点城市工作。设立政策性的天使基金。大力发展创业投资，运用创业投资引导基金撬动社会资本，投入科技创新，对新设立、注册和纳税在我市并符合规定的股权投资机构给予落户奖励。争取在广州高新区设立科技发展银行，支持商业银行设立科技支行，开展知识产权质押贷款、股权质押贷款等科技金融服务，制定知识产权质押融资办法。扩大市科技型中小企业贷款担保专项资金的规模，创新政策性担保资金运作模式，为获得各级科技计划支持、具有专利的产业化项目提供担保。建立科技型中小企业贷款贴息、补偿机制。开展科技保险补贴和专利保险补贴。积极争取广州高新区纳入新三板扩大试点。（牵头单位：市科技和信息化局，配合单位：市金融办、市发展改革委、市财政局、市国资委、市经贸委、市知识产权局、广州开发区管委会）</p><p align=\"left\">
	　　14.支持知识产权和技术标准创造。科技计划项目对具有或可能形成自主知识产权的研究开发项目予以优先立项，应用性研究开发项目以获得知识产权作为项目验收的主要指标。强化市专利申请资助力度，适度提高资助标准，扩大资助范围。对申请、代理专利作出重要贡献的单位给予定额资助；委托专利代理机构申请发明专利的，其代理服务费给予定额资助；申请《专利合作条约PCT》缔约国发明专利保护和具有知识产权的新药临床，给予申请费用定额资助。对企事业单位专利申请和商标注册大户，给予奖励或补贴。对企业、高等院校、科研院所、行业协会等主导或参与国际标准、国家标准、行业标准和地方标准的制定和修订的，给予不同额度的资金支持。（牵头单位：市知识产权局，配合单位：市科技和信息化局、市财政局、市质监局、市工商局）</p><p align=\"left\">
	　　15.完善科技服务体系。培育一批科技咨询、科技中介服务机构，发展一批多专业的综合技术服务联盟，加快“广东现代服务超市”和科技服务研究院建设，重点发展研发设计、技术转移转化、技术服务外包、检测认证服务、科技咨询和创新创业等科技服务业，探索科技服务模式创新，构建和完善社会化、网络化的科技服务体系。（牵头单位：市科技和信息化局，配合单位：市发展改革委、市经贸委、市外经贸局、市质监局、各园区）</p><p align=\"left\">
	　　16.运用科技成果利民惠民。实施重大民生科技攻关和成果应用示范工程，推进民生科技成果开发、转化及推广应用，增加民生科技公共产品和服务供给，支持医疗卫生健康、人口、体育、食品安全、能源环境、公共安全、防灾减灾、新农村建设等领域的关键核心技术创新和示范推广。（牵头单位：市科技和信息化局，配合单位：市人口计生局、市卫生局、市食品药品监管局、市经贸委、市农业局、市公安局、市体育局、市环保局）</p><p align=\"left\">
	　　17.深化科技管理体制改革。加强对市科技和信息化发展的统筹协调，建立健全高新园区协调机制，强化统筹规划，整合资源，实行统一发展政策。统筹全市财政科技经费，集中资源办大事。完善科技计划体系和财政科技经费使用办法，建立绩效、效益导向机制，提高财政科技投入的效益，建立科技计划实施的绩效、项目立项公开制度，财政科技经费投入绩效评价制度。探索建立对企业研发项目的后补助或奖励制度。提高科技计划项目人员经费和间接费用比例。鼓励高等院校、科研院所联合企业申报科技计划项目。科技计划项目形成的科技成果在发表论文前应申请专利。（牵头单位：市科技和信息化局，配合单位：市发展改革委、市编办、市财政局、广州开发区管委会、天河区政府、白云区政府、越秀区政府、南沙区政府）</p><p align=\"left\">
	　　18.营造保护和促进创新的法治和市场环境。充分发挥政府主导作用，加大资金和人员投入，完善保护创新的法规体系建设，优化维护公平公正的法律环境和保护创新的市场环境，使各类创新主体公平竞争获得创新资源。进一步落实国家和省有关科技进步的法律法规。加快制订《广州市科技创新促进条例》，完善科技成果转化、知识产权保护的政策措施。各科技园区要为创业企业提供全方位、一站式的综合服务。加大对科技创新活动和科技创新成果的法律保护力度，加强知识产权保护执法，对高新技术企业的商标海外注册、商标质押给予资金扶持，严厉打击侵权、制售假行为，维护市场秩序，鼓励和保护创新。（牵头单位：市科技和信息化局，配合单位：市发展改革委、市经贸委、市法制办、市文化广电新闻出版局、市知识产权局、市金融办、市公安局、市工商局、市政务办、广州开发区管委会、各园区）</p><p align=\"left\">
	　　19.营造创新文化氛围。在全社会弘扬创新创业文化，培育创新意识，提倡敢为人先、勇于探索的精神，营造激励成功、宽容失败的社会氛围。举办科技创业论坛、创业大赛等活动，活跃广州创新创业氛围。建立科学研究与公众沟通的体制和机制，向公众传播前沿科技研究成果。增加科普经费投入，加强科普基地建设，创新科普传播手段，实施基层“科普行动计划”和“市民信息能力提升行动”等专项活动，鼓励高等院校、科研院所定期向公众开放，提升公众科学素质。（牵头单位：市科技和信息化局，配合单位：市财政局、市教育局、市文化广电新闻出版局、市科协）</p><p align=\"left\">
	　　三、保障措施</p><p align=\"left\">
	　　20.加强组织领导。各级党委政府、各部门要高度重视创新型城市建设，加强领导和统筹，充分发挥市科技和信息化工作领导小组及广州国家创新型城市建设工作领导小组的作用，强化领导小组统筹协调职能，统筹协调建设创新型城市中的重大事项，督促各部门实施、落实各项工作分工。建立创新型城市专家咨询委员会和相关支撑研究机构。各责任部门根据本《实施意见》提出的发展目标和主要任务，制定更具针对性和可操作性的政策措施并切实落实。（牵头单位：市科技和信息化局，配合单位：市科技和信息化工作领导小组各成员单位、市国家创新型城市建设工作领导小组各成员单位）</p><p align=\"left\">
	　　21.建立省市联动机制。积极争取国家、省对广州自主创新的政策、资源指导和支持，创建全省自主创新综合示范区，建立省市有关部门参与的协调机制，搭建省市联合创新政策资源平台。认真落实《广东省自主创新促进条例》，制定突破性政策措施，建立跨层级联合审批机制。整合和激活广州地区内高等院校、科研院所、企业、科技园区、投融资机构等优势创新资源，促进省市创新资源的综合集成和高效配置,释放创新潜能，提高创新效率。（牵头单位：市科技和信息化局，配合单位：市发展改革委、市金融办、市教育局、市经贸委）</p><p>
	　　22.加大科技创新投入。建立健全以政府投入为引导、企业投入为主体、社会投入为支撑的全社会科技投入体系。市财政年度预算中用于科学技术经费的增长幅度，应当高于本级财政经常性收入的增长幅度，重点投向产业发展关键共性技术研发、科技成果转化、应用开发和创新平台建设等。战略性主导产业和战略性新兴产业发展资金重点支持科技成果产业化和园区载体建设。建立并完善财政科技经费使用的社会监督制度，提高资金使用效益。（牵头单位：市财政局，配合单位：市科技和信息化局、市发展改革委）</p>','1','100','news','1389595889','0');
INSERT INTO `post` (`id`,`category_id`,`model`,`title`,`alias`,`image_name`,`file_name`,`tinyint1`,`int10`,`char32`,`varchar30`,`varchar50`,`varchar100`,`varchar128`,`content`,`status`,`weight`,`view`,`created_at`,`updated_at`) VALUES
('47','0','single','博士俱乐部','club','','','0','0','','','','','博士俱乐部','<p>
	广东博士俱乐部是
	<st1>广东博士俱乐部有限<st1>公司为博士和高端人才打造的科技、文化、学术交流的平台。</st1></st1></p><p>
	俱乐部位于广州市环市中路205号恒生大厦B座，交通便利，环境清雅，面积近
	<st1>三千平方米，设有交流中心、多媒体发布厅、商务会议室等，软硬件设施齐备，是博士和高端人才开展科技交流、文化传播、学术研讨的首选之地。</st1></p><p>
	俱乐部秉承“聚博士智慧，建博士之家”的服务理念，组建各领域的博士、专家队伍，打造立足广东、辐射全国、连通世界的高级人才集聚基地，为人才强省、推动广东区域经济发展提供坚实的人才保障和智力支持。</p><p style=\"text-align: center; \">
	<img src=\"/upload/images/fef3dfc5a7c6d4d436888cee79a85646.jpg\"></p><p style=\"text-align: center; \"></p><p style=\"text-align: center; \">
	<img src=\"/upload/images/55b826bb501a6069367167d63c4943fa.jpg\"></p>
<table width=\"200\" border=\"0\" align=\"center\" cellpadding=\"5\">
<tbody>
<tr>
	<td>
	</td>
	<td>
		<span  style=\"font-size: 16px; color: #06F; font-weight: bold;\">会员服务</span>
	</td>
</tr>
<tr>
	<td>
		<span  style=\"font-size: 16px; color: #06F; font-weight: bold; \">服务范围</span>
	</td>
	<td>
		<span  style=\"font-size: 16px; color: #06F; font-weight: bold;\">会务服务</span>
	</td>
</tr>
<tr>
	<td>
	</td>
	<td>
		<span  style=\"font-size: 16px; color: #06F; font-weight: bold;\">文化传播</span>
	</td>
</tr>
</tbody>
</table><p align=\"left\" style=\"text-align: left; color: #03C; font-weight: bold;\">
	会员服务</p><ul>
	
<li>管家服务：会籍管理、财税服务、商务服务</li>	
<li>人才服务：经营服务、创业服务、健康服务</li>	
<li>科技服务：知识产权服务、科学技术服务、科技成果服务</li></ul><p align=\"left\" style=\"text-align: left; color: #03C; font-weight: bold;\">
	会务服务</p><ul>
	
<li>活动策划：学术沙龙、论坛、科技成果发布活动策划</li>	
<li>商务服务：场地租赁、会场服务、礼仪服务</li></ul><p align=\"left\" style=\"text-align: left; color: #03C; font-weight: bold;\">
	文化传播</p><ul>
	
<li>文化推广：文化展览、品牌策划、宣传片制作</li>	
<li>教育培训：学历教育、专业技能培训、综合素质提升</li></ul><p style=\"text-align: center; \">
		<img src=\"/upload/images/1e8dd57255feed5efdf1a61d7df5a786.jpg\" alt=\"\">
	</p>','1','100','single','1389767680','1389770657');
INSERT INTO `post` (`id`,`category_id`,`model`,`title`,`alias`,`image_name`,`file_name`,`tinyint1`,`int10`,`char32`,`varchar30`,`varchar50`,`varchar100`,`varchar128`,`content`,`status`,`weight`,`view`,`created_at`,`updated_at`) VALUES
('48','0','single','综合服务中心','zh','','','0','0','','','','','综合服务中心','<p>
	<span  style=\"font-size:16px;\">广东博士俱乐部综合服务中心是广东博士俱乐部有限公司设立的，为博士、专家、社会组织、企事业单位提供综合服务的机构。</span></p><p>
	<span  style=\"font-size: 16px; \">    本中心依托广东博士俱乐部庞大的博士、专家队伍，整合高校、社会组织及各专业服务机构的资源，致力于为博士、专家、社会组织、企事业单位提供财务、税务、资产评估、</span>科技项目管理、<span  style=\"font-size: 16px; \">高新技术企业认定等服务。</span></p><p>
	<span  style=\"font-size: 16px; \"><br>
	</span></p><p align=\"center\" style=\"text-align: center;\"></p><p align=\"left\" style=\"text-align: left; color: rgb(0, 102, 255); font-weight: bold; \">
	<span  style=\"font-size: 24px; \">服务范围：</span></p><p align=\"left\" style=\"text-align: left; color: #06F; font-weight: bold; font-size: 16px;\">科技类社会组织服务</p><ul>
	<li><span  style=\"font-size: 16px; \">文秘服务：代办注册、代办变更和年检服务；</span></li><li><span  style=\"font-size: 16px; \">前台秘书服务：为入孵协会提供收发传真、代联系收发件服务、联系停车位服务、代购办公用品服务等行政服务；<br></span></li></ul><p align=\"left\" style=\"text-align: left; color: rgb(0, 102, 255); font-weight: bold; \">
	<span  style=\"font-size: 16px; \">
	财税专业服务</span></p><ul>
	<li><span  style=\"font-size: 16px; \">财务专业服务：代理记帐、代办年检；审查企业会计报表，出具审计报告；验证企业资本，出具验资报告；办理企业合并、分立、清算事宜中的审计业务，出具有关的报告等；</span></li>	<li><span  style=\"font-size: 16px; \">项目可行性研究：包括企业股份制改造、上市、企业兼并、重组的评价、论证及策划；</span></li>	<li><span  style=\"font-size: 16px; \">税务专业服务：税务咨询（顾问）、税收筹划、减免退税申报、企业所得税汇算清缴、税前弥补亏损和财产损失鉴证及其他税务服务并出具有关的报告等；</span></li></ul><p align=\"left\" style=\"text-align: left; color: rgb(0, 102, 255); font-weight: bold; \">
	<span  style=\"font-size: 16px; \">
	资产评估专业服务</span></p><ul>
	<li><span  style=\"font-size: 16px; \">整体资产评估：包括企业股份制改造，企业兼并、中外合资、合作、投资入股、产权转让、重组、清算等；</span></li>	<li><span  style=\"font-size: 16px; \">单项资产评估：包括各类房屋建筑物、机器设备、流动资产、在建工程、土地使用权及专利权、商标、商誉等无形资产的评估，为合资、合作、投资入股、产权转让、抵押、招商、融资、保险、拍卖、清算、租赁、产权纠纷、协助法院办案提供相应的价值依据；</span></li>	<li><span  style=\"font-size: 16px; \">与评估相关的其他咨询业务、市场调查及预测服务等；</span></li></ul><p align=\"left\" style=\"text-align: left; color: rgb(0, 102, 255); font-weight: bold; \">
	<span  style=\"font-size: 16px; \">
	项目管理服务</span></p><ul>
	<li><span  style=\"font-size: 16px; \">项目咨询、申报、实施、结题验收等服务。</span></li></ul><p align=\"left\" style=\"text-align: left; color: rgb(0, 102, 255); font-weight: bold; \">
	<span  style=\"font-size: 16px; \">
	高新企业申报服务</span></p><ul>
	<li><span  style=\"font-size: 16px; \">高新技术企业认定服务（含复审）：包括研发费用专项审计、加计扣除专项审计、高新技术企业申报材料编制；</span></li></ul><p align=\"center\">
	<img src=\"/upload/images/82028cf08d41086e5cce0c006cee0bc2.jpg\" align=\"middle\"></p>','1','100','single','1389772536','1394761363');
INSERT INTO `post` (`id`,`category_id`,`model`,`title`,`alias`,`image_name`,`file_name`,`tinyint1`,`int10`,`char32`,`varchar30`,`varchar50`,`varchar100`,`varchar128`,`content`,`status`,`weight`,`view`,`created_at`,`updated_at`) VALUES
('49','0','single','博 士 服 务 站','bs','','','0','0','','','','','博士服务站','<p>博士服务站是<st1>广东博士俱乐部有限公司在区域、行业、企业开展人才、科技、健康、文化、生态等服务的专业机构，是博士、专家在区域、行业、企业开展博士服务的“桥头堡”。</st1></p><p>通过凝聚博士、专家的智慧，以区域、行业、企业服务需求为导向，依托博士、专家团队为区域、行业、企业的创新发展提供人才、科技、健康、文化、生态等服务，为区域健康发展、行业融和创新、企业转型升级提供全方位的服务。</p>','1','100','single','1389837038','1395021802');
INSERT INTO `post` (`id`,`category_id`,`model`,`title`,`alias`,`image_name`,`file_name`,`tinyint1`,`int10`,`char32`,`varchar30`,`varchar50`,`varchar100`,`varchar128`,`content`,`status`,`weight`,`view`,`created_at`,`updated_at`) VALUES
('50','27','build','广东健康产业促进会','jk','','','0','0','','','','','       广东健康产业促进会(GuangDong Health Industry Promotion Association ()成立于2013年 3月 29日，是为贯彻党和国家关于加快培育建设具...','<p style=\"text-align: center; \"><img src=\"/upload/images/b30a40490c8def37bddf68e6b791d62f.jpg\"></p><p>       广东健康产业促进会(GuangDong Health Industry Promotion Association ()成立于2013年 3月 29日，是为贯彻党和国家关于加快培育建设具有社会服务功能和社会监督职责的中介机构的精神,推进国民经济重要产业发展战略和规划决策科学化、促进健康产业发展，由广东省民政厅社会组织管理局审核批准、由省内外从事健康产业发展和产业政策研究工作的机构（团体）和具有行业影响力的企业自愿组成的全省性联合组织，是具有法人资格的、非盈利的全省性社会团体。</p><p>       广东健康产业促进会为加强健康产业企业与政府部门的联系，促进产业发展，成为产业政策与产业发展的沟通平台和纽带；为会员单位了解产业政策、产业发展战略和规划，向政府部门表达有关建议和意见提供服务，为会员与政府之间、会员与会员之间、会员与非会员之间的信息交流提供服务；为政府、企业及专家学者提供围绕健康产业政策、健康产业发展和规划及其他相关问题展开高层次经常性沟通平台。</p><p>          健康产业以生物技术和生命科学为先导，涵盖医药卫生、膳食营养、保健休闲等许多方面，是新世纪引导全球经济发展和社会进步的朝阳产业。在这发展的黄金时代，广东健康产业促进会的成立，符合我省健康产业科学发展、加快推进产业转型升级的客观需要，对于进一步密切行政监管、技术检验、企业经营和社会舆论的沟通与联系，维护良好的市场秩序，促进产、学、研相结合，开展学术活动、人才培训和科技服务，提升从业人员的道德诚信水准等方面，都必将发挥重要的作用。</p><p>       广东健康产业促进会作为服务全省健康产业组织的社团组织，将充分发挥联系政府、企业和公众的桥梁纽带作用，坚持政府引导和支持，根据健康产业发展的特点和规律，结合市场需求，协助和完善政府服务职能，促进产业转型创新。</p><p>       广东健康产业促进会作为汇聚高知识群体的社团组织，将充分凝聚行业专家智慧，发挥智囊智库作用。深入研究我省健康产业中具有前瞻性、全局性、战略性的重大课题，多出高质量、高水平的研究成果，适时总结推广成功经验和模式，为政府的科学决策提供依据。</p><p>       广东健康产业促进会作为资源整合的社团组织，将充分整合社会服务资源，建立社会化服务体系，在人才服务、技术创新、投融资服务、市场拓展、信息咨询等方面为企业提供有针对性和实效性的服务产品，增强健康产业的核心竞争力和持续发展能力。</p><p>       广东健康产业促进会开展的业务主要有：健康产业信息交流、产业开发、产业政策研究、专题论坛、专业展览、产业合作、健康咨询、健康管理、专业培训、书刊出版等。</p>','1','81','news','1390405944','1394445314');
INSERT INTO `post` (`id`,`category_id`,`model`,`title`,`alias`,`image_name`,`file_name`,`tinyint1`,`int10`,`char32`,`varchar30`,`varchar50`,`varchar100`,`varchar128`,`content`,`status`,`weight`,`view`,`created_at`,`updated_at`) VALUES
('51','27','build','广州市科技类社会组织孵化培育基地','fhq','','','0','0','','','','','	        广州市科技类社会组织孵化培育基地（下称“孵化培育基地”）是在广州市科学技术协会指导下成立的，由广州市学会学研究会、广州市科技创新联盟、广东博士俱乐部有限公司具体承办和运营管理的综...','<p>
	        广州市科技类社会组织孵化培育基地（下称“孵化培育基地”）是在广州市科学技术协会指导下成立的，由广州市学会学研究会、广州市科技创新联盟、<st1 style=\"line-height: 1.5rem;\">广东博士俱乐部有限公司具体承办和运营管理的综合办公、联合协作、资源整合、项目带动和网络延伸等集约化综合服务平台。</st1></p><p>
	        坚持政府主导、社会组织承担、企业参与的原则，按照广东省、广州市关于构建枢纽型社会组织的标准要求，采取广州市学会学研究会、广州市科技创新联盟、<st1>广东博士俱乐部三位一体的组织形式，实现学会之家、培育基地、科技集市等枢纽性功能作用。</st1></p><p>
	        基地服务宗旨是成为广州市科技类社会组织党建纪检工作的指导中心、购买服务的示范中心、科技信息的发布中心、会员单位的合作中心、社会服务的促进中心、培育扶持的孵化中心和加盟组织的业务中心。</p><p>
	<strong>        学会之家</strong>：通过定期召集相关学会举办联谊活动、学术交流、科技成果展示、科普宣传和科技服务等，为入会单位搭建多元化的交流平台，形成辐射性强的社会组织网络，发挥宗旨引领、品牌示范和项目运作和协调服务等作用，引导和联合各入会单位共同发展,搞好党建工作，参与社会管理和公共服务。</p><p>
	<strong>        培育基地</strong>：通过提供基础设施与服务，整合社会资源，实现资源、信息互通，优势互补，构建科技类社会组织的培训指导、孵化扶持、管理服务、咨询代理等一站式服务体系，解决其在发展过程中遇到的场地、资金、项目和管理等难题，帮助社会组织成长发展。为广州市科技类社会组织更好地承接政府职能转移，助推创新驱动提供良好的社会基础。</p><p>
	<strong>        信息平台</strong>：通过科技类社会组织的培育和孵化，构建这些组织相互沟通联系的平台，畅通这些组织的信息交流，依托网络和信息技术的发展完善，实现科技信息、科普信息、创新信息、政务信息等的共建共享。</p><p>
	<strong>        科技集市</strong>：通过实物、论文、电子等方式，展示学会组织的科研成果，助推产学研有关项目的研究和推介，致力于打造科技人才、科技类社会组织、科技成果展示、成果转化的交流平台。科技集市的发展目标是成为华南区域具有一定影响力的科技成果交易中心。</p>','1','80','news','1390405980','1394445286');
INSERT INTO `post` (`id`,`category_id`,`model`,`title`,`alias`,`image_name`,`file_name`,`tinyint1`,`int10`,`char32`,`varchar30`,`varchar50`,`varchar100`,`varchar128`,`content`,`status`,`weight`,`view`,`created_at`,`updated_at`) VALUES
('52','10','news','“凝聚智慧•畅想2014”博士、专家、秘书长新春联谊会','d5866dcdfadf2ed655bb9bbb69e2309d','7eaa5bc70c9b11d17242e93759f32629.jpg','','0','0','','','','','    为了更好地凝聚博士、专家智慧，为博士、专家服务社会提供更完善的服务体系，广东博士俱乐部、广东健康产业促进会、广州市科技类社会组织服务中心于2014年1月18日在广东博士俱乐部联合举办“凝聚智慧...','<p>    为了更好地凝聚博士、专家智慧，为博士、专家服务社会提供更完善的服务体系，广东博士俱乐部、广东健康产业促进会、广州市科技类社会组织服务中心于2014年1月18日在广东博士俱乐部联合举办“凝聚智慧•畅想2014”博士、专家、秘书长新春联谊会。近百名博士会员、专家、协会会长、秘书长代表欢聚一堂，共同畅想2014。</p><p style=\"text-align: center; \"><img src=\"/upload/images/7eaa5bc70c9b11d17242e93759f32629.jpg\"></p><p style=\"text-align: center; \"></p><p style=\"text-align: center; \">博士们在寄语</p><p>    集团总裁<st1>冯德平先生在联谊会上致欢迎辞，他衷心感谢朋友们一直以来对<st1>广东博士俱乐部集团的帮助与支持，在新的一年我们将厚积薄发，将博士服务站这个“桥头堡”深深扎根南粤大地，为博士、专家服务社会提供更加广阔的前沿阵地，为区域、行业、企业提供人才、科技、健康、文化、生态等服务。</st1></st1></p><p>    与会博士、医学专家和会长秘书长分别与<st1>广东博士俱乐部、广东健康产业促进会、广州市科技类社会组织孵化培育基负责人进行了深入的探讨和沟通，并就2014年的共同发展积极建言献策。</st1></p><p>    联谊会上节目精彩纷呈：中华传统文化促进会的一曲《高山流水》古筝弹奏，赢得了满场的知音赞赏；<st1>李奇林教授的书法表演，磅礴大气；<st1>叶邦彦博士的钢琴伴奏表演，精彩绝伦；健促会精彩的独舞表演等赢得了观众的阵阵喝彩……</st1></st1></p><p><st1><st1>    </st1></st1>“凝聚智慧·畅想<st1>2014”博士、专家、秘书长新春联谊会在热烈、融和的气氛中圆满谢幕！</st1></p><p><img src=\"/upload/images/27817af3bacea7db3cc3a9c6ac080630.jpg\"></p><p style=\"text-align: center; \"><st1>广东博士俱<st1>乐部博士座谈会现场</st1></st1></p><p style=\"text-align: center; \"><st1><st1><br></st1></st1></p><p><img src=\"/upload/images/e8a39468ccfbe81bc3dbd32f69104d9d.jpg\"></p><p style=\"text-align: center; \"></p><p>广东健康产业促进会医学专家座谈会现场</p><p><img src=\"/upload/images/d3e0430855271c104a13142b1f465046.jpg\"></p><p>广州市科技类社会组织孵化培育基地秘书长座谈会</p><p><img src=\"/upload/images/6a08cdef483b7e1ff6693e5a16975657.jpg\"></p><p style=\"text-align: center; \"></p><p>精彩纷呈的博士、专家、秘书长联谊会</p>','5','84','news','1390717418','1394416138');
INSERT INTO `post` (`id`,`category_id`,`model`,`title`,`alias`,`image_name`,`file_name`,`tinyint1`,`int10`,`char32`,`varchar30`,`varchar50`,`varchar100`,`varchar128`,`content`,`status`,`weight`,`view`,`created_at`,`updated_at`) VALUES
('53','28','build','合作伙伴','partner','','','0','0','','','','','
	广东科技报


	广东省民防协会


	广东省澄宇生态伦理研究院


	华南理工大学网络教育学院


	花都海豚俱乐部


	广东侨界人文协会


	广东捷迅...','<p>
	<strong>广东科技报</strong>
</p>
<p>
	<strong>广东省民防协会</strong>
</p>
<p>
	<strong>广东省澄宇生态伦理研究院</strong>
</p>
<p>
	<strong>华南理工大学网络教育学院</strong>
</p>
<p>
	<strong>花都海豚俱乐部</strong>
</p>
<p>
	<strong>广东侨界人文协会</strong>
</p>
<p>
	<strong>广东捷迅职业培训学院</strong>
</p>
<p>
	<strong>广东省低碳产业协会</strong>
</p>
<p>
	<strong>广东省茂名商会</strong>
</p>
<p>
	<strong>珠江电视台</strong>
</p>
<p>
	<strong>广州翻译协会</strong>
</p>
<p>
	<strong>广州市德永会计师事务所</strong>
</p>
<p>
	<strong>广州市公永税务师事务所</strong>
</p>
<p>
	<strong>广州市东诚资产评估有限公司</strong>
</p>','1','100','news','1391753657','1394174534');
INSERT INTO `post` (`id`,`category_id`,`model`,`title`,`alias`,`image_name`,`file_name`,`tinyint1`,`int10`,`char32`,`varchar30`,`varchar50`,`varchar100`,`varchar128`,`content`,`status`,`weight`,`view`,`created_at`,`updated_at`) VALUES
('54','10','news','热烈庆祝佛冈人才驿站—长盛谷基地正式挂牌成立','e26f41eabf3b11bbe652a1edcf240cc5','b508d6376d0392d2914f7a6cefb17971.jpg','','0','0','','','','','       2014年1月21日，佛冈人才驿站---长盛谷基地举行了挂牌仪式。佛冈县委常委、组织部部长石尚明、汤塘镇书记叶军强、长盛谷基地总经理周钊平、集团总裁助理、秘书长赵根文以及佛冈县各大企业代...','<p>       2014年1月21日，佛冈人才驿站---长盛谷基地举行了挂牌仪式。佛冈县委常委、组织部部长石尚明、汤塘镇书记叶军强、长盛谷基地总经理周钊平、集团总裁助理、秘书长赵根文以及佛冈县各大企业代表出席了揭牌仪式。</p><p style=\"text-align: center; \">
	</p><p style=\"text-align: center; \">
		<img src=\"/upload/images/b508d6376d0392d2914f7a6cefb17971.jpg\">
	</p><p style=\"text-align: center; \">
			佛冈县委常委、组织部部长石尚明致辞
		</p><p>       佛冈县委常委、组织部部长石尚明在揭牌仪式上致辞。石部长表示，佛冈此次选择在广东博士长盛谷温泉养生基地建立人才驿站,是为了更好地凝聚人才、服务人才、对接企业、推动发展。充分依托广东博士俱乐部凝聚的国内外博士、院士会员的智力优势,围绕佛冈县重点产业发展、重点工程和项目建设,为引进各类型人才提供人才服务、党建指导、交流培训等方面提供便利。
			</p><p>       长盛谷人才驿站主要结合佛冈实际情况，重点接纳空调制冷(机械制造)、电子化工、食品饮料、节能材料、生态旅游五大支柱产业的科技领军型人才。开展科技领导型人才、企业管理人才和紧缺适用人才的引进、培养、进驻企业进行挂职锻炼(提供技术指导)、与企业对接和人才座谈交流等服务。</p><p>       与佛冈县共建人才驿站，是集团在人才服务方面的创新探索，<st1>广东博士俱乐部集团将与佛冈县组织部共同努力,把佛冈县人才驿站——长盛谷基地建设成为清远乃至粤东北山区服务人才的新场所，为佛冈县的经济发展和产业升级转型发挥积极的作用。</st1></p><p style=\"text-align: center; \">
</p><p style=\"text-align: center; \"><img src=\"/upload/images/09a69e31e20430c53975905890088596.jpg\"></p><p style=\"text-align: center; \">石尚明部长、汤塘镇叶军强书记为人才驿站揭牌</p><p style=\"text-align: center; \"><img src=\"/upload/images/38542b7703f18e164aa56e7c170351de.jpg\"></p>','1','100','news','1392018462','1392018672');
INSERT INTO `post` (`id`,`category_id`,`model`,`title`,`alias`,`image_name`,`file_name`,`tinyint1`,`int10`,`char32`,`varchar30`,`varchar50`,`varchar100`,`varchar128`,`content`,`status`,`weight`,`view`,`created_at`,`updated_at`) VALUES
('55','18','project','健康服务','dd15a3395e1337d3995059dd400b476b','b30a40490c8def37bddf68e6b791d62f.jpg','','0','0','','','','','（一）健康教育健康教育由博士、专家团队通过健康咨询或健康沙龙等方式为会员传播专业的健康知识。（二）健康评估健康评估是由生活方式评估、体质情况评估及疾病风险评估三部分组成。生活方式评估：通过对会员生活方...','<p><strong><span   style=\"font-size: 16px; \">（一）健康教育</span></strong></p><p><span   style=\"font-size: 16px; \">健康教育由博士、专家团队通过健康咨询或健康沙龙等方式为会员传播专业的健康知识。</span></p><p><strong><span   style=\"font-size: 16px; \">（二）健康评估</span></strong></p><p><span   style=\"font-size: 16px; \">健康评估是由生活方式评估、体质情况评估及疾病风险评估三部分组成。</span></p><p><span   style=\"font-size: 16px; \">生活方式评估：通过对会员生活方式的评估，出具初级报告（生活方式对照表）。</span></p><p><span   style=\"font-size: 16px; \">体质情况评估：通过对会员体质情况的评估，出具初级报告（体质情况分析表）。</span></p><p><span   style=\"font-size: 16px; \">疾病风险评估：通过对会员既往病史、家族病史等的评估，出具疾病风险报告（风险评估表）。</span></p><p><strong><span   style=\"font-size: 16px; \">（三）健康干预</span></strong></p><p><span   style=\"font-size: 16px; \">健康干预是通过生活方式干预、营养膳食干预及根据会员体质情况所进行的其他干预形式。</span></p><p><span   style=\"font-size: 16px; \">生活方式干预：由博士、专家团队根据会员个体情况制定健康生活干预方案，指导会员形成健康的生活方式。</span></p><p><span   style=\"font-size: 16px; \">营养膳食干预：由博士、专家团队制定个性化的膳食方案，指导会员平衡膳食。</span></p>','10','91','news','1392191498','1394679719');
INSERT INTO `post` (`id`,`category_id`,`model`,`title`,`alias`,`image_name`,`file_name`,`tinyint1`,`int10`,`char32`,`varchar30`,`varchar50`,`varchar100`,`varchar128`,`content`,`status`,`weight`,`view`,`created_at`,`updated_at`) VALUES
('56','7','job','拓展部专员','dbe8a523fd71affd0da38ed405581bcc','','','0','2','','1年','21-35岁','面议','本科','<p>任职要求：</p><p>1、形象好，气质佳，沟通能力强，善于与政府、企业打交道；</p><p>2、市场营销、网络营销、企业管理等相关专业；</p><p>3、在开拓客户方面有一定经验的优先；</p><p>4、擅长撰写商业文案；</p><p>5、有独立工作能力，在分管工作范围内有独立的见解和措施。</p><p>工作职责：</p><p>1、协助企业运营管理执行；</p><p>2、协助商务项目执行及商业拓展；</p><p>3、协助主导市场调研和行业分析，提供可行性分析报告；</p><p>4、参与起草商务策划方案；</p><p>5、协助上级完成部门的日常工作。</p>','1','101','job','1392196132','1392196149');
INSERT INTO `post` (`id`,`category_id`,`model`,`title`,`alias`,`image_name`,`file_name`,`tinyint1`,`int10`,`char32`,`varchar30`,`varchar50`,`varchar100`,`varchar128`,`content`,`status`,`weight`,`view`,`created_at`,`updated_at`) VALUES
('57','0','single','人才驿站','yq','','','0','0','','','','','人才驿站','<p><span  style=\"font-size: 16px; \">人才驿站是广东博士俱乐部有限公司响应省人社厅《广东省专业技术人才队伍建设中长期规划(2011-2020年)》关于“进一步加强专业技术人才队伍建设”的指导精神，依托广东博士俱乐部有限公司庞大的博士专家队伍，整合高校、科研院所、社会团体等资源，为企业量身打造的基础人才培养计划。</span></p><p><span  style=\"font-size: 16px; \">人才驿站根据企业的实际需求提供了三种层次的服务方案，分别为共建教学点、共建教学中心和共建教学分校。开展人才驿站的意义体现在以下几个方面：可快速填补企业内部的技术性人才空缺，实现企业低成本高效率育才；可帮助企业通过“育人”实现“留人”，降低员工流失率，减轻人力资源部分招聘负担；邀请企业高管共同参与教学，人才驿站与企业携手共建“校园式企业”，传播企业文化，增强企业人才吸引力和凝聚力，为企业的转型升级提供人才保障！<br></span></p><p>
	<span  style=\"font-size: 16px; \"><br>
	</span></p><p><strong><span  style=\"font-size: 18px; \">人才驿站服务内容:</span></strong></p><p>
	<span  style=\"font-size: 16px; \"><strong>一、在职学历教育</strong></span></p><p>
	<span  style=\"font-size: 16px; \">1、在职网络大专、本科学历教育</span></p><p>
	<span  style=\"font-size: 16px; \">2、单证在职研究生（工程硕士GCT）</span></p><p>
	<span  style=\"font-size: 16px; \">3、双证在职研究生（工商管理硕士MBA）</span></p><p>
	<span  style=\"font-size: 16px; \"><strong>二、“3+3双元制”人才输送服务</strong></span></p><p>
	<span  style=\"font-size: 16px; \">1、实习生托管：学生顶岗实习</span></p><p>
	<span  style=\"font-size: 16px; \">2、毕业生输送：毕业生定向输送</span></p><p>
	<span  style=\"font-size: 16px; \">3、校企合作办学：企业定制化人才培养</span></p><p>
	<span  style=\"font-size: 16px; \"><strong>三、国家职业资格证培训</strong></span></p><p>
	<span  style=\"font-size: 16px; \">开设专业：人力资源管理师、企业培训师、心理咨询师、公共营养师、注册物业管理师、物业企业经理人证、物理管理师、模具设计与制造、电工、焊工、钳工等</span></p>','1','100','single','1393312597','1393830789');
INSERT INTO `post` (`id`,`category_id`,`model`,`title`,`alias`,`image_name`,`file_name`,`tinyint1`,`int10`,`char32`,`varchar30`,`varchar50`,`varchar100`,`varchar128`,`content`,`status`,`weight`,`view`,`created_at`,`updated_at`) VALUES
('58','15','news','人防工程博士科技沙龙','7bab15f95b7e527391e1680860bfa99d','','','0','0','','','','','为了更好地服务我省人防工程设备生产企业，2014年，广东博士俱乐部将联合广东省民防协会，在我省人防工程设备生产企业建立23个博士科技服务站，为企业提供科技咨询、科技攻关、科技培训、成果转化、学术研讨等...','<p>为了更好地服务我省人防工程设备生产企业，2014年，广东博士俱乐部将联合广东省民防协会，在我省人防工程设备生产企业建立23个博士科技服务站，为企业提供科技咨询、科技攻关、科技培训、成果转化、学术研讨等科技服务。</p><p>广东博士俱乐部结合省人防工程设备生产企业的行业特点和科技需求，将组建焊接技术、生产自动化、高效管理等领域的博士服务团队，诚邀有志于服务我省民防事业的博士出席人防工程博士科技沙龙。</p><p>特此函请！</p><p><strong>时间：</strong>2014年2月26日（周三）15:00—17:00</p><p><strong>地点：广东博士俱乐部（</strong>越秀区环市中路205号恒生大厦B座13楼）</p><p><strong>沙龙主要议程：</strong></p><p>1、博士科技服务站介绍。</p><p>2、广东省人防工程设备企业的技术现状及需求研讨。</p><p>3、博士服务团队的服务内容和服务模式探讨。</p>','1','99','news','1393316525','0');
INSERT INTO `post` (`id`,`category_id`,`model`,`title`,`alias`,`image_name`,`file_name`,`tinyint1`,`int10`,`char32`,`varchar30`,`varchar50`,`varchar100`,`varchar128`,`content`,`status`,`weight`,`view`,`created_at`,`updated_at`) VALUES
('59','9','download','孵化培育基地入会申请表','d11cac2c30d318baeff237393fcf4977','','孵化培育基地入会申请表.doc','0','0','','','','','孵化培育基地入会申请表','','1','100','download','1393320400','1393470617');
INSERT INTO `post` (`id`,`category_id`,`model`,`title`,`alias`,`image_name`,`file_name`,`tinyint1`,`int10`,`char32`,`varchar30`,`varchar50`,`varchar100`,`varchar128`,`content`,`status`,`weight`,`view`,`created_at`,`updated_at`) VALUES
('60','10','news','人防工程博士科技沙龙顺利举行','0aa54b55b3dd5eb3ca69f3238f8f6378','8464a40df06457b62540d9a2f683aba9.jpg','','0','0','','','','','    人防工程博士科技沙龙于2014年2月26日下午15时在广东博士俱乐部举行，省民防协会唐甸华会长、人防、焊接、自动化及经济管理等专业领域的博士、专家：徐宏佳、周业基、杨永强、皮佑国、汤清、周松斌...','<p>    人防工程博士科技沙龙于2014年2月26日下午15时在广东博士俱乐部举行，省民防协会唐甸华会长、人防、焊接、自动化及经济管理等专业领域的博士、专家：徐宏佳、周业基、杨永强、皮佑国、汤清、周松斌、梅其岳等出席了本次沙龙。</p><p>    本次沙龙主要目的在于召集相关领域博士、专家，结合省二十多个人防工程防护设备生产企业行业特点和科技需求，共同探讨博士服务与企业科技创新等相关问题。2014年，广东博士俱乐部将联合广东省民防协会，在我省人防工程设备生产企业建立二十多个博士科技服务站，为企业提供科技咨询、科技攻关、科技培训、成果转化、学术研讨等科技服务。</p><p>    会上，广东博士俱乐部科技服务中心黄跃副总经理对人防行业博士服务站作了详细介绍，并组织博士、专家们根据省人防工程防护设备企业的技术现状及需求，对博士科技服务站博士服务内容和服务模式进行探讨。</p><p>    省民防协会唐甸华会长在会上耐心解答了博士、专家们对省民防协会及民防行业博士科技服务站设站相关问题，并呼吁在座的各位博士专家能够为博士科技服务站的建设建言献策。</p><p>    广东省流体机械学会理事长、原广东省机械研究所党委书记徐宏佳，人防行业博士梅其岳、广州日松工业集团顾问周业基、广州市仪器仪表学会秘书长周松斌、华南理工大学杨永强教授、皮佑国教授、汤清教授等围绕会议议题展开智慧碰撞。</p><p>    会议最后，由唐甸华会长对会议进行总结，希望今后能继续组织类似的沙龙学术会议，并将组织一次实地考察，让各位博士、专家更加清楚了解人防设备厂现况，达成一致共识，更好地通过民防博士科技服务站为协会二十多个人防工程防护设备企业开展科技服务。</p>','5','85','news','1393490469','1393490953');
INSERT INTO `post` (`id`,`category_id`,`model`,`title`,`alias`,`image_name`,`file_name`,`tinyint1`,`int10`,`char32`,`varchar30`,`varchar50`,`varchar100`,`varchar128`,`content`,`status`,`weight`,`view`,`created_at`,`updated_at`) VALUES
('61','29','phd','周永章博士','ffffd926133ba99dd322a0eca5126758','cd215b2000846e5cc910698f7f41b5b5.jpg','','0','0','','','','','    周永章，1963年生，广西博白人。教授、博士生导师，中山大学地球环境与地球资源研究中心主任，广东省地质过程与矿产资源探查重点实验室主任，广东省政府决策咨询顾问委员会委员，广东省政协常委。1、教...','<p style=\"text-align: center; \"></p><p><img src=\"/upload/images/cd215b2000846e5cc910698f7f41b5b5.jpg\" alt=\"\"></p><p>    周永章，1963年生，广西博白人。教授、博士生导师，中山大学地球环境与地球资源研究中心主任，广东省地质过程与矿产资源探查重点实验室主任，广东省政府决策咨询顾问委员会委员，广东省政协常委。</p><p><strong>1、教育背景</strong></p><p>1978年，考入中山大学。</p><p>1982年，获中山大学学士学位</p><p>1987年，获中国科学院地球化学研究所硕士学位。</p><p>1992年，获加拿大Quebec大学博士学位。</p><p><strong>2、工作经历</strong></p><p>1993年起，任中国科学院广州地球化学研究所研究员。</p><p>1995年起，任中国科学院广州地球化学研究所矿床地球化学研究室副主任。</p><p>1996年，任美国Stanford大学客座教授。</p><p>1999年，调任中山大学教授、博士生导师。</p><p>2000年起，历任中山大学科技处副处长、地球科学系主任。</p><p>2003年，任中山大学地球环境与地球资源研究中心主任。</p><p>2004年，任香港大学地球科学系高级访问学者。</p><p>2009年，任广东省地质过程与矿产资源探查重点实验室主任。</p><p>目前兼任国际数学地球科学协会中国国家委员会主席，中国矿物岩石地球化学学会理事，中国可持续发展研究会理事，中国地质学会数学地质与地学信息专业委员会副主任，广东省矿物岩石地球化学学会副理事长，广东省环境经济与政策研究会副理事长，广州城市可持续发展研究会理事长，国家可持续发展实验区专家委员会委员，广东省政府决策咨询顾问委员会委员，广东省政协常委，九三学社广东省委常委兼参政议政委员会主任，九三学社中山大学南校区支社主委。</p><p><strong>3、主要研究专长</strong></p><p>环境地学与环境健康，资源地学，资源环境经济学，区域可持续发展。</p><p><strong>4、成果与荣誉</strong></p><p>出版专（合）著6部，主编学术文集4部，在国内外重要学术刊物上发表论文200多篇。</p><p>获中国地质学会银锤奖（1993）、中国矿物岩石地球化学学会侯德封奖（1994）、中国科学院院长特别奖励（1995）、国际数学地质学会主席奖提名奖（1995）、“广东省青年科技标兵”称号（1997）、广东省科技进步奖一、二等奖（2005；2009）、国家自然科学奖二等奖（参加，2005），入选国家教育部青年骨干教师资助计划（2000）、广东高校“千百十”人才工程（2002）、全国高等学校优秀青年教师资助计划（2001；2004年整合为新世纪优秀人才支持计划），获王宽诚基金会（香港）（1995-1996）、岭南基金会（美国）（2004）出国进修支持。</p><p><strong>5、教授课程</strong></p><p>《地球化学》（本科生）；</p><p>《环境地球化学》，《地质数学研究案列分析》，《广东地质》，《地球资源与地球环境》，《自然资源与环境经济学》，《区域可持续发展》（研究生）。</p><p>自1993年开始招收研究生以来，先后招收和指导博士、硕士研究生100多人。培养毕业的研究生中，不乏成为教授或所在行业的中坚力量。</p><p><strong>6、承担科研项目</strong></p><p>先后承担国家重大基础研究（973项目）专题、国家自然科学基金、国土资源部地质调查项目、中国科学院重点项目、教育部优秀青年教师基金、广东省科技攻关、教育部哲学社会科学研究重大课题攻关项目、广东省重大决策咨询研究项目、广东省哲学社会科学规划项目等60多项课题研究。</p><p>承担的代表性科研项目</p><p>●社会科学项目:</p><p>珠江河口区人口资源经济环境协调发展研究（国家水利部《珠江河口整治规划》项目专题)；</p><p>珠江三角洲地区资源节约与环境保护研究（广东省委宣传部、广东社会科学规划重点项目）；</p><p>建设珠江三角洲区域和城市优质生活圈的研究（中山大学985-II期实施《珠江三角洲地区改革发展规划纲要（2008－2020年》重点项目）；</p><p>节能减排与环境保护法律法规与其他法律法规的衔接、整合（教育部哲学社会科学研究重大课题攻关项目专题）；</p><p>广东省可持续发展实验区发展模式、途径与对策研究；</p><p>改革开放30年广东科技发展轨迹与模式研究（广东省科技计划软科学项目）；</p><p>节约型社会指标体系与评价方法研究（广东省重大决策咨询研究课题）；</p><p>创新之路——广东科技创新发展30年（广东省哲学社会科学“十一五”规划特别委托项目）；</p><p>广东发展低碳经济研究（广东省高校重大攻关课题招标项目）。</p><p>●地球环境研究项目：</p><p>珠江三角洲肝癌－鼻咽癌高发区生态地球化学环境与人群健康调查研究；</p><p>珠江三角洲经济区农业地质与生态地球化学环境预警预测（国土资源部生态地球化学调查专项）；</p><p>若干重要非平衡体系地球化学问题初步研究（中国科学院院长特别基金）；</p><p>粤西河台金矿床矿山清洁生产示范研究；</p><p>热湿地区含硫化物矿山环境地球化学效应与矿山清洁生产技术研究；</p><p>广东大宝山矿山地区生态环境系统治理关键技术开发与示范（广东省科技厅科技攻关项目）；</p><p>矿山污染生态修复理论与技术研究（广东省自然科学基金研究团队项目）。</p><p>● 地球资源研究项目：</p><p>钦杭成矿带庞西垌地区矿产资源远景调查（中国地质调查局重大专项）；</p><p>藏南伸展与拆离系统贵金属和稀有金属成矿作用；</p><p>西秦岭造山带硅质岩及富SiO2流体演化与成矿作用；</p><p>粤西超大型矿床形成的地质背景；</p><p>古海洋热水流体沉积体系及其演化（国家重点基础研究发展计划专题）；</p><p>云开地区元古宙晚期热水沉积作用；</p><p>华南三层位硅岩建造地球化学多样性深度分析；</p><p>藏南中新生代硅质岩微组构信息提取及应用于含SiO2流体沉积体系研究（国家自然科学基金项目）；</p><p>古海洋热水沉积及其金属成矿作用（中国科学院重点项目）；</p><p>热水沉积硅岩地球化学与古海洋流体地质作用示踪（教育部优秀青年教师资助计划）；</p><p>华南低温热水沉积建造的地球化学及成矿作用；</p><p>印－亚大陆碰撞带南段中新生代硅质岩沉积建造研究（全国高等学校博士学科专项科研基金）。</p><p><strong>7、跨学科视野</strong></p><p>跨学科视野是周永章的重要个人特质。他是LEAD班成员，是SSRC健康、环境与发展论坛指导委员会核心专家。他认为，许多社会需求是一个大的综合研究领域，它不专属于哪个学科，更不是单一学科可以解决的。比如全球的资源环境问题，它需要多学科协同攻关。作为一个有抱负的学者，应该把自己的专业放在资源环境领域这个大视野、大平台来考量。这促使他进而涉猎区域可持续发展及资源环境经济学等跨学科问题。有了这些亟待解决的现实社会需求，他不断从自己的领域出发，延伸到其它领域形成跨学科背景的综合优势。</p><p>作为广东省政协常务委员、广东省政府决策咨询顾问委员会委员、九三学社广东省委参政议政委员会主任，他充分利用了解广东省情和区域发展的有利条件，立足自己的学术专长，向周边学科渗透、交叉、融合。承担了一批教育部哲学社会科学研究重大课题攻关项目、广东省重大决策咨询研究项目、广东省哲学社会科学规划项目、广东省科技计划项目（软科学）等科研课题。</p><p>他应邀担任联合国开发计划署中国发展和新闻传播高层研讨会主旨演讲人，为中山大学香港特别行政区政府行政官员培训班讲授中国国情，为广东省厅级干部和广州市局级干部授课，应邀担任《岭南大讲坛》、《羊城学堂》、《中山大学中外优秀文化讲座》主讲嘉宾。他提出的“让经济与环境由仇家变亲家”等观点，被列入国家公务员录用考试《申论》全真模拟试卷。</p><p>目前，他在中山大学跨文、理科，在三个不同学科招收和指导研究生：地球化学（矿产资源与环境地球化学方向）；自然地理（资源环境一体化与可持续发展方向）；人口、资源与环境经济学。</p>','5','95','news','1393812989','1393999819');
INSERT INTO `post` (`id`,`category_id`,`model`,`title`,`alias`,`image_name`,`file_name`,`tinyint1`,`int10`,`char32`,`varchar30`,`varchar50`,`varchar100`,`varchar128`,`content`,`status`,`weight`,`view`,`created_at`,`updated_at`) VALUES
('62','29','phd','安关峰博士','4649952f2512c535eb3021ea07507cae','7f2ad9653a6379c1f503efe087d05987.jpg','','0','0','','','','','广州市市政集团有限公司副总经理、总工程师广州市市政工程技术研究院院长广东省民防协会专家委员会主任广东省政协委员2006年被评为广州市、广东省劳动模范；  2007年获得全国五一劳动奖章；  获2008...','<p style=\"text-align: center; \"></p><p><img src=\"/upload/images/7f2ad9653a6379c1f503efe087d05987.jpg\" alt=\"\"></p><p>广州市市政集团有限公司副总经理、总工程师</p><p>广州市市政工程技术研究院院长</p><p>广东省民防协会专家委员会主任</p><p>广东省政协委员</p><p>2006年被评为广州市、广东省劳动模范；</p><p>  2007年获得全国五一劳动奖章；</p><p>  获2008年度广东省优秀共产党员；</p><p>  当选广州市第八届党代会、广东省第九届党代会代表；</p><p>  第十一届广州十佳青年等荣誉称号。</p><p> 在《岩土工程学报》、《岩土力学与工程学报》等国家一级核心期刊上 发表论文40余篇，提出的观点和技术论证在工程实践中得到广泛的应用。</p>','5','90','news','1393817639','1393999804');
INSERT INTO `post` (`id`,`category_id`,`model`,`title`,`alias`,`image_name`,`file_name`,`tinyint1`,`int10`,`char32`,`varchar30`,`varchar50`,`varchar100`,`varchar128`,`content`,`status`,`weight`,`view`,`created_at`,`updated_at`) VALUES
('63','29','phd','李飏博士','645f71607d2c4f727f4105bc67b3d98d','4c9489cc68dc883259b9f0eb494a442d.jpg','','0','0','','','','','李 飏，女，湖北人，任职广东省社会科学院研究方向：可持续发展，绿色低碳发展，现代化理论与实践，人的现代化与青少年妇女发展。1、教育背景2005-2010，中山大学地理科学与规划学院博士。2、科研经历1...','<p style=\"text-align: center; \"></p><p><img src=\"/upload/images/4c9489cc68dc883259b9f0eb494a442d.jpg\" alt=\"\"></p><p>李 飏，女，湖北人，任职广东省社会科学院</p><p>研究方向：可持续发展，绿色低碳发展，现代化理论与实践，人的现代化与青少年妇女发展。</p><p><strong>1、教育背景</strong></p><p>2005-2010，中山大学地理科学与规划学院博士。</p><p><strong>2、科研经历</strong></p><p>1998-2002，广州市社会科学院助理研究员</p><p>2002以来，广东省社会科学院副研究员、研究员，现任广东省社会科学院现代化发展战略研究所副所长、青少年成长教育研究中心副主任，兼任广东省开发区研究会副会长、广东省社会学学会副秘书长、广东省文化学会副秘书长，中山大学地球环境与地球资源研究中心客座研究员。</p><p><strong>3、研究方向</strong></p><p>可持续发展，绿色低碳发展，现代化理论与实践，人的现代化与青少年妇女发展。</p><p><strong>4、成果</strong></p><p>承担国家、省、市各级政府咨询与决策研究课题30余项。。</p><p>参与南海、顺德、佛山、三水财政预算绩效评价</p><p>作为广东省科技咨询专家多次参与省、市科技重大项目的评审。</p><p>2005年被中国计生协评为国际合作项目奉献奖。</p><p>发表学术论文30多篇。</p><p><strong>5、论著</strong></p><p>李飏著，构建现代产业体系的路径选择——广东现代产业体系及其支撑要素互动关系研究，中国社会科学出版社，2008</p><p>1.李飏，文化经济跨越增长的极限，全国中文核心期刊、教育部高校哲学社会科学名刊工程首批入期刊《思想战线》（教育部认定的十大名刊）2007.1，被收录于人大复印资料《文化研究》2007.7（首批入选教育部高校哲学社会科学十大名刊）</p><p>2.李飏，珠江流域“西电东送”能源地理空间配置的综合效应评估，全国中文核心期刊《中国人口?资源与环境》2008.3</p><p>3.李飏，珠江流域“西电东送”跨区域能源合作的动力机制研究，全国科技核心期刊《热带地理》，2008.4</p><p>4.李飏，基于可持续发展的绿色广东制度建设的动力机制，全国科技核心期刊《热带地理》2007.3</p><p>5.李飏，建设政府推动与市场机制相结合的生态省，《决策与信息》，2005.7</p><p>6.李飏，绿色广东建设的动力机制研究，《中国可持续发展》，2007.1</p><p>7.周永章、陈杰、李飏、刘刘，节约型社会指标体系框架设计与广东节约水平现状评价，全国中文核心期刊《中国人口?资源与环境》，2006.4</p><p>8.周永章、李飏，节约型社会指标体系与其对广东建设节约型社会的导向，《可持续发展通报》，2006.3</p><p>9.周永章、李飏，节约型社会指标体系对广东经济社会发展的导向，载于《广东经济蓝皮书》，2006年</p><p>10.李飏, HIV/AIDS的流行进程中的社会性别意识，全国经济类核心期刊《统计与决策》, 2005.5</p><p>11.李飏，当前青少年面临的“性危机” 及青春期性教育误区， 全国中文核心期刊《求实》， 2004.11</p><p>12.李飏， “青春健康”国际合作项目同伴教育效果评估，《江西行政学院学报》(增刊)， 2004.11</p><p>13.李飏，遏制AIDS女性应更受关注，《亚太经济时报》，2005.6.24</p><p>14.龙秋霞、陈青山、张海梅、周菊、李宁、李飏，艾滋病防控体系的宣传效益分析，全国中文核心期刊《学术研究》，2007.10</p><p>15.梁桂全，李飏，制度创新——建设绿色广东的关键，《羊城晚报》，2005.8.24</p><p><strong>6、决策研究课题</strong></p><p>1.主持规划课题：2008年度广州市哲学社会科学发展“十一五”规划课题《着力建设广州宜居城市研究》（08Y29），2008—2009，负责人。</p><p>2.主持基金项目：广东省科技厅软科学项目《珠江流域“西电东送”能源地理空间配置的环境效应研究 》（2007B070900061），2007—2008，负责人。</p><p>3.主持广州市哲学社会科学‘十一五’规划2006年度课题《资源型城市可持续发展研究》（06—YZ10—22），2006—2007，负责人。</p><p>4.主持广州市社科联第七次资助规划课题：青少年性教育效果评估。2004—2005，负责人。</p><p>5.主持首届全国经济普查课题《广东省第二、三产业就业态势与现代化适应度研究》，2006—2008，负责人。</p><p>6.主持“科技进步、资本、人力资本对经济增长的因素分析”课题研究、天河科技园（国家级）委托课题（1999—2000）。</p><p>7.主持“软件产业对经济社会渗透拉动的研究”， 天河科技园（国家级）委托课题（2004—2005）。</p><p>8.国家高技术研究发展计划（863计划）“广州市新能源汽车区域化运行考核与应用技术研究”课题子课题“城市推广清洁替代能源LPG的组织协调机制研究”负责人（2006—2009）</p>','5','97','news','1393818231','1393999830');
INSERT INTO `post` (`id`,`category_id`,`model`,`title`,`alias`,`image_name`,`file_name`,`tinyint1`,`int10`,`char32`,`varchar30`,`varchar50`,`varchar100`,`varchar128`,`content`,`status`,`weight`,`view`,`created_at`,`updated_at`) VALUES
('64','0','single','广州市科技类社会组织服务中心','shjz','','','0','0','','','','','广州市科技类社会组织服务中心','<p>   <strong> 广州市科技类社会组织服务中心</strong>是在广州市科学技术协会的指导下、由广东博士俱乐部运营管理的民办非企业单位，主要目的是服务于有发展潜力或在发展过程中遇到瓶颈的科技组织，建立行业内外的沟通平台和纽带，达成行业共识、建立科技产业的行业标准，由点到面带动科技产业的发展，为广州市科技类社会组织提供全方位的创新服务。</p><p>    广州市科技类社会组织服务中心将坚持立足科技组织、服务科技组织的管理理念，以提高科技类社会组织运作能力，提升科技社会组织自我发展能力为己任，为促进社会经济可持续发展贡献应有的力量！</p><p>   <strong> 服务宗旨： </strong>整合政府、社会、人才资源；提供专业、高效的综合服务；规范科技类社会组织的行业标准；推动科技类社会组织的健康发展 。</p><p>    <strong>服务内容主要包括：</strong></p><p>1、协助协会、学会注册、代办各种报批手续，提供日常办公服务；</p><p>2、协助课题或项目申报工作：代办各种科技项目立项申报手续和高新技术企业认定申报手续，代办各种科技项目立项申报手续和高新技术企业认定申报手续；</p><p>3、为协会、学会提供管理咨询服务，协助协会、学会制定合理的社会服务内容；</p><p>4、为学会管理人员提供在职培训和继续教育服务；</p><p>5、组织科研开发和学术研究以及对成果的推广、联系科技贷款担保机构，帮助科研项目拓宽融资渠道；</p><p>6、组织开展理论研究和技术普及、为协会提供技术与市场信息、政策与法律等咨询；</p><p>7、组织国内外的学术交流、研讨、论坛等相关学术活动；</p><p>8、通过各种大众活动，普及和推广科学知识；</p><p>9、充分发挥枢纽型社会组织职能、承接政府职能转移；</p><p>10、配合相关职能部门做好在社区服务产业的调研，逐步建立健全完整的数据库，协助制定行业协会准则，供本产业相关管理部门决策参考等。</p>','1','100','single','1393831527','1393831619');
INSERT INTO `post` (`id`,`category_id`,`model`,`title`,`alias`,`image_name`,`file_name`,`tinyint1`,`int10`,`char32`,`varchar30`,`varchar50`,`varchar100`,`varchar128`,`content`,`status`,`weight`,`view`,`created_at`,`updated_at`) VALUES
('65','29','phd','任生博士','50662e7984dfd74dc712a19374187a1d','5372fa44d11c2059031d4a90ca525ada.jpg','','0','0','','','','','    任生，主任医师，教授，美国纽约州立大学医学博士、中山大学博士后，广州华大生物医学应用技术研究院院长，广东健康产业促进会副会长。中国生物细胞治疗专业技术委员会副主任委员、中国抗癌协会微创治疗专业...','<p style=\"text-align: center; \"></p><p><img src=\"/upload/images/5372fa44d11c2059031d4a90ca525ada.jpg\" alt=\"\"></p><p>    任生，主任医师，教授，美国纽约州立大学医学博士、中山大学博士后，广州华大生物医学应用技术研究院院长，广东健康产业促进会副会长。中国生物细胞治疗专业技术委员会副主任委员、中国抗癌协会微创治疗专业委员会秘书长、广东省健康产业促进协会副会长。</p><p>    擅长应用干细胞治疗肝硬化、肝腹水，具有丰富的临床治疗和研究方面实践经验，在国际上具有较高的学术地位。主要从事生物细胞的基础及临床转化研究，对干细胞治疗肝硬化腹水、Ⅱ型糖尿病、股骨头缺血性坏死、类风湿关节炎、心肌梗塞、器官抗衰老等治疗拥有丰富的临床经验，在干细胞抗衰老研究方面独树一帜。</p>','5','98','news','1393840117','1394416001');
INSERT INTO `post` (`id`,`category_id`,`model`,`title`,`alias`,`image_name`,`file_name`,`tinyint1`,`int10`,`char32`,`varchar30`,`varchar50`,`varchar100`,`varchar128`,`content`,`status`,`weight`,`view`,`created_at`,`updated_at`) VALUES
('66','0','single','会员服务中心','hy','','','0','0','','','','','会员服务中心','<p>
	<span  style=\"font-size: 18px; \">    广东博士俱乐部会员服务中心是广东博士俱乐部有限公司设立的，专为博士会员、专家会员和社会组织会员提供全方位服务的机构。 </span></p><p><span  style=\"font-size: 18px; \">本服务中心秉承\"凝聚会员，服务会员\"的理念，汇聚会员的创新智慧，为会员在区域、行业、企业、社会组织的创新发展提供经营服务，同时为会员提供定制式的人才、科技、健康等专业服务。</span></p><p>
	<strong><span  style=\"font-size: 18px; \">会员服务中心服务内容：</span></strong></p><ul>
	<li><span  style=\"font-size: 18px; \">人才服务：管家服务、创业服务、租赁服务；</span></li>	<li><span  style=\"font-size: 18px; \">科技服务：科技项目服务、知识产权服务、交流合作服务；</span></li>	<li><span  style=\"font-size: 18px; \">健康服务：生理健康服务、心理健康服务、道德健康服务、社会角色健康服务。</span></li></ul>','1','100','single','1394173389','1394443578');
INSERT INTO `post` (`id`,`category_id`,`model`,`title`,`alias`,`image_name`,`file_name`,`tinyint1`,`int10`,`char32`,`varchar30`,`varchar50`,`varchar100`,`varchar128`,`content`,`status`,`weight`,`view`,`created_at`,`updated_at`) VALUES
('67','29','phd','李素华博士','2331c276c08c1ec3f2fdede450822d68','0e38759e39885a5142fd2167e7622683.jpg','','0','0','','','','','李素华，女，安徽亳州市人。博士，教授级高级工程师。1986年毕业于中国科技大学近代力学系流体力学专业。1989年中国科学院武汉岩土力学研究所岩土力学硕士学位。上海同济大学岩土工程专业博士学位。    ...','<p style=\"text-align: center; \"></p><p style=\"text-align: center; \"></p><p style=\"text-align: center; \"></p><p style=\"text-align: center; \">
</p><p style=\"text-align: center; \"><img src=\"/upload/images/0e38759e39885a5142fd2167e7622683.jpg\"></p><p>李素华，女，安徽亳州市人。博士，教授级高级工程师。1986年毕业于中国科技大学近代力学系流体力学专业。1989年中国科学院武汉岩土力学研究所岩土力学硕士学位。上海同济大学岩土工程专业博士学位。</p><p>    广东省执业资格司法鉴定人；先后在广东省建筑科学研究院和省建设工程质量安全监督检测总站从事科研、检测、结构鉴定、检测管理、监督管理、技术管理等、规范编制、科技期刊任主编、为全省建筑行业各类人员进行培训教育、授课等工作。审核批准签发站检测技术报告，对省建设工程质量安全监督检测总站检测技术报告进行把关，保障了检测工作质量。</p><p>    主持或参与10项以上省部级大型科研课题。有多项成果获广东省科学技术成果进步（二、三等）奖；或厅局级科学技术成果进步奖（一、二等）5项；申请发明专利1部；软件著作版权1项；主编和参编行业技术规范4本：。</p><p>    多次赴香港理工大学进行学术访问、交流与合作，主持完成的与同济大学和香港理工大学等的合作科研项目（广东省2004年重大科技计划项目）获2007年度广东省科学技术成果一等奖候选，获2007年度广东省科学技术成果二等奖。省科技厅组织的成果鉴定结论为成果达国际领先水平。</p><p>    在国家级科技刊物《土木工程学报》、《岩石力学与工程学报》等上发表论文40多篇。其中EI等收录多篇。多次在国内大型学术会议上作学术报告。</p><p>    主持横向大型房屋建筑结构质量和安全（司法）鉴定项目十多项；作为项目和技术负责人，完成500多项地基基础工程施工质量的检测和监测任务，主持或参与处理地基基础工程事故10多项；参与评审和大型建设项目咨询10多项。</p><p>     学术或专业团体兼职情况：</p><p>国内外公开刊物《广东工程监督与检测》常务副主编；</p><p>行业科技期刊《建筑监督检测与造价》主编兼编辑部主任；</p><p>核心学术期刊《岩土力学》编委；</p><p>国家开发银行广东省分行顾问专家；</p><p>中国岩石力学与工程学会地下工程分会 常务理事；</p><p>中国工程建设标准化协会建筑鉴定与加固专委会广东分会 常务委员；</p><p>广东省土木建筑学会工程检测专业委员会          常委兼副秘书长；</p><p>东省岩石力学与工程学会测试与检测技术专业委员会常委兼副秘书长</p><p>广东省土木建筑学会建筑物诊治专业委员会        常务委员；</p><p>广东省土木建筑学会地下工程专业委员会         常务委员；</p><p>广东省土木建筑学会地基基础专业委员会         常务委员</p>','5','92','news','1394176516','1394698558');
INSERT INTO `post` (`id`,`category_id`,`model`,`title`,`alias`,`image_name`,`file_name`,`tinyint1`,`int10`,`char32`,`varchar30`,`varchar50`,`varchar100`,`varchar128`,`content`,`status`,`weight`,`view`,`created_at`,`updated_at`) VALUES
('68','20','phd','博士的服装','efb5d8ee65d5eb119e861e6496a02f1e','21beb86c321e88b165a0093505c1bc8b.jpg','','0','0','','','','','    博士服，学生在获得博士学位的典礼上所穿着的礼服。博士服起源于中世纪欧洲教士的服装，因为早期大学中的学者大多是传教士。礼服一般由长袍、方帽、头巾和垂布四个部分组成。    博士学位袍为黑、红两色...','<p style=\"text-align: center; \"></p><p>博士服，学生在获得博士学位的典礼上所穿着的礼服。博士服起源于中世纪欧洲教士的服装，因为早期大学中的学者大多是传教士。礼服一般由长袍、方帽、头巾和垂布四个部分组成。</p><p>    博士学位袍为黑、红两色，喇叭袖，胸前扣子两旁各一道宽<st1>5英寸的天鹅绒贴边，袖子上也横着缝有三道平行的天鹅绒贴边，颜色属黑或别的颜色，它是学科类别的标志。</st1></p><p><st1><br></st1>
</p><p style=\"text-align: center; \"><img src=\"/upload/images/91a660ed56fa2381004104136d2c859c.jpg\"></p><p>    帽子是方形“牛津帽”，各种学位的人都可以戴。帽子左边垂下漂亮的流苏，流苏的颜色表示授予学位所属院系。博士学位流苏为红色。未授予学位时，流苏垂在着装人所戴学位帽右前侧中部；学位授予仪式上，授予学位后，由学位评定委员会主席（或校、院、所长）把流苏从着装人的帽檐右前侧移到左前侧中部，并呈自然下垂状；校（院、所）长、学位评定委员会主席及委员（或导师）及已获学位者，其流苏均垂在所戴学位帽的左前侧中部。</p><p style=\"text-align: center; \"><img src=\"/upload/images/21beb86c321e88b165a0093505c1bc8b.jpg\" alt=\"\" style=\"width: 175px; \"></p><p style=\"text-align: center; \"><img src=\"/upload/images/1f5e54bd668b784f6768a8d9d313a3bd.jpg\"></p><p>    最能体现学位等级的是头巾，其尺寸大小，形状，随学位的不同而不同，学位越高，尺寸就越大，做工就越精致。头巾的外层与长袍的黑色材料相匹配，衬里折叠向外翻出的部分，使用大学代表颜色。天鹅绒贴边的颜色表示学科类别。</p><p>    垂布为套头三角兜型，饰边处按文、理、工、农、医、军事六大类分别标为粉、灰、黄、绿、白、红颜色。垂布佩戴在学位袍外，套头披在肩背处，铺平过肩，扣绊扣在学位袍最上面纽扣上，三角兜自然垂在背后。垂布按授予学位的文、理、工、农、医、军事六大类分别佩戴。</p><p style=\"text-align: center; \"><p><img src=\"/upload/images/9cb42f8c254ec4e0eea225f6bab63395.jpg\"></p></p>','1','100','news','1394177033','1394440643');
INSERT INTO `post` (`id`,`category_id`,`model`,`title`,`alias`,`image_name`,`file_name`,`tinyint1`,`int10`,`char32`,`varchar30`,`varchar50`,`varchar100`,`varchar128`,`content`,`status`,`weight`,`view`,`created_at`,`updated_at`) VALUES
('69','20','phd','博士学位的等级及类型','ee6f2cf8bfb22b6c45adb16d1e231e53','','','0','0','','','','','    博士学位是标志被授予者的受教育程度和学术水平达到规定标准的本专业的最高学识水准的学术称号。在学士学位、硕士学位和博士学位三种学位中，博士学位是最高的一级。设立三级学位制，把博士作为最高的一个级...','<p>    博士学位是标志被授予者的受教育程度和学术水平达到规定标准的本专业的最高学识水准的学术称号。在学士学位、硕士学位<st1>和博士学位三种学位中，博士学位是最高的一级。设立三级学位制，把博士作为最高的一个级别，一开始只设有学术型的博士，后来在某些专业增设专业性博士学位，如临床医学博士、工<st1>程博士等等。博士学位授予的类型分为哲学、经济学、法学、教育学、文学、历史学、理学、工学、农学、医学、军事学、管理学共12个学科门类。</st1></st1></p>','1','100','news','1394185874','0');
INSERT INTO `post` (`id`,`category_id`,`model`,`title`,`alias`,`image_name`,`file_name`,`tinyint1`,`int10`,`char32`,`varchar30`,`varchar50`,`varchar100`,`varchar128`,`content`,`status`,`weight`,`view`,`created_at`,`updated_at`) VALUES
('70','20','phd','博士学位的发展','b3728072850fbd5a6dab55297d935ee9','','','0','0','','','','','    1982年2012年我国博士学位教育由无到有,由小到大,由弱到强,走上了一条快速、平稳的发展道路。总的来说,可以分为1982~1987、1987~1994、1994~1998、1999~200...','<p>    1982年2012年我国博士学位教育由无到有,由小到大,由弱到强,走上了一条快速、平稳的发展道路。总的来说,可以分为1982~1987、1987~1994、1994~1998、1999~2007、2008以后几个阶段。</p><p>    1982~1987年为我国博士学位教育初创阶段,虽然增长速度很快,但每年招收人数、授予学位人数和在校生人数规模都还小。</p><p>    1987~1994年为成型阶段,这时期许多制度已经制定出来,博士学位教育已具有初步的规模,取得了一定的成效,1989年政治风波影响到博士学位教育的发展,使得1988、1989年的招生人数和1992、1993年的授予人数均出现下滑,但校生人数略有增长。</p><p>    1994~1998年为高速发展阶段,这一时期是我国博士学位教育发展速度最快的时期,以4年翻一番的速度保持高速增长,奠定了庞大的基础。</p><p>    1999~2007为持续增长阶段,中国在此期间上升为世界上的研究生大国,年授予博士学位人数从约1万人扩大到4万多人,取得了可喜的成就,同时也带来发展的隐患。</p><p>    2008至今为调整阶段,这时期我国博士学位教育小幅增长,趋于平稳,注重质量和内涵,不盲目追求发展速度。</p><p>    总的来说,我<st1>国博士学位教育的发展进程非常顺利,发展速度居世界前茅。特别是1994开始,每年的招生、授予数均有稳定增长,其中1994~1998年、2003~2007年间,每年授予的博士学位数量年均增长超过20%,博士生教育规模已经跃居世界前列,仅次于美国。中<st1>国的博士学位教育取得了举世瞩目的辉煌成就,用了 30年的时间就走完了西方国家150年的发展历程,应该值得庆贺。不过,随着博士学位教育向着深度发展,一些长期被忽视的症结逐渐涌现,带来了了许多严重的问题,这些问题必须在发展过程中得到妥善解决,才能保证中<st1>国博士学位教育的健康、全面发展。</st1></st1></st1></p>','1','100','news','1394186028','0');
INSERT INTO `post` (`id`,`category_id`,`model`,`title`,`alias`,`image_name`,`file_name`,`tinyint1`,`int10`,`char32`,`varchar30`,`varchar50`,`varchar100`,`varchar128`,`content`,`status`,`weight`,`view`,`created_at`,`updated_at`) VALUES
('71','20','phd','博士后','e0dd6f31ca4e7e591dc0f02fa74ec66a','','','0','0','','','','','（一）定义博士后（Postdoctoral）是指获得博士学位后，在高等院校或研究机构从事一定时期研究工作的阶段；也指在博士后流动站或博士后科研工作站进行专题研究的人员。（二）历史起源  1876年（丙...','<p><strong>（一）定义</strong></p><p><strong></strong></p><p>博士后（Postdoctoral）是指获得博士学位后，在高等院校或研究机构从事一定时期研究工作的阶段；也指在博士后流动站或博士后科研工作站进行专题研究的人员。</p><p><strong>（二）历史起源</strong><strong></strong></p><p>  1876年（丙子年），美国约翰·霍普金斯大学设立了一项研究基金，用以资助优秀的青年学者在较好的研究条件下从事科学研究工作。由于在最初基金资助的20人中有4人已经获得了博士学位，故人们称之为“博士后”。</p><p>1983年至1984年，诺贝尔奖获得者、华裔物理学家李政道先生两次致信邓小平同志，建议中国实行博士后制度。1984年5月，邓小平同志在人民大会堂会见了李政道，并仔细听取其关于实施博士后制度的意见和方案，当即表示：“这是一个新的方法，是培养使用科技人才的制度。”1985年7月，国务院批准了设立博士后科研流动站,试行博士后制度方案——博士后制度在我国正式确立。</p><p><strong>（三）性质特点</strong><strong></strong></p><p>①“博士后”表明的是一种经历。博士是最高学位，不能把“博士后”看成比博士更高一级的学位，对博士后研究人员不能再授予其它任何名义的学位称号，同时“博士后”也不是专业技术或行政职务。</p><p>②博士后研究人员主要从事科学研究，而这种科研工作往往具有探索、开拓、创新性质。</p><p>③博士后研究人员是国家正式工作人员，而不再是学生。他们在博士后研究期间要与其他正式职工一样计算工龄，除享受国家规定的优惠待遇外，还享受同本单位正式职工一样的各种待遇。</p><p>④全国博士后管委会第十三次会议研究决定，给期满出站，并且工作达到一定标准的博士后（一般为两年）研究人员颁发《博士后证书》。“博士后”是一种工作，而拥有“博士”学位是申请成为“博士后”的必要条件。</p><p>⑤博士后指的是一些新近获得博士学位的人，在他成为正式的专职研究人员之前，经过竞争而获得有关部门提供的津贴，在一所水平较高的研究机构做一段研究工作，以取得科研经验。一般称这些人为博士后研究人员，简称“博士后”。</p><p><strong>（四）福利待遇</strong><strong></strong></p><p>①博士后研究人员在第一站和第二站期间的职务工资，分别按讲师职务工资标准的第四档和第五档确定。其工资构成中活的部分，按所在设站单位的类别，由设站单位(含接受留学博士回国做博士后的非设站单位)根据博士后研究人员的工作性质、工作特点、工作表现和实际工作量，比照所在设站单位同类人员确定。</p><p>②各设站单位应对博士后研究人员进行定期考核，对连续两个年度考核合格的博士后研究人员，可晋升一个工资档次。</p><p>③博士后研究人员在第一、二站工作期满分配工作后，各设站单位应将其在站期间工作、升级考核情况介绍到接受单位，在接受单位未聘任其正式专业技术职务前，仍按在站期间确定的工资标准领取工资，聘任正式专业技术职务后，按所聘职务确定相应的工资标准，但不应低于在期间的工资标准。</p><p>④企业博士后在企业工作期间的实际收入应与企业同岗位、同资历工作人员的收入相当。如其工资、津补贴总额相对较低，差额部分由试点企业根据企业财务规定和博士后研究人员的工资情况予以补足。</p><p>⑤在站的现役军人博士后研究人员，其工资待遇按军队的有关规定执行(参见《关于军队博士后流动站和现役军人博士后研究人员管理工作有关问题的通知》[1993]政联字第4号)。</p><p>⑥博士后除享受同本单位正式职工一样的生活福利待遇(包括奖金、公费医疗、困难补助、探亲、书报补贴等)外，并享受每月100元的生活补贴。</p><p><strong>（五）日常经费和公寓管理</strong><strong></strong></p><p>①博士后日常经费是用<st1>于博士后人员日常生活和日常公用的专项经费，主要来源于中央财政拨款、地方财政拨款和设站单位筹资。</st1></p><p>②人事部和财政部确定<st1>国家资助博士后日常经费标准，制定国家日常经费资助年度计划。各省、自治区、直辖市和设站单位资助招收博士后人员，其日常经费标准参照国家规定的博士后日常经费标准。</st1></p><p>③留学博士回<st1>国从事博士后研究工作，<st1>国家按照博士后日常经费标准给予专门资助。</st1></st1></p><p>④博士后日常经费由设站单位统一管理，单独立账，专款专用。对国家下拨的博士后日常经费，设站<st1>单位博士后工作主管部门可以提取不<st1>高于博士后日常经费总额的3%，作为博士后管理工作经费。</st1></st1></p><p>⑤人事部和各省、自治区、直辖市人事部门负责对其下拨的博士后日常经费的管理、使用情况进行检查和监督，对违反规定使用不当的，按照有关财务规定处理。</p><p>⑥国家、地方和设站单位共同出资,在设站单位<st1>和在站博士后人员数量较多的城市集中建造博士后公寓。有条件的设站单位也可自筹经<st1>费建造博士后公寓。</st1></st1></p><p>⑦有关省、自治区、直辖市和设站单位应根据当地的实际情况制定博士后公寓管理办法。博士后公寓是在站博士后人员居住的专门住房，不得挪作他用。博士后出站时，应及时从博士后公寓中迁出。</p>','1','100','news','1394186127','0');
INSERT INTO `post` (`id`,`category_id`,`model`,`title`,`alias`,`image_name`,`file_name`,`tinyint1`,`int10`,`char32`,`varchar30`,`varchar50`,`varchar100`,`varchar128`,`content`,`status`,`weight`,`view`,`created_at`,`updated_at`) VALUES
('72','31','phd','博士后科研工作站','bfba4d83c4bd7f762b72b721cf1faaba','','','0','0','','','','','（一）定义博士后科研工作站（以下简称工作站）是指在企业、科研生产型事业单位和特殊的区域性机构内，经批准可以招收和培养博士后研究人员的组织，为我国的高技术人才与企业搭起了桥梁，是产、学、研相结合的新路子...','<p><strong>（一）定义</strong></p><p><strong></strong></p><p>博士后科研工作站（以下简称工作站）是指在企业、科研生产型事业单位和特殊的区域性机构内，经批准可以招收和培养博士后研究人员的组织，为我国的高技术人才与企业搭起了桥梁，是产、学、研相结合的新路子。</p><p><strong>（二）设立条件</strong><strong></strong></p><p>1、流动站</p><p><strong></strong>高等院校和科研院所申请设立流动站，应当具备以下基本条件：</p><p>①具有相应学科的博士学位授予权，并已培养出一届以上的博士毕业生；</p><p>②具有一定数量的博士生指导教师；</p><p>③具有较强的科研实力和较高的学术水平，承担国家重大研究项目，科研工作处于国内前列，博士后研究项目具有理论或技术创新性；</p><p>④具有必需的科研条件和科研经费，并能为博士后人员提供必要的生活条件；</p><p>具有博士学位一级学科授予权、建有国家重点实验室的学科和国家重点学科可优先设立流动站。</p><p>流动站的设立，由拟设站单位提出申请，各省、自治区、直辖市人事部门或国务院有关部委及直属机构人事部门审核汇总后报人事部。经专家评审委员会评审，由人事部<st1>和全国博士后管理委员会审核批准。</st1></p><p>2、工作站</p><p>企业、从事科学研究和技术开发的事业单位、省级以上高新技术开发区、经济技术开发区和留学人员创业园区申请设立工作站，应当具备以下基本条件：</p><p>①具备独立法人资格，经营或运行状况良好；</p><p>②具有一定规模，并具有专门的研究与开发机构；</p><p>③拥有高水平的研究队伍，具有创新理论和创新技术的博士后科研项目；</p><p>④能为博士后人员提供较好的科研条件和必要的生活条件。</p><p>建有省级以上研发和技术中心，承担国家重大项目的单位可优先设立工作站。</p><p>工作站的设立，由拟设站单位提出申请，各省、自治区、直辖市人事部门或国务院有关部委及直属机构人事部门组织初评后报人事部。经专家评议，由人事部审核批准。</p><p><strong>（三）设立程序</strong><strong></strong></p><p>人事部、全国博士后管委会根据国家科技、教育、经济发展需要和博士后工作发展情况，适时下发申报设站的通知并由全国博管办组织设站评审工作。</p><p>各单位在接到申报设站的通知后，须按照通知要求的条件、范围、组织程序提出申请，在填写相关表格后，在规定的时间内报送有关部门。</p><p>全国博管办组织有关专家按照公开、公平、择优的原则，对申报材料进行评审，评审结果报人事部、<st1>全国博士后管委会审定。</st1></p><p><strong>（四）招收办法</strong><strong></strong></p><p>①人事部、全国博士后管委会根据国家发展战略按年度下达向各流动站单位招收博士后研究人员的国家资助计划（资助标准为每人两年10万元人民币）和国家重点资助招收博士后研究人员的计划（资助标准为每人两年16万元人民币），此种招收模式为国家资助招收和重点资助招收。</p><p>②各设站单位应根据本单位研究工作需要和经费来源（国家资助、各类基金资助、社会赞助、研究项目经费以及单位自筹）等情况，在批准的范围内设置博士后岗位，并确定招收博士后研究人员的具体条件，面向社会予以公布，此种招收模式为自筹经费招收。</p><p>③符合设立流动站、工作站条件的未设站单位（以下称非设站单位）可以招收留学博士（系指在国外获得博士学位或在国外获长期居留证的博士）回国从事博士后研究工作或依托国家重大科研项目招收博士后研究人员，此种招收模式为留学非设站招收。</p><p>④非设站单位依托国家重大科研项目招收博士后研究人员，需先按《关于以国家重大科技项目为依托招收博士后的报批及管理办法》，向全国博管办申报，经批准后，方可进行招收工作，此种招收模式为项目博士后招收。</p><p><strong>（五）申请流程</strong><strong></strong></p><p>①申请人须取得博士学位、品学兼优、身体健康、年龄一般在四十岁以下。</p><p>②委托代培、定向培养博士和在职人员、现役军人，申请从事博士后研究工作须征得有关单位同意。在职人员不得申请兼职从事博士后研究工作。设站单位培养的博士。</p><p>③如是本校博士毕业生，一般不得申请进本单位同一个一级学科的流动站从事博士后研究工作。</p><p>④申请人首先向有意向的设站单位提出申请。并根据各设站单位的具体招收要求提供审核材料。</p><p>⑤如申请的进站单位为工作站单位，应区分其是否具有独立招收资格。如不具备独立招收博士后研究人员的资格，申请人还应同时向流动站单位提出联合招收的请求。</p><p>⑥所申的请单位初审合格后，报全国博管办或有关省（市）博士后工作主管部门核准并注册。</p><p><strong>（六）管理体系</strong><strong></strong></p><p>各设站单位应建立在站博士后人员的考核指标体系，以及博士后人员进站招收、中期考核和出站考核制度。制定对博士后人员目标管理、绩效评价、奖励惩处等具体管理办法，对博士后人员进行定期考核。对研究成果突出、表现优秀的博士后人员，应当给予适当的表彰和奖励；对中期考核不合格的博士后人员予以劝退和解约。</p><p>各设站单位<st1>应将博士后人员纳入本单位人事管理范围，其人事、组织关系、福利待遇等比照本单位同等人员对待，或按协议执行。博士后人员实行岗位绩效工资制度。</st1></p><p>博士后人员应与设站单位职工享受同等的医疗保障待遇，所需资金的筹集应当执行设站单位职工医疗保障资金的筹集办法。</p><p>博士后人员进站报到后，可在设站单位所在地落常住户口，凭人事部博士后管理部门或有关省、自治区、直辖市人事部门介绍信和其它有效证明材料，到公安户政管理部门办理户口迁出和落户手续，其配偶及未成年子女可以随其流动，按有关规定到当地公安派出所办理暂住手续。</p><p>博士后人员在站期间，可以凭人事部博士后管理部门或有关省、自治区、直辖市人事部门的介绍信，在其子女暂住户口所在地办理入幼儿园、上小学和初中，报考（转入）高中以及报考高等院校或中等专业学校等事宜，享受当地常住户口居民的同等待遇。</p><p>博士后人员在站工作时间为两年，一般不超过三年。承担国家重大项目，获得国家自然科学基金、国家社会科学基金等国家基金资助项目或中<st1>国博士后科学基金特别资助<st1>项目的博士后人员，如需延长在站时间，经设站单位批准后，可根据项目和课题研究的需要适当延长。</st1></st1></p><p>博士后人员工作期满后应按时出站，确有需要可转到另一个流动站或工作站<st1>从事博士后研究工作。博士后人员<st1>从事博士后研究工作最长不超过六年。</st1></st1></p><p>博士后人员在站期间，根据研究项目需要，经设站单位批准，可以到国外开展合作研究、参加国际学术会议或进行短期学术交流，时间一般不超过三个月。经设站单位批准，可根据项目情况适当延长。</p><p>博士后人员的研究成果归属，依照国家有关知识产权的法律、法规办理。</p><p>博士后人员期满出站前，设站单位可以根据其在站期间的科研能力、学术水平、工作成果，对其提出专业技术职称评定意见或建议。</p><p>博士后人员工作期满，须向设站单位提交博士后研究报告（以下简称报告）<st1>和博士后工作总结等书面材料，报告要严格按照格式编写。设站单位应将报告报送国家图书馆。博士后人员出站时，设站单位要及时组织有关专家对其科研工作、个人表现等进行评定，形成书面材料归入其个人档案。</st1></p><p>对出站考核合格的博士后人员，由人事部<st1>和全国博士后管理委员会颁发博士后证书。</st1></p><p>博士后人员期满出站，到人事部博士后管理部门或有关省、自治区、直辖市办理出站手续。凭人事部博士后管理部门或有关省、自治区、直辖市人事部门的介绍信和其它有效证明材料，到当地公安户政管理部门办理本人及配偶和未成年子女的户口迁出和落户手续。</p><p>博士后人员工作期满出站，除有协议的以外，其就业实行双向选择、自主择业。各级政府人事部门和设站单位要为出站博士后人员的合理使用创造条件，做好出站博士后人员的就业引荐等服务工作。</p><p>博士后人员在站期间，有下列情形之一者，应予退站： </p><p>①考核不合格的； </p><p>②在学术上弄虚作假，影响恶劣的； </p><p>③受警告以上行政处分的； </p><p>④无故旷工连续15天或一年内累计旷工30天以上的； </p><p>⑤因患病等原因难以完成研究工作的； </p><p>⑥出国逾期不归超过30天的； </p><p>⑦其他情况应予退站的。 </p><p>退站的博士后人员，不享受国家对期<st1>满出站博士后人员规定的相关政策，其户口迁落和有关人事关系手续由人事部博士后管理部门或有关省、自治区、直辖市人事部门办理。 </st1></p><p>加<st1>强对博士后工作管理人员进行业务培训，以做好博士后管理工作。</st1></p>','1','100','news','1394186197','1394441348');
INSERT INTO `post` (`id`,`category_id`,`model`,`title`,`alias`,`image_name`,`file_name`,`tinyint1`,`int10`,`char32`,`varchar30`,`varchar50`,`varchar100`,`varchar128`,`content`,`status`,`weight`,`view`,`created_at`,`updated_at`) VALUES
('73','30','phd','博士的高层次学术贡献','6f02dba877b4d23fb2791637f4f4312a','','','0','0','','','','','（一）博士在国家自然科学基金项目获得者中的占比情况2001~2006年度博士在国家自然科学基金面上项目的占比情况
 
  
  变量
  
  
  合计
  
  
  博士
 ...','<p><strong>（一）博士在国家自然科学基金项目获得者中的占比情况</strong></p><p><strong></strong></p><p><strong>2001~2006</strong><strong>年度博士在国家自然科学基金面上项目的占比情况</strong><strong></strong></p><table>
 <tbody><tr>
  <td>
  <p>变量</p>
  </td>
  <td>
  <p>合计</p>
  </td>
  <td>
  <p>博士</p>
  </td>
  <td>
  <p>硕士</p>
  </td>
  <td>
  <p>学士</p>
  </td>
  <td>
  <p>其他</p>
  </td>
  <td>
  <p>博士占比</p>
  </td>
 </tr>
 <tr>
  <td>
  <p>2001年面上自由青年</p>
  <p>地区科学</p>
  <p>合计</p>
  </td>
  <td>
  <p>3525</p>
  <p>726</p>
  <p>184</p>
  <p>4435</p>
  </td>
  <td>
  <p>2239</p>
  <p>612</p>
  <p>78</p>
  <p>2929</p>
  </td>
  <td>
  <p>567</p>
  <p>102</p>
  <p>55</p>
  <p>724</p>
  </td>
  <td>
  <p>330</p>
  <p>9</p>
  <p>27</p>
  <p>366</p>
  </td>
  <td>
  <p>389</p>
  <p>3</p>
  <p>24</p>
  <p>416</p>
  </td>
  <td>
  <p>0.635</p>
  <p>0.843</p>
  <p>0.424</p>
  <p>0.660</p>
  </td>
 </tr>
 <tr>
  <td>
  <p>2002年面上自由青年</p>
  <p>地区科学</p>
  <p>合计</p>
  </td>
  <td>
  <p>4503</p>
  <p>1064</p>
  <p>241</p>
  <p>5808</p>
  </td>
  <td>
  <p>3044</p>
  <p>897</p>
  <p>100</p>
  <p>4041</p>
  </td>
  <td>
  <p>723</p>
  <p>158</p>
  <p>69</p>
  <p>950</p>
  </td>
  <td>
  <p>406</p>
  <p>7</p>
  <p>48</p>
  <p>461</p>
  </td>
  <td>
  <p>330</p>
  <p>2</p>
  <p>24</p>
  <p>356</p>
  </td>
  <td>
  <p>0.676</p>
  <p>0.843</p>
  <p>0.415</p>
  <p>0.696</p>
  </td>
 </tr>
 <tr>
  <td>
  <p>2003年面上自由青年</p>
  <p>地区科学</p>
  <p>合计</p>
  </td>
  <td>
  <p>4859</p>
  <p>1269</p>
  <p>231</p>
  <p>6359</p>
  </td>
  <td>
  <p>3398</p>
  <p>1024</p>
  <p>113</p>
  <p>4535</p>
  </td>
  <td>
  <p>834</p>
  <p>231</p>
  <p>65</p>
  <p>1130</p>
  </td>
  <td>
  <p>390</p>
  <p>12</p>
  <p>38</p>
  <p>440</p>
  </td>
  <td>
  <p>237</p>
  <p>2</p>
  <p>15</p>
  <p>254</p>
  </td>
  <td>
  <p>0.699</p>
  <p>0.807</p>
  <p>0.489</p>
  <p>0.713</p>
  </td>
 </tr>
 <tr>
  <td>
  <p>2004年面上自由青年</p>
  <p>地区科学</p>
  <p>合计</p>
  </td>
  <td>
  <p>5847</p>
  <p>1590</p>
  <p>274</p>
  <p>7711</p>
  </td>
  <td>
  <p>4385</p>
  <p>1345</p>
  <p>142</p>
  <p>5872</p>
  </td>
  <td>
  <p>829</p>
  <p>224</p>
  <p>79</p>
  <p>1132</p>
  </td>
  <td>
  <p>421</p>
  <p>18</p>
  <p>41</p>
  <p>480</p>
  </td>
  <td>
  <p>212</p>
  <p>3</p>
  <p>12</p>
  <p>227</p>
  </td>
  <td>
  <p>0.750</p>
  <p>0.846</p>
  <p>0.518</p>
  <p>0.762</p>
  </td>
 </tr>
 <tr>
  <td>
  <p>2005年面上自由青年</p>
  <p>地区科学</p>
  <p>合计</p>
  </td>
  <td>
  <p>6846</p>
  <p>1934</p>
  <p>331</p>
  <p>9111</p>
  </td>
  <td>
  <p>5470</p>
  <p>1650</p>
  <p>187</p>
  <p>7307</p>
  </td>
  <td>
  <p>823</p>
  <p>272</p>
  <p>78</p>
  <p>1173</p>
  </td>
  <td>
  <p>368</p>
  <p>12</p>
  <p>42</p>
  <p>422</p>
  </td>
  <td>
  <p>185</p>
  
  <p>24</p>
  <p>209</p>
  </td>
  <td>
  <p>0.799</p>
  <p>0.853</p>
  <p>0.565</p>
  <p>0.802</p>
  </td>
 </tr>
 <tr>
  <td>
  <p>2006年面上自由青年</p>
  <p>地区科学</p>
  <p>合计</p>
  </td>
  <td>
  <p>7429</p>
  <p>2429</p>
  <p>413</p>
  <p>10271</p>
  </td>
  <td>
  <p>6138</p>
  <p>2109</p>
  <p>246</p>
  <p>8493</p>
  </td>
  <td>
  <p>791</p>
  <p>302</p>
  <p>96</p>
  <p>1189</p>
  </td>
  <td>
  <p>333</p>
  <p>17</p>
  <p>57</p>
  <p>407</p>
  </td>
  <td>
  <p>167</p>
  <p>1</p>
  <p>14</p>
  <p>182</p>
  </td>
  <td>
  <p>0.826</p>
  <p>0.868、0.596</p>
  <p>0.827</p>
  </td>
 </tr>
 <tr>
  <td>
  <p>历年合计</p>
  </td>
  <td>
  <p>84328</p>
  </td>
  <td>
  <p>64537</p>
  </td>
  <td>
  <p>12098</p>
  </td>
  <td>
  <p>4881</p>
  </td>
  <td>
  <p>2812</p>
  </td>
  <td>
  <p>0.765</p>
  </td>
 </tr>
</tbody></table><p><strong>注：本表没有区分博士学位是在国外获得还是在国内获得</strong><strong></strong></p><p>如表所示，2001~2006年，博士在国家自然科学基金面上项目负责人中总共所占的比重为76.50%，其中，2001年度为66.00%；2002年度为69.60%；2003年度为71.30%；2004年度为76.20%；2005年度为80.20%；2006年度为82.70%。由此可以得知从2001年度至2006年度博士在面上项目负责人中所占的比重呈现逐年上升的趋势。</p><p><strong>（二）博士在中国青年科技奖获得者中的占比情况</strong><strong></strong></p><p><strong>1994~2007</strong><strong>年中国青年科技奖获奖者中博士的情况分析</strong><strong></strong></p><table>
 <tbody><tr>
  <td>
  <p>变量</p>
  </td>
  <td>
  <p>人数（人）</p>
  </td>
  <td>
  <p>占比（%）</p>
  </td>
 </tr>
 <tr>
  <td>
  <p>历届中国青年科技奖获得者中博士占比</p>
  </td>
  <td>
  <p>获奖者总数</p>
  <p>博士</p>
  </td>
  <td>
  <p>998</p>
  <p>606</p>
  </td>
  <td>
  <p>100.00</p>
  <p>60.72</p>
  </td>
 </tr>
 <tr>
  <td>
  <p>获奖者博士性别情况</p>
  </td>
  <td>
  <p>男</p>
  <p>女</p>
  </td>
  <td>
  <p>559</p>
  <p>47</p>
  </td>
  <td>
  <p>92.00</p>
  <p>8.00</p>
  </td>
 </tr>
 <tr>
  <td>
  
  
  
  <p>获奖者中<st1>国博士所属组织类型情况</st1></p>
  </td>
  <td>
  <p>高等院校</p>
  <p>科研机构</p>
  <p>企业</p>
  <p>医疗卫生机构</p>
  <p>政府部门</p>
  <p>在国外工作</p>
  <p>其他</p>
  </td>
  <td>
  <p>363</p>
  <p>164</p>
  <p>18</p>
  <p>25</p>
  <p>5</p>
  <p>28</p>
  <p>3</p>
  </td>
  <td>
  <p>59.90</p>
  <p>27.06</p>
  <p>2.97</p>
  <p>4.13</p>
  <p>0.83</p>
  <p>4.62</p>
  <p>0.50</p>
  </td>
 </tr>
 <tr>
  <td>
  <p>获奖者中博士所学专业情况</p>
  </td>
  <td>
  <p>理科</p>
  <p>工科</p>
  <p>农科</p>
  <p>医科</p>
  <p>管理</p>
  </td>
  <td>
  <p>205</p>
  <p>262</p>
  <p>58</p>
  <p>70</p>
  <p>11</p>
  </td>
  <td>
  <p>33.88</p>
  <p>43.23</p>
  <p>9.57</p>
  <p>11.55</p>
  <p>1.82</p>
  </td>
 </tr>
</tbody></table><p><strong>注：本表没有区分博士学位是在国外获得还是在国内获得</strong><strong></strong></p><p>如表所示，在中国青年科技奖获奖者中，博士所占比例为60.72%。其中男性所占比例为92.00%，女性所占比例为8%；所属组织类型以高等院校最多，为59.90%，其次为科研机构，为27.06%；所学专业以工科最多，为43.23%，其次为理科，为33.83%。</p><p><strong>（三）博士在百千万人才工程中的占比情况</strong><strong></strong></p><p><strong>1996~2007</strong><strong>年百万千人才工程中博士占比的情况分析</strong><strong></strong></p><table>
 <tbody><tr>
  <td>
  <p>变量</p>
  </td>
  <td>
  <p>1996</p>
  </td>
  <td>
  <p>1997</p>
  </td>
  <td>
  <p>1999</p>
  </td>
  <td>
  <p>2002</p>
  </td>
  <td>
  <p>2006</p>
  </td>
  <td>
  <p>2007</p>
  </td>
  <td>
  <p>合计</p>
  </td>
 </tr>
 <tr>
  <td>
  <p>百千万人才工程总人数（人）</p>
  </td>
  <td>
  <p>683</p>
  </td>
  <td>
  <p>394</p>
  </td>
  <td>
  <p>319</p>
  </td>
  <td>
  <p>819</p>
  </td>
  <td>
  <p>530</p>
  </td>
  <td>
  <p>561</p>
  </td>
  <td>
  <p>3306</p>
  </td>
 </tr>
 <tr>
  <td>
  <p>百万千人才工<st1>程博士人数（人）</st1></p>
  </td>
  <td>
  <p>442</p>
  </td>
  <td>
  <p>265</p>
  </td>
  <td>
  <p>250</p>
  </td>
  <td>
  <p>604</p>
  </td>
  <td>
  <p>384</p>
  </td>
  <td>
  <p>408</p>
  </td>
  <td>
  <p>2353</p>
  </td>
 </tr>
 <tr>
  <td>
  <p>百万千人才工<st1>程博士占比（%）</st1></p>
  </td>
  <td>
  <p>64.71</p>
  </td>
  <td>
  <p>67.26</p>
  </td>
  <td>
  <p>78.37</p>
  </td>
  <td>
  <p>73.75</p>
  </td>
  <td>
  <p>72.45</p>
  </td>
  <td>
  <p>72.73</p>
  </td>
  <td>
  <p>71.11</p>
  </td>
 </tr>
</tbody></table><p>如表所示，1996~2007年，百万千人才工<st1>程中博士占比整体上处在较高的比例上，最低的一年（1996年）比例都高达64.71%；最高的一年（1999年）比例达到78.37%。从趋势上来看，百万千人才工<st1>程中博士占比呈先增加后减少的现象。</st1></st1></p><p><strong>（四）博士在国家三大奖获得者中的占比情况</strong><strong></strong></p><p><strong>博士在国家自然科学奖获得者中的占比情况</strong><strong></strong></p><table>
 <tbody><tr>
  <td>
  <p>变量（年）</p>
  </td>
  <td>
  <p>获奖项目个数（个）</p>
  </td>
  <td>
  <p>第一完成人具有博士学位人数（人）</p>
  </td>
  <td>
  <p>博士占比（%）</p>
  </td>
 </tr>
 <tr>
  <td>
  <p>2002</p>
  </td>
  <td>
  <p>24</p>
  </td>
  <td>
  <p>11</p>
  </td>
  <td>
  <p>45.83</p>
  </td>
 </tr>
 <tr>
  <td>
  <p>2003</p>
  </td>
  <td>
  <p>19</p>
  </td>
  <td>
  <p>11</p>
  </td>
  <td>
  <p>57.89</p>
  </td>
 </tr>
 <tr>
  <td>
  <p>2004</p>
  </td>
  <td>
  <p>28</p>
  </td>
  <td>
  <p>15</p>
  </td>
  <td>
  <p>53.57</p>
  </td>
 </tr>
 <tr>
  <td>
  <p>2005</p>
  </td>
  <td>
  <p>38</p>
  </td>
  <td>
  <p>30</p>
  </td>
  <td>
  <p>78.95</p>
  </td>
 </tr>
 <tr>
  <td>
  <p>2006</p>
  </td>
  <td>
  <p>29</p>
  </td>
  <td>
  <p>20</p>
  </td>
  <td>
  <p>68.97</p>
  </td>
 </tr>
 <tr>
  <td>
  <p>2007</p>
  </td>
  <td>
  <p>39</p>
  </td>
  <td>
  <p>33</p>
  </td>
  <td>
  <p>84.62</p>
  </td>
 </tr>
 <tr>
  <td>
  <p>合计</p>
  </td>
  <td>
  <p>177</p>
  </td>
  <td>
  <p>120</p>
  </td>
  <td>
  <p>67.80</p>
  </td>
 </tr>
</tbody></table><p>如表所示，2002！2007年度，国家自然科学奖获奖项目中第一完成人具有博士学位的比例处在45%~85%之间，呈现逐年上升的态势。</p><p><strong>博士在国家技术发明奖获奖得者中的占比情况</strong><strong></strong></p><table>
 <tbody><tr>
  <td>
  <p>变量（年）</p>
  </td>
  <td>
  <p>获奖项目个数（个）</p>
  </td>
  <td>
  <p>第一完成人具有博士学位人数（人）</p>
  </td>
  <td>
  <p>博士占比（%）</p>
  </td>
 </tr>
 <tr>
  <td>
  <p>2002</p>
  </td>
  <td>
  <p>21</p>
  </td>
  <td>
  <p>7</p>
  </td>
  <td>
  <p>33.33</p>
  </td>
 </tr>
 <tr>
  <td>
  <p>2003</p>
  </td>
  <td>
  <p>19</p>
  </td>
  <td>
  <p>3</p>
  </td>
  <td>
  <p>15.79</p>
  </td>
 </tr>
 <tr>
  <td>
  <p>2004</p>
  </td>
  <td>
  <p>28</p>
  </td>
  <td>
  <p>8</p>
  </td>
  <td>
  <p>28.57</p>
  </td>
 </tr>
 <tr>
  <td>
  <p>2005</p>
  </td>
  <td>
  <p>40</p>
  </td>
  <td>
  <p>17</p>
  </td>
  <td>
  <p>42.50</p>
  </td>
 </tr>
 <tr>
  <td>
  <p>2006</p>
  </td>
  <td>
  <p>56</p>
  </td>
  <td>
  <p>17</p>
  </td>
  <td>
  <p>30.36</p>
  </td>
 </tr>
 <tr>
  <td>
  <p>2007</p>
  </td>
  <td>
  <p>51</p>
  </td>
  <td>
  <p>25</p>
  </td>
  <td>
  <p>49.02</p>
  </td>
 </tr>
 <tr>
  <td>
  <p>合计</p>
  </td>
  <td>
  <p>215</p>
  </td>
  <td>
  <p>77</p>
  </td>
  <td>
  <p>35.81</p>
  </td>
 </tr>
</tbody></table><p>如表所示，2002~2007年度，国家技术发明奖获奖项目中第一完成人具有博士学位的比例较高，处在15%~50%之间。国家技术发明奖获奖项目中第一完成人具有博士学位的比例也呈现逐年上升的态势。</p>','1','100','news','1394186269','1394441220');
INSERT INTO `post` (`id`,`category_id`,`model`,`title`,`alias`,`image_name`,`file_name`,`tinyint1`,`int10`,`char32`,`varchar30`,`varchar50`,`varchar100`,`varchar128`,`content`,`status`,`weight`,`view`,`created_at`,`updated_at`) VALUES
('74','30','phd','博士的就业状况与趋势','49ae592d698f4f59454fe1ebf6099307','','','0','0','','','','','（一）博士的就业状况从我国最近十几年的博士教育总体发展趋势来看，高校扩招带来了博士毕业生的快速增长，从1995年的4151名毕业生，到2008年的41460人，年平均增长率达到了94%，14年中博士毕...','<p>
	<strong>（一）博士的就业状况</strong></p><p>
	<strong></strong></p><p>
	从我国最近十几年的博士教育总体发展趋势来看，高校扩招带来了博士毕业生的快速增长，从1995年的4151名毕业生，到2008年的41460人，年平均增长率达到了94%，14年中博士毕业生的总数达到了255289人。</p><p style=\"text-align: center; \"><img src=\"/upload/images/25ffef87b3502d5fa9f4fdcba5e90bf8.jpg\" alt=\"\" style=\"width: 533px; \"></p><p>
	从表1可看出，有43.9%的博士毕业生选择进入高等院校进行教学和科研工作，10.8%的博士选择进入科研院工作，2.9%的博士选择<st1>从事博士后工作。共有125633人，近60%的博士生在毕业后继续从事科研与教学工作，构成了我国科研队伍的主要组成部分。随着拥有高学<st1>历的博士毕业生越来越多的进入各级政府和国家机关（5.2%），总共有超过1.1<st1>万名博士毕业生参与到社会管理和建设的各个方面。另外，企、事业单位也吸引着越来<st1>越多的博士生（33059）人，占毕业总人数的15.2%。出国继续深造、进入部队的人数也占到了相当的比例，分别达到了毕业总人数的2.9%和2.7%。</st1></st1></st1></st1></p><p>
	<strong>（二）博士的就业趋势</strong><strong></strong></p><p>
	选择高等院校就业的博士比例从1995年的59.8%下降到2002年的39.2%，之后几年保持在一个比较平稳的水平上，到2008年又上升到46.1%。</p><p>
	选择科研院所就业的博士比例从1995年的16.9%下降到2008年的8.3%，呈现较为明显的下降趋势。</p><p>
	选择政府部门工作的博士在2005年之前一直保持在4.5%左右的稳定水平，但从2006年开始出现较为明显的增长趋势，2008年的比例达到7.5%。</p><p>
	选择事业单位就业的博士比例一直保持着较为稳定的增长水平，从1995年的1.4%增长到2008年的14.3%。</p><p>
	选择到企业工作的博士在2005年之前一直保持在4.5%左右的稳定水平，但从2006年开始出现较为明显的增长趋势，2008年的比例达到7.8%。</p><p>
	选择博士后工作的博士比例呈现明显下降的趋势，从1995年的4.9%下降到2008年的1.5%。</p><p>
	选择出
	<st1>国的博士比例在2002年之前稳定在5%左右，但从2003年开始，出现明显的下降，到2008年出国比例仅为1.2%。</st1></p>','1','100','news','1394186419','1394765306');
INSERT INTO `post` (`id`,`category_id`,`model`,`title`,`alias`,`image_name`,`file_name`,`tinyint1`,`int10`,`char32`,`varchar30`,`varchar50`,`varchar100`,`varchar128`,`content`,`status`,`weight`,`view`,`created_at`,`updated_at`) VALUES
('75','31','phd','博士的质量保障体系','3aeccef82c58944acb9fe631d890674b','','','0','0','','','','','经过近30年的探索和努力，我国基本建立起一个比较完善的博士研究生教育质量保障体系，从制度上为博士质量的不断提高奠定了基础。我国博士培养质量的不断提高，得益于中国特色博士生教育质量保障体系的不断完善。特...','<p>经过近30年的探索和努力，我国基本建立起一个比较完善的博士研究生教育质量保障体系，从制度上为博士质量的不断提高奠定了基础。我<st1>国博士培养质量的不断提高，得益于中<st1>国特色博士生教育质量保障体系的不断完善。特别是在招生录取、导师指导、学术训练、学科建设等方面，我国已经形成了自己的特色。与此同时，由<st1>于我国博士生教育起步晚、发展迅速，质量保障体系也需要在发展中进一步完善。</st1></st1></st1></p><p><strong>（一）</strong><strong>招生录取</strong><strong></strong></p><p>目前，我<st1>国博士生的选拔仍以公开招考为主，普遍院校公开招考录取比例在80%以上，但对于招考的方式，不同单位、不同学科有明显不同的偏好，不如“985工程”高校更倾向于灵活的选拔方式，通过直接攻博、硕博连续和免试推荐等招生的比例已达到40%以上；人文、社会科学等学科更倾向于继续沿用公开招考的方式。</st1></p><p><strong>（二）</strong><strong>导师指导</strong><strong></strong></p><p>导<st1>师是博士生学术训练的主要引导人和实施者，博士生的培养质量与导师水平及其指导方式有直接的关系。</st1></p><p>我国始终视质量为博士生教育的生命线，高度重视博士生导师队伍的建设，建立起了中国特有的导师遴选制度以及激励机制。近年来，随着导师队伍规模的矿大，博士生导师队伍年龄结构日趋合理，一大批年富力强的学者进入导师队伍中。</p><p><strong>（三）</strong><strong>学术训练</strong><strong></strong></p><p>学士训练主要包括课程学习、综合考试、参与课题研究、学术发表、博士学位论文开题、预答辩及答辩环节。各培训单位对这些环节均有明确的规定，这些规定使得培养过程更加规范，对保障我<st1>国博士培养质量发挥了重要的作用。</st1></p><p><strong>（四）</strong><strong>学科建设</strong><strong></strong></p><p>我国自始至终高度重视博士点所在学科的水平，把学科基础视为博士培养能力的重要保障，并采取了一系列重大措施以提升学科点的水平，比如“985工程”、“211工程”、全国重点学科评审等。到2005年年底，我国高校中有75个学科点进入了“基本科学指标”（ESI）数据库有关学科领域的前1%，其中化学13个、物理学9个、材料学19个、工程学22个，以这些学科为代表的一批高水平学科点为我<st1>国博士培养质量提供了坚实的保障。</st1></p><p><strong>（五）</strong><strong>经费保障</strong><strong></strong></p><p>绝大多数博士生的培养过程是同科研活动紧密联系的，故强大的科研投入是提升博士培养质量的重要支撑和保障。</p><p>但是，我<st1>国博士生生均拨款标准长期以来维持在较低水平，且多年没有调整。高校作为博士培养的主体，缺乏资助博士生独立从事科研活动的专门经费，致使一些导师采取“以项目养人”的办法，用横向课题来<st1>支撑博士生的培养。博士生通常把大部分的时间与精力投入这些课题研究中，难以独立开展一些学术探索。一些理工科的博士生由于缺乏科研经费，只能采取仿真或模拟的手段进行试验。一些社会科学的博士由于缺乏基本的调研费用，不能进行充分的实地调查，影响了科研的质量。许多纵向科研项目受到相关部门制定的财务制度的约束，不能开支人员经费，因而不利于吸引优秀博士生参与到课题中。</st1></st1></p><p>其次，博士生生活补助水平较低。学位制度建立之初，<st1>国家对博士生补助非常重视，博士生的补助水平相当于当时的五级工资标准，与当时生活水平、工资标准比较，相对较高。中科院教授王铮回忆说：“1989年我作为博士研究生收入是91元，这比一般人高，他们是每月78元。”但是，自20世纪90年代开始，随着市场经济的逐步建立和分配体制的改革，人民的收入水平和生活水平快速提高，而博士生资助标准变化不大，博士生补助水平与工资水平的距离逐渐拉开。据中国统计年鉴的相关数据，2006年城镇居民家庭中等偏下户的平均每人全年消费性支出为6108.33元，而目前博士生补助水平大约为每人每年6000元，可见，博士生补助水平非常低，只能勉强满足基本生活需要。</st1></p>','1','100','news','1394186478','1394441293');
INSERT INTO `post` (`id`,`category_id`,`model`,`title`,`alias`,`image_name`,`file_name`,`tinyint1`,`int10`,`char32`,`varchar30`,`varchar50`,`varchar100`,`varchar128`,`content`,`status`,`weight`,`view`,`created_at`,`updated_at`) VALUES
('76','20','phd','博士队伍成为科教兴国的骨干力量','7db59cf3b0eafd9b9c366537fee10316','','','0','0','','','','','博士发展质量是指博士生毕业后的职业发展状况，体现在对工作岗位的胜任力、社会认可度、对科技进步和社会经济发展的贡献等方面。博士发展质量在一定程度上也反应出博士培养质量。（一）我国博士毕业生主要分布在高校...','<p>博士发展质量是指博士生毕业后的职业发展状况，体现在对工作岗位的胜任力、社会认可度、对科技进步和社会经济发展的贡献等方面。博士发展质量在一定程度上也反<st1>应出博士培养质量。</st1></p><p><strong>（一）</strong>我<st1>国博士毕业生主要分布在高校与科研院所，整体发展状况较好。90%以上的用人单位认为博士质量基本满足社会需求，近80%的<st1>单位对博士各方面的表现满意。对博士队伍的调查表明，博士的心理素质较为健康，责任意识较强，具有较好的压力应对能力。</st1></st1></p><p><strong>（二）</strong>对国家自然科学基金获得者、中国青年科技奖和国家自然科学奖、科技进步奖、科学发明奖三大奖获奖人员以及“百千万人才工程”队<st1>伍中博士所占比例的分析表明：2001至2006年度，自然科学基金面上项目获得者中，博士的比例逐年递增。其中，青年项目负责人中博士所占比例在80%以上。中国青年科技奖获奖者中，博士比例为60.7%。2002至2007年度，获国家自然科学奖项目中第一完成人具有博士学位的比例在45%~85%之间，且呈逐年上升之势；国家技术发明奖获奖项目中第一完成人具有博士学位的比例在15%~50%之间，也是逐年上升。由此可见，我<st1>国博士已经成为高层次科学研究的骨干力量。</st1></st1></p>','1','100','news','1394186508','0');
INSERT INTO `post` (`id`,`category_id`,`model`,`title`,`alias`,`image_name`,`file_name`,`tinyint1`,`int10`,`char32`,`varchar30`,`varchar50`,`varchar100`,`varchar128`,`content`,`status`,`weight`,`view`,`created_at`,`updated_at`) VALUES
('77','20','phd','对博士心理健康教育的对策','7250cb8377e8f6169fa5c8cefa4b4fbc','','','0','0','','','','','博士作为学历教育的最高层次，是一个自我定位高、成就动机强的群体。随着教育体制的变革，博士生的招生数量逐年增加，博士生群体的规模也是逐渐扩大。在当前国际社会大环境下，我国的经济发展迅猛，就业竞争不断加剧...','<p>博士作为学历教育的最高层次，是一个自我定位高、成就动机强的群体。随着教育体制的变革，博士生的招生数量逐年增加，博士生群体的规模也是逐渐扩大。在当前国际社会大环境下，我国的经济发展迅猛，就业竞争不断加剧，社会文化不断变迁。来自学业、就业、生活等各方面的变化带给博士生们的多重压力，无疑会使他们产生激烈的心理冲突，并对他们的心理健康状况造成巨大的影响。</p><p>博士心理健康的主要影响因素。具体包括个体因素、社会因素、家庭因素和学校因素。加<st1>强博士心理教育的对策，一方面要加<st1>强博士心理健康自我调适能力的培养；另一方面，要完善、健<st1>全博士的心理健康教育机制。</st1></st1></st1></p><p>（一）建立组织保障机制</p><p>（二）完善学校教育体系</p><p>（三）建立辅导咨询机制</p><p>（四）建立心理干预机制</p><p>（五）完善导师指导制度</p><p>（六）建立心理互助机制</p>','1','100','news','1394186565','0');
INSERT INTO `post` (`id`,`category_id`,`model`,`title`,`alias`,`image_name`,`file_name`,`tinyint1`,`int10`,`char32`,`varchar30`,`varchar50`,`varchar100`,`varchar128`,`content`,`status`,`weight`,`view`,`created_at`,`updated_at`) VALUES
('78','0','single','健康服务中心','jkfwzc','','','0','0','','','','','健康服务中心','<p><strong>一、广东博士健康服务中心介绍</strong></p><p><strong></strong>广东博士健康服务中心是广东博士俱乐部有限公司专门为会员提供健康管理服务的机构。</p><p>本中心倡导“健康管理”的理念，充分凝聚广东博士俱乐部和广东健康产业促进会的博士、专家的智慧，为会员在生理、心理、道德、社会角色等方面提供健康教育、健康评估、健康干预等全方位的服务。</p><p><strong>二、广东博士健康服务中心服务内容</strong></p><p><strong>（一）健康教育</strong></p><p>健康教育由博士、专家团队通过健康咨询或健康沙龙等方式为会员传播专业的健康知识。<strong></strong></p><p><strong>（二）健康评估</strong></p><p>健康评估是由生活方式评估、体质情况评估及疾病风险评估三部分组成。</p><p>生活方式评估：通过对会员生活方式的评估，出具初级报告（生活方式对照表）。</p><p>体质情况评估：通过对会员体质情况的评估，出具初级报告（体质情况分析表）。</p><p>疾病风险评估：通过对会员既往病史、家族病史等的评估，出具疾病风险报告（风险评估表）。</p><p><strong>（三）健康干预</strong></p><p>健康干预是通过生活方式干预、营养膳食干预及根据会员体质情况所进行的其他干预形式。</p><p>生活方式干预：由博士、专家团队根据会员个体情况制定健康生活干预方案，指导会员形成健康的生活方式。</p><p>营养膳食干预：由博士、专家团队制定个性化的膳食方案，指导会员平衡膳食。</p><p><strong>三、</strong><strong>广东博士健康服务中心服务项目</strong></p><p><strong></strong>项目一：健康之旅<strong></strong></p><p>1、优生优育之旅；</p><p>2、固本培元之旅；</p><p>3、四季养生之旅；</p><p>4、延年益寿之旅；</p><p>项目二：健康食材</p><p>1、食疗</p><p>2、食材配送</p><p style=\"text-align: center; \"><img src=\"/upload/images/47f4d70087bc469d155a3fc801d38779.jpg\"></p><p style=\"text-align: center; \"></p><p style=\"text-align: center; \">
</p><p style=\"text-align: center; \"><img src=\"/upload/images/336e3cd208b85d13c58ca7ad62a3da0a.jpg\"></p><p style=\"text-align: center; \"><img src=\"/upload/images/64e8c715f8982f192ee18c8e3a915ccd.jpg\"></p>','1','100','single','1394433136','1394588456');
INSERT INTO `post` (`id`,`category_id`,`model`,`title`,`alias`,`image_name`,`file_name`,`tinyint1`,`int10`,`char32`,`varchar30`,`varchar50`,`varchar100`,`varchar128`,`content`,`status`,`weight`,`view`,`created_at`,`updated_at`) VALUES
('79','31','phd','博士后的福利待遇','7105a6994366b2b0d4a8874195d0dcd1','','','0','0','','','','','1、博士后研究人员在第一站和第二站期间的职务工资，分别按讲师职务工资标准的第四档和第五档确定。其工资构成中活的部分，按所在设站单位的类别，由设站单位(含接受留学博士回国做博士后的非设站单位)根据博士后...','<p>1、博士后研究人员在第一站和第二站期间的职务工资，分别按讲师职务工资标准的第四档和第五档确定。其工资构成中活的部分，按所在设站单位的类别，由设站单位(含接受留学博士回国做博士后的非设站单位)根据博士后研究人员的工作性质、工作特点、工作表现和实际工作量，比照所在设站单位同类人员确定。</p><p>2、各设站单位应对博士后研究人员进行定期考核，对连续两个年度考核合格的博士后研究人员，可晋升一个工资档次。</p><p>3、博士后研究人员在第一、二站工作期满分配工作后，各设站单位应将其在站期间工作、升级考核情况介绍到接受单位，在接受单位未聘任其正式专业技术职务前，仍按在站期间确定的工资标准领取工资，聘任正式专业技术职务后，按所聘职务确定相应的工资标准，但不应低于在期间的工资标准。</p><p>4、企业博士后在企业工作期间的实际收入应与企业同岗位、同资历工作人员的收入相当。如其工资、津补贴总额相对较低，差额部分由试点企业根据企业财务规定和博士后研究人员的工资情况予以补足。</p><p>5、在站的现役军人博士后研究人员，其工资待遇按军队的有关规定执行(参见《关于军队博士后流动站和现役军人博士后研究人员管理工作有关问题的通知》[1993]政联字第4号)。</p><p>6、博士后除享受同本单位正式职工一样的生活福利待遇(包括奖金、公费医疗、困难补助、探亲、书报补贴等)外，并享受每月100元的生活补贴。</p>','1','100','news','1394441556','0');
INSERT INTO `post` (`id`,`category_id`,`model`,`title`,`alias`,`image_name`,`file_name`,`tinyint1`,`int10`,`char32`,`varchar30`,`varchar50`,`varchar100`,`varchar128`,`content`,`status`,`weight`,`view`,`created_at`,`updated_at`) VALUES
('80','31','phd','博士后的日常经费和公寓管理','b5c14e91a08548fc55a13ef04cb63ac1','','','0','0','','','','','1、博士后日常经费是用于博士后人员日常生活和日常公用的专项经费，主要来源于中央财政拨款、地方财政拨款和设站单位筹资。2、人事部和财政部确定国家资助博士后日常经费标准，制定国家日常经费资助年度计划。各省...','<p>1、博士后日常经费是用于博士后人员日常生活和日常公用的专项经费，主要来源于中央财政拨款、地方财政拨款和设站单位筹资。</p><p>2、人事部和财政部确定国家资助博士后日常经费标准，制定国家日常经费资助年度计划。各省、自治区、直辖市和设站单位资助招收博士后人员，其日常经费标准参照国家规定的博士后日常经费标准。</p><p>3、留学博士回国从事博士后研究工作，国家按照博士后日常经费标准给予专门资助。</p><p>4、博士后日常经费由设站单位统一管理，单独立账，专款专用。对国家下拨的博士后日常经费，设站单位博士后工作主管部门可以提取不高于博士后日常经费总额的3%，作为博士后管理工作经费。</p><p>5、人事部和各省、自治区、直辖市人事部门负责对其下拨的博士后日常经费的管理、使用情况进行检查和监督，对违反规定使用不当的，按照有关财务规定处理。</p><p>6、国家、地方和设站单位共同出资，在设站单位和在站博士后人员数量较多的城市集中建造博士后公寓。有条件的设站单位也可自筹经费建造博士后公寓。</p><p>7、有关省、自治区、直辖市和设站单位应根据当地的实际情况制定博士后公寓管理办法。博士后公寓是在站博士后人员居住的专门住房，不得挪作他用。博士后出站时，应及时从博士后公寓中迁出。</p><p>6、博士后除享受同本单位正式职工一样的生活福利待遇(包括奖金、公费医疗、困难补助、探亲、书报补贴等)外，并享受每月100元的生活补贴。</p>','1','100','news','1394441647','1394764822');
INSERT INTO `post` (`id`,`category_id`,`model`,`title`,`alias`,`image_name`,`file_name`,`tinyint1`,`int10`,`char32`,`varchar30`,`varchar50`,`varchar100`,`varchar128`,`content`,`status`,`weight`,`view`,`created_at`,`updated_at`) VALUES
('81','0','single','广东博士长盛谷温泉养生基地','csg','','','0','0','','','','','广东博士长盛谷温泉养生基地','<p style=\"text-align: center; \"><img src=\"/upload/images/b779ac7673d4718059eea9855860fb50.jpg\" alt=\"\"></p><p><p>    广东博士长盛谷温泉养生基地是由广东博士俱乐部集团投资并倾力打造的成功人士大后方。长盛谷，土名“龟坑冚”。千百年前，当地人因此地盛产金钱龟而称该地为“龟坑冚”，赋予了长盛谷健康长寿和兴旺长盛的美好祝愿。</p><p>    长盛谷项目坐落于风景秀丽的国际健康养生旅游示范基地（中国•佛冈）汤塘镇黄花湖温泉小镇的上游，南距广州<st1>72公里，北距韶关<st1>120公里，西南距清远市<st1>68公里，占地约3000亩。峡谷内地势自东北向西南倾斜，谷长约<st1>4公里，最高处海拔<st1>499米，四周群山环抱，谷内森林资源丰富，森林植被种类近800多种，空气负离子浓度在500～10000个/cm3,植物精气萜烯类化合物浓度在30%以上，空气微生物含量在150个/m3以下，具备不可多得的天然养生资源。</st1></st1></st1></st1></st1></p><p>    长盛谷项目由广东省生态学会副理事长、著名生态景观设计专<st1>家吕健博士亲自完成整体概念规划设计，将充分凝聚<st1>广东博士、院士、专家智慧以及广东健康产业促进会汇聚的广东顶级名医资源，依托黄花湖温泉小镇、尤其是长盛谷优越的自然禀赋，对接成功人士养生、休闲的强烈需求,打造成为广东地区独具中医药特色的养生基地。</st1></st1></p></p><p style=\"text-align: center; \"></p>','1','100','single','1394587660','0');
INSERT INTO `post` (`id`,`category_id`,`model`,`title`,`alias`,`image_name`,`file_name`,`tinyint1`,`int10`,`char32`,`varchar30`,`varchar50`,`varchar100`,`varchar128`,`content`,`status`,`weight`,`view`,`created_at`,`updated_at`) VALUES
('82','11','news','广东省自主创新促进条例 ','d9c0bca8144e96a08fa403a1b34f8ac5','','','0','0','','','','','
	第一章 总 则
	第一条 
为了提高自主创新能力，推动产业转型升级，促进经济社会发展，根据有关法律、法规，结合本省实际，制定本条例。
	第二条 
本条例适用于本省行政区域内研究开发与创造...','<p style=\"text-align: center; \">
	<strong><span  style=\"font-size: 24px; \">第一章 总 则</span></strong></p><p>
	第一条 
为了提高自主创新能力，推动产业转型升级，促进经济社会发展，根据有关法律、法规，结合本省实际，制定本条例。</p><p>
	第二条 
本条例适用于本省行政区域内研究开发与创造成果、成果转化与产业化、创新型人才建设及创新环境优化等自主创新促进活动。</p><p>
	本条例所称的自主创新，是指公民、法人和其他组织主要依靠自身的努力，为拥有自主知识产权或者独特核心技术而开展科学研究和技术创新，运用机制创新、管理创新、金融创新、商业模式创新、品牌创新等手段，向市场推出新产品、新工艺、新服务的活动。</p><p>
	第三条 
促进自主创新应当坚持以企业为主体，以市场为导向，以高等学校、科学技术研究开发机构为支撑，产学研相结合，政府引导，社会参与。</p><p>
	第四条 
县级以上人民政府领导本行政区域内的自主创新促进工作，组织有关部门开展自主创新战略研究，确定自主创新的目标、任务和重点领域，发挥自主创新对经济建设和社会发展的支撑和引领作用。</p><p>
	县级以上人民政府科学技术主管部门负责本行政区域内自主创新促进工作的组织管理和统筹协调。</p><p>
	县级以上人民政府其他有关部门在各自的职责范围内，负责自主创新促进的相关工作。</p><p>
	第五条 
县级以上人民政府应当根据国民经济和社会发展规划组织编制自主创新规划，并根据自主创新规划制定年度计划。</p><p>
	县级以上人民政府应当加大财政性资金投入，并制定相关的产业、技术等政策，引导社会资金投入，保障自主创新经费持续稳定增长，使其与自主创新活动相适应。</p><p style=\"text-align: center; \"><strong><span   style=\"font-size: 24px; \">第二章 研究开发与创造成果</span></strong></p><p>
	第六条 
县级以上人民政府应当鼓励和支持开展原始创新、集成创新和引进消化吸收再创新活动，创造具有市场竞争力的自主创新成果。</p><p>
	第七条 
省人民政府设立的省级自然科学基金，以及与国家相关部门联合设立的自然科学基金，应当资助高等学校、科学技术研究开发机构、企业、科学技术社会团体和科学技术人员开展基础研究和科学前沿探索，提高原始创新能力，创造原创性成果。</p><p>
	第八条 
各级人民政府应当支持企业、事业单位通过技术合作、技术外包、专利许可或者建立战略联盟等方式，对各种现有技术进行集成创新，促进产业关键共性技术研发、系统集成和工程化条件的完善，形成有市场竞争力的产品或者新兴产业。</p><p>
	第九条 
省人民政府应当根据国家和本省的产业政策和技术政策，编制鼓励引进先进技术、装备的指南，引导企业、事业单位引进先进技术、装备，并进行消化、吸收和再创新。</p><p>
	限制引进国内已具备研究开发能力的关键技术、装备，禁止引进高消耗、高污染和已被淘汰的落后技术、装备。</p><p>
	第十条 
利用财政性资金或者国有资本引进重大技术、装备的，应当编制引进消化吸收再创新方案，明确消化吸收再创新的计划、目标、进度，并经地级市以上人民政府科学技术主管部门联合有关部门组织的专家委员会进行论证。</p><p>
	经批准引进重大技术、装备的，应当按照前款规定编制的方案进行消化吸收再创新。</p><p>
	通过消化吸收拥有自主知识产权或者独特核心技术、形成自主创新能力，应当作为对引进重大技术、装备进行评估和验收时的重要依据。</p><p>
	第十一条 县级以上人民政府应当整合本级有关自主创新财政性资金，坚持统筹使用，分项管理。</p><p>
	县级以上人民政府确定利用财政性资金设立自主创新项目，应当坚持宏观引导、平等竞争、同行评审、择优支持的原则；确定利用财政性资金设立自主创新项目的项目承担者，应当按照国家和省有关规定执行。</p><p>
	县级以上人民政府财政、科学技术主管部门应当会同有关部门建立和完善有关自主创新财政性资金的绩效评价制度，提高有关自主创新财政性资金的使用效益。</p><p>
	第十二条 
利用财政性资金或者国有资本购置、建设的大型科学仪器设施，应当依法履行共享使用义务，为公民、法人和其他组织开展自主创新活动提供共享服务。</p><p>
	鼓励以社会资金购置、建设的大型科学仪器设施所在单位向社会提供共享服务。</p><p>
	地级市以上人民政府应当采取有效措施，支持公民、法人和其他组织共享大型科学仪器设施开展自主创新活动。</p><p>
	第十三条 
申请利用财政性资金或者国有资本新购、新建大型科学仪器设施的，申请报告或者项目可行性研究报告应当包括共享服务承诺，明确共享时间、范围、方式等内容。</p><p>
	本省已有大型科学仪器设施的共享服务能够满足相关科学研究和技术开发活动需要的，主管部门不再批准利用财政性资金新购、新建大型科学仪器设施。</p><p>
	第十四条 
省人民政府科学技术主管部门负责对大型科学仪器设施共享进行统筹协调，建立和完善大型科学仪器设施共享服务平台，向社会提供大型科学仪器设施共享的信息查询、服务推介等服务管理工作。</p><p>
	利用财政性资金或者国有资本购置、建设大型科学仪器设施的管理单位，应当在完成安装、调试验收之日起一个月内，向省人民政府科学技术主管部门报送大型科学仪器设施的名称型号、应用范围、服务内容等基本信息。本条例实施前购置、建设的，应当在本条例实施之日起两个月内报送有关基本信息。</p><p>
	省人民政府科学技术主管部门应当在收到本条第二款规定的基本信息之日起一个月内通过统一的信息平台向社会公布。</p><p>
	利用财政性资金或者国有资本购置、建设的大型科学仪器设施，向社会提供共享服务需要收取费用的，收费标准由价格主管部门依法制定。收取的费用，应当用于大型科学仪器设施的建设、维护和管理。</p><p>
	第十五条 
县级以上人民政府及其科学技术、发展改革、经济和信息化等有关主管部门应当在政策、规划、资金、人才、场所等方面支持在产业集群区域和具有产业优势的领域建立公共研究开发平台、公共技术服务平台、科学技术基础条件平台等公共创新平台，为科技型中小企业技术创新提供关键共性技术研究开发、信息咨询、技术交易转让等创新服务。</p><p>
	利用财政性资金资助建设的公共创新平台为企业、事业单位的自主创新活动提供服务的情况，应当作为考核其运行绩效的重要内容，但涉及国家秘密或者重大公共安全的除外。</p><p>
	第十六条 
支持企业、高等学校和科学技术研究开发机构共建博士后科研工作站、博士后创新实践基地、产学研创新联盟或者产学研结合基地，引导人才、资金、技术、信息等创新要素向企业集聚，推进产学研合作。</p><p>
	第十七条 
县级以上人民政府应当促进军用与民用科学技术在基础研究、应用研究开发、创新成果转化与产业化等方面的衔接与协调，推动军用与民用科学技术有效集成、资源共享和交流协作。</p><p>
	支持企业、高等学校和科学技术研究开发机构参与承担国防科学技术计划任务，鼓励军用科学技术研究开发机构承担民用科学技术项目。</p><p>
	第十八条 
鼓励与香港特别行政区、澳门特别行政区、台湾地区的企业、高等学校、科学技术研究开发机构、科学技术社会团体联合开展科学技术攻关、共建科学技术创新平台等自主创新合作，推进创新要素的流动、组合、集成和共享。</p><p>
	第十九条 
企业、高等学校、科学技术研究开发机构、科学技术社会团体和科学技术人员依法开展国际科学技术合作与交流，合作设立研究开发机构的，县级以上人民政府及其有关部门应当在出入境管理、注册登记、信息服务等方面提供便利条件。</p><p>
	境外的企业、高等学校、科学技术研究开发机构、学术团体、行业协会等组织，可以依法在本省独立兴办研究开发机构。</p><p>
	第二十条 
地级市以上人民政府及其有关部门应当设立软科学研究项目，支持开展战略规划、政策法规、项目论证等方面的软科学研究，促进自然科学与人文社会科学的交叉融合，为科学决策提供理论与方法。</p><p>
	第二十一条 
各级人民政府应当依法保护企业、事业单位的商业模式创新活动，制定激励扶持政策，引导企业、事业单位采用合同能源管理、重大技术设备融资租赁、电子商务等商业模式提升商业运营能力。</p><p>
	支持企业、事业单位利用互联网或者新技术，优化内部流程和整合外部资源，开发使用信息管理技术，开展产业链融合重组，推进运营模式创新。</p><p>
	第二十二条 
县级以上人民政府应当加强自主品牌与区域品牌的培育和保护工作，重点推进战略性新兴产业、先进制造业、现代服务业、优势传统产业、现代农业等产业领域的企业品牌建设。</p><p>
	第二十三条 
县级以上人民政府应当制定和实施知识产权战略，促进专利权、商标权和著作权等知识产权的创造和运用，加强对自主知识产权的保护和管理。</p><p>
	地级市以上人民政府应当组织专家，对利用财政性资金或者国有资本设立的重大自主创新项目涉及的知识产权状况、知识产权风险等进行评议。</p><p>
	第二十四条 
县级以上人民政府应当制定激励扶持政策，有条件的设立技术标准专项资金，支持企业、事业单位、行业协会主导或者参与国际标准、国家标准、行业标准和地方标准的制定和修订，推动自主创新成果形成相关技术标准。</p><p>
	鼓励企业、事业单位、行业协会在自主创新活动中实行科研攻关与技术标准研究同步，自主创新成果转化与技术标准制定同步，自主创新成果产业化与技术标准实施同步。</p><p style=\"text-align: center; \"><strong><span   style=\"font-size: 24px; \">第三章 成果转化与产业化</span></strong></p><p>
	第二十五条 
县级以上人民政府应当制定相关扶持政策，通过无偿资助、贷款贴息、补助资金、保费补贴和创业风险投资等方式，支持自主创新成果转化与产业化，引导企业加大自主创新成果转化与产业化的投入。</p><p>
	第二十六条 
省人民政府应当定期发布自主创新技术产业化重点领域指南，优先支持高新技术产业、先进制造业、现代服务业和战略性新兴产业自主创新成果的转化与产业化活动。</p><p>
	支持企业、高等学校、科学技术研究开发机构利用留学人员科技交流会、高新技术成果交易会等人才与科技信息交流平台，吸引国内外高层次人才在本省实施创新成果转化与产业化。</p><p>
	第二十七条 
高等学校、科学技术研究开发机构和企业按照国家有关规定，可以采取科技成果折股、知识产权入股、科技成果收益分成、股权奖励、股权出售、股票期权等方式对科学技术人员和经营管理人员进行股权和分红激励，促进自主创新成果转化与产业化。</p><p>
	第二十八条 县级以上人民政府应当支持企业发展成为具有自主知识产权、自主品牌和持续创新能力的创新型企业。</p><p>
	省级以上创新型企业应当组建研究开发院，制定企业创新发展战略，整合优化各类创新资源，从事核心技术、关键技术和公共技术研究。</p><p>
	经省人民政府科学技术主管部门会同有关部门组织认定的省级创新型企业，可以优先承担省级自主创新重大专项，其相关研究开发和产业化涉及的资金及用地优先予以保障。</p><p>
	第二十九条 
县级以上人民政府应当支持高等学校、科学技术研究开发机构和企业完善技术转移机制，引导高等学校、科学技术研究开发机构的自主创新成果向企业转移或者实施许可。</p><p>
	使用本省财政性资金的自主创新成果，项目承担者应当在项目验收之后三个月内向省人民政府科学技术主管部门报送成果信息及其技术转移情况。自主创新成果信息及其技术转移情况应当通过统一的信息平台向社会公开，但依照国家和省有关规定不能公开的除外。</p><p>
	第三十条 
高等学校、科学技术研究开发机构将其职务创新成果转让给他人的，应当从技术转让所得的净收入中提取不低于百分之三十的比例，奖励完成该项创新成果及其转化做出重要贡献的人员。</p><p>
	高等学校、科学技术研究开发机构采用技术作价入股方式实施转化的，应当从职务创新成果作价所得股份中提取不低于百分之三十的份额，奖励完成该项创新成果及其转化做出重要贡献的人员。</p><p>
	高等学校、科学技术研究开发机构可以与完成该项创新成果及其转化做出重要贡献的人员约定高于前两款规定比例的奖励。</p><p>
	第三十一条 
利用本省财政性资金资助的自主创新项目，项目立项部门应当与高等学校、科学技术研究开发机构和企业等项目承担者就项目形成的创新成果约定知识产权目标和实施转化期限，并在项目验收时对约定事项进行考核评价。</p><p>
	第三十二条 
利用本省财政性资金设立的科学技术基金项目或者科学技术计划项目所形成的发明专利权、计算机软件著作权、集成电路布图设计专有权和植物新品种权，由项目承担者依法取得，但法律、法规另有规定的除外。</p><p>
	项目承担者应当依法实施前款规定的知识产权，采取保护措施，并向项目立项部门提交实施和保护情况的年度报告。约定的实施转化期限届满之日起两年内，项目承担者和创新成果完成人没有依法或者依照约定实施转化的，省人民政府为了国家安全、国家利益和重大社会公共利益的需要，可以无偿实施，也可以许可他人有偿实施或者无偿实施。</p><p>
	第三十三条 
高等学校、科学技术研究开发机构取得的具有实用价值的职务创新成果，在约定的实施转化期限届满之日起一年内未实施转化的，在不变更职务创新成果权属的前提下，创新成果完成人可以根据与本单位的协议或者经本单位同意，进行创新成果转化，并依法或者依协议享受权益。</p><p>
	高等学校、科学技术研究开发机构主要利用财政性资金项目取得的具有实用价值的职务创新成果，本单位在约定的实施转化期限届满之日起三年内仍未实施转化的，在不变更职务创新成果权属的前提下，经项目立项部门同意，创新成果完成人可以实施转化。</p><p>
	第三十四条 
自主知识产权首次转化使用在本省的，项目所在地的县级以上人民政府应当制定有关政策措施，在项目立项、土地、场所等方面给予支持。</p><p>
	第三十五条 
地级市以上人民政府有关主管部门应当完善促进自主创新成果转化与产业化的科学技术人员考核评价制度。</p><p>
	有关主管部门应当将自主创新成果转化与产业化情况作为科学技术人员项目申报、成果奖励的依据，并作为职称评审、岗位聘用的评价内容，但基础理论研究等学科除外。</p><p>
	第三十六条 
县级以上人民政府及其有关主管部门应当支持知识产权服务机构、技术交易机构、科技咨询与评估机构、科技企业孵化器、创业投资服务机构和生产力促进中心等科学技术中介服务机构的发展。建立和推行政府购买科技公共服务制度，对科技创新计划、先进技术推广、扶持政策落实等专业性、技术性较强的工作，可以委托给符合条件的科学技术中介服务机构办理。</p><p>
	科学技术中介服务机构应当为企业、高等学校、科学技术研究开发机构提供研发服务、知识产权服务、检测服务、创意设计、技术经纪、科学技术培训、科学技术咨询与评估、创业风险投资、科技企业孵化、技术转移与推广等科学技术中介服务，促进自主创新成果的转化和产业化。</p><p>
	科学技术中介服务机构应当将业务范围、执业人员、中介服务情况等基本信息报送地级市以上人民政府科学技术主管部门，并由地级市以上人民政府科学技术主管部门向社会公布。</p><p>
	第三十七条 
科学技术中介服务业应当建立行业自律制度。科学技术中介服务机构及其从业人员，应当遵守相关法律、法规，按照公平竞争、平等互利和诚实信用的原则开展业务活动。</p><p>
	科学技术中介服务机构及其从业人员不得有下列行为：</p><p>
	（一）提供虚假的评估、检测结果或者鉴定结论；</p><p>
	（二）泄露当事人的商业秘密或者技术秘密；</p><p>
	（三）欺骗委托人或者与一方当事人串通欺骗另一方当事人；</p><p>
	（四）其他损害国家利益和社会公共利益的行为。</p><p>
	第三十八条 
省人民政府可以根据本省产业布局、经济可持续发展等需要批准建立省级高新技术产业开发区，支持省级以上高新技术产业开发区发展成为国家自主创新示范区。</p><p>
	县级以上人民政府应当支持高新技术产业开发区的建设、发展，引导高新技术产业开发区发展特色和优势高新技术产业、先进制造业、现代服务业和战略性新兴产业。</p><p>
	县级以上人民政府应当支持发展民营科技企业，推动具备条件的民营科技产业园区和产业转移园区发展成为省级以上高新技术产业开发区。</p><p>
	第三十九条 
县级以上人民政府应当促进主导产业集聚发展，提高专业化配套协作水平，完善产业链，促进发展形成专业镇或者产业集群。</p><p>
	专业镇或者产业集群应当集聚高新技术和先进技术，支持企业开展技术创新活动，提升特色和优势传统产业集群科学技术水平。</p><p>
	第四十条 
县级以上人民政府应当支持农业基础研究、新品种选育和新技术研究开发，对地域特征明显且申请条件成熟的特色、优势农产品实行地理标志保护。</p><p>
	第四十一条 
鼓励公民、法人和其他组织开展资源与环境、人口与健康、文化创意、节能减排、公共安全、防震减灾、城市建设等领域的自主创新活动，应用先进创新技术及成果促进社会事业发展。</p><p>
	第四十二条 
地级市以上人民政府可以依法发起设立或者参与设立创业投资引导基金，引导社会资金流向创业投资企业，引导创业投资企业向具有良好市场前景的自主创新项目、初创期科技型中小企业投资。</p><p>
	鼓励和支持建立科技金融机构，开展知识产权质押融资、保险、风险投资、证券化、信托等金融创新服务。保险机构可以根据自主创新成果转化与产业化的需要开发保险品种。</p><p>
	鼓励创新型企业上市融资，支持未上市的创新型企业在证券公司代办股份转让系统挂牌。</p><p>
	第四十三条 
县级以上人民政府应当健全政府采购制度，对公民、法人或者其他组织研究开发形成的新技术、新产品、新成果，在性能、技术等指标能够满足政府采购需求的条件下，政府采购应当购买；首次投放市场的，政府采购应当率先购买。</p><p style=\"text-align: center; \"><strong><span   style=\"font-size: 24px; \">第四章 创新型人才建设与服务</span></strong></p><p>
	第四十四条 
地级市以上人民政府应当定期制定创新型人才发展规划和紧缺人才开发目录，加强创新型人才的培养和引进工作。</p><p>
	县级以上人民政府应当优先保证对创新型人才建设的财政投入，保障人才发展重大项目的实施。</p><p>
	第四十五条 
地级市以上人民政府应当制定和完善培养、引进创新型人才的政策措施，并为创新型人才在企业设立、项目申报、科研条件保障和出入境、户口或者居住证办理、住房、子女入学、配偶安置等方面提供便利条件。</p><p>
	地级市以上人民政府科学技术主管部门应当会同有关部门组织引进优先发展产业急需的创新科研团队和领军人才。</p><p>
	创新型人才认定、管理与服务的具体办法由省人民政府另行制定。</p><p>
	第四十六条 
县级以上人民政府应当支持企业、高等学校、科学技术研究开发机构建立创新型人才培养机制，以及开展岗位实践、在职进修、学术交流等人才培训活动。</p><p>
	第四十七条 
鼓励高等学校、科学技术研究开发机构选派科学技术人员参与企业自主创新活动，开展成果转化的研究攻关；鼓励企业选派专业技术人员到高等学校、科学技术研究开发机构开展自主创新课题研究。</p><p>
	第四十八条 
企业、高等学校、科学技术研究开发机构等有关单位应当创新人才培养模式，结合本省自主创新的目标、任务和重点领域开展相关的创新实践活动，培养急需、紧缺的创新型人才。</p><p>
	企业、高等学校、科学技术研究开发机构等有关单位应当建立创新型人才的激励机制，完善岗位工资、绩效工资、年薪制和奖励股票期权等分配方式。</p><p>
	第四十九条 鼓励有关单位和科学技术人员在自主创新活动中自由探索、勇于承担风险。</p><p>
	对于以财政性资金或者国有资本为主资助的探索性强、风险性高的自主创新项目，原始记录证明承担项目的单位和科学技术人员已经履行了勤勉尽责义务仍不能完成的，经立项主管部门会同财政主管部门或者国有资产管理部门组织的专家论证后，可以允许该项目结题。相关单位和个人继续申请利用财政性资金或者国有资本设立的自主创新项目不受影响。</p><p>
	第五十条 
公民、法人或者其他组织从事自主创新活动，应当恪守学术道德，不得弄虚作假或者抄袭、剽窃、篡改他人创新成果。</p><p>
	公民、法人或者其他组织在申请政府设立的自主创新项目、科学技术奖励及荣誉称号，以及申请享受各种创新扶持政策时，应当诚实守信，提供真实可靠的数据、资料和信息。</p><p>
	政府设立的自主创新项目的管理机构，应当为承担项目的科学技术人员和组织建立科研诚信档案，并建立科研诚信信息共享机制。科研诚信情况应当作为专业技术职务职称评聘、自主创新项目立项、科研成果奖励等的重要依据。</p><p style=\"text-align: center; \"><strong><span   style=\"font-size: 24px; \">第五章 激励与保障</span></strong></p><p>
	第五十一条 
县级以上人民政府科学技术、发展改革、经济和信息化、财政、税务等有关部门应当落实国家和省促进自主创新的税收、金融等优惠政策，加强宣传引导工作，制定办事指南，简化办事程序，为企业、事业单位和科学技术人员享受有关优惠政策提供便捷服务。</p><p>
	第五十二条 
科学技术重点基础设施、重大科学技术工程等建设项目应当纳入土地利用总体规划、城乡规划和政府投资计划。</p><p>
	对高新技术企业和省级以上创新型企业的生产性建设用房、科研机构科研用房，以及省级以上的工程技术中心、企业技术中心、企业研究开发院、重点实验室、中试基地、科普场馆等建设工程，依照国家规定减免城市基础设施配套费。</p><p>
	第五十三条 
省级以上产业园区的战略性新兴产业、高新技术产业的研究开发项目用地，依法可以采取协议出让等方式取得，但不得擅自转让、改变用途；确需转让或者改变用途的，应当报请有批准权的人民政府批准。</p><p>
	第五十四条 
各级人民政府应当逐步提高科学技术经费的财政投入总体水平，财政用于科学技术经费的增长幅度，应当高于本级财政经常性收入的增长幅度。</p><p>
	引导社会加大对自主创新的投入，逐步提高研究与开发经费占地区生产总值的比例，二〇一五年全省应当达到百分之二点三以上，此后应当逐步增长。</p><p>
	第五十五条 
对高等学校、科学技术研究开发机构和企业自筹资金研究开发并具有自主知识产权的自主创新项目，县级以上人民政府可以采取后补助方式予以财政性资金资助。资助资金应当用于该项目在本省的后续研究开发、成果转化和产业化活动。</p><p>
	第五十六条 
利用本省财政性资金设立的自主创新项目，承担项目人员的人力资源成本费可以从项目经费中支出，最高不超过该项目经费的百分之三十；其中，软科学研究项目和软件开发类项目，人力资源成本费最高不超过该项目经费的百分之五十。</p><p>
	第五十七条 
利用本省财政性资金设立的自主创新项目的主管部门，应当建立评审专家库，建立健全自主创新项目的专家评审制度和评审专家的遴选、回避、问责制度。</p><p>
	利用财政性资金设立的自主创新项目及其承担者的情况，应当由项目主管部门向社会公开，但依照国家和省有关规定不能公开的除外。</p><p>
	第五十八条 财政性自主创新资金应当专款专用，任何组织或者个人不得虚报、冒领、贪污、挪用、截留。</p><p>
	县级以上人民政府审计机关和财政主管部门应当依法对财政性自主创新资金的管理和使用情况进行监督检查。</p><p>
	第五十九条 
县级以上人民政府应当建立科学技术奖励制度，创新奖励模式，对在科学技术进步活动和自主创新工作中做出重要贡献的单位和个人给予奖励。</p><p>
	鼓励社会力量设立科学技术奖项，对在科学技术进步活动和自主创新工作中做出重要贡献的单位和个人给予奖励。</p><p>
	单位和个人在申报或者推荐各类科学技术奖项时，应当提供真实可靠的科研数据和评审材料，不得骗取或者协助他人骗取科学技术奖励。</p><p>
	第六十条 
单位和个人可以依法捐赠财产或者设立科学技术基金资助本省自主创新活动，并可以依法享受税收优惠政策。</p><p>
	第六十一条 
省人民政府科学技术主管部门应当会同省人民政府统计机构建立健全自主创新统计制度，对全省自主创新发展状况进行监测、分析和评价，全面监测自主创新活动、能力、水平和绩效。</p><p>
	全省自主创新主要统计指标应当定期向社会公布。</p><p>
	第六十二条 省人民政府应当建立自主创新考核制度，考核市、县人民政府推动自主创新的工作实绩。</p><p>
	第六十三条 各级国有资本经营预算应当安排适当比例的资金用于国有企业自主创新，并逐年增加。</p><p>
	国有企业应当加大自主创新投入，建立健全自主创新人才建设机制和创新收益分配制度。</p><p>
	县级以上人民政府有关部门应当完善国有企业考核评价制度，应当将企业的创新投入、创新能力建设、创新成效等情况纳入国有企业及其负责人的业绩考核范围。</p><p>
	第六十四条 
县级以上人民政府应当引导社会培育创新精神，形成崇尚创新、勇于突破、激励成功、宽容失败的创新文化。</p><p>
	机关、企业、事业单位、社会团体、新闻媒体应当开展科学技术普及和宣传工作，鼓励和支持开展群众性技能竞赛、技术创新和发明创造活动，提高公众科学素质。</p><p style=\"text-align: center; \"><strong><span   style=\"font-size: 24px; \">第六章 法律责任</span></strong></p><p>
	第六十五条 
违反本条例第十条第二款规定，未按照编制方案进行消化吸收再创新的，由地级市以上人民政府科学技术主管部门责令其限期改正；逾期不改正的，不予通过验收，并由其主管部门对直接负责的主管人员和其他直接责任人员依法给予处分，三年内不得申请市级以上自主创新项目和科学技术奖励。</p><p>
	第六十六条 
违反本条例第十二条第一款规定，不依法履行共享使用义务的，由省人民政府科学技术主管部门责令改正，通报批评，并由其主管部门对直接负责的主管人员和其他直接责任人员给予处分；拒不改正的，大型科学仪器设施管理单位三年内不得申请市级以上自主创新项目和科学技术奖项，且不得利用财政性资金新购、新建大型科学仪器设施。</p><p>
	第六十七条 
违反本条例第十四条第二款、第二十九条第二款规定，不依照规定报送相关信息的，由主管部门责令改正；拒不改正的，给予通报批评。</p><p>
	第六十八条 
违反本条例第三十七条第二款规定，由地级市以上人民政府科学技术主管部门责令改正，并予以警告，没收违法所得，并处违法所得一倍以上五倍以下的罚款；没有违法所得的，处一万元以上三万元以下的罚款；情节严重的，依法由相关部门吊销营业执照和资格证书；给他人造成经济损失的，依法承担民事责任；构成犯罪的，依法追究刑事责任。</p><p>
	第六十九条 
违反本条例第五十条第二款、第五十九条第三款规定，提供虚假的数据、资料、信息或者评审材料的，由主管部门给予通报批评，取消已获得的荣誉称号或者科学技术奖项，追回已资助的财政性资金，并记入科研诚信档案；情节严重的，依法给予处分，五年内该单位或者直接责任人员不得申报自主创新项目或者科学技术奖项。</p><p>
	第七十条 
违反本条例第五十八条第一款规定，虚报、冒领、贪污、挪用、截留财政性自主创新资金的，依照国家和省有关规定责令改正，追回有关财政性资金和违法所得，依法给予行政处罚；对直接负责的主管人员和其他直接责任人员依法给予处分；构成犯罪的，依法追究刑事责任。</p><p>
	第七十一条 
科学技术等主管部门及其工作人员违反本条例规定，有下列情形之一的，由监察机关或者其主管部门对直接负责的主管人员和其他直接责任人员依法给予处分；构成犯罪的，依法追究刑事责任：</p><p>
	（一）未按照本条例第十条第一款规定组织专家委员会对引进消化吸收再创新方案进行论证的；</p><p>
	（二）未按照本条例第十三条第二款规定，予以批准新购、新建大型科学仪器设施的；</p><p>
	（三）未依法对财政性自主创新资金的管理和使用情况进行监督检查的；</p><p>
	（四）有其他滥用职权、玩忽职守、徇私舞弊行为的。</p><p style=\"text-align: center; \"><strong><span   style=\"font-size: 24px; \">第七章 附 则</span></strong></p><p>
	第七十二条 本条例自2012年3月1日起施行。</p>','1','100','news','1394606050','1394606658');
INSERT INTO `post` (`id`,`category_id`,`model`,`title`,`alias`,`image_name`,`file_name`,`tinyint1`,`int10`,`char32`,`varchar30`,`varchar50`,`varchar100`,`varchar128`,`content`,`status`,`weight`,`view`,`created_at`,`updated_at`) VALUES
('83','11','news','广东省科学技术厅 关于省级科技计划项目管理的暂行办法 ','b2e2e3a0676d28fdffc7ea86a477ded6','','','0','0','','','','','
	第一章　总则
	第一条 为规范省级科技计划项目的管理，提高管理效率，保证省级科技计划项目管理的科学、公开和公正，制定本办法。
	第二条 省级科技计划项目（以下简称项目）是指列入省级科技计划，...','<p style=\"text-align: center; \"><strong>
	<span   style=\"font-size: 24px; \">第一章　总则</span></strong></p><p>
	第一条 为规范省级科技计划项目的管理，提高管理效率，保证省级科技计划项目管理的科学、公开和公正，制定本办法。</p><p>
	第二条 省级科技计划项目（以下简称项目）是指列入省级科技计划，通过省财政科技经费支持或以科技政策扶持、引导，由独立法人单位承担，并在一定时期内组织实施的科学研究、技术开发、成果转化及相关科技活动。</p><p>
	按照经费组织形式，省级科技计划分为专项经费资助计划和支撑引导计划两类。</p><p>
	专项经费资助计划是指省财政专项列支，用于特定科技领域或特定工作任务的科技计划，主要包括战略性新兴产业发展科技专项计划、产学研合作计划、重大科技专项、高新区发展引导计划、中小企业创新资金、重点实验室体系建设计划、主体科研机构创新能力建设计划等。</p><p>
	支撑引导计划是指运用产业技术研究开发资金、科学事业费等其他财政资金，为落实其他科技发展任务而设立的科技计划，包括工业攻关计划、农业攻关计划、社会发展攻关计划、促进科技服务业发展计划、成果推广计划、对外科技合作计划、科技基础条件建设计划、专业镇建设计划、火炬计划、星火计划、软科学研究计划、创新型企业院线提升计划、民营科技园计划、科普计划等。</p><p>
	根据工作职能，省级科技计划的具体类别可进行调整。</p><p>
	第三条 本办法适用于广东省科学技术厅（以下简称省科技厅）主管的省级科技计划项目的申报与受理、评审与立项、实施与管理、结题与验收、绩效评估等管理工作。各类科技计划管理上有其他要求的，在本办法基础上另行制定专项管理办法。</p><p>
	第四条 省科技厅是省级科技计划的管理部门，根据职能及省政府相关规定单独或会同其他职能部门对科技计划的设立、编制、申报、组织实施和监督进行综合协调管理。</p><p>
	省科技厅根据科技计划管理工作需要，可依照有关规定选择中介机构承担或协助办理有关具体事务。</p><p style=\"text-align: center; \"><strong>
	<span   style=\"font-size: 24px; \">第二章　申报与受理</span></strong></p><p>
	第五条 省科技厅根据全省经济、社会、科技发展规划和战略，在调研相关科技领域的基础上制定各类科技计划入库项目申报指南。</p><p>
	第六条 科技计划入库项目申报指南应在各类科技计划项目申请工作启动之前面向社会公开发布，明确申请条件和要求、申报时间和方式以及项目的组织形式。</p><p>
	第七条 省科技厅按入库项目申报指南要求受理项目申报，招标投标项目按照相关专项计划管理办法执行。</p><p>
	面向社会的项目管理业务统一通过省科技厅业务受理窗口（以下简称“受理窗口”）办理。</p><p>
	第八条 申请项目的申请者应当符合以下基本条件：</p><p>
	（一）必须以独立法人单位名义申请，暂不受理个人名义申报；</p><p>
	（二）符合该计划对申请者的主体资格要求；</p><p>
	（三）具有完成项目必备的人才条件和技术装备；</p><p>
	（四）具有与项目相关的研究积累；</p><p>
	（五）具有完成项目所需的组织管理和协调能力；</p><p>
	（六）具有完成项目的良好信誉度。</p><p>
	第九条 承担项目2项以上（含2项）未完成的负责人，不得申报新的项目；项目负责人同一年度不得申报2项以上（含2项）的项目，违者取消当年申报资格及所申报项目。</p><p>
	项目参与者前3名视为项目主要承担人。</p><p>
	第十条 项目必须按照规定渠道（书面申报或网上申报）和时限进行申报。省直和国家驻粤机构申报的项目需经其省级或属地主管部门审查推荐；各地级以上市、县企业和事业单位申报的项目必须通过各地级以上市、县以上科技行政部门审查和推荐。</p><p>
	第十一条 申请项目应填写及提供以下材料：</p><p>
	（一）《广东省科技计划项目申报书》；</p><p>
	（二）《广东省科技计划项目可行性报告》；</p><p>
	（三）申报单位认为与所申报项目直接相关的其他说明材料，如单位资质证明、项目查新报告、单位财务报表、前期研究成果及工作基础材料、合作协议等。</p><p>
	第十二条 各省直主管部门和地级以上市、县科技行政部门对其行政区域范围内企业和事业单位提交的项目申报材料进行审查和推荐，并将项目书面申报材料送受理窗口；县级科技行政部门推荐的项目申报材料应委托其所隶属的地级以上市科技行政部门统一收集后送交受理窗口。</p><p>
	对于通过网上申报的项目，各省直主管部门和地级以上市、县科技行政部门通过网络进行审查和推荐。</p><p>
	受理窗口对所受理的项目申报材料进行审查和受理。</p><p>
	第十三条 申报审查。省科技厅将对申报项目进行审查，审查通过的申报项目将进入省科技计划项目备选项目库；如项目以各种方式进行重复申请或申报材料不符合申报指南要求，取消该项目入库资格。</p><p style=\"text-align: center; \"><strong>
	<span   style=\"font-size: 24px; \">第三章　评审与立项</span></strong></p><p>
	第十四条 项目实行专家评审与行政决策相结合的立项审批制度。项目立项的基本程序为：专家评审（评估）、省科技厅相关业务处审核、厅务会审定。</p><p>
	第十五条 专家评审（评估）意见是项目立项的重要参考依据。</p><p>
	各省直主管部门或地级以上市科技局推荐项目的专家评审（评估）工作由省科技厅组织或委托中介机构、地级以上市科技局组织，对评审（评估）工作进行指导和监督。</p><p>
	专家对进入备选项目库的申报项目采取书面评审、现场考察和答辩三种方式之一或多种方式相结合的方式进行论证，实行网络化评审的项目，相关专家在网络上直接进行评审。</p><p>
	第十六条 所有参与项目评审（评估）以及相关咨询的专家应从省科技咨询专家库中遴选。</p><p>
	全省科技咨询专家库由省科技厅负责建设和管理，日常管理和维护工作可委托中介机构承担。</p><p>
	第十七条 承担项目评审（评估）具体工作的中介机构应通过竞争产生，省科技厅负责中介机构的遴选、绩效和信用评价等。</p><p>
	第十八条 省科技厅各业务处在专家评审结果的基础上对申报项目进行初审，提出初步立项建议。</p><p>
	省科技厅综合管理部门组织相关业务处对专家评审意见和各业务处初审意见进行复审，提出综合意见后报厅务会议审定。</p><p>
	第十九条 通过全部评审程序的项目获得立项。获准立项的各类项目，由省科技厅或与省财政厅下达文件。相关单位和项目申请者可通过省科技厅官方网站在线查询。</p><p>
	第二十条 各类项目承担单位必须在项目下达后1个月内与省科技厅签订《广东省科技计划项目合同书》（以下简称合同书）。</p><p style=\"text-align: center; \"><strong>
	<span   style=\"font-size: 24px; \">第四章　实施与管理</span></strong></p><p>
	第二十一条 项目承担单位应认真履行合同书的各项约定，按时完成项目任务；省科技厅对项目负责人、承担单位、项目推荐单位、科技行政部门的项目管理责任人、项目的评审（评估）专家和中介机构实行信用评价制度。</p><p>
	第二十二条 省科技计划项目实施情况实行报告制度。</p><p>
	（一）年度执行报告。项目承担单位、被授权或委托负责项目组织实施的管理机构，须按要求每年向省科技厅报告在研项目的实施情况和经费使用情况。</p><p>
	（二）调整报告。如遇目标调整、内容更改、项目负责人变更、关键技术方案的变更、不可抗力因素等对项目执行产生重大影响的情况，应及时向省科技厅报告，并提出延期完成、修改（调整）完成、终止执行或撤销项目等调整申请报告。省科技厅根据项目的实际情况进行处理，并将处理意见反馈申请单位。</p><p>
	（三）重要事件报告。如项目取得重大进展、突破，或发生可能影响合同按期完成的重大事件或难以协调的问题，项目承担单位及被授权或委托负责项目组织实施的管理机构须向省科技厅及时报告。</p><p>
	（四）验收报告。项目结题验收时，项目负责人须向省科技厅或受委托组织验收活动的机构提交所要求的项目验收报告。</p><p>
	（五）成果报告。项目结题验收后，项目负责人须向省科技厅报送项目形成的专利、知识产权等成果信息报告。</p><p>
	（六）监理报告。受省科技厅委托对重大科技项目实施监理的中介机构，每年初要向省科技厅提交上一年度的项目监理报告。</p><p>
	第二十三条 项目未能正常实施或经费使用不合理的，项目承担单位的主管部门和项目监理部门责令项目承担单位进行整改，对有严重过错并且整改不力的，可停止其项目实施，并向省科技厅提交收回项目相关财政经费的建议。</p><p>
	第二十四条 对终止执行的项目，因不可抗力因素造成的，项目承担单位应向省科技厅上缴尚未使用的财政经费；因人为因素或研究计划设计不合理造成的，除应向省科技厅上缴尚未使用的财政经费外，省科技厅将降低项目承担单位和项目负责人的信用等级，两年内不再受理负责人申报项目。</p><p style=\"text-align: center; \"><strong>
	<span   style=\"font-size: 24px; \">第五章　结题与验收</span></strong></p><p>
	第二十五条 省科技厅应在项目实施期间对项目进行专项检查，项目承担单位须如实提供项目实施进度、研究成果和经费使用情况等信息。</p><p>
	第二十六条 项目实施完成后，必须进行验收，项目验收分为会议验收和材料验收两种形式。验收工作须在项目完成后半年内完成；提前完成的项目，可以提前验收。</p><p>
	项目验收前，项目承担单位通过其主管部门向省科技厅提出验收申请。经各级项目主管单位或部门审批后，省科技厅将组织或委托项目承担单位的主管部门组织项目验收。</p><p>
	第二十七条 项目验收以省科技厅与项目承担单位签订的合同书所约定的内容为基本依据。对项目所取得的科技成果水平、应用效果和对经济社会的影响、实施的技术路线、攻克关键技术的方案和效果、知识产权的形成和管理、项目实施的组织管理经验和教训、科技人才培养和队伍建设、经费使用的合理性等，做出客观的评价。</p><p>
	第二十八条 项目验收组织单位根据验收小组或中介机构的验收意见，提出“通过验收”、“结题”、“需要复议”或“不通过验收”的结论建议。</p><p>
	“通过验收”：按照合同要求开展科技计划项目，完成80%以上科研任务并取得预期成果的，可通过验收。</p><p>
	“不通过验收”：被验收项目存在下列情况之一者，不能通过验收：</p><p>
	（一）合同或计划任务书任务完成不到80%；</p><p>
	（二）提供的验收文件、资料、数据不真实；</p><p>
	（三）擅自修改合同或计划任务书的考核目标、内容、技术路线；</p><p>
	（四）经费未按合同规定开支或不能提供相关财务证明材料。</p><p>
	“需要复议”：被验收项目因提供文件资料不详、难以判断等导致验收意见争议较大，或成果资料未按要求进行归档和整理，或研究过程及结果等存在纠纷尚未解决的，需要复议。需要复议的项目应针对存在的问题做出改进或补充材料，自作出复议决定之日起2个月内再次提出验收申请。若未再提出申请或未按要求进行改进或补充材料，视同不通过验收。</p><p>
	“结题”：因不可抗拒因素造成课题原定目标和任务无法完成的课题，按照结题处理。</p><p>
	不通过验收的项目，项目承担单位须在接到通知半年内，整改完善有关项目材料后，提出重新验收的申请。如再次验收仍未通过的，省科技厅将对有关单位或责任人进行通报，降低项目承担单位和项目负责人的信用等级，负责人三年内不能再承担省科技计划项目。</p><p style=\"text-align: center; \"><strong>
	<span   style=\"font-size: 24px; \">第六章　责任与保障</span></strong></p><p>
	第二十九条 项目管理应发挥中介机构和咨询专家的作用。省科技厅通过招标或定向考察的办法，从若干具备资质的中介机构中遴选1家或1家以上的中介机构协助开展科技计划管理工作。</p><p>
	为确保公平、效率优先和支持发展，省科技厅根据各项咨询业务和管理事务服务的工作量、技术难度以及合理的业务成本向中介机构或咨询专家支付咨询服务费用，具体的支付标准参照国家和省的有关规定执行。</p><p>
	第三十条　参与项目管理的中介机构具有以下责任和义务：</p><p>
	（一）遵守省科技计划项目管理的有关规定，按照科技行政部门的委托，保证质量、按时完成受托的各项咨询服务业务；</p><p>
	（二）遵守“公开、公平和公正”的原则，确保所提供的咨询服务工作公正、科学、优质和高效；</p><p>
	（三）客观、及时地向省科技厅反映在执行项目管理咨询服务过程中发现的各类问题；</p><p>
	（四）建立符合科技发展规律和项目管理需求的工作质量保证体系，自觉接受科技行政部门的监督；</p><p>
	（五）严格保守服务对象在项目实施和管理过程中的各项管理、技术以及其他商业秘密。</p><p>
	第三十一条　咨询专家在为项目进行咨询的过程中，具有以下责任和义务：</p><p>
	（一）独立、客观、公正地提供个人意见，不受任何影响公正性因素的干扰；</p><p>
	（二）严格维护咨询对象的知识产权和技术秘密，不得向管理者以外的单位和个人扩散被咨询项目的有关信息。</p><p>
	（三）在咨询期间，未经组织者允许，咨询专家不得就咨询事项与咨询对象及相关人员进行接触。</p><p>
	第三十二条 项目管理实行回避制度，具体回避内容如下：</p><p>
	（一）在评审、立项、经费分配、项目验收、争议处理等环节，对于涉及科技行政部门、管理人员以及授权或委托管理机构自身利益的事项，当事者须主动提出声明，并实行回避；当事者被要求回避，经审查属实，也须实行回避；</p><p>
	（二）与评审（评估）等咨询对象有利益关系的、咨询对象因正当理由而事先正式申请希望回避等人员不宜被选择为咨询专家；</p><p>
	第三十三条 根据项目管理的需要建立省科技厅内部项目责任人制度、项目承担单位、项目负责人以及其他相关主体的信用评估制度。任何人不得在监督与信用评估制度的规定之外随意执行监督、评估行为。</p><p>
	第三十四条 对于在项目管理、相关咨询业务活动中各级科技主管部门及管理责任人、项目承担单位、项目负责人、中介机构以及咨询专家等责任主体，出现的各类问题、应承担的责任和受到相应的处理，依照《广东省科技系统信用评价管理办法》执行。</p><p style=\"text-align: center; \"><strong>
	<span   style=\"font-size: 24px; \">第七章　附则</span></strong></p><p>
	第三十五条 省科技计划项目的管理过程应逐步实现信息化，科技计划项目的申报、评审（评估）、公布、管理和结题的过程逐步实现互联网络处理，增强项目管理部门与承担单位的沟通交流。</p><p>
	第三十六条 本办法由省科技厅负责解释，自6月1日起施行。</p>','1','100','news','1394607376','0');
INSERT INTO `post` (`id`,`category_id`,`model`,`title`,`alias`,`image_name`,`file_name`,`tinyint1`,`int10`,`char32`,`varchar30`,`varchar50`,`varchar100`,`varchar128`,`content`,`status`,`weight`,`view`,`created_at`,`updated_at`) VALUES
('84','11','news','广东省科学技术厅转发科技部关于发布国家重点基础研究发展计划（含重大科学研究计划）等2015年度项目申报指南','aed4acd089dc14c51bf452aa3cd87dab','','','0','0','','','','','各地级以上市科技局（委）、顺德区经济和科技促进局，各有关单位：　　现将《科技部关于发布国家重点基础研究发展计划（含重大科学研究计划）、国家高技术研究发展计划、国家科技支撑计划2015年度项目申报指南的...','<p>各地级以上市科技局（委）、顺德区经济和科技促进局，各有关单位：</p><p><br>　　现将《科技部关于发布国家重点基础研究发展计划（含重大科学研究计划）、国家高技术研究发展计划、国家科技支撑计划2015年度项目申报指南的通知》转发给你们，并就有关事项补充通知如下：</p><p>　　一、网上申报要求</p><p>　　2015年度国家重点基础研究发展计划（以下简称“973计划”，含重大科学研究计划）、国家高技术研究发展计划（以下简称“863计划”）、国家科技支撑计划等计划项目通过国家科技计划项目申报中心（网址<a href=\"http://program.most.gov.cn/\">http://program.most.gov.cn</a>）进行网上申报，项目申请书具体格式在国家科技计划项目申报中心相关专栏下载。请各单位做好组织发动工作，并按有关要求积极申报。为避免由于网络堵塞等原因造成申报项目过期失效，并结合我厅网上推荐的时间，请各项目申报单位在国家网络申报截止日期前2日完成项目网上申报工作。</p><p>　　二、书面材料受理要求</p><p>　　（一） 各申报单位将申报书送主管部门审核后由主管部门统一报送；各主管部门还须向我厅提交 推荐项目清单(纸质，一式2份，盖单位公章)及电子版（Excel格式）。</p><p>　　（二） 网上直接生成并打印的项目申请书(纸质，一式3份)。</p><p>　　各推荐单位请加强对所推荐的项目申请者及其合作方的资质、科研能力的审核把关，严格控制推荐数量。</p><p>　　三、书面材料受理截止时间</p><p>　　（一） 973计划：请各推荐单位于4月18日前将材料送省科技厅审核。</p><p>　　联系人及电话：崔洁、彭向阳，020-83163335、83163880。</p><p>　　（二） 863计划：请各推荐单位于4月18日前将材料送省科技厅审核。</p><p>　　联系人及电话：郭秀强、黄攀、文晓芸，020-83163874、83163635、83163877。</p><p>　　（三） 支撑计划：</p><p>　　1.能源、材料、制造业、交通运输业、信息产业与现代服务业等领域，请各推荐单位于4月18 日前将材料送省科技厅审核。</p><p>　　联系人及电话：郭秀强、黄攀、文晓芸，020-83163874、83163635、83163877。</p><p>　　2.农业、人口与健康、城镇化与城市发展、村镇建设、公共安全及其社会事业等领域，请各推荐单位于4月16 日前将材料送省科技厅审核。</p><p>　　联系人及电话：叶毓峰、沈思、刘世伟，020-83163906、83163902、83163909。</p><p>　　3.科研条件建设项目，请各推荐单位于4月18日前将材料送省科技厅审核。</p><p>　　联系人及电话：陈玲、张玮，020-83163887、83163881。</p><p>　　四、报送地点及联系电话：</p><p>　　地址：广州市连新路171号省科技信息大楼1楼广东省科技厅业务受理窗口（邮政编码：510033）。</p><p>　　电话：020-83163930、83163931、83163932。</p><p><p style=\"text-align: right; \">省科技厅</p><p style=\"text-align: right; \">2014年3月3日</p></p>','1','100','news','1394607758','0');
INSERT INTO `post` (`id`,`category_id`,`model`,`title`,`alias`,`image_name`,`file_name`,`tinyint1`,`int10`,`char32`,`varchar30`,`varchar50`,`varchar100`,`varchar128`,`content`,`status`,`weight`,`view`,`created_at`,`updated_at`) VALUES
('85','11','news','广东省人民政府办公厅关于推广三资融合  建设模式促进我省民营科技园发展的意见','b78bb6752b979b037784e91aedf274a0','','','0','0','','','','','各地级以上市人民政府，各县（市、区）人民政府，省政府各部门、各直属机构：　　民营科技园是培育民营科技企业、壮大民营科技经济的重要载体，是提高自主创新能力、推动产业转型升级的重要平台，是促进创业就业、建...','<p>各地级以上市人民政府，各县（市、区）人民政府，省政府各部门、各直属机构：</p><p>　　民营科技园是培育民营科技企业、壮大民营科技经济的重要载体，是提高自主创新能力、推动产业转型升级的重要平台，是促进创业就业、建设幸福广东的重要基地。为认真贯彻落实胡锦涛总书记在广东视察时的重要指示精神，总结推广番禺节能科技园推行土地资本、金融资本和产业资本相融合（以下称“三资融合”）的建设模式探索民营科技园建设新体制机制的做法，推动我省民营科技园又好又快发展，经省人民政府同意，提出以下意见。</p><p>　　<strong>一、引导产业资本向民营科技园集聚，壮大民营科技经济发展规模</strong></p><p><strong>　　（一）优化民营科技园布局。</strong>根据全省产业转型升级、区域协调发展需要以及各地民营经济发展条件，遵循科技发展、园区建设等规律，制订全省民营科技园至2020年的发展规划和五年行动计划，通过科学规划引导园区合理布局。相关规划工作由省科技、发展改革、经济和信息化等有关部门负责。继续开展省市级民营科技园区认定工作，重点扶持一批产业特色鲜明、发展潜力较大、示范效应突出的民营科技园。按照产业集群、企业集聚、用地集约、科学有序的要求，优化各地级以上市民营科技园的区域布局。</p><p>　　<strong>（二）发展园区特色产业集群。</strong>鼓励有条件的县（市、区）建设民营科技园。做好民营科技园与其他各类园区的统筹协调。支持在开发程度较低的高新区、经济开发区、产业转移园区内划出区域，发展民营科技园。广州、深圳地区的民营科技园要突出与当地高新技术产业开发区的紧密联动，加快发展战略性新兴产业集群。珠海、中山、佛山、东莞、惠州、肇庆、江门等珠江三角洲地区的民营科技园要依托区域产业优势，努力发展先进技术产业集群和高新技术产业集群。东西两翼和北部山区的民营科技园要以承接产业转移为契机，结合当地资源条件，重点发展具有优势或特色的产业集群。</p><p>　　<strong>（三）明确民营科技园产业战略定位。</strong>各级政府及相关部门要指导民营科技园确立发展战略性新兴产业高端环节的定位，重点引进高附加值、高科技含量、高成长性项目，把设计、创意、研发、营销、结算等产业链“两端”环节引入园内。各民营科技园主导产业原则上不得超过3个，主导产业产值占园内总产值的比重不得低于50%，珠江三角洲地区民营科技园单位面积固定资产投资额原则上不得低于每公顷2006万元，非珠三角地区民营科技园原则上不得低于每公顷1005万元。各民营科技园要注重上下游配套产业的相互协调，形成分工协作、相互支撑、相互促进的完整产业链，推动企业集聚发展成为产业集群。</p><p>　　<strong>二、增强土地资本的产出效益，提升民营科技园土地集约化水平</strong></p><p><strong>　　（四）多渠道保障民营科技园建设用地。</strong>加快完善和认真落实民营科技园土地支持政策，引导民营科技园依法合理使用建设用地。各地级以上市要将民营科技园建设用地统一纳入城镇总体规划和土地利用总体规划。在坚持土地节约集约利用的原则下，每年在省下达给各地级以上市的土地利用计划指标中，优先安排民营科技园建设用地。支持通过“三旧”改造建设民营科技园区。对符合省优先发展目录的集约用地条件的战略性新兴产业工业项目，允许按不低于所在土地等级相对应工业用地出让最低标准的70%确定土地出让价格。在民营科技园中单独设立的研发中心、科研机构及产品设计产业用地，在符合相关规划条件的前提下，可按协议出让方式供地。</p><p>　　<strong>（五）完善民营科技园基础设施建设。</strong>鼓励有实力的大企业投资民营科技园基础设施，或经统筹规划后建设“园中园”。鼓励有条件的民营科技园组建基础设施建设投资公司。积极推广民营资本参与、政府与私人企业合作投资、非政府资金建设等新型融资方式，通过市场运作筹集建设资金，加快完善民营科技园基础设施建设。在异地务工人员集中的民营科技园，可以按照集约用地原则，集中建设单元型或宿舍型公共配套住房，面向用工单位或园内就业人员出租。</p><p>　　<strong>（六）简化民营科技园企业注册登记和产权登记。</strong>工业用地开发建设的省级民营科技园内按规划建设的房屋，可按房屋的幢、层、套、间等有固定界限的部分为基本单元进行产权登记，国家另有规定的除外。房屋登记后可出租或转让，承租方或受让方以及再承租方、再次受让方仅限于符合入园条件的科技型企业（机构）或其股东。省科技厅、住房和城乡建设厅要加强指导，做好相关监督、检查工作。除法律法规规定的专项许可经营项目外，在民营科技园集中办公区设立企业的，可以申请以租赁的独立区域作为住所，登记机关在营业执照中予以注明。</p><p>　　<strong>三、大力发展科技金融，切实解决民营科技企业融资难问题</strong></p><p><strong>　　（七）吸引金融资本投资民营科技园。</strong>鼓励金融机构在民营科技园内设立营业机构，并在风险可控、成本可测、信息充分披露的前提下，创新金融产品和服务方式，加强对园内科技型中小企业的融资服务。对在园内购置或自建金融服务办公用房的金融机构，有条件的地方可以给予一次性财政补贴等优惠。鼓励和支持各地级以上市结合本地民营科技园发展和融资需求，稳健发展小额贷款公司、融资性担保公司等新型准金融机构。鼓励各地级以上市设立民营科技园信用贷款风险补贴资金，用于对园内企业的信用评级费用补贴、贷款贴息以及试点银行的风险补贴，对单个企业和银行的补贴实行年度总额控制，可对各类金融机构实施业务增量补贴。引导各类创业风险投资机构到园内设立办事机构，鼓励民营科技园通过设立创业投资引导基金、私募股权投资基金等多种形式对具有发展潜力的企业进行股权投资。</p><p>　　<strong>（八）引导企业运用各类金融工具。</strong>支持民营科技企业通过参股、控股、资产收购等多种方式，参与国有企业、事业单位的改制重组。鼓励企业充分运用短期融资券、中期票据、企业债券、集合债券、集合票据、知识产权投融资等融资工具扩大融资规模，开展民营企业融资租赁业务试点工作。支持和推动有条件的民营科技企业上市融资，实施企业上市路线图资助计划，各地级以上市应认真贯彻落实国家和省支持企业改制的税费减免政策。支持符合条件的园内企业在区域性非公开科技企业柜台交易市场进行企业股权交易和技术产权交易。</p><p>　　<strong>（九）建设民营科技园科技金融服务平台。</strong>鼓励民营科技园建立各类金融服务平台，为民营科技企业提供银行、担保、保险、上市、租赁等金融服务，促进科技资源与金融资源的有效对接。支持各民营科技园设立中小企业融资服务平台，为中小企业提供“一站式”融资服务，探索以园内多家企业融资需求整体打包，统一对金融机构进行招投标，提高企业在融资过程中的议价能力，降低借贷成本。鼓励民间资本发起设立金融中介服务机构，支持信用评级、资产评估、会计、法律等机构为园内民营科技企业提供全方位金融服务。</p><p>　<strong>　四、完善民营科技园科技创新服务体系，努力提高民营科技企业自主创新能力</strong></p><p><strong>　　（十）加强产业核心关键技术攻关。</strong>各民营科技园应围绕园内主导产业技术发展需求，研究制定产业技术路线图，确定关键共性技术和攻关方向。鼓励园内企业与国内外高等院校、科研院所开展科技合作交流，对产业核心关键技术进行联合攻关。支持园内各类主体开展协同创新活动。以园内高新技术龙头企业为依托，加快组建产业技术创新联盟和专利联盟。支持引导园内企业加快研发机构建设和发展，申报省级以上工程技术中心、重点实验室、企业技术中心、企业研究开发院。</p><p>　　<strong>（十一）促进科技成果转化。</strong>鼓励园内企业与国内外高等院校、科研院所开展产学研合作，加速科技创新成果在民营科技园内的转化和产业化。推动民营科技园产学研结合示范基地建设，扶持一批影响大、辐射面广、经济社会效益明显的科技成果转化项目，有条件的地方可给予财政资金支持和奖励。落实国家及我省关于科技成果转化的各项优惠政策，鼓励拥有核心关键技术或自主知识产权的科研人员以创办企业、作价入股或技术转让等方式到民营科技园内转化高新技术成果。由高等学校承担的科技计划项目，民营科技园企业参与联合投入的，允许双方按出资比例，通过合同约定的方式共享创新成果所有权。</p><p>　　<strong>（十二）建设民营科技园科技创新公共平台。</strong>支持民营科技园设立生产力促进中心或科技服务中心。通过园区各类科技创新服务平台，为企业开展技术研发、技术检测、技术交易、项目申报等科技创新服务，形成与园内科技创新链相匹配的科技服务链。鼓励民营科技园设立科技企业孵化器。各级科技计划应大力支持民营科技园相关科技创新服务平台的建设。</p><p>　　<strong>（十三）加强知识产权保护和品牌建设。</strong>加大对民营科技园企业知识产权成果的保护力度，严厉打击各种侵权行为，健全知识产权保护机制，完善涉外知识产权争端应对机制和维权援助机制。建立健全知识产权服务体系和专利经营体系，有条件的区县一级财政按照园内企业知识产权申请费和审查费的实际发生额，给予一定资金补助。引导园内创新主体参与创制技术标准，支持企业以产业链为纽带形成标准联盟，对于参与国际、国家、地方标准制定的园内企业，有条件的地方可给予适当的资助或奖励。鼓励民营科技园企业通过技术创新不断提升产品和服务的科技含量和质量，加大培育自主品牌的投入力度，提升民营科技企业的产品信誉度和品牌实力，逐步扩大品牌的国际影响力。</p><p>　　<strong>五、加大政策扶持力度，营造民营科技园良好发展环境</strong></p><p><strong>　　（十四）优化人才发展环境</strong>。各级人力资源与社会保障、公安、科技等部门要进一步提高人才服务水平，理顺人才管理服务体制机制，提供人才招聘、人才引进、职称评定、户口管理、档案挂靠、人事代理、培训教育、流动党员管理等多样化的人才服务，为民营科技园引进创新创业人才设立便捷、高效的“绿色通道”。大力鼓励和支持民营科技企业人才参加职业资格考试和职称评定。各地政府要按照《转发国务院办公厅关于积极稳妥推进户籍管理制度改革的通知》（粤府〔2011〕40号）精神，进一步改革人才户籍管理制度，特别是放宽设立集体户口的范围和条件，允许科研事业单位、民营科技园或具有一定规模、每年缴纳一定税额的民营科技企业设立集体户口，为人才提供落户便利。要按照“依法办事、以人为本”的原则，严禁各地人才市场对挂靠户口的人才在婚姻登记等方面设立各种限制性规定。各地级以上市人力资源社会保障部门要牵头开展专项行动，对人才市场有关人才户籍管理的各种不合理的限制性规定进行清理。今年内要清理完毕并向社会公布清理结果。</p><p>　　<strong>（十五）提高对中小微企业的综合服务水平。</strong>总结推广中山市小榄专业镇生产力促进中心的经验，坚持政府主导、市场运作，推动民营科技园内的生产力促进中心发展，为企业提供全方位服务，形成有利于园区主导产业发展、贯穿企业发展全过程、覆盖企业生产经营各个环节的全链条服务体系。依法及时清理和调整不利于民营科技园发展的行政审批事项。民营科技园所在地政府有关职能部门，要加强和改进对园区企业的综合电子政务服务。要在民营科技园和民营科技企业中建立健全党团组织和工会组织，发挥其在协调劳动关系等方面的重要作用。</p><p>　　<strong>六、加强组织领导，形成推动民营科技园发展合力</strong></p><p><strong>　　（十六）加强对民营科技园建设的统筹协调。</strong>各级政府要把加快民营科技园发展列入重要议事日程，加强对民营科技园建设的统筹、协调和指导。建立由省科技行政主管部门牵头，发展改革、经济和信息化、住房和城乡建设、国土资源、工商、知识产权、金融等单位参与的民营科技园工作协调机制，形成推动我省民营科技园发展的合力。鼓励各级财政加大对民营科技园的投入力度，发挥财政资金的杠杆作用，推动园区建设发展。</p><p>　　<strong>（十七）强化对民营科技园的考核评价。</strong>合理设置民营科技园考核指标体系，将投资强度、销售收入、财税收入、招商引资、建成区面积等作为民营科技园考核的主要指标，将产业集聚度、投入产出率和重大科技项目数量作为考核的辅助指标。省科技行政主管部门牵头定期组织省级民营科技园申报审核认定，并负责对省级民营科技园进行年度考核，实行动态管理。</p><p>　　<strong>（十八）加强宣传推广工作。</strong>充分利用各类媒体，广泛宣传“三资融合”建设模式的特点和优势，推广典型民营科技园的先进经验，充分发挥典型民营科技园的示范带动作用，选择建设成绩突出、建设模式先进、在国内外同行业内具有较高知名度的民营科技园组织开展现场学习会、巡回宣讲活动等宣传活动。</p><p>　　　　　　　　　　　　　　　　　　　　　　　　　　　广东省人民政府办公厅</p><p>　　　　　　　　　　　　　　　　　　　　　　　　　　　　　2012年10月9日</p>','1','100','news','1394614449','0');
INSERT INTO `post` (`id`,`category_id`,`model`,`title`,`alias`,`image_name`,`file_name`,`tinyint1`,`int10`,`char32`,`varchar30`,`varchar50`,`varchar100`,`varchar128`,`content`,`status`,`weight`,`view`,`created_at`,`updated_at`) VALUES
('86','11','news','财政部、国家税务总局关于科技企业孵化器税收政策的通知','01c010c3dd162079d28b1a26406015d3','','','0','0','','','','','各省、自治区、直辖市、计划单列市财政厅（局）、国家税务局、地方税务局，新疆生产建设兵团财务局：　　为贯彻落实《国务院关于印发实施若干配套政策的通知》（国发〔2006〕6号）、《中共中央 国务院关于深化...','<p>各省、自治区、直辖市、计划单列市财政厅（局）、国家税务局、地方税务局，新疆生产建设兵团财务局：</p><p>　　为贯彻落实《国务院关于印发实施若干配套政策的通知》（国发〔2006〕6号）、《中共中央 国务院关于深化科技体制改革 加快国家创新体系建设的意见》（中发〔2012〕6号）和《国务院关于进一步支持小微企业健康发展的意见》（国发〔2012〕14号）等有关文件精神，经国务院批准，现就符合条件的科技企业孵化器（高新技术创业服务中心）有关税收政策通知如下：</p><p>　　一、科技企业孵化器（也称高新技术创业服务中心，以下简称孵化器）是以促进科技成果转化、培养高新技术企业和企业家为宗旨的科技创业服务载体。孵化器是国家创新体系的重要组成部分，是创新创业人才培养的基地，是区域创新体系的重要内容。自2013年1月1日至2015年12月31日，对符合条件的孵化器自用以及无偿或通过出租等方式提供给孵化企业使用的房产、土地，免征房产税和城镇土地使用税；对其向孵化企业出租场地、房屋以及提供孵化服务的收入，免征营业税。营业税改征增值税（以下简称营改增）后的营业税优惠政策处理问题由营改增试点过渡政策另行规定。</p><p>　　二、符合非营利组织条件的孵化器的收入，按照企业所得税法及其实施条例和有关税收政策规定享受企业所得税优惠政策。</p><p>　　三、享受本通知规定的房产税、城镇土地使用税和营业税优惠政策的孵化器，应同时符合以下条件：</p><p>　　（一）孵化器的成立和运行符合国务院科技行政主管部门发布的认定和管理办法，经国务院科技行政管理部门认定，并取得国家级孵化器资格。</p><p>　　（二）孵化器应将面向孵化企业出租场地、房屋以及提供孵化服务的业务收入在财务上单独核算。</p><p>　　（三）孵化器提供给孵化企业使用的场地面积（含公共服务场地）应占孵化器可自主支配场地面积的75%以上（含75%），孵化企业数量应占孵化器内企业总数量的75%以上（含75%）。</p><p>　　公共服务场地是指孵化器提供给孵化企业共享的活动场所，包括公共餐厅、接待室、会议室、展示室、活动室、技术检测室和图书馆等非盈利性配套服务场地。</p><p>　　四、本通知所称“孵化企业”应当同时符合以下条件：</p><p>　　（一）企业注册地和主要研发、办公场所必须在孵化器的孵化场地内。</p><p>　　（二）属新注册企业或申请进入孵化器前企业成立时间不超过24个月。</p><p>　　（三）企业在孵化器内孵化的时间不超过42个月。纳入“创新人才推进计划”及“海外高层次人才引进计划”的人才或从事生物医药、集成电路设计、现代农业等特殊领域的创业企业，孵化时间不超过60个月。</p><p>　　（四）符合《中小企业划型标准规定》所规定的小型、微型企业划型标准。</p><p>　　（五）属迁入企业的，上年营业收入不超过500万元。</p><p>　　（六）单一在孵企业入驻时使用的孵化场地面积不大于1000平方米。从事航空航天等特殊领域的在孵企业，不大于3000平方米。</p><p>　　（七）企业产品（服务）属于科学技术部、财政部、国家税务总局印发的《国家重点支持的高新技术领域》规定的范围，且研究开发费用总额占销售收入总额的比例不低于4%。</p><p>　　五、本通知所称“孵化服务”是指为孵化企业提供的属于营业税“服务业”税目中“代理业”、“租赁业”和“其他服务业”中的咨询和技术服务范围内的服务。</p><p>　　六、国务院科技行政主管部门负责组织对孵化器是否符合本通知规定的各项条件定期进行审核确认，并出具相应的证明材料，列明纳税人用于孵化的房产和土地的地址、范围、面积等具体信息。</p><p>　　七、本通知规定的房产税、城镇土地使用税和营业税优惠政策按照备案类减免税管理，纳税人应向主管税务机关提出备案申请。凡纳税人骗取本通知规定的税收优惠政策的，除根据现行规定进行处罚外，自发生上述违法违规行为年度起取消其享受本通知规定的税收优惠政策的资格，2年内不得再次申请。</p><p>　　各主管税务机关要严格执行税收政策，按照税收减免管理办法的有关规定为符合条件的孵化器办理税收减免，加强对孵化器的日常税收管理和服务。同时，要密切关注税收政策的执行情况，对发现的问题及时逐级向财政部、国家税务总局反映。</p><p>　　请遵照执行。</p><p style=\"text-align: right; \">财政部 国家税务总局 <br>2013年12月31日</p>','1','100','news','1394614584','0');
INSERT INTO `post` (`id`,`category_id`,`model`,`title`,`alias`,`image_name`,`file_name`,`tinyint1`,`int10`,`char32`,`varchar30`,`varchar50`,`varchar100`,`varchar128`,`content`,`status`,`weight`,`view`,`created_at`,`updated_at`) VALUES
('87','11','news','全省科技金融工作会议召开 完善科技金融政策体系','aeb5b5b110a6c66f1c7adea9437bc115','','','0','0','','','','','全省科技金融工作会议今日在广州举行。会上将出台《2014年科技·金融·产业融合创新发展重点行动》和《科技金融支持中小微企业发展专项行动计划》，举行佛山市南海区科技、金融、产业融合创新综合试验区授牌仪式...','<p>全省科技金融工作会议今日在广州举行。会上将出台《2014年科技·金融·产业融合创新发展重点行动》和《科技金融支持中小微企业发展专项行动计划》，举行佛山市南海区科技、金融、产业融合创新综合试验区授牌仪式。同时，全国中小企业股份转让系统有限责任公司与省金融办签署战略合作备忘录，省科技厅与广东金融学院签署共建科技金融实验室和科技金融融资信息平台协议。</p><p>完善科技金融政策体系</p><p>新年传喜讯，广东共有41家企业登陆“新三板”，位居全国各省市区前列。近年来，广东省委、省政府高度重视“新三板”扩大试点工作，省科技厅也积极推进高新区迎接“新三板”扩容，高新区企业已成为我省登陆“新三板”的主力军。</p><p>　　“新三板”，是科技与金融特别是资本市场结合的制度创新。促进科技和金融结合是加快科技成果转化和培育战略性新兴产业的重要举措，也是深化科技体制改革的内在要求。处于改革开放前沿的广东敏锐地捕捉到这一重大机遇，先行先试，通过完善科技金融政策体系等一系列“组合拳”，在新一轮的科技金融改革创新中占得先机。</p><p>　　加强顶层设计，构建完善的政策体系。2011年我省颁布实施了全国首部自主创新地方性法规—《广东省自主创新促进条例》，对制订科技金融扶持政策、鼓励和支持建立科技金融机构等提出了明确要求。2013年8月，出台了《广东省人民政府办公厅关于促进科技和金融结合的实施意见》，进一步明确了促进科技与金融结合的目标要求。</p><p>　　据了解，我省通过推动国家科技和金融结合试点工作，加快推广番禺节能科技园“三资融合”建设模式等一系列有力措施，积极探索科技金融结合新路径。2009年，省科技厅与中山、珠海、东莞市联合设立规模为1.5亿元的“联合科技贷款风险准备金”，在此基础上建立了省级风险准备金、“风险池”专项资金，初步形成引导社会资本投入科技创新的级联放大机制。</p><p>　　充分发挥国有科技金融资本的引导和带动作用。2013年，原粤科风险投资集团重新组建为粤科金融集团，目前已设立完成了粤科科技小额贷款和粤科科技融资担保公司。在去年我省承办的全国创新创业大赛(广东赛区)暨首届珠江天使杯科技创新创业大赛中，粤科金融集团成立了广东天使创业投资联盟，设立“粤穗天使基金”，首期投入1亿元，成为连接我省科技创业者与天使投资的对接平台。</p><p>　　完善企业投融资服务平台。依托省生产力促进中心成立“省科技型中小企业投融资服务中心”。此外，还建立风险投资对接平台、技术产权交易平台、中小科技企业上市辅导平台，科技型中小企业金融服务体系日益健全。</p><p>　　“广东科技金融工作起步较早，形成了较好的基础，也取得一定的成绩。但与先进国家和地区比较，还存在不少薄弱环节，如创新的政策措施还未形成整体效应，科技计划项目管理方式与金融创新的要求还不相适应等。”省科技厅厅长黄宁生说，为解决存在问题，省科技厅和省金融办携手出台20项重点行动促科技·金融·产业融合创新发展，与有关单位协同探索促进科技金融产业融合发展的新政策、新路径。接下来，将通过加快出台和落实科技金融的系列政策措施，重点推进深化科技金融试点工作，建立科学高效的财政科技投入管理模式和实施科技金融特派员计划等创新政策，打通资本市场和创新资源的对接通道，推动科技、金融、产业深度融合发展。</p><p>　　据悉，下一步我省将通过实施省级科技业务管理体系阳光再造行动，建立健全新型的科技业务管理体系，转变财政科技资金投入结构和使用方式，建立科学高效的财政科技投入管理模式，充分发挥财政资金的引导放大效应，加速社会资本投入科技创新。</p><p>　　“5+1”推动科技金融创新融合</p><p>　　经济的发展依靠科技推动，而科技产业的发展需要金融的强力助推。随着2013年广东GDP突破1万亿美元关口，广东进入到经济社会转型发展新时期，面对全球范围内新一轮产业革命的挑战，面对国内其他地区的激烈竞争，面对珠三角转型升级和粤东西北振兴发展的新要求，必须全面深化金融改革，构建有效推动经济结构调整和转型升级的金融机制、文化和环境。</p><p>　　“为贯彻落实十八届三中全会精神，我们提出了新时期\"5+1\"金融改革思路。”省金融办主任刘文通详细介绍说，“1”是指建设一个现代金融体系；“2”是指实现金融对珠三角转型升级和粤东西北振兴发展的“两个驱动”；“3”是指推动金融、科技、产业融合创新发展；“4”是指实现银行业、证券期货业、保险(放心保)业和类金融组织协调发展；“5”是指大力发展国际金融、科技金融、产业金融、农村金融和民生金融；最后是坚守不发生系统性、区域性金融风险这一底线。通过深化金融改革，推动金融、科技、产业融合创新，可以将未来收益转化为即期收入，盘活存量资产，有效解决融资难题；可以形成市场与政府合力，构建有利于创新创业的体制机制、环境文化，更高效率地实现产业转型升级；可以通过并购重组等手段实现技术、资本、劳动等多要素重新组合，形成新的市场竞争优势。</p><p>　　接下来，省金融办将会同有关单位重点推动四方面工作：一是加快发展利用多层次资本市场。深化与沪深交易所和“新三板”战略合作，完善区域性股权交易中心功能，构建全省统一产权交易平台。二是建设金融、科技、产业融合创新金融服务体系。积极开展民营中小银行试点，鼓励发展股权投资企业，发展特色小额贷款公司，规范发展互联网金融企业。三是完善金融、科技、产业融合创新政策体系。制订完善金融机构和金融人才扶持政策，完善风险投资机制，建立政策性担保体系。四是建设金融、科技、产业融合创新试验平台。选取广州、佛山、东莞、揭阳等市率先开展金融、科技、产业融合创新试验，并逐步在全省推广经验。同时，加快广州、佛山和东莞民间金融街(000402,股吧)建设，使之成为金融服务广大中小微企业的重要创新载体。</p>','0','100','news','1394614882','1394692690');
INSERT INTO `post` (`id`,`category_id`,`model`,`title`,`alias`,`image_name`,`file_name`,`tinyint1`,`int10`,`char32`,`varchar30`,`varchar50`,`varchar100`,`varchar128`,`content`,`status`,`weight`,`view`,`created_at`,`updated_at`) VALUES
('88','9','download','博士科技服务站服务团队报名表','f975de257933e5d5a338617bc3382ab5','','博士科技服务站服务团队报名表.doc','0','0','','','','','博士科技服务站服务团队报名表','','1','100','download','1394618576','0');
INSERT INTO `post` (`id`,`category_id`,`model`,`title`,`alias`,`image_name`,`file_name`,`tinyint1`,`int10`,`char32`,`varchar30`,`varchar50`,`varchar100`,`varchar128`,`content`,`status`,`weight`,`view`,`created_at`,`updated_at`) VALUES
('89','15','news','民防博士科技服务站博士专家团队招募通知','adb299f9108e839129e34881fac142e7','','','0','0','','','','','民防博士科技服务站是广东省民防协会联合广东博士俱乐部有限公司在企业开展科技服务的专业机构，是博士、专家在企业开展人防工程科技创新的“桥头堡”。本站通过凝聚广东省民防协会专家委员会和广东博士俱乐部博士、...','<p>民防博士科技服务站是广东省民防协会联合<st1>广东博士俱乐部有限公司在企业开展科技服务的专业机构，是博士、专家在企业开展人防工程科技创新的“桥头堡”。</st1></p><p>本站通过凝聚广东省民防协会专家委员会<st1>和广东博士俱<st1>乐部博士、专家的智慧，以企业科技需求为导向，依托博士、专家团队为企业的创新发展提供科技咨询、科技攻关、科技培训、科技项目申报等，为企业创造和应用新技术、新工艺，开发新产品提供全方位的科技服务。</st1></st1></p><p>为更好地服务广东省民防企业，现诚邀热心广东省民防事业的，包括但不仅限于地下工程（建筑工程）、防护（防爆、防水、防腐、防化）、检测（超声波检测、质量检测）、自动化（焊接、机械）、综合类（管理、法律）等<st1>方向的博士、专家加入民防博士服务团队，助推我省民防事业的创新发展！</st1></p><p>联系方式：</p><p>联系人：苏小姐</p><p>联系电话：13632105144</p><p style=\"margin-left: 80px; \">  020-29077647</p><p>联系邮箱：yill@gdphd.com</p><p>附：<a href=\"/upload/files/博士科技服务站服务团队报名表.doc\">博士科技服务站服务团队报名表</a> </p>','1','100','news','1394676947','1394678619');
INSERT INTO `post` (`id`,`category_id`,`model`,`title`,`alias`,`image_name`,`file_name`,`tinyint1`,`int10`,`char32`,`varchar30`,`varchar50`,`varchar100`,`varchar128`,`content`,`status`,`weight`,`view`,`created_at`,`updated_at`) VALUES
('90','15','news','万德博士科技服务站博士专家团队招募通知','834ea6f02bd17989c413cf1d8397965f','','','0','0','','','','','	博士科技服务站是广东博士俱乐部有限公司在企业开展科技服务的专业机构，是博士、专家在企业开展科技创新的“桥头堡”。
	本站通过凝聚博士、专家的智慧，以企业科技需求为导向，依托博士、专家团队，为企...','<p>
	博士科技服务站是
	<st1>广东博士俱乐部有限公司在企业开展科技服务的专业机构，是博士、专家在企业开展科技创新的“桥头堡”。</st1></p><p>
	本站通过凝聚博士、专家的智慧，以企业科技需求为导向，依托博士、专家团队，为企业的创新发展提供科技咨询、科技攻关、科技培训、科技项目申报等，为企业创造和应用新技术、新工艺，开发新产品提供全方位的科技服务。</p><p>
	广东万德检测技术股份有限公司是一家为生产制造商、贸易商以及零售商服务的专业第三方检测机构，致力于家居装饰、水质、土壤修复与治理等环境方面的检测服务。
	<st1>广东博士俱乐部有限公司根据万德公司的科技需求，建立<st1><strong>万德</strong><strong>博士科技服务站，</strong>诚邀环境治理、化工、纺织（材料方向）等领域的博士、专<st1>家加入博士服务团队！</st1></st1></st1></p><p>
	联系方式：</p><p>
	联系人：苏小姐</p><p>
	联系电话：13632105144</p><p style=\"margin-left: 80px; \">
	           020-29077647</p><p>
	联系邮箱：yill@gdphd.com</p><p>
	<strong></strong></p><p>
	附：
	<a href=\"/upload/files/博士科技服务站服务团队报名表.doc\">博士科技服务站服务团队报名表</a></p>','1','100','news','1394677240','1394678591');
INSERT INTO `post` (`id`,`category_id`,`model`,`title`,`alias`,`image_name`,`file_name`,`tinyint1`,`int10`,`char32`,`varchar30`,`varchar50`,`varchar100`,`varchar128`,`content`,`status`,`weight`,`view`,`created_at`,`updated_at`) VALUES
('91','14','news','全省社区党建工作观摩交流会强调大力加强社区服务型党组织建设','071c6b9e92bd7eb7b0663d19720490b3','','','0','0','','','','','近日，省委组织部在中山市召开全省社区党建工作观摩交流会，贯彻落实党的十八届三中全会和全国社区党建工作经验交流会的部署，传达学习胡春华书记在广州社区调研座谈会上的讲话精神，总结社区党建工作情况，交流工作...','<p>近日，省委组织部在中山市召开全省社区党建工作观摩交流会，贯彻落实党的十八届三中全会和全国社区党建工作经验交流会的部署，传达学习胡春华书记在广州社区调研座谈会上的讲话精神，总结社区党建工作情况，交流工作经验，研究部署加强社区服务型党组织建设。</p><p>会议指出，社区党组织是党在城市基层全部工作和战斗力的基础，是党执政的根基。要充分认识新形势下加强社区党建工作的重要性，站在更高起点认识和谋划社区党建工作。</p><p>会议强调，要把社区党建工作的重心转移到服务上来，围绕服务改革、服务发展、服务民生、服务群众、服务党员的总要求，大力加强社区服务型党组织建设。一是要强化社区党组织领导核心地位，把社区党组织真正作为政权的基础来建设，始终保持基层治理基本框架的稳定，加强党对社区工作的领导。二是要完善社区组织体系，推行“大党委制度”、“网格党支部制度”、“党员服务社区制度”，增强整合资源服务群众的功能。三是要壮大社区骨干队伍，加强社区党组织书记队伍、党务工作者队伍、党员和群众志愿者队伍建设，提高带头服务、带动服务的能力。四是要丰富社区服务载体，建设“一站式”综合服务平台、“智慧型”网络服务平台、“多样化”文体休闲平台，开展多样化、个性化的服务。</p><p>会议强调，各地要切实把社区党建工作摆上重要日程，进一步加强组织领导。组织部门要牵头抓总，结合实际探索创新，千方百计保障社区的人财物，确保社区党建各项工作落到实处。</p><p>深圳</p><p>“五进社区”，服务党员、服务群众</p><p>作为中国第一个没有农村建制的城市，深圳在社区普遍设立综合党委，构建条块联动、区域统筹的基层党建新格局。围绕服务党员、服务群众，深入开展“五进社区”活动。</p><p>市、区委委员进社区。近400名市、区委委员每人挂钩1-2个社区，固定联系若干名党代表、党员和群众，了解群众需求，解决群众困难。</p><p>党代表进社区。建立市、区两级党代表定点包片到社区工作制度，484名市党代表每人定点联系1－2个社区，五年任期内保持稳定，实现党代表与社区定人、定点全覆盖。</p><p>机关在职党员进社区。全市各级机关党员到居住地社区党组织登记备案，每季度至少参加1次社区党组织活动。</p><p>党员志愿者进社区。全市成立党员志愿者服务队1500多支，志愿者6万多人，到社区开展20个大类、30多个专业项目的志愿服务。</p><p>党群工作者进社区。充分发挥社区退休老党员、党员社工、工会、共青团、妇联等党群工作者和群团组织作用，解决了一大批群众关心的热点难点问题。</p><p>东莞</p><p>社区设置党工委，领导各类组织和各项工作</p><p>东莞市现有社区242个，社区党委37个、党总支78个、党支部127个，驻社区各类党组织达3206个，管理流动党员3.9万名。东莞打破以条块为主的社区党组织体系，设置社区党工委，统筹社区各类组织和各项工作，加强社区管理和服务。</p><p>今年9月，东莞市选择7个镇街，试点设置社区党工委，计划明年1月全市铺开。社区党工委成立后，直接管理社区内各类党组织和党员，向区域内的党组织选派党建联络员，要求所有党员到社区党工委登记报到，实现组织共建、党员共管、资源共享，构建共驻共建机制。</p><p>建立社区班子联席会议、党群联席会议“两联席”制度，实行群众评议党员、党员评议党组织、下级党组织评议上级党组织“三评议”，实行承诺事项公开、决策过程公开、实施结果公开、群众意见公开“四公开”，规范运作，充分发挥社区党工委的职能作用。</p><p>云浮</p><p>完善社区保障体系，推进“三有一化”</p><p>云浮市有社区118个、社区党员7063名。近年来，云浮立足欠发达地区的实际，抓队伍、重保障、强运作、优服务，扎实推进“三有一化”工作。</p><p>通过多方选、上级派、自身育等形式，加强社区干部队伍建设，确保“有人管事”。目前，全市社区书记、主任“一肩挑”占81.4%，“两委”班子成员交叉任职率为84.8%。社区“两委”干部大专以上学历达30%，每个社区至少配备了一名大专学历以上的干部。</p><p>在市县财政非常困难的情况下，采取以财政投入为主、社区集体经济收入补助为辅、共建单位捐助为补充的方式，确保“有钱办事”，切实保障社区运作。目前全市118个社区办公用房都达到<st1>80平方米以上，70个社区拥有自己的办公用房。</st1></p><p>搭建社区服务平台，市县322个机关党支部和社区党组织结成帮扶对子，建立社区党员志愿服务组织233个，党员志愿者3600多人，提升社区公共服务功能，探索区域化党建。</p><p>中山火炬开发区</p><p>“双融双建”，探索区域党建新格局</p><p>中山火炬开发区有社区党委7个，社区党员1780名。近年来，大力实施“双融双建”（机关融入基层、党员融入群众，建设为民务实清廉的党员干部队伍、建设幸福和美开发区），打破条块分割的传统党建工作格局，探索构建区域化党建工作新格局。</p><p>搭建“双融双建”平台，把开发区17名领导班子成员和15个区直机关、10个事业单位、9个区属公司、“两新”组织等党组织全部编入社区党委，区领导和机关单位负责人担任社区党委兼职委员，组织1392名机关事业单位党员与2万多户社区居民结成帮扶对子。</p><p>丰富“双融双建”内容，实施“三个五”基层党建创建、党员服务群众、党员干部素质提升、党员带动社会诚信、民主法制社区建设、民生保障、网格平安建设、全民修身、文化休闲、生态示范小区等十大工程，提升社区服务水平。</p><p>广州番禺</p><p>番奥社区示范，创建社区服务型党组织</p><p>番禺确定番奥社区作为创建社区服务型党组织示范点，以点带面，把社区党建工作重点转到服务上来。</p><p>建立社区大党委—网格党支部—功能型党小组“三级体系”，建立社区党委书记—党委委员—党支部书记—党小组长—党员“五级负责制”，拓展社区党组织服务体系。</p><p>不拘一格选人才，按照政治素质好、社区管理本领高、服务群众能力强的标准，不受职业、身份等限制，选拔社区党组织带头人。发动机关事业单位党员干部兼任社区党组织班子成员。</p><p>从2010年起，推行在职党团员到社区报到为群众服务。推行“社工+志愿者”模式，党员带头，群众自发组织治安巡逻、空巢老人关怀、文艺活动等志愿服务队，开展各类志愿服务。</p><p>开展丰富多彩的活动，建设文化长廊、绿色网园、运动场馆等，举办“街坊春晚”、“中秋晚会”、“亲子乐园”等民俗节庆活动。组建群众文化队伍，每月举行一次大型文体活动。</p><p style=\"text-align: right; \">来源：2013.12.30《南方日报》</p>','1','100','news','1394762121','1394762622');
INSERT INTO `post` (`id`,`category_id`,`model`,`title`,`alias`,`image_name`,`file_name`,`tinyint1`,`int10`,`char32`,`varchar30`,`varchar50`,`varchar100`,`varchar128`,`content`,`status`,`weight`,`view`,`created_at`,`updated_at`) VALUES
('92','14','news','以四进促四新，全面推进“支部建在网格上”工作','b9d8a13e2ce1bb607761617450180ccf','','','0','0','','','','','越秀区坚持贯彻党的群众路线，围绕网格化服务管理工作，以“支部建在网格上”为突破口，进一步创新社会管理、整合社区党建资源，全面推进服务型基层党组织建设，不断提升基层党建工作的科学化水平。（一）组织进格，...','<p>越秀区坚持贯彻党的群众路线，围绕网格化服务管理工作，以“支部建在网格上”为突破口，进一步创新社会管理、整合社区党建资源，全面推进服务型基层党组织建设，不断提升基层党建工作的科学化水平。</p><p>（一）组织进格，构筑基层党建新格局</p><p>在全区18条街道267个社区实行网格化划分的基础上，按照支部建在网格上的要求，以街道党工委作为责任主体，根据社区网格基本情况，对社区党组织的下设党组织进行科学调整，在网格内设置党支部（党总支、党小组），由网格党组织书记（党小组组长）担任网格管理员，逐步建立“区委—街道党工委—社区党组织—网格党支部”四级党组织网络体系，确保每个网格都有党组织，每名党员都在网格中。通过网格党支部（党总支、党小组）的建立，进一步推动基层党建工作与服务群众工作重心下沉，使基层党组织的组织优势、密切联系群众优势与网格化管理优势有机融合，充分发挥党组织在网格中的领导核心作用，为网格化服务管理工作提供坚强组织保证。目前，全区有68个试点社区正在推进支部建在网格上工作，共建立网格党支部（党小组）404个。</p><p>（二）制度进格，建立网格管理新保障</p><p>在深入基层开展调研，充分听取街道、社区和网格员意见建议的基础上，制定了《越秀区网格化党建工作制度（试行）》，纳入越秀区“1+2+<st1>5”网格化服务管理工作制度体系，对网格化党建工作的目标任务、架构设置、资源保障、运行机制等四个方面进行了规范，确保基层网格化党建工作有章可循、有规可依。全区各街道党工委、社区党组织根据自身实际，建立健全各项联系、指导、监督网格党组织的制度，指导网格党组织建立议事决策、定期通报、联系群众、区域共建以及网格化服务管理各项配套制度，完善了网格党组织的运行机制，逐步实现网格党组织党建工作制度化和长效化。如洪桥街党工委制定了《洪桥街网格化党员干部联系社区工作制度》等10套工作制度，要求街道领导、科室党员、党员骨干、在职党员全部下沉网格一线，参与到社区网格化服务管理工作中，充分发挥党员干部在网格化管理服务工作中的先锋模范作用。</st1></p><p>（三）资源进格，挖掘服务群众新渠道</p><p>积极构建“党组织主导、机团单位支持、居民群众参与”的社会协同机制，改进和创新公共服务方式，结合辖内机团单位特点和资源优势，为群众提供多样化、人性化的社区服务项目。建立区域内党建资源共享共驻共建机制，将各类区域内在职党员、驻社区单位党员、党代表等党建资源纳入网格之中，按照“一网格一特色”的思路，发动网格内党员骨干、在职党员、热心居民组成多支志愿者服务队、兴趣小组，打造网格服务的特色品牌。如六榕街旧南海县社区第五网格党支部根据社区党员特长，依托街道康园工疗站创建开心康疗基地，社区党员吴姨、梁叔在退休后婉拒了单位返聘，来到康疗基地开展义务文化教育和康疗指导活动；白云街充分发挥在职党员、机关党员特长，定期开展送电影进网格；大塘街“阳光培育”网格党小组与辖内机团单位秉政小学共同开展廉政教育活动和阳光培育活动；黄花岗街网格党支部和辖内机团单位动物园、动物园地铁站协同治理，成功缓解了国庆假期动物园客流过大阻碍交通的问题。</p><p>（四）工作进格，焕发党务工作新气象</p><p>以智慧党建引领推进“五位一体”的网格化建设，搭建网格化服务管理、智慧党建两大智慧化信息平台，将“双结对”工程、基础党务等社区党建、区域党建实体工作感知化、智能化，建立30本电子工作台账，实现了对网格内党员的动态梳理和党政信息互通共享。积极发挥党组织和党员骨干在网格中的表率作用，引导、支持和保障社区居民自治，确保社区居民自治不偏离方向，夯实党在基层的执政基础。截至10月份，白云街通过网格服务管理系统协同处理居民自治事项565件，成功解决了“社区流动图书馆”选址、南方日报电子触控屏安装、小区电梯大堂整修等居民关切的热点难点问题。结合越秀区党的群众路线教育实践活动前期筹备工作，根据区级领导干部基层联系点分工安排，开展“当一次网格化服务管理网格员、社区居民自治观察员、区域化党建指导员”的体验式活动，区级班子党员领导干部以转换身份的方式体验基层工作，收集社情民意，践行问需于民、问计于民、问效于民，使党在社区网格的形象更加亲民。</p><p style=\"text-align: right; \">2014.01.03
来源：越秀区委组织部</p>','1','100','news','1394762410','1394765670');
INSERT INTO `post` (`id`,`category_id`,`model`,`title`,`alias`,`image_name`,`file_name`,`tinyint1`,`int10`,`char32`,`varchar30`,`varchar50`,`varchar100`,`varchar128`,`content`,`status`,`weight`,`view`,`created_at`,`updated_at`) VALUES
('93','14','news','以“金雁工程”为抓手，搭建企业党员发展平台','fc2e50a5e9848027325f1aaa029ce514','','','0','0','','','','','广州开发区是广州外商投资企业最为密集的区域，共有59个国家在此投资，世界500强企业111家，非公企业经济占全区经济95%以上。在全区近40万就业人员中，90%以上是新生代产业工人和知识分子。怎样服务...','<p>广州开发区是广州外商投资企业最为密集的区域，共有59个国家在此投资，世界500强企业111家，非公企业经济占全区经济95%以上。在全区近40万就业人员中，90%以上是新生代产业工人和知识分子。怎样服务好企业和管理好务工人员，既是推动社会管理创新的重大课题，也是促进和谐稳定的一件大事。为此，广州开发区提出以“金雁工程”为总载体推进党建工作的总体思路，把“金雁工程”列为书记项目大力推动，通过狠抓新生代产业工人和新生代知识分子两大群体服务，科学设置党建目标任务和活动载体，延伸党建链，形成创业链，拓展服务链，实现了党组织、企业、员工“三螺旋”协同共进。</p><p>（一）主要做法</p><p>广州开发区按照“以人为本、共建共享、融合发展”的思路，不断探索创新基层党建理念，推动基层企业党建取得新的成效。</p><p>一是积极探索企业党建的新路径。在全区的各大员工公寓设立了金雁党总支，整合工、青、妇三个群团组织资源，探索建立员工自我管理、自我服务、自我教育的“三自”管理模式，努力把分散在企业的“社会人”转变为进入组织网络的“组织人”。截至目前，已经在员工集中居住的31个公寓区成立了金雁党总支和金雁团委，覆盖员工20余万。广州开发区想方设法在非公企业推动党组织的有效覆盖，比如宝洁公司在2000年成立党委，在全国跨国企业中属于“首例”。公司不但每年拨给党团活动费18万元，还积极探索党员在互联网上过组织生活，解决了党员分散的难题，为同类型企业党建树立了榜样。</p><p>二是积极实施高层次人才党建工程。在区人才交流中心成立“创新创业党支部”，分类指导区内高层次人才企业党建工作，充分发挥高层次人才党员的示范和导向作用，形成“雁阵”效应。在中央“千人计划”人才<st1>张必良教授创办的锐博生物科技公司成立了党支部；帮助周振、石岩峰、叶建山、李阳等高层次人才确认党员身份等等。通过党建工作促进创新创业，使“党管人才”工作落到实处。</st1></p><p>三是着力解决企业和员工的实际需求。近年来，新生代产业工人的就业动机已经从“解决生计”向“全面发展”转变。广州开发区认真把握他们的需求变化，解决他们在就业、医疗、住房、子女上学、社会保障等方面的实际问题，提供从打工落脚、创新创业到扎根发展的全程服务。区财政每年投入2000万元对符合条件的技能人才给予资助，累计安排6000多名外来务工人员子女入读区内公办学校，等等。同时，为了满足员工在自我发展方面的需求，区财政还投资近3亿元，与广州康大科技产业有限公司合作兴办广州康大职业技术学院、广州开发区技工学校，打造区职业教育阵地。</p><p>四是开展人文关怀活动丰富企业党建载体。区内绝大多数企业员工都是80后，这些年轻人文化水平普遍较高，对生活交友和融入城市有着强烈的需求，为此，广州开发区根据他们的兴趣、特长和愿望，在经费和场地上给予一定的支持，帮助他们成立了金雁文学社、金雁艺术团、羽毛球协会、电影队等一系列青年社团，组织开展适宜新生代产业工人的各类活动，既满足了员工的需求，也丰富了企业党建载体。</p><p>目前，“金雁工程”书记项目在各员工公寓已建立“金雁党工青妇一体化”项目点60个，树立示范点10个，使党建工作向“两新”组织八小时以外延伸，向企业员工集中居住地——员工楼延伸，实现党的组织和党的工作在“两新”组织的有效覆盖。</p><p>（二）主要成效</p><p>经过多年的实践探索，“金雁工程”为党组织发挥作用提供了广阔平台，金雁党组织已经成为推动企业发展、维护社会稳定、促进员工自我增值不可或缺的核心力量。</p><p>一是实现了基层党建与企业发展互动双赢。把党建工作有机地融入企业的经济活动之中，与企业的发展形成良性互动。金发科技、万绿达等企业党组织围绕生产中的技术难题，在党员中开展了征集意见、科技攻关活动，解决了公司发展中的难题，很好地将创先争优活动和企业经营结合起来，实现了党的建设和企业发展相互促进。在外资企业中党员也逐步成长为公司的骨干，美资企业捷普电子在党员当中培养了70多名骨干中层人员，日资企业三菱公司有党员100多人，公司班长以上的管理人员接近50%是党员，通过发挥党员在生产建设中的先锋带头作用，企业更加重视基层党建工作，许多企业还拨出了专项经费支持党组织的活动。</p><p>二是有效维护了社会和谐稳定。近年来，广州开发区率先在全市创建劳动关系和谐工业园区，充分发挥金雁党组织的作用，密切联系企业党员员工，切实做到掌握第一手信息、抓住第一时间、到达第一现场，把矛盾纠纷解决在萌芽状态，2012年区内群体劳资纠纷同比下降了38.2%。一些公司党支部专门设立了“走访日”制度，每月至少1次走访一线员工，听取员工们对党建、公司的看法和合理化建议，构建了和谐劳资关系。</p><p>三是促进了新生代产业工人的自我提升。三菱、伊林、珍宝等公司在投产或经营之初就成立了工会组织，并逐步发展了党组织，一些党员由于出色的工作表现和良好的个人形象，得到了广大员工的认同，他们有的被民主选举为工会主席，有的担任了党组织书记。近年来，广州开发区成功推荐新生代产业工人和知识分子当选区人大代表和政协委员，为他们参与政治、经济、社会事务提供机会，让他们生活的有尊严、有价值、有希望。</p><p style=\"text-align: right; \">2014.01.04来源：广州开发区、萝岗区委组织部</p>','1','100','news','1394762533','1394765659');
INSERT INTO `post` (`id`,`category_id`,`model`,`title`,`alias`,`image_name`,`file_name`,`tinyint1`,`int10`,`char32`,`varchar30`,`varchar50`,`varchar100`,`varchar128`,`content`,`status`,`weight`,`view`,`created_at`,`updated_at`) VALUES
('94','14','news','穗白云区353个经济社建起党支部','3208fcc505e08b5c131b58707a31fe0e','','','0','0','','','','','近年来，城市化转制社区、行政村辖下的生产社出现了基层组织涣散的苗头。记者昨日从广州市白云区委获悉，该区已在353个经济社建起党支部，以健全党的基层组织体系。同时，白云区还通过推进集体经济组织“三资”管...','<p>近年来，城市化转制社区、行政村辖下的生产社出现了基层组织涣散的苗头。记者昨日从广州市白云区委获悉，该区已在353个经济社建起党支部，以健全党的基层组织体系。同时，白云区还通过推进集体经济组织“三资”管理改革、选派优秀机关干部挂任基层村社党组织等方式，切实提升基层组织建设水平。</p><p>1年前，省委巡视组驻白云区巡视后，干部群众集中反映了区内有些基层组织软弱涣散、战斗力不强等问题。根据巡视组意见，白云区将基层组织建设管理列为重点工作之一。</p><p>白云区委组织部有关负责人表示，他们在调研中发现，生产社作为最末端的基层组织，拥有不少集体“三资”（资产、资金、资源）的处置权，但监管却一直处于真空地带，党组织的领导核心作用逐渐弱化，容易滋生腐败问题。为此，白云区利用换届选举的契机，已在全区353个经济社中建起了党支部，理顺持有集体经济组织股份成员的组织关系，把他们的组织关系转回经济社。目前，白云区还探索建立起党员议事会制度，明确规定以经济社名义签订的经济合同须由党支部成员全程参与监督、见证。</p><p>有了这一步，白云区顺利完成经济社集体“三资”的确权工作，并建立起“三资”管理交易平台和财务交易平台，实现网上实时管理监督。截至2013年11月底，白云区通过平台完成交易137宗，原合同总价为1.2亿元，公开交易总标的额为2.28亿元，租金提升率约为90.4%，实现阳光交易的同时，大幅提高了集体经济收益。</p><p>为提升基层党组织的治理能力，白云区还选派优秀机关干部210人次，全覆盖进驻全区118条行政村和48个街道集体经济组织，并挂任党组织副书记，增强村社班子力量。针对15个矛盾突出的“问题村”，选派处级干部担任村社党组织第一书记，了解社情民意，解决民生难题，推动重点工作，协助村社治理走上正轨。目前，这一经验已在广州市部分区县推开。</p><p>党建创新换来了基层和谐稳定。去年以来，白云区有19个街道集体经济组织进行党组织换届，20个进行社委会换届，占全区街道集体经济组织总数的近半。截至目前，换届工作进展顺利，一批重点整治基层组织通过选优配强新班子，村社面貌焕然一新。此举为今年即将全面推开的村、社区“两委”换届选举工作积累了经验，打下了基础。</p><p style=\"text-align: right; \">2014.01.06来源：《南方日报》</p>','1','100','news','1394762817','0');
INSERT INTO `post` (`id`,`category_id`,`model`,`title`,`alias`,`image_name`,`file_name`,`tinyint1`,`int10`,`char32`,`varchar30`,`varchar50`,`varchar100`,`varchar128`,`content`,`status`,`weight`,`view`,`created_at`,`updated_at`) VALUES
('95','14','news','省委全面深化改革领导小组第一次会议在广州召开  贯彻中央部署 把握正确方向 加强统筹协调 推动我省各项改革迈出坚实步伐取得扎实成效 ','7dfbf0643e06756c2b54abde098389d0','','','0','0','','','','','2月10日上午，省委书记、省委全面深化改革领导小组组长胡春华主持召开省委全面深化改革领导小组第一次会议，学习贯彻习近平总书记在中央全面深化改革领导小组第一次会议上的重要讲话精神，研究了省委全面深化改革...','<p><p>2月10日上午，省委书记、省委全面深化改革领导小组组长胡春华主持召开省委全面深化改革领导小组第一次会议，学习贯彻习近平总书记在中央全面深化改革领导小组第一次会议上的重要讲话精神，研究了省委全面深化改革领导小组近期工作。他强调，今年是全面深化改革开局起步之年，要迅速行动，贯彻落实中央出台的改革任务措施，扎实推进我省13项重点改革任务，督促和支持各市推进改革，推动我省今年各项改革迈出坚实步伐，取得扎实成效。</p><p>省委副书记、省委全面深化改革领导小组副组长朱小丹、马兴瑞等出席了会议。</p><p>会议审议通过了《中共广东省委全面深化改革领导小组工作规则》、《中共广东省委全面深化改革领导小组专项小组工作规则》、《中共广东省委全面深化改革领导小组办公室工作细则》；审议通过了省委全面深化改革领导小组下设经济体制和生态文明体制改革、民主法制领域改革、文化体制改革、社会体制改革、党的建设制度改革、纪律检查体制改革6个专项小组名单；审议通过了《广东省全面推开工商注册制度改革工作方案》、《广东省人民政府关于取消和下放一批行政审批项目的决定》等改革工作方案。</p><p>胡春华指出，习近平总书记在中央全面深化改革领导小组第一次会议上的重要讲话，为我省推进全面深化改革、做好省委全面深化改革领导小组各项工作指明了方向。我们要认真学习领会和贯彻落实好习近平总书记的重要讲话精神，进一步深化对十八届三中全会关于推进全面深化改革精神的理解，切实把思想和行动统一到中央要求上来，正确把握当前全面深化改革的形势，奋发有为把我省全面深化改革工作推向前进。</p><p>胡春华强调，省委全面深化改革领导小组贯彻落实中央要求，负责全省改革的总体设计、统筹协调、整体推进、督促落实。领导小组、专项小组和办公室要切实负起责任，发挥好职能作用。一要强化责任担当。敢于负责，攻坚克难，以好的作风抓改革，牢牢把握改革正确方向，在中央的统一部署下做好推动改革的各项工作。二要加强学习和调研。把中央和省委关于全面深化改革工作的精神学习好、消化透，把调查研究贯穿改革工作全过程，坚持问题导向，在深入调研中发现问题、解决问题，把改革工作引向深入。三要加强统筹协调。统筹推进全面改革工作和重点改革任务，把重点改革和面上改革结合起来，立足当前、着眼长远，协调各方面关系，做好政策统筹、方案统筹、力量统筹、进度统筹工作。四要抓好督查落实。对中央的部署和省委改革工作的安排，要分解任务，明确责任，成熟一项、研究一项、推进一项，一项一项抓落实。五要形成高效运转机制。要建好工作机制，做到既各司其职、各负其责又加强协作配合，形成工作合力，保障各项工作高效运转。</p><p>省委全面深化改革领导小组成员、相关单位负责人参加了会议。</p></p><p style=\"text-align: right; \">2014.02.12
来源：《南方日报》</p>','1','100','news','1394762941','0');
INSERT INTO `post` (`id`,`category_id`,`model`,`title`,`alias`,`image_name`,`file_name`,`tinyint1`,`int10`,`char32`,`varchar30`,`varchar50`,`varchar100`,`varchar128`,`content`,`status`,`weight`,`view`,`created_at`,`updated_at`) VALUES
('96','14','news','万庆良到天河区调研村社区“两委”换届选举和群众路线教育实践活动 解决好服务群众“最后一公里”问题 ','843ae4468b52a92325bd56fe2cac8ba1','','','0','0','','','','','2月16日上午，广州市委书记万庆良到第二批党的群众路线教育实践活动联系点天河区，就学习贯彻党的十八届三中全会精神，深化基层管理体制机制改革，推进村、社区“两委”换届选举，开展党的群众路线教育实践活动进...','<p><p>2月16日上午，广州市委书记万庆良到第二批党的群众路线教育实践活动联系点天河区，就学习贯彻党的十八届三中全会精神，深化基层管理体制机制改革，推进村、社区“两委”换届选举，开展党的群众路线教育实践活动进行调研指导。市直有关部门和天河区负责人参加。</p><p>万庆良先后走访了岑村、车陂经济发展有限公司和车陂街广氮社区，实地了解“村改居”改制公司运营以及村、社区“两委”换届选举推进情况。他强调，要以全面深化改革为契机，围绕深化改制公司改革，深入开展调查研究，理顺改制社区公共服务权责利关系，完善基层治理体制机制。要加大问题村和社区的整治力度，依法有序推进村、社区“两委”换届选举工作，为推进新型城市化发展固本强基。</p><p>万庆良对天河区党的群众路线教育实践活动前一阶段工作给予充分肯定。他要求，深入学习领会习近平总书记系列讲话精神，以整风精神扎实推进教育实践活动，认真做好规定动作，创新自选动作，着重从遵守党的政治纪律、执行中央八项规定和反对“四风”等方面深入查摆问题，着力在解决问题上下功夫，真正解决好服务群众“最后一公里”的问题，确保教育实践活动不虚、不偏、不空，把为人民服务落到实处，为全市作出示范。</p></p><p style=\"text-align: right; \">2014.02.17
来源：《广州日报》</p>','1','100','news','1394763070','0');
INSERT INTO `post` (`id`,`category_id`,`model`,`title`,`alias`,`image_name`,`file_name`,`tinyint1`,`int10`,`char32`,`varchar30`,`varchar50`,`varchar100`,`varchar128`,`content`,`status`,`weight`,`view`,`created_at`,`updated_at`) VALUES
('97','14','news','天河区社会组织党工委召开社会组织开展党的群众路线教育实践活动动员会','8c060a319c89a31bfc2d633b4ceb0609','','','0','0','','','','','2014年3月6日-7日，在广东青年干部学院，天河区社会组织党工委组织召开了“为民务实清廉 共创幸福天河——党的群众路线教育实践主题活动暨社会组织业务培训会议”，天河区社会组织党工委书记李春兰、副书记...','<p>2014年3月6日-7日，在广东青年干部学院，天河区社会组织党工委组织召开了“为民务实清廉 共创幸福天河——党的群众路线教育实践主题活动暨社会组织业务培训会议”，天河区社会组织党工委书记李春兰、副书记崔伟雄和我区各社会组织负责人共312人参加了会议。</p><p>会上，李春兰书记就社会组织党组织深入开展党的群众路线教育实践活动作了动员讲话，她指出，社会组织离不开党的领导，做好党建工作对社会组织发展壮大具有明显的促进作用，社会组织要响应党和政府的号召，积极开展群众路线教育实践活动。李春兰书记对开展活动的指导思想、目标、方式和要求作出了具体要求和部署。会上，区社会组织党工委还向参会社会组织负责人发出了问卷和作风建设民主评议表，希望各个组织对党工委的工作及践行群众路线提出意见和建议。之后，社会组织管理部门还对社会组织相关工作人员进行业务培训。 </p><p>此次会议，得到了参会社会组织的欢迎和肯定，为区社会组织党工委接下来深入开展党的群众路线教育实践活动打下了坚实的基础。</p><p style=\"text-align: right; \">2014.03.11
来源：天河区民政局</p>','1','100','news','1394763173','0');



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
