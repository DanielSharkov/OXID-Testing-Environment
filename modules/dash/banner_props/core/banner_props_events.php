<?php

class banner_props_events {
	# onActivate
	public static function onActivate() {
		# Adjusts the views in the database to this module
		$oDb = oxDb::getDb();

		# Adjust oxactions_de view to this module
		$test = $oDb->getOne(
			'ALTER VIEW tes.oxv_oxactions_de AS SELECT '.
				'OXID, OXSHOPID, OXTYPE, OXTITLE, OXLONGDESC, '.
				'OXACTIVE, OXACTIVEFROM, OXACTIVETO, OXPIC, '.
				'OXLINK, OXSORT, OXTIMESTAMP, OX_BUTTON_COLOR, '.
				'OX_BUTTON_LABEL'.
			' FROM oxactions'
		);
		# Adjust oxactions_en view to this module
		$test2 = $oDb->getOne(
			'ALTER VIEW tes.oxv_oxactions_en AS SELECT '.
				'OXID, OXSHOPID, OXTYPE, OXTITLE_1 AS OXTITLE, '.
				'OXLONGDESC_1 AS OXLONGDESC, OXACTIVE, '.
				'OXACTIVEFROM, OXACTIVETO, OXPIC_1 AS OXPIC, '.
				'OXLINK_1 AS OXLINK, OXSORT, OXTIMESTAMP, '.
				'OX_BUTTON_COLOR, OX_BUTTON_LABEL'.
			' FROM oxactions'
		);

		# Field => [Type, Comment]
		$aTableFields = array(
			'OX_BUTTON_COLOR' => [
				'type' => 'CHAR(255)',
				'comment' => 'Color of the banner button'
			],
			'OX_BUTTON_LABEL' => [
				'type' => 'CHAR(255)',
				'comment' => 'Label of the banner button'
			]
		);

		$oDbMetaDataHandler = oxNew('oxDbMetaDataHandler');

		foreach ($aTableFields as $sFieldName => $aProps) {
			$cmt = $aProps['comment'];
			$type = $aProps['type'];

			if (!$oDbMetaDataHandler->fieldExists($sFieldName, 'oxactions')) {
				oxDb::getDb()->execute(
					"ALTER TABLE `oxactions` " .
					"ADD `$sFieldName` $type COMMENT '$cmt';"
				);
			}
		}
	}

	# onDeactivate
	public static function onDeactivate() {
		# Resets the views in the database to default
		$oDb = oxDb::getDb();
	
		# Alter oxactions_de view back to default
		$test = $oDb->getOne(
			'ALTER VIEW tes.oxv_oxactions_de AS SELECT '.
				'OXID, OXSHOPID, OXTYPE, OXTITLE, OXLONGDESC, '.
				'OXACTIVE, OXACTIVEFROM, OXACTIVETO, OXPIC, '.
				'OXLINK, OXSORT, OXTIMESTAMP'.
			' FROM oxactions'
		);
		# Alter oxactions_en view back to default
		$test2 = $oDb->getOne(
			'ALTER VIEW tes.oxv_oxactions_en AS SELECT '.
				'OXID, OXSHOPID, OXTYPE, OXTITLE_1 AS OXTITLE, '.
				'OXLONGDESC_1 AS OXLONGDESC, OXACTIVE, '.
				'OXACTIVEFROM, OXACTIVETO, OXPIC_1 AS OXPIC, '.
				'OXLINK_1 AS OXLINK, OXSORT, OXTIMESTAMP'.
			' FROM oxactions'
		);
	}
}