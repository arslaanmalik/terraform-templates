terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = ">= 2.15.0, < 6.15.0"
    }
  }
  backend "gcs" {
    bucket = "terraform-mim-integrations"      # Replace with your GCS bucket name
    prefix = "environments/production/Gitlab/" # Path where the state files will be stored
  }
}

provider "google" {
  project = "mim-integrations"
  region  = "me-central2"
  zone    = "me-central2-a"
}