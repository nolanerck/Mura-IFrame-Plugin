<cfcomponent extends="mura.cfobject">
		
	<cffunction name="default">
		<cfargument name="$" />

		<cfset var objIFrames = $.getBean( "iframe" ) />
		<cfset $.event( "qryIFrames", objIFrames.getFeed().getQuery() ) />
	</cffunction>
	
	<cffunction name="edit">
		<cfargument name="$" />
		
		<cfset var iFrameID  	   = $.event( "iFrameID" ) />
		<cfset var objFrameDetails = $.getBean( "iFrame" ).loadBy( iFrameID = iFrameID ) />

		<cfset $.event( "objFrameDetails", objFrameDetails ) />
	</cffunction>
	
	<cffunction name="actSave">
		<cfargument name="$">

		<cfset var iFrameID  	   = $.event( "iFrameID" ) />
		<cfset var objFrameDetails = $.getBean( "iFrame" ).loadBy( iFrameID = iFrameID ) />
					
		<cfif not isNull( objFrameDetails )>
			<cfset objFrameDetails.setName( $.event( 'name' ) ) />
			<cfset objFrameDetails.setURL( $.event('url') ) />
			<cfset objFrameDetails.setWidth( $.event( 'width' ) ) />
			<cfset objFrameDetails.setHeight( $.event( 'height') ) />
			<cfset objFrameDetails.setScrolling( $.event( 'scrolling' ) ) />
			
			<cfset objFrameDetails.save() />
		</cfif>
		
		<cflocation url="./" addtoken="no">
	</cffunction>
	
	<cffunction name="actDelete">
		<cfargument name="$">

		<cfset var iFrameID  	   = $.event( "iFrameID" ) />
		<cfset var objFrameDetails = $.getBean( "iFrame" ).loadBy( iFrameID = iFrameID ) />

		<cfset objFrameDetails.delete() />
		
		<cflocation url="./" addtoken="no">
	</cffunction>
	
</cfcomponent>