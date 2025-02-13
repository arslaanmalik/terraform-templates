provider "google" {
  alias   = "bucket"
  project = "mim-integrations"
  region  = "me-central2"
}

module "bucket" {
  providers = {
    google = google.bucket
  }
  source               = "../../../modules/bucket-storage"
  bucket-name          = var.bucket-name
  bucket-storage_class = var.bucket-storage_class
  bucket-force_destroy = var.bucket-force_destroy

}
