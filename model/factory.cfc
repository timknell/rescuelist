<cfcomponent>
	
	<cffunction name="appinit">
		<cfargument name="models" required="true" type="array">
		<cfset application.model = {}>
		<cfloop array="#arguments.models#" index="local.model">
			<cfset structInsert(application.model,model,createObject('component',model))>
		</cfloop>
	</cffunction>
	
	<cffunction name="getModel">
		<cfargument name="model" type="string" required="true">
		<cfreturn application.model[model]>
	</cffunction>
</cfcomponent>