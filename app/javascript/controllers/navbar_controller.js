import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["collapse", "toggler"]

  connect() {
    if (sessionStorage.getItem("keepNavbarOpen") !== "true") return

    sessionStorage.removeItem("keepNavbarOpen")

    if (!window.matchMedia("(max-width: 767.98px)").matches) return

    this.collapseTarget.classList.add("show")
    this.togglerTarget.setAttribute("aria-expanded", "true")
  }

  keepOpen() {
    sessionStorage.setItem("keepNavbarOpen", "true")
  }
}
