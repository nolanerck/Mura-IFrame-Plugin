component extends="mura.cfobject" 
{
	public any function onSiteRequestStart( $ )
	{
		var apiUtility = $.siteConfig().getApi( 'json', 'v1' );

		// cheapo way to tell if we've already injected this into the API or not
		// if i used on ApplicationStart we could avoid this if/else check, but 
		// there is no guarantee I'd have "siteid" available" in muraScope. 
		// Doing it this way makes the plugin more generic and reusable.
		if( not StructKeyExists( apiUtility, "addNewIFrame" ) )
		{
			apiUtility.registerMethod( 'addNewIFrame', addNewIFrame );
		}
	}

	public string function addNewIFrame( string siteID, string nametoadd, string urltoadd, numeric heightoadd, numeric widthtoadd, string scrollingtoadd )
	{
		var $ 		  = application.serviceFactory.getBean( "muraScope" ).init( arguments.siteID );
		var objIFrame = $.getBean( "iFrame" );

		objIFrame.setName( arguments.nametoadd );
		objIFrame.setURL( arguments.urltoadd );
		objIFrame.setHeight( arguments.heightoadd );
		objIFrame.setWidth( arguments.widthtoadd );
		objIFrame.setScrolling( arguments.scrollingtoadd );
		objIFrame.save();

		return objIFrame.getErrors().toString();
	}
}