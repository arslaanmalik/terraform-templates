resource "google_storage_bucket" "senai-s3-bucket" {
  name     = var.name
  project  = var.project
  location = var.location
  #storage_class = "MULTI_REGIONAL"
  storage_class            = var.storage_class
  force_destroy            = var.force_destroy
  public_access_prevention = var.public_access_prevention

  uniform_bucket_level_access = var.uniform_bucket_level_access
  versioning {
    enabled = var.versioning-enabled
  }



}