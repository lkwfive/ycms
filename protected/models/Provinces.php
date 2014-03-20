<?php

/**
 * This is the model class for table "provinces".
 *
 * The followings are the available columns in table 'provinces':
 * @property string $id
 * @property string $root
 * @property string $lft
 * @property string $rgt
 * @property integer $level
 * @property string $name
 * @property integer $status
 */
class Provinces extends CActiveRecord
{
	public function behaviors() {
		$behaviros = parent::behaviors();
        return CMap::mergeArray($behaviros,array(
            'NestedSetBehavior' => array(
                'class' => 'ext.nested-set-behavior.NestedSetBehavior',
                'leftAttribute' => 'lft',
                'rightAttribute' => 'rgt',
                'levelAttribute' => 'level',
                'hasManyRoots' => true,
        	)
        ));
    }

	/**
	 * @return string the associated database table name
	 */
	public function tableName()
	{
		return 'provinces';
	}

	/**
	 * @return array validation rules for model attributes.
	 */
	public function rules()
	{
		// NOTE: you should only define rules for those attributes that
		// will receive user inputs.
		return array(
			array('name, status', 'required'),
			array('level, status', 'numerical', 'integerOnly'=>true),
			array('root, lft, rgt', 'length', 'max'=>10),
			array('name', 'length', 'max'=>255),
			// The following rule is used by search().
			// @todo Please remove those attributes that should not be searched.
			array('id, root, lft, rgt, level, name, status', 'safe', 'on'=>'search'),
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
			'root' => 'Root',
			'lft' => 'Lft',
			'rgt' => 'Rgt',
			'level' => 'Level',
			'name' => 'Name',
			'status' => '是否显示',
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
		$criteria->compare('status',$this->status);

		return new CActiveDataProvider($this, array(
			'criteria'=>$criteria,
		));
	}

	/**
	 * Returns the static model of the specified AR class.
	 * Please note that you should have this exact method in all your CActiveRecord descendants!
	 * @param string $className active record class name.
	 * @return Provinces the static model class
	 */
	public static function model($className=__CLASS__)
	{
		return parent::model($className);
	}
	
	/**
	 * 获取treeview数据
	 * @param  boolean $cache [description]
	 * @return [type]         [description]
	 */
	public static function tree($cache=true)
	{
		$r=Yii::app()->cache->get('provinces');
		if($r && $cache)
			return $r;
		return self::treeData();
	}
	/**
	 * 获取data
	 * @param  [type] $categories [description]
	 * @return [type]             [description]
	 */
	public static function treeData()
	{
		$criteria = new CDbCriteria;
		$criteria->order = "lft ASC";
		$categories = self::model()->findAll($criteria);
		array_shift($categories);

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
	    Yii::app()->cache->set('provinces',$trees,3600);
		return $trees;
	}

	/**
	 * 获取下拉框数据
	 * @return [type] [description]
	 */
	public static function getDropDownListData()
	{
		$criteria = new CDbCriteria;
		$criteria->order = "lft ASC";
		$categories = self::model()->findAll($criteria);
		$r = array();
		foreach ($categories as $key => $category) {
			$base = '';
			for ($i=1; $i < $category->level; $i++) {
				$base .= $category->level==$i+1 ? '└' : '&nbsp;&nbsp;&nbsp;&nbsp;';
			}
			$r[$category->id]=$base.$category->name;
		}
		return $r;
	}
}
