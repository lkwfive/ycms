<?php 
class UploadFile
{
	public static $image_url_path = '/upload/images/';
	public static $file_url_path = '/upload/files/';

	/**
	 * 保存图片
	 * @param  CUploadedFile $file [description]
	 * @return [type]              [description]
	 */
	public static function saveImage(CUploadedFile $file)
	{
        $image = Yii::app()->image->create($file->getTempName());
        $file_name = md5_file($file->getTempName());
        $file_path = Yii::app()->params['upload_image_path'].$file_name.'.jpg';
        $options=new SettingWatermarkForm;
        if($options->closed)
        	$image->createWatermark(Yii::app()->params['upload_path'].'watermark.png', $options->proportion, $options->right_margin, $options->bottom_margin);
        if($image->save($file_path, 'jpg'))
        	return $file_name;
        return null;
	}

	/**
	 * 保存文件
	 * @param  CUploadedFile $file [description]
	 * @return [type]              [description]
	 */
	public static function saveFile(CUploadedFile $file)
	{
		$file_name = md5_file($file->getTempName()).'.'.$file->getExtensionName();
		$file_path = Yii::app()->params['upload_file_path'].$file_name;
		if($file->saveAs($file_path)) {
			@chmod($file_path, 0644);
                return $file_name;
		}
		return null;
	}

	/**
	 * 获取文件url
	 * @param  [type] $file_name [description]
	 * @return [type]            [description]
	 */
	public static function getFileUrl($file_name)
	{	
		if(empty($file_name))
			return null;
		return self::$file_url_path.$file_name;
	}

	/**
	 * 获取图片url
	 * @param  [type] $image_name [description]
	 * @return [type]             [description]
	 */
	public static function getImageUrl($image_name)
	{	
		if(empty($image_name))
			return '/upload/404.jpg';
		return self::$image_url_path.$image_name.'.jpg';
	}

	/**
	 * 获取水印图片url
	 * @return [type] [description]
	 */
	public static function getWatermarkUrl()
	{
		if(file_exists(Yii::app()->params['upload_path'].'watermark.png'))
			return '/upload/watermark.png';
	}

	/**
	 * 保存水印图片
	 * @param  CUploadedFile $file [description]
	 * @return [type]              [description]
	 */
	public static function saveWatermark(CUploadedFile $file)
	{
		$file_path = Yii::app()->params['upload_path'].'watermark.png';
		if($file->saveAs($file_path)){
			@chmod($file_path, 0644);
			return true;
		}
		return false;
	}
}