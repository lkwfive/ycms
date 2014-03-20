<?php
class SettingWatermarkForm extends CFormModel
{
	public $closed=0;
	public $proportion;
	public $right_margin;
	public $bottom_margin;
	public $file;

	/**
	 * Declares the validation rules.
	 */
	public function rules()
	{
		return array(
			array('closed', 'boolean'),
			array('proportion', 'length', 'max'=>4),
			array('right_margin, bottom_margin', 'numerical', 'integerOnly'=>true),
			array('file', 'file', 'maxSize'=>Yii::app()->params['upload_image_size'], 'types'=>'png', 'allowEmpty'=>true),
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
	 		'closed' => '开启水印',
			'proportion' => '与原图比例',
			'right_margin' => '右边距',
			'bottom_margin' => '下边距',
			'file' => '水印图片',
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
        //保存水印图片
        if($this->file)
        	UploadFile::saveWatermark($this->file);

        if(Yii::app()->setting->set('site', 'watermark', $this->attributes));
        	return true;
        return false;
	}

	public static function getContent()
	{
		return Yii::app()->setting->get('site', 'watermark');
	}
}