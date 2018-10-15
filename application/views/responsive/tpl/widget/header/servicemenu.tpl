[{if $oxcmp_user}]
	[{assign var="noticeListCount" value=$oxcmp_user->getNoticeListArtCnt()}]
	[{assign var="wishListCount" value=$oxcmp_user->getWishListArtCnt()}]
	[{assign var="recommListCount" value=$oxcmp_user->getRecommListsCount()}]
[{else}]
	[{assign var="noticeListCount" value="0"}]
	[{assign var="wishListCount" value="0"}]
	[{assign var="recommListCount" value="0"}]
[{/if}]
[{math equation="a+b+c+d" a=$oView->getCompareItemsCnt() b=$noticeListCount c=$wishListCount d=$recommListCount assign="notificationsCounter"}]

<div class="btn-group service-menu [{if !$oxcmp_user}]showLogin[{/if}]">
	<button type="button" class="btn dropdown-toggle" data-toggle="dropdown" data-href="[{oxgetseourl ident=$oViewConf->getSelfLink()|cat:"cl=account"}]">
		[{block name="dd_layout_page_header_icon_menu_account_button"}]
			<i class="icon material-icons">person</i>
			[{*if !$oxcmp_user}]
				<span>
					[{oxmultilang ident="LOGIN"}]
				</span>
			[{else}]
				<span>
					[{oxmultilang ident="MY_ACCOUNT"}]
				</span>
			[{/if*}]
			[{if $notificationsCounter > 0}]
				<span class="badge">[{$notificationsCounter}]</span>
			[{/if}]
			<i class="icon material-icons">keyboard_arrow_down</i>
		[{/block}]
	</button>
	<div class="grid dropdown-menu drop-shadow-25 dropdown-menu-right align-right-top expand-left-down" role="menu">
		[{block name="dd_layout_page_header_icon_menu_account_list"}]
			[{if !$oxcmp_user}]
				[{include file="widget/header/loginbox.tpl"}]
			[{/if}]
			[{include file="widget/header/servicebox.tpl"}]
			[{if $oxcmp_user}]
				<div class="divider"></div>
				<div class="text-right">
					<a class="btn btn-danger" role="button" href="[{$oViewConf->getLogoutLink()}]" title="[{oxmultilang ident="LOGOUT"}]">
						<i class="fa fa-power-off"></i> [{oxmultilang ident="LOGOUT"}]
					</a>
				</div>
			[{/if}]
		[{/block}]
	</div>
</div>