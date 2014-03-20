<div id="topbar">
	<div class="topbar">
		<ul class="bar_l">
			<li><em></em><a href="#" onclick="AddFavorite(window.location,document.title)">收藏<?php echo Yii::app()->name; ?></a></li>
		</ul>
		<?php if(Yii::app()->user->isGuest): ?>
			<ul class="bar_r">
				<li><a href="/login">登陆</a></li>
				<li><a href="/register">注册</a></li>
			</ul>
		<?php else:?>
			<ul class="bar_r">
				<li><a href="/logout">退出</a></li>
				<li>欢迎：<?php echo Yii::app()->user->name;?></li>
			</ul>
		<?php endif;?>
	</div>
</div>
<script type="text/javascript">
function AddFavorite(sURL, sTitle){
    try{
        window.external.addFavorite(sURL, sTitle);
    }
    catch (e){
        try{
            window.sidebar.addPanel(sTitle, sURL, "");
        }
        catch (e){
            alert("加入收藏失败，请使用Ctrl+D进行添加");
        }
    }
}
</script>