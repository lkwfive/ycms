<?php
Yii::import('admin.forms.*');
class SiteController extends Controller
{
	public $layout='/layouts/main';
	public $category_name;
	public $count;
	public $action_aliases;
	public $config;
	
	public function init()
	{
		$this->menu = Category::getNavigation();
		$this->config = Yii::app()->setting->get('page', 'webconfig');
		// H::printR($this->config);
	}

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
		$setting_index = Yii::app()->setting->get('page', 'index');
		// H::printR($setting_index);
		$this->render('index', array(
			'setting_index'=>$setting_index,
		));
	}

	

	public function actionPost($alias='')
	{
		$model=$this->_loadPost($alias);
		if($model->category_id)
			$this->_render($model);
		else
			$this->_renderSingle($model);
	}

	protected function _render($model)
	{
		$this->layout='/layouts/content';
		$category=$this->_loadCategory($model->category_id);
		//联系我们重定向
		if($category->view=='contact')
			$this->redirect($category->getUrl());
		//sideMenu
		$this->sideMenu = $this->_getSideMenu($category, $model);
		$this->category_name = $category->name;
		$this->render($model->view.'_view', array(
			'model'=>$model,
			'category'=>$category,
		));
	}

	protected function _renderSingle($model)
	{
		$this->render($model->view.'_view', array(
			'model'=>$model,
		));
	}

	protected function _loadPost($alias)
	{
		$model=Post::model()->find('alias=:alias',array(':alias'=>$alias));
		if($model===null)
			throw new CHttpException(404,'The requested page does not exist.');
		return $model;
	}

	public function actionView($id, $page=1)
	{
		$this->layout='/layouts/content';
		$category=$this->_loadCategory($id);
		//content
		$model=$this->_getModel($category, $page);
		//sideMenu
		$this->sideMenu = $this->_getSideMenu($category, $model);
		$this->category_name = $category->name;
		//使用指定的视图
		$view =$category->view ? $category->view : $category->model;
		//
		
		$this->render($view, array(
			'model'=>$model,
			'category'=>$category,
		));
	}

	protected function _loadCategory($id)
	{
		$model=Category::model()->findByPk($id);
		if($model===null)
			throw new CHttpException(404,'The requested page does not exist.');
		return $model;
	}

	protected function _getModel($category, $page)
	{
		$model_name = $category->view ? $category->view : $category->model;
		switch ($model_name) {
			case Post::POST:
				$model = Post::model()->find('category_id=:id',array(':id'=>$category->id));
				$this->breadcrumbs = array($model->title=>$model->getUrl());
				break;
			case Post::NEWS:
				$criteria = new CDbCriteria();
				if($category->level==1)
					$criteria->addInCondition('category_id',Category::getAllIdByRoot($category->id));
				else
					$criteria->compare('category_id',$category->id);
				$criteria->compare('model',$category->model);
				// $criteria->condition = 'status > 0';
				$this->count = Post::model()->count($criteria);
				$criteria->offset = ($page-1) * Yii::app()->params['page_size'];
				$criteria->limit = Yii::app()->params['page_size'];
				$model = Post::model()->findAll($criteria);
				break;
			case Post::PRODUCT:
				$criteria = new CDbCriteria();
				if($category->level==1)
					$criteria->addInCondition('category_id',Category::getAllIdByRoot($category->id));
				else
					$criteria->compare('category_id',$category->id);
				$criteria->compare('model',$category->model);
				// $criteria->condition = 'status > 0';
				$this->count = Post::model()->count($criteria);
				$criteria->offset = ($page-1) * Yii::app()->params['page_size'];
				$criteria->limit = Yii::app()->params['page_size'];
				$model = Post::model()->findAll($criteria);
				$this->breadcrumbs = array($category->name=>$category->getUrl());
				break;
			case Post::JOB:
				$criteria = new CDbCriteria();
				$criteria->compare('category_id',$category->id);
				$criteria->compare('model',$category->model);
				$model = Post::model()->findAll($criteria);
				break;
			case 'contact':
				$criteria = new CDbCriteria();
				$criteria->compare('category_id',$category->id);
				$criteria->compare('model',$category->model);
				$model = Post::model()->findAll($criteria);
				break;
			case Post::DOWNLOAD:
				$criteria = new CDbCriteria();
				$criteria->compare('category_id',$category->id);
				$criteria->compare('model',$category->model);
				$this->count = Post::model()->count($criteria);
				$criteria->offset = ($page-1) * Yii::app()->params['page_size'];
				$criteria->limit = Yii::app()->params['page_size'];
				$model = Post::model()->findAll($criteria);
				break;
			default:
				# code...
				break;
		}
		return $model;
	}

	protected function _getSideMenu($category, $model)
	{
		$r = array();
		$model_name = $category->view ? $category->view : $category->model;
		switch ($model_name) {
			case Post::POST:
				$models = Post::model()->findAll('category_id=:id',array(':id'=>$category->id));
				foreach ($models as $k => $v) {
					$r[$v->id] = array(
						'label'=>$v->label,
						'url'=>$v->getUrl(),
					);
				}
				if(isset($r[$model->id]))
					$r[$model->id]['active']=true;
				break;
			case Post::NEWS:
				$models = Category::model()->findAll('root=:root AND level=:level',array(':root'=>$category->root,':level'=>2));
				foreach ($models as $k => $v) {
					$r[$v->id] = array(
						'label'=>$v->label,
						'url'=>$v->getUrl(),
					);
				}
				if(isset($r[$category->id]))
					$r[$category->id]['active']=true;
				break;
			case Post::JOB:
				$models = Post::model()->findAll('category_id=:id',array(':id'=>$category->id));
				foreach ($models as $k => $v) {
					$r[$v->id] = array(
						'label'=>$v->label,
						'url'=>'#go'.$v->id,
					);
				}
				break;
			case 'contact':
				$models = Post::model()->findAll('category_id=:id',array(':id'=>$category->id));
				foreach ($models as $k => $v) {
					$r[$v->id] = array(
						'label'=>$v->label,
						'url'=>'#go'.$v->id,
					);
				}
				break;
			default:
				# code...
				break;
		}
		return $r;
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
				// $this->redirect(Yii::app()->homeUrl);
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

	/**
	 * Displays the contact page
	 */
	public function actionContact()
	{
		$this->action_name = '联系我们';
		$this->action_aliases = 'Contact';

		$model=new ContactForm;
		if(isset($_POST['ContactForm']))
		{
			$model->attributes=$_POST['ContactForm'];
			if($model->save()){
				$success = true;
				$model = new ContactForm;
			} else {
				$success = false;
			}
		}
		$content = SettingContactForm::getContent();
		$this->render('contact', array(
			'model'=>$model,
			'content'=>$content,
			'success'=> isset($success) ? $success : '',
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