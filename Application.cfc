<cfcomponent>

	<cfset this.name = 'rescuelist'>
	<cfset this.datasource = 'rescuelist'>
	
	<cffunction name="onApplicationStart">
		<cfset application.config.basePath = 'wbwrescuelist'>
		<cfset application.config.sessionTimeout = 30>
		<cfset application.factory = createObject('component','model.factory')>

		<cfset application.factory.appinit([
			'securityService',
			'utilityService',
			'userService'
		])>
	</cffunction>
	
	<cffunction name="onRequestStart">
		<!---<cfif structKeyExists(URL,'reinit')>--->
			<cfset applicationStop()>
			<cfset onApplicationStart()>
		<!---</cfif>--->
		
		<cfset application.factory.getModel('securityService').authenticate()>
	</cffunction>
	
</cfcomponent>