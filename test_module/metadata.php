<?php
/**
 * Metadata version
 */
$sMetadataVersion = '1.0';

/**
 * Module information
 */
$aModule = array(
	'id' => 'test_module',
	'title' => 'Test Module',
	'description' => array(
		'de' => 'Dies ist ein einfaches test Modul.',
		'en' => 'This is an sample test module.',
	),
	'version' => '1.0.0',
	'author' => '<a href="danielsharkov.com/about">Daniel Sharkov</a>',
	'email' => 'daniel.scharkov@eod.de',
	'url' => 'http://danielsharkov.com/about',
	'extend' => array(
        'start' => 'dash/test_module/application/controllers/test_module_test_controller',
    ),
	'blocks' => array(
		array(
			'template' => 'page/shop/start.tpl',
			'block' => 'test_block',
			'file' => '/application/views/blocks/test_module_start.tpl',
		),
	),
	'files' => array(
		'test_service' => 'dash/test_module/service/test_module_service.php',
	),
	'settings' => array(
		array(
			'group' => 'main',
			'name' => 'SETTING_DISPLAY_TEXT',
			'type' => 'str',
			'value' => 'Im a setting',
		),
		array(
			'group' => 'main',
			'name' => 'SETTING_DISPLAY_STATE',
			'type' => 'bool',
			'value' => 'true',
		),
	),
	'events' => array(),
);
