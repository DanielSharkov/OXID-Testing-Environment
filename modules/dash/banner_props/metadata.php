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

$aModule = [
	'id' => $sID,
	'title' => "[$sPackage] Banner Properties",
	'description' => [
		'de' => 'Fügt hilfreiche Eigenschaften für Banner hinzu.',
		'en' => 'Adds useful properties for the banner.',
	],
	'version' => '1.0.0',
	'author' => $sAuthor,
	'email' => $sEmail,
	'url' => $sUrl,
	'extend' => [],
	'blocks' => [
		[
			'template' => 'actions_main.tpl',
			'block' => 'admin_actions_main_form',
			'file' => '/application/views/blocks/extend_actions_main.tpl',
		],
	],
	'settings' => [],
	'events' => [],
	'templates' => [],
];
