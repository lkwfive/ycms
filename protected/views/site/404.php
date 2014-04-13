<!doctype html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>ont find</title>
	<style type="text/css">
		div{text-align: center;color: #666;font-family: cursive;font-size: 20px;text-shadow: 0 1px 0 #fff;letter-spacing: 1px;line-height: 2em;}
		em{color: red}
	</style>
</head>
<body>
	<div>
		<p style="font-size:5em">404</p>
		<p>该页面不存在(´･ω･`)</p>
		<p><em id="m">5</em>秒后回到<a href="<?php echo Yii::app()->homeUrl; ?>">首页</a></p>
	</div>
</body>
<script type="text/javascript">
	var m = 4;
	function refer() {
		if(m == 0){
			location="<?php echo Yii::app()->homeUrl; ?>";
		}else{
			document.getElementById('m').innerHTML = m;
		}
		m--;
	}
	setInterval("refer()",1000);
</script>
</html>