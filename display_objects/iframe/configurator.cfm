<cfparam name="objectparams.iframeID" default="">
<cfset qryIFrames = $.getBean( "iframe" ).getFeed().sort( "Name", "ASC" ).getQuery() />

<cf_objectconfigurator>
    <cfoutput>
        <div class="mura-control-group">
            <label class="mura-control-label">Select an existing iframe</label>

			<select name="iframeID" id="iframeID" class="objectParam">
                <option value="">Select an IFrame</option>
				<cfloop query="qryIFrames">
					<option value="#qryIFrames.iFrameID#"<cfif qryIFrames.iFrameID eq objectparams.iframeID> selected="selected"</cfif>>#qryIFrames.name#</option>
				</cfloop>
			</select>
        </div>
        <div class="mura-control-group">
            <button type="button" class="btn" id="btn-edit-current-iframe">Edit Current iFrame</button>
        </div>
        <div class="mura-control-group">
            <button type="button" class="btn" id="btn-open-custom-modal">Add New iFrame</button>
        </div>

        <script>
            $(function()
            {
                $( '##btn-edit-current-iframe' ).click( function() 
                {
                    var _iFrameIDtoEdit = $( "##iframeID" ).val();

                    if( _iFrameIDtoEdit.length == 0 )
                    {
                        alert( "#esapiEncode( 'javascript', 'You need to select an iFrame first.' )#" );
                        return false;
                    }
                    else
                    {
                        //siteManager.openDisplayObjectModal( 'iframe/modal.cfm' );
                        siteManager.openDisplayObjectModal( 'iframe/modal.cfm', { iFrameIDToEdit : _iFrameIDtoEdit } );
                    }
                });

                $('##btn-open-custom-modal').click(function(){
                    siteManager.openDisplayObjectModal('iframe/modal.cfm');
                });
            });
        </script>

    </cfoutput>
</cf_objectconfigurator>
