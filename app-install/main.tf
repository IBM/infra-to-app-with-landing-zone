
resource "null_resource" "application-install" {
  count          = length(var.workload_vsi_list)
  connection {
    type         = "ssh"
    user         = "root"
    bastion_host = var.floating_ip_address
    host         = var.workload_vsi_list[count.index]
    private_key  = var.ssh_private_key
    agent        = false
    timeout      = "15m"
  }

  provisioner "remote-exec" {
    inline = [
      "apt-get install apache2 -y"
    ]
  }
}
