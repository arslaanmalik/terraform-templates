provider "google" {
  alias   = "db"
  project = "mim-integrations"
  region  = "me-central2"
}

module "database" {
  providers = {
    google = google.db
  }
  source                         = "../../../modules/sql"
  db-name                        = var.db-name
  database_version               = var.database_version
  db-region                      = var.db-region
  db-password                    = var.db-password
  db-tier                        = var.db-tier
  db-edition                     = var.db-edition
  db-availability_type           = var.db-availability_type
  db-disk_autoresize             = var.db-disk_autoresize
  db-disk_size                   = var.db-disk_size
  db-disk_type                   = var.db-disk_type
  db-deletion_protection_enabled = var.db-deletion_protection_enabled
  db-private_network             = var.db-private_network
  db-ipv4_enabled                = var.db-ipv4_enabled
  db-allocated_ip_range          = var.db-allocated_ip_range
  db-retained_backups            = var.db-retained_backups
  db-retention_unit              = var.db-retention_unit
  db-deletion_protection         = var.db-deletion_protection
}