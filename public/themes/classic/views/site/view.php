<style type="text/css">p{line-height: 26px;}</style>
<div class="content">
	<h1><a href="<?php echo $model->url; ?>"><?php echo $model->Ctitle; ?></a></h1>
	<p><img src="<?php echo $model->img; ?>" width="200"></p>
	<p>summary:<?php echo $model->summary; ?></p>
	<div>
		<?php echo $model->Profile->content; ?>
	</div>
</div>