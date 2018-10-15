[{block name="header_styles"}]
    [{oxstyle include="css/footer.css"}]
[{/block}]

[{block name="footer_main"}]
	[{assign var="blShowFullFooter" value=$oView->showSearch()}]
	[{assign var="blFullwidth" value=$oViewConf->getViewThemeParam('blFullwidthLayout')}]
	[{$oView->setShowNewsletter($oViewConf->getViewThemeParam('blFooterShowNewsletterForm'))}]

	[{if $oxcmp_user}]
		[{assign var="force_sid" value=$oView->getSidForWidget()}]
	[{/if}]

	<footer class="grid">
		<div class="grid">
			[{block name="footer_servicelist_container"}]
				<section class="grid" id="service">
					<h6 class="title">
						[{oxmultilang ident="SERVICES"}]
					</h6>
					<div class="grid links">
						[{oxid_include_widget cl="oxwServiceList" noscript=1 nocookie=1 force_sid=$force_sid}]
					</div>
				</section>
			[{/block}]

			[{block name="footer_information_container"}]
				<section class="grid" id="information">
					<h6 class="title">
						[{oxmultilang ident="INFORMATION"}]
					</h6>
					<div class="grid links">
						[{oxid_include_widget cl="oxwInformation" noscript=1 nocookie=1 force_sid=$force_sid}]
					</div>
				</section>
			[{/block}]

			[{if $blShowFullFooter}]
				[{block name="footer_manufacturerlist_container"}]
					<section class="grid" id="manufacturers">
						<h6 class="title">
							[{oxmultilang ident="OUR_BRANDS"}]
						</h6>
						<div class="grid links">
							[{oxid_include_widget cl="oxwManufacturerList" _parent=$oView->getClassName() noscript=1 nocookie=1}]
						</div>
					</section>
				[{/block}]

				[{block name="footer_categorytree_container"}]
					<section class="grid" id="categories">
						<h6 class="title">
							[{oxmultilang ident="CATEGORIES"}]
						</h6>
						<div class="grid links">
							[{oxid_include_widget cl="oxwCategoryTree" _parent=$oView->getClassName() sWidgetType="footer" noscript=1 nocookie=1}]
						</div>
					</section>
				[{/block}]
			[{/if}]
		</div>

		[{if $oView->showNewsletter() || ($oView->isActive('FbLike') && $oViewConf->getFbAppId())}]
			<div class="grid">
				<div>
					[{if $oView->showNewsletter()}]
						[{block name="footer_newsletter_container"}]
							<section class="grid" id="newsletter">
								<h6 class="title">
									[{oxmultilang ident="NEWSLETTER"}]
								</h6>
								<div class="grid links">
										<p class="small">
											[{oxmultilang ident="FOOTER_NEWSLETTER_INFO"}]
										</p>
										[{include file="widget/footer/newsletter.tpl"}]
								</div>
							</section>
						[{/block}]
					[{/if}]

					[{if ($oView->isActive('FbLike') && $oViewConf->getFbAppId())}]
						<section id="facebook">
							[{block name="footer_fblike"}]
								[{if $oView->isActive('FbLike') && $oViewConf->getFbAppId()}]
									<div
									class="facebook"
									id="footerFbLike">
										[{include file="widget/facebook/enable.tpl" source="widget/facebook/like.tpl" ident="#footerFbLike" parent="footer"}]
									</div>
								[{/if}]
							[{/block}]
						</section>
					[{/if}]
				</div>
			</div>
		[{/if}]

		[{* <<START>> Social Links *}]
		[{block name="footer_social_links_container"}]
			[{if $oViewConf->getViewThemeParam('sFacebookUrl') || $oViewConf->getViewThemeParam('sGooglePlusUrl') || $oViewConf->getViewThemeParam('sTwitterUrl') || $oViewConf->getViewThemeParam('sYouTubeUrl') || $oViewConf->getViewThemeParam('sBlogUrl')}]
				<div id="social-links">
					[{block name="footer_social_links_inner_container"}]
						[{if $oViewConf->getViewThemeParam('sFacebookUrl')}]
							<a target="_blank" href="[{$oViewConf->getViewThemeParam('sFacebookUrl')}]">
								<i class="fa fa-facebook"></i>
								<span>Facebook</span>
							</a>
						[{/if}]

						[{if $oViewConf->getViewThemeParam('sGooglePlusUrl')}]
							<a target="_blank" href="[{$oViewConf->getViewThemeParam('sGooglePlusUrl')}]">
								<i class="fa fa-google-plus-square"></i>
								<span>Google+</span>
							</a>
						[{/if}]

						[{if $oViewConf->getViewThemeParam('sTwitterUrl')}]
							<a target="_blank" href="[{$oViewConf->getViewThemeParam('sTwitterUrl')}]">
								<i class="fa fa-twitter"></i>
								<span>Twitter</span>
							</a>
						[{/if}]

						[{if $oViewConf->getViewThemeParam('sYouTubeUrl')}]
							<a target="_blank" href="[{$oViewConf->getViewThemeParam('sYouTubeUrl')}]">
								<i class="fa fa-youtube-square"></i>
								<span>YouTube</span>
							</a>
						[{/if}]

						[{if $oViewConf->getViewThemeParam('sBlogUrl')}]
							<a target="_blank" href="[{$oViewConf->getViewThemeParam('sBlogUrl')}]">
								<i class="fa fa-wordpress"></i>
								<span>Blog</span>
							</a>
						[{/if}]
					[{/block}]
				</div>
			[{/if}]
		[{/block}]
		[{* <<ENDE>> Social Links *}]

		[{if $oView->isPriceCalculated()}]
			[{block name="layout_page_vatinclude"}]
				[{block name="footer_deliveryinfo"}]
					[{oxifcontent ident="oxdeliveryinfo" object="oCont"}]

					<div id="incVatInfo">
						[{if $oView->isVatIncluded()}]
								<span class="deliveryInfo">
									* [{oxmultilang ident="PLUS_SHIPPING"}]
									<a href="[{$oCont->getLink()}]">
										[{oxmultilang ident="PLUS_SHIPPING2"}]
									</a>
								</span>
							[{else}]
								<span class="deliveryInfo">
									*[{oxmultilang ident="PLUS"}]
									<a href="[{$oCont->getLink()}]">
										[{oxmultilang ident="PLUS_SHIPPING2"}]
									</a>
								</span>
						[{/if}]
					</div>

					[{/oxifcontent}]
				[{/block}]
			[{/block}]
		[{/if}]

		<div class="legal">
			[{block name="sidebar_trustedshopsratings"}]
				[{block name="footer_servicelist_trustedshopsratings_container"}]
					[{if $oViewConf->showTs("WIDGET") }]
						[{include file="widget/trustedshops/ratings.tpl" }]
					[{/if}]
				[{/block}]
			[{/block}]

			[{block name="footer_copyright_container"}]
				<span>
					[{oxifcontent ident="oxstdfooter" object="oCont"}]
						[{$oCont->oxcontents__oxcontent->value}]
					[{/oxifcontent}]
				</span>
			[{/block}]
		</div>
	</footer>
[{/block}]

[{if $oView->isRootCatChanged()}]
	<div
	id="scRootCatChanged"
	class="popupBox corners FXgradGreyLight glowShadow">
		[{include file="form/privatesales/basketexcl.tpl"}]
	</div>
[{/if}]