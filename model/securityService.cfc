<cfcomponent>
	<cffunction name="utilityService"><cfreturn application.factory.getModel('utilityService')></cffunction>
	<cffunction name="userService"><cfreturn application.factory.getModel('userService')></cffunction>
	
	<cffunction name="authenticate">
		
		<cfif structKeyExists(URL,'logout')>
			<cfset expireSession()>
			<cfset utilityService().redirect('login')>
		</cfif>
		
		<!--- User is on login page --->
		<cfif utilityService().getCurrentPath() eq 'login'>
			
			<!--- User is logging in --->
			<cfif structKeyExists(FORM,'username')>
				<cfif checkCredentials()>
					<cfset setActiveSession(FORM.username)>
					<cfset utilityService().redirect('')>
				</cfif>
			</cfif>
			
			<cfreturn>
		</cfif>
		
		<cfif !isSessionActive()>
			<cfset utilityService().redirect('login')>
		<cfelse>
			<cfset keepSessionAlive()>
		</cfif>
	</cffunction>
	
	<cffunction name="isSessionActive">
		<!--- TODO: check DB for active session within session timeout --->
		<cfset local.expire = dateAdd('m',-application.config.sessionTimeout,now())>
		<cfset local.expire = "#dateFormat(expire,'yyyy-mm-dd')# #timeformat(expire,'HH:mm:ss')#">
		<cfquery name="local.activeSession">
			SELECT 1 FROM Loginsession
			WHERE	sessionID = <cfqueryparam value="#getSessionID()#">
					AND lastaccessed >= <cfqueryparam value="#expire#">
		</cfquery>
		<cfreturn local.activeSession.recordcount gt 0>
	</cffunction>
	
	<cffunction name="checkCredentials">
		<cftry>
			<cfquery name="local.creds">
				SELECT 	1 
				FROM 	`User`
				WHERE	username = <cfqueryparam value="#FORM.username#">
						AND password = <cfqueryparam value="#hash(FORM.password,"MD5")#">
			</cfquery>
			<cfreturn local.creds.recordcount gt 0>
			<cfcatch>
				<cfreturn false>
			</cfcatch>
		</cftry>
	</cffunction>
	
	<cffunction name="setActiveSession">
		<cfargument name="username" required="true" type="string">
		<cfset request.user = ''>
		<cfset cookie.sessionid = createUUID()>
		<cfquery name="local.sessionUpdate">
			INSERT INTO Loginsession (UserID,SessionID,LastAccessed)
			VALUES (1,<cfqueryparam value="#cookie.sessionid#">,<cfqueryparam value="#dateFormat(now(),'yyyy-mm-dd')# #timeformat(now(),'HH:mm:ss')#">)
		</cfquery>
	</cffunction>
	
	<cffunction name="keepSessionAlive">
		<!--- Update DB with last accessed --->
	</cffunction>
	
	<cffunction name="getSessionID" access="private">
		<cftry>
			<cfreturn cookie.sessionID>
			<cfcatch><cfreturn createUUID()></cfcatch>
		</cftry>
	</cffunction>
	
	<cffunction name="expireSession" access="private">
		<cfset cookie.sessionID = createUUID()>
	</cffunction>
	
</cfcomponent>