<cfinclude template="../plugin/config.cfm">

<cfset myRequest = structNew()>
<cfset structAppend(myRequest, url)>
<cfset structAppend(myRequest, form)>
<cfset myRequest.siteID = session.siteID>

<cfset $ = application.serviceFactory.getBean("MuraScope").init(myRequest)>
<cfset $.event('section', 'admin')>

<cfset application[#request.pluginConfig.getPackage()#].framework.doRequest($)>