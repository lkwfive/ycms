<?php /* @var $this Controller */ ?>
<?php $this->beginContent('/layouts/main'); ?>
<div class="row">
    <?php if(isset($this->menu)):?>
    <div class="span2">
        <div id="sidebar">
        <?php
            $this->widget('bootstrap.widgets.TbMenu', array(
                'type' => 'tabs',
                'items' => $this->menu,
                'htmlOptions'=>array('class'=>'nav-stacked'),
            ));
        ?>
        </div><!-- sidebar -->
    </div>
    <?php endif;?>
    <div class="span10">
        <?php 
            $this->widget('bootstrap.widgets.TbBreadcrumbs', array(
                'homeLink'=>false,
                'links'=>array_merge(array('系统管理'=>array('/admin/default')),$this->breadcrumbs),
            ));
        ?><!-- breadcrumbs -->
        <div id="content">
            <?php $this->widget('bootstrap.widgets.TbAlert', array(
                    'block'=>true, // display a larger alert block?
                    'fade'=>true, // use transitions?
                    'closeText'=>'&times;', // close link text - if set to false, no close link is displayed
                    'alerts'=>array( // configurations per alert type
                      'success'=>array('block'=>true, 'fade'=>true, 'closeText'=>'&times;'), // success, info, warning, error or danger
                    ),
                )); 
            ?>
            <?php echo $content; ?>
        </div><!-- content -->
    </div>
</div>
<?php $this->endContent(); ?>