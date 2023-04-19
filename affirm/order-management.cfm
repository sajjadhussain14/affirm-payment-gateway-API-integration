    <cfoutput>	
<cfinclude template = "./includes/header.cfm">
<div class="container-fluid">
    <div class="loader d-none" id="loader"></div>
    <h2 class="text-center">Order Management</h2>
    <hr />
    <div class="row">
        <div class="row">
            <label class="col-3">Charge ID</label>
            <input class="col-9" type="text" oninput="getOrderRequest(this.value)" id="currentChargeID" />
        </div>
        <small class="offset-3">Get the charge information, current charge status, and checkout data for
            a list of charges.</small>

        <div class="order" id="order-details"></div>
        <p class="text-center text-danger d-none" id="error-msg"></p>

        <hr />
        <div class="row mt-2">
            <div class="col-6 border-end">
                <h5 class="p-2">Capture Order</h5>

                <div class="row m-2">
                    <div class="col-4 mt-2">Order ID:</div>
                    <div class="col-8 mt-2">
                        <input type="text" id="orderIDForCapture" />
                    </div>
                </div>

                <div class="row m-2">
                    <div class="col-12 text-center">
                        <button type="button" class="btn btn-secondary" onclick="captureOrderRequest()">
                            Submit
                        </button>
                    </div>
                </div>

                <p class="text-center text-info d-none" id="capture-order-res"></p>
            </div>
            <div class="col-6">
                <h5 class="p-2">Refund Order</h5>

                <div class="row m-2">
                    <div class="col-4 mt-2">Amount:</div>
                    <div class="col-8 mt-2">
                        <input type="text" id="refund_amount" />
                    </div>
                </div>

                <div class="row m-2">
                    <div class="col-12 text-center">
                        <button type="button" class="btn btn-secondary" onclick="refundAmountRequest()">
                            Submit
                        </button>
                    </div>
                </div>

                <p class="text-center text-info d-none" id="refund-amount-res"></p>
            </div>
        </div>
        <hr />
        <div class="row">
            <div class="col-8 border-end">
                <h5 class="p-2">Void Order</h5>

                <div class="row m-2">
                    <div class="col-12 text-center">
                        <button type="button" class="btn btn-secondary" onclick="voidOrderRequest()">
                            Submit
                        </button>
                    </div>
                </div>

                <p class="text-center text-info d-none" id="void-order-res"></p>
            </div>
        </div>
        <hr />
        <br />
    </div>
</div>
<cfinclude template = "./includes/footer.cfm">
</cfoutput>
