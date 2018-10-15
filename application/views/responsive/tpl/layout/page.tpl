[{capture append="oxidBlock_pageBody"}]
	[{if $oView->showRDFa()}]
		[{include file="rdfa/rdfa.tpl"}]
	[{/if}]

	[{block name="layout_header"}]
		[{include file="layout/header.tpl"}]
	[{/block}]

	[{block name="article_styles"}]
		[{oxstyle include="css/article.css"}]
	[{/block}]

	<article class="grid">
		[{if $oView->getClassName()=='start' && $oView->getBanners()|@count > 0}]
			[{include file="widget/promoslider.tpl"}]
		[{/if}]

		[{if $oView->getClassName() != "start" && !$blHideBreadcrumb}]
			[{block name="layout_breadcrumb"}]
				[{include file="widget/breadcrumb.tpl"}]
			[{/block}]
		[{/if}]

		[{$smarty.capture.loginErrors}]

		[{if $sidebar && $sidebar != "Right"}]
			<div class="col-xs-12 col-md-3 [{$oView->getClassName()}]">
				<div id="sidebar">
					[{include file="layout/sidebar.tpl"}]
				</div>
			</div>
		[{/if}]

		[{block name="content_main"}]
			[{include file="message/errors.tpl"}]

			[{foreach from=$oxidBlock_content item="_block"}]
				[{$_block}]
			[{/foreach}]
		[{/block}]

		[{if $sidebar && $sidebar == "Right"}]
			<div class="col-xs-12 col-md-3 [{$oView->getClassName()}]">
				<div id="sidebar">
					[{include file="layout/sidebar.tpl"}]
				</div>
			</div>
		[{/if}]
	</article>

	[{include file="layout/footer.tpl"}]

	[{include file="widget/facebook/init.tpl"}]

	<i class="fa fa-chevron-circle-up icon-4x" id="jumptotop"></i>
[{/capture}]
[{include file="layout/base.tpl"}]