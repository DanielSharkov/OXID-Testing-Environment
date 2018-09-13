[{*$smarty.block.parent*}]
[{assign var="buttonColor" value=$edit->oxactions__ox_button_color}]
[{assign var="buttonLabel" value=$edit->oxactions__ox_button_label}]
<style>
#button-preview {
	display: flex;
	height: 1rem;
	max-width: 300px;
	margin: .5rem;
	padding: .5rem;
	justify-content: center;
	align-items: center;
	border: solid .1rem;
	border-color: [{$buttonColor->value}];
	color: [{$buttonColor}];
	border-radius: .2rem;
}
#button-preview-label {
	font-size: 1rem;
}
</style>

<script>
function changeColor(el) {
	let preview = document.getElementById('button-preview')
	preview.style.borderColor = el.value
	preview.style.color = el.value
}
function changeLabel(el) {
	let label = document.getElementById('button-preview-label')
	label.innerText = el.value
}
</script>

<div id="button-preview">
	<b id="button-preview-label">[{$buttonLabel->value}]</b>
</div>
<tr>
	<td class="edittext" width="120">
		[{oxmultilang ident="OX_BUTTON_COLOR"}]
	</td>
	<td class="edittext">
		<input
			type="text"
			class="editinput"
			size="32"
			maxlength="[{$buttonColor->fldmax_length}]"
			name="editval[oxactions__ox_button_color]"
			value="[{$buttonColor->value}]"
			[{$readonly}]
			oninput="changeColor(this)"
		/>
		[{*oxinputhelp ident="HELP_GENERAL_NAME"*}]
	</td>
</tr>
<tr>
	<td class="edittext" width="120">
		[{oxmultilang ident="OX_BUTTON_LABEL"}]
	</td>
	<td class="edittext">
		<input
			type="text"
			class="editinput"
			size="32"
			maxlength="[{$buttonLabel->fldmax_length}]"
			name="editval[oxactions__ox_button_label]"
			value="[{$buttonLabel->value}]"
			[{$readonly}]
			oninput="changeLabel(this)"
		/>
		[{*oxinputhelp ident="HELP_GENERAL_NAME"*}]
	</td>
</tr>

<tr>
	<td class="edittext" width="120">
		[{oxmultilang ident="GENERAL_NAME"}]
	</td>
	<td class="edittext">
		<input
			type="text"
			class="editinput"
			size="32"
			maxlength="[{$edit->oxactions__oxtitle->fldmax_length}]"
			name="editval[oxactions__oxtitle]"
			value="[{$edit->oxactions__oxtitle->value}]"
			[{$readonly}]
			[{$disableSharedEdit}]
		/>
		[{oxinputhelp ident="HELP_GENERAL_NAME"}]
	</td>
</tr>
<tr>
	<td class="edittext" width="120">
		[{if $edit->oxactions__oxtype->value != 2}]
			[{oxmultilang ident="GENERAL_ALWAYS_ACTIVE"}]
		[{else}]
			[{oxmultilang ident="GENERAL_ACTIVE"}]
		[{/if}]
	</td>
	<td class="edittext">
		<input
			class="edittext"
			type="checkbox"
			name="editval[oxactions__oxactive]"
			value='1'
			[{if $edit->oxactions__oxactive->value == 1}]checked[{/if}]
			[{$readonly}]
		/>
		[{oxinputhelp ident="HELP_GENERAL_ACTIVE"}]
	</td>
</tr>
<tr>
	<td class="edittext">
		[{if $edit->oxactions__oxtype->value != 2}]
			[{oxmultilang ident="GENERAL_ACTIVFROMTILL"}]
		[{/if}]&nbsp;
	</td>
	<td class="edittext" align="right">
		[{oxmultilang ident="GENERAL_FROM"}]
		<input
			type="text"
			class="editinput"
			size="27"
			name="editval[oxactions__oxactivefrom]"
			value="[{$edit->oxactions__oxactivefrom|oxformdate}]"
			[{include file="help.tpl" helpid=article_vonbis}]
			[{$readonly}]
		/>
		<br>
		[{oxmultilang ident="GENERAL_TILL"}]
		<input
			type="text"
			class="editinput"
			size="27"
			name="editval[oxactions__oxactiveto]"
			value="[{$edit->oxactions__oxactiveto|oxformdate}]"
			[{include file="help.tpl" helpid=article_vonbis}]
			[{$readonly}]
		/>
		[{if $edit->oxactions__oxtype->value != 2}]
			[{oxinputhelp ident="HELP_GENERAL_ACTIVFROMTILL"}]
		[{/if}]
	</td>
</tr>

[{if $oxid == "-1"}]
	<tr>
		<td class="edittext">
			[{oxmultilang ident="GENERAL_TYPE"}]&nbsp;
		</td>
		<td class="edittext">
		<select class="editinput" name="editval[oxactions__oxtype]">
			<option value="1">
				[{oxmultilang ident="PROMOTIONS_MAIN_TYPE_ACTION"}]
			</option>
			<option value="2">
				[{oxmultilang ident="PROMOTIONS_MAIN_TYPE_PROMO"}]
			</option>
			<option value="3">
				[{oxmultilang ident="PROMOTIONS_MAIN_TYPE_BANNER"}]
			</option>
		</select>
		</td>
	</tr>
[{/if}]
