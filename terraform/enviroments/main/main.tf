module "gke_cluster" {
  source = "../../modules/gke-cluster"

  cluster_name          = "stage-cluster"
  location              = "us-central1-a"
  initial_node_count    = 3
  machine_type          = "e2-medium"
  disk_size             = 100
  master_ipv4_cidr_block = "172.16.0.0/28"
}

provider "kubernetes" {
  host                   = module.gke_cluster.endpoint
  cluster_ca_certificate = module.gke_cluster.cluster_ca_certificate
  token                  = module.gke_cluster.token
}

module "microservices" {
  source = "../../modules/kubernetes-deployment"
  
  for_each = fileset("${path.module}/manifests/", "*.yaml")
  
  manifest_file = each.value
  environment   = "stage"
}