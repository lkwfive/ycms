<div class="content">
	<ul>
		<?php foreach ($models as $v):?>
			<li><a href="<?php echo $v->url; ?>">title:<?php echo $v->title; ?>
				<p><img src="<?php echo UploadFile::getImageUrl($v->picture); ?>" width="200"></p></a>
				<p>summary:<?php echo $v->summary; ?></p>
			</li>
		<?php endforeach;?>
	</ul>
</div>