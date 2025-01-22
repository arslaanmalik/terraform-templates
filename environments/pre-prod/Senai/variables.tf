variable "vm-name" {
  description = "The name of the VM"
  type        = string
  default     = "test-vm"
}

variable "vm-zone" {
  description = "The Zone"
  type        = string
  default     = "me-central2-a"
}

variable "machine_type" {
  description = "This is the machine type"
  type        = string
  default     = "e2-micro"
}

variable "device_name" {
  type    = string
  default = "terraform-attached-test"
}

variable "image" {
  type    = string
  default = "projects/debian-cloud/global/images/debian-12-bookworm-v20250113"
}

variable "size" {
  type    = string
  default = "20"
}
variable "type" {
  description = "This is the Disk Type SSD or Standard"
  type        = string
  default     = "pd-standard"
}

variable "disk_label" {
  type    = string
  default = "test-app-terraform-disk"
}

variable "can_ip_forward" {
  type    = string
  default = "false"
}

variable "assign_external_ip" {
  type    = bool
  default = false
}

variable "network_tier" {
  type    = string
  default = "STANDARD"
}

# variable "static_ip_address" {
#   type = string
# }

variable "vm-startup_script" {
  type = string
}

variable "deletion_protection" {
  type    = string
  default = "false"
}

variable "vm-tag1" {
  type    = string
  default = "tag1"
}

variable "vm-tag2" {
  type    = string
  default = "tag2"
}

variable "vm-tag3" {
  type    = string
  default = "tag3"
}


///////////////////////////////////////
#SQL Variablesvariable 

variable "db-name" {
  description = "The name of the Database"
  type        = string
  default     = "test-db"
}

variable "project" {
  description = "This is project name"
  type        = string
  default     = "mim-integrations"
}

variable "database_version" {
  description = "The MySQL DB Version"
  type        = string
  default     = "MYSQL_8_4"
}

variable "db-region" {
  type    = string
  default = "me-central2"
}

variable "db-password" {
  type    = string
  default = "root"
}

variable "db-tier" {
  type    = string
  default = "db-n1-standard-1"
}

variable "db-edition" {
  type    = string
  default = "ENTERPRISE"
}

variable "db-availability_type" {
  type    = string
  default = "ZONAL"
  #default = "REGIONAL"
}

variable "db-disk_autoresize" {
  type    = string
  default = "true"
}

variable "db-disk_size" {
  type    = string
  default = "10"
}

variable "db-disk_type" {
  description = "This is the Disk Type SSD or Standard"
  type        = string
  default     = "PD_HDD"
}

variable "db-deletion_protection_enabled" {
  type    = bool
  default = "false"
}

variable "db-private_network" {
  type    = string
  default = "https://www.googleapis.com/compute/v1/projects/mim-integrations/global/networks/main"
}

variable "db-ipv4_enabled" {
  type    = bool
  default = false

}

variable "db-allocated_ip_range" {
  type    = string
  default = ""
}

variable "db-retained_backups" {
  type    = string
  default = "7"
}

variable "db-retention_unit" {
  type    = string
  default = "COUNT"
}

variable "db-deletion_protection" {
  type    = string
  default = "false"
}