

resource "google_compute_instance" "senai-instance" {
  #name         = "senai-test"
  name         = var.instance_name
  machine_type = var.instance_type
  #machine_type = "e2-small"
  #machine_type = "e2-standard-2"
  zone = "me-central2"

  tags = ["senai", "terraform"]

  boot_disk {
    auto_delete = true
    device_name = "senai-test"
    initialize_params {
      image = "projects/centos-cloud/global/images/centos-stream-9-v20241210"
      size  = 20
      type  = "pd-balanced"
      #type = "pd-ssd"
      labels = {
        disk_label = "senai-terraform-disk"
      }
    }
    mode = "READ_WRITE"
  }
  #If we want IP NAT routing from this instance to other instance - Default is false
  can_ip_forward = false
  #True - Enabling this flag will prevent accidental deletion of the instance -Default false (no protection for accidental deleteion)
  deletion_protection = false
  #Disable Display output - Headless or Non Interactive - Default is false
  enable_display = false

  labels = {
    goog-ec-src = "vm_add-tf"
  }

  network_interface {
    #network = "default"
    #network = google_compute_network.vpc_network.name
    access_config {
      #network_tier = "PREMIUM or STANDARD"
    }
    #network_ip = "172.16.0.5"
    ## The queue_count attribute specifies the number of queues per network interface. 
    #Default is usually 0 or 1, indicating a single queue. 
    queue_count = 0
    #STACK_TYPE IF WE WANT TO USE IPV4 OR IPV6
    stack_type = "IPV4_ONLY"
    #subnetwork  = "projects/mim-integrations/regions/me-central2/subnetworks/dammam"
  }

  #   metadata = {
  #     foo = "bar"
  #   }

  scheduling {
    automatic_restart   = true
    on_host_maintenance = "MIGRATE"
    preemptible         = false
    provisioning_model  = "STANDARD"
  }

  #     # Google recommends custom service accounts that have cloud-platform scope and permissions granted via IAM Roles.
  service_account {
    email  = "63367853580-compute@developer.gserviceaccount.com"
    scopes = ["https://www.googleapis.com/auth/devstorage.read_only", "https://www.googleapis.com/auth/logging.write", "https://www.googleapis.com/auth/monitoring.write", "https://www.googleapis.com/auth/service.management.readonly", "https://www.googleapis.com/auth/servicecontrol", "https://www.googleapis.com/auth/trace.append"]
  }

  shielded_instance_config {
    enable_integrity_monitoring = true
    enable_secure_boot          = false
    enable_vtpm                 = true
  }

  #metadata_startup_script = "echo hi > /test.txt"
  metadata_startup_script = <<-EOT
    #!/bin/bash
    apt-get update
  EOT
  allow_stopping_for_update = true

}

# Assigning a static IP to the VM instance
# resource "google_compute_address" "vm_static_ip" {
#   name = "terraform-static-ip"
# }