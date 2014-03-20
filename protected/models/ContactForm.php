<?php

/**
 * ContactForm class.
 * ContactForm is the data structure for keeping
 * contact form data. It is used by the 'contact' action of 'SiteController'.
 */
class ContactForm extends CFormModel
{
	public $name;
	public $title;
	public $phone;
	public $email;
	public $qq;
	public $content;
	// public $verifyCode;

	/**
	 * Declares the validation rules.
	 */
	public function rules()
	{
		return array(
			// name, email, subject and body are required
			array('name, title, email, content, phone', 'required'),
			// email has to be a valid email address
			array('email', 'email'),

			array('qq', 'numerical', 'integerOnly'=>true),
			array('name, email, title', 'length', 'max'=>30),
			array('phone', 'length', 'max'=>11),

			// verifyCode needs to be entered correctly
			// array('verifyCode', 'captcha', 'allowEmpty'=>!CCaptcha::checkRequirements()),
			//xss过滤
			array('name, title, phone, email, qq, content', 'ext.validator.XssClean')
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
	 		'name'=>'姓名',
	 		'phone'=>'电话',
	 		'email'=>'邮箱',
	 		'qq'=>'qq',
	 		'content'=>'内容',
			// 'verifyCode'=>'验证码',
		);
	}

	public function save()
	{
		if(!$this->validate())
            return FALSE;
        $contact = new Contact;
        $contact->attributes = $this->attributes;
        if($contact->save()){
        	return true;
        }
        return false;
	}

	public function getErrorsToString()
	{
		if($e = $this->getErrors()) {
			$r = array();
			foreach ($e as $key => $value) {
				$r[$key] = $value[0];
			}
		}
		return implode('\n\r', $r);
	}

}