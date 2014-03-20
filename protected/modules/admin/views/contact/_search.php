<?php $form=$this->beginWidget('bootstrap.widgets.TbActiveForm',array(
	'action'=>Yii::app()->createUrl($this->route),
	'method'=>'get',
)); ?>

		<?php echo $form->textFieldRow($model,'id',array('class'=>'span5','maxlength'=>10)); ?>

		<?php echo $form->textFieldRow($model,'name',array('class'=>'span5','maxlength'=>30)); ?>

		<?php echo $form->textFieldRow($model,'title',array('class'=>'span5','maxlength'=>255)); ?>

		<?php echo $form->textFieldRow($model,'phone',array('class'=>'span5','maxlength'=>30)); ?>

		<?php echo $form->textFieldRow($model,'email',array('class'=>'span5','maxlength'=>255)); ?>

		<?php echo $form->textAreaRow($model,'content',array('rows'=>6, 'cols'=>50, 'class'=>'span8')); ?>

		<?php echo $form->textFieldRow($model,'ip',array('class'=>'span5','maxlength'=>255)); ?>

		<?php echo $form->textFieldRow($model,'updated_at',array('class'=>'span5','maxlength'=>10)); ?>

		<?php echo $form->textFieldRow($model,'created_at',array('class'=>'span5','maxlength'=>10)); ?>

	<div class="form-actions">
		<?php $this->widget('bootstrap.widgets.TbButton', array(
			'buttonType' => 'submit',
			'type'=>'primary',
			'label'=>'Search',
		)); ?>
	</div>

<?php $this->endWidget(); ?>
