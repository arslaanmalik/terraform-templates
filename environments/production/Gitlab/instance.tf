module "gitlab-static-ip" {
  source                    = "../../../modules/compute/network"
  vm-static-ip              = var.vm-static-ip
  vm-static-ip-address_type = var.vm-static-ip-address_type
}

output "gitlab-external-ip" {
  value = module.gitlab-static-ip.external-static-ip-address
}


module "gitlab-instances" {
  source             = "../../../modules/compute/instances"
  vm-zone            = var.vm-zone
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
  #static_ip_address   = module.gitlab-static-ip.address
  deletion_protection = var.deletion_protection
  vm-startup_script   = file("../../../scripts/gitlab.sh")
  vm-tags             = var.vm-tags
}