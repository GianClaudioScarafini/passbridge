import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="modal"
export default class extends Controller {
  static targets = [ "modal", "modalContent" ]
  display(event) {
    this.modalTarget.style.display = "block"
    const itemId = event.currentTarget.dataset.item
    const url = `/items/${itemId}/purchases`
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
