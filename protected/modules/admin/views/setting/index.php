<?php $form=$this->beginWidget('bootstrap.widgets.TbActiveForm',array(
	'id' => 'horizontalForm',
    'type' => 'horizontal',
	'htmlOptions'=>array('enctype' => 'multipart/form-data'),
	'enableAjaxValidation'=>false,
)); ?>

	<fieldset>
        <legend>Fields with <span class="required">*</span> are required.</legend>
	<?php echo $form->errorSummary($model); ?>

	<?php echo $form->textAreaRow($model,'about',array('class' => 'span6', 'rows' => 4)); ?>

	<?php echo $form->textAreaRow($model,'product',array('class' => 'span6', 'rows' => 4)); ?>
	
	<?php echo $form->textAreaRow($model,'contact',array('class' => 'span6', 'rows' => 4)); ?>

	</fieldset>
	<div class="form-actions">
		<?php $this->widget('bootstrap.widgets.TbButton', array(
			'buttonType'=>'submit',
			'type'=>'success',
			'label'=>'保存',
		)); ?>
	</div>

<?php $this->endWidget(); ?>
