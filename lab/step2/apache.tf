##############################################################################
# This steps deploys an Apache Server on the 3 VSIs in the workload VPC
# This terraform connects through a publically exposed VSI in the management VPC
# using the remote-exec provisioner
##############################################################################

# Instruction: make a copy of this file to the 'custom-slz' folder


# Get all VSIs in the workload vpc
data "ibm_is_instances" "insts" {
  vpc = [for vpc in module.landing_zone.vpc_data : vpc.vpc_id if endswith(vpc.vpc_name, "workload-vpc")][0]
}

# Prepare the list of of ips for all workload VSIs
locals {
  workload_ip_list = flatten([for ins in data.ibm_is_instances.insts.instances :
    [ins.primary_network_interface[0].primary_ipv4_address]
  ])
}

resource "null_resource" "application-install" {
  count = 3
  connection {
    type         = "ssh"
    user         = "root"
    bastion_host = module.landing_zone.fip_vsi[0].floating_ip # IP of the management VSI
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

# Extra variable required to allow to connect to the workload vsis through the management vsi
variable "ssh_private_key" {
  description = "Private SSH key (RSA format) that is paired with the public ssh key."
  type        = string
  sensitive   = true
}