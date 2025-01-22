# Instance variables
vm-zone             = "me-central2-b"
vm-name             = "gitlab-vm"
machine_type        = "e2-standard-2"
device_name         = "gitlab-test"
image               = "projects/centos-cloud/global/images/centos-stream-9-v20241210"
size                = "20"
type                = "pd-ssd"
disk_label          = "gitlab-terraform-disk"
can_ip_forward      = "true"
deletion_protection = "false"
assign_external_ip  = "true"
network_tier        = "PREMIUM"
#static_ip_address   = "34.166.93.117"
vm-tag1 = "http"
vm-tag2 = "https"
vm-tag3 = "lb-health-check"


