<div class="content">
	<h1><a href="<?php echo $model->url; ?>"><?php echo $model->title; ?></a></h1>
	<p><img src="<?php echo UploadFile::getImageUrl($model->picture); ?>" width="200"></p>
	<p>summary:<?php echo $model->summary; ?></p>
</div>