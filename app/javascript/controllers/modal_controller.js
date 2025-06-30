import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["container"]

  connect() {
    console.log("modal connected")
    requestAnimationFrame(() => {
      console.log("modal connected")
      this.containerTarget.classList.remove("opacity-0", "scale-95")
      this.containerTarget.classList.add("opacity-100", "scale-100")
    })
  }

  close(event) {
    if (event.target === this.element || event.currentTarget === this.element) {
      this.containerTarget.classList.remove("opacity-100", "scale-100")
      this.containerTarget.classList.add("opacity-0", "scale-95")

      setTimeout(() => {
        this.element.remove()
      }, 200)
    }
  }
}
