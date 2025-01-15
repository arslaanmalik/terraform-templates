# Instance variables
vm-name             = "senai-vm"
machine_type        = "e2-standard-2"
device_name         = "senai-attached-disk"
image               = "projects/centos-cloud/global/images/centos-stream-9-v20241210"
size                = "20"
type                = "pd-ssd"
disk_label          = "senai-terraform-disk"
can_ip_forward      = "false"
deletion_protection = "false"

# SQL variables

name = ""