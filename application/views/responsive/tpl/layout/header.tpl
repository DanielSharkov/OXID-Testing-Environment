[{block name="header_styles"}]
	[{oxstyle include="css/header.css"}]
[{/block}]

[{if $oViewConf->getTopActionClassName() != 'clearcookies' && $oViewConf->getTopActionClassName() != 'mallstart'}]
	[{oxid_include_widget cl="oxwCookieNote" _parent=$oView->getClassName() nocookie=1}]
[{/if}]
[{block name="header_main"}]
	[{assign var="blFullwidth" value=$oViewConf->getViewThemeParam('blFullwidthLayout')}]

	<header class="grid drop-shadow-5">
		<div class="grid stretch header-top">
			[{block name="layout_header_logo"}]
				[{assign var="slogoImg" value=$oViewConf->getViewThemeParam('sLogoFile')}]
				[{assign var="sLogoWidth" value=$oViewConf->getViewThemeParam('sLogoWidth')}]
				[{assign var="sLogoHeight" value=$oViewConf->getViewThemeParam('sLogoHeight')}]
				<a
				href="[{$oViewConf->getHomeLink()}]"
				title="[{$oxcmp_shop->oxshops__oxtitleprefix->value}]"
				class="brand">
					<img
						[{* src="[{$oViewConf->getImageUrl($slogoImg)}]" *}]
						src="http://127.0.0.1/out/responsive/img/eod.svg"
						alt="[{$oxcmp_shop->oxshops__oxtitleprefix->value}]"
						style="[{if $sLogoWidth}]width:auto;max-width:[{$sLogoWidth}]px;[{/if}][{if $sLogoHeight}]height:auto;max-height:[{$sLogoHeight}]px;[{/if}]"
					/>
				</a>
			[{/block}]
			[{block name="layout_header_top"}]
				<div class="grid menu-dropdowns align-right-top">
					[{block name="dd_layout_page_header_icon_menu_languages"}]
						[{* Language Dropdown*}]
						[{oxid_include_widget cl="oxwLanguageList" lang=$oViewConf->getActLanguageId() _parent=$oView->getClassName() nocookie=1 _navurlparams=$oViewConf->getNavUrlParams() anid=$oViewConf->getActArticleId()}]
					[{/block}]
					[{block name="dd_layout_page_header_icon_menu_currencies"}]
						[{* Currency Dropdown*}]
						[{oxid_include_widget cl="oxwCurrencyList" cur=$oViewConf->getActCurrency() _parent=$oView->getClassName() nocookie=1 _navurlparams=$oViewConf->getNavUrlParams() anid=$oViewConf->getActArticleId()}]
					[{/block}]

					[{block name="dd_layout_page_header_icon_menu_account"}]
						[{if $oxcmp_user || $oView->getCompareItemCount() || $Errors.loginBoxErrors}]
							[{assign var="blAnon" value=0}]
							[{assign var="force_sid" value=$oViewConf->getSessionId()}]
						[{else}]
							[{assign var="blAnon" value=1}]
						[{/if}]
						[{* Account Dropdown *}]
						[{oxid_include_widget cl="oxwServiceMenu" _parent=$oView->getClassName() force_sid=$force_sid nocookie=$blAnon _navurlparams=$oViewConf->getNavUrlParams() anid=$oViewConf->getActArticleId()}]
					[{/block}]

					[{block name="dd_layout_page_header_icon_menu_minibasket"}]
						[{* Minibasket Dropdown *}]
						[{if $oxcmp_basket->getProductsCount()}]
							[{assign var="blAnon" value=0}]
							[{assign var="force_sid" value=$oViewConf->getSessionId()}]
						[{else}]
							[{assign var="blAnon" value=1}]
						[{/if}]
						[{oxid_include_widget cl="oxwMiniBasket" nocookie=$blAnon force_sid=$force_sid}]
					[{/block}]
				</div>
			[{/block}]
		</div>
		[{block name="layout_header_bottom"}]
			[{oxid_include_widget cl="oxwCategoryTree" cnid=$oView->getCategoryId() sWidgetType="header" _parent=$oView->getClassName() nocookie=1}]
		[{/block}]
	</header>
	<script>
		let appScroll = 0
		function onScroll(event) {
			if (event.target.scrollTop >= 1 && appScroll <= 0) {
				document.getElementById(
					'app'
				).classList.add(
					'scrolled'
				)
			} else if (event.target.scrollTop <= 0 && appScroll >= 1) {
				document.getElementById(
					'app'
				).classList.remove(
					'scrolled'
				)
			}
			appScroll = event.target.scrollTop
		}

		document.getElementById('app').addEventListener(
			'scroll',
			onScroll,
		)
	</script>

[{/block}]

[{insert name="oxid_newbasketitem" tpl="widget/minibasket/newbasketitemmsg.tpl" type="message"}]
[{oxid_include_dynamic file="widget/minibasket/minibasketmodal.tpl"}]