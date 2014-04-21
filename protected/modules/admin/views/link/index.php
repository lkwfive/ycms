<?php
$this->breadcrumbs=array(
	'链接'=>array('index'),
	'管理',
);
?>

<h1>链接管理</h1>

<div class="search-form" style="display:none">
	<?php $this->renderPartial('_search',array(
	'model'=>$model,
)); ?>
</div><!-- search-form -->

<?php $this->widget('bootstrap.widgets.TbGridView',array(
	'id'=>'link-grid',
	'dataProvider'=>$model->search(),
	'filter'=>$model,
	'columns'=>array(
		'id',
		array(
            'name'=>'title',
            'value'=>'CHtml::link($data->title,$data->url)',
            'type'=>'raw',
        ),
		'url',
		array(
            'class' => 'bootstrap.widgets.TbToggleColumn',
            'toggleAction' => 'link/toggle',
            'name' => 'target',
            'checkedIcon'=>'icon-ok',
            'uncheckedIcon'=>'icon-remove',
            'checkedButtonLabel'=>'在新窗口中打开',
            'uncheckedButtonLabel'=>'在当前窗口中打开',
            'filter'=>Link::$targets,
            'htmlOptions'=>array('style'=>'width: 100px;text-align: center;'),
        ),
        array(
        	'name'=>'type',
        	'value'=>'Link::$types[$data->type]',
            'filter'=>link::$types,
        ),
		'power',
		array(
            'class' => 'bootstrap.widgets.TbToggleColumn',
            'toggleAction' => 'link/toggle',
            'name' => 'visible',
            'checkedIcon'=>'icon-ok',
            'uncheckedIcon'=>'icon-remove',
            'checkedButtonLabel'=>'显示',
            'uncheckedButtonLabel'=>'不显示',
            'filter'=>Link::$visibles,
            'htmlOptions'=>array('style'=>'width: 100px;text-align: center;'),
        ),
		array(
			'class'=>'bootstrap.widgets.TbButtonColumn',
		),
	),
)); ?>
