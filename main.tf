terraform {
  required_providers {
    google = {
      source = "hashicorp/google"
      version = "3.71.0"
    }
  }
}

provider "google" {
  project = "${var.project_name}"
  region = "${var.region}"
  zone = "${var.zone}"
}

resource "google_compute_instance" "vm_instance" {
  name = "terraform-test-instnace"
  machine_type = "${var.machine_type}"
  allow_stopping_for_update = "true"
  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-9"
    }
  }
  network_interface {
    network = google_compute_network.default.self_link
    access_config {

    }
  }
}
resource "google_compute_network" "default" {
  name = "terraform-test-network"
}
resource "google_compute_firewall" "default" {
  name = "terraform-test-firewall"
  network = google_compute_network.default.self_link
  allow {
    protocol = "tcp"
    ports = ["22"]
  }
}