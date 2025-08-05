output "jump_host_ip" {
  value = google_compute_instance.jump_host.network_interface[0].access_config[0].nat_ip
}
