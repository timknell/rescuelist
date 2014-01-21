<cfcomponent>
	<cffunction name="get" access="remote" returnformat="JSON" returntype="struct">
		<cfset var json = '{"members":[
    {"_id":1,"fullname":"Timothy Knell",
        "AddressIsCorrect":true,
        "address":
           {
                "street1":"36 Winslow Dr.",
                "city":"Hanson",
                "state":"MA",
                "zipcode":"02341"
            }

},
    {"_id":2,"fullname":"David Knell"},
    {"_id":3,"fullname":"Christopher Knell","AddressIsCorrect":true},
    {"_id":4,"fullname":"Scott Knell","AddressIsCorrect":false}
]}'>
		<cfquery name="local.membersQuery" datasource="rescuelist">
			SELECT * FROM Membership
		</cfquery>
		<cfset var json = {}>
		<cfset structInsert(json,"members",[])>
		<cfloop query="local.membersQuery">
			<cfscript>
			var member = {
				_id = local.membersQuery["Indiv ID"],
				fullname = local.membersQuery["Full name"],
				address = { 
					street1 = local.membersQuery["Street 1"],
					street2 = local.membersQuery["Street 2"],
					city = local.membersQuery["City"],
					state = local.membersQuery["State/Prov"],
					zipcode = local.membersQuery["Postal"]
				},
				AddressIsCorrect = false
			};
			arrayAppend(json.members,member);
			</cfscript>
		</cfloop>
		<cfreturn json>
	</cffunction>
	<cffunction name="getByID" access="remote" returnformat="JSON" returntype="struct">
		<cfargument name="ID" required="true" type="numeric">
		<cfquery name="local.memberQuery" datasource="rescuelist">
			SELECT * FROM Membership WHERE `Indiv ID` = <cfqueryparam value="#arguments.ID#">
		</cfquery>		
		<cfset var json = {
			member = {
				_id = local.memberQuery["Indiv ID"],
				fullname = local.memberQuery["Full name"],
				AddressIsCorrect = false,
				address = { 
					street1 = local.memberQuery["Street 1"],
					street2 = local.memberQuery["Street 2"],
					city = local.memberQuery["City"],
					state = local.memberQuery["State/Prov"],
					zipcode = local.memberQuery["Postal"]
				}
			}
		}>
		<cfreturn json>
		<cfsavecontent variable="local.json">
<cfswitch expression="#arguments.ID#">
	<cfcase value="1">
			{"member":
    {
        "_id":1,
        "fullname":"Timothy Knell",
        "AddressIsCorrect":true,
        "address":
           {
                "street1":"36 Winslow Dr.",
                "city":"Hanson",
                "state":"MA",
                "zipcode":"02341"
            },
        "phone":"301-244-8466",
        "email":"timothy@knell.org",
        "isActive":true,
        "responsibleAux":{
            "_id":1,
            "auxiliary":"Elder's Quorum"
        },
        "homeTeachers":[{"_id":3,"fullname":"Christopher Knell"},{"_id":2,"fullname":"David Knell"}],
        "checklistSteps":[
            {"_id":1,"label":"Doorstep","description":"Contact the occupants at the member's last known address.","complete":true},
            {"_id":1,"label":"Forwarding","description":"Use postal services to find a forwarding address."},
            {"_id":1,"label":"Phone","description":"Call any last known telephone numbers."},
            {"_id":1,"label":"Email","description":"Send an e-mail inquiry to any last known e-mail address."},
            {"_id":1,"label":"Relatives","description":"Contact known family members and relatives."},
            {"_id":1,"label":"Friends","description":"Contact known friends, Church members, and full-time missionaries."},
            {"_id":1,"label":"Leaders","description":"Contact ward priesthood and auxiliary leaders."},
            {"_id":1,"label":"Social Networks","description":"Check available online social networks."},
            {"_id":1,"label":"Bishop","description":"Obtain bishop's approval."}
        ]
    }
}
</cfcase>
<cfcase value="2">
	{"member":
    {
        "_id":2,
        "fullname":"David Knell",
        "address":
           {
                "street1":"12513 Lloydminster Dr.",
                "city":"North Potomac",
                "state":"MD",
                "zipcode":"20878"
            },
        "phone":"301-869-5411",
        "email":"david@knell.org",
        "isActive":true,
        "responsibleAuxiliary":{
            "_id":1,
            "auxiliary":"Elder's Quorum"
        },
        "homeTeachers":[
            {
                "_id":1,
                "fullname":"Timothy Knell"
            },
            {"_id":4,"fullname":"Scott Knell"}
        ],
        "checklistSteps":[
            {"_id":1,"label":"Doorstep","description":"Contact the occupants at the member's last known address.","complete":true},
            {"_id":1,"label":"Forwarding","description":"Use postal services to find a forwarding address."},
            {"_id":1,"label":"Phone","description":"Call any last known telephone numbers."},
            {"_id":1,"label":"Email","description":"Send an e-mail inquiry to any last known e-mail address."},
            {"_id":1,"label":"Relatives","description":"Contact known family members and relatives."},
            {"_id":1,"label":"Friends","description":"Contact known friends, Church members, and full-time missionaries."},
            {"_id":1,"label":"Leaders","description":"Contact ward priesthood and auxiliary leaders."},
            {"_id":1,"label":"Social Networks","description":"Check available online social networks."},
            {"_id":1,"label":"Bishop","description":"Obtain bishop's approval."}
        ]
    }
}
</cfcase>
</cfswitch>
		</cfsavecontent>
		<cfreturn deserializeJSON(json)>
	</cffunction>
</cfcomponent>