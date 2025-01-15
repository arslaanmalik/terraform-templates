variable "name" {
  default = "s3-storage"
}
variable "project" {
  default = "mim-integrations"
}

variable "storage_class" {
  default = "STANDARD"
}

variable "location" {
  default = "EU"
}
variable "force_destroy" {
  default = "true"
}

variable "public_access_prevention" {
  default = "inherited"
}

variable "uniform_bucket_level_access" {
  default = "false"
}
variable "versioning-enabled" {
  default = "true"
}




  