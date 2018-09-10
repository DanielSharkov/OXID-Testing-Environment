<?php

class test_service {
    public function GetSetting($setting) {
        $settings = oxRegistry::get('oxConfig');
        return $settings->getConfigParam($setting);
    }
}
