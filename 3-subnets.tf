#3-subnets.tf

# https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_subnetwork
resource "google_compute_subnetwork" "hqinternal" {
  name                     = "hqinternal"
  ip_cidr_range            = "10.190.52.0/24"
  region                   = "us-central1"
  network                  = google_compute_network.cwglobal.id
  private_ip_google_access = true


}

# Regional Proxy-Only Subnet 
# Required for Regional Application Load Balancer for traffic offloading
resource "google_compute_subnetwork" "regional_proxy_subnet" {
  name          = "regional-proxy-subnet"
  region        = "us-central1"
  ip_cidr_range = "10.190.22.0/24"
  # This purpose reserves this subnet for regional Envoy-based load balancers
  purpose       = "REGIONAL_MANAGED_PROXY"
  network       = google_compute_network.cwglobal.id
  role          = "ACTIVE"
}
resource "google_compute_subnetwork" "sainternal" {
  name                     = "sainternal"
  ip_cidr_range            = "10.190.62.0/24"
  region                   = "southamerica-east1"
  network                  = google_compute_network.cwglobal.id
  private_ip_google_access = true


}

resource "google_compute_subnetwork" "asiainternal" {
  name                     = "asiainternal"
  ip_cidr_range            = "10.190.72.0/24"
  region                   = "asia-northeast1"
  network                  = google_compute_network.cwglobal.id
  private_ip_google_access = true


}