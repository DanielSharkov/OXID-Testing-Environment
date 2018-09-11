<?php
# Package information
require __DIR__ . '/../vendormetadata.php';

# Metadata version
$sMetadataVersion = '1.0';

# Module ID
$sID = basename(__DIR__);

# Module information
$aModule = [
	'id' => $sID,
	'title' => "[$sPackageName] Volume calc",
	'description' => [
		# German
		'de' => 'Zeigt das berechnete Volumen auf der Detailansich des Artikels an.',
		# English
		'en' => 'Shows the calculated volume in the details view of the product.',
	],
	'version' => '1.0.0',
	'author' => $sAuthor,
	'email' => $sEmail,
	'url' => $sUrl,
	'extend' => [
		'details' => "$sPackage/$sID/application/controllers/extend_details",
	],
	'blocks' => [
		[
			'template' => 'page/details/inc/productmain.tpl',
			'block' => 'details_productmain_shortdesc',
			'file' => '/application/views/blocks/extend_productmain.tpl',
		],
	],
	'files' => [],
	'settings' => [],
	'events' => [],
];
