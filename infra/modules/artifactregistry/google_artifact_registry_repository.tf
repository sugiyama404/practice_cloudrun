resource "google_artifact_registry_repository" "main" {
  provider      = google
  location      = var.region
  repository_id = var.repository_name
  format        = "DOCKER"
}

# resource "google_artifact_registry_repository_iam_member" "repository_member" {
#   repository = google_artifact_registry_repository.main.repository_id
#   location   = google_artifact_registry_repository.main.location
#   project    = google_artifact_registry_repository.main.project
#   role       = "roles/artifactregistry.admin"
#   member     = var.compute_engine_default_service_account
# }
