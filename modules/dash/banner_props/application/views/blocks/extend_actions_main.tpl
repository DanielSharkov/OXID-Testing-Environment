[{$smarty.block.parent}]
[{assign var="buttonColor" value=$edit->oxactions__ox_button_color}]
[{assign var="buttonLabel" value=$edit->oxactions__ox_button_label}]
[{assign var="bannerInfoAlign" value=$edit->oxactions__ox_banner_info_align}]

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
	filter: drop-shadow(0 0 2px rgba(0,0,0,0.2));
}
#button-preview-label {
	font-size: 1rem;
}
</style>

<script>
function changeColor(val) {
	let preview = document.getElementById('button-preview')
	preview.style.borderColor = val
	preview.style.color = val
}

function changeLabel(val) {
	let label = document.getElementById('button-preview-label')
	if (val.length > 0) {
		label.innerText = val
		return
	}
	setDefaultButtonLabel(val)
}

function setDefaultButtonLabel(val) {
	if (val.length < 1) {
		let preview = document.getElementById('button-preview-label')
		preview.innerText = '[{oxmultilang ident="BUTTON_TEXT_PREVIEW_EMPTY"}]'
	}
}

function setDefaultAlignment() {
	let alignment = '[{$bannerInfoAlign->value}]'
	if (alignment.length > 0) {
		document.getElementById(
			'align-' + alignment,
		).setAttribute(
			'selected', true,
		)
	}
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
			oninput="changeColor(this.value)"
			id="ox_button_color"
		/>
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
			oninput="changeLabel(this.value)"
			id="ox_button_label"
		/>
	</td>
</tr>
<tr>
	<td class="edittext" width="120">
		[{oxmultilang ident="OX_BANNER_INFO_ALIGN"}]
	</td>
	<td class="edittext">
		<select
		id="ox_banner_info_align"
		name="editval[oxactions__ox_banner_info_align]">
			<option value="left_top" id="align-left_top">
				[{oxmultilang ident="OX_BANNER_INFO_ALIGN_LEFT_TOP"}]
			</option>
			<option value="left_centered" id="align-left_centered">
				[{oxmultilang ident="OX_BANNER_INFO_ALIGN_LEFT_CENTERED"}]
			</option>
			<option value="left_bottom" id="align-left_bottom">
				[{oxmultilang ident="OX_BANNER_INFO_ALIGN_LEFT_BOTTOM"}]
			</option>
			<option value="right_top" id="align-right_top">
				[{oxmultilang ident="OX_BANNER_INFO_ALIGN_RIGHT_TOP"}]
			</option>
			<option value="right_centered" id="align-right_centered">
				[{oxmultilang ident="OX_BANNER_INFO_ALIGN_RIGHT_CENTERED"}]
			</option>
			<option value="right_bottom" id="align-right_bottom">
				[{oxmultilang ident="OX_BANNER_INFO_ALIGN_RIGHT_BOTTOM"}]
			</option>
			<option value="top_centered" id="align-top_centered">
				[{oxmultilang ident="OX_BANNER_INFO_ALIGN_TOP_CENTERED"}]
			</option>
			<option value="centered" id="align-centered">
				[{oxmultilang ident="OX_BANNER_INFO_ALIGN_CENTERED"}]
			</option>
			<option value="bottom_centered" id="align-bottom_centered">
				[{oxmultilang ident="OX_BANNER_INFO_ALIGN_BOTTOM_CENTERED"}]
			</option>
		</select>
	</td>
</tr>

<script>
// Set default text for button label in preview
// if the input of button input is empty
setDefaultButtonLabel(document.getElementById('ox_button_label').value)

// Sets the alignment to default value if alignment is not chosen
setDefaultAlignment()
</script>
