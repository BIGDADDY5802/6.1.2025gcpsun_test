#0-auth.tf

# https://registry.terraform.io/providers/hashicorp/google/latest/docs
provider "google" {
  project     = "gcp-cw-project-453819"
  region      = "us-central1"
  credentials = "gcp-cw-project-453819-a130e8726b46.json"
}