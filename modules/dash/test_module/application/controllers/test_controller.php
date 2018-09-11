<?php

class test_controller extends test_controller_parent {
	public function render() {
		$service = oxNew('test_service');
		$settings = oxRegistry::get('oxConfig');

		$this->_aViewData['displayTextSetting'] = $service->GetSetting(
			'SETTING_DISPLAY_TEXT'
		);
		$this->_aViewData['boolSetting'] = $service->GetSetting(
			'SETTING_DISPLAY_STATE'
		);

		return parent::render();
	}
}
