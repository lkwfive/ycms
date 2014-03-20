<?php
/* @var $this DefaultController */

$this->breadcrumbs=array(
	'系统信息'
);
?>

<?php $box = $this->beginWidget(
    'bootstrap.widgets.TbBox',
    array(
        'title' => '系统信息',
        'headerIcon' => 'icon-th-list',
        'htmlOptions' => array('class' => 'bootstrap-widget-table')
    )
);?>
    <table class="table">
        <tbody>
        <tr>
            <td style="width:200px">程序版本</td>
            <td>v1092323</td>
        </tr>
        <tr>
            <td>服务器软件</td>
            <td><?php echo isset($_SERVER['SERVER_SOFTWARE']) ? $_SERVER['SERVER_SOFTWARE'] : 'unknow'; ?></td>
        </tr>
        <tr>
            <td>服务器 MySQL 版本</td>
            <td><?php echo @mysql_get_server_info() ?> <?php echo extension_loaded('pdo_mysql')?"PDO(√)":"PDO(×)"; ?></td>
        </tr>
        <tr>
            <td>GD库支持</td>
            <td>
            	<?php 
            		$tmp = function_exists('gd_info') ? gd_info() : array(); 
					echo empty($tmp['GD Version']) ? 'noext' : $tmp['GD Version'];
				?>
			</td>
        </tr>
        <tr>
            <td>上传限制</td>
            <td><?php echo @ini_get('file_uploads') ? ini_get('upload_max_filesize') : 'unknow'; ?></td>
        </tr>
        </tbody>
    </table>
<?php $this->endWidget(); ?>
