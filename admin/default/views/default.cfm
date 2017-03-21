<cfset qryIFrames = $.event( "qryIFrames" ) />

<div class="mura-header">
	<h1>List</h1>

	<div class="nav-module-specific btn-group">
		<a href="?action=default.edit" class="btn"><i class="mi-plus"></i>Add iFrame</a>
	</div>
</div>


<cfoutput>
	<cfif qryIFrames.recordCount gt 0>

		<table class="mura-table-grid">
			<thead>
				<tr>
					<th>Link Name</th>
					<th>URL</th>
					<th>Ops</th>
				</tr>
			</thead>
			<tbody>
				<cfloop query="qryIFrames">
					<tr>
						<td class="var-width">#qryIFrames.name#</td>
						<td class="var-width">#qryIFrames.url#</td>
						<td>
							<a href="?action=default.edit&iframeid=#qryIFrames.IFrameID#" title="Edit" class="draftprompt"><i class="mi-pencil"></i></a>
							<a onclick="return confirmDialog('Are you sure that you want to delete this?',this.href);" href="?action=default.actDelete&iframeid=#qryIFrames.IFrameID#" title="Delete" class="draftprompt"><i class="mi-remove"></i></a>
						</td>
					</tr>
				</cfloop>
			</tbody>
		</table>
					
	<cfelse>
		<p>There are no iframes configured.</p>
	</cfif>
</cfoutput>