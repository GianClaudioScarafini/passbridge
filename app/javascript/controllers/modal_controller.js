import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="modal"
export default class extends Controller {
  static targets = [ "modal", "modalContent" ]
  display(event) {
    this.modalTarget.style.display = "block"
    const purchaseId = event.currentTarget.dataset.purchase
    const url = `/purchases/${purchaseId}`
    fetch(url, {headers: {"Accept": "text/plain"}})
    .then(response => response.text())
    .then((data) => {
      this.modalContentTarget.innerHTML = data
    })
  }
  close() {
    this.modalTarget.style.display = "none"
  }
}
