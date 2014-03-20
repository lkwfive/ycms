<?php
$this->breadcrumbs=array(
	'文章'=>array('admin'),
	$model->title=>array('view','id'=>$model->id),
	'编辑',
);
?>

<h1>编辑文章 <?php echo $model->id; ?></h1>

<?php echo $this->renderPartial('_form',array('model'=>$model)); ?>