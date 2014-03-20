<?php
class SettingSiteInfoForm extends CFormModel
{
	public $name;
	public $url;
	public $keyword;
	public $description;
	public $admin_email;
	public $copyright;
	public $icp;
	public $code;
	public $closed=0;

	/**
	 * Declares the validation rules.
	 */
	public function rules()
	{
		return array(
			array('name, url, admin_email', 'required'),
			array('closed', 'boolean'),
			array('admin_email', 'email'),
			array('keyword, description, copyright, icp, code', 'safe'),
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
	 		'name' => '网站名称',
			'url' => '网站链接地址',
			'keyword' => '网站关键词',
			'description' => '网站介绍',
			'admin_email' => '管理员邮箱',
			'copyright' => '网站版权',
			'icp' => '网站备案号',
			'code' => '统计代码',
			'closed' => '关闭网站',
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
        if(Yii::app()->setting->set('site', 'info', $this->attributes));
        	return true;
        return false;
	}

	public static function getContent()
	{
		return Yii::app()->setting->get('site', 'info');
	}
}