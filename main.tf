// We can keep this fileis intentionally  empty as all configurations ca  be managed in environment-specific folders.

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

# module "static_ip" {
#   source = "./modules/compute/static_ip"
# }

module "vm1-instances" {
  source  = "./modules/compute/instances/"
  vm-name = "vm-1"
  image   = "projects/ubuntu-os-cloud/global/images/ubuntu-2004-focal-v20250111"
  #assign_external_ip = true
  #static_ip_address  = module.static_ip.static_ip_address
  vm-zone           = "me-central2-c"
  vm-startup_script = file("./scripts/vm-setup-ubuntu.sh")
  vm-tag1           = "http"
  vm-tag2           = "https"
  vm-tag3           = "lb-health-check"

}

# module "vm2-instances" {
#   source             = "./modules/compute/instances/"
#   vm-name            = "vm-2"
#   assign_external_ip = false
#   vm-zone            = var.vm-zone
#   vm-startup_script  = ""
#   vm-tag1            = "http"
#   vm-tag2            = "https"
#   vm-tag3            = "lb-health-check"

# }

# module "mysql-dev" {
#   source = "./modules/sql"

# }



