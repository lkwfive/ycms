<?php
$this->breadcrumbs=array(
	'链接'=>array('index'),
	$model->title,
);
?>

<h1>View Link #<?php echo $model->id; ?></h1>

<?php $this->widget('bootstrap.widgets.TbDetailView',array(
'data'=>$model,
'attributes'=>array(
		'id',
		'pid',
		'title',
		'url',
		'target',
		'type',
		'power',
		'visible',
),
)); ?>
