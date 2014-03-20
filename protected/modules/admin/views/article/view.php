<?php
$this->breadcrumbs=array(
	'文章'=>array('admin'),
	$model->title,
);
?>

<h1>View Article #<?php echo $model->id; ?></h1>

<?php $this->widget('bootstrap.widgets.TbDetailView',array(
'data'=>$model,
'attributes'=>array(
		'id',
		'category_id',
		'model_name',
		'title',
		'title_color',
		'subtitle',
		'summary',
		'picture',
		'source',
		'author',
		'tags',
		'user_id',
		'update_user_id',
		'status',
		'template',
		'power',
		'position',
		'views',
		'created_at',
		'updated_at',
),
)); ?>
