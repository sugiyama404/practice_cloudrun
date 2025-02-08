/* resource "google_cloud_run_v2_job" "cloud_run_job" {
  provider = google
  name     = "my-cloud-run-job"
  location = var.region
  project  = var.project_id

  template {
    template {
      containers {
        image = "${var.region}-docker.pkg.dev/${var.project_id}/${var.repository_name}/${var.image_name}:latest"
        env {
          name  = "PORT"
          value = "8080"
        }
        resources {
          limits = {
            cpu    = "1"
            memory = "512Mi"
          }
        }
      }
    }
  }
}
 */
