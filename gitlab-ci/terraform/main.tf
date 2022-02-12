provider "yandex" {
  version                  = "0.35"
  service_account_key_file = var.service_account_key_file
  cloud_id                 = var.cloud_id
  folder_id                = var.folder_id
  zone                     = var.zone
}

resource "yandex_compute_instance" "gitblab-ci" {
  name  = "gitblab-ci-vm"
  labels = {
    tags = "gitblab-ci"
  }

  resources {
    cores  = 2
    memory = 4
    core_fraction = var.res_core_fraction
  }
  boot_disk {
    initialize_params {
      image_id = var.image_id
      size = var.disk_size
    }
  }
  network_interface {
    subnet_id = var.subnet_id
    nat       = true
  }
  metadata = {
    ssh-keys = "ubuntu:${file(var.public_key_path)}"
  }
}
