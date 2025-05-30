resource "google_container_cluster" "cluster" {
  name               = var.cluster_name
  location           = var.location
  initial_node_count = var.initial_node_count
  network            = var.network
  subnetwork         = var.subnetwork
  
  node_config {
    machine_type = var.machine_type
    disk_size_gb = var.disk_size
    oauth_scopes = [
      "https://www.googleapis.com/auth/cloud-platform"
    ]
  }

  private_cluster_config {
    enable_private_nodes    = var.enable_private_nodes
    enable_private_endpoint = var.enable_private_endpoint
    master_ipv4_cidr_block  = var.master_ipv4_cidr_block
  }

  master_authorized_networks_config {
    dynamic "cidr_blocks" {
      for_each = var.authorized_networks
      content {
        cidr_block   = cidr_blocks.value.cidr_block
        display_name = cidr_blocks.value.display_name
      }
    }
  }
}