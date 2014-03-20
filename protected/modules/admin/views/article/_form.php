<?php $form=$this->beginWidget('bootstrap.widgets.TbActiveForm',array(
	'id'=>'article-form',
	'enableAjaxValidation'=>false,
	'type' => 'horizontal',
	'htmlOptions'=>array(
		'enctype' => 'multipart/form-data',
	),
)); ?>

<fieldset>
<legend>Fields with <span class="required">*</span> are required.</legend>

	<?php echo $form->errorSummary($model); ?>

	<?php echo $form->dropDownListRow($model,'category_id',array('选择所属分类')+Category::getDropDownListData(), array('encode'=>false)); ?>

	<?php echo $form->dropDownListRow($model,'model_name', Article::$models); ?>

	<?php echo $form->textFieldRow($model,'title',array('class'=>'span5','maxlength'=>100)); ?>

	<?php echo $form->colorpickerRow($model,'title_color'); ?>

	<?php echo $form->textFieldRow($model,'subtitle',array('class'=>'span5','maxlength'=>100)); ?>

	<?php echo $form->select2Row($model,'tags',
        array(
            'asDropDownList' => false,
            'options' => array(
                'tags' => array(),
                'placeholder' => 'type clever, or is, or just type!',
                'width' => '40%',
                'tokenSeparators' => array(',', ' ')
            )
        )
    );?>

	<?php echo $form->fileFieldRow($model,'image_file'); ?>

	<?php echo $form->textFieldRow($model,'source',array('class'=>'span5','maxlength'=>100)); ?>

	<?php echo $form->textFieldRow($model,'author',array('class'=>'span5','maxlength'=>30)); ?>

	
	<?php echo $form->redactorRow($model,'content', array(
		'editorOptions' => array(
			'lang' => 'zh_cn',
			'imageUpload' => Yii::app()->createAbsoluteUrl('admin/default/image'),
			'fileUpload' => Yii::app()->createAbsoluteUrl('admin/default/file'),
			'imageGetJson' => Yii::app()->createAbsoluteUrl('admin/default/imagelist'),
			'plugins' => array('fontsize', 'fontcolor', 'fullscreen'),
		)
	)); ?>

	<?php echo $form->checkBoxRow($model, 'is_auto_summary'); ?>

	<?php echo $form->textAreaRow($model,'summary',array('class'=>'span5','rows'=>5)); ?>

	<?php echo $form->dropDownListRow($model,'status', Article::$status); ?>

	<?php echo $form->dropDownListRow($model,'template', Article::$templates); ?>

	<?php echo $form->textFieldRow($model,'power',array('class'=>'span5')); ?>

	<?php echo $form->dropDownListRow($model,'position', Article::$position); ?>

	<?php echo $form->textFieldRow($model,'views',array('class'=>'span5','maxlength'=>10)); ?>

</fieldset>
<div class="form-actions">
	<?php $this->widget('bootstrap.widgets.TbButton', array(
			'buttonType'=>'submit',
			'type'=>'primary',
			'label'=>'保存',
		)); ?>
</div>

<?php $this->endWidget(); ?>
