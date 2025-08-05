variable "project_id" {}
variable "cluster_name" {}
variable "subnet_name" { }
variable "vpc_name" {}
variable "public_cidr" {}
variable "private_cidr" { }
variable "gke_node_cidr" {}
variable "pods_cidr" {}
variable "svc_cidr" {}
variable "region" {}
variable "global_ip_name" {}
variable "nat_router_name" {}
variable "nat_name" {}
variable "node_machine_type" {}
variable "node_disk_size_gb" {}
variable "node_count" {}
variable "pods_secondary_range_name" {}
variable "services_secondary_range_name" {}
variable "master_ipv4_cidr_block" {}
variable "cidr_block" {}
variable "display_name" {}
variable "db_node_count" { }
variable "db_node_machine_type" { }
variable "db_node_disk_size_gb" { }
variable "account_id" { }
variable "service_name" { }
variable "roles" { }
variable "service_account_email" { }
variable "ssh_user" {}
variable "ssh_public_key_path" {}
variable "zone" { }
