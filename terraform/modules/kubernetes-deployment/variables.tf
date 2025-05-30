variable "manifest_path" {
  description = "Path to the Kubernetes manifest file"
  type        = string
}

variable "cluster_dependency" {
  description = "Dependency on the cluster being ready"
  type        = any
}