<?php

class m131123_142234_init extends CDbMigration
{
	public function up()
	{
		$sql=<<<EOF
		-- --------------------------------------------------------

		--
		-- 表的结构 `category`
		--

		CREATE TABLE IF NOT EXISTS `category` (
		  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
		  `root` int(10) unsigned DEFAULT NULL,
		  `lft` int(10) unsigned NOT NULL,
		  `rgt` int(10) unsigned NOT NULL,
		  `level` smallint(5) unsigned NOT NULL,
		  `name` varchar(255) NOT NULL,
		  `model` varchar(10) NOT NULL COMMENT '所属模型',
		  `view` varchar(30) NOT NULL COMMENT '指定视图',
		  `status` tinyint(1) NOT NULL COMMENT '是否显示到导航',
		  PRIMARY KEY (`id`),
		  KEY `root` (`root`),
		  KEY `lft` (`lft`),
		  KEY `rgt` (`rgt`),
		  KEY `level` (`level`)
		) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='分类表' AUTO_INCREMENT=1 ;

		-- --------------------------------------------------------

		--
		-- 表的结构 `contact`
		--

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
		) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='留言' AUTO_INCREMENT=1 ;

		-- --------------------------------------------------------

		--
		-- 表的结构 `post`
		--

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
		) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='单篇文章' AUTO_INCREMENT=1 ;

		-- --------------------------------------------------------

		--
		-- 表的结构 `settings`
		--

		CREATE TABLE IF NOT EXISTS `settings` (
		  `id` int(11) NOT NULL AUTO_INCREMENT,
		  `category` varchar(64) NOT NULL DEFAULT 'system',
		  `key` varchar(255) NOT NULL,
		  `value` text NOT NULL,
		  PRIMARY KEY (`id`),
		  KEY `category_key` (`category`,`key`)
		) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

		-- --------------------------------------------------------

		--
		-- 表的结构 `tbl_migration`
		--

		CREATE TABLE IF NOT EXISTS `tbl_migration` (
		  `version` varchar(255) NOT NULL,
		  `apply_time` int(11) DEFAULT NULL,
		  PRIMARY KEY (`version`)
		) ENGINE=InnoDB DEFAULT CHARSET=utf8;

		-- --------------------------------------------------------

		--
		-- 表的结构 `user`
		--

		CREATE TABLE IF NOT EXISTS `user` (
		  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
		  `username` varchar(30) NOT NULL,
		  `password` char(32) NOT NULL,
		  `email` varchar(255) NOT NULL,
		  `login_at` int(10) unsigned NOT NULL DEFAULT '0',
		  `created_at` int(10) unsigned NOT NULL,
		  PRIMARY KEY (`id`)
		) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='用户表' AUTO_INCREMENT=1 ;

EOF;
		$this->execute($sql);
	}

	public function down()
	{
		echo "m131123_142234_init does not support migration down.\n";
		return false;
	}

	/*
	// Use safeUp/safeDown to do migration with transaction
	public function safeUp()
	{
	}

	public function safeDown()
	{
	}
	*/
}