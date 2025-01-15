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
  default = "projects/centos-cloud/global/images/centos-stream-9-v20241210"
}

variable "size" {
  type    = string
  default = "10"
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

variable "deletion_protection" {
  type    = string
  default = "false"
}