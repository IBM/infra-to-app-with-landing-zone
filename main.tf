##############################################################################
# Landing Zone VSI Pattern
##############################################################################



module "landing_zone" {
  source           = "git::https://github.com/terraform-ibm-modules/terraform-ibm-landing-zone.git//patterns/vsi?ref=v4.6.0"
  prefix           = var.prefix
  region           = var.region
  ibmcloud_api_key = var.ibmcloud_api_key
  ssh_public_key   = var.ssh_key
  override_json_string = templatefile("./override.tftpl", { prefix = var.prefix })
}

module "app-install" {
  depends_on          = [module.landing_zone] # Wait for the full completion of landing zone - this ensures all VSIs are created
  source              = "./app-install"
  region              = var.region
  ibmcloud_api_key    = var.ibmcloud_api_key
  ssh_private_key     = var.ssh_private_key
  floating_ip_address = module.landing_zone.fip_vsi[0].floating_ip
  vpc_id              = [for vpc in module.landing_zone.vpc_data : vpc.vpc_id if endswith(vpc.vpc_name, "workload-vpc")][0]
}

