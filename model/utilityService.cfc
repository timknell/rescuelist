<cfcomponent>
	
	<cffunction name="redirect">
		<cfargument name="path" type="string" required="true">
		<cfset var relocationPath = "\#application.config.basePath#\#arguments.path#"> 
		<cflocation url="#relocationPath#" addtoken="false">
	</cffunction>
	
	<cffunction name="getCurrentPath">
		<cfset var pathPos = listfindNoCase(cgi.script_name,application.config.basePath,'/')>
		<cftry>
			<cfreturn listgetAt(cgi.script_name,pathPos + 1,'/')>
			<cfcatch><cfreturn ''></cfcatch>
		</cftry>
	</cffunction>
</cfcomponent>