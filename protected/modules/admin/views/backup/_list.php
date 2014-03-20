 <?php //$this->widget('zii.widgets.grid.CGridView', array(
// 	'id' => 'install-grid',
// 	'dataProvider' => $dataProvider,
// 	'columns' => array(
// 		'name',
// 		'size',
// 		'create_time',
// 		array(
// 			'class' => 'CButtonColumn',
// 			'template' => ' {download} {restore}',
// 			  'buttons'=>array
// 			    (
// 			        'Download' => array
// 			        (
// 			            'url'=>'Yii::app()->createUrl("backup/default/download", array("file"=>$data["name"]))',
// 			        ),
// 			        'Restore' => array
// 			        (
// 			            'url'=>'Yii::app()->createUrl("backup/default/restore", array("file"=>$data["name"]))',
// 					),
// 			        'delete' => array
// 			        (
// 			            'url'=>'Yii::app()->createUrl("backup/default/delete", array("file"=>$data["name"]))',
// 			        ),
// 			    ),		
// 		),
// 		array(
// 			'class' => 'CButtonColumn',
// 			'template' => '{delete}',
// 			  'buttons'=>array
// 			    (

// 			        'delete' => array
// 			        (
// 			            'url'=>'Yii::app()->createUrl("backup/default/delete", array("file"=>$data["name"]))',
// 			        ),
// 			    ),		
// 		),
// 	),
// )); ?>
<?php $this->widget('bootstrap.widgets.TbExtendedGridView', array(
	'id' => 'install-grid',
	'dataProvider' => $dataProvider,
	'columns' => array(
		array('name'=>'name', 'header'=>'名字'),
		array('name'=>'size', 'header'=>'大小'),
		array('name'=>'create_time', 'header'=>'创建时间'),
		array(
			'htmlOptions' => array('nowrap'=>'nowrap'),
			'class'=>'bootstrap.widgets.TbButtonColumn',
			'buttons'=>array
			(
				'view' => array
				(
					'icon'=>'download-alt',
					'options'=>array('title'=>'下载'),
				),
				'update' => array
				(
					'icon'=>'repeat',
					'options'=>array('title'=>'恢复'),
				),
			),
			'viewButtonUrl'=>'Yii::app()->createUrl("admin/backup/download", array("file"=>$data["name"]))',
			'updateButtonUrl'=>'Yii::app()->createUrl("admin/backup/restore", array("file"=>$data["name"]))',
			'deleteButtonUrl'=>'Yii::app()->createUrl("admin/backup/delete", array("file"=>$data["name"]))',
		),
	),
)); ?>