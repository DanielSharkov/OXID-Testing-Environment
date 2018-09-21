<div class="btn-group minibasket-menu">
	<button
	type="button"
	class="dropdown-toggle"
	data-toggle="dropdown"
	data-href="[{oxgetseourl ident=$oViewConf->getSelfLink()|cat:"cl=basket"}]">
		[{block name="dd_layout_page_header_icon_menu_minibasket_button"}]
			<svg
			class="shopping-bag [{if $oxcmp_basket->getItemsCount()}]filled[{/if}]"
			viewBox="0 0 448 512">
				[{include file="layout/svg/shoppingbag.svg" count=$oxcmp_basket->getItemsCount()}]
			</svg>
		[{/block}]
	</button>
	<div class="grid dropdown-menu dropdown-menu-right pull-right" role="menu">
		[{block name="dd_layout_page_header_icon_menu_minibasket_list"}]
			<div class="pull-right">
				<div class="minibasket-menu-box">
					[{oxid_include_dynamic file="widget/minibasket/minibasket.tpl"}]
				</div>
			</div>
		[{/block}]
	</div>
</div>
