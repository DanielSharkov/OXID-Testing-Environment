[{block name="footer_information"}]
	[{oxifcontent ident="oximpressum" object="_cont"}]
		<a href="[{$_cont->getLink()}]">
			[{$_cont->oxcontents__oxtitle->value}]
		</a>
	[{/oxifcontent}]

	[{oxifcontent ident="oxagb" object="_cont"}]
		<a href="[{$_cont->getLink()}]">
			[{$_cont->oxcontents__oxtitle->value}]
		</a>
	[{/oxifcontent}]

	[{oxifcontent ident="oxsecurityinfo" object="oCont"}]
		<a href="[{$oCont->getLink()}]">
			[{$oCont->oxcontents__oxtitle->value}]
		</a>
	[{/oxifcontent}]

	[{oxifcontent ident="oxdeliveryinfo" object="oCont"}]
		<a href="[{$oCont->getLink()}]">
			[{$oCont->oxcontents__oxtitle->value}]
		</a>
	[{/oxifcontent}]

	[{oxifcontent ident="oxrightofwithdrawal" object="oCont"}]
		<a href="[{$oCont->getLink()}]">
			[{$oCont->oxcontents__oxtitle->value}]
		</a>
	[{/oxifcontent}]

	[{oxifcontent ident="oxorderinfo" object="oCont"}]
		<a href="[{$oCont->getLink()}]">
			[{$oCont->oxcontents__oxtitle->value}]
		</a>
	[{/oxifcontent}]

	[{oxifcontent ident="oxcredits" object="oCont"}]
		<a href="[{$oCont->getLink()}]">
			[{$oCont->oxcontents__oxtitle->value}]
		</a>
	[{/oxifcontent}]

	[{if $oViewConf->getViewThemeParam('blFooterShowNewsletter')}]
		<a href="[{oxgetseourl ident=$oViewConf->getSelfLink()|cat:"cl=newsletter"}]">
			[{oxmultilang ident="NEWSLETTER"}]
		</a>
	[{/if}]

	[{if $oViewConf->getViewThemeParam('blFooterShowNews')}]
		<a href="[{oxgetseourl ident=$oViewConf->getSelfLink()|cat:"cl=news"}]">
			[{oxmultilang ident="NEWS"}]
		</a>
	[{/if}]
[{/block}]