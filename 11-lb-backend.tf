# https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_region_health_check
# Resource: Regional Health Check
resource "google_compute_region_health_check" "lb" {
  name                = "lb-health-check"
  check_interval_sec  = 5
  timeout_sec         = 5
  healthy_threshold   = 2
  unhealthy_threshold = 3

  http_health_check {
    request_path = "/index.html"
    port         = 80
  }
}

# https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_region_backend_service
# Resource: Regional Backend Service
resource "google_compute_region_backend_service" "lb" {
  name                  = "lb-backend-service"
  protocol              = "HTTP"
  health_checks         = [google_compute_region_health_check.lb.self_link]
  port_name             = "webserver"
  #port_name = google_compute_region_instance_group_manager.app01.named_port[0].name
  load_balancing_scheme = "EXTERNAL_MANAGED"
  backend {
    group           = google_compute_region_instance_group_manager.app01.instance_group
    balancing_mode  = "UTILIZATION"
    capacity_scaler = 1.0
  }
}