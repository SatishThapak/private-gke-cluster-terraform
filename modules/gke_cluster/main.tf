resource "google_container_cluster" "primary" {
  name     = var.cluster_name
  location = var.region
  network    = var.network
  subnetwork=var.subnetwork
  deletion_protection = var.deletion_protection
  remove_default_node_pool = true
  initial_node_count       = 1

  private_cluster_config {
    enable_private_nodes    = var.enable_private_nodes
    enable_private_endpoint = var.enable_private_endpoint
    master_ipv4_cidr_block  = var.master_ipv4_cidr_block
  }

  ip_allocation_policy {
    cluster_secondary_range_name  = var.pods_secondary_range_name
    services_secondary_range_name = var.services_secondary_range_name
  }
    release_channel {
    channel = "REGULAR"
  }
  dynamic "master_authorized_networks_config" {
    for_each = length(var.master_authorized_networks) > 0 ? [1] : []
    content {
      dynamic "cidr_blocks" {
        for_each = var.master_authorized_networks
        content {
          cidr_block   = cidr_blocks.value.cidr_block
          display_name = cidr_blocks.value.display_name
        }
      }
    }
  }
}

resource "google_container_node_pool" "primary_nodes" {
  name       = "primary-node-pool"
  cluster    = google_container_cluster.primary.name
  location   = var.region
  node_count = var.node_count
  
    management {
    auto_upgrade = true
    auto_repair  = true
  }

  node_config {
    machine_type = var.node_machine_type
    disk_size_gb = var.node_disk_size_gb
    service_account = var.service_account_email
    oauth_scopes = [
      "https://www.googleapis.com/auth/cloud-platform"
    ]
    tags = ["gke-dev-node"]
  }
  
  depends_on = [google_container_cluster.primary]
}
resource "google_container_node_pool" "secondary_nodes" {
  name       = "secondary-node-pool"
  cluster    = google_container_cluster.primary.name
  location   = var.region
  node_count = var.db_node_count

    management {
    auto_upgrade = true
    auto_repair  = true
  }

  node_config {
    machine_type = var.db_node_machine_type
    disk_size_gb = var.db_node_disk_size_gb
    service_account = var.service_account_email
    oauth_scopes = [
      "https://www.googleapis.com/auth/cloud-platform"
    ]
    tags = ["gke-dev-node"]
  }
  
  depends_on = [google_container_cluster.primary]
}
