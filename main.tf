// This file is intentionally left empty as all configurations are managed in component-specific folders.

terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = ">= 2.15.0, < 6.15.0"
    }
  }
}

provider "google" {
  project = "mim-integrations"
  region  = "me-central2"
  zone    = "me-central2-a"
}

module "app-instances" {
  vm-name = "app-vm"
  source  = "./modules/instances"

}

module "git-instances" {
  vm-name = "git-vm"
  source  = "./modules/instances"
}









