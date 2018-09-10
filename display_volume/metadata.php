<?php
/**
 * Metadata version
 */
$sMetadataVersion = '1.0';

/**
 * Module information
 */
$aModule = array(
	'id' => 'display_volume',
	'title' => 'Volume calc',
	'description' => array(
		'de' => 'Zeigt das berechnete Volumen des Artikels an.',
		'en' => 'Shows the calculated volume of the product.',
	),
	'version' => '1.0.0',
	'author' => '<a href="danielsharkov.com/about">Daniel Sharkov</a>',
	'email' => 'daniel.scharkov@eod.de',
	'url' => 'http://danielsharkov.com/about',
	'extend' => array(
		'details' => 'dash/display_volume/application/controllers/display_volume_details',
	),
	'blocks' => array(
		array(
			'template' => 'page/details/inc/productmain.tpl',
			'block' => 'details_productmain_shortdesc',
			'file' => '/application/views/blocks/display_volume_productmain.tpl',
		),
	),
	'files' => array(),
	'settings' => array(),
	'events' => array(),
);
