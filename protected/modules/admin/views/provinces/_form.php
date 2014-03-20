<?php $form=$this->beginWidget('bootstrap.widgets.TbActiveForm',array(
	'id'=>'category-form',
	'type'=>'horizontal',
	'enableClientValidation'=>true,
)); ?>
<?php echo $form->errorSummary($model); ?>

<?php echo $form->dropDownListRow($model,'id', Provinces::getDropDownListData(), array('encode'=>false)); ?>
<?php echo $form->textFieldRow($model,'name',array('class'=>'span5','maxlength'=>255)); ?>
<?php echo $form->toggleButtonRow($model, 'status'); ?>

<div class="form-actions">
	<?php $this->widget('bootstrap.widgets.TbButton', array(
			'buttonType'=>'submit',
			'type'=>'success',
			'label'=>$model->isNewRecord ? '创建' : '保存',
		)); ?>
</div>

<?php $this->endWidget(); ?>
