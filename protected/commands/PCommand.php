<?php
Yii::import('models');
class PCommand extends BaseCommand
{
	public function actionIndex()
	{
		// $this->println();
		$path = realpath(Yii::app()->basePath.'/../public');
		// die;
		$file_handle = fopen($path.'/address.txt', "r");
		$r = array();
		$root = Provinces::model()->findByPk(1);
        
		while (!feof($file_handle)) {
		    $line = fgets($file_handle);
		    $code = $this->getCode($line);
			$model = new Provinces;
		    $model->name = $code[3];
		    $model->status = 1;
		    if($code[2]>0){
		        $model->appendTo($shi);
		    }elseif ($code[1]>0) {
		    	$model->appendTo($sheng);
		        $shi = $model;
		    }else{
		    	$model->appendTo($root);
		    	$sheng = $model;
		    }
		}
		$this->println('success');
	}

	public function getCode($line)
	{
	    $r = array();
	    $r[] = substr($line, 1,2);
	    $r[] = substr($line, 3,2);
	    $r[] = substr($line, 5,2);
	    preg_match("/[\x{4e00}-\x{9fa5}]+/u", $line, $a);
	    $r[] = $a[0];
	    return $r;
	}
} 