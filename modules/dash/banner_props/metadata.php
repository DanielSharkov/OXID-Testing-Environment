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
	'title' => "[$sPackageName] Banner Properties",
	'description' => [
		# German
		'de' => 'Fügt hilfreiche Eigenschaften für Banner hinzu, '.
				'wie z.B. eine Überschrift die angezeigt wird '.
				'und die Farbe des Knopfes.',
		# English
		'en' => 'Adds useful properties for banners'.
				'like a displayed title and '.
				'a colorable button.',
	],
	'version' => '1.0.0',
	'author' => $sAuthor,
	'email' => $sEmail,
	'url' => $sUrl,
	'extend' => [],
	'files' => [
		'banner_props_events' => "$sPackage/$sID/core/banner_props_events.php",	
	],
	'blocks' => [
		[ # Extend: Adminpanel -> Customer Info -> Promotions -> Inputs
			'template' => 'actions_main.tpl',
			'block' => 'admin_actions_main_form',
			'file' => '/application/views/blocks/extend_actions_main.tpl',
		],
		[ # Extend: Shop -> Startpage -> Promotion slider
			'template' => 'widget/promoslider.tpl',
			'block' => 'dd_widget_promoslider',
			'file' => '/application/views/blocks/extend_promoslider.tpl',
		],
	],
	'settings' => [],
	'events' => [
		'onActivate' => 'banner_props_events::onActivate',
		'onDeactivate' => 'banner_props_events::onDeactivate',
	],
	'templates' => [],
];
