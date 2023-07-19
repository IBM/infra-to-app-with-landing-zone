data "ibm_is_instances" "insts" {
  vpc = var.vpc_id
}

locals {
  workload_ip_list = flatten([for ins in data.ibm_is_instances.insts.instances :
          [ins.primary_network_interface[0].primary_ipv4_address]
        ])
}

resource "null_resource" "application-install" {
  for_each       = toset(local.workload_ip_list)
  connection {
    type         = "ssh"
    user         = "root"
    bastion_host = var.floating_ip_address
    host         = each.key
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
