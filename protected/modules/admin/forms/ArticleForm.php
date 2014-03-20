<?php
class ArticleForm extends CFormModel
{
	public $id;
	public $category_id;
	public $model_name;
	public $title;
	public $title_color;
	public $subtitle;
	public $summary;
	public $picture;
	public $source;
	public $author;
	public $tags;
	public $status;
	public $template;
	public $power;
	public $position;
	public $views;
	//profile
	public $content;
	//																												
	public $is_auto_summary;
	public $image_file;
	//article
	public $article;

	/**
	 * Declares the validation rules.
	 */
	public function rules()
	{
		return array(
			array('model_name, title, status, template', 'required'),
			array('status, power, position', 'numerical', 'integerOnly'=>true),
			array('category_id, views', 'length', 'max'=>10),
			array('model_name, author, template', 'length', 'max'=>30),
			array('title, subtitle, source', 'length', 'max'=>100),
			array('title_color', 'length', 'max'=>6),
			array('summary, tags, alias', 'length', 'max'=>255),
			array('picture', 'length', 'max'=>32),
			array('content', 'ext.validator.XssClean', 'mode'=>'purify'),
			array('alias','checkAliadExists'),
		);
	}

	public function checkAliadExists($attribute)
	{
		if(!empty($this->attribute)) {
            $exit = Post::model()->exists('alias=:alias',array('alias'=>$attribute));
            if($exit)
                $this->addError($attribute, '别名已被使用，请用别的名字');
        }
	}

	/**
	 * Declares customized attribute labels.
	 * If not declared here, an attribute would have a label that is
	 * the same as its name with the first letter in upper case.
	 */
	public function attributeLabels()
	{
		return array(
	 		'id'=>'ID',
			'category_id'=>'分类',
			'model_name'=>'模型',
			'title'=>'标题',
			'title_color'=>'标题颜色',
			'subtitle'=>'副标题',
			'summary'=>'描述',
			'picture'=>'图片',
			'source'=>'来源',
			'author'=>'作者',
			'tags'=>'标签',
			'status'=>'状态',
			'template'=>'模版',
			'power'=>'排序权重',
			'position'=>'位置',
			'views'=>'浏览量',
			'content'=>'内容',
			'is_auto_summary'=>'自动截取内容到描述中',
			'image_file'=>'图片',
		);
	}

	public function save()
	{
		// H::printR($this->attributes);
		if (empty($this->article))
			$this->article = new Article;
		if (empty($this->article->Profile))
			$this->article->Profile = new ArticleProfile;

		$this->article->attributes = $this->attributes;
		$this->article->Profile->content = $this->content;
		//开启事务
		$transaction = Yii::app()->db->beginTransaction();
        try{
        	//保存文章
			if(!$this->article->save()){
				H::printR($this->article->errors);
				return false;
			}
			$this->article->Profile->article_id = $this->article->id;
			//保存文章内容
			if(!$this->article->Profile)
				return false;
			//提交事务
			$transaction->commit();
			return true;
		}catch(Exception $e){
            $transaction->rollBack();
            throw $e;
        }
	}
}