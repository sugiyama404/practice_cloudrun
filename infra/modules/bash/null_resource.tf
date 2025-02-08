resource "null_resource" "build_and_push_docker" {
  provisioner "local-exec" {
    command = <<EOT
      gcloud auth configure-docker ${var.region}-docker.pkg.dev &&
      docker build -t ${var.region}-docker.pkg.dev/${var.project_id}/${var.repository_name}/${var.image_name}:latest --file ../webserver/Dockerfile ../webserver/ &&
      docker push ${var.region}-docker.pkg.dev/${var.project_id}/${var.repository_name}/${var.image_name}:latest
    EOT
  }
}
