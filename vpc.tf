// Create VPC
resource "google_compute_network" "vpc" {
 name                    = "${var.project_name}-vpc"
 auto_create_subnetworks = false
}

// Create Subnet
resource "google_compute_subnetwork" "app" {
 name          = "${var.project_name}-app-subnet"
 ip_cidr_range = var.subnet_cidr
 network       = "${var.project_name}-vpc"
 depends_on    = [google_compute_network.vpc]
 region        = var.region
}

// VPC firewall configuration
resource "google_compute_firewall" "firewall" {
  name    = "${var.project_name}-firewall"
  network = google_compute_network.vpc.name

  allow {
    protocol = "icmp"
  }

  allow {
    protocol = "tcp"
    ports    = ["22"]
  }

  allow {
    protocol = "tcp"
    ports    = ["80", "8080", "1000-9000"]
  }

  source_tags = ["web"]

  source_ranges = ["0.0.0.0/0"]
}
