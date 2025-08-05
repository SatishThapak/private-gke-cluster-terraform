output "private_vpc_name" {
  value       = google_compute_network.private_vpc.name
  description = "Name of the private VPC"
}

output "public_vpc_name" {
  value       = google_compute_network.public_vpc.name
  description = "Name of the public VPC"
}

output "private_subnet_name" {
  value       = google_compute_subnetwork.private_subnet.name
  description = "Name of the private subnet"
}

output "public_subnet_name" {
  value       = google_compute_subnetwork.public_subnet.name
  description = "Name of the public subnet"
}

output "nat_ip" {
  value       = var.global_ip_name != null ? google_compute_address.regional_ip[0].address : null
  description = "External IP used by Cloud NAT"
}
