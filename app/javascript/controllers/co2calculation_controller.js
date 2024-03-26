import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="co2calculation"
export default class extends Controller {
  static targets = ["co2Value", "quantity", "displayCo2Value", "displayPrice", "displayMuliplayer"]




  connect() {

  }
  calculate(){

    const shippingMethodMulipliers = [
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
    const itmeQuantity = this.quantityTarget.value;
    const co2Multiplyer = parseInt(this.co2ValueTarget.value)-1;
    const co2Multiplyertst  = shippingMethodMulipliers[co2Multiplyer][1];
    const urlParams = new URLSearchParams(window.location.search);
    const distance = urlParams.get('distance');
    const distanceKm = (distance / 1000).toFixed(2);
    const price = urlParams.get('price');
    const co2Total = distanceKm * co2Multiplyertst;
    this.insertCo2Value(co2Total);
    this.insertPrice(itmeQuantity, price);
    this.displayCo2ValueTarget.innerText = co2Total;
    this.displayPriceTarget.innerText = itmeQuantity * price;
    this.displayMuliplayerTarget.innerText =  co2Multiplyertst;
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
