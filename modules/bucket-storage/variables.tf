variable "bucket-name" {
  default = "bucket"
}
variable "project" {
  default = "mim-integrations"
}

variable "bucket-storage_class" {
  default = "STANDARD"
}

variable "bucket-location" {
  default = "me-central2"
}
variable "bucket-force_destroy" {
  default = "true"
}

variable "bucket-public_access_prevention" {
  default = "inherited"
}

variable "bucket-uniform_bucket_level_access" {
  default = "true"
}
variable "bucket-versioning-enabled" {
  default = "true"
}
