<?php
/**
 * 旅通网前台分页定制
 * @author Mhy
 */
class Pagination extends CLinkPager
{
    public $page_type;
	public $custom_page_size;
    
    public function init()
    {
        parent::init();
        
        $this->cssFile        = false;
        $this->htmlOptions    = array();
        $this->maxButtonCount = 5;
        
        if($this->custom_page_size)
        {
            $this->pageSize = $this->custom_page_size;
        }
        
//        $pageCount = ceil($this->itemCount / $this->pageSize);
        $pageCount = (int)(($this->itemCount + $this->pageSize - 1) / $this->pageSize);
        
        
        $page_type_array = array
        (
            'list-pager',
            'tb-pager',
            'ajax-pager',
        );
        
        if(!in_array($this->page_type, $page_type_array))
        {
            $this->page_type = 'list-pager';
        }
        
        if($this->page_type == 'list-pager')
        {
            $this->firstPageLabel = '';
            $this->prevPageLabel  = '<<';
            $this->nextPageLabel  = '>>';
            $this->lastPageLabel  = '';
        } else if($this->page_type == 'tb-pager') {
            $this->header = '<div class="tb-pager"><div>共 ' . $pageCount . ' 页 ， ' . $this->itemCount . '条记录</div>';
            $this->firstPageLabel = '首页';
            $this->prevPageLabel  = '上一页';
            $this->nextPageLabel  = '下一页';
            $this->lastPageLabel  = '尾页';
        } else if($this->page_type == 'ajax-pager') {
            $this->header = '<div class="list-pager"><div class="list-pager-sum">共 <span class="font-blue">' . $pageCount . '</span> 页</div>';
            $this->firstPageLabel = '';
            $this->prevPageLabel  = '<<';
            $this->nextPageLabel  = '>>';
            $this->lastPageLabel  = '';
        }
        $this->footer = '</div>';
    }
    
    private function createJsCode()
    {
        $route = Yii::app()->controller->getRoute();
        $params = Yii::app()->controller->getActionParams();
        if(isset($params['page']))
        {
            unset($params['page']);
        }
        $params_string = '';
        foreach($params as $k => $v)
        {
            $params_string .= '/' . $k . '/' . $v;
        }
        $url = $route . $params_string;
        $code = <<< EOF
$('.LvPaginationCustomSkip').change(function (){
    window.location = '/{$url}/page/' + parseInt($(this).val());
});
EOF;
        return $code;
    }
    
    public function run()
    {
        parent::run();
        $cs = Yii::app()->clientScript;
        if($this->page_type == 'list-pager')
        {
            $cs->registerScript('LvPaginationCustom', $this->createJsCode(), CClientScript::POS_END);
        }
    }
}