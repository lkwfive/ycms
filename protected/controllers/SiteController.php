<?php
Yii::import('ext.YiiMailer.YiiMailer');
class SiteController extends Controller
{
	public $layout='/layouts/main';
	
	/**
	 * Declares class-based actions.
	 */
	public function actions()
	{
		return array(
			// page action renders "static" pages stored under 'protected/views/site/pages'
			// They can be accessed via: index.php?r=site/page&view=FileName
			'page'=>array(
				'class'=>'CViewAction',
			),
			'captcha'=>array(
                'class'=>'CCaptchaAction',
                'backColor'=>0xFFFFFF,
            ),
		);
	}

	/**
	 * This is the default 'index' action that is invoked
	 * when an action is not explicitly requested by users.
	 */
	public function actionIndex()
	{
		$models = Article::getList();
		$this->render('index', array(
			'models'=>$models,
		));
	}

	public function actionV($alias)
	{
		$model = Article::model()->with('Profile')->find('alias=?',array($alias));
		$this->render('view', array(
			'model'=>$model,
		));
	}

	/**
	 * Logs out the current user and redirect to homepage.
	 */
	public function actionLogout()
	{
		Yii::app()->user->logout();
		$this->redirect(Yii::app()->homeUrl);
	}
}