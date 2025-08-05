variable "cluster_name" {
  description = "Name of the GKE cluster"
  type        = string
}

variable "region" {
  description = "GCP region"
  type        = string
}

variable "network" { }


variable "subnetwork" { }

variable "node_machine_type" {
  description = "Machine type for GKE nodes"
  type        = string
  default     = "e2-medium"
}

variable "node_disk_size_gb" {
  description = "Disk size for GKE nodes"
  type        = number
  default     = 100
}

variable "node_count" {
  description = "Number of nodes in the default node pool"
  type        = number
  default     = 3
}

variable "pods_secondary_range_name" {
  description = "Secondary range name for pods"
  type        = string
  default     = "pods-subnet"
}

variable "services_secondary_range_name" {
  description = "Secondary range name for services"
  type        = string
  default     = "services-subnet"
}

variable "master_ipv4_cidr_block" {
  description = "CIDR block for master private endpoint"
  type        = string
  
}

variable "enable_private_nodes" {
  description = "Enable private nodes (no public IPs)"
  type        = bool
  default     = true
}

variable "enable_private_endpoint" {
  description = "Enable private endpoint for control plane"
  type        = bool
  default     = false
}

variable "master_authorized_networks" {
  description = "List of CIDR blocks allowed to access master"
  type = list(object({
    cidr_block   = string
    display_name = string
  }))
  default = []
}
variable "deletion_protection" {
  
}
variable "db_node_count" {
  
}
variable "db_node_disk_size_gb" {
  
}
variable "db_node_machine_type" { }
variable "account_id" { }
variable "service_name" { }
variable "roles" { }
variable "service_account_email" {
  
}