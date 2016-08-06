<?php
class H
{
    /**
     * 中文截取前面部分
     *
     * @param $str
     * @param $length
     * @param string $suffix
     */
    public static function substr($str, $length, $suffix = '...')
    {
        $str = strip_tags($str);
        if(mb_strlen($str, 'utf-8') > $length) {
            return mb_substr($str, 0, $length, 'utf-8') . $suffix;
        }
        return $str;
    }

    /**
     * 打印数据
     * 
     * @param type $value 任何类型数据
     * @param boolean $die 是否终止程序
     */
    public static function printR($value, $die = true)
    {
        echo '<pre>';
        print_r($value);
        if($die)
        {
            Yii::app()->end();
        }
    }
    
    /**
     * 静态js文件地址
     * @param  [type] $url [description]
     * @return [type]      [description]
     */
    public static function staticScriptFile($url)
    {
        $url = Yii::app()->request->baseUrl . '/static/js/' . $url;
        return '<script type="text/javascript" src="' . CHtml::encode($url) . '"></script>';
    }

    /**
     * 静态css文件地址
     * @param  [type] $url   [description]
     * @param  string $media [description]
     * @return [type]        [description]
     */
    public static function staticCssFile($url, $media = '')
    {
        $url = Yii::app()->request->baseUrl . '/static/css/' . $url;
        return CHtml::linkTag('stylesheet', 'text/css', $url, $media !== '' ? $media : null);
    }

    public static function staticImgUrl($url)
    {
        return Yii::app()->request->baseUrl . '/static/images/' . $url;
    }

    /**
     * 时间戳转日期函数
     * 
     * @param type $value
     * @param boolean $readable
     * @return string
     */
    public static function date($value, $readable = FALSE)
    {
        $value = (int)$value;
        if($readable) {
            $during_time = (Yii::app()->params['now'] - $value);
            if($during_time < 0) {
                return "未来";
            }elseif($during_time < 60) {
                return $during_time . '秒前';
            }elseif($during_time < 3600) {
                return floor($during_time/60).'分钟前';
            }elseif($during_time < 86400) {
                return floor($during_time/3600).'小时前';
            }elseif($during_time < 259200) { //三天内
                return floor($during_time/86400).'天前';
            }
        }
        return $value > 0 ? date('Y-m-d H:i:s', $value) : "";         
    }

    /**
     * 根据｜符号分割字符串
     * @param  [type] $link_string [description]
     * @return [type]              [description]
     */
    public static function getLinkByString($link_string)
    {
        $lines = preg_split('/[\n\r]+/', $link_string);
        is_array($lines) || $lines=array();
        $r = array();
        foreach ($lines as $k => $v) {
            $temp = explode('|', $v);
            $r[$k]['name'] = trim($temp[0]);
            $r[$k]['url'] = trim($temp[1]);
            isset($temp[2]) && $r[$k]['img'] = trim($temp[2]);
        }
        return $r;
    }

    /**
     * 获取图片的a标签连接,图片src,及图片src属性
     * @param  [type] $str [description]
     * @return [type]      [description]
     */
    public static function getImagesAttrbutes($str){
        $r = array();
        preg_match_all("/<[a].*?href=[\'|\"].*?[\'|\"].*?[<\/a]>/",$str,$out);
        foreach ($out[0] as $v) {
            preg_match("/<[a].*?href=[\'|\"](.*?)[\'|\"]>/", $v, $links);
            preg_match("/<[img|IMG].*?src=[\'|\"](.*?(?:[\.gif|\.jpg]))[\'|\"] .*?alt=[\'|\"](.*?)[\'|\"].*?[\/]?>/", $v, $imgs);
            $r[$imgs[1]] = array(
                'link' => isset($links[1]) ? $links[1] : '',
                'img' => $imgs[1],
                'alt' => isset($imgs[2]) ? $imgs[2] : '',
            );
        }
        preg_match_all("/<[img|IMG].*?src=[\'|\"](.*?(?:[\.gif|\.jpg]))[\'|\"].*?[\/]?>/",$str,$out_img);
        foreach ($out_img[1] as $k=>$v) {
            if(!isset($r[$v])){
                preg_match("/<[img|IMG].*?alt=[\'|\"](.*?)[\'|\"].*?[\/]?>/", $out_img[0][$k], $alt);
                $r[$v] = array(
                    'link' => '',
                    'img' => $v,
                    'alt' => isset($alt[1]) ? $alt[1] : '',
                );
            }
        }
        return json_encode($r);
    }

    /**
     * 生成图片属性html内容
     * @param  [type] $str [description]
     * @return [type]      [description]
     */
    public static function gentImagesContent($str)
    {
        $arr = json_decode($str, true);
        if(is_null($arr)){
            return '';
        }
        
        $r = '';
        foreach ($arr as $v) {
            $img = CHtml::image($v['img'], $v['alt']);
            if($v['link']){
                $r .= CHtml::link($img, $v['link']);
            } else {
                $r .= $img;
            }
        }
        return $r;
    }
}