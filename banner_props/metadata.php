<?php
/**
 * Metadata version
 */
$sMetadataVersion = '1.0';

/**
 * Module information
 */
$aModule = [
	'id' => 'banner_props',
	'title' => 'Banner Properties',
	'description' => [
		'de' => 'Fügt hilfreiche Eigenschaften für Banner hinzu.',
		'en' => 'Adds useful properties for the banner.',
	],
	'version' => '1.0.0',
	'author' => '<a href="danielsharkov.com/about">Daniel Sharkov</a>',
	'email' => 'daniel.scharkov@eod.de',
	'url' => '',
	'extend' => [],
	'blocks' => [],
	'files' => [
		'test_menu' => 'dash/banner_props/application/controllers/admin/test_menu.php',
	],
	'settings' => [],
	'events' => [],
	'templates' => [
		'test.tpl' => 'dash/banner_props/application/views/admin/test.tpl',
	],
];
