import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="co2calculation"
export default class extends Controller {
  static targets = ["co2Value", "quantity", "displayCo2Value", "displayPrice", "displayMuliplayer"]




  connect() {

  }
  calculate(){

    const shippingMethodMulipliers = [
      ['', 0], // ["shipping_method", "multiplier"]
      ['foot', 0],
      ['bike', 0],
      ['airplane', 12500],
      ['car', 200],
      ['motorcycle', 100],
      ['electric_motorcycle', 0],
      ['electric_car', 0],
      ['truck', 2000],
      ['drone', 0]
      ];

    // get the quantitiy selected by the user
    const itmeQuantity = this.quantityTarget.value;
    console.log("itmeQuantity");
    console.log(itmeQuantity);

    // get the shipping method selected by the user
    if (this.co2ValueTarget.value == ""){
      var indexFomUser = this.co2ValueTarget.value = 0;
    }else{
      var indexFomUser = parseInt(this.co2ValueTarget.value);
    }
    console.log("indexFomUser");
    console.log(indexFomUser);

    // get the multiplier for the selected shipping method
    const co2method  = shippingMethodMulipliers[indexFomUser][1];
    console.log("indexFomUser");
    console.log(shippingMethodMulipliers[indexFomUser][1]);

    // get the distance and price from the url
    const urlParams = new URLSearchParams(window.location.search);
    const distance = urlParams.get('distance');
    const distanceKm = (distance / 1000).toFixed(2);
    console.log("distance");
    console.log(distanceKm);


    const price = urlParams.get('price');
    const co2Total = distanceKm * co2method;
    this.insertCo2Value(co2Total);
    this.insertPrice(itmeQuantity, price);
    this.displayCo2ValueTarget.innerText = co2Total;
    this.displayPriceTarget.innerText = itmeQuantity * price;
    // this.displayMuliplayerTarget.innerText =  co2method;
  }

  insertCo2Value(co2Total){
    const co2TotalElement = document.getElementById('total_co2_emitions');
    co2TotalElement.value = co2Total;
  }

  insertPrice(itemQuantity, price){
    const priceInput = document.getElementById('price');
    priceInput.value = itemQuantity * price;
  }
}
