<?php /* @var $this Controller */ ?>
<?php $this->beginContent('/layouts/main'); ?>
<div id="metinfo">
	<div id="web">
		<?php echo $content; ?>
		<?php $this->renderPartial("/layouts/partial/_sidebar");?>
		<div style="clear:both;"></div>
	</div>
</div>
<?php $this->endContent(); ?>