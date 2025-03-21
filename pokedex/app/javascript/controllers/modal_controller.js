import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["modal"];

  close(event) {
    // Close only if the mouse leaves the actual modal content
    if (!this.modalTarget.contains(event.relatedTarget)) {
      this.element.innerHTML = "";
    }
  }
}
