[{block name="footer_services_items"}]
	<a href="[{oxgetseourl ident=$oViewConf->getSelfLink()|cat:"cl=contact"}]">
		[{oxmultilang ident="CONTACT"}]
	</a>

	[{if $oViewConf->getViewThemeParam('blFooterShowHelp')}]
		<a href="[{$oViewConf->getHelpPageLink()}]">
			[{oxmultilang ident="HELP"}]
		</a>
	[{/if}]

	[{if $oViewConf->getViewThemeParam('blFooterShowLinks')}]
		<a href="[{oxgetseourl ident=$oViewConf->getSelfLink()|cat:"cl=links"}]">
			[{oxmultilang ident="LINKS"}]
		</a>
	[{/if}]

	[{if $oViewConf->getViewThemeParam('blFooterShowGuestbook')}]
		<a href="[{oxgetseourl ident=$oViewConf->getSelfLink()|cat:"cl=guestbook"}]">
			[{oxmultilang ident="GUESTBOOK"}]
		</a>
	[{/if}]

	[{if $oView->isActive('Invitations')}]
		<a href="[{oxgetseourl ident=$oViewConf->getSelfLink()|cat:"cl=invite"}]">
			[{oxmultilang ident="INVITE_YOUR_FRIENDS"}]
		</a>
	[{/if}]

	[{oxhasrights ident="TOBASKET"}]
			<a href="[{oxgetseourl ident=$oViewConf->getBasketLink()}]">
				[{oxmultilang ident="CART"}]
				[{if $oxcmp_basket && $oxcmp_basket->getItemsCount() > 0}]
					<span class="badge">
						[{$oxcmp_basket->getItemsCount()}]
					</span>
				[{/if}]
			</a>
	[{/oxhasrights}]

	<a href="[{oxgetseourl ident=$oViewConf->getSelfLink()|cat:"cl=account"}]">
		[{oxmultilang ident="ACCOUNT"}]
	</a>
	
		<a href="[{oxgetseourl ident=$oViewConf->getSelfLink()|cat:"cl=account_noticelist"}]">
			[{oxmultilang ident="WISH_LIST"}]
			[{if $oxcmp_user && $oxcmp_user->getNoticeListArtCnt()}]
				<span class="badge">
					[{$oxcmp_user->getNoticeListArtCnt()}]
				</span>
			[{/if}]
		</a>
	
	[{if $oViewConf->getShowWishlist()}]
			<a href="[{oxgetseourl ident=$oViewConf->getSelfLink()|cat:"cl=account_wishlist"}]">
				[{oxmultilang ident="MY_GIFT_REGISTRY"}]
				[{if $oxcmp_user && $oxcmp_user->getWishListArtCnt()}]
					<span class="badge">
						[{$oxcmp_user->getWishListArtCnt()}]
					</span>
				[{/if}]
			</a>

			<a href="[{oxgetseourl ident=$oViewConf->getSelfLink()|cat:"cl=wishlist" params="wishid="|cat:$oView->getWishlistUserId()}]">
				[{oxmultilang ident="PUBLIC_GIFT_REGISTRIES"}]
			</a>				
	[{/if}]

	[{if $oView->isEnabledDownloadableFiles()}]
		<a href="[{oxgetseourl ident=$oViewConf->getSelfLink()|cat:"cl=account_downloads"}]">
			[{oxmultilang ident="MY_DOWNLOADS"}]
		</a>
	[{/if}]
[{/block}]
