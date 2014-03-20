<?php
class RegisterForm extends CFormModel
{
	public $username;
	public $password;
	public $rpassword;
	public $email;
	public $verifyCode;

	public function rules()
	{
		return array(
			array('email, username, password, rpassword, verifyCode', 'required'),
			array('rpassword', 'compare', 'compareAttribute' => 'password', 'message' => '两次输入的密码不符'),
			array('password, rpassword, username', 'length', 'max' => 32, 'min' => 6),
			array('verifyCode', 'length', 'max' => 7),
            array('verifyCode', 'captcha', 'allowEmpty'=>!CCaptcha::checkRequirements()),
            array('username', 'checkUsernameExists'),
		);
	}

	public function checkUsernameExists($attribute,$params)
	{
		if($this->username){
			$exists = User::model()->exists('username=:username',array(':username'=>$this->username));
			if($exists)
				$this->addError('username','用户名已存在');		
		}
	}

	public function attributeLabels()
	{
		return array(
			'username' => '用户名',
			'email' => '邮箱',
			'password' => '密码',
			'password' => '确认密码',
			'verifyCode'=>'验证码',
		);
	}

	public function save()
	{
		if(!$this->validate())
            return false;
        $model = new User;
        $model->attributes = $this->attributes;
        if($model->save())
        	return true;
        return false;
	}
	
}