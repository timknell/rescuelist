<cfcomponent>

	<cffunction name="get" access="remote" returnFormat="JSON" returntype="struct">
		<cfsavecontent variable="local.json">
{"stream":[
    {
        "_id":1,
        "comment":"This is a comment",
        "user": {
            "_id":1,
            "fullname":"Tim Knell"
        },
        "datetime": "2013-01-01 12:00 PM"
    },
    {
        "_id":2,
        "comment":"This is another comment",
        "user": {
            "_id":1,
            "fullname":"Tim Knell"
        },
        "datetime": "2013-01-01 12:00 PM"
    },
    {
        "_id":3,
        "comment":"This is a comment about something",
        "user": {
            "_id":2,
            "fullname":"David Knell"
        },
        "datetime": "2013-01-01 12:00 PM"
    },
    {
        "_id":4,
        "comment":"This is a comment about something else",
        "user": {
            "_id":2,
            "fullname":"Tim Knell"
        },
        "datetime": "2013-01-01 12:00 PM"
    }
]}
		</cfsavecontent>
		<cfreturn deserializeJSON(json)>
	</cffunction>

</cfcomponent>