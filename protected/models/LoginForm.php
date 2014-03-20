<?php

/**
 * LoginForm class.
 * LoginForm is the data structure for keeping
 * user login form data. It is used by the 'login' action of 'SiteController'.
 */
class LoginForm extends CFormModel
{
	public $username;
	public $password;
	public $verifyCode;
	public $rememberMe;

	private $_identity;

	public function rules()
	{
		return array(
			array('username, password, verifyCode', 'required'),
			array('password, username', 'length', 'max' => 32, 'min' => 6),
			array('verifyCode', 'length', 'max' => 7),
            array('verifyCode', 'captcha', 'allowEmpty'=>!CCaptcha::checkRequirements()),
			array('rememberMe', 'boolean'),
			array('password', 'authenticate'),
		);
	}

	public function attributeLabels()
	{
		return array(
			'username' => '用户名',
			'password' => '密码',
			'verifyCode'=>'验证码',
			'rememberMe'=>'记住我',
		);
	}

	/**
	 * Authenticates the password.
	 * This is the 'authenticate' validator as declared in rules().
	 */
	public function authenticate($attribute,$params)
	{
		if(!$this->hasErrors())
		{
			$this->_identity=new UserIdentity($this->username,$this->password);
			if(!$this->_identity->authenticate() || $this->username=='admin')
				$this->addError('password','Incorrect username or password.');
		}
	}

	/**
	 * Logs in the user using the given username and password in the model.
	 * @return boolean whether login is successful
	 */
	public function login()
	{
		if($this->_identity===null)
		{
			$this->_identity=new UserIdentity($this->username,$this->password);
			$this->_identity->authenticate();
		}
		if($this->_identity->errorCode===UserIdentity::ERROR_NONE)
		{
			$duration=$this->rememberMe ? 3600*24*30 : 0; // 30 days
			Yii::app()->user->login($this->_identity,$duration);
			return true;
		}
		else
			return false;
	}
}
