<cfif structKeyExists( url, "iFrameIDToEdit" )>
	<cfset objIFrame = $.getBean( "iframe" ).loadBy( iframeid = url.iFrameIDToEdit ) />
<cfelse>
	<cfset objIFrame = $.getBean( "iframe" ) />
</cfif>

<cfoutput>
	<style>
		.mura-control-group input[type='url']
		{
			width: 75%;
		}

		.mura-control-group input[type='number']
		{
			width: 25%;
		}
	</style>

	<div class="mura-header">
		<h1>Add New iFrame</h1>
	</div>

	<div class="block block-constrain">

		<input type="hidden" name="iframeidtoadd" id="iframeidtoadd" value="#objIFrame.getIFrameID()#" />

		<div class="block block-bordered">
			<div class="block-content">
			    <div class="mura-control-group">
					<label class="mura-control-label" for="linknametoadd">Link Name</label>
		        	<!--- This a object param that's value will be set dynamically --->
	                <input type="text" name="linknametoadd" id="linknametoadd" class="objectParam" value="#objIFrame.getName()#" />
				</div>

				<div class="mura-control-group">
					<label class="mura-control-label" for="urltoadd">URL</label>
					<!--- This a object param that's value will be set dynamically --->
					<input type="url" name="urltoadd" id="urltoadd" class="objectParam" value="#objIFrame.getURL()#" />
				</div>

			    <div class="mura-control-group">
					<label class="mura-control-label" for="heightoadd">Height</label>
		        	<!--- This a object param that's value will be set dynamically --->
	                <input type="number" min="0" name="heightoadd" id="heightoadd" class="objectParam" value="#objIFrame.getHeight()#" />
				</div>
<!---
			    <div class="mura-control-group">
					<label class="mura-control-label" for="widthtoadd">Width</label>
	                <input type="number" min="0" name="widthtoadd" id="widthtoadd" class="objectParam" value="#objIFrame.getWidth()#" />
				</div>

				<div class="mura-control-group">
					<label class="mura-control-label" for="scrolling">Scrolling</label>
					<select name="scrollingtoadd" id="scrollingtoadd">
						<option value="auto" <cfif objIFrame.getScrolling() eq "auto">selected="selected"</cfif>>Auto</option>
						<option value="yes" <cfif objIFrame.getScrolling() eq "yes">selected="selected"</cfif>>Yes</option>
						<option value="no" <cfif objIFrame.getScrolling() eq "no">selected="selected"</cfif>>No</option>
					</select>
				</div>
--->
				<div class="mura-actions">
					<div class="form-actions">
						<input type="hidden" name="modalaction" id="modalaction" value="" />
						<button class="btn mura-primary" class="objectParam" id="btnAddNewiFrame" name="btnAddNewiFrame"><i class="mi-check-circle"></i>Save</button>
					</div>
				</div>
			</div>
		</div>
	</div>

	<script>
		$(function()
		{
			$( "##btnAddNewiFrame" ).on( "click", function( evt )
			{
				var data = { };

  				data.method 	   = 'addNewIFrame';
  				data.siteid 	   = '#$.event( 'siteID' )#';
  				data.iframeidtoadd = $( "##iframeidtoadd" ).val();
  				data.nametoadd     = $( "##linknametoadd" ).val();
  				data.urltoadd 	   = $( "##urltoadd" ).val();
  				data.heightoadd    = $( "##heightoadd" ).val();
  				<!--- data.widthtoadd    = $( "##widthtoadd" ).val();
  				data.scrollingtoadd = $( "##scrollingtoadd" ).val(); --->

			    Mura.post( Mura.apiEndpoint, data ).then( function()
			    {
			    	siteManager.updateDisplayObjectParams();
			    });
			});
		});
	</script>

<!---	<script>
		$(function(){
			//This set the front end modal window width
			// The default is 'standard'
			//siteManager.setDisplayObjectModalWidth(800);

			//This requests the current display object param values
			siteManager.requestDisplayObjectParams(function(params){
				//This is optional, it fire after Mura has already matched all params key to form elements with objectParam class by name
			});

			$("##updateBtn").click(function(){
				// This collects the values of all form elements with a class of objectParam and assigns them 
				// to the display object and then closes the dialog and re-init the sidebar configurator.cfm
			    siteManager.updateDisplayObjectParams();

		        //Optionally you can explicitly set the params to be set in the display object
				// siteManager.updateDisplayObjectParams({var1:'test1'});
			});
		});
	</script>
--->
</cfoutput>
