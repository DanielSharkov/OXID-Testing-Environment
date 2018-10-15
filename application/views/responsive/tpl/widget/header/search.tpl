[{block name="widget_header_search_form"}]
    [{if $oView->showSearch()}]
        <form
        class="grid form search search-col"
        role="form"
        action="[{$oViewConf->getSelfActionLink()}]"
        method="get"
        name="search">
            [{$oViewConf->getHiddenSid()}]
            <input type="hidden" name="cl" value="search">

            [{block name="dd_widget_header_search_form_inner"}]
                <div class="input-group">
                    [{block name="header_search_field"}]
                        <input
                            type="text"
                            class="default-input input-icon"
                            id="searchParam"
                            name="searchparam"
                            value="[{$oView->getSearchParamForHtml()}]"
                            placeholder="[{oxmultilang ident="SEARCH"}]"
                        />
                    [{/block}]

                    [{block name="dd_header_search_button"}]
                        <button
                        type="submit"
                        class="btn submit-search"
                        title="[{oxmultilang ident="SEARCH_SUBMIT"}]">
                            <i class="material-icons">search</i>
                        </button>
                    [{/block}]
                </div>
            [{/block}]
        </form>
    [{/if}]
[{/block}]