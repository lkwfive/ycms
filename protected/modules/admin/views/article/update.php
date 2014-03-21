<?php
$this->breadcrumbs=array(
	'文章'=>array('admin'),
	$model->title=>array('view','id'=>$model->article->id),
	'编辑',
);
?>

<h1>编辑文章 <?php echo $model->title; ?></h1>

<?php echo $this->renderPartial('_form',array('model'=>$model)); ?>