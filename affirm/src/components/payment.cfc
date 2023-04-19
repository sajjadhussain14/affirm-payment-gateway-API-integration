<cfcomponent name="payment">
	<cfscript>
		app = createObject("component","config");
	</cfscript>

	<!------------------------START CREATE ORDER KLARNA-------------------------->
	<cffunction name="createOrder" access="remote" returnFormat="plain">
		<cfargument name="order_id" type="any" required="false" />
		<cfargument name="checkout_token" type="any" required="false" />

		<cfset authToken = app.publicKey & ":" & app.privateKay>
		<cfset encodedAuth = ToBase64(authToken)>
		
		<cfscript>
			order={
				"checkout_token":arguments.checkout_token,
				"order_id":arguments.order_id
				}
		</cfscript>
		
		<!------Charge Order Request------->
		<cfhttp method="post" url="#app.endpoint.apiUrl#/v2/charges" result="result">
			<cfhttpparam type="header" name="Authorization" value="Basic #encodedAuth#">
			<cfhttpparam type="header" name="content-type" value="application/json">
			<cfhttpparam type="body" value="#serializeJSON(order)#">
		</cfhttp>
		<cfset res=result.filecontent />
		<cfset transaction=deserializeJSON(res)>
        <cfif isDefined("transaction.id")>
			<cfset session.orderData.transactionID=transaction.id>
		</cfif>
		<cfreturn transaction >
	</cffunction>
	<!------------------------END CREATE ORDER KLARNA-------------------------->
</cfcomponent>