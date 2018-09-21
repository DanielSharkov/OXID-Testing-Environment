[{assign var="oBanners" value=$oView->getBanners()}]

<style>
/* Single banner */
#promo-carousel .item {
	display: flex !important;
	align-items: center;
	justify-content: center;
}

/* Banner info */
.banner-info {
	position: absolute;
	display: flex;
	flex-flow: row wrap;
	filter: drop-shadow(0 0 4px rgba(0,0,0,.5));
}
/* Banner title */
.banner-info h1 {
	color: #fff;
	flex: 1 1 100%;
}

/* Banner info alignments */
/* Left alignments */
.banner-info.left_top {
	top: 2rem;
	left: 8rem;
	justify-content: flex-start;
}
.banner-info.left_centered {
	align-self: center;
	left: 8rem;
	justify-content: flex-start;
}
.banner-info.left_bottom {
	bottom: 4rem;
	left: 8rem;
	justify-content: flex-start;
}
.banner-info.left_top > h1,
.banner-info.left_centered > h1,
.banner-info.left_bottom > h1 {
	text-align: left;
}

/* Right alignments */
.banner-info.right_top {
	top: 2rem;
	right: 8rem;
	justify-content: flex-end;
}
.banner-info.right_centered {
	align-self: center;
	right: 8rem;
	justify-content: flex-end;
}
.banner-info.right_bottom {
	bottom: 4rem;
	right: 8rem;
	justify-content: flex-end;
}
.banner-info.right_top > h1,
.banner-info.right_centered > h1,
.banner-info.right_bottom > h1 {
	text-align: right;
}

/* Middle alignments */
.banner-info.top_centered {
	top: 2rem;
	justify-self: center;
	justify-content: center;
}
.banner-info.centered {
	align-self: center;
	justify-self: center;
	justify-content: center;
}
.banner-info.bottom_centered {
	bottom: 4rem;
	justify-self: center;
	justify-content: center;
}
.banner-info.top_centered > h1,
.banner-info.centered > h1,
.banner-info.bottom_centered > h1 {
	text-align: center;
}

/* Banner button */
.banner-info .banner-button {
	padding: 1rem 4rem;
	border-radius: .5rem;
	border: solid .2rem;
	background: none;
	font-size: 1.5rem;
	outline: none;
	transition: all 200ms cubic-bezier(0.22, 0.61, 0.36, 1);
	transform: scale(1)
}
.banner-info .banner-button:hover  {
	transform: scale(1.05);
}
.banner-info .banner-button:focus {
	transform: scale(1.1);
}
#promo-carousel .item:before {
	content: '';
	position: absolute;
	height: 100%;
	width: 100%;
	background-color: rgba(0,0,0,.2);
}
</style>

[{if $oBanners|@count}]
	[{oxscript include="js/libs/jquery.flexslider.min.js" priority=2}]
	[{oxstyle include="css/libs/jquery.flexslider.min.css"}]

	<div id="promo-carousel" class="flexslider">
		<ul class="slides">
			[{block name="dd_widget_promoslider_list"}]
				[{foreach from=$oBanners key="iPicNr" item="oBanner" name="promoslider"}]
					[{assign var="oArticle" value=$oBanner->getBannerArticle()}]
					[{assign var="sBannerPictureUrl" value=$oBanner->getBannerPictureUrl()}]
					[{if $sBannerPictureUrl}]
						<li class="item">
							<div class="banner-info [{$oBanner->oxactions__ox_banner_info_align->value}]">
								<h1 style="color: [{$oBanner->oxactions__ox_button_color->value}]">
									[{$oBanner->oxactions__oxtitle->value}]
								</h1>
								<button class="banner-button" style="
									border-color: [{$oBanner->oxactions__ox_button_color->value}];
									color: [{$oBanner->oxactions__ox_button_color->value}];
								">
									[{if $oBanner->oxactions__ox_button_label->value}]
										[{$oBanner->oxactions__ox_button_label->value}]
										[{else}]
										[{oxmultilang ident="BANNER_PROPS_BUTTON"}]
									[{/if}]
								</button>
							</div>
							[{assign var="sBannerLink" value=$oBanner->getBannerLink()}]
							[{if $sBannerLink}]
								<a href="[{$sBannerLink}]" title="[{$oBanner->oxactions__oxtitle->value}]">
							[{/if}]

							<img src="[{$sBannerPictureUrl}]" alt="[{$oBanner->oxactions__oxtitle->value}]" title="[{$oBanner->oxactions__oxtitle->value}]">

							[{if $sBannerLink}]
								</a>
							[{/if}]
							[{if $oViewConf->getViewThemeParam('blSliderShowImageCaption') && $oArticle}]
								<p class="flex-caption">
									[{if $sBannerLink}]
										<a href="[{$sBannerLink}]" title="[{$oBanner->oxactions__oxtitle->value}]">
									[{/if}]
									<span class="title">[{$oArticle->oxarticles__oxtitle->value}]</span>[{if $oArticle->oxarticles__oxshortdesc->value|trim}]<br/><span class="shortdesc">[{$oArticle->oxarticles__oxshortdesc->value|trim}]</span>[{/if}]
									[{if $sBannerLink}]
										</a>
									[{/if}]
								</p>
							[{/if}]
						</li>
					[{/if}]
				[{/foreach}]
			[{/block}]
		</ul>
	</div>
[{/if}]
