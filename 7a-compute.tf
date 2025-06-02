#7a-compute.tf

resource "google_compute_instance" "iowavm" {
  name         = "iowavm"
  machine_type = "e2-medium"
  zone         = "us-central1-a"


  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-12"
    }
  }
 network_interface {
    subnetwork = google_compute_subnetwork.hqinternal.name
    access_config {
      // Ephemeral public IP
    }
  }

  metadata_startup_script = file("./startup.sh")

}

resource "google_compute_instance" "saopaolovm" {
  name         = "saopaolovm"
  machine_type = "e2-medium"
  zone         = "southamerica-east1-a"


  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-12"
    }
  }

  network_interface {
    subnetwork = google_compute_subnetwork.sainternal.name
    access_config {
      // Ephemeral public IP
    }
  }

  metadata_startup_script = file("./startup.sh")

}

resource "google_compute_instance" "tokyovm" {
  name         = "tokyovm"
  machine_type = "e2-medium"
  zone         = "asia-northeast1-a"


  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-12"
    }
  }

  network_interface {
    subnetwork = google_compute_subnetwork.asiainternal.name
    access_config {
      // Ephemeral public IP
    }
  }

  metadata_startup_script = file("./startup.sh")

}