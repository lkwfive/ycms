<?php

/**
 * This is the model class for table "article".
 *
 * The followings are the available columns in table 'article':
 * @property string $id
 * @property string $alias
 * @property string $category_id
 * @property string $model_name
 * @property string $title
 * @property string $title_color
 * @property string $subtitle
 * @property string $summary
 * @property string $picture
 * @property string $source
 * @property string $author
 * @property string $tags
 * @property string $user_id
 * @property string $update_user_id
 * @property integer $status
 * @property string $template
 * @property integer $power
 * @property integer $position
 * @property string $views
 * @property string $created_at
 * @property string $updated_at
 */
class Article extends BaseModel
{
	const
		STATUS_SHOW = 1,		//显示
		STATUS_HIDE = 0,		//隐藏
		// STATUS_DELETE = -1,		//删除

		MODEL_ARTICLE = 'article',	//文章模型

		TEMPLATE_ARTICLE = 'article',	//文章模版

		POSITION_DEFAULT = 0,		//默认位置
		POSITION_TOP = 100		//头条
	;

	public static $status = array(
		self::STATUS_SHOW => '显示',
		self::STATUS_HIDE => '隐藏',
		// self::STATUS_DELETE => '删除',
	);

	public static $models = array(
		self::MODEL_ARTICLE => '文章',
	);

	public static $templates = array(
		self::TEMPLATE_ARTICLE => 'article',
	);

	public static $position = array(
		self::POSITION_DEFAULT => '默认位置',
		self::POSITION_TOP => '头条',
	);

	public function behaviors() {
		$behaviros = parent::behaviors();
        return CMap::mergeArray($behaviros,array(
        	'seo'=>array(
        		'class'=>'ext.seo.components.SeoRecordBehavior',
        		'route'=>'site/v',
        		'params'=>array('alias'=>$this->alias),
        	),
        ));
    }

	public function beforeSave()
	{
		$parent = parent::beforeSave();
		if(empty($this->alias))
			$this->alias = md5($this->created_at);
		if($this->getIsNewRecord())
			$this->user_id = Yii::app()->user->id;
		$this->update_user_id = Yii::app()->user->id;
		return $parent;
	}

	/**
	 * @return string the associated database table name
	 */
	public function tableName()
	{
		return 'article';
	}

	/**
	 * @return array validation rules for model attributes.
	 */
	public function rules()
	{
		// NOTE: you should only define rules for those attributes that
		// will receive user inputs.
		return array(
			array('model_name, title, status, template', 'required'),
			array('status, power, position', 'numerical', 'integerOnly'=>true),
			array('id, category_id, user_id, update_user_id,  created_at, updated_at', 'length', 'max'=>10),
			array('model_name, author, template', 'length', 'max'=>30),
			array('title, subtitle, source', 'length', 'max'=>100),
			array('title_color', 'length', 'max'=>6),
			array('summary, tags, alias', 'length', 'max'=>255),
			array('picture', 'length', 'max'=>32),
			// The following rule is used by search().
			// @todo Please remove those attributes that should not be searched.
			array('id, category_id, model_name, title, title_color, subtitle, summary, picture, source, author, tags, user_id, update_user_id, status, template, power, position, views, created_at, updated_at', 'safe', 'on'=>'search'),
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
			'Profile' => array(self::HAS_ONE, 'ArticleProfile', 'article_id'),
		);
	}

	/**
	 * @return array customized attribute labels (name=>label)
	 */
	public function attributeLabels()
	{
		return array(
			'id' => 'ID',
			'alias' => '链接别名',
			'category_id' => '分类id',
			'model_name' => '模型名称',
			'title' => '标题',
			'title_color' => '标题颜色',
			'subtitle' => '副标题',
			'summary' => '摘要',
			'picture' => '图片hash',
			'source' => '来源',
			'author' => '作者',
			'tags' => '标签',
			'user_id' => '发布用户id',
			'update_user_id' => '更新用户id',
			'status' => '状态',
			'template' => '视图模版',
			'power' => '权重',
			'position' => '位置',
			'views' => '流览量',
			'created_at' => '创建时间',
			'updated_at' => '更新时间',
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
		$criteria->compare('alias',$this->alias,true);
		$criteria->compare('category_id',$this->category_id,true);
		$criteria->compare('model_name',$this->model_name,true);
		$criteria->compare('title',$this->title,true);
		$criteria->compare('title_color',$this->title_color,true);
		$criteria->compare('subtitle',$this->subtitle,true);
		$criteria->compare('summary',$this->summary,true);
		$criteria->compare('picture',$this->picture,true);
		$criteria->compare('source',$this->source,true);
		$criteria->compare('author',$this->author,true);
		$criteria->compare('tags',$this->tags,true);
		$criteria->compare('user_id',$this->user_id,true);
		$criteria->compare('update_user_id',$this->update_user_id,true);
		$criteria->compare('status',$this->status);
		$criteria->compare('template',$this->template,true);
		$criteria->compare('power',$this->power);
		$criteria->compare('position',$this->position);
		$criteria->compare('views',$this->views,true);
		$criteria->compare('created_at',$this->created_at,true);
		$criteria->compare('updated_at',$this->updated_at,true);

		return new CActiveDataProvider($this, array(
			'criteria'=>$criteria,
		));
	}

	/**
	 * Returns the static model of the specified AR class.
	 * Please note that you should have this exact method in all your CActiveRecord descendants!
	 * @param string $className active record class name.
	 * @return Article the static model class
	 */
	public static function model($className=__CLASS__)
	{
		return parent::model($className);
	}

	public static function getList($page = 1)
	{
		$criteria = new CDbCriteria;
		$criteria->compare('status',self::STATUS_SHOW);
		$criteria->order = "power DESC";
		return self::model()->findAll($criteria);
	}
}
