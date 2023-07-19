##############################################################################
# Landing Zone VSI Pattern
##############################################################################

module "landing_zone" {
  source           = "git::https://github.com/terraform-ibm-modules/terraform-ibm-landing-zone.git//patterns/vsi?ref=v4.4.4"
  prefix           = var.prefix
  region           = var.region
  ibmcloud_api_key = var.ibmcloud_api_key
  ssh_public_key   = var.ssh_key
  override         = true  # This line instructs the module to use the topology located in the file override.json
}