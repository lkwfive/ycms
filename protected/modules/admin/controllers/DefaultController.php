<?php

class DefaultController extends AdminBaseController
{
	/**
	 * 边栏导航
	 * @var array
	 */
	public $menu = array(
	    array('label' => '站点信息', 'icon' => 'th-large', 'url' => array('/admin/default/siteinfo')),
	    array('label' => '水印设置', 'icon' => 'tint', 'url' => array('/admin/default/watermark')),
	);

	/**
	 * 系统信息
	 * @return [type] [description]
	 */
	public function actionIndex()
	{
		if(Yii::app()->user->id != 1)
			$this->redirect('/admin/default/login');

		$this->layout='/layouts/column2';
		$this->render('index');
	}

	public function actionSiteInfo()
	{
		$model = new SettingSiteInfoForm;
		if(isset($_POST['SettingSiteInfoForm'])) {
			$model->attributes = $_POST['SettingSiteInfoForm'];
			if($model->save())
				Yii::app()->user->setFlash('success', '保存成功！');
		}
		$this->render('siteinfo', array(
			'model'=>$model,
		));
	}

	public function actionWatermark($show = false)
	{
		$model=new SettingWatermarkForm;
		//预览水印
		if($show)
			$this->_showWatermark($model);
		//提交表单
		if(isset($_POST['SettingWatermarkForm']))
	    {
	    	$model->attributes=$_POST['SettingWatermarkForm'];
	    	$model->file = CUploadedFile::getInstance($model, 'file');
	        if($model->save())
	        {
	           	Yii::app()->user->setFlash('success', "保存成功！");
	           	$this->refresh();
	        }
	    }
		$this->render('watermark',array('model'=>$model));
	}

	private function _showWatermark(SettingWatermarkForm $options)
	{
		$image = Yii::app()->image->create(Yii::app()->params['upload_path'].'test.jpg');
		if($options->closed)
			$image->createWatermark(Yii::app()->params['upload_path'].'watermark.png', $options->proportion, $options->right_margin, $options->bottom_margin);
		$image->show();
		die;
	}

	public function actionThumbnails()
	{
		$this->render('watermark',array('model'=>$model));
	}


	/**
	 * Displays the login page
	 */
	public function actionLogin($key='')
	{
		//已登录则跳转到后台首页
		if(Yii::app()->user->id == 1)
			$this->redirect('/admin/');

		$this->layout='/layouts/single';

		$model=new AdminLoginForm;

		// collect user input data
		if(isset($_POST['AdminLoginForm']))
		{
			$model->attributes=$_POST['AdminLoginForm'];
			$model->key=$key;
			// validate user input and redirect to the previous page if valid
			if($model->validate() && $model->login())
				$this->redirect('/admin/');
		}
		// display the login form
		$this->render('login',array('model'=>$model));
	}

	public function actionImage()
	{
		$file = CUploadedFile::getInstanceByName('file');
		$filename = UploadFile::saveImage($file);
		if($filename)
			echo json_encode( array('filelink'=>UploadFile::getImageUrl($filename)) );
		die;
	}

	public function actionImagelist()
	{
		$list_files = glob(Yii::app()->params['upload_image_path'].'*.jpg');
		$r = array();
		foreach ($list_files as $key => $value) {
			$v = str_replace(Yii::app()->params['project_path'], '', $value);
			$r[] = array('filelink'=>$v,'thumb'=>$v,'image'=>$v,'folder'=>'images');
		}
		echo json_encode($r);
		die;
	}

	public function actionFile()
	{
		$file = CUploadedFile::getInstanceByName('file');
		$filename = UploadFile::saveFile($file);
		if($filename)
			echo json_encode( array('filelink'=>UploadFile::getFileUrl($filename),'filename'=>$file->getName()) );
		die;
	}
}