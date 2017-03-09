<cfsavecontent variable="body">
	<cfoutput>
		<style type="text/css">
		<!--

		input, select
		{
			min-width: 100%;
		}

		-->
		</style>

		<h2>iframe Admin</h2>
		#$.rc.bodyContent#
	</cfoutput>
</cfsavecontent>

<cfoutput>#application.pluginManager.renderAdminTemplate(body=body,pageTitle='Admin')#</cfoutput>
