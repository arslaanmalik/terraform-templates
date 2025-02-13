# Instance variables
vm-zone             = "me-central2-c"
vm-name             = "gitlab-vm"
machine_type        = "e2-standard-4"
device_name         = "gitlab-disk"
image               = "projects/ubuntu-os-cloud/global/images/ubuntu-2004-focal-v20250111"
size                = "50"
type                = "pd-ssd"
disk_label          = "gitlab-terraform-disk"
can_ip_forward      = "true"
deletion_protection = "false"
assign_external_ip  = "true"
network_tier        = "PREMIUM"
#static_ip_address   = "34.166.93.117"
vm-tags = {
  "tag1" = "http-server",
  "tag2" = "https-server",
  "tag3" = "lb-health-check",
}

vm-static-ip              = "gitlab-static-ip"
vm-static-ip-address_type = "EXTERNAL"