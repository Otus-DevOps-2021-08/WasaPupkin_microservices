resource "local_file" "AnsibleInventory" {
  content = templatefile("./inventory.tpl",
    {
      master-external-ip = yandex_compute_instance.kube-master.*.network_interface.0.nat_ip_address,
      worker-external-ip = yandex_compute_instance.kube-worker.*.network_interface.0.nat_ip_address
    }

  )
  filename = "../ansible/inventory"
}
