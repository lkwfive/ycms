<?php
$this->breadcrumbs=array(
	'Provinces'=>array('index'),
	'Create',
);

$this->menu=array(
array('label'=>'List Provinces','url'=>array('index')),
array('label'=>'Manage Provinces','url'=>array('admin')),
);
?>

<h1>Create Provinces</h1>

<?php echo $this->renderPartial('_form', array('model'=>$model)); ?>