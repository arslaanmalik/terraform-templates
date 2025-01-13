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

#OR do it like below for variables

# provider "google" {
#   project = var.project_id
#   region  = var.region
#   zone    = var.zone
# }

module "instances" {
  source = "./modules/instances"
}

# module "database" {
#   source = "./modules/database"
# }

# module "storage" {
#   source = "./modules/storage"
# }

# module "test-vpc-module" {
#   source = "./modules/network"
# }


# resource "google_compute_network" "vpc_network" {
#   name = "senai-network"
# }

# resource "google_service_account" "default" {
#   account_id   = "my-custom-sa"
#   display_name = "Custom SA for VM Instance"
# }


# Print the instance ID & Name from the compute module / Keep this here or in the outputs.tf file on the root
output "instance_id" {
  value = module.instances.instance_id
}

output "instance_name" {
  value = module.instances.instance_name
}











