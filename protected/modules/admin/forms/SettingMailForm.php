<?php
class SettingMailForm extends CFormModel
{
	public $host;
	public $port;
	public $username;
	public $password;

	public $test_form;
	public $test_to;

	public $_subject;
	public $_body;

	/**
	 * Declares the validation rules.
	 */
	public function rules()
	{
		return array(
			array('host, port, username, password', 'required'),
			array('test_form, test_to', 'email'),
			array('port', 'numerical', 'integerOnly'=>true),
		);
	}

	/**
	 * Declares customized attribute labels.
	 * If not declared here, an attribute would have a label that is
	 * the same as its name with the first letter in upper case.
	 */
	public function attributeLabels()
	{
		return array(
	 		'host'=>'SMTP 服务器',
			'port'=>'端口',
			'username'=>'SMTP 身份验证用户名',
			'password'=>'SMTP 身份验证密码',
			'test_form'=>'测试发件人',
			'test_to'=>'测试收件人',
			'_subject'=>'测试主题',
			'_body'=>'内容',
		);
	}

	public function init()
	{
		$this->attributes = $this->getContent();
		return parent::init();
	}

	public function save()
	{
		if(!$this->validate())
            return FALSE;
        if(Yii::app()->setting->set('site', 'mail', $this->attributes));
        	return true;
        return false;
	}

	public static function getContent()
	{
		return Yii::app()->setting->get('site', 'mail');
	}
}