resource "google_compute_subnetwork" "sub-sg" {
  name                     = "sub-sg"
  network                  = google_compute_network.custom-vpc-tf.id
  ip_cidr_range            = "10.1.0.0/24"
  region                   = var.region
  private_ip_google_access = true

  depends_on = [google_compute_network.custom-vpc-tf]
}
