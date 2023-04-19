<cfoutput>	
    <cfinclude template = "./includes/header.cfm">
    <cfscript>
        // Get Checkout Token from URL
        checkout_token = URL.checkout_token
        paymentObject = createObject("component","src.components.payment");
        response=paymentObject.createOrder(session.orderData.order_id,checkout_token)
    </cfscript>
    <h2>Your Order has been completed. Please note down "Charge ID" to Perform below actions in Order Management page</h2>
    <p>Capture Amount, Void Order, Refund Order</p>
    <cfdump var = "#response#" >
    <cfinclude template = "./includes/footer.cfm">
</cfoutput>
