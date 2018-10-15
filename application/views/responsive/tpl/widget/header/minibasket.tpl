<div class="btn-group minibasket-menu">
	<button
	type="button"
	class="dropdown-toggle shopping-bag [{if $oxcmp_basket->getItemsCount()}]filled[{/if}]"
	data-toggle="dropdown"
	data-href="[{oxgetseourl ident=$oViewConf->getSelfLink()|cat:"cl=basket"}]">
		[{block name="dd_layout_page_header_icon_menu_minibasket_button"}]
			<svg viewBox="0 0 448 512">
				[{include file="layout/svg/shoppingbag.svg" count=$oxcmp_basket->getItemsCount()}]
			</svg>
		[{/block}]
	</button>
	<div class="grid dropdown-menu drop-shadow-25 dropdown-menu-right align-right-top expand-left-down" role="menu">
		[{block name="dd_layout_page_header_icon_menu_minibasket_list"}]
			[{oxid_include_dynamic file="widget/minibasket/minibasket.tpl"}]
		[{/block}]
	</div>
</div>
