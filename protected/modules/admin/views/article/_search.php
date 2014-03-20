<?php $form=$this->beginWidget('bootstrap.widgets.TbActiveForm',array(
	'action'=>Yii::app()->createUrl($this->route),
	'method'=>'get',
)); ?>

		<?php echo $form->textFieldRow($model,'id',array('class'=>'span5','maxlength'=>10)); ?>

		<?php echo $form->textFieldRow($model,'category_id',array('class'=>'span5','maxlength'=>10)); ?>

		<?php echo $form->textFieldRow($model,'model_name',array('class'=>'span5','maxlength'=>30)); ?>

		<?php echo $form->textFieldRow($model,'title',array('class'=>'span5','maxlength'=>100)); ?>

		<?php echo $form->textFieldRow($model,'title_color',array('class'=>'span5','maxlength'=>6)); ?>

		<?php echo $form->textFieldRow($model,'subtitle',array('class'=>'span5','maxlength'=>100)); ?>

		<?php echo $form->textFieldRow($model,'summary',array('class'=>'span5','maxlength'=>255)); ?>

		<?php echo $form->textFieldRow($model,'picture',array('class'=>'span5','maxlength'=>32)); ?>

		<?php echo $form->textFieldRow($model,'source',array('class'=>'span5','maxlength'=>100)); ?>

		<?php echo $form->textFieldRow($model,'author',array('class'=>'span5','maxlength'=>30)); ?>

		<?php echo $form->textFieldRow($model,'tags',array('class'=>'span5','maxlength'=>255)); ?>

		<?php echo $form->textFieldRow($model,'user_id',array('class'=>'span5','maxlength'=>10)); ?>

		<?php echo $form->textFieldRow($model,'update_user_id',array('class'=>'span5','maxlength'=>10)); ?>

		<?php echo $form->textFieldRow($model,'status',array('class'=>'span5')); ?>

		<?php echo $form->textFieldRow($model,'template',array('class'=>'span5','maxlength'=>30)); ?>

		<?php echo $form->textFieldRow($model,'power',array('class'=>'span5')); ?>

		<?php echo $form->textFieldRow($model,'position',array('class'=>'span5')); ?>

		<?php echo $form->textFieldRow($model,'views',array('class'=>'span5','maxlength'=>10)); ?>

		<?php echo $form->textFieldRow($model,'created_at',array('class'=>'span5','maxlength'=>10)); ?>

		<?php echo $form->textFieldRow($model,'updated_at',array('class'=>'span5','maxlength'=>10)); ?>

	<div class="form-actions">
		<?php $this->widget('bootstrap.widgets.TbButton', array(
			'buttonType' => 'submit',
			'type'=>'primary',
			'label'=>'Search',
		)); ?>
	</div>

<?php $this->endWidget(); ?>
