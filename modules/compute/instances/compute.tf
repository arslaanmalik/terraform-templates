
resource "google_compute_instance" "instance" {
  #name         = "senai-test"
  zone = var.vm-zone
  name = var.vm-name
  #machine_type = "e2-micro"
  machine_type = var.machine_type
  tags = [
  var.vm-allow_http ? "http-server" : null,
  var.vm-allow_https ? "https-server" : null,
  var.vm-allow_lb-health-check ? "lb-health-check" : null
]

  boot_disk {
    auto_delete = true
    device_name = var.device_name
    initialize_params {
      image = var.image
      size  = var.size
      type  = var.type
      #type = "pd-ssd"
      labels = {
        disk_label = var.disk_label
      }
    }
    mode = "READ_WRITE"
  }
  #If we want IP NAT routing from this instance to other instance - Default is false
  can_ip_forward = var.can_ip_forward
  #True - Enabling this flag will prevent accidental deletion of the instance -Default false (no protection for accidental deleteion)
  deletion_protection = var.deletion_protection
  #Disable Display output - Headless or Non Interactive - Default is false
  enable_display = false

  network_interface {
    network = "main"
    #network = google_compute_network.vpc_network.name
    ## To Assign External IP Uncomment the access_config block this might be required for internet facing machine
    # access_config {
    #   #network_tier = "STANDARD"
    # }

    # Conditional access config
    dynamic "access_config" {
      for_each = var.assign_external_ip ? [1] : []

      content {
        network_tier = "var.network_tier"
        # nat_ip       = var.static_ip_address
      }
    }

    ##Incase we want to add the ip manually
    #network_ip = "172.16.0.5"
    #STACK_TYPE IF WE WANT TO USE IPV4 OR IPV6
    #stack_type = "IPV4_ONLY"
    subnetwork = "projects/mim-integrations/regions/me-central2/subnetworks/dammam"
  }

  metadata = {
    app = "senai-app"
  }

  scheduling {
    automatic_restart   = true
    on_host_maintenance = "MIGRATE"
    preemptible         = false
  }

  #     # Google recommends custom service accounts that have cloud-platform scope and permissions granted via IAM Roles.
  service_account {
    email  = "63367853580-compute@developer.gserviceaccount.com"
    scopes = ["https://www.googleapis.com/auth/cloud-platform"]
  }

  shielded_instance_config {
    enable_integrity_monitoring = true
    enable_secure_boot          = false
    enable_vtpm                 = true
  }

  #metadata_startup_script = "echo hi > /test.txt"
  # metadata_startup_script   = <<-EOT
  #   #!/bin/bash
  #   apt-get update
  # EOT

  #metadata_startup_script = file("startup-script.sh")
  metadata_startup_script = var.vm-startup_script

  allow_stopping_for_update = true

}

# Assigning a static IP to the VM instance
# resource "google_compute_address" "vm_static_ip" {
#   name = "terraform-static-ip"
# }