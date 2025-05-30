variable "project_id" {
  description = "The GCP project ID"
  type        = string
}

variable "environment" {
  description = "Environment name (stage, develop, main)"
  type        = string
  default     = "stage"
}

variable "region" {
  description = "The GCP region"
  type        = string
  default     = "us-central1"
}

variable "location" {
  description = "The cluster location (region or zone)"
  type        = string
  default     = "us-central1-a"
}

variable "initial_node_count" {
  description = "Number of nodes in the cluster"
  type        = number
  default     = 3
}

variable "machine_type" {
  description = "Machine type for nodes"
  type        = string
  default     = "e2-medium"
}

variable "disk_size" {
  description = "Node disk size in GB"
  type        = number
  default     = 100
}

variable "master_ipv4_cidr_block" {
  description = "CIDR block for master IP range"
  type        = string
  default     = "172.16.0.0/28"
}

variable "network" {
  description = "VPC network name"
  type        = string
  default     = "default"
}

variable "subnetwork" {
  description = "VPC subnetwork name"
  type        = string
  default     = "default"
}

variable "authorized_networks" {
  description = "List of authorized networks for master access"
  type = list(object({
    cidr_block   = string
    display_name = string
  }))
  default = [
    {
      cidr_block   = "0.0.0.0/0"
      display_name = "public-access"
    }
  ]
}