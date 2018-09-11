<?php

class extend_details extends extend_details_parent {
	/**
	 * _getVolume
	 * 
	 * returns the volume depending on the size.
	 * For example if the size is bigger then 1(cubic meter) then it just returns the volume
	 * if the volume is smaller then 1(cubic meter) the it returns the volume in centimeters
	 * 
	 * @param string $volume
	 */
	private function _getVolume($volume) {
		if ($volume > 1) return $volume;
		return $volume * 100;
	}

	/**
	 * _getVolumeUnit
	 * 
	 * returns the mathematical Unit for the value of volume
	 * "m" for meters and "cm" for centimeters
	 * 
	 * @param string $volume
	 */
	private function _getVolumeUnit($volume) {
		if ($volume > 1 ) return 'm';
		return 'cm';
	}

	public function render() {
		$product_volume = $this->getProduct()->getSize();

		$this->_aViewData['article_volume'] = $this->_getVolume(
			$product_volume
		);
		$this->_aViewData['volume_unit'] = $this->_getVolumeUnit(
			$product_volume
		);

		return parent::render();
	}
}
