<?php

/**
 * UserIdentity represents the data needed to identity a user.
 * It contains the authentication method that checks if the provided
 * data can identity the user.
 */
class UserIdentity extends CUserIdentity
{
	private $_id;

	/**
	 * Authenticates a user.
	 * The example implementation makes sure if the username and password
	 * are both 'demo'.
	 * In practical applications, this should be changed to authenticate
	 * against some persistent user identity storage (e.g. database).
	 * @return boolean whether authentication succeeds.
	 */
	public function authenticate()
	{
		if($this->username=='admin'){
			$this->_id = 1;
			$users=array(
				'admin'=>'admin',
			);
			if(!isset($users[$this->username]))
				$this->errorCode=self::ERROR_USERNAME_INVALID;
			elseif($users[$this->username]!==$this->password)
				$this->errorCode=self::ERROR_PASSWORD_INVALID;
			else
				$this->errorCode=self::ERROR_NONE;
			return !$this->errorCode;
		}
		$user = User::model()->find('username=:username',array(':username'=>$this->username));
		if($user===null)
			$this->errorCode=self::ERROR_USERNAME_INVALID;
		elseif($user->password!==User::generateHash($this->password))
			$this->errorCode=self::ERROR_PASSWORD_INVALID;
		else
			$this->errorCode=self::ERROR_NONE;
		$user->saveAttributes(array('login_at'=>Yii::app()->params['now']));
		return !$this->errorCode;
	}

	public function getId()
	{
		return $this->_id;
	}
}