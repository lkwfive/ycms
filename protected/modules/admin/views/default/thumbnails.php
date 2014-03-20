<?php
$this->breadcrumbs=array(
	'缩略图'
);

$form=$this->beginWidget('bootstrap.widgets.TbActiveForm',array(
	'id' => 'horizontalForm',
    'type' => 'horizontal',
	'enableAjaxValidation'=>false,
	'htmlOptions'=>array(
		'enctype' => 'multipart/form-data',
	),
));
?>

	<fieldset>
	<?php echo $form->errorSummary($model); ?>

	<?php echo $form->toggleButtonRow($model, 'closed'); ?>
	<?php echo $form->textFieldRow($model, 'proportion', array('placeholder'=>'0.2'), array('hint'=>'0-1之间小数')); ?>
	<?php echo $form->textFieldRow($model, 'right_margin', array('placeholder'=>'10'), array('append' => 'px')); ?>
	<?php echo $form->textFieldRow($model, 'bottom_margin', array('placeholder'=>'10'), array('append' => 'px')); ?>
	<?php echo $form->fileFieldRow($model, 'file'); ?>
	<?php if($watermark = UploadFile::getWatermarkUrl()):?>
	<div class="control-group">
		<label class="control-label" for="PostNewsForm_file">图片</label>
		<div class="controls">
			<p><?php $this->widget('bootstrap.widgets.TbButton',
				    array(
				        'label' => '预览水印效果',
				        'type' => 'link',
				        'url' => $this->createUrl('',array('show'=>true, 'random'=>time())),
				        'htmlOptions' => array('target'=>'_blank'),
				    )
				    );?>
			</p>
			<?php echo CHtml::image($watermark, 'image', array('style'=>'height:150px;background: #000;')); ?>
		</div>
	</div>
	<?php endif; ?>

	</fieldset>
	<div class="form-actions">
		<?php $this->widget('bootstrap.widgets.TbButton', array(
			'buttonType'=>'submit',
			'type'=>'success',
			'label'=>'保存',
		)); ?>
	</div>

<?php $this->endWidget(); ?>
