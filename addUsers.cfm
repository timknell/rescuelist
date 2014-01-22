<cfquery name="insertUsers">
	INSERT INTO `User` (UserName,Password,FirstName,LastName)
	VALUES ('#FORM.username#','#hash(FORM.password,"MD5")#','#FORM.firstname#','#FORM.lastname#')
</cfquery>
<cfquery name="insertedUser">
	SELECT * FROM `User` WHERE UserName = '#FORM.username#'
</cfquery>
<cfdump var="#insertedUser#">