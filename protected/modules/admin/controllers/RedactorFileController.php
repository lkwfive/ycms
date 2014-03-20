<?php
/**
 * redactor文件上传
 * 
 */
class RedactorFileController extends AdminBaseController
{
	public function actionImage()
	{
		$file = CUploadedFile::getInstanceByName('file');
		$filename = UploadFile::saveImage($file);
		if($filename)
			echo json_encode( array('filelink'=>UploadFile::getImageUrl($filename)) );
		die;
	}

	public function actionImagelist()
	{
		$list_files = glob(Yii::app()->params['upload_image_path'].'*.jpg');
		$r = array();
		foreach ($list_files as $key => $value) {
			$v = str_replace(Yii::app()->params['project_path'], '', $value);
			$r[] = array('filelink'=>$v,'thumb'=>$v,'image'=>$v,'folder'=>'images');
		}
		echo json_encode($r);
		die;
	}

	public function actionFile()
	{
		$file = CUploadedFile::getInstanceByName('file');
		$filename = UploadFile::saveFile($file);
		if($filename)
			echo json_encode( array('filelink'=>UploadFile::getFileUrl($filename),'filename'=>$file->getName()) );
		die;
	}
}