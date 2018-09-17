<?php

class banner_props_events {
	# onActivate
	public static function onActivate() {
		# Adjusts the views in the database to this module
		$oDb = oxDb::getDb();

		# Check if column "OX_BUTTON_COLOR" is already initialized in table "oxactions"
		$btnColor = $oDb->getOne(
			'SHOW COLUMNS FROM `oxactions` LIKE "OX_BUTTON_COLOR";'
		);
		# Initialize column when column is not defined
		if (empty($btnColor)) {
			$oDb->getOne(
				"ALTER TABLE oxactions
					ADD OX_BUTTON_COLOR
						CHAR(255)
						NOT NULL
						DEFAULT '#fff'
						COMMENT 'Color of the button in the banner info'"
			);
		}

		# Check if column "OX_BUTTON_LABEL" is already initialized in table "oxactions"
		$btnLabel = $oDb->getOne(
			'SHOW COLUMNS FROM `oxactions` LIKE "OX_BUTTON_LABEL";'
		);
		# Initialize column when column is not defined
		if (empty($btnLabel)) {
			$oDb->getOne(
				"ALTER TABLE oxactions
					ADD OX_BUTTON_LABEL
						CHAR(255)
						COMMENT 'Label of the button in the banner info'"
			);
		}

		# Check if column "OX_BANNER_INFO_ALIGN" is already initialized in table "oxactions"
		$infoAlign = $oDb->getOne(
			'SHOW COLUMNS FROM `oxactions` LIKE "OX_BANNER_INFO_ALIGN";'
		);
		# Initialize column when column is not defined
		if (empty($infoAlign)) {
			$oDb->getOne(
				"ALTER TABLE oxactions
					ADD OX_BANNER_INFO_ALIGN
						ENUM(
							'left_top', 'left_centered', 'left_bottom',
							'right_top', 'right_centered', 'right_bottom',
							'top_centered', 'centered', 'bottom_centered'
						)
						NOT NULL
						DEFAULT 'left_bottom'
						COMMENT 'Alignment of the banner info'"
			);
		}

		# Adjust oxactions_de view to this module
		$oDb->getOne(
			'ALTER VIEW tes.oxv_oxactions_de AS SELECT '.
				'OXID, OXSHOPID, OXTYPE, OXTITLE, OXLONGDESC, '.
				'OXACTIVE, OXACTIVEFROM, OXACTIVETO, OXPIC, '.
				'OXLINK, OXSORT, OXTIMESTAMP, OX_BUTTON_COLOR, '.
				'OX_BUTTON_LABEL, OX_BANNER_INFO_ALIGN'.
			' FROM oxactions'
		);
		# Adjust oxactions_en view to this module
		$oDb->getOne(
			'ALTER VIEW tes.oxv_oxactions_en AS SELECT '.
				'OXID, OXSHOPID, OXTYPE, OXTITLE_1 AS OXTITLE, '.
				'OXLONGDESC_1 AS OXLONGDESC, OXACTIVE, '.
				'OXACTIVEFROM, OXACTIVETO, OXPIC_1 AS OXPIC, '.
				'OXLINK_1 AS OXLINK, OXSORT, OXTIMESTAMP, '.
				'OX_BUTTON_COLOR, OX_BUTTON_LABEL, OX_BANNER_INFO_ALIGN'.
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
		$oDb = oxDb::getDb();
	
		// # Drop columns in table oxactions
		// $oDb->getOne(
		// 	'ALTER TABLE ox_oxactions DROP COLUMN '.
		// 		'OX_BUTTON_COLOR, '.
		// 		'OX_BUTTON_LABEL, '.
		// 		'OX_BANNER_INFO_ALIGN'
		// );

		# Reset oxactions_de view back to default
		$oDb->getOne(
			'ALTER VIEW tes.oxv_oxactions_de AS SELECT '.
				'OXID, OXSHOPID, OXTYPE, OXTITLE, OXLONGDESC, '.
				'OXACTIVE, OXACTIVEFROM, OXACTIVETO, OXPIC, '.
				'OXLINK, OXSORT, OXTIMESTAMP'.
			' FROM oxactions'
		);
		# Reset oxactions_en view back to default
		$oDb->getOne(
			'ALTER VIEW tes.oxv_oxactions_en AS SELECT '.
				'OXID, OXSHOPID, OXTYPE, OXTITLE_1 AS OXTITLE, '.
				'OXLONGDESC_1 AS OXLONGDESC, OXACTIVE, '.
				'OXACTIVEFROM, OXACTIVETO, OXPIC_1 AS OXPIC, '.
				'OXLINK_1 AS OXLINK, OXSORT, OXTIMESTAMP'.
			' FROM oxactions'
		);
	}
}