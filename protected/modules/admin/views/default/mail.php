<?php 
$this->breadcrumbs=array(
	'邮件设置'
);

$form=$this->beginWidget('bootstrap.widgets.TbActiveForm',array(
	'id' => 'horizontalForm',
    'type' => 'horizontal',
	'enableAjaxValidation'=>false,
));
if($model->username)
	$model->test_form = $model->username;
?>

	<fieldset>
	<?php echo $form->errorSummary($model); ?>
	<ul id="yw2" class="nav nav-tabs">
		<li class="active"><a data-toggle="tab" href="#yw1_tab_1">设置</a></li>
		<li><a data-toggle="tab" href="#yw1_tab_2">监测</a></li>
	</ul>
	<div class="tab-content">
		<div id="yw1_tab_1" class="tab-pane fade active in">
			<?php echo $form->textFieldRow($model, 'host'); ?>
			<?php echo $form->textFieldRow($model, 'port'); ?>
			<?php echo $form->textFieldRow($model, 'username'); ?>
			<?php echo $form->textFieldRow($model, 'password'); ?>
			<div class="form-actions">
				<?php $this->widget('bootstrap.widgets.TbButton', array(
					'buttonType'=>'submit',
					'type'=>'success',
					'label'=>'保存',
				)); ?>
			</div>
		</div>
		<div id="yw1_tab_2" class="tab-pane fade">
			<?php echo $form->textFieldRow($model, 'test_form'); ?>
			<?php echo $form->textFieldRow($model, 'test_to'); ?>
			<?php echo $form->textFieldRow($model, '_subject'); ?>
			<?php echo $form->textAreaRow($model, '_body'); ?>
			<div class="control-group">
				<div class="controls">
					<?php $this->widget('bootstrap.widgets.TbButton',array(
						'label' => '检测邮件发送设置',
						'buttonType' => 'ajaxSubmit',
						'ajaxOptions'=>array(             
							'success'=>'function(data){
								if(data==1)
									alert("发送成功");
								else
									alert("发送失败");
							}',
						),
					));?>
				</div>
			</div>
		</div>
	</div>
	</fieldset>
	

<?php $this->endWidget(); ?>

<scrpit>
	
</scrpit>
