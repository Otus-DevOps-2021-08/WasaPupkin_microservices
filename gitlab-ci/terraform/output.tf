resource "local_file" "AnsibleInventory" {
  content = templatefile("./inventory.tpl",
    {
      external-ip = yandex_compute_instance.gitblab-ci.network_interface.0.nat_ip_address,
    }

  )
  filename = "../ansible/inventory"
}
