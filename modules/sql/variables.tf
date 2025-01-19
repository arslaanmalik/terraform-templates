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

variable "region" {
  type    = string
  default = "me-central2"
}

variable "tier" {
  type    = string
  default = "db-n1-standard-1"
}
variable "type" {
  description = "This is the Disk Type SSD or Standard"
  type        = string
  default     = "pd-standard"
}

variable "edition" {
  type    = string
  default = "ENTERPRISE"
}

variable "availability_type" {
  type    = string
  default = "REGIONAL"
}

variable "disk_autoresize" {
  type    = string
  default = "true"
}

variable "disk_size" {
  type    = string
  default = "20"
}

variable "disk_type" {
  type    = string
  default = "PD_HDD"
}

variable "deletion_protection_enabled" {
  type    = string
  default = "ENABLED"
}

variable "private_network" {
  type    = string
  default = "main"
}

variable "allocated_ip_range" {
  type    = string
  default = "PD_HDD"
}

variable "retained_backups" {
  type    = string
  default = "7"
}

variable "retention_unit" {
  type    = string
  default = "COUNT"
}

variable "deletion_protection" {
  type    = string
  default = "false"
}