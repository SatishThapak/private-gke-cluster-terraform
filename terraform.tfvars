project_id                    = "xxxxxxxxxx"
cluster_name                  = "dev-cluster"
vpc_name                      = "dev-vpc-network"
subnet_name                   = "dev-subnetwork"
private_cidr                  = "10.0.0.0/16"
public_cidr                   = "10.0.0.0/26"
gke_node_cidr                 = "10.0.0.0/16"
pods_cidr                     = "10.10.0.0/20"
svc_cidr                      = "10.20.0.0/20"
region                        = "us-central1"
zone                          = "us-central1-a"
global_ip_name                = "dev-global-ip"
nat_router_name               = "dev-nat-router"
nat_name                      = "dev-nat"
pods_secondary_range_name     = "pods-subnet"
node_count                    = "1"
node_disk_size_gb             = "50"
node_machine_type             = "custom-2-4096"
services_secondary_range_name = "services-subnet"
master_ipv4_cidr_block        = "172.16.0.0/28"
cidr_block                    = "10.0.1.0/32"
display_name                  = "dev-ip_address"
db_node_count                 =  "1"
db_node_disk_size_gb          =  "50"
db_node_machine_type          =  "custom-2-4096"
roles = [ 
    "roles/container.nodeServiceAccount",
 "roles/logging.logWriter",
 "roles/monitoring.metricWriter" ,
"roles/compute.viewer",
"roles/iam.serviceAccountUser", 
"roles/iap.tunnelResourceAccessor",
"roles/compute.networkAdmin",
"roles/compute.instanceAdmin.v1",
"roles/iap.tunnelResourceAccessor","roles/container.admin" 
]
 service_account_email = "gke-dev-cluster@iqms-qolsys-71725.iam.gserviceaccount.com"
service_name = "gke-dev-sa"
account_id = "gke-dev-cluster"
ssh_user            = "dev-cluster"
ssh_public_key_path = "~/.ssh/id_rsa.pub"
