resource "google_compute_instance" "jump_host" {
  name         = var.jump_host_name
  machine_type = var.machine_type
  zone = var.zone
  
  
  boot_disk {
    initialize_params {
      image = var.image
    }
  }

  network_interface {
  network    = var.network
  subnetwork=var.subnetwork
    access_config {} # Enables external IP
  }
    metadata_startup_script = <<-EOT
    #!/bin/bash
    sudo apt-get update
    sudo apt-get install -y google-cloud-sdk kubectl
    # Configure gcloud and kubectl to connect to the GKE cluster
    gcloud container clusters get-credentials ${var.cluster_name} --region ${var.region} --project ${var.project_id}
  EOT

  # SSH access firewall rule (if using external IP)
  depends_on = [google_compute_firewall.allow_ssh]
  tags = ["jump-host"]
}
# Firewall rule for SSH access to the jump host (if using external IP)
resource "google_compute_firewall" "allow_ssh" {
  name    = "${var.cluster_name}-allow-ssh"
  network = var.network
  allow {
    protocol = "tcp"
    ports    = ["22","443"]
   
  }
  source_ranges = ["0.0.0.0/0"] # Restrict this to known IPs for production
  target_tags   = ["jump-host"] # Apply this tag to your jump host
}