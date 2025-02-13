resource "random_id" "bucket_name_suffix" {
  byte_length = 4
}

resource "google_storage_bucket" "bucket" {
  name     = "${var.bucket-name}-${random_id.bucket_name_suffix.hex}"
  project  = var.project
  location = var.bucket-location
  #storage_class = "STANDARD" or MULTI_REGIONAL, REGIONAL, NEARLINE, COLDLINE, ARCHIVE, DURABLE_REDUCED_AVAILABILITY
  storage_class            = var.bucket-storage_class
  force_destroy            = var.bucket-force_destroy
  public_access_prevention = var.bucket-public_access_prevention

  uniform_bucket_level_access = var.bucket-uniform_bucket_level_access
  versioning {
    enabled = var.bucket-versioning-enabled
  }

}