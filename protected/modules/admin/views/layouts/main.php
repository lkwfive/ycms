<?php $this->beginContent('/layouts/single'); ?>
<?php $this->widget('bootstrap.widgets.TbNavbar',array(
	'type'=>'inverse',
	'collapse'=>true,
    'items'=>array(
        array(
            'class'=>'bootstrap.widgets.TbMenu',
            'items'=>array(
                array('label'=>'系统管理', 'url'=>array('/admin/default/index')),
                array('label'=>'文章', 'url'=>array('/admin/article/admin')),
                array('label'=>'分类', 'url'=>array('/admin/category/index')),
                array('label'=>'系统',
                    'items' => array(
                      array('label' => '数据库管理', 'url' => array('/admin/backup/index')),
                      array('label' => '省市区数据', 'url' => array('/admin/provinces/index')),
                    ),
                    'active'=>Yii::app()->controller->id=='links'
                ),
            ),
        ),
        array(
            'class'=>'bootstrap.widgets.TbMenu',
            'htmlOptions'=>array('class'=>'pull-right'),
            'items'=>array(
                array('label'=>'Login', 'url'=>array('/site/login'), 'visible'=>Yii::app()->user->isGuest),
                array('label'=>'退出 ('.Yii::app()->user->name.')', 'url'=>array('/site/logout'), 'visible'=>!Yii::app()->user->isGuest),
            ),
        ),
    ),
)); ?>

<div class="container" id="page" style="margin-top: 50px;">
	<?php echo $content; ?>
</div><!-- page -->

<footer class="footer">
	Copyright &copy; <?php echo date('Y'); ?> by My Company.<br/>
    All Rights Reserved.<br/>
    <?php echo Yii::powered(); ?>
</footer><!-- footer -->
<style type="text/css">
    .footer{color: #999;text-align: center;padding: 30px 0;margin-top: 70px;border-top: 1px solid #e5e5e5;background-color: #f5f5f5;}
</style>
<?php $this->endContent(); ?>
