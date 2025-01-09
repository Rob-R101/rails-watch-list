import { Application } from "@hotwired/stimulus"

const application = Application.start()

// Configure Stimulus development experience
application.debug = false
window.Stimulus   = application

export { application }

// app/assets/config/manifest.js
//= link popper.js
//= link bootstrap.min.js
