<?php
$this->breadcrumbs=array(
	'链接'=>array('index'),
	'管理',
);
?>

<h1>新建链接</h1>

<?php echo $this->renderPartial('_form', array('model'=>$model)); ?>