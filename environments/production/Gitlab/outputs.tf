## This file is required to get the output values from the resource created and then pass it on to other modules as well as the root

output "instance_id" {
  value = google_compute_instance.gitlab-instance.id

}

output "instance_name" {
  value = google_compute_instance.gitlab-instance.name
}