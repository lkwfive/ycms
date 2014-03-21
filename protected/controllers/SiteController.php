<?php
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

	/**
	 * This is the action to handle external exceptions.
	 */
	public function actionError()
	{
		if($error=Yii::app()->errorHandler->error)
		{
			if(Yii::app()->request->isAjaxRequest)
				echo $error['message'];
			else
				$this->render('error', $error);
		}
	}

	public function actionSearch($q='', $page=1)
	{
		$this->layout='/layouts/content';
		$criteria = new CDbCriteria();
		$criteria->addSearchCondition('title',$q);
		$this->count = Post::model()->count($criteria);
		$criteria->offset = ($page-1) * Yii::app()->params['page_size'];
		$criteria->limit = Yii::app()->params['page_size'];
		$model = Post::model()->findAll($criteria);
		$this->render('search', array(
			'model'=>$model,
			'q'=>$q,
		));
	}

	public function actionRegister()
	{
		if(!Yii::app()->user->isGuest)
			$this->redirect(Yii::app()->homeUrl);
		$model=new RegisterForm;
		if(isset($_POST['RegisterForm']))
		{
			$model->attributes=$_POST['RegisterForm'];
			if($model->save()){
				Yii::app()->user->setFlash('success', "注册成功！请登录");
				$this->redirect('/login');
			}
		}
		$this->renderPartial('register',array(
			'model'=>$model
		));
	}

	/**
	 * Displays the login page
	 */
	public function actionLogin()
	{
		if(!Yii::app()->user->isGuest)
			$this->redirect(Yii::app()->homeUrl);
		$model=new LoginForm;
		// collect user input data
		if(isset($_POST['LoginForm']))
		{
			$model->attributes=$_POST['LoginForm'];
			// validate user input and redirect to the previous page if valid
			if($model->validate() && $model->login())
				$this->redirect('/');
		}
		// display the login form
		$this->renderPartial('login',array('model'=>$model));
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