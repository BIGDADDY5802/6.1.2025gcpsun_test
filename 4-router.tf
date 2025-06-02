#4-router.tf

# https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_router
resource "google_compute_router" "iarouter" {
  name    = "iarouter"
  region  = "us-central1"
  network = google_compute_network.cwglobal.id
}