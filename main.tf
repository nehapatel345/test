provider "google" {
 
  project     = "jenkins-server-project"
  region      = "asia-south1"
}


resource "google_compute_instance" "my-cicd-vm" {
  name         = "cicd-vms"
  machine_type = "e2-small"
  project = "jenkins-server-project"
  zone     = "asia-south1-a"

 

  tags = ["allow-firewall"]

 

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-11"
      labels = {
        my_label = "value"
      }
    }
  }

 

  network_interface {
    network = "default"

 

  }
  allow_stopping_for_update = true
}
