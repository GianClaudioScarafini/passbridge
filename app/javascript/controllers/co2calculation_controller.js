import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="co2calculation"
export default class extends Controller {
  static targets = ["co2Value", "quantity", "displayCo2Value", "displayPrice"]


  connect() {
  }
  calculate(){
    const itmeQuantity = this.quantityTarget.value;
    const co2Multiplyer = this.co2ValueTarget.value;
    const urlParams = new URLSearchParams(window.location.search);
    const distance = urlParams.get('distance');
    const price = urlParams.get('price');
    const co2Total = distance * co2Multiplyer;
    this.insertCo2Value(co2Total);
    this.insertPrice(itmeQuantity, price);
    this.displayCo2ValueTarget.innerText = co2Total;
    this.displayPriceTarget.innerText = itmeQuantity * price;
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
