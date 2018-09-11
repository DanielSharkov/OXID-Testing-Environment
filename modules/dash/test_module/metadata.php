<?php
require __DIR__ . '/../vendormetadata.php';
require_once 'metadata_description.php';

/**
 * Metadata version
 */
$sMetadataVersion = '1.0';

/**
 * Module information
 */

# Styles for description
echo "<style>
	.dash-red-font {
		font-family: arial;
		color: #f00;
		font-weight: 900;
		border: solid .1rem #f00;
		display:inline-block;
		padding:.5rem;
	}
</style>";

$sID = basename(__DIR__);

$aModule = array(
	'id' => $sID,
	'title' => "[$sPackage] Test Module",
	'description' => array(
		# English
		'en' => _description(
			'This is an sample test module.',
			'Also supports HTML Tags',
			'And line breaks. AWESOME!',
			['List item #1','List item #2','Last list item'],
			'EVEN CSS!!!'
		),
		# German
		'de' => _description(
			'Dies ist ein einfaches test Modul.',
			'Unterstützt auch HTML Tags',
			'Sogar Zeilenumbrüche, WAHNSINN!',
			['Auflistung #1','Auflistung #2','Letztes Auflistung'],
			'SOGAR CSS!!!'
		),
	),
	'version' => '1.0.0',
	'author' => $sAuthor,
	'email' => $sEmail,
	'url' => $sUrl,
	'extend' => array(
        'start' => "$sPackage/$sID/application/controllers/test_controller",
    ),
	'blocks' => array(
		array(
			'template' => 'page/shop/start.tpl',
			'block' => 'test_block',
			'file' => '/application/views/blocks/overwrite_start.tpl',
		),
	),
	'files' => array(
		'test_service' => "$sPackage/$sID/service/my_service.php",
		'test_menu' => "$sPackage/$sID/application/controllers/admin/test_menu.php",
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
	'templates' => [
		'own_admin_page.tpl' => "$sPackage/$sID/application/views/admin/own_admin_page.tpl",
	],
);
