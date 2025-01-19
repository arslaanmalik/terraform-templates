# Instance variables
vm-zone             = "me-central2-b"
vm-name             = "senai-vm"
machine_type        = "e2-standard-2"
device_name         = "senai-test"
image               = "projects/centos-cloud/global/images/centos-stream-9-v20241210"
size                = "20"
type                = "pd-ssd"
disk_label          = "senai-terraform-disk"
can_ip_forward      = "true"
deletion_protection = "false"
assign_external_ip  = "false"
network_tier        = "PREMIUM"
#static_ip_address   = "34.166.93.118"

# SQL variables
db-name     = var.db-name
database_version = "MYSQL_8_4"
db-region = "me-central2"
db-password = "dev-root"
db-tier = "db-n1-standard-1"
db-edition = "ENTERPRISE"
db-availability_type = "REGIONAL"
db-disk_autoresize = "true"
db-disk_size = "10"
db-disk_type = "PD_SSD"
db-deletion_protection_enabled = "false"
db-private_network = "https://www.googleapis.com/compute/v1/projects/mim-integrations/global/networks/main"
db-ipv4_enabled = "false"
db-allocated_ip_range = ""
db-retained_backups = "7"
db-retention_unit = "COUNT"
db-deletion_protection = "false"
