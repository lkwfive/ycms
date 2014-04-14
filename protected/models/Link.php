<?php

/**
 * This is the model class for table "link".
 *
 * The followings are the available columns in table 'link':
 * @property string $id
 * @property string $pid
 * @property string $title
 * @property string $url
 * @property integer $target
 * @property string $type
 * @property integer $power
 * @property integer $visible
 */
class Link extends BaseModel
{
	const
		TYPE_NAVIGATION = 1,	//导航
		TYPE_LINKS = 2, 		//友情链接

		VISIBLE_HIDE = 0,
		VISIBLE_SHOW = 1
	;

	public static $types = array(
		self::TYPE_NAVIGATION => '导航栏',
		self::TYPE_LINKS => '友情链接',
	);

	public static $targets = array(
		0 => '当前窗口打开',
		1 => '新窗口打开',
	);

	public static $visibles = array(
		self::VISIBLE_HIDE => '隐藏',
		self::VISIBLE_SHOW => '显示',
	);	

	/**
	 * @return string the associated database table name
	 */
	public function tableName()
	{
		return 'link';
	}

	/**
	 * @return array validation rules for model attributes.
	 */
	public function rules()
	{
		// NOTE: you should only define rules for those attributes that
		// will receive user inputs.
		return array(
			array('title, url, target, type, visible', 'required'),
			array('target, power, visible', 'numerical', 'integerOnly'=>true),
			array('pid', 'length', 'max'=>10),
			array('title', 'length', 'max'=>30),
			array('url', 'length', 'max'=>255),
			array('type', 'length', 'max'=>1),
			// The following rule is used by search().
			// @todo Please remove those attributes that should not be searched.
			array('id, pid, title, url, target, type, power, visible', 'safe', 'on'=>'search'),
		);
	}

	/**
	 * @return array relational rules.
	 */
	public function relations()
	{
		// NOTE: you may need to adjust the relation name and the related
		// class name for the relations automatically generated below.
		return array(
		);
	}

	/**
	 * @return array customized attribute labels (name=>label)
	 */
	public function attributeLabels()
	{
		return array(
			'id' => 'ID',
			'pid' => '上级链接',
			'title' => '标题',
			'url' => '链接地址',
			'target' => '是否新窗口打开',
			'type' => '类型',
			'power' => '排序',
			'visible' => '是否显示',
		);
	}

	/**
	 * Retrieves a list of models based on the current search/filter conditions.
	 *
	 * Typical usecase:
	 * - Initialize the model fields with values from filter form.
	 * - Execute this method to get CActiveDataProvider instance which will filter
	 * models according to data in model fields.
	 * - Pass data provider to CGridView, CListView or any similar widget.
	 *
	 * @return CActiveDataProvider the data provider that can return the models
	 * based on the search/filter conditions.
	 */
	public function search()
	{
		// @todo Please modify the following code to remove attributes that should not be searched.

		$criteria=new CDbCriteria;

		$criteria->compare('id',$this->id,true);
		$criteria->compare('pid',$this->pid,true);
		$criteria->compare('title',$this->title,true);
		$criteria->compare('url',$this->url,true);
		$criteria->compare('target',$this->target);
		$criteria->compare('type',$this->type,true);
		$criteria->compare('power',$this->power);
		$criteria->compare('visible',$this->visible);

		return new CActiveDataProvider($this, array(
			'criteria'=>$criteria,
		));
	}

	/**
	 * Returns the static model of the specified AR class.
	 * Please note that you should have this exact method in all your CActiveRecord descendants!
	 * @param string $className active record class name.
	 * @return Link the static model class
	 */
	public static function model($className=__CLASS__)
	{
		return parent::model($className);
	}
}
