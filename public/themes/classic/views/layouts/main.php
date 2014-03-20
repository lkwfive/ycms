<!doctype html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<?php 
		$this->widget('ext.seo.widgets.SeoHead',array(
    		// 'defaultKeywords'=>'',
			// 'defaultDescription'=>'lazy猫是一个专门做淘宝返利的网站',
		));
		echo H::staticCssFile('common.css');
		echo H::staticCssFile('style.css');
	?>
</head>
<body>
	<?php $this->renderPartial("/layouts/partial/_header");?>
	<?php echo $content; ?>
	<?php $this->renderPartial("/layouts/partial/_footer");?>
</body>
</html>