## This file is required to get the output values from the resource created and then pass it on to other modules as well as the root

output "external-static-ip-address" {
  value       = google_compute_address.static_ip.address
  description = "This is the reserved external static ip"
}
