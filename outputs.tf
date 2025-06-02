output "instance_external_ips" {
  value = {
    vm1 = "http://${google_compute_instance.iowavm.network_interface[0].access_config[0].nat_ip}"
    vm2 = "http://${google_compute_instance.saopaolovm.network_interface[0].access_config[0].nat_ip}"
    vm3 = "http://${google_compute_instance.tokyovm.network_interface[0].access_config[0].nat_ip}"
  }
  description = "External IPs of both VMs"
  }

  output "compute_zones" {
    description = "Comma-seperated compute zones"
    # Convert set into string delimited by commas (CSV) before output
    value       = join(",",data.google_compute_zones.available.names)
  }

  output "lb_address" {
    value = "http://${google_compute_address.lb.address}"
  }