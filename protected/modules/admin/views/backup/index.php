<?php
$this->breadcrumbs=array(
	'数据库管理'=>array('index'),
);?>
<h1> Manage database backup files</h1>

<?php $this->renderPartial('_list', array(
		'dataProvider'=>$dataProvider,
));
?>
