<cfinclude template="../plugin/config.cfm">
<cfset myRequest = structNew()>
<cfset structAppend(myRequest, url)>
<cfset structAppend(myRequest, form)>
<cfset myRequest.siteID = session.siteID>
<cfset $ = application.serviceFactory.getBean("MuraScope").init(myRequest)>
<cfset section = "default">
<cfset action = "default">
<cfif listLen($.event('action'), '.') eq 2>
	<cfset section = listFirst($.event('action'), '.')>
	<cfset action = listLast($.event('action'), '.')>
</cfif>
<cfset application[request.pluginConfig.getPackage()].framework.doRequest($, 'admin:' & section, action)>
