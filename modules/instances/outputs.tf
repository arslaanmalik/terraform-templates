## This file is required to get the output values from the resource created and then pass it on to other modules as well as the root

output "instance_id" {
  value = module.compute_instance.instance_id
}

output "instance_name" {
  value = module.compute_instance.instance_name
}