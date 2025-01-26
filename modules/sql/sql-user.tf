////////////////////////////////////////////////////////////////////////////////////
##For Creating the databaseuser in the instance

resource "google_sql_user" "sql-db-user" {
  name     = var.db-user
  project  = var.project
  instance = google_sql_database_instance.instance.name
  password = var.db-password
  password_policy {
    enable_failed_attempts_check = "enabled"
  }
}
