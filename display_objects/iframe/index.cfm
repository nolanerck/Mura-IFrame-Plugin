<cfparam name="objectparams.iframeID" default="" type="string">

<cfset objIFrame = $.getBean( "iFrame" ).loadBy( iFrameID = objectparams.iframeID ) />

<cfoutput><cfif Len( objectparams.iframeID )><iframe align="left" frameborder="0" height="#objIFrame.getHeight()#" scrolling="#objIFrame.getScrolling()#" src="#esapiEncode( 'html_attr', objIFrame.getURL() )#" width="#objIFrame.getWidth()#"></iframe><cfelse>Please select an IFrame</cfif></cfoutput>
