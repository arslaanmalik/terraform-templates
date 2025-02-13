provider "google" {
  alias   = "instance"
  project = "mim-integrations"
  region  = "me-central2"
  zone    = "me-central2-a"
}

module "senai-instances" {
  providers = {
    google = google.instance
  }
  source             = "../../../modules/compute/instances"
  vm-name            = var.vm-name
  machine_type       = var.machine_type
  device_name        = var.device_name
  image              = var.image
  size               = var.size
  type               = var.type
  disk_label         = var.disk_label
  can_ip_forward     = var.can_ip_forward
  assign_external_ip = var.assign_external_ip
  network_tier       = var.network_tier
  #static_ip_address   = var.static_ip_address
  deletion_protection = var.deletion_protection
  vm-startup_script   = file("../../../scripts/vm-setup-ubuntu.sh")
  vm-tags             = var.vm-tags
}
