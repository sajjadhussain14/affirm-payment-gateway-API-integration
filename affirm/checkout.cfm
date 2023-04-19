<cfoutput>
<cfinclude template = "./includes/header.cfm">

	<cfscript>
    paymentObject = createObject("component","src.components.payment");
    app = createObject("component","src.components.config");

   // Order dummy data
    orderData={}
    orderData={
        "merchant": {
          "user_confirmation_url":    app.endpoint.completeUrl,
          "user_cancel_url":         app.endpoint.cancelUrl,
          "public_api_key":  "2HR3QETIX9Z9F0KX",
          "user_confirmation_url_action": "GET",
          "name": "Celerant Test"
        },
        "shipping":{
          "name":{
            "first":"Joe",
            "last":"Doe"
          },
          "address":{
            "line1":"633 Folsom St",
            "line2":"Floor 7",
            "city":"San Francisco",
            "state":"CA",
            "zipcode":"94107",
            "country":"USA"
          },
          "phone_number": "4153334567",
          "email": "sajjadast786@gmail.com"
        },
        "billing":{
          "name":{
            "first":"Joe",
            "last":"Doe"
          },
          "address":{
            "line1":"633 Folsom St",
            "line2":"Floor 7",
            "city":"San Francisco",
            "state":"CA",
            "zipcode":"94107",
            "country":"USA"
          },
          "phone_number": "4153334567",
          "email": "sajjadast786@gmail.com"
        },
        "items": [{
          "display_name":         "Awesome Pants",
          "sku":                  "ABC-123",
          "unit_price":           10000,
          "qty":                  3,
          "item_image_url":       "http://merchantsite.com/images/awesome-pants.jpg",
          "item_url":             "http://merchantsite.com/products/awesome-pants.html",
          "categories": [
              ["Home", "Bedroom"],
              ["Home", "Furniture", "Bed"]
          ]
        }
    ],
        "discounts":{
          "RETURN5":{
              "discount_amount":500,
              "discount_display_name":"Returning customer 5% discount"
          },
          "PRESDAY10":{
              "discount_amount":1000,
              "discount_display_name":"Presidents Day 10% off"
        }
    },
    "metadata":{
        "shipping_type":"UPS Ground",
        "mode":"modal"
    },
    "order_id":"JKLMO4321",
    "currency":"USD",  
    "financing_program":"flyus_3z6r12r",
    "shipping_amount":1000,
    "tax_amount":600,
    "total":30100
  }
  session.orderData=orderData
  od=serializeJson(orderData)
  od = replace(od, "'", "", "all")
</cfscript>

<div class="row p-5">
  <h2>Cart</h2>
  <cfdump var = "#session.orderData#">
  <div class="col-lg-4 col-md-4 col-sm-12 boder p-2">
    <h2>Checkout</h2>
    <div class="row">
      <button
        id="checkoutBtn"
        class="btn btn-primary mt-2"
        onclick='createOrderRequest(#od#)'
      >
        Checkout with Affirm
      </button>
    </div>
  </div>
</div>
	
<cfinclude template = "./includes/footer.cfm">
</cfoutput>
