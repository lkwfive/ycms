<?php
class AdminBaseController extends Controller
{
    // public $layout = "/layouts/main";
    public $layout='/layouts/column2';
    /**
	 * @return array action filters
	 */
	public function filters()
	{
		return array(
			'accessControl', // perform access control for CRUD operations
		);
	}

    /**
	 * Specifies the access control rules.
	 * This method is used by the 'accessControl' filter.
	 * @return array access control rules
	 */
	public function accessRules()
	{
		return array(
			array('allow', // allow admin user to perform all actions
				'users'=>array('admin', 'system'),
			),
			array('allow', // allow all user to perform login actions
				'actions'=>array('login'),
			),
			array('deny'),
		);
	}
}