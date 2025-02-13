terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = ">= 2.15.0, < 6.15.0"
    }
  }
  backend "gcs" {
    bucket = "terraform-mim-integrations" # Replace with your GCS bucket name
    prefix = "environments/dev/Senai/"    # Path where the state files will be stored
  }
}
