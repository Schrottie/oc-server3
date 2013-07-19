{* Template für opencaching.de *}
{* OCSTYLE *}
<!DOCTYPE HTML PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<title>
			{if ($opt.template.title=="")}
				{$opt.page.subtitle1|escape} {$opt.page.subtitle2|escape}
			{else}
				{$opt.template.title|escape} - {$opt.page.subtitle1|escape} {$opt.page.subtitle2|escape}
			{/if}
		</title>
		<meta name="keywords" content="Geocaching, Geocache, Cache, Geocashing, Schnitzeljagd, Schatzsuche, GPS, Openstreetmap, kostenlos, GPX, GPX download, Koordinaten, Hobby, Natur" />
			{* siehe http://forum.opencaching-network.org/index.php?topic=3065.0 *}
		<meta name="description" content="Geocaching ist ein GPS-Schatzsuche-Spiel: Es werden kleine Behälter versteckt, die anhand der GPS-Koordinaten zu finden sind. Opencaching.de ist das freie Portal, um diese Verstecke mit anderen zu teilen." />
		<meta http-equiv="X-UA-Compatible" content="IE=EmulateIE7" />
		<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
		<meta http-equiv="Content-Style-Type" content="text/css" />
		<meta http-equiv="Content-Language" content="{$opt.template.locale}" />
		<meta http-equiv="gallerimg" content="no" />
		<meta http-equiv="cache-control" content="no-cache" />
		<link rel="SHORTCUT ICON" href="favicon.ico">
		<link rel="apple-touch-icon" href="resource2/{$opt.template.style}/images/oclogo/apple-touch-icon-iphone.png" />
		<link rel="apple-touch-icon" sizes="72x72" href="resource2/{$opt.template.style}/images/oclogo/apple-touch-icon-ipad.png" />
		<link rel="apple-touch-icon" sizes="114x114" href="resource2/{$opt.template.style}/images/oclogo/apple-touch-icon-iphone-retina.png" />
		<link rel="apple-touch-icon" sizes="144x144" href="resource2/{$opt.template.style}/images/oclogo/apple-touch-icon-ipad-retina.png" />
		<link rel="stylesheet" type="text/css" media="screen,projection" href="resource2/{$opt.template.style}/css/style_screen.css?ft={$screen_css_time}">
		<link rel="stylesheet" type="text/css" media="print" href="resource2/{$opt.template.style}/css/style_print.css?ft={$print_css_time}">
		{literal}
			<script type="text/javascript">
			<!--
				var nWindowWidth = 9999;
				if (window.innerWidth)
					nWindowWidth = window.innerWidth;
				else if (screen.availWidth)
					nWindowWidth = screen.availWidth;
				if (nWindowWidth > 970)
					document.writeln('<link rel="stylesheet" type="text/css" media="screen,projection" href="{/literal}{season winter='resource2/ocstyle/css/seasons/style_winter.css' spring='resource2/ocstyle/css/seasons/style_spring.css' summer='resource2/ocstyle/css/seasons/style_summer.css' autumn='resource2/ocstyle/css/seasons/style_autumn.css'}{literal}">');
				document.writeln('<link rel="stylesheet" type="text/css" media="screen,projection" href="{/literal}{season winter='resource2/ocstyle/css/seasons/style_langstripe_winter.css' spring='resource2/ocstyle/css/seasons/style_langstripe_spring.css' summer='resource2/ocstyle/css/seasons/style_langstripe_summer.css' autumn='resource2/ocstyle/css/seasons/style_langstripe_autumn.css'}{literal}">');

				function usercountry_change()
				{
					var sCurrentOption = "{/literal}{$opt.template.country|escapejs}{literal}";
					var oUserCountryCombo = document.getElementById('usercountry');

					if (sCurrentOption!=oUserCountryCombo.value)
					{
						window.location = 'index.php?usercountry=' + oUserCountryCombo.value;
					}
				}

				function submitbutton(bname)
				{
					document.getElementsByName(bname)[0].className = "formbutton_active";
				}

				function resetbutton(bname)
				{
					document.getElementsByName(bname)[0].className = "formbutton"
				}

				function flashbutton(bname)
				{
					document.getElementsByName(bname)[0].className = "formbutton_active";
					window.setTimeout('resetbutton(\'' + bname + '\')', 350);
				}
			//-->
			</script>
		{/literal}
		<script type="text/javascript" src="resource2/{$opt.template.style}/js/enlargeit/enlargeit.js"></script>
		{if $opt.session.url==true}
			<script type="text/javascript">
				{literal}
				<!--
					var sSessionId = '{/literal}{$opt.session.id|escape:'js'}{literal}';
				//-->
				{/literal}
			</script>
			<script src="resource2/{$opt.template.style}/js/session.js" type="text/javascript"></script>
		{/if}
		{if $garmin==true}
		  <script type="text/javascript" src="resource2/{$opt.template.style}/js/GarminPrototype.js"></script>
		  <script type="text/javascript" src="http://developer.garmin.com/web/communicator-api/garmin/device/GarminDeviceDisplay.js"> </script>
		  <script type="text/javascript">var garmin_gpx_filename = '{$cache.wpoc}.gpx';</script>
		  <script type="text/javascript" src="resource2/{$opt.template.style}/js/GarminDisplay.js"></script>
		  {* <!-- <script type="text/javascript" src="resource2/{$opt.template.style}/js/search.js"></script> --> *}
		{/if}
		{foreach from=$opt.page.header_javascript item=scriptItem}
			<script type="text/javascript" src="{$scriptItem}"></script>
		{/foreach}
	</head>

{* JS onload() onunload() *}
<body{if $opt.session.url==true} onload="initSessionTimeout()"{/if}
{if $garmin==true} onload="load('{$cache.latitude}','{$cache.longitude}','{$cache.cacheid}','{$opt.lib.garmin.url}','{$opt.lib.garmin.key}','{$opt.template.locale}')"{/if}
{foreach from=$opt.page.body_load item=loadItem name=bodyload}{if $smarty.foreach.bodyload.first} onload="{/if}{$loadItem};{if $smarty.foreach.bodyload.last}"{/if}{/foreach}
{foreach from=$opt.page.body_unload item=unloadItem name=bodyunload}{if $smarty.foreach.bodyunload.first} onunload="{/if}{$unloadItem};{if $smarty.foreach.bodyunload.last}"{/if}{/foreach}
{if $opt.template.popup!=false} class="popup"{/if} {if $greybg}style="background:#ededed"{/if}>
	{if $opt.template.popup!=true}
		<div id="overall">
			<div id="langstripe">

				{* <!-- Navigation Level 1 --> *}
				<table class="nav1" cellspacing=0>
					<tr>
						{if $opt.session.url==true}
							<div id="sessionWarn">
								{* message is not properly formated and displays always 0 
							   don't enable this feature until this is fixed and tested *}												
								Automatische Abmeldung in <div id="sessionTimout">0</div>&nbsp;Minuten - <a href="#" onclick="cancelSessionTimeout()">Abbrechen</a>
							</div>
						{/if}
						<td width="100%">
							{nocache}
								&nbsp;
								{if $login.userid==0}
									<b><form action="login.php" method="post" enctype="application/x-www-form-urlencoded" name="login" dir="ltr" style="display: inline;">{t}User{/t}:&nbsp;&nbsp;<input name="email" size="10" type="text" class="textboxes" value="" />&nbsp;&nbsp;&nbsp;{t}Password{/t}:&nbsp;&nbsp;<input name="password" size="10" type="password" class="textboxes" value="" />&nbsp;<input type="hidden" name="action" value="login" /><input type="hidden" name="target" value="{$opt.page.target|escape}" /><input type="hidden" name="source" value="titlebar" />&nbsp;<input name="LogMeIn" value="{t}Login{/t}" class="formbuttons" style="width: 65px;" type="submit"></form></b>	
								{else}  {* Ocprop: <a href="myhome.php">(.*?)<\/a>.*?<a href="login.php
								                   <a href="myhome.php">.*?<a href="login.php\?action=logout"> *}
									<b>{t}Logged in as{/t} <a href="myhome.php">{$login.username|escape}</a></b> - <a href="login.php?action=logout">{t}Logout{/t}</a>
								{/if}
							{/nocache}
						</td>
						<td><strong>{t}Language:{/t}&nbsp;</strong></td>
						<td>
							{foreach from=$opt.template.locales key=localeKey item=localeItem}
								{if $localeItem.show}
								<a style="text-decoration: none;" href="index.php?locale={$localeKey}"><img src="{$localeItem.flag}" alt="{$localeItem.name|escape}" width="24px" height="18px" /></a>
							{/if}
							{/foreach}
						</td>
						<td>&nbsp;&nbsp;&nbsp;&nbsp;<strong>{t}Country:{/t}&nbsp;</strong></td>
						<td>
							<select id="usercountry" onclick="usercountry_change()">
								{foreach from=$opt.template.usercountrieslist item=countryItem name=userCountryList}
									{if $countryItem.begin_group==1 || $smarty.foreach.userCountryList.first}
										<option disabled="disabled">
											{if $countryItem.group==1}
												- {t}This OC node{/t} -
											{elseif $countryItem.group==2}
												- {t}Other OC nodes{/t} -
											{elseif $countryItem.group==3}
												- {t}Others{/t} -
											{else}
												-
											{/if}
										</option>
									{/if}
									<option value="{$countryItem.country|escape}"{if $opt.template.country==$countryItem.country} selected="selected"{/if}>{$countryItem.name|escape}</option>
								{/foreach}
							</select>&nbsp;
						</td>
					</tr>
				</table>
			</div>
			<div class="page-container-1" style="position: relative;">

			{if $greybg}
				<div style="color:grey; position:absolute; top:15px; right:-100px">HWR-Info-Grey<br />Edition</div>
			{else}
				<div id="bg1">&nbsp;</div>
				<div id="bg2">&nbsp;</div>
			{/if}

			{* <!-- HEADER --> *}
			{* <!-- Debugschalter hier wieder einsetzen --> *}
			{if ($opt.debug & DEBUG_DEVELOPER) == DEBUG_DEVELOPER}
				<div id="debugoc"><font size="5" face="arial" color="red"><center>{t}Developer system - only testing{/t}</center></font></div>
			{elseif ($opt.debug & DEBUG_TESTING) == DEBUG_TESTING}
				<div id="debugoc"><font size="5" face="arial" color="red"><center>{t}Testing - do not login, please{/t}</center></font></div>
			{/if}


			{* <!-- Header banner --> *}						    		 						
			<div class="header">
				<div class="headerimage">
					<img src="resource2/{$opt.template.style}/images/head/rotator.php?path={$opt.page.headimagepath}" class="headerimagecontent" />
				</div>
				<div class="headerlogo">
					<img src="resource2/{$opt.template.style}/images/oclogo/oc_head_alpha3.png" class="headerimagecontent" />
				</div>
			</div>

			{* <!-- Navigation Level 2 --> *}
			<div class="nav2">
				<ul>
					{nocache}
						{include file="sys_topmenu.tpl" items="$topmenu"}
					{/nocache}
				</ul>
			</div>

			{* <!-- Buffer after header --> *}
			<div class="buffer" style="height: 30px;"></div>

			{* <!-- Suchbox --> *}
			{if !$opt.page.nowpsearch}
				<div id="breadcrumb">{include file="sys_breadcrumb.tpl" items="$breadcrumb"}</div>
				<div id="suchbox"><form action="searchplugin.php" method="post" style="display:inline;"><b>{t}Waypoint-Search{/t}:</b><input type="hidden" name="sourceid" value="waypoint-search" /> <input type="text" name="userinput" size="10" /> <input type="submit" value="{t}Go{/t}" /></form></div>
			{else}
				<div id="breadcrumb_fullsize">{include file="sys_breadcrumb.tpl" items="$breadcrumb"}</div>
			{/if}

			{if $helplink != ""}
				<div class="tplhelp">{$helplink}<img src="resource2/ocstyle/images/misc/32x32-help.png" /></a></div>
			{/if}

			{* <!-- NAVIGATION --> *}				
			{* <!-- Navigation Level 3 --> *}
			<div class="nav3">
				<ul>
					<li class="title">
						{if $submenu.0.parent==1}{* start page hack *}{t}News{/t}{else}{t}Main menu{/t}{/if}
					</li>
					{nocache}
						{include file="sys_submenu.tpl" items="$submenu"}
					{/nocache}
				</ul>

				<p class="sidebar-maintitle">{t}Country sites{/t}</p>
				<div style="text-align: center;" class="nodeflags">
					<a href="http://www.opencaching.cz" target="_blank"><img src="resource2/{$opt.template.style}/images/nodes/oc-cz.png" width="100" height="22" /></a><br />
					<a href="http://www.opencaching.de" target="_blank"><img src="resource2/{$opt.template.style}/images/nodes/oc-de.png" width="100" height="22" /></a><br />
					<a href="http://www.opencachingspain.es" target="_blank"><img src="resource2/{$opt.template.style}/images/nodes/oc-es.png" width="100" height="22" /></a><br />
					<a href="http://www.opencaching.it" target="_blank"><img src="resource2/{$opt.template.style}/images/nodes/oc-it.png" width="100" height="22" /></a><br />
					<a href="http://www.opencaching.no" target="_blank"><img src="resource2/{$opt.template.style}/images/nodes/oc-no.png" width="100" height="22" /></a><br />
					<a href="http://www.opencaching.nl" target="_blank"><img src="resource2/{$opt.template.style}/images/nodes/oc-nl.png" width="100" height="22" /></a><br />
					<a href="http://www.opencaching.pl" target="_blank"><img src="resource2/{$opt.template.style}/images/nodes/oc-pl.png" width="100" height="22" /></a><br />
					<a href="http://www.opencaching.se" target="_blank"><img src="resource2/{$opt.template.style}/images/nodes/oc-se.png" width="100" height="22" /></a><br />
					<a href="http://www.opencaching.org.uk" target="_blank"><img src="resource2/{$opt.template.style}/images/nodes/oc-org-uk.png" width="100" height="22" /></a><br />
					<a href="http://www.opencaching.us" target="_blank"><img src="resource2/{$opt.template.style}/images/nodes/oc-us.png" width="100" height="22" /></a>
				</div>

				{* <!-- Paypalbutton --> *}
				{if $opt.page.showdonations}
					<p class="sidebar-maintitle">{t}Donations{/t}</p>
					<div style="margin-top:20px;width:100%;text-align:center;">
						<a href="http://www.opencaching.de/articles.php?page=donations">
							<img src="resource2/{$opt.template.style}/images/misc/donate.gif" alt="{t}Donations{/t}" style="border:0px;" />
						</a><br />
						&nbsp;
					</div>
				{/if}

				{if $license_disclaimer != ""}
					<!-- Datalicense -->
					<p class="sidebar-maintitle">{t}Datalicense{/t}</p>
					<div style="margin-top:20px;width:100%;text-align:center;">
						{$license_disclaimer}
						<br />
						&nbsp;
					</div>
				{/if}

				<div class="sidebar-txtbox-noshade">
					<p class="content-txtbox-noshade-size5">
						<small>
							{nocache}
								{t}Page timing{/t}: {$sys_runtime|sprintf:"%1.3f"} {t}sec{/t}<br />
								{if ($opt.template.caching == true)}
									{t}Page cached{/t}: {if $sys_cached==true}{t}Yes{/t}{else}{t}No{/t}{/if}<br />
								{/if}
								{t}DB connected{/t}: 
								{if $sys_dbconnected==true}{t}Yes{/t}{else}{t}No{/t}{/if}
								{if $sys_dbslave==true}, {t}Slave{/t}{/if}
								<br />
							{/nocache}
							{t}Created at{/t}: {"0"|date_format:$opt.format.datetime}
						</small>
					</p>			
				</div>

			</div>

			{* <!-- CONTENT --> *}
			<div class="content2">
{/if}{* Popup *}

				<div id="ocmain">
					{if $opt.template.popup!=false && $opt.template.popupmargin!=false}
						<div style="padding-left: 25px; padding-top: 10px; padding-right: 10px; padding-bottom: 20px; margin: 0; background: white;">
							{include file="$template.tpl"}
						</div>
					{else}
						{include file="$template.tpl"}
					{/if}
				</div>

{if $opt.template.popup!=true}
			</div>

			{* <!-- End Text Container --> *}

			{* <!-- FOOTER --> *}
			<div class="footer">
				<p><a href="articles.php?page=dsb">{t}Privacy statement{/t}</a> | <a href="articles.php?page=impressum">{t}Terms of use and legal information{/t}</a> | <a href="articles.php?page=contact">{t}Contact{/t}</a> | <a href="articles.php?page=changelog">{t}Changelog{/t}</a> | <a href="sitemap.php">{t}Sitemap{/t}</a></p>
				<p><strong>{$opt.page.sponsor.bottom}</strong></p>
			</div>
		</div>

{/if}{*popup*}

	</body>
</html>
