variable "cluster_name" {
  description = "The name of the Kubernetes cluster."
  type = string
  default = "microservices-cluster"
}

variable "location" {
  description = "The Azure region where the resources will be created."
  type = string
  default = "East US"
}

variable "resource_group_name" {
  description = "The name of the resource group where the resources will be created."
  type = string
  default = "microservices-rg"
}

variable "dns_prefix" {
  description = "The DNS prefix for the Kubernetes cluster."
  type = string
  default = "microservices"
}

variable "node_count" {
  description = "The number of nodes in the Kubernetes cluster."
  type    = number
  default = 2
}

variable "vm_size" {
  description = "The size of the virtual machines in the Kubernetes cluster."
  type = string
  default = "Standard_B2s"
}

variable "tags" {
  description = "Tags to apply to the resources."
  type    = map(string)
  default = {
    env  = "multi"
    team = "backend"
  }
}

variable "subscription_id" {
  description = "The ID of the Azure subscription where the resources will be created."
  type        = string
}

variable "tenant_id" {
  description = "Azure tenant ID"
  type        = string
}

variable "client_secret" {
  description = "Azure client secret"
  type        = string
}

variable "client_id" {
  description = "Azure client ID"
  type        = string
}

variable "aws_region" {
  description = "AWS region to deploy resources"
  type        = string
  default     = "us-east-2"
}
