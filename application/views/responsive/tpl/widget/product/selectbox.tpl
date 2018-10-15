[{assign var="oSelections" value=$oSelectionList->getSelections()}]

[{if $oSelections}]
	<div class="grid selectbox dropDown">
		[{if !$blHideLabel}]
			<p class="variant-label">
				<strong>
					[{$oSelectionList->getLabel()}]
					[{oxmultilang ident="COLON"}]
				</strong>
			</p>
		[{/if}]
		<button
		type="button"
		class="btn btn-selector dropdown-toggle"
		data-toggle="dropdown">
			[{assign var="oActiveSelection" value=$oSelectionList->getActiveSelection()}]
			[{if $oActiveSelection}]
					<span>
						[{$oActiveSelection->getName()}]
					</span>
				[{elseif !$blHideDefault}]
					<span>
						[{if $sFieldName == "sel"}]
							[{oxmultilang ident="PLEASE_CHOOSE"}]
						[{else}]
							[{$oSelectionList->getLabel()}]
							[{oxmultilang ident="CHOOSE_VARIANT"}]
						[{/if}]
					</span>
			[{/if}]

			<i class="fa fa-angle-down"></i>
		</button>
		[{if $editable !== false}]
			<input
				type="hidden"
				name="[{$sFieldName|default:"varselid"}][[{$iKey}]]"
				value="[{if $oActiveSelection}][{$oActiveSelection->getValue()}][{/if}]"
			/>
			<div
			class="
				grid
				dropdown-menu
				drop-shadow-10
				dropdown-menu-right
				align-right-top
				expand-down
				full-width
				[{$sJsAction}]
				[{if $sFieldName != "sel"}]
					vardrop
				[{/if}]
			"
			role="menu">
				[{if $oActiveSelection && !$blHideDefault}]
					<li>
						<a class="option" href="#" rel="">
							[{if $sFieldName == "sel"}]
								[{oxmultilang ident="PLEASE_CHOOSE"}]
							[{else}]
								[{oxmultilang ident="CHOOSE_VARIANT"}]
							[{/if}]
						</a>
					</li>
				[{/if}]
				[{foreach from=$oSelections item=oSelection}]
					<li class="
						[{if $oSelection->isActive()}]
							active
						[{/if}]
						[{if $oSelection->isDisabled()}]
							disabled js-disabled
						[{/if}]
					">
						<a
						class="option"
						href="[{$oSelection->getLink()}]"
						data-selection-id="[{$oSelection->getValue()}]">
							[{$oSelection->getName()}]	
						</a>
					</li>
				[{/foreach}]
			</div>
		[{/if}]
	</div>
[{/if}]
