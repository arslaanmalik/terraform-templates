resource "google_compute_address" "static_ip" {
  name         = "my-static-ip"
  address_type = "EXTERNAL"
}

output "static_ip_address" {
  value = google_compute_address.static_ip.address
}