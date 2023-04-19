// Affirm Integration
// Version : 1.0.2
// author: Sajjad Hussain

let loaderHtmlt = `<div class="row   content-holder p-0 text-center">
            <div class="spinner-border" role="status">
  <span class="visually-hidden">Loading...</span>
</div>
`;

// CREATE NEW ORDER REQUEST
const createOrderRequest = (checkoutObject) => {
  let checkoutData = {};
  checkoutData = checkoutObject;
  affirm.checkout(checkoutData);
  affirm.checkout.open();
};

// GET AN ORDER
const getOrderRequest = (chargeID) => {
  try {
    document.getElementById("loader").classList.remove("d-none");
  } catch (err) {}

  chargeID = chargeID.replace(/\s+/g, "");
  let settings = {
    async: true,
    crossDomain: true,
    url: "src/components/orders.cfc?method=getOrder",
    method: "POST",
    data: {
      chargeID: chargeID,
    },
  };

  $.ajax(settings).done(function (order) {
    window.scrollTo(0, 0);

    document.getElementById("order-details").innerHTML = order;

    try {
      setTimeout(() => {
        document.getElementById("loader").classList.add("d-none");
      }, 500);
    } catch (err) {}
  });
};

// void Order
const voidOrderRequest = () => {
  try {
    document.getElementById("void-order-res").classList.remove("d-none");
  } catch (err) {}

  try {
    document.getElementById("void-order-res").innerHTML = loaderHtmlt;
  } catch (err) {}

  let chargeID = "";

  chargeID = document.getElementById("currentChargeID").value;
  if (!chargeID) {
    alert("Please get an Order First and then Release");
    return;
  }

  if (chargeID != "") {
    let payLoad = {};
    try {
      document.getElementById("loader").classList.remove("d-none");
    } catch (err) {}

    let settings = {
      async: true,
      crossDomain: true,
      url: "src/components/orders.cfc?method=voidOrder",
      method: "POST",
      data: {
        chargeID: chargeID,
      },
    };
    $.ajax(settings).done(function (response) {
      displayResponse("void-order-res", response);
    });
  } else {
    alert("Please enter a valid order");
  }
};

// Capture Order Amount
const captureOrderRequest = () => {
  try {
    document.getElementById("capture-order-res").classList.remove("d-none");
  } catch (err) {}

  try {
    document.getElementById("capture-order-res").innerHTML = loaderHtmlt;
  } catch (err) {}

  let newRefID = "";
  let chargeID = "";

  chargeID = document.getElementById("currentChargeID").value;
  orderIDForCapture = document.getElementById("orderIDForCapture").value;
  if (!chargeID) {
    alert("Please get an Order First and then capture");
    return;
  }

  if (orderIDForCapture != "" && chargeID != "") {
    let payLoad = {};

    payLoad = {
      order_id: orderIDForCapture,
    };
    try {
      document.getElementById("loader").classList.remove("d-none");
    } catch (err) {}

    let settings = {
      async: true,
      crossDomain: true,
      url: "src/components/orders.cfc?method=createCaptureOrder",
      method: "POST",
      data: {
        payLoad: JSON.stringify(payLoad),
        chargeID: chargeID,
      },
    };
    $.ajax(settings).done(function (response) {
      displayResponse("capture-order-res", response);
      document.getElementById("orderIDForCapture").value = "";
    });
  } else {
    alert("Please enter a valid New order ID or Charge ID");
  }
};

// REFUND ORDER
const refundAmountRequest = () => {
  try {
    document.getElementById("refund-amount-res").classList.remove("d-none");
  } catch (err) {}

  try {
    document.getElementById("refund-amount-res").innerHTML = loaderHtmlt;
  } catch (err) {}

  let newRefID = "";
  let chargeID = "";

  chargeID = document.getElementById("currentChargeID").value;
  refund_amount = document.getElementById("refund_amount").value;
  if (!chargeID) {
    alert("Please get an Order First and then refund");
    return;
  }

  if (refund_amount != "") {
    let payLoad = {};
    let amt = parseInt(refund_amount);
    payLoad = {
      amount: amt,
    };
    try {
      document.getElementById("loader").classList.remove("d-none");
    } catch (err) {}

    let settings = {
      async: true,
      crossDomain: true,
      url: "src/components/orders.cfc?method=createRefundAmountByOrder",
      method: "POST",
      data: {
        payLoad: JSON.stringify(payLoad),
        chargeID: chargeID,
      },
    };
    $.ajax(settings).done(function (response) {
      displayResponse("refund-amount-res", response);
      document.getElementById("refund_amount").value = "";
    });
  } else {
    alert("Please enter a valid New order Amount");
  }
};

const displayResponse = (id, text) => {
  document.getElementById(id).innerHTML = text;

  setTimeout(() => {
    try {
      document.getElementById(id).classList.add("d-none");
    } catch (err) {}
  }, 500000000);
};
