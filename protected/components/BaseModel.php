<?php
class BaseModel extends CActiveRecord {

    public function behaviors() {
        return array(
            'CTimestampBehavior' => array(
                'class' => 'zii.behaviors.CTimestampBehavior',
                'createAttribute' => 'created_at',
                'updateAttribute' => 'updated_at',
            )
        );
    }
    
    
     /**
     * 根据表单名字获取错误信息
     * 
     * @return Array 返回错误的信息
     */
    public function getErrorsWithFormName() {
        // 验证出错, 返回错误信息
        $errors = $this->getErrors();

        $errorMsg = array();
        foreach ($errors as $field => $error) {
            $attribute_name = get_class($this) . '_' . $field;
            $errorM['id'] = $attribute_name;
            $errorM['tips'] = $error[0];
            $errorMsg[] = $errorM;
        }
        return $errorMsg;
    }

}