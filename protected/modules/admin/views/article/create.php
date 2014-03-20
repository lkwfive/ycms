<?php
$this->breadcrumbs=array(
	'文章'=>array('index'),
	'创建',
);
?>

<h1>创建文章</h1>

<?php echo $this->renderPartial('_form', array('model'=>$model)); ?>