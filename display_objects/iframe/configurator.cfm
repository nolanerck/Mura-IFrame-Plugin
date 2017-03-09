<cfparam name="objectparams.iframeID" default="">

<cfset qryIFrames = $.getBean( "iframe" ).getFeed().getQuery() />

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
            <button type="button" class="btn" id="open-custom-modal">Add New iFrame</button>
        </div>

        <script>
            $(function(){
                $('##open-custom-modal').click(function(){
                    siteManager.openDisplayObjectModal('iframe/modal.cfm');
                });
            });
        </script>

    </cfoutput>
</cf_objectconfigurator>
