<cfcomponent extends="mura.plugin.pluginGenericEventHandler">
	<cffunction name="onApplicationLoad">
		<cfargument name="event">
		<cfset variables.pluginConfig.addEventHandler(this)>
		
		<cfset buildModel(variables.pluginConfig)>
	</cffunction>
	
	<cffunction name="buildModel">
		<cfargument name="pluginConfig">
		<cfset var package = variables.pluginConfig.getPackage()>
		
		<cfset application[package] = structNew()>
		<cfset application[package].framework = createObject("component", "#package#.lib.framework").init(pluginConfig)>
		
		<cfset application.serviceFactory.declareBean( beanName='iframe', 
												  	   dottedPath='#package#.model.iframe', isSingleton=false ) />

		<cfset application.serviceFactory.getBean( "iframe" ).checkSchema() />

	</cffunction>
</cfcomponent>
