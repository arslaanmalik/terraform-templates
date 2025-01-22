variable "project_id" {
  default = "mim-integrations"
}

variable "region" {
  default = "me-central2"
}

variable "vm-zone" {
  description = "The Zone"
  type        = string
  default     = "me-central2-a"
}

////////////////////////////

variable "vm-name" {
  description = "The name of the VM"
  type        = string
  default     = "test-vm"
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
  type    = string
  default = ""
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