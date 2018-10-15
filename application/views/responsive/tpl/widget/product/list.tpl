[{if !$type}]
    [{assign var="type" value="infogrid"}]
[{/if}]

[{if !$iProductsPerLine}]
    [{assign var="iProductsPerLine" value=4}]
[{/if}]

[{if $type == 'infogrid'}]
    [{assign var="iProductsPerLine" value=2}]
[{elseif $type == 'grid'}]
    [{assign var="iProductsPerLine" value=4}]
[{elseif $type == 'line'}]
    [{assign var="iProductsPerLine" value=1}]
[{/if}]

[{if $head}]
    [{if $header == "light"}]
        <div class="heading">
            <span class="h3">[{$head}]</span>

            [{if $subhead}]
                <small class="subhead">[{$subhead}]</small>
            [{/if}]
        </div>
    [{else}]
        <div class="heading">
            <div class="title grid">
                <h2>
                    [{$head}]
                </h2>
                [{if $rsslink}]
                    <a
                    class="rss"
                    id="[{$rssId}]"
                    href="[{$rsslink.link}]"
                    target="_blank">
                        <i class="fa fa-rss"></i>
                    </a>
                [{/if}]
            </div>

            [{if $subhead}]
                <span class="subhead">[{$subhead}]</span>
            [{/if}]
        </div>
    [{/if}]
[{/if}]

[{assign var="productsCount" value=$products|@count}]
[{if $productsCount gt 0}]
    [{math equation="x / y" x=12 y=$iProductsPerLine assign="iColIdent"}]

    <div class="grid list-container [{$type}]View newItems" id="[{$listId}]">
        [{foreach from=$products item="_product" name="productlist"}]
            [{counter print=false assign="productlistCounter"}]
            [{assign var="testid" value=$listId|cat:"_"|cat:$smarty.foreach.productlist.iteration}]

            <div class="productData productBox">
                [{oxid_include_widget cl="oxwArticleBox" _parent=$oView->getClassName() nocookie=1 _navurlparams=$oViewConf->getNavUrlParams() iLinkType=$_product->getLinkType() _object=$_product anid=$_product->getId() sWidgetType=product sListType=listitem_$type iIndex=$testid blDisableToCart=$blDisableToCart isVatIncluded=$oView->isVatIncluded() showMainLink=$showMainLink recommid=$recommid owishid=$owishid toBasketFunction=$toBasketFunction removeFunction=$removeFunction altproduct=$altproduct inlist=$_product->isInList() skipESIforUser=1 testid=$testid}]
            </div>
        [{/foreach}]

        [{* Counter resetten *}]
        [{counter print=false assign="productlistCounter" start=0}]
    </div>
[{/if}]
