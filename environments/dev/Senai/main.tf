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
  zone    = "any"
}

module "app-instances" {
  source = "./modules/instances/senai-app/"
}


# module "database" {
#   source = "./modules/sql"
# }

# module "storage" {
#   source = "./modules/storage"
# }


# resource "google_service_account" "default" {
#   account_id   = "my-custom-sa"
#   display_name = "Custom SA for VM Instance"
# }


# Print the instance ID & Name from the compute module / Keep this here or in the outputs.tf file on the root
output "app-instance_id" {
  value = module.app-instances.instance_id
}

output "app-instance_name" {
  value = module.app-instances.instance_name
}











