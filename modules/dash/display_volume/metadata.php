<?php
require __DIR__ . '/../vendormetadata.php';

/**
 * Metadata version
 */
$sMetadataVersion = '1.0';

/**
 * Module information
 */

$sID = basename(__DIR__);

$aModule = array(
	'id' => $sID,
	'title' => "[$sPackage] Volume calc",
	'description' => array(
		'de' => 'Zeigt das berechnete Volumen des Artikels an.',
		'en' => 'Shows the calculated volume of the product.',
	),
	'version' => '1.0.0',
	'author' => $sAuthor,
	'email' => $sEmail,
	'url' => $sUrl,
	'extend' => array(
		'details' => "$sPackage/$sID/application/controllers/extend_details",
	),
	'blocks' => array(
		array(
			'template' => 'page/details/inc/productmain.tpl',
			'block' => 'details_productmain_shortdesc',
			'file' => '/application/views/blocks/extend_productmain.tpl',
		),
	),
	'files' => array(),
	'settings' => array(),
	'events' => array(),
);
