# Instance variables
vm-zone             = "me-central2-c"
bastion-vm-name     = "bastion-dev"
machine_type        = "e2-micro"
device_name         = "bastion-dev"
image               = "projects/ubuntu-os-cloud/global/images/ubuntu-2004-focal-v20250111"
size                = "10"
type                = "pd-standard"
disk_label          = "bastion-terraform-disk-dev"
can_ip_forward      = "true"
deletion_protection = "false"
assign_external_ip  = "false"
network_tier        = "STANDARD"
#static_ip_address   = "34.166.93.118"
vm-tags = {
  "tag1" = "http-server",
  "tag2" = "https-server",
  "tag3" = "lb-health-check",
}

# Bucket variables
bucket-name          = "bastion-dev"
bucket-storage_class = "STANDARD"
bucket-force_destroy = "true"
