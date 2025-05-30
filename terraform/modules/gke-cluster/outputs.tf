output "endpoint" {
  value       = google_container_cluster.cluster.endpoint
  description = "Cluster endpoint"
}

output "cluster_ca_certificate" {
  value       = google_container_cluster.cluster.master_auth[0].cluster_ca_certificate
  description = "Base64 encoded public certificate for the cluster"
}

output "token" {
  value       = data.google_client_config.default.access_token
  description = "Authentication token for the cluster"
  sensitive   = true
}

output "cluster_name" {
  value       = google_container_cluster.cluster.name
  description = "Cluster name"
}

output "location" {
  value       = google_container_cluster.cluster.location
  description = "Cluster location"
}