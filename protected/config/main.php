<?php
//andmin login url http://yiicms.dev/admin/default/login/key/21232f297a57a5a743894a0e4a801fc3
// uncomment the following to define a path alias
// Yii::setPathOfAlias('local','path/to/local-folder');

// This is the main Web application configuration. Any writable
// CWebApplication properties can be configured here.

Yii::setPathOfAlias('bootstrap', dirname(__FILE__).'/../extensions/bootstrap');

$basePath = dirname(dirname(__FILE__));
$projectPath = dirname($basePath);
$relatively_path = DIRECTORY_SEPARATOR .'public'. DIRECTORY_SEPARATOR .'upload' . DIRECTORY_SEPARATOR;

return array(
	'basePath'=>dirname(__FILE__).DIRECTORY_SEPARATOR.'..',
	'name'=>'ycms',
	'theme'=>'classic',
	'language' => 'zh_cn',
	'timeZone' => 'Asia/Shanghai',
	// preloading 'log' component
	'preload'=>array('log'),

	// autoloading model and component classes
	'import'=>array(
		'application.models.*',
		'application.components.*',
	),

	'modules'=>array(
		// uncomment the following to enable the Gii tool
		'gii' => array(
	        'class' => 'system.gii.GiiModule',
	        'password' => 'gii',
	        // If removed, Gii defaults to localhost only. Edit carefully to taste.
	        // 'ipFilters' => array('192.168.1.183', '::1'),
	        'generatorPaths' => array('bootstrap.gii'),
        ),
        //后台模块
        'admin'=>array(
	        'preload'=>array('bootstrap'),
	        'components'=>array(
	            'bootstrap'=>array(
	                'class' => 'ext.bootstrap.components.Bootstrap',
					'responsiveCss' => true,
		            'enableNotifierJS' => false,
		            'enableBootboxJS' => false,
		        )
	        )
	    ),
        'backup',
	),

	// application components
	'components'=>array(
		'user'=>array(
			// enable cookie-based authentication
			'allowAutoLogin'=>true,
			'loginUrl'=>array('/admin/default/login'),
		),
		// uncomment the following to enable URLs in path-format
		'urlManager'=>array(
			'urlFormat'=>'path',
			'showScriptName'=>false,
			'rules'=>array(
				//管理后台
				'/'=>'site/index',
				'/site/<action:logout>'=>'site/<action>',
				'<controller:\w+>/<action:\w+>/<id:\d+>'=>'<controller>/<action>',
				'<controller:\w+>/<action:\w+>'=>'<controller>/<action>',
			),
		),
		// uncomment the following to use a MySQL database
		'db'=>array(
			'connectionString' => 'mysql:host=localhost;dbname=ycms',
			'emulatePrepare' => true,
			'username' => 'root',
			'password' => '',
			'charset' => 'utf8',
		),
		'errorHandler'=>array(
			// use 'site/error' action to display errors
			'errorAction'=>'site/error',
		),
		'log'=>array(
			'class'=>'CLogRouter',
			'routes'=>array(
				array(
					'class'=>'CFileLogRoute',
					'levels'=>'error, warning',
				),
				// uncomment the following to show log messages on web pages
				/*
				array(
					'class'=>'CWebLogRoute',
				),
				*/
			),
		),
		'bootstrap' => array(
			'class' => 'ext.bootstrap.components.Bootstrap',
			'responsiveCss' => true,
            'enableNotifierJS' => false,
            'enableBootboxJS' => false
  		),
        //图片
        'image' => array(
            'class'=>'ext.EPhpThumb.EPhpThumb',
            'options'=>array(
            	'proportion' => 0.2,
            	'right_margin' => 10,
            	'bottom_margin' => 10,
            ),
        ),
        //input
        'input' => array(
            'class' => 'CmsInput',
        ),
        //缓存
        'cache' => array(
            'class' => 'system.caching.CFileCache',
        	//'class'=>'CApcCache',
        ),
        //全局配置
        'setting' => array(
            'class' => 'ext.Setting',
            'cacheComponentId' => 'cache',
            'cacheId' => 'global_website_settings',
            'cacheTime' => 84000,
            'tableName' => 'settings',
            'dbComponentId' => 'db',
            'createTable' => true,
            'dbEngine' => 'MyISAM',
        ),
	),

	// application-level parameters that can be accessed
	// using Yii::app()->params['paramName']
	'params'=>array(
		// this is used in contact page
		'adminEmail'=>'webmaster@example.com',
		//上传图片大小
        'upload_image_size' => (1024 * 1024 * 1),
        //上传行程文档大小
        'upload_doc_size' => (1024 * 1024 * 5),
        //项目路径
        'project_path' => $projectPath.DIRECTORY_SEPARATOR.'public',
        //上传路径
        'upload_path' => $projectPath.$relatively_path,
        //图片上传路径
        'upload_image_path' => $projectPath.$relatively_path.'images'.DIRECTORY_SEPARATOR,
        //文件上传路径
        'upload_file_path' => $projectPath.$relatively_path.'files'.DIRECTORY_SEPARATOR,
        //分页
        'page_size' => 10,
        //系统运行时间
        'now' => time(),
        //key
        'key' => 'a2a8a4818b53dc32d77024592d40f744',
	),
	// 'defaultController' => 'default',
);