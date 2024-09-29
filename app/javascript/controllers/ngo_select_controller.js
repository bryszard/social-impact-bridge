import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["checkbox", "card", "contactButton"];

  connect() {
    this.updateContactButton();
  }

  toggleSelection(event) {
    const card = event.currentTarget;
    const checkbox = card.querySelector(".ngo-checkbox");
    checkbox.checked = !checkbox.checked;
    card.classList.toggle("bg-green-100", checkbox.checked);
    this.updateContactButton();
  }

  updateContactButton() {
    const selectedCheckboxes = this.checkboxTargets.filter((checkbox) => checkbox.checked);
    this.contactButtonTarget.disabled = selectedCheckboxes.length === 0;
  }

  contactAll(event) {
    const selectedCheckboxes = this.checkboxTargets.filter((checkbox) => checkbox.checked);
    const selectedIds = selectedCheckboxes.map((checkbox) => checkbox.dataset.nonprofitId);
    const queryString = selectedIds.map((id) => `ids[]=${id}`).join("&");

    window.open(`/contact_nonprofits/new?${queryString}`, "_blank");
  }
}
