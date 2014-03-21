<div class="content">
	<ul>
		<?php foreach ($models as $v):?>
			<li>title:<a href="<?php echo $v->url; ?>"><?php echo $v->title; ?></a>
				<p>summary:<?php echo $v->summary; ?></p>
			</li>
		<?php endforeach;?>
	</ul>
</div>