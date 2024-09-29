import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  dismiss() {
    console.log("DISMISSING FLASH");
    this.element.remove();
  }
}
