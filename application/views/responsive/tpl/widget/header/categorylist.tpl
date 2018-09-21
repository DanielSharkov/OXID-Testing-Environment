[{block name="dd_widget_header_categorylist"}]
	[{if $oxcmp_categories}]
		[{assign var="homeSelected" value="false"}]
		[{if $oViewConf->getTopActionClassName() == 'start'}]
			[{assign var="homeSelected" value="true"}]
		[{/if}]
		[{assign var="oxcmp_categories" value=$oxcmp_categories}]
		[{assign var="blFullwidth" value=$oViewConf->getViewThemeParam('blFullwidthLayout')}]

		<nav id="mainnav" class="grid" role="navigation">
			[{block name="dd_widget_header_categorylist_navbar_list"}]
				<div class="navbar-header">
					[{block name="dd_widget_header_categorylist_navbar_header"}]
						<button
						type="button"
						class="navbar-toggle"
						data-toggle="collapse"
						data-target=".navbar-ex1-collapse">
							<span class="sr-only">Toggle navigation</span>
							<span class="icon-bar"></span>
							<span class="icon-bar"></span>
							<span class="icon-bar"></span>
						</button>
						<span class="visible-xs-inline">
							[{oxmultilang ident="DD_ROLES_BEMAIN_UIROOTHEADER"}]
						</span>
					[{/block}]
				</div>

				<div class="collapse navbar-collapse">
					<div id="navigation" class="grid">
						[{block name="dd_widget_header_categorylist_navbar_list"}]
							<a [{if $homeSelected == 'true'}]class="active"[{/if}] href="[{$oViewConf->getHomeLink()}]">[{oxmultilang ident="HOME"}]</a>

							[{foreach from=$oxcmp_categories item="ocat" key="catkey" name="root"}]
								[{if $ocat->getIsVisible()}]
									[{foreach from=$ocat->getContentCats() item="oTopCont" name="MoreTopCms"}]
										<a href="[{$oTopCont->getLink()}]">[{$oTopCont->oxcontents__oxtitle->value}]</a>
									[{/foreach}]

									<div class="[{if $homeSelected == 'false' && $ocat->expanded}]active[{/if}][{if $ocat->getSubCats()}] dropdown[{/if}]">
										<a href="[{$ocat->getLink()}]"[{if $ocat->getSubCats()}] class="dropdown-toggle" data-toggle="dropdown"[{/if}]>
											[{$ocat->oxcategories__oxtitle->value}][{if $ocat->getSubCats()}] <i class="fa fa-angle-down"></i>[{/if}]
										</a>

										[{if $ocat->getSubCats()}]
											<div class="dropdown-menu">
												[{foreach from=$ocat->getSubCats() item="osubcat" key="subcatkey" name="SubCat"}]
													[{if $osubcat->getIsVisible()}]
														[{foreach from=$osubcat->getContentCats() item=ocont name=MoreCms}]
															<a href="[{$ocont->getLink()}]">[{$ocont->oxcontents__oxtitle->value}]</a>
														[{/foreach}]

														[{if $osubcat->getIsVisible()}]
															<a
																class="
																	[{if $homeSelected == 'false' && $osubcat->expanded}]current[{/if}]
																	[{if $homeSelected == 'false' && $osubcat->expanded}]active[{/if}]
																"
																href="[{$osubcat->getLink()}]">[{$osubcat->oxcategories__oxtitle->value}]
															</a>
														[{/if}]
													[{/if}]
												[{/foreach}]
											</div>
										[{/if}]
									</div>
								[{/if}]
							[{/foreach}]
						[{/block}]
					</div>

					<div class="search-col">
						[{include file="widget/header/search.tpl"}]
					</div>

					<div class="nav navbar-nav navbar-right fixed-header-actions">
						<a href="[{oxgetseourl ident=$oViewConf->getSelfLink()|cat:"cl=basket"}]" rel="nofollow">
							<svg class="shopping-bag-mini[{if $oxcmp_basket->getItemsCount()}] filled[{/if}]" viewBox="0 0 64 64">
								<use xlink:href="#shoppingBagMini" /> [{* svg icon included in base.tpl *}]
							</svg>
						</a>
						<a href="javascript:void(null)" class="search-toggle" rel="nofollow">
							<i class="fa fa-search"></i>
						</a>
					</div>

					[{if $oView->isDemoShop()}]
						<a href="[{$oViewConf->getBaseDir()}]admin/" class="btn btn-sm btn-danger navbar-btn navbar-right visible-lg">
							[{oxmultilang ident="DD_DEMO_ADMIN_TOOL"}]
							<i class="fa fa-external-link" style="font-size: 80%;"></i>
						</a>
					[{/if}]
				</div>
			[{/block}]
		</nav>
	[{/if}]
[{/block}]
