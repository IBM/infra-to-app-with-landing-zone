##############################################################################
# Landing Zone VSI Pattern
##############################################################################

module "landing_zone" {
  source           = "git::https://github.com/terraform-ibm-modules/terraform-ibm-landing-zone.git//patterns/vsi?ref=v4.4.4"
  prefix           = var.prefix
  region           = var.region
  ibmcloud_api_key = var.ibmcloud_api_key
  ssh_public_key   = var.ssh_key
  override         = true
}

locals {
  workload_vsi_ips = flatten([
       for vsi in module.landing_zone.vsi_list:
       [vsi.ipv4_address] if endswith(vsi.vpc_name, "workload-vpc")
  ])
}

output "vpc_data" {
  value = module.landing_zone.vpc_data
}

module "app-install" {
  source                     = "../app-install"
  region           = var.region
  ibmcloud_api_key = var.ibmcloud_api_key
  ssh_private_key            = var.ssh_private_key
  floating_ip_address        = module.landing_zone.fip_vsi[0].floating_ip
  vpc_id                     = [for vpc in module.landing_zone.vpc_data : vpc.vpc_id if endswith(vpc.vpc_name, "workload-vpc")][0]
}

