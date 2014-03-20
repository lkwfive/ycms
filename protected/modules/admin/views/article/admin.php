<?php
$this->breadcrumbs=array(
	'文章'=>array('admin'),
	'管理',
);
?>

<h1>文章管理</h1>

<?php $this->widget('bootstrap.widgets.TbGridView',array(
'id'=>'article-grid',
'dataProvider'=>$model->search(),
'filter'=>$model,
'columns'=>array(
		'id',
		array(
			'name'=>'category_id',
			'value'=>'Category::getCategoryNames($data->category_id)',
			'filter'=>Category::getDropDownListData(),
		),
		array(
			'name'=>'model_name',
			'value'=>'Article::$models[$data->model_name]',
			'filter'=>Article::$models,
		),
		'title',
		'subtitle',
		
		// 'summary',
		// 'picture',
		'source',
		'author',
		// 'tags',
		// 'user_id',
		// 'update_user_id',
		array(
			'name'=>'status',
			'value'=>'Article::$status[$data->status]',
			'filter'=>Article::$status,
		),
		// 'template',
		// 'power',
		array(
			'name'=>'position',
			'value'=>'Article::$position[$data->position]',
			'filter'=>Article::$position,
		),
		'views',
		// 'created_at',
		// 'updated_at',
		
array(
'class'=>'bootstrap.widgets.TbButtonColumn',
),
),
)); ?>
