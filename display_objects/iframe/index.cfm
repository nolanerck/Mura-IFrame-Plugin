<!--- If we got passed the "btnAddNewiFrame" button, that means someone configured the Display Object
      and clicked the "oops I need to add antoher iFrame" button.  So we'll call the Service
      and add the iFrame, then clear out that btnAddNewiFrame flag (and the other fields too, just
      to be safe).  (It'd be cool if Mura.js will just let me call a Service/Model from the client
      side, but so far it doesn't appear to do that.) --->

<cfsilent>
	<cfparam name="objectparams.iframeID" default="" type="string">
	<cfparam name="url.src" default="">
	<cfparam name="url.onetimepwd" default="">

	<cfset objIFrame = $.getBean( "iFrame" ).loadBy( iFrameID = objectparams.iframeID ) />

	<!--- swap out the placeholder "$customerCD" with the actual value from this user's extended attributes. --->
	<cfset variables.src = replaceNoCase( objIFrame.getURL(), '$customerCD$', $.currentUser().getValue( 'customerCD' ) )>

	<cfif len( trim( url.src ) )>
		<cfset variables.src = replaceNoCase( objIFrame.getURL(), '$src$', url.src ) />
	<cfelse>
		<cfif len( cgi.query_string )>
			<cfif variables.src contains "?">
				<cfset variables.src = "#variables.src#&#cgi.query_string#">
			<cfelse>
				<cfset variables.src = "#variables.src#?#cgi.query_string#">
			</cfif>
		</cfif>
	</cfif>

	<cfif len(trim(url.onetimepwd))>
		<cfset variables.src = replaceNoCase( objIFrame.getURL(), '$onetimepwd$', url.onetimepwd )>
	</cfif>
</cfsilent>

<cfoutput><cfif Len( objectparams.iframeID )><iframe align="left" frameborder="0" <cfif Len( objIFrame.getHeight() ) gt 0>height="#objIFrame.getHeight()#"</cfif> <cfif Len( objIFrame.getScrolling() ) gt 0>scrolling="#objIFrame.getScrolling()#"</cfif> src="#esapiEncode( 'html_attr', src )#" <cfif Len( objIFrame.getWidth() ) gt 0>width="#objIFrame.getWidth()#"</cfif>></iframe><cfelse>Please select an IFrame</cfif></cfoutput>
