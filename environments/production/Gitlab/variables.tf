variable "vm-name" {
  description = "The name of the VM"
  type        = string
}

variable "machine_type" {
  description = "This is the machine type"
  type        = string
}

variable "device_name" {
  type    = string
}

variable "image" {
  type    = string
}

variable "size" {
  type    = string
}
variable "type" {
  description = "This is the Disk Type SSD or Standard"
  type        = string
}

variable "disk_label" {
  type    = string
}

variable "can_ip_forward" {
  type    = string
}

variable "deletion_protection" {
  type    = string
}