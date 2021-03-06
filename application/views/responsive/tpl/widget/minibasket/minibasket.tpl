[{if $oxcmp_basket->getProductsCount() gte 5}]
	[{assign var="blScrollable" value=true}]
[{/if}]

[{block name="widget_minibasket"}]
	[{if $oxcmp_basket->getProductsCount()}]
		[{oxhasrights ident="TOBASKET"}]
			[{assign var="currency" value=$oView->getActCurrency()}]

			[{if $_prefix == 'modal'}]
				<div
				class="modal fade basketFlyout"
				id="basketModal"
				tabindex="-1"
				role="dialog"
				aria-labelledby="basketModalLabel"
				aria-hidden="true">
					<div class="modal-dialog">
						<div class="modal-content">
							<div class="modal-header">
								<button type="button" class="close" data-dismiss="modal">
									<span aria-hidden="true">&times;</span>
									<span class="sr-only">[{oxmultilang ident="CLOSE"}]</span>
								</button>
								<h4 class="modal-title" id="basketModalLabel">[{$oxcmp_basket->getItemsCount()}] [{oxmultilang ident="ITEMS_IN_BASKET"}]</h4>
							</div>
							<div class="modal-body">
								[{if $oxcmp_basket->getProductsCount()}]
									[{oxhasrights ident="TOBASKET"}]
										<div id="[{$_prefix}]basketFlyout" class="basketFlyout">
											<table class="table table-striped">
												<thead>
													<tr>
														<th>[{oxmultilang ident="DD_MINIBASKET_MODAL_TABLE_TITLE"}]</th>
														<th class="text-right">[{oxmultilang ident="DD_MINIBASKET_MODAL_TABLE_PRICE"}]</th>
													</tr>
												</thead>
												<tbody>
													[{foreach from=$oxcmp_basket->getContents() name=miniBasketList item=_product}]
														[{block name="widget_minibasket_product"}]
															[{assign var="minibasketItemTitle" value=$_product->getTitle()}]
															<tr>
																<td>
																	<a href="[{$_product->getLink()}]" title="[{$minibasketItemTitle|strip_tags}]">
																		<span class="item">
																			[{if $_product->getAmount() > 1}]
																				[{$_product->getAmount()}] &times;
																			[{/if}]
																			[{$minibasketItemTitle|strip_tags}]
																		</span>
																	</a>
																</td>
																<td class="text-right">
																	<strong class="price">[{oxprice price=$_product->getPrice() currency=$currency}] *</strong>
																</td>
															</tr>
														[{/block}]
													[{/foreach}]
												</tbody>
												<tfoot>
													<tr>
														[{block name="widget_minibasket_total"}]
															<td><strong>[{oxmultilang ident="TOTAL"}]</strong></td>
															<td class="text-right">
																<strong class="price">
																	[{if $oxcmp_basket->isPriceViewModeNetto()}]
																		[{$oxcmp_basket->getProductsNetPrice()}]
																	[{else}]
																		[{$oxcmp_basket->getFProductsPrice()}]
																	[{/if}]
																	[{$currency->sign}] *
																</strong>
															</td>
														[{/block}]
													</tr>
												</tfoot>
											</table>
											[{include file="widget/minibasket/countdown.tpl"}]
										</div>
									[{/oxhasrights}]
								[{/if}]
							</div>
							<div class="modal-footer">
								<button
								type="button"
								class="btn btn-default"
								data-dismiss="modal">
									[{oxmultilang ident="DD_MINIBASKET_CONTINUE_SHOPPING"}]
								</button>
								<a
								href="[{oxgetseourl ident=$oViewConf->getSelfLink()|cat:"cl=basket"}]"
								class="btn btn-primary"
								data-toggle="tooltip"
								data-placement="top"
								title="[{oxmultilang ident="DISPLAY_BASKET"}]">
									<i class="fa fa-shopping-cart"></i>
								</a>
							</div>
						</div>
					</div>
				</div>
				[{oxscript add="$('#basketModal').modal('show');"}]

			[{else}]

				[{block name="dd_layout_page_header_icon_menu_minibasket_title"}]
					<div class="grid title">
						<span class="count">
							[{$oxcmp_basket->getItemsCount()}]
						</span>
						<h6 class="text">
							[{oxmultilang ident="ITEMS_IN_BASKET"}]
						</h6>
					</div>
				[{/block}]

				[{block name="dd_layout_page_header_icon_menu_minibasket_table"}]
					<div class="items-list">
						[{foreach from=$oxcmp_basket->getContents() name=miniBasketList item=_product}]
							[{block name="widget_minibasket_product"}]
								[{assign var="minibasketItemTitle" value=$_product->getTitle()}]

								<a
								class="grid basket-item"
								href="[{$_product->getLink()}]"
								title="[{$minibasketItemTitle|strip_tags}]">
									<img
										src="[{$_product->getIconUrl()}]"
										alt="[{$minibasketItemTitle|strip_tags}]"
										class="picture"
									/>

									<div class="grid details">
										<span class="name">
											[{$minibasketItemTitle|strip_tags}]
										</span>

										<span class="price">
											[{$_product->getFTotalPrice()}]&nbsp;[{$currency->sign}]
										</span>
									</div>

									<span class="amount">
										[{$_product->getAmount()}]
									</span>

									<button class="remove">
										<i class="icon fas fa-trash-alt"></i>
									</button>
								</a>
							[{/block}]
						[{/foreach}]
					</div>

					[{* <table class="table table-bordered table-striped">
						[{foreach from=$oxcmp_basket->getContents() name=miniBasketList item=_product}]
							[{block name="widget_minibasket_product"}]
								[{assign var="minibasketItemTitle" value=$_product->getTitle()}]
								<tr>
									<td class="picture text-center">
										<span class="badge">[{$_product->getAmount()}]</span>
										<a href="[{$_product->getLink()}]" title="[{$minibasketItemTitle|strip_tags}]">
											<img src="[{$_product->getIconUrl()}]" alt="[{$minibasketItemTitle|strip_tags}]"/>
										</a>
									</td>
									<td class="title">
										<a href="[{$_product->getLink()}]" title="[{$minibasketItemTitle|strip_tags}]">[{$minibasketItemTitle|strip_tags}]</a>
									</td>
									<td class="price text-right">[{$_product->getFTotalPrice()}]&nbsp;[{$currency->sign}]</td>
								</tr>
							[{/block}]
						[{/foreach}]
						<tr>
							<td class="total_label" colspan="2">
								<strong>[{oxmultilang ident="TOTAL"}]</strong>
							</td>
							<td class="total_price text-right">
								<strong>
									[{if $oxcmp_basket->isPriceViewModeNetto()}]
										[{$oxcmp_basket->getProductsNetPrice()}]
									[{else}]
										[{$oxcmp_basket->getFProductsPrice()}]
									[{/if}]
									&nbsp;[{$currency->sign}]
								</strong>
							</td>
						</tr>
					</table> *}]
				[{/block}]

				[{include file="widget/minibasket/countdown.tpl"}]

				[{block name="dd_layout_page_header_icon_menu_minibasket_functions"}]
					<div class="grid options">
						<button
						onclick="location.href='[{oxgetseourl ident=$oViewConf->getSelfLink()|cat:"cl=basket"}]'"
						class="btn">
							[{oxmultilang ident="DISPLAY_BASKET"}]
						</button>
						<button
						class="btn highlight"
						[{if $oxcmp_user}]
							onclick="location.href='[{oxgetseourl ident=$oViewConf->getSelfLink()|cat:"cl=payment"}]'"
						[{else}]
							onclick="location.href='[{oxgetseourl ident=$oViewConf->getSelfLink()|cat:"cl=user"}]'"
						[{/if}]>
							[{oxmultilang ident="CHECKOUT"}]
						</button>
					</div>
				[{/block}]
			[{/if}]
		[{/oxhasrights}]
	[{else}]
		[{block name="dd_layout_page_header_icon_menu_minibasket_alert_empty"}]
			<span class="empty-basket">
				[{oxmultilang ident="BASKET_EMPTY"}]
			</span>
		[{/block}]
	[{/if}]
[{/block}]