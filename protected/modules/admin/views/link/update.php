<?php
$this->breadcrumbs=array(
	'链接'=>array('index'),
	'修改',
);
?>

<h1>修改链接<?php echo $model->title; ?></h1>

<?php echo $this->renderPartial('_form',array('model'=>$model)); ?>