<cfset objFrameDetails = $.event( 'objFrameDetails' ) />

<div class="mura-header">
	<cfif not len( $.event( 'iframeID' ) )>
		<cfset objFrameDetails.setHeight( $.rc.pluginConfig.getSetting( 'iframeHeight' ) ) />
		<cfset objFrameDetails.setWidth( $.rc.pluginConfig.getSetting( 'iframeWidth' ) ) />
		
		<h1>Add</h1>
	<cfelse>
		<h1>Edit</h1>
	</cfif>

	<div class="nav-module-specific btn-group">
		<a class="btn" href="?action=default" title="iFrame List">
			<i class="mi-list"></i>
			iframe List
		</a>
	</div>
</div>

<cfif not isNull( objFrameDetails )>
		
	<cfoutput>
		<form action="./" method="post" name="frmEditiFrame" id="frmEditiFrame">
			<input type="hidden" name="action" id="action" value="actSave">
			<input type="hidden" name="iframeID" id="iframeID" value="#objFrameDetails.getiFrameID()#">

			<div class="mura-control-group">
				<label for="name">Name</label>
				<input type="text" name="name" id="name" value="#objFrameDetails.getName()#" required="required"  maxlength="256">
			</div>
			<div class="mura-control-group">
				<label for="url">URL</label>
				<input type="url" name="URL" id="url" value="#objFrameDetails.getURL()#" maxlength="1024" required="required">
			</div>
			<div class="mura-control-group">
				<label for="height">Height</label>
				<input type="number" min="0" name="height" id="height" value="#objFrameDetails.getHeight()#" class="text" maxlength="5">
			</div>
			<div class="mura-control-group">
				<label for="width">Width</label>
				<input type="number" min="0" name="width" id="width" value="#objFrameDetails.getWidth()#" class="text"  maxlength="5">
			</div>
			<div class="mura-control-group">
				<label for="scrolling">Scrolling</label>
				<select name="scrolling" id="scrolling">
					<option value="auto"<cfif objFrameDetails.getScrolling() eq "auto"> selected</cfif>>Auto</option>
					<option value="yes"<cfif objFrameDetails.getScrolling() eq "yes"> selected</cfif>>Yes</option>
					<option value="no"<cfif objFrameDetails.getScrolling() eq "no"> selected</cfif>>No</option>
				</select>
			</div>
			<div class="form-actions">
				<button type="submit" name="btnSaveIFrame" id="btnSaveIFrame" class="btn mura-primary"><i class="mi-check-circle"></i>Save</button>
			</div>
		</form>
	</cfoutput>
<cfelse>
	<h3>There was a problem with the iframe config.</h3>
</cfif>
