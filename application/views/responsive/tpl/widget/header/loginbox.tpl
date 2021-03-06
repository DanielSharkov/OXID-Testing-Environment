[{assign var="bIsError" value=0}]

[{capture name="loginErrors"}]
	[{foreach from=$Errors.loginBoxErrors item=oEr key=key}]
		<p id="errorBadLogin" class="alert alert-danger">
			[{$oEr->getOxMessage()}]
		</p>
		[{assign var="bIsError" value=1}]
	[{/foreach}]
[{/capture}]

[{if !$oxcmp_user->oxuser__oxpassword->value}]
	<form class="grid login-form" id="login" name="login" action="[{$oViewConf->getSslSelfLink()}]" method="post">
		[{$oViewConf->getHiddenSid()}]
		[{$oViewConf->getNavFormParams()}]

		<input
			type="hidden"
			name="fnc"
			value="login_noredirect"
		/>
		<input
			type="hidden"
			name="cl"
			value="[{$oViewConf->getTopActiveClassName()}]"
		/>

		[{if $oViewConf->getTopActiveClassName() == "content"}]
			<input
				type="hidden"
				name="oxcid"
				value="[{$oViewConf->getContentId()}]"
			/>
		[{/if}]

		<input
			type="hidden"
			name="pgNr"
			value="[{$oView->getActPage()}]"
		/>
		<input
			type="hidden"
			name="CustomError"
			value="loginBoxErrors"
		/>
	
		[{if $oViewConf->getActArticleId()}]
			<input
				type="hidden"
				name="anid"
				value="[{$oViewConf->getActArticleId()}]"
			/>
		[{/if}]

		<input
			id="loginEmail"
			type="email"
			name="lgn_usr"
			value=""
			class="default-input"
			placeholder="[{oxmultilang ident="EMAIL_ADDRESS"}]"
		/>

		<input
			id="loginPasword"
			type="password"
			name="lgn_pwd"
			class="default-input"
			value=""
			placeholder="[{oxmultilang ident="PASSWORD"}]"
		/>
		<!--<div class="input-group">
			<span class="input-group-btn">
				<a
				class="forgotPasswordOpener btn btn-default"
				href="[{oxgetseourl ident=$oViewConf->getSslSelfLink()|cat:"cl=forgotpwd"}]"
				title="[{oxmultilang ident="FORGOT_PASSWORD"}]">
					?
				</a>
			</span>
		</div>-->

		[{if $oViewConf->isFunctionalityEnabled( "blShowRememberMe" )}]
			<div class="grid" id="remember-checkbox">
				<input type="checkbox" class="checkbox" value="1" name="lgn_cook" id="remember">
				<label for="remember">
					[{oxmultilang ident="REMEMBER_ME"}]
				</label>
			</div>
		[{/if}]

		<button type="submit" id="submit-login" class="btn">
			[{oxmultilang ident="LOGIN"}]
		</button>

		[{if !$oxcmp_user}]
			<a
			class="btn"
			id="registerLink"
			role="button"
			href="[{oxgetseourl ident=$oViewConf->getSslSelfLink()|cat:"cl=register"}]"
			title="[{oxmultilang ident="REGISTER"}]">
				[{oxmultilang ident="REGISTER"}]
			</a>
		[{/if}]

		[{if $oViewConf->getShowFbConnect()}]
			<div class="altLoginBox corners clear">
				<span>[{oxmultilang ident="LOGIN_WITH"}]</span>
				<div id="loginboxFbConnect">
					[{include file="widget/facebook/enable.tpl" source="widget/facebook/connect.tpl" ident="#loginboxFbConnect"}]
				</div>
			</div>
		[{/if}]
	</form>
[{/if}]
