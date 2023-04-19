<cfcomponent name="config">
	<cfscript>
		//APP Settings

		this.publicKey = application.publicKey;
		this.privateKay = application.privateKay;

		// SET ENVIRONMENT 
        environment='development'
		this.endpoint = {};
		// set endpint URLS
		this.endpoint.apiAuthUrl = "https://api.affirm.com/api/v1/transactions"
        this.endpoint.apiUrl = "https://sandbox.affirm.com/api" 
		// For Production: https://api.affirm.com/api
		this.endpoint.cancelUrl = #application.secureurl# & "cancel.cfm";;
        this.endpoint.completeUrl = #application.secureurl# & "complete.cfm"; 
	</cfscript>
</cfcomponent>