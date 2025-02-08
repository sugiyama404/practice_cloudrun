resource "google_cloud_run_v2_service" "default" {
  name     = "cloudrun-service"
  location = var.region
  ingress  = "INGRESS_TRAFFIC_ALL"

  template {
    containers {
      image = "${var.region}-docker.pkg.dev/${var.project_id}/${var.repository_name}/${var.image_name}:latest"
      resources {
        limits = {
          cpu    = "1"
          memory = "512Mi"
        }
      }
    }
  }
}
