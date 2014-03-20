<?php
$this->breadcrumbs=array(
	'文章',
);

$this->menu=array(
array('label'=>'Create Article','url'=>array('create')),
array('label'=>'Manage Article','url'=>array('admin')),
);
?>

<h1>文章</h1>

<?php $this->widget('bootstrap.widgets.TbListView',array(
'dataProvider'=>$dataProvider,
'itemView'=>'_view',
)); ?>
