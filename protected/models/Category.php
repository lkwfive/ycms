<?php
Yii::import('ext.nested-set-behavior.NestedSetBehavior');
Yii::import('ext.seo.components.SeoRecordBehavior');
/**
 * This is the model class for table "category".
 *
 * The followings are the available columns in table 'category':
 * @property string $id
 * @property string $root
 * @property string $lft
 * @property string $rgt
 * @property integer $level
 * @property string $name
 * @property string $model_name
 * @property string $template
 * @property integer $status
 */
class Category extends CActiveRecord
{
	const
		TEMPLATE_ARTICLE = 'article'
	;

	public static $templates = array(
		self::TEMPLATE_ARTICLE => 'article',
	);
	
	public function behaviors() {
		$behaviros = parent::behaviors();
        return CMap::mergeArray($behaviros,array(
            'NestedSetBehavior' => array(
                'class' => 'ext.nested-set-behavior.NestedSetBehavior',
                'leftAttribute' => 'lft',
                'rightAttribute' => 'rgt',
                'levelAttribute' => 'level',
                'hasManyRoots' => true,
        	),
        	'seo'=>array(
        		'class'=>'ext.seo.components.SeoRecordBehavior',
        		'route'=>'site/view',
        		'params'=>array('id'=>$this->id),
        	),
        ));
    }

	public function afterSave()
	{
		/*更新缓存*/
		$criteria = new CDbCriteria;
		$criteria->order = "lft";
		$categories = self::model()->findAll($criteria);
		Yii::app()->cache->set('Categories',$categories,3600);
	}

	/**
	 * @return string the associated database table name
	 */
	public function tableName()
	{
		return 'category';
	}

	/**
	 * @return array validation rules for model attributes.
	 */
	public function rules()
	{
		// NOTE: you should only define rules for those attributes that
		// will receive user inputs.
		return array(
			array('name, template, status', 'required'),
			array('level, status', 'numerical', 'integerOnly'=>true),
			array('root, lft, rgt', 'length', 'max'=>10),
			array('name', 'length', 'max'=>255),
			array('model_name, template', 'length', 'max'=>30),
			// The following rule is used by search().
			// @todo Please remove those attributes that should not be searched.
			array('id, root, lft, rgt, level, name, model_name, template, status', 'safe', 'on'=>'search'),
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
			'Article'=>array(self::HAS_MANY,'Article','category_id'),
		);
	}

	/**
	 * @return array customized attribute labels (name=>label)
	 */
	public function attributeLabels()
	{
		return array(
			'id' => 'ID',
			'root' => 'Root',
			'lft' => 'Lft',
			'rgt' => 'Rgt',
			'level' => 'Level',
			'name' => 'Name',
			'model_name' => '所属模型名称',
			'template' => '指定视图',
			'status' => '是否显示到导航',
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
		$criteria->compare('root',$this->root,true);
		$criteria->compare('lft',$this->lft,true);
		$criteria->compare('rgt',$this->rgt,true);
		$criteria->compare('level',$this->level);
		$criteria->compare('name',$this->name,true);
		$criteria->compare('model_name',$this->model_name,true);
		$criteria->compare('template',$this->template,true);
		$criteria->compare('status',$this->status);

		return new CActiveDataProvider($this, array(
			'criteria'=>$criteria,
		));
	}

	/**
	 * Returns the static model of the specified AR class.
	 * Please note that you should have this exact method in all your CActiveRecord descendants!
	 * @param string $className active record class name.
	 * @return Category the static model class
	 */
	public static function model($className=__CLASS__)
	{
		return parent::model($className);
	}

	/**
	 * 获取所有分类(有缓存)
	 * @param  boolean $cache [默认获取]
	 * @return [array]         [分类对象]
	 */
	public static function getCategories($cache=true)
	{
		$categories=Yii::app()->cache->get('Categories');
		if($categories===false || $cache===false) {
			$criteria = new CDbCriteria;
			$criteria->order = "lft";
			$categories = self::model()->findAll($criteria);
			Yii::app()->cache->set('Categories',$categories,3600);
		}
		return $categories;
	}

	/**
	 * 获取treeview数据
	 * @return [type] [description]
	 */
	public static function tree()
	{
		$categories = self::getCategories();
		array_shift($categories);
		return self::treeData($categories);
	}
	/**
	 * 获取data
	 * @param  [type] $categories [description]
	 * @return [type]             [description]
	 */
	public static function treeData($categories)
	{
	    // Trees mapped
	    $trees = array();
	    $level = 0;

	    if (count($categories) < 0)
	    	return $trees;
	    // Node Stack. Used to help building the hierarchy
	    $stack = array();
	    foreach ($categories as $node) {
	        $item = array(
	        		'id'=>$node->id,
	        		'text'=>"<div class=\"line\">ID:".$node->id."&nbsp;&nbsp;&nbsp;&nbsp;".$node->name."<span class=\"right15 pull-right\"><a class=\"update\" title=\"向上移动\" rel=\"tooltip\" href=\"".Yii::app()->getController()->createUrl('move', array('id'=>$node->id,'updown'=>'up'))."\"><i class=\"icon-arrow-up\"></i></a>&nbsp;&nbsp;<a class=\"update\" title=\"向下移动\" rel=\"tooltip\" href=\"".Yii::app()->getController()->createUrl('move', array('id'=>$node->id,'updown'=>'down'))."\"><i class=\"icon-arrow-down\"></i></a>&nbsp;&nbsp;<a class=\"update\" title=\"修改\" rel=\"tooltip\" href=\"".Yii::app()->getController()->createUrl('update', array('id'=>$node->id))."\"><i class=\"icon-pencil\"></i></a>&nbsp;&nbsp;".CHtml::link('<i class="icon-trash"></i>', '#',array('class'=>'delete','title'=>'删除','rel'=>'tooltip','submit' => array('delete', 'id'=>$node->id), 'confirm' => '确定要删除此项吗?'))."</span></div>",
	        		'level'=>$node->level,
	        	);
	        $item['children'] = null;

	        // Number of stack items
	        $level = count($stack);

	        // Check if we're dealing with different levels
	        while($level > 0 && $stack[$level - 1]['level'] >= $item['level']) {
	            array_pop($stack);
	            $level--;
	        }

	        // Stack is empty (we are inspecting the root)
	        if ($level == 0) {
	            // Assigning the root node
	            $i = count($trees);
	            $trees[$i] = $item;
	            $stack[] = & $trees[$i];
	            } else {
	            // Add node to parent
	            $i = count($stack[$level - 1]['children']);
	            $stack[$level - 1]['children'][$i] = $item;
	            $stack[] = & $stack[$level - 1]['children'][$i];
	        }
	    }
		return $trees;
	}

	/**
	 * 获取下拉框数据
	 * @return [type] [description]
	 */
	public static function getDropDownListData()
	{
		$categories = self::getCategories();
		$r = array();
		foreach ($categories as $key => $category) {
			$base = '';
			for ($i=1; $i < $category->level; $i++) {
				$base .= $category->level==$i+1 ? '└' : '    -';
			}
			$r[$category->id]=$base.$category->name;
		}
		return $r;
	}

	public static function getSidebarData()
	{
		$criteria=new CDbCriteria;
		$criteria->order='t.lft'; // or 't.root, t.lft' for multiple trees
		$categories=self::model()->findAll($criteria);
		$r = array();
		foreach ($categories as $key => $cat) {
			if($cat->level==1)
				$r[$cat->id] = array(
					'label'=>$cat->name,
					// 'url'=>array('/product/'.$cat->id),
					'linkOptions'=>array('class'=>'m1'),
					'submenuOptions'=>array('class'=>'m2'),
				);
			if($cat->level==2)
				$r[$cat->root]['items'][] = array('label'=>$cat->name, 'url'=>array('/'.$cat->id));
		}
		return $r;
	}

	public static function getCategorys($model='')
	{
		$criteria=new CDbCriteria;
		if($model)
			$criteria->compare('model',$model);
		$categories =  Category::model()->roots()->findAll($criteria);
		$r=array();
		foreach ($categories as $key => $category) {
			$children = $category->descendants()->findAll();
			$children ? $r[$category->name]=array() : $r[$category->id] = $category->name;
			foreach ($children as $child) {
				$r[$category->name][$child->id] = $child->name;
			}
		}
		return $r;
	}

	/**
	 * 获取导航类
	 * @return [type] [description]
	 */
	public static function getNavigation()
	{
		$criteria=new CDbCriteria;
		$criteria->compare('status',1);
		$criteria->compare('level',1);
		$criteria->order='t.lft';
		$categories = self::model()->findAll($criteria);
		$r = array();
		foreach ($categories as $key => $category) {
			$r[] = array(
				'label'=>$category->name,
				'url'=>$category->getUrl(),
			);
		}
		return $r;
	}	

	/**
	 * 获取某一级跟了下的二级分类
	 * @return [type] [description]
	 */
	public static function getFirstCat()
	{
		$criteria=new CDbCriteria;
		$criteria->compare('level',2);
		$criteria->order='t.lft';
		return self::model()->find($criteria);
	}

	/**
	 * 获取类名，如无id则获取所有类名
	 * @param  [type] $id [description]
	 * @return [type]     [description]
	 */
	public static function getCategoryNames($id=null)
	{
		$categories = self::getCategories();
		$r = array('-');
		foreach ($categories as $key => $category) {
			$r[$category->id]=$category->name;
		}
		if(isset($id))
			return $r[$id];
		return $r;
	}

	/**
	 * 根据分类id获取相应属性
	 * @param  [type] $attribute [description]
	 * @param  [type] $id        [description]
	 * @return [type]            [description]
	 */
	public static function getAttributeByid($attribute, $id)
	{
		$model = self::model()->findByPk($id);
		if($model)
			return $model->$attribute;
		return null;
	}

	/**
	 * 获取分类的模版视图名称
	 * @param  [type] $id [description]
	 * @return [type]     [description]
	 */
	public static function getCategoryView($id)
	{
		$model = self::model()->findByPk($id);
		if ($model) {
			return $model->view ? $model->view : $model->model;
		}
		if ($id==0)
			return self::SINGLE;
		return null;
	}

	public function getLabel()
	{
		return $this->name;
	}

	/**
	 * 根据root_ID获取所有id
	 * @param  [type] $root_id [description]
	 * @return [array]          [description]
	 */
	public static function getAllIdByRoot($root_id)
	{
		$models = self::model()->findAll('root=:id',array(':id'=>$root_id));
		$r=array();
		foreach ($models as $k => $v) {
			$r[]=$v->id;
		}
		return $r;
	}
}
