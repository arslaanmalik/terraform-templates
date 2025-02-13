resource "google_compute_address" "static_ip" {
  name         = var.vm-static-ip
  address_type = var.vm-static-ip-address_type
}
