data "ibm_is_instances" "insts" {
  vpc = var.vpc_id
}

locals {
  workload_ip_list = flatten([for ins in data.ibm_is_instances.insts.instances :
    [ins.primary_network_interface[0].primary_ipv4_address]
  ])
}

output "workload" {
  value = local.workload_ip_list
}

resource "null_resource" "application-install" {
  count = var.number_vsi_workload
  connection {
    type         = "ssh"
    user         = "root"
    bastion_host = var.floating_ip_address
    host         = local.workload_ip_list[count.index]
    private_key  = var.ssh_private_key
    agent        = false
    timeout      = "15m"
  }

  provisioner "remote-exec" {
    inline = [
      "apt-get update",
      "apt-get install apache2 -y"
    ]
  }
}
