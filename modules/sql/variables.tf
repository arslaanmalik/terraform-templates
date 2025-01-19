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
variable "db-disk-type" {
  description = "This is the Disk Type SSD or Standard"
  type        = string
  default     = "pd-ssd"
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
  type    = string
  default = "PD_HDD"
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