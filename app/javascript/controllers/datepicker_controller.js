import { Controller } from "@hotwired/stimulus"
import flatpickr from "flatpickr"; // You need to import this to use new flatpickr()

export default class extends Controller {
  static targets = [ "startDate", "endDate" ]

  connect() {
    flatpickr(this.startDateTarget, {
      minDate: "today",
      dateFormat: "d-m-Y",
     })
    flatpickr(this.endDateTarget, {
      dateFormat: "d-m-Y",
     })
  }

  updateEndDate() {
    this.endDateTarget._flatpickr.set("minDate", this.startDateTarget.value);
  }
}
