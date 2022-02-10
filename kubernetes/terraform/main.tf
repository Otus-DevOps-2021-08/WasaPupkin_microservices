#terraform {
#  required_providers {
#    yandex = {
#      source  = "yandex-cloud/yandex"
#      version = "0.35"
#    }
#  }
#}

provider "yandex" {
  version                  = "0.35"
  service_account_key_file = var.service_account_key_file
  cloud_id                 = var.cloud_id
  folder_id                = var.folder_id
  zone                     = var.zone
}

resource "yandex_compute_instance" "kube-master" {
  count = var.master_nodes_count
  name = "kube-master-${count.index}"
  #depends_on = [ yandex_compute_disk.inst_disk ]

  labels = {
    tags = "master"
    ansible_group   = "master"
    kubernetes_role = "master"
  }

  resources {
    cores         = var.res_cores
    memory        = var.res_memory
    core_fraction = var.res_core_fraction
  }

  boot_disk {
    initialize_params {
      image_id = var.image_id
      type = "network-ssd"
      size = 40
    }
  }

  network_interface {
    subnet_id = var.subnet_id #yandex_vpc_subnet.app-subnet.id
    nat       = true
  }

  metadata = {
    ssh-keys = "ubuntu:${file(var.public_key_path)}"
  }
}

resource "yandex_compute_instance" "kube-worker" {
  count = var.worker_nodes_count
  name = "kube-worker-${count.index}"

  labels = {
    tags = "nodes"
    ansible_group   = "nodes"
    kubernetes_role = "nodes"
  }

  resources {
    cores         = var.res_cores
    memory        = var.res_memory
    core_fraction = var.res_core_fraction
  }

  boot_disk {
    initialize_params {
      # Указать id образа созданного в предыдущем домашем задании
      image_id = var.image_id
      type = "network-ssd"
      size = 40
    }
  }

  network_interface {
    subnet_id = var.subnet_id #yandex_vpc_subnet.app-subnet.id
    nat       = true
  }

  metadata = {
    ssh-keys = "ubuntu:${file(var.public_key_path)}"
  }
}

#resource "null_resource" "ansible" {
#  provisioner "local-exec" {
#    command     = "ansible-playbook playbooks/site.yml"
#    working_dir = "../ansible"
#  }
#  depends_on = [local_file.AnsibleInventory]
#}
