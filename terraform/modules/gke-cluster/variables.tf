variable "cluster_name" {
  description = "The name of the GKE cluster"
  type        = string
}

variable "location" {
  description = "The location (region or zone) of the GKE cluster"
  type        = string
}

variable "initial_node_count" {
  description = "The number of nodes to create in this cluster"
  type        = number
  default     = 3
}

variable "machine_type" {
  description = "The machine type for GKE nodes"
  type        = string
  default     = "e2-medium"
}

variable "disk_size" {
  description = "Size of the disk attached to each node"
  type        = number
  default     = 100
}

variable "enable_private_nodes" {
  description = "Whether nodes have internal IP addresses only"
  type        = bool
  default     = true
}

variable "enable_private_endpoint" {
  description = "Whether the master's internal IP address is used as the cluster endpoint"
  type        = bool
  default     = false
}

variable "master_ipv4_cidr_block" {
  description = "CIDR block for the master's IP address range"
  type        = string
}

variable "authorized_networks" {
  description = "List of authorized networks for master access"
  type = list(object({
    cidr_block   = string
    display_name = string
  }))
  default = []
}

variable "network" {
  description = "The VPC network to host the cluster in"
  type        = string
}

variable "subnetwork" {
  description = "The subnetwork to host the cluster in"
  type        = string
}