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
	'title' => '[DaSh] Banner Properties',
	'description' => [
		'de' => 'Fügt hilfreiche Eigenschaften für Banner hinzu.',
		'en' => 'Adds useful properties for the banner.',
	],
	'version' => '1.0.0',
	'author' => '<a href="danielsharkov.com/about">Daniel Sharkov</a>',
	'email' => 'daniel.scharkov@eod.de',
	'url' => 'github.com/DanielSharkov/OXID-Testing-Environment',
	'extend' => [],
	'blocks' => [
		[
			'template' => 'actions_main.tpl',
			'block' => 'admin_actions_main_form',
			'file' => '/application/views/blocks/banner_props_actions_main.tpl',
		],
	],
	'files' => [
		'test_menu' => 'dash/banner_props/application/controllers/admin/test_menu.php',
	],
	'settings' => [],
	'events' => [],
	'templates' => [
		'own_admin_page.tpl' => 'dash/banner_props/application/views/admin/own_admin_page.tpl',
	],
];
