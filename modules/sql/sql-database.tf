////////////////////////////////////////////////////////////////////////////////////
##For Creating the database in the instance created above or any specific you want to mention
resource "google_sql_database" "database" {
  name     = var.db-name
  instance = google_sql_database_instance.instance.name
  #deletion_policy = "DELETE"
}
