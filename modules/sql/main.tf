
locals {
  master_instance_name = "${var.db-name}-master-db"
}


# See versions at https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/sql_database_instance#database_version
resource "google_sql_database_instance" "instance" {
  #name             = "senai-database-instance"
  name             = var.db-name
  project          = "mim-integrations"
  database_version = var.database_version
  #database_version = "MYSQL_8_4"
  region = "me-central2"
  ##The name of the existing instance that will act as the master in the replication setup
  #master_instance_name = local.master_instance_name

  settings {
    /////https://cloud.google.com/sql/docs/mysql/instance-settings - Check The Instances required accordingly\\\\\\\\\\\
    ///The db-f1-micro and db-g1-small machine types aren't included in the Cloud SQL SLA. These machine types are configured to use a shared-core CPU, and are designed to provide low-cost test and development instances only \\\\\\\\\\\

    #tier = "db-n1-standard-1"
    tier = var.tier
    # activation_policy           = ""
    # authorized_gae_applications = ""
    edition = var.edition
    #edition = "ENTERPRISE_PLUS"
    availability_type = var.availability_type
    #availability_type = "REGIONAL"
    disk_autoresize = var.disk_autoresize
    ###The minimum value is 10GB. Note that this value will override the resizing from disk_autoresize if that feature is enabled //lifecycle.ignore_changes
    disk_size = var.disk_size
    disk_type = var.disk_type
    #disk_type = "PD_HDD"
    deletion_protection_enabled = var.deletion_protection_enabled

    /////////////////CONNECTION BLOCK \\\\\\\\\\\\\\\\\\\\\\\
    ip_configuration {
      # We will enable below for public IP Address
      #ipv4_enabled        = true
      private_network = var.private_network
      #ssl_mode            = var.ssl_mode
      allocated_ip_range = var.allocated_ip_range
    }
    ///////////////////////// DATA PROTECTION BLOCK \\\\\\\\\\\\\\\\\\\\\\
    backup_configuration {
      binary_log_enabled             = "true"
      enabled                        = "true"
      start_time                     = "15:00"
      transaction_log_retention_days = "7"

      backup_retention_settings {
        #This specifies the number of backups to retain.
        retained_backups = var.retained_backups
        #This defines the unit for the retention policy. COUNT - means number of backups / DAYS - means number of days
        retention_unit = var.retention_unit
      }
    }

    data_cache_config {
      data_cache_enabled = "false"
    }
  }
  ## True - will not allow deleteion even with Terraform  
  deletion_protection = var.deletion_protection
}


////////////////////////////////////////////////////////////////////////////////////
##For Creating the database in the instance created above or any specific you want to mention
resource "google_sql_database" "database" {
  name     = "my-database"
  instance = google_sql_database_instance.instance.name
  #deletion_policy = "DELETE"
}

