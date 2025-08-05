module "serviceAccount" {
  source = "./modules/service_account"
  region = var.region
  project = var.project_id
  account_id = var.account_id
  roles = var.roles  
  service_name = var.service_name
}

module "network" {
  source = "./modules/network"
  vpc_name         = var.vpc_name
  subnet_name      = var.subnet_name
  gke_node_cidr    = var.gke_node_cidr
  pods_cidr        = var.pods_cidr
  svc_cidr         = var.svc_cidr
  public_cidr      = var.public_cidr
  region           = var.region
  nat_router_name  = var.nat_router_name
  nat_name         = var.nat_name
  global_ip_name   = var.global_ip_name
  
}

module "gke-cluster" {
source = "./modules/gke_cluster"
cluster_name                  = var.cluster_name
  region                        = var.region
  network                       = module.network.private_vpc_name
  subnetwork                    = module.network.private_subnet_name
  node_machine_type             = var.node_machine_type
  node_disk_size_gb             = var.node_disk_size_gb
  node_count                    = var.node_count
  db_node_count                 = var.db_node_count
  db_node_machine_type          = var.db_node_machine_type
  db_node_disk_size_gb          = var.db_node_disk_size_gb
  pods_secondary_range_name     = var.pods_secondary_range_name
  services_secondary_range_name = var.services_secondary_range_name
  master_ipv4_cidr_block        = var.master_ipv4_cidr_block
  service_account_email          = var.service_account_email
  roles = var.roles
  service_name = var.service_name
  account_id = var.account_id
  enable_private_nodes          = true
  enable_private_endpoint       = false
  deletion_protection           = false
  master_authorized_networks = [
    {
      cidr_block   = var.cidr_block
      display_name = var.display_name
    }
  ]
}

module "jump_host" {
  source              = "./modules/gke_jump_host"
  jump_host_name      = "gke-jump-host"
  cluster_name        = var.cluster_name
  machine_type        = "e2-medium"
  zone                = var.zone
  region              = var.region
  project_id           = var.project_id
  image               = "debian-cloud/debian-11"
  network              =  module.network.public_vpc_name
  subnetwork           = module.network.public_subnet_name
  ssh_user            = var.ssh_user
  ssh_public_key_path = var.ssh_public_key_path
  }