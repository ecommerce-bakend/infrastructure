provider "google" {
  project = var.project_id
  region  = var.region
}

data "google_client_config" "default" {}

module "gke_cluster" {
  source = "../../modules/gke-cluster"

  cluster_name          = "${var.environment}-cluster"
  location              = var.location
  initial_node_count    = var.initial_node_count
  machine_type          = var.machine_type
  disk_size             = var.disk_size
  master_ipv4_cidr_block = var.master_ipv4_cidr_block
  network               = var.network
  subnetwork            = var.subnetwork
  authorized_networks   = var.authorized_networks
}

provider "kubernetes" {
  host                   = module.gke_cluster.endpoint
  cluster_ca_certificate = module.gke_cluster.cluster_ca_certificate
  token                  = data.google_client_config.default.access_token
}

module "microservices" {
  source = "../../modules/kubernetes-deployment"
  
  for_each = fileset("${path.module}/manifests/", "*.yaml")
  
  manifest_path    = "${path.module}/manifests/${each.value}"
  cluster_dependency = module.gke_cluster.endpoint
}