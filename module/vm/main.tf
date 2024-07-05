resource "google_compute_network" "vpc_network" {
  project                 = var.project_id
  name                    = var.vpc_network_name
  auto_create_subnetworks = var.auto_create_subnetworks
  mtu                     = 1460
}
# Create the first subnet
resource "google_compute_subnetwork" "subnet-1" {
  name          = var.first_subnet_name
  ip_cidr_range = var.first_ip_cidr_range
  network       = google_compute_network.vpc_network.self_link
  region        = var.region
}

# Create the second subnet
resource "google_compute_subnetwork" "subnet-2" {
  name          = var.second_subnet_name
  ip_cidr_range = var.second_ip_cidr_range
  network       = google_compute_network.vpc_network.self_link
  region        = var.region
}
resource "google_compute_instance" "vm_instance" {
  project      = var.project_id
  name         = var.vm_name
  machine_type = var.machine_type
  zone         = var.zone
  tags         = ["http-server"]
  labels = {
    environment = "production"
    app         = "http-server"
  }

  boot_disk {
    initialize_params {
      image = "projects/ubuntu-os-cloud/global/images/ubuntu-2004-focal-v20240614"
      labels = {
        my_label = "http-server"
      }
    }
  }

  network_interface {
    network    = google_compute_network.vpc_network.id
    subnetwork = google_compute_subnetwork.subnet-1.id
    access_config {
      // Include this line to give the VM an external IP
    }
  }
  metadata = {
    foo = "http-server"
  }
  metadata_startup_script = <<-EOF
    #!/bin/bash
    apt-get update
    apt-get install -y nginx
    systemctl start nginx
    systemctl enable nginx
  EOF
}

resource "google_compute_firewall" "default-allow-http" {
  name    = var.firewall_name
  project = var.project_id
  network = google_compute_network.vpc_network.name

  allow {
    protocol = var.protocol
    ports    = ["80", "22"]
  }

  source_ranges = ["0.0.0.0/0"]
  target_tags   = ["http-server"]
}
