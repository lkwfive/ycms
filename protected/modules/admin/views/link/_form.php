<?php $form=$this->beginWidget('bootstrap.widgets.TbActiveForm',array(
	'id'=>'link-form',
	'enableAjaxValidation'=>false,
)); ?>

<p class="help-block">Fields with <span class="required">*</span> are required.</p>

<?php echo $form->errorSummary($model); ?>

	<?php echo $form->textFieldRow($model,'pid',array('class'=>'span5','maxlength'=>10)); ?>

	<?php echo $form->textFieldRow($model,'title',array('class'=>'span5','maxlength'=>30)); ?>

	<?php echo $form->textFieldRow($model,'url',array('class'=>'span5','maxlength'=>255)); ?>

	<?php echo $form->toggleButtonRow($model, 'target'); ?>

	<?php echo $form->dropDownListRow($model,'type', Link::$types); ?>

	<?php echo $form->textFieldRow($model,'power'); ?>

	<?php echo $form->toggleButtonRow($model, 'visible'); ?>

<div class="form-actions">
	<?php $this->widget('bootstrap.widgets.TbButton', array(
			'buttonType'=>'submit',
			'type'=>'primary',
			'label'=>$model->isNewRecord ? 'Create' : 'Save',
		)); ?>
</div>

<?php $this->endWidget(); ?>
