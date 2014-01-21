<cfquery name="members" datasource="rescuelist">
	SELECT * FROM Membership
</cfquery>
<cfdump var="#members#">