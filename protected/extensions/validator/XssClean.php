<?php
/**
 * Xss过滤 
 */
class XssClean extends CValidator {

	public $mode='stripClean';

	public $params = array();

    protected function validateAttribute($object, $attribute) {
        if (empty($object->$attribute))
        	return;
        switch ($this->mode) {
        	case 'xssClean':
        		if(isset($this->params['isImage']))
        			$object->$attribute = Yii::app()->input->xssClean($object->$attribute, $this->params['isImage']);
        		else
        			$object->$attribute = Yii::app()->input->xssClean($object->$attribute);
        		break;
            case 'purify':
                    $object->$attribute = Yii::app()->input->purify($object->$attribute);
                break;
        	default:
        		$object->$attribute = Yii::app()->input->stripClean($object->$attribute);
        		break;
        }
    }

}