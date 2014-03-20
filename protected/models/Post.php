<?php

/**
 * This is the model class for table "post".
 *
 * The followings are the available columns in table 'post':
 * @property string $id
 * @property string $category_id
 * @property string $model
 * @property string $title
 * @property string $alias
 * @property string $image_name
 * @property string $file_name
 * @property integer $tinyint1
 * @property string $int10
 * @property string $char32
 * @property string $varchar30
 * @property string $varchar50
 * @property string $varchar100
 * @property string $varchar128
 * @property string $content
 * @property integer $status
 * @property integer $weight
 * @property string $created_at
 * @property string $updated_at
 */
class Post extends BaseModel
{
	const
		STATUS_SHOW = 1,
		STATUS_HIDE = 0,
		STATUS_TOP = 5,
		STATUS_SCROLL = 10,

		POST = 'post',
		NEWS = 'news',
		JOB = 'job',
		PRODUCT = 'product',
		SINGLE = 'single'
	;
	
	public static $model = array(
		self::POST=>'文章',
		self::NEWS=>'新闻',
		self::JOB=>'招聘',
		self::PRODUCT=>'产品',
		self::SINGLE => '单页',
	);

	public static $view_map = array(
		self::POST=>'post',
		self::NEWS=>'news',
		self::JOB=>'job',
		self::PRODUCT=>'product',
		self::SINGLE => 'single',
	);

	public static $status = array(
		1 => '显示',
		0 => '隐藏',
		5 => '头条',
		10=> '首页轮换',
	);

	public function behaviors() {
		$behaviros = parent::behaviors();
        return CMap::mergeArray($behaviros,array(
        	'seo'=>array(
        		'class'=>'ext.seo.components.SeoRecordBehavior',
        		'route'=>'site/post',
        		'params'=>array('alias'=>$this->alias),
        	),
        ));
    }

	public function beforeSave()
	{
		if(parent::beforeSave()) {
			if(!$this->alias)
				$this->alias = md5($this->created_at);
			if(!$this->weight)
				$this->weight = 100;
			$this->view = Category::getCategoryView($this->category_id);
			return true;
		}
	}

	/**
	 * @return string the associated database table name
	 */
	public function tableName()
	{
		return 'post';
	}

	/**
	 * @return array validation rules for model attributes.
	 */
	public function rules()
	{
		// NOTE: you should only define rules for those attributes that
		// will receive user inputs.
		return array(
			array('category_id, model, title', 'required'),
			array('tinyint1, status, weight, category_id', 'numerical', 'integerOnly'=>true),
			array('id, category_id, model, int10, created_at, updated_at', 'length', 'max'=>10),
			array('title, alias, varchar128', 'length', 'max'=>128),
			array('image_name, file_name', 'length', 'max'=>255),
			array('char32', 'length', 'max'=>32),
			array('varchar30, view', 'length', 'max'=>30),
			array('varchar50', 'length', 'max'=>50),
			array('varchar100', 'length', 'max'=>100),
			array('content', 'safe'),
			// The following rule is used by search().
			// @todo Please remove those attributes that should not be searched.
			array('id, category_id, model, title, alias, image_name, file_name, tinyint1, int10, char32, varchar30, varchar50, varchar100, varchar128, content, status, weight, created_at, updated_at', 'safe', 'on'=>'search'),
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
			'category_id' => '分类',
			'model' => '所属模型',
			'title' => '标题',
			'alias' => '别名',
			'image_name' => '图片',
			'file_name' => '文件',
			'tinyint1' => 'Tinyint1',
			'int10' => 'Int10',
			'char32' => 'Char32',
			'varchar30' => 'Varchar30',
			'varchar50' => 'Varchar50',
			'varchar100' => 'Varchar100',
			'varchar128' => 'Varchar128',
			'content' => '内容',
			'status' => '状态',
			'weight' => '排序',
			'created_at' => '发布时间',
			'updated_at' => 'Updated At',
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
		$criteria->compare('category_id',$this->category_id,true);
		$criteria->compare('model',$this->model,true);
		$criteria->compare('title',$this->title,true);
		$criteria->compare('alias',$this->alias,true);
		$criteria->compare('image_name',$this->image_name,true);
		$criteria->compare('file_name',$this->file_name,true);
		$criteria->compare('tinyint1',$this->tinyint1);
		$criteria->compare('int10',$this->int10,true);
		$criteria->compare('char32',$this->char32,true);
		$criteria->compare('varchar30',$this->varchar30,true);
		$criteria->compare('varchar50',$this->varchar50,true);
		$criteria->compare('varchar100',$this->varchar100,true);
		$criteria->compare('varchar128',$this->varchar128,true);
		$criteria->compare('content',$this->content,true);
		$criteria->compare('status',$this->status);
		$criteria->compare('weight',$this->weight);
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
	 * @return Post the static model class
	 */
	public static function model($className=__CLASS__)
	{
		return parent::model($className);
	}

	/**
	 * Performs the actual DB query and populates the AR objects with the query result.
	 * This method is mainly internally used by other AR query methods.
	 * @param CDbCriteria $criteria the query criteria
	 * @param boolean $all whether to return all data
	 * @return mixed the AR objects populated with the query result
	 * @since 1.1.7
	 */
	protected function query($criteria,$all=false)
	{
		$this->beforeFind();
		//增加排序
		$criteria->order= $criteria->order ? $criteria->order : 'weight';
		$this->applyScopes($criteria);

		if(empty($criteria->with))
		{
			if(!$all)
				$criteria->limit=1;
			$command=$this->getCommandBuilder()->createFindCommand($this->getTableSchema(),$criteria,$this->getTableAlias());
			return $all ? $this->populateRecords($command->queryAll(), true, $criteria->index) : $this->populateRecord($command->queryRow());
		}
		else
		{
			$finder=$this->getActiveFinder($criteria->with);
			return $finder->query($criteria,$all);
		}
	}

	public function getLabel()
	{
		return $this->title;
	}
}
