<cfcomponent name="orders">
	
	<cfscript>
		app = createObject("component","config");
		authToken = app.publicKey & ":" & app.privateKay
		this.encodedAuth = ToBase64(authToken)
	</cfscript>


	<!------------------------START GET ORDER-------------------------->
	<cffunction name="getOrder" access="remote" returnFormat="plain">
		<cfargument name="chargeID" type="any" required="false" />
		
		<cfhttp method="get" url="#app.endpoint.apiUrl#/v2/charges/#arguments.chargeID#" result="result">
			<cfhttpparam type="header" name="Authorization" value="Basic #this.encodedAuth#">
			<cfhttpparam type="header" name="content-type" value="application/json">
		</cfhttp>

		<cfreturn #result.filecontent#>
	</cffunction>
	<!------------------------END GET ORDER-------------------------->

	<!------------------------START Void amount BY Order-------------------------->
	<cffunction name="voidOrder" access="remote" returnFormat="plain">
		<cfargument name="chargeID" type="any" required="false" />

		<cfhttp method="POST" url="#app.endpoint.apiUrl#/v2/charges/#arguments.chargeID#/void" result="result">
			<cfhttpparam type="header" name="Authorization" value="Basic #this.encodedAuth#">
			<cfhttpparam type="header" name="content-type" value="application/json">
		</cfhttp>

		<cfreturn #result.filecontent#>
	</cffunction>
	<!------------------------END Void  ORDER BY ORDER ID-------------------------->


	<!------------------------START Capture amount BY Order-------------------------->
	<cffunction name="createCaptureOrder" access="remote" returnFormat="plain">
		<cfargument name="payLoad" type="any" required="false" />
		<cfargument name="chargeID" type="any" required="false" />

		<cfset data=serializeJSON(arguments.payLoad)>

		<cfhttp method="POST" url="#app.endpoint.apiUrl#/v2/charges/#arguments.chargeID#/capture" result="result">
			<cfhttpparam type="header" name="Authorization" value="Basic #this.encodedAuth#">
			<cfhttpparam type="header" name="content-type" value="application/json">
			<cfhttpparam type="body" value="#deserializeJSON(data)#">
		</cfhttp>

		<cfreturn #result.filecontent#>
	</cffunction>
	<!------------------------END CAPTURE ORDER BY ORDER ID-------------------------->


	<!------------------------START Refund amount BY Order-------------------------->
	<cffunction name="createRefundAmountByOrder" access="remote" returnFormat="plain">
		<cfargument name="payLoad" type="any" required="false" />
		<cfargument name="chargeID" type="any" required="false" />

		<cfset data=serializeJSON(arguments.payLoad)>
		
		<cfhttp method="POST" url="#app.endpoint.apiUrl#/v2/charges/#arguments.chargeID#/refund" result="result">
			<cfhttpparam type="header" name="Authorization" value="Basic #this.encodedAuth#">
			<cfhttpparam type="header" name="content-type" value="application/json">
			<cfhttpparam type="body" value="#deserializeJSON(data)#">
		</cfhttp>

		<cfreturn #result.filecontent#>
	</cffunction>
	<!------------------------END Refund ORDER BY ORDER ID-------------------------->

</cfcomponent>