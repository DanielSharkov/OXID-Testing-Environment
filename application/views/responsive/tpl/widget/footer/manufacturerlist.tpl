[{assign var="iManufacturerLimit" value="20"}]
[{assign var="manufacturers" value=$oView->getManufacturerlist()}]

[{if $manufacturers|count}]
    [{block name="footer_manufacturers"}]
        [{assign var="rootManufacturer" value=$oView->getRootManufacturer()}]

        <a href="[{$rootManufacturer->getLink()}]">
            [{oxmultilang ident="ALL_BRANDS"}]
        </a>

        [{foreach from=$manufacturers item=_mnf name=manufacturers}]
            [{if $smarty.foreach.manufacturers.index < $iManufacturerLimit}]
                    <a href="[{$_mnf->getLink()}]" [{if $_mnf->expanded}]class="exp"[{/if}]>
                        [{$_mnf->oxmanufacturers__oxtitle->value}]
                    </a>
                [{elseif $smarty.foreach.manufacturers.index == $iManufacturerLimit}]
                    <a href="[{$rootManufacturer->getLink()}]">
                        [{oxmultilang ident="MORE"}]
                    </a>
            [{/if}]
        [{/foreach}]
    [{/block}]
[{/if}]
