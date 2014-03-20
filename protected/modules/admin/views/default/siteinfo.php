<?php 
$this->breadcrumbs=array(
	'站点信息'
);

$form=$this->beginWidget('bootstrap.widgets.TbActiveForm',array(
	'id' => 'horizontalForm',
    'type' => 'horizontal',
	'enableAjaxValidation'=>false,
)); 
?>

	<fieldset>
	<?php echo $form->errorSummary($model); ?>

	<?php echo $form->textFieldRow($model, 'name'); ?>
	<?php echo $form->textFieldRow($model, 'url'); ?>
	<?php echo $form->textFieldRow($model, 'keyword'); ?>
	<?php echo $form->textAreaRow($model, 'description', array('rows'=>4)); ?>
	<?php echo $form->textFieldRow($model, 'admin_email'); ?>
	<?php echo $form->textAreaRow($model, 'copyright', array('rows'=>4)); ?>
	<?php echo $form->textFieldRow($model, 'icp'); ?>
	<?php echo $form->textAreaRow($model, 'code', array('rows'=>4)); ?>
	<?php echo $form->toggleButtonRow($model, 'closed'); ?>

	</fieldset>
	<div class="form-actions">
		<?php $this->widget('bootstrap.widgets.TbButton', array(
			'buttonType'=>'submit',
			'type'=>'success',
			'label'=>'保存',
		)); ?>
	</div>

<?php $this->endWidget(); ?>
