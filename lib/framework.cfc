<cfcomponent>
	<cfset variables.controllers = structNew()>
	
	<cffunction name="init" access="public" returntype="any" output="false">
		<cfargument name="pluginConfig" type="any" required="true">
		
		<cfset variables.pluginConfig = arguments.pluginConfig>
				
		<cfreturn this>
	</cffunction>
	
	<cffunction name="getPluginConfig" access="public" returntype="any" output="false">
		<cfreturn variables.pluginConfig>
	</cffunction>
	
	<cffunction name="doRequest">
		<cfargument name="$">
		<cfset var section = $.event('section')>
		<cfset var action = getAction($.event('action'))>
		<cfset var controller = getController($.event('section'))>
		<cfset var layout = getLayout($.event('layout'))>
		<cfset var vType = getViewType($.event('vType'))>
		
		<cfif left(action, 3) eq "act" and vType eq "default">
			<cfset vType = "none">
		</cfif>
		
		<cfset $.rc = structNew()>
		<cfset $.rc.pluginConfig = variables.pluginConfig>
		<cfset structAppend($.rc, application[variables.pluginConfig.getPackage()])>
		
		<cfif structKeyExists(controller, action)>
			<cfinvoke component="#controller#" method="#action#">
				<cfinvokeargument name="$" value="#$#">
			</cfinvoke>
		</cfif>
		
		<cfif vType neq "none">
			<cfif fileExists('#expandPath("/#variables.pluginConfig.getPackage()#")#/#section#/views/#action#.cfm')>
				<cfsavecontent variable="$.rc.bodyContent"><cfinclude template="/#variables.pluginConfig.getPackage()#/#section#/views/#action#.cfm"></cfsavecontent>
			<cfelse>
				<cfthrow type="Action Error" message="The action does not exist.">
			</cfif>
			
			<cfif fileExists('#expandPath("/#variables.pluginConfig.getPackage()#")#/#section#/layouts/#layout#.cfm')>
				<cfinclude template="/#variables.pluginConfig.getPackage()#/#section#/layouts/#layout#.cfm">
			<cfelse>
				<cfthrow type="Layout Error" message="The layout does not exist.">
			</cfif>
		</cfif>
	</cffunction>
	
	<cffunction name="getAction">
		<cfargument name="action">
		<cfset var returnVar = "">
		
		<cfif len(action)>
			<cfset returnVar = action>
		<cfelse>
			<cfset returnVar = "default">
		</cfif>
		
		<cfreturn returnVar>
	</cffunction>
	
	<cffunction name="getLayout">
		<cfargument name="layout">
		<cfset var returnVar = "">
		
		<cfif len(layout)>
			<cfset returnVar = layout>
		<cfelse>
			<cfset returnVar = "default">
		</cfif>
		
		<cfreturn returnVar>
	</cffunction>
	
	<cffunction name="getViewType">
		<cfargument name="vType">
		<cfset var returnVar = "">
		
		<cfif len(vType)>
			<cfset returnVar = vType>
		<cfelse>
			<cfset returnVar = "default">
		</cfif>
		
		<cfreturn returnVar>
	</cffunction>
	
	<cffunction name="getController">
		<cfargument name="section">
		<cfset var returnVar = "">
		<cfset var controllerPath = "">
		
		<cfif variables.pluginConfig.getSetting('plMode') eq "development">
			<cfset variables.controllers = structNew()>
		</cfif>
		
		<cfif not structKeyExists(variables.controllers, section)>
			<cfset controllerPath = "#variables.pluginConfig.getPackage()#.#section#.controller.main">
			<cfset variables.controllers[section] = createObject('component', controllerPath).init(variables.pluginConfig)>
		</cfif>
		
		<cfset returnVar = variables.controllers[section]>
		
		<cfreturn returnVar>
	</cffunction>	
	
</cfcomponent>