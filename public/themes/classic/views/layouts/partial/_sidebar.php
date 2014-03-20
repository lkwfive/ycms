<div id="right">
	<div class="border">
		<h3 class="title"><div><span><?php echo $this->category_name; ?></span></div></h3>
		<div class="webnav"> 
			<div id="web-sidebar">
			<?php 
			$this->widget('zii.widgets.CMenu', array(
				'htmlOptions'=>array('class'=>'menu'),
				'items'=>$this->sideMenu,
			));
			?>
			    <!-- <dl>
				    <dt id="part2-1"><a href="" title="">关于我们</a></dt>
				</dl>	
			    <dl>
				    <dt id="part2-195"><a href="" title="">联系我们</a></dt>
				</dl>	
			    <dl>
				    <dt id="part2-200"><a href="" title="">组织架构</a></dt>
				</dl>	
			    <dl>
				    <dt id="part2-199"><a href="" title="">企业优势</a></dt>
				</dl>	 -->
			</div>
		</div>
	</div>
    <div class="border line">
		<h3 class="title"><div><span>联系方式</span></div></h3>
		<div class="text">
			<?php echo $this->config['contact']; ?>
		</div>
	</div>
</div>