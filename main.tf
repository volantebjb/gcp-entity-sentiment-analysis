resource "google_project_service" "enable_natural_language_api" {
  service = "language.googleapis.com"
}

resource "google_project_service" "enable_apikeys_api" {
  service = "apikeys.googleapis.com"
}

resource "google_apikeys_key" "nl_api_key" {
  name         = "nl-api-key"
  display_name = "nl-api-key"

  restrictions {
    api_targets {
      service = google_project_service.enable_natural_language_api.service
    }
  }
  depends_on = [ google_project_service.enable_apikeys_api, google_project_service.enable_natural_language_api ]
}
