[{$smarty.block.parent}]

[{oxstyle include=$oViewConf->getModuleUrl('display_volume', 'out/src/css/display_volume.css')}]

[{if $article_volume > 0}]
	<span class="article-volume">
		[{oxmultilang ident="DISPLAY_VOLUME_LABEL_VOLUME"}]: [{$article_volume}] [{$volume_unit}]
		<b class="cubic">3</b>
	</span>
[{/if}]
